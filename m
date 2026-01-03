Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD913FC6176
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21541.1767430120682839247
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 00:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kTlJzFZ5;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso14431945e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430119; x=1768034919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awKsvZFs7UMjaKiH9AEldbvZuxchOQzDOMDsiqLWPmw=;
        b=kTlJzFZ5dzNZT1E3sHp8dqZVrlT8kYUwBYZWTWI6ko8jlLoGqNIkstzzdBTsuQLlSG
         9zon6E2taEkNmXq2svoLquKd/uTRK4KxXdqvMVg5hmPd+r1ICTfSNiQKvk+rIejUmh8i
         WwXKSv1kUoTfigOczSYzsqzg5zz1JYhRenG6kLkq8dkw+P47k1RjBTi2AwcAVEAkmrv1
         byEN84w+zdDrgDPfmjH1QleEioblx8hHmK+63cIOcMlRRPNCnjxNG+Krz5vOuiYwRP4o
         dQ0rZIXrOn2rKBVfGeZTPwxTTeM7j0hj7+tZN0NCS0p5W6zItj88L2tL/8fcvfS7XLjR
         gxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430119; x=1768034919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awKsvZFs7UMjaKiH9AEldbvZuxchOQzDOMDsiqLWPmw=;
        b=Vx566Qph2X7LWTjqHWQnXpU+pIJZXRgDiWz+38NuRx/9mGm0KQIh1hDaXBC2dx8rUX
         NUMzW7Abo/bYbJzRa+ypXsurN4Np2Ok9UxdTTKSsUC0eU1kjktU9etbcWBgvJ9EXekno
         9hF9eJ5+dUjDI9+nOZefSCWMPuivTf4i6aoSBRnQu3Cb80kEQhpfF2S837dWwtpvX42d
         NJ3edQRu3d5bowz3udkhdoD8IfcxfW/yeMSretelt0+cTJWqNHOkxquopTKfsSk4pNc6
         3BCflgRvl2K9M2vFmaOu327GA04ctXHgpjGeqTKqv2qoDwR6XaFIUSfJYCURa9h0nkPw
         xAXg==
X-Gm-Message-State: AOJu0YzycXJbAuvhgk+L82iqsuGkGYAk7Zwdk3jFEwe/LpcmQjAW+bHg
	mHF2kzPXx4XciwMXVrNWqBWf1SeOGb8OrOyjcKWCAA6/o3cmr/p0UKcTBrh0Gw==
X-Gm-Gg: AY/fxX50plgPw3R2YaTUcs5/d8KbohvBN2pvgXZAYWnroeiHKty1JN5Qror0WSivqY6
	fhhwfTy5PUo2jlTLJsNW3blPvJmdl2KbxQMTlPV6XzI8XvndmVpJjKPNc8pirN1jl7Hwc9480XX
	6GETXvcrdZkNAu5duwt4rQNMnVBn8ABYlm4fI+YIacVXvj3EDFom+pzyHd6DqLY3A1MIcuy06Iv
	3VRQ9RVcEPKozQlQ4hCAhPEKc0jpkwZQFAmXDqixE2mmM2xRRmZ59C/ZwQyuIGe2yyGfaayWp27
	x3QGGGb7MdY0ADQwQnIPhfItXstKwWT3CtFFv4NGcut60Bx1yTE0bqkr2tjm21LNyK9zZYLHUwf
	FYkVyCw5cKrQCuQIzdgcy08OspEicNM/qeLkSLkIsGx2Kx1TxnieFBxw/qXxaoDzZjXmGR0iWU/
	kmNPjZLPZm
X-Google-Smtp-Source: AGHT+IFuJ27k5MKa+7d02WO1TvUDOd+ZodVwnGjdRK1QfFbY3QO1BzEnerxh6DeT0sGU4W+BPFo5hw==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47d1953dabamr541249285e9.9.1767430119045;
        Sat, 03 Jan 2026 00:48:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13ed34sm26491645e9.2.2026.01.03.00.48.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] nodejs: ignore CVE-2024-36137
Date: Sat,  3 Jan 2026 09:48:34 +0100
Message-ID: <20260103084835.2022951-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103084835.2022951-1-skandigraun@gmail.com>
References: <20260103084835.2022951-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 08:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123102

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36137

The vulnerability affects the permission model, which was introduced[1]
in v20 - the recipe version isn't vulerable yet.

[1]: https://github.com/nodejs/node/commit/00c222593e49d817281bc88a322f41f8dca95885

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 11e9717c6a..2a7324a203 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -49,7 +49,7 @@ S = "${WORKDIR}/node-v${PV}"
 CVE_PRODUCT = "nodejs node.js"
 
 # the vulnerabilities were introduced in v20
-CVE_CHECK_IGNORE = "CVE-2023-30583 CVE-2023-30584 CVE-2023-30587"
+CVE_CHECK_IGNORE = "CVE-2023-30583 CVE-2023-30584 CVE-2023-30587 CVE-2024-36137"
 
 # the vulnerability was introduced later (with libuv 1.45)
 CVE_CHECK_IGNORE += "CVE-2024-22017"

