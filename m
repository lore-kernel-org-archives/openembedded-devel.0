Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF6473243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:48:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8L8mQhZ020089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 01:48:27 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 21 Sep 2015 01:48:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Sep 2015 16:48:37 +0800
Message-ID: <1442825317-27595-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-screenshooter: ensure output directory is created
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Sep 2015 08:48:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

When build with B != S, the output directory for desktop
file doesn't exist so it will fail if it's not created
before generating the file:
/bin/sh: line 1: src/xfce4-screenshooter.desktop.in: No such file or directory

Add "$(MKDIR_P) $(dir $@)" to the rule to fix this.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...m-create-ouput-directory-for-desktop-file.patch | 29 ++++++++++++++++++++++
 .../xfce4-screenshooter_1.8.2.bb                   |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch
new file mode 100644
index 0000000..62bffef
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Makefile.am-create-ouput-directory-for-desktop-file.patch
@@ -0,0 +1,29 @@
+From c85bf7cc5c1e1780d215f6fe233e3ed4597c72ed Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 21 Sep 2015 06:54:28 +0000
+Subject: [PATCH] Makefile.am: create ouput directory for desktop file
+
+Upstream-Status: Submitted [1]
+
+[1]: http://bug-attachment.xfce.org/attachment.cgi?id=6460
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index a22fc20..2ef0e54 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -122,6 +122,7 @@ app_desktop_DATA = $(app_desktop_in_files:.desktop.in=.desktop)
+ 
+ src/xfce4-screenshooter.desktop.in: src/xfce4-screenshooter.desktop.in.in
+ 	$(AM_V_GEN) ( \
++		$(MKDIR_P) $(dir $@); \
+ 		sed -e "s^@PLUGIN_PATH@^$(libexecdir)/applications^" \
+ 			$< > $@ \
+ 	)
+-- 
+2.0.1
+
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
index ae19492..de2bc61 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
@@ -7,6 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
+SRC_URI += "file://0001-Makefile.am-create-ouput-directory-for-desktop-file.patch"
+
 SRC_URI[md5sum] = "3a32ecc5566453a58f6a4ddd70649444"
 SRC_URI[sha256sum] = "9dce2ddfaa87f703e870e29bae13f3fc82a1b3f06b44f8386640e45a135f5f69"
 
-- 
1.9.1


