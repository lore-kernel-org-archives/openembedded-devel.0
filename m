Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S22.hotmail.com (blu004-omc4s22.hotmail.com
	[65.55.111.161])
	by mail.openembedded.org (Postfix) with ESMTP id 58B576FC4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:35:05 +0000 (UTC)
Received: from BLU436-SMTP93 ([65.55.111.135]) by BLU004-OMC4S22.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22724);
	Wed, 17 Sep 2014 09:35:06 -0700
X-TMN: [9hzCozac+vqdmFQHoM+3KwzuayLfUu4P]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP9355D4FBC3BF05DD79ABFBD6B60@phx.gbl>
Received: from localhost.localdomain ([72.175.105.82]) by
	BLU436-SMTP93.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Wed, 17 Sep 2014 09:35:04 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 10:34:49 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 17 Sep 2014 16:35:04.0687 (UTC)
	FILETIME=[55B43FF0:01CFD295]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyassl: update to version 3.2.0, remove 3.1.0
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
X-List-Received-Date: Wed, 17 Sep 2014 16:35:13 -0000
Content-Type: text/plain

This release includes bug fixes and several new features
which we think will be beneficial to our user and customer base.

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.1.0.bb        | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
deleted file mode 100644
index 0c0cac2..0000000
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "CyaSSL Embedded SSL Library"
-DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
-               optimized for embedded and RTOS environments. It can be \
-               Up to 20 times smaller than OpenSSL while still supporting \
-               a full TLS 1.2 client and server."
-HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
-BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
-SECTION = "libs/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://www.yassl.com/${BP}.zip"
-
-SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
-SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
-
-inherit autotools
-
-- 
1.9.1


