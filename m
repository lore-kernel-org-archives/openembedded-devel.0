Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA1686D561
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9ZfPK003407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:35:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:35:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:34 +0800
Message-ID: <a20fc7ad0bd9ef121025e9ee076fc28efb7e7ce8.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] python-asn1crypto: extend to nativesdk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2019 09:35:39 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-python3-cryptography
ERROR: Nothing PROVIDES 'nativesdk-python3-asn1crypto'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index f1f0a3c..e85ce9a 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -20,4 +20,4 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-netclient \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


