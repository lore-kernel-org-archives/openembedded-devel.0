Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1925.1795113434874408286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jcHlqqr9;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso62689b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113434; x=1795718234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+va10Nat06hLrhb+hrnhXfEo/MV8RXQzb1QjDdaC71M=;
        b=jcHlqqr9eJ+05DD4mm4E8n6a93FtHPr4qAc1+iRxrayuHI8IFUArBPWQdo6aE8d98F
         ZB1lFEzwvHUwjYEpBryfFFoR2EOtTck9nYCffGbIpcZCsMLyaf3v8r2TP2pOEWsrarQI
         zvsl5RkPOUcUyEWnD7FWM2BOZM3V65Ey6QaJuHz8cvAcb8iJoZQgE1p8CFE3Dx/hP+eF
         U/UOqfZXOyGaWNeMxG0J0J729vHmCbiCtpOiHj1H35e6wmBOXg+9lxkLW3dC3KouzLNX
         M8I0Dzt4+EefFP8RAMfHXJssiwhNMi+YAQb0W48P2S/dbrM6+Eg6NQTNFEjWOVjZsedU
         7tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113434; x=1795718234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+va10Nat06hLrhb+hrnhXfEo/MV8RXQzb1QjDdaC71M=;
        b=EOpz4h8zsqjT+NeD6ybSniebra6jCawEVBlcuJXk9CE5j28tBI7UrRNLMjc5hUaQxY
         /6wqCKYdL9+G6phG5vVAVdPGYB0FRorMHvzz8xyOKqM/WqfdrlPXxS5QLTFRX2v/Siy+
         PNe+EkxdZY+vDOd81Kr1DDRXZwXM3UBP9RLa5cUID6Rb8i+o0/TllySH/bzlPFl6Ftbf
         zAaa0H7fiHvXfdkLAHpUEL7AfnwCsl5w96BQ7wUunQwuSCMa+QP0jHX7V5slJ/s47Mfp
         W9xKYUdAf41YbA8K01VQC7Wh2Rad1G3UOdawNllE4qaQ0jUL/2oiz+LU+bNOJdN6LKiv
         BzDg==
X-Gm-Message-State: APuU4Z8x11IlYrXEefZtaedZtSi4BaNuFiJ1vtiqkEP0BpSIdp/jjCO8
	zobFLFygjePOqegVXAM2z44r3lV2gt3sYS1f6GuH+F22S6sfy4SXHotr1kV3nw==
X-Gm-Gg: AYBFou3OP8Avv74tVnpKSrzG/r0qZ6pI89GQL/yM84Ffd2Mcdaok7j2QYLdXnDKDQbA
	M10qdfhZmWPm40r/PWzFShvAaWPyqlpGLCdRkEVGqXBmH3sSlYNRM+viDAdyczECrwM5u0Vf4TE
	COye2gmaCGU2pLEKSVkyY4FVA7jQj2WLTLuQfsiZoOW6N1QV6rm2xVxemxKcOu08472mF4G1SaQ
	1p1im2tOenxqbOM3GRTY/g48aGOFjCdr6AgJBsMC8dsq2FnTbJcDtqha4S2A9KumM7p03WhWuyx
	doP4KQUKslTIMk5eN+1Tj/0YwHfAO7QL4MNh3Ty2knlZyfok8QX8eVIOcn+OoRDxY6vyxg4ATb6
	Wc8ZKJMwDKPmOs1tDLQGqNrfHG/zGy0y104kMjzCN3NGt72iZY0F1qxvaKfbaEf7sQnwY33oCrp
	g24vQoSJV81QKeHSTvJL+QbWXwrm6vm3Cm8fs+ymhW3CKY+VIAWAfiNw61L5W8TWzEvf1b52Kth
	5KB6/m57rD4aXQpXwXkxKElCL0pKNocFKg2M/z+EyVR6/oDDN9L3cSGjnChCZC73eNEqJwuX/O0
	4SshGUUNPUv2fxg65a2PqsVAz/04HYYWAJ9QOj1OM0ZOklZyB5Ry8bnhJe+fiA==
X-Received: by 2002:a05:6a21:6b0d:b0:3f9:1898:5765 with SMTP id adf61e73a8af0-4014a276602mr504921637.9.1795113434164;
        Thu, 19 Nov 2026 10:37:14 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 31/64] python3-django: upgrade 6.0.9 -> 6.0.10
Date: Fri, 20 Nov 2026 07:32:59 +1300
Message-ID: <848f1a3d8cc29826cd76f40979d51901759be515.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132721
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.10/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_6.0.9.bb => python3-django_6.0.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb => python3-django_6.0.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.9.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.10.bb
index acdd2c21d0..e2ac220b86 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
+SRC_URI[sha256sum] = "6005d030df924f85088454c18bd35dcf082b058aa355ad3df520d8de9aef9f41"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,
