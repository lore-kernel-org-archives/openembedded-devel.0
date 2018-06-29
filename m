Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC4CB7523F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:38:01 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y20-v6so8847238qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=asn3oO8z9ZZ0ZDKEcsBECDGERghorawkwhvXJWRsUAo=;
	b=orsY32KA2r/aZyH88NxcLy/GBMyOHKtCuuNAww1ICyYumAu5BHzKk+dA/uT9ETF7Xb
	YOG9PL8tiEy6akeBZymKjM+Xv2rbrD202iMUa2GVuVoQeqyDhOgO28C4Ftg/65ADOk1v
	70et9rZYPDwyhumiHPitiWn/QSE0632jZMobOTLSpneSCMiurSEXeIIkvdzi+nwmGTRP
	+Js/Gm4q2wmCaP25ITKySOeSMaB2CfogZWB4W6LfSVShe+oucW5FnwyZcZlSOG6kHODT
	9q6moaDpCOxNGRLOUw5rHNz9yONGBmCqzFyJM4TaiQPU1qHBAb8HRHmmELuEwqmGWCTY
	ujog==
X-Gm-Message-State: APt69E3rI/0wTPuqeNis0xzxoht3sJ/wBuTJxt+qJHE0e/NFuC90Vdg/
	POg+4hURFK+DNdkFLKjnpIwLKvsu
X-Google-Smtp-Source: AAOMgpeOEZTE/x3wqjluHNlnm9L2nBxV5luYZUH9h1WaLFC+GijcNsGzkfmzLRrkzgvKGhwjfvKanQ==
X-Received: by 2002:ac8:1090:: with SMTP id
	a16-v6mr14792159qtj.307.1530301082269; 
	Fri, 29 Jun 2018 12:38:02 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	d14-v6sm6257698qtn.90.2018.06.29.12.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:38:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:37:54 -0400
Message-Id: <1530301074-29978-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: update to version 2.7.3
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
X-List-Received-Date: Fri, 29 Jun 2018 19:38:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc               | 4 ++--
 .../python/{python-dateutil_2.7.2.bb => python-dateutil_2.7.3.bb}     | 0
 .../python/{python3-dateutil_2.7.2.bb => python3-dateutil_2.7.3.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.7.2.bb => python-dateutil_2.7.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.7.2.bb => python3-dateutil_2.7.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 333b5e2..d96d84f 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[md5sum] = "03a08c8bcf0a2b29f1cd21b9de4d12fb"
-SRC_URI[sha256sum] = "9d8074be4c993fbe4947878ce593052f71dac82932a677d49194d8ce9778002e"
+SRC_URI[md5sum] = "175b7c1a3cc0cb01151eced07c61c0b8"
+SRC_URI[sha256sum] = "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.7.2.bb b/meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.7.2.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.7.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.7.2.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.7.3.bb
-- 
2.7.4


