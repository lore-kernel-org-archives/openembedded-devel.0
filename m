Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41234.1795611511277549788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OdREJ/jk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so55896275e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611509; x=1796216309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za/qwbiEwikBM8jjBLF1C/RLrgwWxfA7qmCnnYGt9Lg=;
        b=OdREJ/jkbOHoFattzwC7W9GQoHgWWZ/MB6EjVetvC1tw7zkoExKGYTGNNLgvbtkdmx
         M5stEQkutKcEudx4vI6h31KL52EOqTbDeNvs/e7R4Al6gKHHg9qAW/LE23iR/ujrzDeq
         U9oG9YWGVwICFyBFeJbKz12ogs6Yae/6vxVIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611509; x=1796216309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=za/qwbiEwikBM8jjBLF1C/RLrgwWxfA7qmCnnYGt9Lg=;
        b=Im1fJWezsuoX37yMsIMo2YmmfiiRWcF4RPyxo5NrWNcbZafUZG/LX7SUs3QhB+cEOJ
         g9zMdrTritdCbzD3xnypd82hxTl9GiXI1485YeIDyg35j+sBGB5+M1279rg0ccCjeUs3
         7IMOZA87zXi5+VHUvybcULYOfIoruv23f5HRBalaVPMzVAvSqhVYYczqLYOstZnSYHHp
         OHwAMvhPKxaY2emdRTesDcKlYQSEwdjFOD9dl7G2C7JmHc2N2E+QjzPLm3XT9kPAnSlW
         M3u464BSw1bf4beyMYre75P8GBfwCwZt26+PqSCB0hpcT7g6gtQukHtuqUOqc8w4Mv+P
         y2uw==
X-Gm-Message-State: APuU4Z99cqAhcN/QfIUVqcZZzpQqT4j39iZ7ne+hAu303jNaU6pMU++X
	JgmpEZVOzTgCTmI2mNBV2lxt0NqH4vp0B14VBPbbUTATkKRZVy2OP8hDF35BppWBC/5WJqxWJBA
	Nks6S
X-Gm-Gg: AZFdTZeGn0QC4lQD1CqRYWu6h4cVeMQ81uFdiwmszR3H/StL850JztBQQAtugvdImSG
	KCw8oL6lTgrflqMMZCdQ6nsV/rdkL1dSXLDkcrC7eKXx8BOFuKUkRslpUYuMw0ujz46ujqodn+m
	yTsu400ZvPwPC+bg1Sy05vJbRC7LqF95it9DyHIazd6VXmuIWfA8PKZ8f7L+RHAVhkEW15ZeNUi
	k4UHRguYe7EIDszgSQfxh/wzZffWcqpVdqmPaG+6TmWCXSAWAZmcAYttHG1h2bDaYOZdXE95HwB
	FvjJIAxJznChaCW0Z3Ic6HF/ENDbmc8e5GQYjzy1nYSp0iY6AHrsxf2tYBMfhm469iscD+eXFH3
	JD7LkcZqinEqX4ZfUQUq67TqclUtaMkMZVNhoqUhsuKZYiASN4Ry4YU3mHBP9P5QuZ3xTJwDlkE
	oFPruKtxYxWAGkylRkkRTgbt9Ggd3x2wdZQ076dcWWS1rz/1U+sr8Kb1Fg1SpQcSsED5kyliS5N
	d1KB0GvFbAoiPdYHu8/80rAg6mSZ4NUgKU1WsqDLS54aOIDK8PWqr5WnfPbKi35UdLHKWabl8UB
	Rw6Vuy6ik+7qXecDU9p5hWP/pAlUIqalINHkXZsr7vjh8EHH0cCoWpySYDkTPR0dPYjvyRUIvdb
	IJGxOVac2+3/gN1igQ8hMfntJpXwoO/VD471XTUeOsLRunv4EUW4JPQ==
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr329346605e9.9.1795611509529;
        Wed, 25 Nov 2026 04:58:29 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/8] python3-grpcio-reflection: Upgrade 1.85.3 -> 1.85.4
Date: Wed, 25 Nov 2026 14:58:19 +0200
Message-ID: <20261125125824.1799066-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133076
Content-Type: text/plain; charset="utf-8"

Upgrade for the released gRPC Core 1.85.4 (googol).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...reflection_1.85.3.bb => python3-grpcio-reflection_1.85.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.85.3.bb => python3-grpcio-reflection_1.85.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.4.bb
index 4acfacf01f..7ba5b56186 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "12433efd1fb76a2c34611843763330f43c26167419209a55a0383f6a85457e5a"
+SRC_URI[sha256sum] = "f4704dc50f5d971ba27a11b35c79b0ee9d5f4ff6ced9f232502dcbbcdf4e7298"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

