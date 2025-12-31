Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C82FEE57DA
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81872.1767167687052034142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFQgJtWk;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so69211335e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167685; x=1767772485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IXZU6Z4Ls3AcNVqt2y/uR1d9R0uadTGgDDyFTr6Jhw=;
        b=nFQgJtWkRcp6tBy4f2yJ2lETyU1geKYbM/pVvJTRl3huUgZsEII1EXGNofsNuX/GxJ
         /IL9r6vJBQqsaD7Xs0gEY3ic3Dp4VZjT3ENFIhuEjAUBEQtn8cj/TLJ5KA38Ip9futP6
         k6hcqdFGviSUMsZnTsEbEgrrX3EqIPOvWzi2oGjbdtOORirIU23CNun7eJMPQeJY6kC+
         eyTo+3yhJ6Z8G7wUFmSsRbZ3HT1yO/IWb+4DucGA0LFzrTPmAE/2jVpSFKYzFqGWEWPS
         3jYo50i35I77GDjjKwJyyfApS3lwYd5Dyjtzz8IB5M70E6Dx5XFSgc7l74zEzu2uAp7/
         m1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167685; x=1767772485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3IXZU6Z4Ls3AcNVqt2y/uR1d9R0uadTGgDDyFTr6Jhw=;
        b=K51IM2rtkrNzi42GRX5ohgTqH8kfLJTQ/dsQUG+Jj0Qx5XeWx9albjattmoduwtztJ
         Zlq05xy8oAnmujbxTdz3GLuiok9bkUPwCw+0AZxwr8INvlucxp3brg72Luf9ywC6n9Mi
         gxcTWwlVV+bbGXVpJGVGOCLvLqr+jku//OL7bpwH5kd995HQxYD+jKt/1yp7iDfM6Woc
         8C2/DrAuJ4C0O0TVpbSGIy8s2aaRz7LaQZB792JfrYqG0S8GMfxUZEa9YqYe3yW+jlMI
         Y3zPnDrOptTA7JIVzFeDOFe/lUd8Mlm5mNTFaYFwjciuDFTwIdJnCdRN8Rdo7RXoOYyu
         RZsw==
X-Gm-Message-State: AOJu0YzN6OZKcNgs5s5YLKaRTdYhg6iuZALK2kGTZSyWLva17TUxW+3r
	OdtjbEG7/9xBvpiLaMaudExDWyjTAdyaGKsFLx1pov9o4kioNgdjlDMAI18M5w==
X-Gm-Gg: AY/fxX6yuGGkLw8DMq8u6mkFmqUFwGYeUXsS+Cz52FLeJEWlOoOwTTcPfcpQCc+2YUQ
	0VJGuqjkmjGbvjkBT3umAoy9chDa8/J0CI4JsXH8aPHEp4bh+cucdcWFXFQ4PT2AdsaDUZ9Ngw9
	vW7apXn9RImrl+GFYTBBcYodzDB3qbAOGN/HFnMBIVD+0Tn2QwLU8u+JrZN0L4q+AwCWAgkYook
	6KM4XCYp8Y9tDP6bWi1KEfwbfoAMn9S0T2vcetaRAtQDvJot+K8CFqAfdzswXiL321lplRb6/5N
	F3/DmIXzOA2CEN9tDwerlYK7BLC+JYWzoP4RaSaJbcGZjesMT5N0UieOQej1NJlcTr1oXZLdWzK
	dYKVKO2WfU8nrCoUeU39isoiKd42Ri4m7aUcb0GXG2yNSaJqgwIaNFbmlDAiWyaXbYL9Fr96zJ3
	fDJ2WNL6APwYGr1XZhEiU=
X-Google-Smtp-Source: AGHT+IHr9Ouakqnp5a4glRj9296uOp3k/8nQZO9ZxMe0fxPqdWFjYbz6Zl+o4gzZxwQqCM8yWBaarQ==
X-Received: by 2002:a05:600c:4e42:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47d1958fcbcmr406240255e9.27.1767167685414;
        Tue, 30 Dec 2025 23:54:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/34] python3-pydantic: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:14 +0100
Message-ID: <20251231075436.771395-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123052

Set correct CVE_PRODUCT - the default ${PN} value doesn't match relevant
CVEs.

See CVE query (n8n vendor is not relevant):
sqlite> select * from products where product like '%pydantic%';
CVE-2021-29510|pydantic|pydantic|||1.6.2|<
CVE-2021-29510|pydantic|pydantic|1.7|>=|1.7.4|<
CVE-2021-29510|pydantic|pydantic|1.8|>=|1.8.2|<
CVE-2024-3772|pydantic|pydantic|||1.10.13|<
CVE-2024-3772|pydantic|pydantic|2.0|>=|2.4.0|<
CVE-2025-55526|n8n|pydantic|2.11.7|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
index 13035f4808..8793e76aef 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
@@ -16,6 +16,8 @@ PV .= "+git"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.12-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
+CVE_PRODUCT = "pydantic:pydantic"
+
 RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."
 
 RDEPENDS:${PN} += "\

