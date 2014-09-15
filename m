Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S2.hotmail.com (blu004-omc4s2.hotmail.com
	[65.55.111.141])
	by mail.openembedded.org (Postfix) with ESMTP id 903897143F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 22:00:23 +0000 (UTC)
Received: from BLU436-SMTP33 ([65.55.111.135]) by BLU004-OMC4S2.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22724);
	Mon, 15 Sep 2014 15:00:24 -0700
X-TMN: [d97f+drnD3C7m+tBMmRQofQM69qefN+b]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP33002726F1A5BBA17F19CBD6C80@phx.gbl>
Received: from localhost.localdomain ([72.175.105.82]) by
	BLU436-SMTP33.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Mon, 15 Sep 2014 15:00:21 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Sep 2014 16:00:01 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 15 Sep 2014 22:00:21.0893 (UTC)
	FILETIME=[720A0B50:01CFD130]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cyassl: version 3.2.0 release
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
X-List-Received-Date: Mon, 15 Sep 2014 22:00:25 -0000
Content-Type: text/plain

This release includes bug fixes and several new features
which we think will be beneficial to our user and customer base.

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.2.0.bb        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
new file mode 100644
index 0000000..0c0cac2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "CyaSSL Embedded SSL Library"
+DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
+               optimized for embedded and RTOS environments. It can be \
+               Up to 20 times smaller than OpenSSL while still supporting \
+               a full TLS 1.2 client and server."
+HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
+BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
+SECTION = "libs/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://www.yassl.com/${BP}.zip"
+
+SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
+SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
+
+inherit autotools
+
-- 
1.9.1


