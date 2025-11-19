Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38625CF34DA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:43:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10122.1763567023612870797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gS/66v2N;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b55517e74e3so5312488a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567022; x=1764171822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XubWJc868TI290x1iBzjHzvlgcRlS5IzfngoeA+xd7o=;
        b=gS/66v2NfnzHt3qJvxYZyPRLK8QQ7XIUkopr6HMZU3z7kfJCl6skZF71tRLPADIn3K
         715z/BnqLIV0EP48pCVYgIuuMU4n8hJd//str5WkmYnEaDJRe8+24J00DOx8Tg8poNmt
         6zRfg2COAZSwcnC0IVP8pKIbOQ2txpS/Y3je1FOn9MYX2f0S3ZS746e4pUV4hMd17Yks
         qVq/iMrmYEx0ER91WQ1GOjlWshGMeAiuNo3x8ySQZfzy/I2OLPHkAKIyCz/5G7FttWVR
         A5zPEc7MzFctFtVV8d0hRcIc98ytYb7P3nQXgfKklhv2GmXcGjfY3t+gyoNtD5yBY8Kk
         xrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567022; x=1764171822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XubWJc868TI290x1iBzjHzvlgcRlS5IzfngoeA+xd7o=;
        b=dJUbOPC6si9hALoCsqE5xUyOQl3kwqdisadZKVXxcYekGdzjAYZY9lu81wJoCV6fbm
         xqXxdMaWVbopQI/ZZd5pyYLnvPa8C7ElaR4iFa7HWaws1DtwuDwEOmwwNd9df6sW/PYR
         mIPf+bSZY040YBiIQbYlJkAQP1agq1SVT1oOz8Os3b6/xYcBCokETJHvu+N1hwKnEaZK
         qeICOuTodV24exacxTng6mkeCAueInHgfxIrJu3ZkQu3lPApjEyUfkz1hVhICoc+7mi1
         E0hqmtNqlLzDDaGNls3sxocdqgkww52nnZpEXV4D08lvBYUWtQKFeR81X/JkgvD1idms
         wQOw==
X-Gm-Message-State: AOJu0YzCQXmOTe6Q7WVnYFC1K975GR520zCsVP2O/r9HeVB48SbsqaxZ
	1sjg4O6pH3GfanmHzvE8zusi4toJTCXPpOTKjmxVZrhNYKHFcAxYjeTzZ0S6LGmy
X-Gm-Gg: ASbGncuRP2tDJBrOuZPkZno4G+MYmtRbQU1xcTvaMpqeuhOwOUMuS1na16Xz/Bpl/J3
	7RPAyNfcVhr++t9td/sWcxHU30xe1rJgjigIRgIki4y/jV4f9nFQA3RTtJnbp3gU+PQ3mnwLTak
	6b4ChtJF5Xnr1+CHwBbwopdXn9HmYlpJGJnc8DwmzwXYRFi7px556/k8hsbqBF36Ecl7s7d3rId
	2eQbNlpsPqNCFq/ky0dNYuL+uF630BL9gU46EkQWHzEP+m3KjnaCyAtOCjZG+M9MxKMfvigQxEY
	iALFnNNG5a7TJNA9ejIHPugAYxTe8Fex2nSfQdo6PC3jZQjY4HP5Rz/lrw8ksfwGFAfwjga7rck
	lAdA8u1gVmjFF4yIu849OyibC9aCzOdJmj/HN7whCu0dlM1hs/HrsGfmuV3Zqq7zXmcArrVR+7m
	IXPX5D9DB6evXEg4LOBWlfTB3qqoHR0x/uHQHV6WYm7N+kOtwVOPlaCIJdE5YKRB0YlSakG0xr5
	hjL6HZISLd68M0N6PqvAOaiRK0bxIseL+653cbyV5g=
X-Google-Smtp-Source: AGHT+IGOmJJw/MnAil2yUU1VRqrUh39s6XvpnCQqGgRfTdk2SldE3SQKz7L87US8It8r3N1zRlyEaA==
X-Received: by 2002:a05:7022:439e:b0:119:e569:f62e with SMTP id a92af1059eb24-11b41708257mr8578601c88.39.1763567022215;
        Wed, 19 Nov 2025 07:43:42 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11bf23d6967sm34176687c88.3.2025.11.19.07.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:43:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 1/2] libhtml-tagset-perl: Fix failing ptests
Date: Wed, 19 Nov 2025 07:43:39 -0800
Message-ID: <20251119154340.3184696-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 15:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121908

Add missing module rdep for pests, fixes
Failed ptests:
{'libhtml-tagset-perl': ['t/01-populated', 't/00-load']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
index 802fe050da..f7e394fbab 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
@@ -18,7 +18,7 @@ inherit cpan ptest-perl

 RDEPENDS:${PN} += "perl-module-strict perl-module-vars"

-RDEPENDS:${PN}-ptest += "perl-module-test"
+RDEPENDS:${PN}-ptest += "perl-module-test perl-module-test-more"

 do_install:prepend() {
     # requires "-T" (taint) command line option

