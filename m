Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB40F71C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:32:58 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q66so10673832qki.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wu3+RbO0qIScZKvbDRCS62JKBUjOU7JC+onPkds6dps=;
	b=EVtY+x/NUllDNu2QPcVBNTQaodiNJ0r8ziabQWErcGymSSR8mWtvGf0VaYTNoI4455
	QVPEEH4Fg/BZcm9IpTGBNeXSVkJZBeSfEG88EMTmx4JG6C/Vu811UCnn3eba/5UmqRzY
	zuI7V8mNZDxZ//BIjVmCrHvtF1/eEPzR8VeuLSfjOTUMqCyEX5nxJAR5Pf8EODgvIohT
	MfyPTzoIB/S6r8xh22M2MnsjeeATLJlzsq1j/+QdI84EtF0kk206eMGYMouf4iFLtxOB
	45kDYkhRBOcpe+NceX/uicjapB7LO1d+Ug15iZLL1+czcalXFlQb4BjooYrJbTS+5RvA
	EDQQ==
X-Gm-Message-State: AIVw111qQhfuGgjPckrAnMU8HMup4s/E2GUy7Kru25b2CfdKLNo4r1wV
	HDYehpVC3a02qYOfm8E=
X-Received: by 10.55.42.216 with SMTP id q85mr20044737qkq.202.1500921179669;
	Mon, 24 Jul 2017 11:32:59 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	131sm8363927qki.23.2017.07.24.11.32.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:32:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:32:53 -0400
Message-Id: <1500921173-15375-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.26
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
X-List-Received-Date: Mon, 24 Jul 2017 18:32:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.25.2.bb => python-cython_0.26.bb}         | 0
 .../python/{python3-cython_0.25.2.bb => python3-cython_0.26.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.25.2.bb => python-cython_0.26.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.25.2.bb => python3-cython_0.26.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index da39d14..1f5ef0f 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "642c81285e1bb833b14ab3f439964086"
-SRC_URI[sha256sum] = "f141d1f9c27a07b5a93f7dc5339472067e2d7140d1c5a9e20112a5665ca60306"
+SRC_URI[md5sum] = "2fa7ea73eb9944fdad3989adbfd22088"
+SRC_URI[sha256sum] = "4c24e2c22ddaed624d35229dc5db25049e9e225c6f64f3364326836cad8f2c66"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.25.2.bb b/meta-python/recipes-devtools/python/python-cython_0.26.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.25.2.bb
rename to meta-python/recipes-devtools/python/python-cython_0.26.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.25.2.bb b/meta-python/recipes-devtools/python/python3-cython_0.26.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.25.2.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.26.bb
-- 
2.7.4


