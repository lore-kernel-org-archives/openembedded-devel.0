Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ED1CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:29:46 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15177.1792128584715228317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HQV4PJY2;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso11666328c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 22:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792128584; x=1792733384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COorwum8i+cpBVpvLX+RdSugqWexKYPnat4Ne/1APpo=;
        b=HQV4PJY2rpkJSfA4Y9Zmj7kx7ce1Al5wdbBKVf8HJraJeh5yI3LJ6T5pbL0Pao+d6c
         5D94IDTwzjhR5fX8rH1p1YniVKwwPV9pLJ3esx72pFmY3unOIYB5x3zZ28P00GAX/Vy6
         byCjEnOZMmsmWUaoEuoFuXH8UUPVTZOllzU9ti8G2J+s7M8fa4V/06O6t4cqPA7ZfpmV
         845rFnYRH0JZB1rU1gK8Z+WHEntzVakoklbKzXuCjxBC9bPsW/wgxGuRxRyiEez0CGMb
         mYCdsnlLeWnmSrZzosSlSsawE2YrFfid5ccz2cC9ou/p6t11Go7/xPiiKIJU+f2YqiKX
         vzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128584; x=1792733384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COorwum8i+cpBVpvLX+RdSugqWexKYPnat4Ne/1APpo=;
        b=eeg8GvAaSAeRaRnFXJnRq3redH5PcWfqeL8hf0vMhQpA0Vvu0vrXUFX0ckwESJmSea
         ly09H2V9s+Q9+AohV7GIBwTjvVJaHXctGeguoyGhYVCQP6hvI4UZ4De3TiIHVuWYSgDm
         TKUwQWI9eQYCNuSHqdAZdOHh6EiOdDl+SNqj0do8T11mVhCOL6VJ8tW1NJUpYEM6xYj5
         b5TAKhSrdOKDtP9vxM7ieUWt9b4GpytMcGn6Ml34tAvHGDHeZpULETlgAazvPT5MAqC2
         FLPl2LovBpWTYALQXelKSIAFQLKNh3zEdv4r1+lz8sWVtrQxiAOYooFfl+lubePci14R
         OKRA==
X-Gm-Message-State: AFq9FYJMavhfI/4zKatyos9f7NiWPosyaSFHexjRJou8F3X8g1m+3ztM
	53BEfLqPHV7hTLfLMJXz07g2/JWgF1kEQg4NH1x2b0NZzxTaVx1noDDq5qqKpSq+PBc=
X-Gm-Gg: AYBFou2zjW2MAs94cTAzPKF+yzu4bymnMYuNE04rRa3POQSlwg95tg3gK8YC9w9J4l/
	cm5dUm1yoKANgzYbxioBE1P/TAsBBUzVoSAgAFnpZlYLs2GGumnbjB5THLZFPJ+A4s3Q1GWD0NA
	xjE+sp59CBp0YuB+BcOFBxiuw0pdROinIGc7Uo7XlzrcArU4l0LvKH/xdRsSUn6sGzB3iMF+ukd
	uNSzWudy5k0NxMlpEBvD1ael3uVCdIWO5dhU+locUaT4FQ9xNH69sJvqFQYbSL97Y0RID7E2WXf
	fpBAW8A5SH7J46g/K8pWbMHv8hyRd72zwXK4wfXpxtTVTvc+NzLa55W+/LypEWl4hbz4MRuFVRE
	Y0sjjsm/6Q6Kq057shCApNROtLop1MreYu7z+fdrX4lqiUSiU8DYpcv7LJP5qyH2hrN4k9HE4IT
	xv4cWE+kABYhrB42JpiH+NNcJuPNZDLHJVoSMhplinpS8HIWcemUFWs2UFaFFP6KoJhwOgtlJ1A
	ceGVsSt/mYWZLj9BTFd+PJC5369x/7/Fu0q6Og9txhmGTbEdR0iyhP+87eKjU8N4XRQ+/yNDfPN
	QnOtLsoz9dSlf8sKPs4d4gtXh8znamcZ6sDCNwV9WosxawYMCHZz6o9/MPjLQlSlbspJOPfGO9C
	OlI5g2KvR87jT+1yYqHSj/N6JwuFE8Zr1lJL9CnyGS0uYtM/+K/PDNpJyefqWEJ5ohbDiv4gRbH
	H5CVdTe8LIgFNgbRkn/KaJpdsimwR9YLgw3MTJ6/N2LENvBA==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id a92af1059eb24-16a5eb5248bmr26047065c88.19.1792128583708;
        Thu, 15 Oct 2026 22:29:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm3132878c88.12.2026.10.15.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:29:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/2] meta-python-image-ptest: Give pint and pydantic-core ptests 2G of memory
Date: Thu, 15 Oct 2026 22:29:40 -0700
Message-ID: <20261016052940.1212651-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016052940.1212651-1-khem.raj@oss.qualcomm.com>
References: <20261016052940.1212651-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131053

Both ptests get killed by the OOM killer with the default 1G:

  Out of memory: Killed process 390 (python3) total-vm:946408kB, anon-rss:909840kB

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-core/images/meta-python-image-ptest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
index c5eb0b6403..08e5009540 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
@@ -33,6 +33,8 @@ QB_MEM:virtclass-mcextend-python3-scrypt = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 5120"
 QB_MEM:virtclass-mcextend-python3-pillow = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-django = "-m 3072"
+QB_MEM:virtclass-mcextend-python3-pint = "-m 2048"
+QB_MEM:virtclass-mcextend-python3-pydantic-core = "-m 2048"

 TEST_SUITES = "ping ssh parselogs ptest"


