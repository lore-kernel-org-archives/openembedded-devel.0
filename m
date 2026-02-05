Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B190EE91264
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15253.1770274801761369010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CYvIMSRx;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480706554beso5682615e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274800; x=1770879600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXTiWNw2pjY9lKP6w5IP4MchTQthCFmptOjdxLH1cXY=;
        b=CYvIMSRx0+pIvIfLYo6NyREuWx6h0JOGziIdDnFUl086pXWEUI05KzRANupFhIYU0L
         phuNrzOqBRmnhBCdrIWKuazbfPFpBsH1v4DYzgq1Iu8712se5d57yODADAYHFtGAH4LJ
         NM/aADPm7jf5Vlnj+SMxCTZas0GvIFzss7BFTUMORwuOiW4BUHljUYRjf59heDx9AUcN
         QJVFNEruOvMHwWUHWzM/h6vv557AH/P39o9KFn+hKr426uPDLJqMgh/5t9xP6vx7C6Tq
         a7ipy8DaCHtVKY8kwiuVgH8cULRkyP5t4HRShjyKkE6q8sKhcO/5VsAaph2fNn+M99jK
         8+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274800; x=1770879600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uXTiWNw2pjY9lKP6w5IP4MchTQthCFmptOjdxLH1cXY=;
        b=e3OmRkRLutfYyxxYO3Wxol3W4W9qIb8+k1Ge+n8Fk2zcvpDR7YO0TY/1dUR0si+Kok
         PKOUje75zOSFLscEIE+ygR38Ep50qF3Z/eKBvt2IcLPbeBu8u33X3LgnUaIR2cstbKmT
         gbfUtQjagiI/mg+nsnSqA+cVB1XJj6r7Dfw2PXtc1UxWsqQt5T2cQSGbXGU0TNOW4/w0
         A1Dv8rAmS73mI3haqGBOzpdufsVWFklGlF+x2OobpLVp2NXdAq47eejtRpTG0JKl65CZ
         WFqbFarMEpppy8jGyeJSciEApsIg41ER16P++4lJiKx1wy3s93RP4TJkcoEYM+jxpGdd
         L3pQ==
X-Gm-Message-State: AOJu0YxX3iglqYrBVWbGdzf0fmTOlR9ctbDa9X5/pBEsmx4/vFIOMzVi
	XikUzFlZdfsV8X39k7L8nwlm7SsaRyJulSKa4dmgEW498HDZLEPVeQM7iUWX+A==
X-Gm-Gg: AZuq6aJiiQuYrSJdLWmGqTkk0sY98bp/AooZOe0Nd6wxz8Anqpn/Jf9XXCF/iwdIR2g
	O/qEhz3Sgv54HdBDhE7OFydI4GxPAlJ3yyQTrmBPyhe9QuA6+og07udxRjr/ZG2eX+BlZ8IF0L2
	C0GUvJyUkibJH1pHtn3CTRCf97bYokbnZmuwrB1FZGbXx6v9KhtGTwS6ezpZ+0sIXsPHz12q2Jc
	BV3SBvH7AmiHW6XD+E1RFwP4EF5HX6Qk2aVsQ4RTxlBdiMMv82T6WUJbzSN9ujXOgCoDShe639w
	DdIXfH+p1vhJ9ybOlH/jNC3RdM46RVimd6LdJ2uskf38yqEUSlRuok50ZILbEwiVblPlM1Gxqzu
	afe6QHhnOvTKKlerKuOMggmZzwMVDoL/GWrOcUbcPpdSiYfFjHOHcNaB4QggU8j7iyOfPkHC/Tz
	s3lxqA+vRrPJQgAYI3luU=
X-Received: by 2002:a05:600c:34c4:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-4830e96fa56mr70061945e9.18.1770274800054;
        Wed, 04 Feb 2026 23:00:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.22.59.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:59:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 05/20] python3-m2crypto: ignore CVE-2009-0127
Date: Thu,  5 Feb 2026 07:59:40 +0100
Message-ID: <20260205065955.1267785-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124181

Details: https://nvd.nist.gov/vuln/detail/CVE-2009-0127

The vulnerability is disputed[1] by upstream:
"There is no vulnerability in M2Crypto. Nowhere in the functions
are the return values of OpenSSL functions interpreted incorrectly.
The functions provide an interface to their users that may be
considered confusing, but is not incorrect, nor it is a vulnerability."

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2009-0127

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b46a5452a1c1a417f2971e494e151fa1f4022e36)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index 9aac7b344f..efb6c79fa7 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -12,6 +12,8 @@ SRC_URI += " \
           file://0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch \
 "
 
+CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+
 inherit pypi siteinfo python_setuptools_build_meta
 
 DEPENDS += "openssl swig-native"

