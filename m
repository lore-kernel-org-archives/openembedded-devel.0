Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id B105A7EB0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 18:54:40 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 00F791037FD;
	Tue, 20 Aug 2019 18:54:40 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Aug 2019 20:54:33 +0200
Message-Id: <20190820185434.2637-2-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820185434.2637-1-tworaz@tworaz.net>
References: <20190820185434.2637-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/3] gnome-keyring: Update to version 3.28.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2019 18:54:42 -0000
Content-Transfer-Encoding: 8bit

This is the latest stable upstream release.

For the most part this is a simple version bump. There are however
some small additional changes this patch makes.
1. Inherit gettext bbclass since the build system used by this pacakge
   does use it.
2. Inherit upstream-version-is-even bbclass. GNOME components like this
   do follow versioning scheme checked by this bbclass.
3. Use PACKAGECONFIG to handle pam feature.
4. Add optional, disabled by default feature for ssh-agent integration
   this new version of gnome-keyring has. This does not introduce any
   additional build time dependencies. For the feature to work ssh-add
   and ssh-agent tools need to be provided in the rootfs. Both are shipped
   in openssh-misc package. For the configure script to work reliably in
   all setups we also need to tell it said tools are available in
   bindir. This is done by specifying ac_cv_path_SSH_ADD and
   ac_cv_path_SSH_AGENT. Without those configure can fail if the host
   system does not have both tools instsalled in /usr/bin.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...keyring_3.20.0.bb => gnome-keyring_3.28.2.bb} | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_3.20.0.bb => gnome-keyring_3.28.2.bb} (55%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
similarity index 55%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
index 55640625d..8dc11c85d 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit distro_features_check gnomebase remove-libtool
+inherit distro_features_check gnomebase remove-libtool gettext upstream-version-is-even
 
 DEPENDS = " \
     intltool-native \
@@ -20,19 +20,21 @@ DEPENDS = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
 "
 
-SRC_URI[archive.md5sum] = "e09efe8021944dae404736b5a2adb98e"
-SRC_URI[archive.sha256sum] = "bc17cecd748a0e46e302171d11c3ae3d76bba5258c441fabec3786f418e7ec99"
+SRC_URI[archive.md5sum] = "284580f954f762caf62aed2ae7358177"
+SRC_URI[archive.sha256sum] = "81171b7d07211b216b4c9bb79bf2deb3deca18fe8d56d46dda1c4549b4a2646a"
 SRC_URI += "file://musl.patch"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
-EXTRA_OECONF = " \
-    --disable-doc \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)} \
-"
+EXTRA_OECONF = "--disable-doc \
+                ac_cv_path_SSH_AGENT=${bindir}/ssh-agent \
+                ac_cv_path_SSH_ADD=${bindir}/ssh-add"
 
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG[pam] = "--enable-pam --with-pam-dir=${base_libdir}/security, --disable-pam"
+PACKAGECONFIG[ssh-agent] = "--enable-ssh-agent,--disable-ssh-agent,,openssh-misc"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1/services \
-- 
2.21.0


