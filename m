Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLR-00027y-OP
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:13 +0200
Received: by mail-wi0-f171.google.com with SMTP id hm14so1272860wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=E+OLPVB/Jze5GJ3w6sihAGTZZ5uj0tpzaWyYGoUE1mc=;
	b=UPnTgwB9nt0Q1yICmGmTcex/jtzTqLwI8L1NRDsraWCtTa/WNSv99jRnEd1Txoe7K4
	pQjKGWKkUFzpuiXpt1nYC4hbZ/xhbzghoAsVppa+A/9tRbXRc/uxTESjqO/K83/5m8Oh
	AHD3rgoca8N6vJ9/MrZPOyDlYA09oXZF1oZGrfW29Tm1A9SBQNgX382sjFf9jsOMXME6
	jAEnS39ANIyJFXpMK+KOFmc+9fEl3FyJDahtNsgp8Vzbs/fTDC8VTlLj9vD9W5OwjbqB
	U8loeKl/++Wux3TcXa+O5Ox0rcm+6kq1jcvdnOcxIbJ6BexXx9O5c12aOdedJD1Q33Fc
	SolQ==
Received: by 10.216.216.226 with SMTP id g76mr4994389wep.221.1338639113789;
	Sat, 02 Jun 2012 05:11:53 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:51 +0200
Message-Id: <1338639361-23775-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 05/15] xfce4-datetime-plugin: update to latest git and unbreak build with xfce4-dev-tools 4.10.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...xfce4ui.patch => 0001-port-to-libxfce4ui.patch} |    1 +
 ...re.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch |   32 ++++++++++++++++++++
 .../datetime/xfce4-datetime-plugin_git.bb          |    5 ++-
 3 files changed, 36 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/datetime/files/{port-to-libxfce4ui.patch => 0001-port-to-libxfce4ui.patch} (99%)
 create mode 100644 meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch

diff --git a/meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
similarity index 99%
rename from meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch
rename to meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
index aab20ca..08ea135 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch
+++ b/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] port to libxfce4ui
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
+Upstream-status: pending
 
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
diff --git a/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch b/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
new file mode 100644
index 0000000..05f7c72
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
@@ -0,0 +1,32 @@
+From f6e97314f425574289697ddfa0914f7580130a7c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sat, 19 May 2012 20:23:06 +0200
+Subject: [PATCH] configure.ac.in: remove breaking BM_DEBUG_SUPPORT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream-status: pending
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac.in |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac.in b/configure.ac.in
+index 5200268..a2550ca 100644
+--- a/configure.ac.in
++++ b/configure.ac.in
+@@ -37,9 +37,6 @@ XDT_CHECK_PACKAGE([LIBXFCE4PANEL],[libxfce4panel-1.0],[4.8.0])
+ 
+ #CFLAGS="$CFLAGS -Wall -Werror"
+ 
+-dnl Check for debugging support
+-BM_DEBUG_SUPPORT()
+-
+ AC_OUTPUT([
+ Makefile
+ po/Makefile.in
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb
index 18dec94..9421c1e 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRCREV = "e268210db6a32b2a47c03c63e5908ee3ba9461cc"
+SRCREV = "97ebbac9ba52397ec34edb43935083f6263d1666"
 PV = "0.6.1+gitr${SRCPV}"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.xfce.org/panel-plugins/xfce4-datetime-plugin;protocol=git;branch=master \
-           file://port-to-libxfce4ui.patch \
+           file://0001-port-to-libxfce4ui.patch \
+           file://0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch \
           "
 SRC_URI[md5sum] = "e82f51ff0e75a63e5cbd139e43e094f9"
 SRC_URI[sha256sum] = "fb340c1c2170d4f33c7f278772966f3c01caaedcd4a7f58f670bf8e28580bb1b"
-- 
1.7.4.4



