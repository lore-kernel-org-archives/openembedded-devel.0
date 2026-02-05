Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE10BE9126E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15254.1770274802465659569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aaWZIO+0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f2599980so6284915e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274801; x=1770879601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAMPhTyEzWHx55EtZ3j/R2ULytfRA7O/P18rCJWXZPQ=;
        b=aaWZIO+0K1kdQAw79lg5cTTHNXaM/KJq7o0og+u96FhJ6SMsdNYgsbPSZeRCQ7S9lC
         zEHwXzOcXXWg6qKvjB6njzDKCat+U4vFySQK2bZ4849ghWAlR44gq34ilWSvbh0Av1SW
         LtN4DQ+CiW6gQZdInqvTbLZsoGprcGkuzdeb/Rao0lIE+dcs0iTG3NSD5TMP/FFarjR0
         +LHv/QrksxH0BmmYD9z1xdtey9rbdxQ+aifkCtdoupAs9SrIvC4Y4gaAnRFg6J5htJT4
         lAeRi01ZA2GvtpSI7N0/JSgaDWP6V1BGmidMf/PSHKOls+ePPVIOx2pL99/fh/nyQfm4
         HPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274801; x=1770879601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IAMPhTyEzWHx55EtZ3j/R2ULytfRA7O/P18rCJWXZPQ=;
        b=UfU6V+SX6c+uhi04W1iM/mU0uREBFVXGMoLw1BI53YjgvPjYIiMKvCkMjj3Sm67fEe
         KvSH9ZDCwyfCdDfngsQ99G1uAg0uC8JlUbYGuJR1SlF7VOHEpvq0URpEhuIeSHfuG6ZB
         Y2S3AW6d41dMAG++BJ156A17pY69y8h25rXpeOMHCdZf2CxACnfr99muK9T3TY+FPIrS
         jniEFWMVpbTdPn/Cdf+hP2dNqPlZhEUj4Ve0FbgM1OS8vrIS9TGtwKiNLNuh0TophQPN
         M4ycDGIdHeicc5YKTNIBqSpqInQ9irjX5+ey3WNWzlZPf5JlO+pEu1BaJT82qGUJ73yp
         wpKQ==
X-Gm-Message-State: AOJu0YyoIR5DV8W550tM0bvn1CQkBXmwVpjCZNSLYLbC1aI36dafoJai
	3oZPxkChfkHZvWifJGprW1npUwvqDdVbhhzWuUw72n2+wMeeCLAYR4rU6j1mmQ==
X-Gm-Gg: AZuq6aKXrmBxtc/vE4pus0IODCWdpPJJ2ywZzo3HA2lpsbv56UCdv6ml0wMhXCNl9Rd
	SJo2MTOixPVUuYqROy3Z+iypkwRtrqLu8X5r93j/k+mY0vxDKdEdHc1IC1MFR8wmKPmKlTt1UK8
	2KBTXGcGyebOYTveLzjM71+bF+LsCEf7j7Ly7fu5fJ5XWz5MCE8GxMl7oniY5U77ELj3l59T/qM
	msqM5Xa2Qu7z1VXQHZJUR2yRBnVr4aN0MqLxScpi+o6R4k/+AibynHhPvDAS+3zeheP18LR5GZm
	H3YLZtHYTZzMRnCuyqr7YznvK0I0HzPEgofFsgy2SViEh5KxriALZKboJZtIhpj2Age0WD44cMj
	5SSCpy97kMLiWzCHl1KaB2DRx1fUAa07BBOP59MEeL6RsX6rEweNHmxkY/OSWX66N0KB69XO2az
	cGvGIdQXuf
X-Received: by 2002:a05:600c:1c1a:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-4830e93ea4emr70201455e9.2.1770274800697;
        Wed, 04 Feb 2026 23:00:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 06/20] python3-m2crypto: mark CVE-2020-25657 as patched
Date: Thu,  5 Feb 2026 07:59:41 +0100
Message-ID: <20260205065955.1267785-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124182

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-25657

The commit[1] that fixes the vulnerability has been part of the
package since version 0.39.0

[1]: https://git.sr.ht/~mcepl/m2crypto/commit/84c53958def0f510e92119fca14d74f94215827a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ba6468f7a09bf8e268ea5ac7939925c362ead876)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index efb6c79fa7..e534d32028 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
 "
 
 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains the fix already"
 
 inherit pypi siteinfo python_setuptools_build_meta
 

