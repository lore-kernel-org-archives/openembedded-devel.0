Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4A58FFFD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 22:58:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x10so707197pgi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rflk7NmsDwI6OQodI9qGpCXFi5fGZoTfX14kQu7jpHs=;
	b=avO9Myt12AWu5w/lTc1Gyh+vJHcDEc+KaD5tpUIXWBDLovp44wqmBE3CnCAulpCbZP
	yyhs00pQSijzD8E2mnTu4K+NW4rmVM5xHPBJ9Gcvva2jnaMnEbdRvO5cayeINUfs4daM
	t+Gt21qZBTNNtByFoFbHsj4qdvxhdnG5TWqAb56WWO6BL6y6LhF3IgTrsEtAXA07iVMY
	T83TKnK/btmbO4udBknji/qiYw2ihLHRiD126Hej7uEy72oalJjruRM+hPIcDFExlQpe
	mQsa8JOaBKKnZStj++ZVWSppnrQ8o9mTHxzcbgIsHjtDRIrXdtyBsTqdLNjkMs7EATi6
	ITvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rflk7NmsDwI6OQodI9qGpCXFi5fGZoTfX14kQu7jpHs=;
	b=rd9zsyHFVoIniKkeAU9DeQljabwImyzXvotZXhapzYLU8LouEZDhvo9rmfp5qObNDh
	9tf9gbbHwKB1n7pD7kx9iFsREAqy/Nmd2WHlfH/xT6rJma4pO0D95DuxmsOsYT2+EP7T
	jE6Yqdi8LOFtXA7nH1a+OajFqtJWkJKHBC1akp43OAFla18FPfGAjLRLz0UsUTVVeBdt
	o4wtXFqwbUUbaaj08GiXBFxlYTg7YS0c7JWyKU1XW0T3C9rWdxcjRlu3hYgyvhx7Jcjf
	ZAyjtBWl89NEQGDsYN+UPwKZi8L0/QFRrPd93ogTsof8cr1kZgoOAIYidG0PEUEnaOku
	BV2g==
X-Gm-Message-State: APjAAAWL4YBxWCRoUujlVXBnpUwo6a1up9SkLcAE3REvLhGsaFnGqGRP
	6br+FvNKwwomuuiS6vMNsuzKnJlodlE=
X-Google-Smtp-Source: APXvYqwzuWvsRwnUcMAvEALyCUmUeTIv8re7ZNjit0Bha2lg7Dmca1Yr6L+vg7jWOBZPIbbq9Eu/Rw==
X-Received: by 2002:a17:90a:dc83:: with SMTP id j3mr307016pjv.99.1568847494298;
	Wed, 18 Sep 2019 15:58:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c35sm6333405pgl.72.2019.09.18.15.58.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 15:58:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2019 15:58:04 -0700
Message-Id: <20190918225805.825469-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] kernel-selftest: Disable the recipe by default
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
X-List-Received-Date: Wed, 18 Sep 2019 22:58:14 -0000
Content-Transfer-Encoding: 8bit

If one has meta-clang in layers then it will get enabled automatically
or else, install clang/llvm on build host and add

HOSTTOOLS += "clang llc"

To config metadata then add COMPHOST = "(*)" in a bbappend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index fb4534dca8..9e30c8df51 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -115,5 +115,10 @@ RDEPENDS_${PN} += "python3"
 INSANE_SKIP_${PN} += "ldflags"
 
 SECURITY_CFLAGS = ""
-COMPATIBLE_HOST_libc-musl = 'null'
+
+# Set COMPHOST to (*) in a bbappend if you want to use it or include meta-clang in layer-mix
+
+COMPHOST ?= "null"
+COMPHOST_libc-musl = 'null'
+COMPATIBLE_HOST = "${COMPHOST}"
 
-- 
2.23.0


