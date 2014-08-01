Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Aug 2014 17:36:28 UTC
Received: from BLU004-OMC4S9.hotmail.com (blu004-omc4s9.hotmail.com
	[65.55.111.148])
	by mail.openembedded.org (Postfix) with ESMTP id DBE0B609BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 17:36:28 +0000 (UTC)
Received: from BLU436-SMTP146 ([65.55.111.135]) by BLU004-OMC4S9.hotmail.com
	with Microsoft SMTPSVC(7.5.7601.22712); 
	Fri, 1 Aug 2014 10:31:22 -0700
X-TMN: [4Svd16Z/4pXSp5Zk1X17lQY51waODYhx]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP146A07F73D628D357FEB9C0D6E70@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP146.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Fri, 1 Aug 2014 10:31:20 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 1 Aug 2014 11:31:10 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 01 Aug 2014 17:31:20.0513 (UTC)
	FILETIME=[68702B10:01CFADAE]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] 'meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb'
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
X-List-Received-Date: Fri, 01 Aug 2014 17:36:33 -0000
Content-Type: text/plain

Signed-off-by: lchristina26 <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.1.0.bb    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
new file mode 100644
index 0000000..accc144
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
@@ -0,0 +1,26 @@
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
+PR = "r1"
+
+SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
+
+
+SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
+SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+# Detect and build with correct endianness
+# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', '-DBIG_ENDIAN_ORDER', d)}"
+
-- 
1.9.1


