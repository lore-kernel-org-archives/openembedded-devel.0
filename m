Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D099EB48F3
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 09:56:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42031.1770890188015655263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 01:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNUTqber;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee07570deso57814155e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 01:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770890186; x=1771494986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xExKj8rNLiCgGmjp1e4K3eizYKtbAFtlXWeJTzGAnQg=;
        b=dNUTqberjUbDgGoPEmcDCyPAm1IVhXJk8oeZ7aaD0p5/93LnD8kw54r2epMG6iHViv
         WFXiCdWwtthOBd/FWmH/ojNP8bk7tFZ6IPDzlDqbJKho07DKS5GoPw8bGSMS9DtUTn22
         Uc7vR0mIRWQcLs+xaYjonDcPOgIi7qFukRRksFwL7+G0+8CmSUR9RpfkQnNkdPSjqtxZ
         q/6ihL8scZHmuat+QlbdiIoQcHoFulsThXtBhtJZnTdFUqf8IR8LuGhNRJIDoUh3O33X
         lrALq35J0GUvlf2WzYfoJkoOj3AWdyP23haQkbC/p5q37Qoaafse//F1cjk4TmijqTR3
         kwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890186; x=1771494986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xExKj8rNLiCgGmjp1e4K3eizYKtbAFtlXWeJTzGAnQg=;
        b=qLAxZexnOPzphWwviT1SmKaLRarqMg260yS35PPpJD8u9sJSXG+QzmIJM/SV9cZFc3
         hLXgCrNQeRUPl9SySAWJUxCnbOueVtOIZjMhaM5EWS6F7if5eEaEMwMtO1XgnMfH5VxE
         Md27qmCU5t6unfEzxmqKgka5Bta7kzcL7SndR67Jr4xDTTaG5EbjV3wUptVkQfVRc8P4
         h4T31H++onVbVDM/QHiIvpbUse0CgrmlZ0XO/QYO2hwxN0+ArZ46hh7xUDeya4lVIvT6
         XoLYqgip1cLebMKqudjyaVOHj5/TMhk3VOOaLdDUU3HsGIbV1rfN9drPsq3jA0iGhJ8I
         Ib3Q==
X-Gm-Message-State: AOJu0Yw7hmINZ2o9AQjjfxUb1F0dRGLFUEyX1T5T7VR0x7qpxGSZQEUY
	KS8BIBSVuIrQmHYrp0buxWzL1Kjdz22v/YtkIucY8QnJQtaC0kQWDsEI8ZmORw==
X-Gm-Gg: AZuq6aIvfJsFoSgXjLt/Oe7IAFt1Toq0uU1NRsL10xrFaO0qjuDvFie0bZyup+lOgHu
	UM1MGirJi7IM3klfnYCdBZ721s4+NJdSj7CK1fkJYLNyd4KvA4WSUewDxH+THsDkPdL6trG+dDo
	FmMob6QUu6w6+oCO+7Zkfd+/NEAlvTkHFE6Yfdbgs35N68Pi1KZVYDnU6pV+ef2Whp/l42E2Mie
	TKhZVZFwX777xQ3TldcHF0nYGPPIc3pCud0ZRj8g685oeKaTLJ7CszhIS9pfTJhkWpSumfuDnDN
	TW26FgbQxwNI4294YFYTZXITsBXUasAFbdkFeTnROe1cqgOpbxAFdQGHjg7LueDtjpljgNN+zZC
	BvGW7d26uf8+8vT9RkAobUDnmcs4Vs+1U3ErHBlNReThSmOnqbtQwxcTGlLXLcftjrqrHWYqhXk
	DuHpDXIu3LSCyWioL7f6jf
X-Received: by 2002:a05:600c:530f:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-483656c5583mr27812735e9.12.1770890186089;
        Thu, 12 Feb 2026 01:56:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d8334a8sm189423995e9.12.2026.02.12.01.56.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:56:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] nodejs: fix gcc compile failed for 32 bit arm target
Date: Thu, 12 Feb 2026 10:56:25 +0100
Message-ID: <20260212095625.2897394-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124347

From: Hongxu Jia <hongxu.jia@windriver.com>

Use gcc to compile failed for 32 bit arm target

$ echo 'MACHINE = "qemuarm"' >> conf/local.conf
$ bitbake nodejs
...
 2645 |         );
      |         ^
../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for argument 1 of 'vandq_u16'
 2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           |
      |           uint8x16_t
...

Use '-flax-vector-conversions' to permit conversions between vectors
with differing element types or numbers of subparts

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe7aaabb1c30cf263738dbf5df927650809e8074)

Adapted to Scarthgap

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
index 1bc5a6e9cd..5882319804 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
@@ -43,6 +43,10 @@ CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Wind
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+# Use '-flax-vector-conversions' to permit conversions between vectors
+# with differing element types or numbers of subparts
+CFLAGS:append:arm = " -flax-vector-conversions"
+
 def map_nodejs_arch(a, d):
     import re
 

