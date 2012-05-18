Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVICU-0001io-Bc
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 10:06:14 +0200
Received: by werg55 with SMTP id g55so1816078wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 00:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9b5oWRnhDn4htNlSsHdWQ3CFDtFy6/3CklfzT4v7RUs=;
	b=GniYWkVmsGWWDdTe0fptRToL21g70fK6k/EoqPPVG4fQ/Leb9xvcNb07EJp+4/Hw4s
	aw0CBdOQZh+8gs6zgoKNsgy3TU5/6d9ALoTeYnDf0gRJ9MWjNNmptXgve+6oLFvlrHOE
	h/gxbNCS/Dfiuf4jTsX9mcw7Bx377ftc98RkgHHjwpIiNAgu1amyGMpClgGmo9lfg1Nb
	cVl09J/pAsKLgis/9MyGugQDGzZE/ZpWjPPQ8qqrng3uV2bUm29Ud8UPW/bcul6WyKUT
	Xmqr0a3W/fAHf0WVqBypXZPrIW71FUdqCu7bLtK+KbDj75wuqksgxD9f+N//HJH/WRVM
	PCEA==
Received: by 10.180.84.193 with SMTP id b1mr45755185wiz.11.1337327770906;
	Fri, 18 May 2012 00:56:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm30498763wib.0.2012.05.18.00.56.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 00:56:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2012 09:55:58 +0200
Message-Id: <1337327758-14968-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1337327758-14968-1-git-send-email-koen@dominion.thruhere.net>
References: <1337327758-14968-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn0noWA4dYrEJadg5dFD0O6RB/9NPqdoy1djysBChFaZORJ0vpWEmtUogS/zI17cFFTSI/B
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [meta-oe][for-denzil][PATCH 2/2] cloud9: add patch to make it use nodejs 0.6.x for executing scripts
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
X-List-Received-Date: Fri, 18 May 2012 08:06:14 -0000

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



