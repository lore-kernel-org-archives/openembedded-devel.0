Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A1DC86FD1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 17:35:10 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jun 2014 10:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,495,1400050800"; d="scan'208";a="446620663"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2014 10:35:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 18:34:57 +0100
Message-Id: <05822f28a5988ef460ad96d0333539602a77bc42.1403026461.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1403026460.git.paul.eggleton@linux.intel.com>
References: <cover.1403026460.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/3] lcdproc: fix do_install for S!=B
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
X-List-Received-Date: Tue, 17 Jun 2014 17:35:12 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc     | 4 ++--
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index d1a45ca..91329d8 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -36,10 +36,10 @@ do_install () {
     sed -i s'/--oknodo//' ${D}${sysconfdir}/init.d/lcdproc
 
     # configuration files
-    install -m 0644 LCDd.conf ${D}${sysconfdir}/LCDd.conf
+    install -m 0644 ${S}/LCDd.conf ${D}${sysconfdir}/LCDd.conf
     sed -i 's!^DriverPath=.*!DriverPath=${libdir}/lcdproc/!' ${D}${sysconfdir}/LCDd.conf
     sed -i 's!^Driver=.*!Driver=${LCD_DEFAULT_DRIVER}!' ${D}${sysconfdir}/LCDd.conf
-    install -m 0644 clients/lcdproc/lcdproc.conf ${D}${sysconfdir}/lcdproc.conf
+    install -m 0644 ${S}/clients/lcdproc/lcdproc.conf ${D}${sysconfdir}/lcdproc.conf
 
     # driver library files
     install -d ${D}${libdir}/lcdproc
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
index 39e6074..1f9524d 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
@@ -15,7 +15,7 @@ do_install_append () {
     install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
 
     # configuration files
-    install -D -m 0644 clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
+    install -D -m 0644 ${S}/clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
 }
 
 PACKAGES =+ "lcdvc"
-- 
1.9.3


