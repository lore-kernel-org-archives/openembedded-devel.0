Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3B0865CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:59:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5xVb5002920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:59:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:59:30 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:53 +0800
Message-ID: <1529992863-24711-10-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 10/20] python(3)-pyopenssl: upgrade 17.5.0 -> 18.0.0
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
X-List-Received-Date: Tue, 26 Jun 2018 05:59:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc              | 4 ++--
 .../python/{python-pyopenssl_17.5.0.bb => python-pyopenssl_18.0.0.bb} | 0
 .../{python3-pyopenssl_17.5.0.bb => python3-pyopenssl_18.0.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_17.5.0.bb => python-pyopenssl_18.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_17.5.0.bb => python3-pyopenssl_18.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 7722e8ecd..516e7958a 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "d9c5134db8bf3183573b7840954cac94"
-SRC_URI[sha256sum] = "2c10cfba46a52c0b0950118981d61e72c1e5b1aac451ca1bc77de1a679456773"
+SRC_URI[md5sum] = "c92e9c85b520b7e153fef0f7f3c5dda7"
+SRC_URI[sha256sum] = "6488f1423b00f73b7ad5167885312bb0ce410d3312eb212393795b53c8caa580"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_17.5.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_18.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_17.5.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_18.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_17.5.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_18.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_17.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_18.0.0.bb
-- 
2.11.0


