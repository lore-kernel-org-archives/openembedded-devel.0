Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqPUu-0002HM-6X
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 13:31:44 +0100
Received: (qmail 18450 invoked by uid 503); 18 Feb 2011 12:08:13 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 12:08:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 14:30:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 14:30:28 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 13:30:54 +0100
Message-Id: <1298032254-26236-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7378022090262555977
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] shadow: fix rpath issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Feb 2011 12:31:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add --disable-rpath (not enough with angstrom 2008.1)
* fix build problems with rpath on older libtool
* bump INC_PR

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/shadow/shadow.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 1b105c5..d688064 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -13,7 +13,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -39,6 +39,7 @@ EXTRA_OECONF += "\
     --without-audit \
     --without-selinux \
     --without-libcrack \
+    --disable-rpath \
     ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
 "
 
@@ -70,6 +71,12 @@ shadow_cv_passwd_dir=${bindir}
 END
 }
 
+do_configure_append () {
+    # use same fix as libiconv
+    sed -i -e  s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
+           -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
+}
+
 do_install_append() {
   # Ensure that /etc/skel is created so any default files that we want copied into new users home
   # dirs can be put in there later (ideal for .xinitrc for example).
-- 
1.7.0.4



