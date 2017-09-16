Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A12EA7805C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 22:56:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id g128so3543531qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hf9yR82Cdz3y/9aVnw0oa1i/uu6HwNynFbAR0S5a53o=;
	b=OplkrCawVObby5iJZAMvRRNGuRJpcaFgaYRVk450N9yVc6GiaRARpnCVRRW4A5k4/4
	slNsiJHj/ThAuDuMKp9GaJqc+7B9YEtyZ1ZWESCySTQ3omu0UgNmP2b+eMS0A5/g1K5W
	n8kPl/Go2/KmjGXmJvXmXjSKkyn9rEtEH6XSqBlWIPWgB4UztK1tBKmZrJ2Xzzfqm9Tb
	vUVrklCsggb2476j6EO5h3m/7zQidrvFuS05Rs+1PP7/0GHi2XThATULj7xl4SeWJguk
	18fJFnKgq69DgnAxKca76H5Tzz46cQmLw84SbU2+d5VxUfOPoArEhN4zjEdcVn6Pbo1b
	g72A==
X-Gm-Message-State: AHPjjUhOV9BGKRVjLG5DiTgyJFBoLMdfvFQR/wgG9HScoIfQzsbAHLmf
	3XrslzgJH0t07EHfo4M=
X-Google-Smtp-Source: AOwi7QA5KuF56U8fUjtlP/vFJgm+A9rnzTNrmabb0EJF+zhoEPb1NP+nbFLwKhGQ7OwwJ7gItGq5GQ==
X-Received: by 10.55.15.65 with SMTP id z62mr14696941qkg.2.1505602566454;
	Sat, 16 Sep 2017 15:56:06 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	u17sm2825204qtc.15.2017.09.16.15.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Sep 2017 15:56:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Sep 2017 18:55:58 -0400
Message-Id: <1505602558-20989-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.26.1
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
X-List-Received-Date: Sat, 16 Sep 2017 22:56:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.26.bb => python-cython_0.26.1.bb}         | 0
 .../python/{python3-cython_0.26.bb => python3-cython_0.26.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.26.bb => python-cython_0.26.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.26.bb => python3-cython_0.26.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 1f5ef0f..900e88a 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "2fa7ea73eb9944fdad3989adbfd22088"
-SRC_URI[sha256sum] = "4c24e2c22ddaed624d35229dc5db25049e9e225c6f64f3364326836cad8f2c66"
+SRC_URI[md5sum] = "8853dcb78749a786ad5ccdc007a8932f"
+SRC_URI[sha256sum] = "c2e63c4794161135adafa8aa4a855d6068073f421c83ffacc39369497a189dd5"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.26.bb b/meta-python/recipes-devtools/python/python-cython_0.26.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.26.bb
rename to meta-python/recipes-devtools/python/python-cython_0.26.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.26.bb b/meta-python/recipes-devtools/python/python3-cython_0.26.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.26.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.26.1.bb
-- 
2.7.4


