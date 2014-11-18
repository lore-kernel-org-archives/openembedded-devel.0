Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3695C72153
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 23:12:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAINCp1G010259
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 15:12:52 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 15:12:50 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Nov 2014 17:12:49 -0600
Message-ID: <1416352369-166176-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1416352369-166176-1-git-send-email-mark.hatle@windriver.com>
References: <1416352369-166176-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] polarssl: add dependency openssl
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
X-List-Received-Date: Tue, 18 Nov 2014 23:12:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

polarssl compiles with openssl to build unit test cases. If openssl
doesn't exist, native libssl.so will be used. Then causes error:

| .../bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/libssl.so: error adding symbols: File in wrong format

Add dependency openssl for polarssl to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 recipes-connectivity/polarssl/polarssl_1.3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/recipes-connectivity/polarssl/polarssl_1.3.8.bb
index 8ca1b1c..7a496b7 100644
--- a/recipes-connectivity/polarssl/polarssl_1.3.8.bb
+++ b/recipes-connectivity/polarssl/polarssl_1.3.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://polarssl.org/download/polarssl-${PV}-gpl.tgz"
 SRC_URI[md5sum] = "d1a2b4f21727e888f143414d2e3144e6"
 SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9406ff1"
 
+DEPENDS = "openssl"
 RDEPENDS_${PN} += "libcrypto"
 EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on"
 
-- 
1.9.3


