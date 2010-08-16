Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Ol56o-0000l3-6O
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:12:35 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id B15DB275D865; Mon, 16 Aug 2010 21:12:18 +0200 (CEST)
Received: from localhost (p5489A50E.dip.t-dialin.net [84.137.165.14])
	by gravedo.de (Postfix) with ESMTPSA id 8AFB7275D863;
	Mon, 16 Aug 2010 21:12:17 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 21:12:13 +0200
Message-Id: <1281985933-6172-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <20100813215306.GC19855@excalibur.local>
References: <20100813215306.GC19855@excalibur.local>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tslib: add config files for palmpre machine
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
X-List-Received-Date: Mon, 16 Aug 2010 19:12:35 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tslib/tslib.inc              |    2 +-
 recipes/tslib/tslib/palmpre/ts.conf  |   27 +++++++++++++++++++++++++++
 recipes/tslib/tslib/palmpre/tslib.sh |    6 ++++++
 3 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 recipes/tslib/tslib/palmpre/ts.conf
 create mode 100644 recipes/tslib/tslib/palmpre/tslib.sh

diff --git a/recipes/tslib/tslib.inc b/recipes/tslib/tslib.inc
index b23198c..b6ba48a 100644
--- a/recipes/tslib/tslib.inc
+++ b/recipes/tslib/tslib.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tslib.berlios.de/"
 AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
 SECTION = "base"
 LICENSE = "LGPLv2"
-INC_PR = "r25"
+INC_PR = "r26"
 
 SRC_URI += "\
   file://ts.conf \
diff --git a/recipes/tslib/tslib/palmpre/ts.conf b/recipes/tslib/tslib/palmpre/ts.conf
new file mode 100644
index 0000000..8857e8d
--- /dev/null
+++ b/recipes/tslib/tslib/palmpre/ts.conf
@@ -0,0 +1,27 @@
+# Uncomment if you wish to use the linux input layer event interface
+# module_raw input
+
+module cry8mrln_palmpre
+
+# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
+# module_raw collie
+
+# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
+# module_raw corgi
+
+# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
+# module_raw ucb1x00
+
+# Uncomment if you're using an HP iPaq h3600 or similar
+# module_raw h3600
+
+# Uncomment if you're using a Hitachi Webpad
+# module_raw mk712
+
+# Uncomment if you're using an IBM Arctic II
+# module_raw arctic2
+
+# module pthres pmin=1
+# module variance delta=30
+# module dejitter delta=100
+# module linear
diff --git a/recipes/tslib/tslib/palmpre/tslib.sh b/recipes/tslib/tslib/palmpre/tslib.sh
new file mode 100644
index 0000000..5c1cc25
--- /dev/null
+++ b/recipes/tslib/tslib/palmpre/tslib.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+TSLIB_TSDEVICE=/dev/touchscreen
+
+export TSLIB_TSDEVICE
+
-- 
1.7.0.4



