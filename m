Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrC-0004PX-T2
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:50 +0200
Received: by eaal1 with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9b5oWRnhDn4htNlSsHdWQ3CFDtFy6/3CklfzT4v7RUs=;
	b=W8bhQHZjSHfbF8tdOh0y36dWhZ2V1sPqhjixAC43EvFn1k3eXZ+lQg01LqkB21KakR
	wwieXGJGMzYnUrSRapLFpepdKWAvzPqJjjkQZnGeS/x8urZLE3AXYTgCTNEbTIq+Gl9p
	wPQW/pCzvAouzXzStfZMZeZ+aGrzaStN3mPvjUDxlz3RG/PCrpcOC+VVNf3qWHA8tVt5
	+0IQIZjUp7zYdiFsv91PWEjdFWuZ1vD+/evqL5BAXaBTSCqouFvTsTPyA0M/snqfhA8V
	e/Q0VhzNNTB5PH2vs+Hn36qEuTfU5ES6T4EqjbPHiLRofcvSoC55ZdBrj2qihLWTY3dc
	VudA==
Received: by 10.14.98.200 with SMTP id v48mr3362909eef.6.1339148481383;
	Fri, 08 Jun 2012 02:41:21 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm20275036eeg.0.2012.06.08.02.41.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:32 +0200
Message-Id: <1339148443-9467-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlkLDMkSdTp+LQ2/x3mjDl3xoDeMozJDTE9DFfkWC+KGV5CCPnhkN808BWzoHjnWSBfjMOX
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 03/14] cloud9: add patch to make it use nodejs 0.6.x for executing scripts
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:50 -0000

This matches the default nodejs version in OE

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...e-as-interpreter-for-sketches-instead-of-.patch |   29 ++++++++++++++++++++
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch b/meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch
new file mode 100644
index 0000000..b32311a
--- /dev/null
+++ b/meta-oe/recipes-devtools/cloud9/cloud9/0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch
@@ -0,0 +1,29 @@
+From ac1953d04f3f26d6aa5d8f53a9397d3ba0e96fa3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@circuitco.com>
+Date: Fri, 11 May 2012 15:23:02 +0000
+Subject: [PATCH] ide: use 'node' as interpreter for sketches instead of
+ argv[0]
+
+This enables running scripts with node 0.6.x instead of 0.4.x
+
+Signed-off-by: root <root@beaglebone.(none)>
+---
+ server/cloud9/ide.js |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/server/cloud9/ide.js b/server/cloud9/ide.js
+index ce782f5..6c4e0f7 100644
+--- a/server/cloud9/ide.js
++++ b/server/cloud9/ide.js
+@@ -53,7 +53,7 @@ var Ide = module.exports = function(options, httpServer, exts, socket) {
+     };
+ 
+     this.$users = {};
+-    this.nodeCmd = process.argv[0];
++    this.nodeCmd = "node";
+ 
+     var davOptions = {
+         node: this.options.mountDir,
+-- 
+1.7.7
+
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 4815a34..0f0c09c 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-DEFAULT_PREFERENCE = "-1"
+PR = "r1"
 
 DEPENDS = "libxml2 nodejs-native"
 
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            file://index.js \
            file://cloud9.service \
            file://cloud9-avahi.service \
+           file://0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch \
           "
 
 SRCREV_cloud9ide = "c4e2574896a22bb749f0500b25f41c888d346bed"
@@ -102,7 +103,7 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-RDEPENDS_${PN} = "nodejs4 gzip"
+RDEPENDS_${PN} = "nodejs4 nodejs gzip"
 
 inherit systemd
 
-- 
1.7.10



