Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5PhZ-0000yh-AX
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 00:19:05 +0200
Received: by fxi1 with SMTP id 1so4150679fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=v+1T8UkIXoibHBqaA1zx6qe1lfHuCNNJKXBliRnVAwY=;
	b=TodS2AFGnBetdRJJEmyOKn05vko0XEDqpVB+pVq70C4SMU2TjuHpn5Wc0VUsVbuxoQ
	eNCZjdDBSpcB15gYxbfER5gAttRZCulw2kdcO/UtPu8BuODnDJzeu+qJZXTp5nQJR1Mx
	mwgZ96v61IDW870o9yqGoBwC1rz2PsmD6s2N8=
Received: by 10.223.64.66 with SMTP id d2mr3837861fai.116.1316384030184;
	Sun, 18 Sep 2011 15:13:50 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id b10sm19706643fam.1.2011.09.18.15.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 15:13:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2011 02:13:38 +0400
Message-Id: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Sun, 18 Sep 2011 22:19:05 -0000

Include more dependencies into openssl-fix-link.patch patch.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22 +++++++++++--------
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    2 +-
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
index b319c62..6522d83 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
@@ -8,15 +8,19 @@ Index: openssl-1.0.0d/Makefile.org
 ===================================================================
 --- openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400
 +++ openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400
-@@ -246,9 +246,9 @@
-	@dir=crypto; target=all; $(BUILD_ONE_CMD)
- build_ssl:
-	@dir=ssl; target=all; $(BUILD_ONE_CMD)
+@@ -244,13 +244,13 @@
+ 	@dir=crypto; target=all; $(BUILD_ONE_CMD)
+-build_ssl:
++build_ssl: build_crypto
+ 	@dir=ssl; target=all; $(BUILD_ONE_CMD)
 -build_engines:
 +build_engines: build_crypto
-	@dir=engines; target=all; $(BUILD_ONE_CMD)
+ 	@dir=engines; target=all; $(BUILD_ONE_CMD)
 -build_apps:
-+build_apps: build_crypto
-	@dir=apps; target=all; $(BUILD_ONE_CMD)
- build_tests:
-	@dir=test; target=all; $(BUILD_ONE_CMD)
++build_apps: build_crypto build_ssl
+ 	@dir=apps; target=all; $(BUILD_ONE_CMD)
+-build_tests:
++build_tests: build_crypto build_ssl
+ 	@dir=test; target=all; $(BUILD_ONE_CMD)
+ build_tools:
+ 	@dir=tools; target=all; $(BUILD_ONE_CMD)
diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
index 28039ca..9a22632 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.2.5



