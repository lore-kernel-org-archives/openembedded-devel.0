Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id F04396006E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:01:40 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id o2-v6so5688808qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXa/ms9LfGoaVrtESukX+XuEfEVi6cAgmcZJ7UMX3V8=;
	b=VsrMai+Ctb9R4tPu2e25XMBN7UHnc2GXGvfe6JjrKFEiNOlVEWaC7PqeR8x5g7Osjt
	KXjzB8BV85zlvXiLB0ZZ54I32VXl+pYBUovXhDufnITB8gjqkRPuiyA/b8/92Ia5I89J
	HsVporIBj1RsYTzY1kTyjTDhzYksaIgRtJrtv2Ei6ZAuh9qbGgn9yjC3Ha/5SEo4dWDD
	/YaVqLZ0s60QPN+tY01CHDzxT8fgNRKqCKjotheRX40TWfHgv5ewNtB04Ifhy2499yie
	q6jxnFvzDTyZpKXewJ10hGDY1ZrvxeoExHuP1oH3t6pFl/QHUI9a9T2BwSohTNCad4Uk
	Xf5g==
X-Gm-Message-State: APt69E1WiuDTcu0toiDJciQEmuprgueyrNAgF1QISGHWiKvpxJ/E4bZK
	Bvc777z1zDrATBBwtqjDPSDgEAw3
X-Google-Smtp-Source: AAOMgpdzgXBKwvxDYNBhEAR+HZVOQ4T9ld6ibX1sbX+4RxxQrkWLGF+wNkUSv1aGXdu82mYjBqE19A==
X-Received: by 2002:a37:b803:: with SMTP id
	i3-v6mr14472447qkf.170.1530306101546; 
	Fri, 29 Jun 2018 14:01:41 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	w46-v6sm8311874qtw.55.2018.06.29.14.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 14:01:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:01:33 -0400
Message-Id: <1530306093-25258-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.92.1
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
X-List-Received-Date: Fri, 29 Jun 2018 21:01:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.89.bb => python-pymisp_2.4.92.1.bb}     | 0
 .../python/{python3-pymisp_2.4.89.bb => python3-pymisp_2.4.92.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.89.bb => python-pymisp_2.4.92.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.89.bb => python3-pymisp_2.4.92.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 7765cc5..e53797a 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "d4fee2abb2d7468010b7fe9ebc68b0cb"
-SRC_URI[sha256sum] = "304fbd8862dfde27d767c093de87fec42fc63c70d8393643d1a3b4f765aae78f"
+SRC_URI[md5sum] = "7390fe6a8df25170059e32f1988d5447"
+SRC_URI[sha256sum] = "63a52b97981b0e3c0023e11ce22f097356cdc9ef7c28a3415a17a08fcd7e8984"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.89.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.92.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.89.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.92.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.89.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.92.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.89.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.92.1.bb
-- 
2.7.4


