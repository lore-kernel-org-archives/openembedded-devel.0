Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3BCE7210A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 01:30:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q1UGSD017556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 May 2015 18:30:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 25 May 2015 18:30:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Tue, 26 May 2015 09:24:44 +0800
Message-ID: <1432603484-15923-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] mbedtls: upgrade to 1.3.10
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
X-List-Received-Date: Tue, 26 May 2015 01:30:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. PolarSSL is now rebranded as mbed TLS.
2. upgrade to include CVE-2015-1182 fix:
   http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1182

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../polarssl/{polarssl_1.3.8.bb => mbedtls_1.3.10.bb}             | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/polarssl/{polarssl_1.3.8.bb => mbedtls_1.3.10.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/mbedtls_1.3.10.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
rename to meta-networking/recipes-connectivity/polarssl/mbedtls_1.3.10.bb
index 8adc0b1..f956b6d 100644
--- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
+++ b/meta-networking/recipes-connectivity/polarssl/mbedtls_1.3.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Lightweight crypto and SSL/TLS library"
-DESCRIPTION = "PolarSSL is a lean open source crypto library         \
+DESCRIPTION = "mbedtls is a lean open source crypto library         \
 for providing SSL and TLS support in your programs. It offers        \
 an intuitive API and documented header files, so you can actually    \
 understand what the code does. It features:                          \
@@ -23,10 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SECTION = "net"
 
-SRC_URI = "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
+SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
 
-SRC_URI[md5sum] = "d1a2b4f21727e888f143414d2e3144e6"
-SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9406ff1"
+SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
+SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
 
 DEPENDS = "openssl"
 RDEPENDS_${PN} += "libcrypto"
-- 
1.9.1


