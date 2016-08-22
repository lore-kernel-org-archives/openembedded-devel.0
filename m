Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 806AB738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:27 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o1so8982563qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=tFm8kuH0mR3o9LI2RkWRBaM56GgOoy+tABwSm5DXPm0=;
	b=OCRnWoIkXNbbo8xinaIzcT8X/PYPhJ8GxqgRUYFqzs9AL1NhAvULlwX2fVgKeUCniv
	MZ4PdZ1SjjDtZgKBHQDc6blrq6z3/SkTcwHsHrRRqC8HC7KnktXdkiFA09c+e7iuCMWy
	P4smJGovb4nkkYt01jBjkMrLhP2Cf6FpjDlvyDIkMdz6KfsMZw3QW56OJOYv/MXmRiYK
	3jFzGrcEwfLrSYum/CA5ePBWGORN454jBdMAQ9eILvhStAN6fr6/reMKnYT/6HhAgK9O
	5Dg5+GK8Ow8RqAN811U5xUbXm84WW1w/5KBLYWX+VcvLnWmRgW7W29Xr9ilr9cfoerzH
	ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tFm8kuH0mR3o9LI2RkWRBaM56GgOoy+tABwSm5DXPm0=;
	b=OdBLFwHQHr67inVna9JTgJPNqzvq6z6z/bdK6ABn77c/ifOzUe4F0mbq0+VhG3qgsm
	I821uoBmj8bjlig9i7dYP8ZF+skXOQCuXX2giACLR2QQopPZCnQm+zdcjfQom6zpWdII
	dpvZU3jsQkvQV3xvn6pYZd0l4WoHzVQioAr5BtIJfagCe6ZjrfWegj0VSReWVrNS4jb8
	zqSmqx2O7qqpvgGEWZIIzOzJMiblV4W/8Ujk+PzYiKcnT05bUZw3bjRO2CSncVqyERXx
	2y+oqPrdn861niyna5iQq1WHsG77Kqvz8jJLEXiiA5oI/WmLc9kTqDBD2ctDkETm7DpN
	tW8A==
X-Gm-Message-State: AEkooutnd2AEFIxYR/MLYbbLPghqmjeyftENANfL9CTJeH1owQ/j7fVQRMdPsoz7veI2Gg==
X-Received: by 10.55.165.193 with SMTP id o184mr26483722qke.284.1471892608205; 
	Mon, 22 Aug 2016 12:03:28 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:27 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:27 -0300
Message-Id: <1471892491-6177-13-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 13/17] python-requests, python3-requests: Update to version 2.11.1
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:27 -0000

This commit also change RDEPENDS code style and add python-urllib3
as runtime dependence.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-requests.inc | 17 ++++++++++++++---
 ...hon-requests_2.10.0.bb => python-requests_2.11.1.bb} |  0
 ...n3-requests_2.10.0.bb => python3-requests_2.11.1.bb} |  0
 3 files changed, 14 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.10.0.bb => python-requests_2.11.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.10.0.bb => python3-requests_2.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index e00b257..287078a 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,7 +3,18 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
-SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
+SRC_URI[md5sum] = "ad5f9c47b5c5dfdb28363ad7546b0763"
+SRC_URI[sha256sum] = "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-ndg-httpsclient \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pysocks \
+    ${PYTHON_PN}-urllib3 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.10.0.bb b/meta-python/recipes-devtools/python/python-requests_2.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.10.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.11.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.10.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
-- 
2.1.4


