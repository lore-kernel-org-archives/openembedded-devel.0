Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6OC-0002F5-IJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:45:00 +0200
Received: by wgbdr1 with SMTP id dr1so3147125wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=irCqRt9jdhf/0FFl276fO5VaPvlPjXfGI7bIteY8k6w=;
	b=EHW5bT6+PF0Lx0jMDytdn3jjeHHcdjwzmAUf+WhPdpdclxSyjl2j+KgIdYRbTMiR9P
	q/n4EOMymegWC2M58S+UIfldJnutQGXnfr0dbr2JJViRZnVJaal/051Ns7O0iYilR1D0
	rlUBvQT9BANH/IhSdXhdiW3P0gJaiXbjmfFd7fW6biG5WNq3NibRZHDN9MCNKwV29zh3
	DEK3MoM6vE7wX7gZOiNAfh3TuEwsW1WAtXKFV55eZjyhqT6U8KHkURQKTAYgU5eucNd+
	DClfqhmWi+uXcX9nvvg2vQryTOcnbhp1+WXFnBh2BYiTiSHsuICMo6KgXcnbrZwfH7lX
	cZpg==
Received: by 10.216.232.104 with SMTP id m82mr2916107weq.15.1343478807526;
	Sat, 28 Jul 2012 05:33:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm6055533wix.6.2012.07.28.05.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:12 +0200
Message-Id: <82b9444f72c4590c5f39b6585a4a5d7cf4dea00c.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] vala-dbus-binding-tool: bump SRCREV and add recipe for 0.4.0 tarball
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
X-List-Received-Date: Sat, 28 Jul 2012 12:45:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-dbus-binding-tool.inc                     |    2 +-
 .../vala-dbus-binding-tool_0.4.0.bb                |    4 ++++
 .../vala-dbus-binding-tool_git.bb                  |    7 +++++--
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index a59488d..a3db952 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -9,7 +9,7 @@ INC_PR = "r3"
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
-SRC_URI = "http://downloads.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
+SRC_URI = "http://downloads.freesmartphone.org/sources/${BPN}/${BP}.tar.bz2;name=archive"
 
 inherit autotools perlnative
 
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
new file mode 100644
index 0000000..3473971
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
@@ -0,0 +1,4 @@
+require vala-dbus-binding-tool.inc
+
+SRC_URI[archive.md5sum] = "b7537a087f9f468e25170e81df0ed93f"
+SRC_URI[archive.sha256sum] = "6b0d3796e92b031839e2e2f484e294153ad9eaf9d32915056199a49ce8328722"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index 30a7edd..dd96187 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -1,6 +1,9 @@
 require vala-dbus-binding-tool.inc
-SRCREV = "2c72ff9c981be947837c72d3aa38e1fbf074068f"
-PV = "0.3.2+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "53d56816a4154e3467f07bd22f4e27d166e3e3f3"
+PV = "0.4.0+gitr${SRCPV}"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
-- 
1.7.8.6



