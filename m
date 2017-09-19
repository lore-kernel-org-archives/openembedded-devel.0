Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 98776780B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:41:19 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q8so2451134qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=faiBdiaKlGEMAnSxzmRi5zMb062u+H4yEwGNMe6Y8IQ=;
	b=oSKTd5DoPXGq05NmJcbXLdyZJGqaldd9mu9vbKbbZTeY+S+UihMkfurUSGcCT9QBOF
	z1s06/M3PIHB3P5LWbFR2Iin+P23nRfMZ6YsJ5dcMlw7WoF5soqIuz+745/QHJQaRume
	2xPOcksft1OwOw5InWs54z1kFj6gm/uFAF32BGD+pRFBRD7ZVos1OLMTeBFhA5bT+ZNh
	5Mivf/oX3c4BjDXx5yagUOaA47Ki0PvhOuSnjLfme+LhB/cnOtQP7BUgSWTEeqV83UhY
	iMAfqu09kzIJ5VdeS2V51jW6zDUFmzIFB+IvhhxKAb+qMDY0zN2bi1oKW4C797qBnt7X
	rZbA==
X-Gm-Message-State: AHPjjUjeaNnJ2uKybXapgVeDnBEyb2n4HTbkCIx1CgWeKs77tLV3l6Dt
	sHnNt6DDYKpH6kLocK/myiXJZkHg
X-Google-Smtp-Source: AOwi7QBCprtAzdx3EMupkPWeSdzGdW/puD5S1ib8NZlyo170dF1vwZ/EOMEcmsV1cXuNFcVziQeqqw==
X-Received: by 10.237.37.91 with SMTP id w27mr2452110qtc.71.1505832080223;
	Tue, 19 Sep 2017 07:41:20 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 25sm7070288qtv.14.2017.09.19.07.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:41:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:41:06 -0400
Message-Id: <1505832066-5964-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.80
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
X-List-Received-Date: Tue, 19 Sep 2017 14:41:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.79.bb => python-pymisp_2.4.80.bb}       | 0
 .../python/{python3-pymisp_2.4.79.bb => python3-pymisp_2.4.80.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.79.bb => python-pymisp_2.4.80.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.79.bb => python3-pymisp_2.4.80.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 75cd05b..21ba7bb 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "7e3f33ba1726d49df590c0d0a56c5672"
-SRC_URI[md5sum] = "88a85d2e7633c4bc3f1a375ff2be3bfc"
+SRC_URI[md5sum] = "2024babd97ab57ca0360394edc37f2b6"
+SRC_URI[sha256sum] = "7480acada8cba9472a85070c57baad89ae9deed826a7515a4c149ac48920c273"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.79.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.80.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.79.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.80.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.79.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.80.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.79.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.80.bb
-- 
2.7.4


