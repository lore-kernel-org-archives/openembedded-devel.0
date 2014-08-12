Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S20.hotmail.com (blu004-omc4s20.hotmail.com
	[65.55.111.159])
	by mail.openembedded.org (Postfix) with ESMTP id AAC7B60424
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 19:42:50 +0000 (UTC)
Received: from BLU436-SMTP223 ([65.55.111.136]) by BLU004-OMC4S20.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Tue, 12 Aug 2014 12:42:51 -0700
X-TMN: [W5Ef/xzUU2vz0GBsnX+U6MQY7Yb/9Ws1]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP223AFD3FCC0CB7D577EB9D6D6EA0@phx.gbl>
Received: from localhost.localdomain ([174.45.121.196]) by
	BLU436-SMTP223.smtp.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(8.0.9200.16384); Tue, 12 Aug 2014 12:42:49 -0700
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 13:42:39 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 12 Aug 2014 19:42:49.0375 (UTC)
	FILETIME=[991C3AF0:01CFB665]
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] Submitting cyassl recipe for consideration in being added to meta-oe/meta-networking/recipes-connectivity. Cyassl is a lightweight, embedded SSL/TLS library. For more information: www.wolfssl.com. The cyassl recipe is a fully functional bb file tested with the YoctoProject.
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
X-List-Received-Date: Tue, 12 Aug 2014 19:42:57 -0000
Content-Type: text/plain

Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.1.0.bb     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
new file mode 100644
index 0000000..441d321
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
@@ -0,0 +1,21 @@
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
-- 
1.9.1


