Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE7AE782A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:15:41 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i40so24540694qti.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H/tl8H0JYdzEhExRrTQvh6rnuDQ4UrPl9VNvDbrskZM=;
	b=JxG38B1J97Gp7wv/Zdk3K67IBzNbVHoE/X44eHjOniREGMBclNWpFW9/E0ZJPySy9j
	Rh6CuVscV2S643vuCMnU3wxxpro3s0Ycv0sHdVhG0pH6tDnzMTAc2qnPDg6qnCzR+Sdu
	UEFYulgwJ/Fqg4cFy6s4ijUrWHfROW/xIxGQ02j8kX509POTlADb1RHsZ66WoHNcq8uc
	nZsIzAz4b66+JL8sVl+z8DAqPWd+/3bgPmMDU/QfVfCisZ/hX5hKgslpc8/POE294JN8
	oQHc4QZvhs43fiq3D5yhOIRxtbtHP96xnQc2ilxso3LeAgE2zq4efAVWcJFk0X7ey5rR
	zOWw==
X-Gm-Message-State: AKGB3mJpPLKJF7q3yDPsfdb81QBtL5aEX4gThaSuiWeW8n0diZqTvcPB
	Zl9PhBmkB3SA8aua0luBssjrjKXk
X-Google-Smtp-Source: ACJfBoufYH3IneOCVxn4BysQ9xYz28oohuLhNurHx4eJfw6msGzGCPWAidX8alEE782omYfdRglyWg==
X-Received: by 10.200.55.185 with SMTP id d54mr5718142qtc.105.1513696542467;
	Tue, 19 Dec 2017 07:15:42 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f184sm9534328qke.40.2017.12.19.07.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:15:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 10:15:32 -0500
Message-Id: <1513696532-12309-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.21.1
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
X-List-Received-Date: Tue, 19 Dec 2017 15:15:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc                | 5 ++---
 .../python/{python-pandas_0.21.0.bb => python-pandas_0.21.1.bb}      | 1 +
 .../python/{python3-pandas_0.21.0.bb => python3-pandas_0.21.1.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.21.0.bb => python-pandas_0.21.1.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.21.0.bb => python3-pandas_0.21.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index 4c00a1a..266f8b7 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,10 +6,9 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "6f14884caaa87a0824b5e93fe032b904"
-SRC_URI[sha256sum] = "5cd5cb30e72eeaf202f0e5e180780b897570e889d2db328c689a5a263405c559"
+SRC_URI[md5sum] = "42ae7f81b81a86c3f91f663b66c525f7"
+SRC_URI[sha256sum] = "c5f5cba88bf0659554c41c909e1f78139f6fce8fa9315a29a23692b38ff9788a"
 
-PYPI_PACKAGE = "pandas"
 inherit pypi
 
 DEPENDS += " \
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.21.0.bb b/meta-python/recipes-devtools/python/python-pandas_0.21.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-pandas_0.21.0.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.21.1.bb
index 20973c8..355074c 100644
--- a/meta-python/recipes-devtools/python/python-pandas_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python-pandas_0.21.1.bb
@@ -2,6 +2,7 @@ inherit setuptools
 require python-pandas.inc
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-future \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-importlib \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pandas_0.21.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.21.1.bb
-- 
2.7.4


