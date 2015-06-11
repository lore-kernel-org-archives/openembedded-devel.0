Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF7A1756A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9HBed010663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:11 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:11 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:51 +0800
Message-ID: <a0607244925c61441cfe76586cd18ddc74bf3430.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 4/9] engine-pkcs11: fix libdir for multilib
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:10 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../engine-pkcs11/engine-pkcs11_0.1.8.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
index d665242..a511cfb 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.1.8.bb
@@ -25,5 +25,5 @@ do_install_append () {
     rm -f ${D}${libdir}/openssl/engines/engine_pkcs11.la
 }
 
-FILES_${PN} += "/usr/lib/openssl/engines/engine_pkcs11.so*"
-FILES_${PN}-dbg += "/usr/lib/openssl/engines/.debug/*"
+FILES_${PN} += "${libdir}/openssl/engines/engine_pkcs11.so*"
+FILES_${PN}-dbg += "${libdir}/openssl/engines/.debug/*"
-- 
1.7.9.5


