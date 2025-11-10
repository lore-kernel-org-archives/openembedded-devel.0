Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D89CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:29:44 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45896.1762773356700218622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 03:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgOdA12R;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: moraless.philius5@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso9805015e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 03:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773355; x=1763378155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5UM79HAAHIicPV0NWv6rNOWHAN98TEegcQyYKNazic=;
        b=DgOdA12RPZhNKRIODyMs5pdtVqO2D8PX3pVoDFsqejmcB+Ax/wZojYCRd6V1pBptIs
         hyRxTan0L5es6YiKg+j6PG3LyLLyUWQGeL7nWWM/e61d/yws5Ji/p8FCUXN4Ju2oIMUK
         s0kYA9Fyr6202fkLXeGhZf5t+OZcAdPjr4eqpFsfQp8cAcf21015zczy8oELdVIzfTVc
         CBWOv/pAj7S+HL909J8ETISk6gyRveOHOnTXhu5cCT39GNjJ6m6srybPO74czATHX8/z
         By1F0xVzwiZ4KvgEXsS4tcF7l+KWOA/nblM8galK628IlSydgWIPNxFWZCuv5JxGmhST
         paJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773355; x=1763378155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5UM79HAAHIicPV0NWv6rNOWHAN98TEegcQyYKNazic=;
        b=ZsTKk1zzJqDoRHGfZnqEGhJqxFaR0PgjuC6l0/YxA6xcChizpl1BIuZr+Fw7j1j7pX
         v5P6rndWF+y6ZL8Bp5BAQa+hValeec8cXsZM9Xks71LIaBaKQU9FRO/ukHyISI13WvZt
         Z0vD9kfjUx3Fhf5eVPAU3Ic0uTzWANIJ7JBMkv/dNk+Xd4qZWLYEtz6wAvffXb5wPBZ8
         b6gG+mg2OiqfIZLCt/YW9GvcHKdsZuxmJc3Nj6FZBw+dX0tsVAtCGFQSsJBcbnzlAT8X
         k1c9OPAgummpOYFmhPrGZlHPJxOIGMDbgWM1S43x47t/LKY3QOrYwYoiNnLxhBTg6xUU
         tZlA==
X-Gm-Message-State: AOJu0YxNxGwCQHKvzkTalPKsPc1WxdquVIN0OeVh+4bZb2VssUJ839tJ
	3/RLy9XHfT55lE2yW8dOFESpcBjpfy/46sPy08YITqq9ND+zhwVGWkyahtWfcIHjAGxkGw==
X-Gm-Gg: ASbGncuUOGG//fFyS9M3sUrRepR34ckmZD97ZKZlG2kd7q8To37KTUKcobLmEurG/Mv
	kiW3TtBfElSZyzyfjdhBlo7rD6Ds4K1Fre2Pr2jUWL1Qkhvov4120EsTo4SusNAlMYvMQGOVqCR
	mmq3ebNxXJ+I1zWo4WrQGrAIFaxNnqZ5yY9ocsl5JRea0HUJSaLifkU1SgWKfHWDvC//fV8/ftS
	mQ2KeUNcVOI6jJIu/xNOr5yii288OKjK15HEwcby92bUSCdBazuPH5YJgfzy4zhdJNGxSuH+m3P
	SEuOdFxG4/Z26bWF4zZ9fpMyo5BfXJWwn1zvucNYwkn8s2bAwXIHMOcBPz1stP7ejB1XjnSEjcy
	iA6C6025m0TNSF19Peg3qwcPdSNj+B0E8xD6ny5eLlAa2fmg4kRSpCO4tZPnjj6nHzGc0ew8Tzb
	2KS2wyWw85E5ay2rcbwmz/oM9PlFh7MXOYPxcwnBuyjuk1J5C7nydiFYWNc+R39vvh3pb+q/kGI
	Jkx8Md96U9O/po=
X-Google-Smtp-Source: AGHT+IEjLtEiLfA0BRik4Up0QkIhgTXMToNfFFWv5WaLJsyLYiv5BuYXwD8bGA1745nP5F9bpdBj8A==
X-Received: by 2002:a05:600c:365a:b0:477:7ab8:ad7 with SMTP id 5b1f17b1804b1-4777ab80ca9mr25279335e9.9.1762773354474;
        Mon, 10 Nov 2025 03:15:54 -0800 (PST)
Received: from LAPTOP-35JGH6FO.lan (i16-lef01-t2-212-195-130-192.ft.lns.abo.bbox.fr. [212.195.130.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce20ee3sm313657195e9.9.2025.11.10.03.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:15:54 -0800 (PST)
From: moraless.philius5@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Moraless Philius <moraless.philius5@gmail.com>
Subject: [meta-networking][PATCH v2] libtalloc: fix pytalloc package ordering
Date: Mon, 10 Nov 2025 12:15:12 +0100
Message-ID: <20251110111513.4067-1-moraless.philius5@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109164541.2901-1-moraless.philius5@gmail.com>
References: <20251109164541.2901-1-moraless.philius5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 14:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121465

From: Moraless Philius <moraless.philius5@gmail.com>

The libtalloc recipe did not properly populate the pytalloc package
because pytalloc was listed after the main libtalloc package in the
PACKAGES variable. As a result, the pytalloc package contained only
talloc.so and was missing other required files.

Signed-off-by: Moraless Philius <moraless.philius5@gmail.com>
---
 .../recipes-support/libtalloc/libtalloc_2.4.3.bb       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
index ff36a61d15..254d94064f 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
@@ -49,13 +49,15 @@ do_install_ptest() {
     install -m 0755 ${B}/bin/*_testsuite ${D}${PTEST_PATH}/tests/
 }
 
-PACKAGES += "pytalloc pytalloc-dev"
+PACKAGES =+ "pytalloc pytalloc-dev"
 
 RPROVIDES:${PN}-dbg += "pytalloc-dbg"
 
 FILES:pytalloc = "${PYTHON_SITEPACKAGES_DIR}/* \
-                  ${libdir}/libpytalloc-util.so.2 \
-                  ${libdir}/libpytalloc-util.so.2.1.1 \
+                  ${libdir}/libpytalloc-util.so.* \
                  "
-FILES:pytalloc-dev = "${libdir}/libpytalloc-util.so"
+FILES:pytalloc-dev = "${libdir}/libpytalloc-util.so \
+                      ${includedir}/pytalloc.h \
+                      ${libdir}/pkgconfig/pytalloc.pc \
+                     "
 RDEPENDS:pytalloc = "python3"
-- 
2.43.0


