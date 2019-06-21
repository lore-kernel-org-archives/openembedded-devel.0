Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0406011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:57:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L9vH9C000250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:57:17 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 21 Jun 2019 02:57:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jun 2019 05:57:08 -0400
Message-ID: <20190621095708.11282-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] xfce4-screensaver: 0.1.4 -> 0.1.5
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
X-List-Received-Date: Fri, 21 Jun 2019 09:57:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-screensaver from 0.1.4 to 0.1.5.

* install pam config file and add a patch to remove unsupported
  syntax '@include'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfce4-screensaver/fix-pam-config.patch         | 14 ++++++++++++++
 ...ensaver_0.1.4.bb => xfce4-screensaver_0.1.5.bb} | 13 ++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_0.1.4.bb => xfce4-screensaver_0.1.5.bb} (64%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
new file mode 100644
index 000000000..94cad23f8
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
@@ -0,0 +1,14 @@
+'@include' is not a standard sysntax and not supported by oe.
+
+Upstream-Status: Submitted [https://bugzilla.xfce.org/show_bug.cgi?id=15626]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/data/xfce4-screensaver.common-auth b/data/xfce4-screensaver.common-auth
+index a9fd9ce..3bfea70 100644
+--- a/data/xfce4-screensaver.common-auth
++++ b/data/xfce4-screensaver.common-auth
+@@ -1,2 +1,2 @@
+-@include common-auth
++auth include common-auth
+ auth optional pam_gnome_keyring.so
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb
similarity index 64%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb
index fb2be6609..4a1aae764 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb
@@ -12,8 +12,15 @@ DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfcon
 
 inherit xfce-app
 
-SRC_URI_append = " file://fix-cross-compile.patch"
-SRC_URI[md5sum] = "18a619849f85c24d784c7fa27279ca4b"
-SRC_URI[sha256sum] = "ed04ae32034b8e13a78495ca2bd7789a20ec7f67891ab9e92826a944371eabef"
+SRC_URI_append = " \
+    file://fix-cross-compile.patch \
+    file://fix-pam-config.patch \
+"
+SRC_URI[md5sum] = "982f9a355456320933ec08313523a567"
+SRC_URI[sha256sum] = "fdecf0fc432b59defba2dd706051696d47227ca0744c7971014021190126f2d5"
+
+do_install_append() {
+    install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
+}
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/desktop-directories"
-- 
2.20.0


