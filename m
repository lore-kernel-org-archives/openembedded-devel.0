Return-Path: <lchristina26@hotmail.com>
Received: from BLU004-OMC4S32.hotmail.com (blu004-omc4s32.hotmail.com
	[65.55.111.171])
	by mail.openembedded.org (Postfix) with ESMTP id 14A2B728D6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2014 16:56:07 +0000 (UTC)
Received: from BLU436-SMTP242 ([65.55.111.137]) by BLU004-OMC4S32.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Sat, 20 Dec 2014 08:56:08 -0800
X-TMN: [TSNX6Fp9bk6kLi/su7pgkzJz743mKrYC]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP242B9187CC8DDA1D8442674D6680@phx.gbl>
From: lchristina26 <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Dec 2014 09:55:49 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 20 Dec 2014 16:56:06.0387 (UTC)
	FILETIME=[D890E430:01D01C75]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] cyassl: add new recipe
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
X-List-Received-Date: Sat, 20 Dec 2014 16:56:12 -0000
Content-Type: text/plain

Add new version 3.3.0 recipe for CyaSSL

Signed-off-by: Leah <lchristina26@hotmail.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.3.0.bb        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
new file mode 100644
index 0000000..715cf1f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"
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
+SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
+SRC_URI[sha256sum] = "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
+
+inherit autotools
+
-- 
1.9.1


