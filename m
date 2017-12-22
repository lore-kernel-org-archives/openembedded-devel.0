Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D72D9788BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 15:06:03 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u42so36583536qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 07:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w+NFC6DY6U23Msq3xTlwryi9k1wiiv9HP7/yIsihytU=;
	b=kJLHt8ZihHUInlfrDu4jMzt6pzrcAeC6z/KTLKXAtVZ/FdPMS4SGl5xpVQH/t+ot8A
	RL+xVa1WW8UJNLvWn55Cy9wxPs2avk8r5sAt2dTHoejs3l2HZlCi3fv9XdetC3+z91ED
	ANm8ikTO/hLxSigB7i3c7WcsILhflG6ehNeUAfjHoNTCXeX5A3TSlPqbjh2J1jZWv9dC
	LBT8u6TSUaqwm0Yc6M/fuWFek0b8XtsV5N8WCduPp8VOQ+PyRC5/YyjuJaS8IIZQ8GWh
	H2HkBXiuyqxSHNGfl1o+N2MZ06rhsjH0CEldyr47vE8WWG2SvlLVR/c47lj/JSmyIiAe
	dpDg==
X-Gm-Message-State: AKGB3mLaK//BdVgLI9ICElAPG4WXgcS28myvnLdxh2mYx7Rx45n3rHti
	rE890TNhryTKzikNtq1qEIoSiqGy
X-Google-Smtp-Source: ACJfBotAO638eaEuHFQEDAcfL25/myi6IZ17k5s/wcXO7/ut9IkxBuUnJzeGNUy9MiInhQDPR0tFDQ==
X-Received: by 10.200.33.185 with SMTP id 54mr20427241qty.236.1513955164450;
	Fri, 22 Dec 2017 07:06:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c21sm14584142qkg.64.2017.12.22.07.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 07:06:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 10:05:57 -0500
Message-Id: <1513955157-15278-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysocks: update to version 1.6.8
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
X-List-Received-Date: Fri, 22 Dec 2017 15:06:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pysocks.inc             | 7 +++++--
 .../python/{python-pysocks_1.6.7.bb => python-pysocks_1.6.8.bb}    | 0
 .../python/{python3-pysocks_1.6.7.bb => python3-pysocks_1.6.8.bb}  | 0
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysocks_1.6.7.bb => python-pysocks_1.6.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pysocks_1.6.7.bb => python3-pysocks_1.6.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
index cf9509a..53ec1b7 100644
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -3,13 +3,16 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
-SRC_URI[md5sum] = "07007ec7ed46292dab06013f2e3af365"
-SRC_URI[sha256sum] = "d00329f27efa157db7efe3ca26fcd69033cd61f83822461ee3f8a353b48e33cf"
+SRC_URI[md5sum] = "441c4e3bf5b042f7e70613cd871df26c"
+SRC_URI[sha256sum] = "3fe52c55890a248676fd69dc9e3c4e811718b777834bcaab7a8125cf9deac672"
 
 PYPI_PACKAGE = "PySocks"
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-email \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.6.7.bb b/meta-python/recipes-devtools/python/python-pysocks_1.6.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pysocks_1.6.7.bb
rename to meta-python/recipes-devtools/python/python-pysocks_1.6.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.6.7.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pysocks_1.6.7.bb
rename to meta-python/recipes-devtools/python/python3-pysocks_1.6.8.bb
-- 
2.7.4


