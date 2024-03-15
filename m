Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28913C54E6A
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:17:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.1882.1710523018334745688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mtm/adIa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413fead1b46so8325685e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710523016; x=1711127816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgHX/dNPuqvPEx+niDsgQSMWK+LrmMga5bVKHiJT2zo=;
        b=Mtm/adIaI8o9HUy/s0oTVTuYZXFsvr4irChAu+o+qL++nSJ4xhz5vPF71CkdD/w/LA
         VUF9nTJp0pmP3+skQXDFefkmiv1QItUQWHzO4LCXURRrxRB0oUDlTHqfPdQh/H3nr3yy
         SqPS7AD6KOaLev5dVjp6/OK7F/YSuxPx23O6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523016; x=1711127816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgHX/dNPuqvPEx+niDsgQSMWK+LrmMga5bVKHiJT2zo=;
        b=r3UDk2WHfEk8lEhmebndnPg2YBJ1iI+hRlTcT60dUdxMYlImitUWvqxxIGI1OBAWTO
         r9+0bHtliA/kqhGANm88Vg8pj0emHNu1FwP+5fLWYtV3WtpNu35n7W+7X6y3LXQ9Ri4q
         7pOHUwB7uHFlh35NtDLN80Vor/mv1hL3RC4C1BPa589z4Nud1BuRTDMqg18A5UfVoxu5
         +jVZof2NjA2OSSUkFGB/lNlzEdW4ig0ew8kEpbe1xL1mnn3vx3CVGikeCbK/hDAyfON+
         nU3xYnZzCJSy5fFiEg8IaWDHBJGlq2+ISMUP/qKGGOBnL+DqoqHoZqPVmjTKbcRuEocR
         6tXw==
X-Gm-Message-State: AOJu0Yy2XuRde32DsgjWPcIWVEBOT1Upo70Yd/SnE7wpYVSa5+X5dQFg
	abD9gu3KrzvGmpK47L5efrmhMb089cLHdrXbbde1naXqjGeH9JZYrKCTF+PixA6V4kZ0M85J3OA
	8
X-Google-Smtp-Source: AGHT+IHlSlumRplmGABbldnAnbk3fUt/xrA39i5aMpL4KXYF2FgorgDbQK+fVdxlUJDetKoz4ca/BQ==
X-Received: by 2002:a05:600c:1e0f:b0:413:f034:da6d with SMTP id ay15-20020a05600c1e0f00b00413f034da6dmr4374337wmb.33.1710523016129;
        Fri, 15 Mar 2024 10:16:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f03:430d:44b8:f326])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c4e9000b00414038b4d64sm1731678wmq.27.2024.03.15.10.16.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 10:16:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH 1/2] imagemagick/lcms/fftw: Allow nativesdk versions to exist
Date: Fri, 15 Mar 2024 17:16:50 +0000
Message-Id: <20240315171651.3850535-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 17:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109338

These allow the use of imagemagick in SDKs where it is useful to perform
image analysis such as on the autobuilder for screenshot processing
during QA testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb              | 2 +-
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb | 2 +-
 meta-oe/recipes-support/lcms/lcms_2.16.bb                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index 33e8279880..af7117da7b 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -100,4 +100,4 @@ RDEPENDS:${PN}-dev = "libfftw libfftwl libfftwf"
 RDEPENDS:${PN}-ptest += "perl"
 RDEPENDS:${PN}-ptest:remove = "fftw"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index dcc951bce8..6ab8a61b9b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -52,7 +52,7 @@ FILES:${PN}-dev += "${libdir}/ImageMagick-${BASE_PV}/modules-Q16/*/*.a"
 
 FILES:${PN}-dbg += "${libdir}/ImageMagick-${BASE_PV}/modules-Q16/*/.debug/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
index 10c1994a7e..8135f83a05 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9
 
 DEPENDS = "tiff"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 S = "${WORKDIR}/lcms2-${PV}"
 
-- 
2.40.1


