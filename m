Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6262.1792499554037853669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m1/p7IRX;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32428195e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499552; x=1793104352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xi/kHPDugi2hBQGZiWnyCyukelqUW12xDATgeDu7wCY=;
        b=m1/p7IRXKW+X0+PMX+W1ezkhD8DMs7wTOdTU1h8yRX2dDI1yyST7XTQGsA6ET+p8kr
         +mzXarEcDEOINLYm20G9A8z6qEvSKKz+Q6D3HlbD9m4secfJtwD/Gr2Z8NcBC23Vur7f
         DfOpMMCpXiYVRf9iyeBQY34W3mo70+k9Z4rSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499552; x=1793104352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xi/kHPDugi2hBQGZiWnyCyukelqUW12xDATgeDu7wCY=;
        b=0D2+5FV7DXX3oGHpEIPUH+jxduMzQrSZbLdrrInhXiHPPRYxKmoJbtzcd8LrGr/HST
         +mCbxhg50mqul5mIjtI+ed0gQ3ZLTonJb5uYQJsOuxxA0lVdBnaFezHOpSLmgxfKheLo
         24xP1sOwvN7hQuiRbe2zKhx0PSXeVNZVw2qTH+1mFErPAqtMUxzf2XWReQ1ql5qKt61f
         ZmD4nYUlyVEv7SaRgk6i4l7SkRrq9c5kn0IjbqY3vXetnh1UMjVF214nS4pdvF77OZm8
         oGHUUR63s8+u3a3rDqgIs/fymqu/TGoLTEIvFyxd10iPJWB/lmJrpOYiAIs32JIhAaYb
         X2hg==
X-Gm-Message-State: AFq9FYLctQawOhEszWeVNsCUmQr9oE6Pgfg9K4Jyt4xHjNUsuDWnPTI6
	MfV3qNqR19+GYYbXcExuLNIbBXEZPXxLH0kI74SjUN3GQxyrugtkv2TaLAjnDT4sTFbsTEiKob7
	jtTQX
X-Gm-Gg: AYBFou03E8w8X2W47R8Xkemv/V/P1g6j1orv5zfrDzt1P/UJn5OF4ahaW04AQHsD0HS
	BuZ70RVvRBhYMpfy3/iJe8JOYMm27+/kfFo38ogzEdkFiR2n768rw9oBcMY7b3zkbvJEbJ5dp3y
	kcYqQtHgQGP45pGzoo0NCwRXn61Dip0rq0QGULZUFd4P4UI8IHC6F9HRjMNJkMfy+t/ip49SAvj
	2PJhSGtWcKp6KwPKk2362+03yeIMLeNY37AAHH/ZwxSFJsm/Oo67ch9ffKDV3kf7y9Bd0v3pJat
	DqEFYdgATEfaeU35N/npi/l3znyZ8Cuk1mjhwLs9RJF43TdqeHbpRpGRK6T6eycbpuOv24OCxL9
	hLb6wZUgYkGVqLZok56t/rkFF0crVscEu6Xsd4+Xbp4kYFuaI2Xzu89sqzAIg8hpmvEWN2m4V5K
	Ci7uWnTD3448aM6hSK8s/m2awFj44tXS01SYZJeBSLnA+15cFWEj5eYSI0DHA/vsAsvna2u0juA
	0zaMISJAG/yNKZY8iRbqmoPFOFQOuKLvhGuyaMmlTCOQBe1Uvv0q9lvo4kRy1ajiBcfS7krArDL
	vn15oZPlbF7PlcbgwbotxW8=
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1d76224f0mr233780755e9.31.1792499552167;
        Tue, 20 Oct 2026 05:32:32 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/14] python3-discovery: Upgrade 1.6.1 -> 1.6.4
Date: Tue, 20 Oct 2026 15:32:16 +0300
Message-ID: <20261020123226.4033600-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131162
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.6.4:

- Clarify the executable paths accepted by try_first_with in the
  standalone usage example.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-discovery_1.6.1.bb => python3-discovery_1.6.4.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.6.1.bb => python3-discovery_1.6.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb b/meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb
index 3af83eed77..d503ea988f 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.6.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python-discovery"
 
-SRC_URI[sha256sum] = "cf87d3627dfb4412437fdd5b13eae402607722998d21567993aedbc59b23c15e"
+SRC_URI[sha256sum] = "bc70d31f0ec5de11eda13d4d64c16e24b3506a65984684f2b6c98cb83b2ea9df"
 
 inherit pypi python_hatchling ptest-python-pytest
 
@@ -20,6 +20,7 @@ RDEPENDS:${PN} += "\
 RDEPENDS:${PN}-ptest += " \
     python3-setuptools \
     python3-filelock \
+    python3-vermin \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

