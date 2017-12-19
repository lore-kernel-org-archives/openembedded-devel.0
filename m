Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE831784DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:55:21 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id 8so23557399qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x7bEBLJL5iw3kJR0oAbet0/QZFt67y8zRQNCxQajDsA=;
	b=Ls+dbz+I1PdsDC5nA8HIT7CIoNlLkVEqU439IX+3hHSP0x1hWuJoqMZ/KU0+bAoawK
	G4/1i4K3yXx4H9Zl4WLGC7JfJ3XJnD20fbTJfcJk9MQd8fVamK2fkTOJ+Y7bEQdxFU8S
	SHxorTRVDDSHrOGdd0VwMFRfviXCbqMudfnhOMxyn+p3xjp4S/ZrLPIUvt2v9PgIY46X
	IUieJOzHUqBf6bA5CXsGvjnQrgGGDH+b/8nBn82EHpwhxZze8CtjcriLJ7D8i2E6REEg
	ooqdmxg6WK8YcU2cm6z9BoDfM7sgypIWX7IM/s4byes92f6s8F1Hp1EFoMWwSYUudsB9
	VT1w==
X-Gm-Message-State: AKGB3mL6MZsLtHIN0FkHginvt1JUxb09tp5iP/jMAY0I6FdAjds3lZxP
	TXTefPrur2DXyoqmp8wbxnbZBDrx
X-Google-Smtp-Source: ACJfBotFBPsx81BVdab3Ik2pQpolduIuz+BzxjJTP4Cxhio2235bXKaPbDBh7C32SrW1Z5+fgbOQyA==
X-Received: by 10.55.22.167 with SMTP id 39mr5967745qkw.297.1513706122395;
	Tue, 19 Dec 2017 09:55:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	l125sm9875959qkc.3.2017.12.19.09.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 09:55:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 12:55:13 -0500
Message-Id: <1513706113-30887-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.84
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
X-List-Received-Date: Tue, 19 Dec 2017 17:55:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc         | 11 ++++++++---
 .../{python-pymisp_2.4.82.bb => python-pymisp_2.4.84.bb}      |  0
 .../{python3-pymisp_2.4.82.bb => python3-pymisp_2.4.84.bb}    |  0
 3 files changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.82.bb => python-pymisp_2.4.84.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.82.bb => python3-pymisp_2.4.84.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 1a0f869..4abaf97 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,7 +3,12 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "160988f4f6bd56670b28c9791f8a8b55"
-SRC_URI[sha256sum] = "21834f562632cbb87c867c5cd4839799832b5714cc3c8e2797e56c4a72f6e26c"
+SRC_URI[md5sum] = "0fe33de8e87120a46f917cb6bfa7baee"
+SRC_URI[sha256sum] = "6f228e4050252002bd9093378e687cf5eb963fd8fdf3e561453376eda7bc396a"
 
-RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-jsonschema \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.82.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.84.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.82.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.84.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.82.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.84.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.82.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.84.bb
-- 
2.7.4


