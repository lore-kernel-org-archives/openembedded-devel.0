Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Oiue1-0002tX-Kn
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 21:37:58 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A881B80C527; Tue, 10 Aug 2010 21:37:40 +0200 (CEST)
Received: from localhost (p5489A930.dip.t-dialin.net [84.137.169.48])
	by gravedo.de (Postfix) with ESMTPSA id B407D80C4FF;
	Tue, 10 Aug 2010 21:37:39 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 21:37:37 +0200
Message-Id: <1281469057-11502-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
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
X-List-Received-Date: Tue, 10 Aug 2010 19:37:58 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tslib/tslib/palmpre/ts.conf  |   27 +++++++++++++++++++++++++++
 recipes/tslib/tslib/palmpre/tslib.sh |    6 ++++++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tslib/tslib/palmpre/ts.conf
 create mode 100644 recipes/tslib/tslib/palmpre/tslib.sh

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



