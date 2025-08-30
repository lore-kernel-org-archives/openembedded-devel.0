Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51781CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.15658.1756579401088216465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKuXkeRl;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326e5f058so2511088a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579400; x=1757184200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQw7JBsodboz2NPz04gjXaRdA50QfRUJJ/dg9l9kw0A=;
        b=PKuXkeRlVnM3ww4V9xtrzHm1PATS80x9CDgQfW3qqAJ7S4ZIZFpIHG6WmeF0+5pUgH
         UvyUgKL3a0CHbFxNUXhw6kFZIavYZTyMELapr+ZphsI9xIFKZeGhdhdhKYEagRTbzegP
         NIAeXywQ0hc/Kg7cLgD+WVhvOAlE3UtSWcE0kTmX1NnHK//unbYHesW3Yp7TIYTU/FvN
         6zxu06KknGiw5TtYy2GJWqoCInxLodMe2BfOHLo/QONl/xaHN7ec8/xKHiIC1bCP9K7j
         Mn3j9bdT0aEoCsKNRBDGQymfWY8ZwCpYArTAMYcADygH+JrY2Z7jLY/msE09HVZJ6DpC
         LmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579400; x=1757184200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQw7JBsodboz2NPz04gjXaRdA50QfRUJJ/dg9l9kw0A=;
        b=aNq4oBJSxiJFGCLQu6/F32ehO1J5wYYwSBNj/YWUaA9l3UPnJvBRIiGpdu25hhHsfJ
         rC5qmPpDFOkfFHQrDfCrt/DfDgLsCklHkdobMOQtIHoMXvykgOqarW4muhNX2Trz/rcX
         bIH3h8gFtl8g/3TLais6pcgfiJ1DU/iyxW89h+Uq/JRdIE+42oCoseerm4ci8dIOY/UY
         M1JruVYzRc/eZmYfIjaAjoIz+g0DhdOn597ZOp6Kc0MTY4UBTFddz65jiSeTa24fVUKZ
         OoBjjfhGc+LQtAyahT52ftIXfKTBCBZzO8rbZjSX6WfmGfz4wOnvrg3xTLqKMDFM4jrS
         EMQw==
X-Gm-Message-State: AOJu0YzLKH04vvWoHiKhxJ8L6P1qcSGOrYOERmE9AgkyT6XPCFCRoRf9
	sX+6FCnQo3+oFkIxZUSGAmkdzJrn+d5Mf3J0vxdU+AhthIiSGwWWJhDeuNtli/O3
X-Gm-Gg: ASbGnctvEI+dk62rlMerl2jf19Vw5r5FvE9Y4WDt8/v23qAnv5CXPR0nNhiTl5i/2zZ
	BPqtyhmIvvaLrT1I5584XASGSm8ecATlixiVWy7676GC/Q9t5TwEcasryD3MHg7vhAcWhTQJVWf
	N5YGBu6xM+urw6e/5gRBa+AfR3NLY/o9WYGHv9vpzsmPQUvxu57D7sZ/EEaFL6MxXHb+u4vKls8
	N5QLmLoJ/a/7I3a0cZi30U7Kfa2iNWAtPBzykfkKMYlLcpRZIOPb70zVUtaqHLiWRD7NulEdQJ/
	fr8CA61zTyHKqxWQYqtfgw1kiSS5l2iiYd0N/eGhjitVfOGoZfrvnEZoA/1axrvrXfipt8m1s3U
	esTeR/LP/XI/ZwpwLQavZma+65F/9/Buo0eE46lSzc/r+FAy0BeBpGAtbYTH9vaAx0yB/Eg4ma4
	+cDRXWj++qeo+n5QKEqfU8A9L+0nzUVcFB2K3IRlm2FjFX9FE7+xLCNMJoKlU9fg==
X-Google-Smtp-Source: AGHT+IHR76Xzv6ltQqxn2oNAiZQeThyGGRrq/WoV2Pc7GxUd5zo2CER0kgx6HR/wwb5f4H45P4cdsQ==
X-Received: by 2002:a17:90b:1b12:b0:327:7c8e:8720 with SMTP id 98e67ed59e1d1-328156e57demr3677442a91.34.1756579399935;
        Sat, 30 Aug 2025 11:43:19 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/8] castxml: Upgrade to 0.6.13 release
Date: Sat, 30 Aug 2025 11:43:07 -0700
Message-ID: <20250830184311.1018374-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119147

Fixes build with clang-21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../castxml/{castxml_0.6.11.bb => castxml_0.6.13.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/castxml/{castxml_0.6.11.bb => castxml_0.6.13.bb} (81%)

diff --git a/meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb b/meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb
similarity index 81%
rename from meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb
rename to meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb
index 69663e01ab..9e506a8709 100644
--- a/meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb
+++ b/meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb
@@ -2,11 +2,11 @@ SUMMARY = "C-family abstract syntax tree XML output tool."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master"
-
-SRCREV = "f38c024b395187814f14f77974d8f5240bb2e71f"
+SRCREV = "13e1572729981289a7a96d762960994134f73f76"
+SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV}"
 
 DEPENDS = "clang"
+
 inherit cmake pkgconfig python3native
 
 BBCLASSEXTEND = "native nativesdk"

