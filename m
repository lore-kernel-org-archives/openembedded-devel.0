Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9304.1599641160833293089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=CUitrTeh;
 spf=pass (domain: blade-group.com, ip: 209.85.221.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f54.google.com with SMTP id k15so1978178wrn.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cMzwGlvH0fuJ7wTjzajG+ctlqgYkjUUgnPxjVWpQSdc=;
        b=CUitrTeh1yaAnJJWocW/66bULA8CyQt/leb1r0KviDLmk9ssTfBIAQ+GD5+uZ7IyDb
         E0EwYrH19Qw8/78LsZ6nOkuzHTX1fQS7ILFPVgMLnol1ieEax7jQSan4lBfZfNtqsLpH
         C9H6YTdtwju57GSwtaChNPrF3NW6DCpea2FcIsESAPEzLv7zJTuLcjwMjrmb9uD0cAUR
         1yn7g/Cl2dxdp6OtxXXEfmDTfcFrE5u1tyuAUcpqRGmYJCovqL6WVU2n3WkqWW5knQ7o
         XIEk2i96Hq4yBGZPpqmzniDoAZ2U6GOWzTlH3dOG6oqk8H9nXaXlHxEzSqEuNODaJqW2
         3zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cMzwGlvH0fuJ7wTjzajG+ctlqgYkjUUgnPxjVWpQSdc=;
        b=Tb7UGJC1eEDdk9I5MFhsp2Iw0XPsYv3+XLvAH+sqJJ/bopGFGHkWTSeT6cSGDfAYGF
         hVSbUJQlM1ChRgWU+1Ol26a3YisPd9+jn1chgHH6MfOG06mKJN8bhLXmJptBgTfuIVSH
         09QhdCNAmjshijHe91RG4XMW7mNbp8pVZKFudkvUvawq3wS8tRDIjGqqUrDouGNTPrPJ
         KLKlK2igmX7bsKRHim8sL0WCsPGs2ucEdzKtJdb6BWvG6IGPnAUH5PKJH4lR3lU86szY
         8xjNMNUVwKE3iA/wDRuNJU3683WvEQjNgEMAaweK4BgKCvqhPWjfVHAtfbzyjjEBc6fC
         rTYw==
X-Gm-Message-State: AOAM5328nUAth0nKsXloLrGW9gvBKuJt+5Ce/+6kldCcD9UMm7rdGx7B
	RUQ/bmomn2PaHU/jrJPpq0yebZF5NqTM7qFF
X-Google-Smtp-Source: ABdhPJzJSYyaSd270S8mS6l4jzZPt68n2Dja3KAfhArNuvzbtskKhgx2rSCBIetg/o68RiYnp3jInA==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr2568101wrn.47.1599641158970;
        Wed, 09 Sep 2020 01:45:58 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id y1sm2816452wmi.36.2020.09.09.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:45:58 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 3/4] libcec: rename libcec-tools to libcec-examples
Date: Wed,  9 Sep 2020 10:45:39 +0200
Message-Id: <20200909084540.178949-3-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084540.178949-1-yann@blade-group.com>
References: <20200909084540.178949-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Those are really not general-usage tools, just examples of the API usage.
Let's use a more explicit package name.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 94d967f4c..f55801c39 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -24,10 +24,10 @@ inherit cmake pkgconfig
 PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
 EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 
-# Put client tools into a separate package
-PACKAGE_BEFORE_PN += "${PN}-tools"
-FILES_${PN}-tools = "${bindir}"
-RDEPENDS_${PN}-tools = "python3-${BPN} python3-core"
+# Put client examples into a separate package
+PACKAGE_BEFORE_PN += "${PN}-examples"
+FILES_${PN}-examples = "${bindir}"
+RDEPENDS_${PN}-examples = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-- 
2.28.0

