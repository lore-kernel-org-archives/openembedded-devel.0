Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86C1C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 04:57:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.4828.1705553822430780505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 20:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZGYhi/k;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-559edcee47eso1043193a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 20:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705553820; x=1706158620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAkOAviU4tCxLXB14LZ2jFZJ8zT65pdCp0eUFpejB44=;
        b=PZGYhi/k1pK+a0B4slt4m1DVBkFV9JMrqeixaNp10aklwMhkJLMNgG+xFJL4csrhOQ
         GnHxAxwdX/szj7R7ih9UoGfGUZ0KDr1OOZVFe3TNUUoZGU+gGRaOQEShfkU/UEW+HhuZ
         c0j9djQjaIYmZpjT02DQrk6XZqVpX9IRV3vUAYYfQVpddEgNXWNnJR6QXQA173hLU8si
         MJLtMTiLy7d4sfYf7c8GFdKpiP1P0cr1isG7QPMCQ5GbPmp8XZdzzlt2ppgTg/7Pqw6A
         GvInrTol6L8t63/Xdnk0vA2d12K9JtsyP58jjA2xYuVkm5/C3p4TGuIc7CA9lUf2UVcs
         hJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705553820; x=1706158620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAkOAviU4tCxLXB14LZ2jFZJ8zT65pdCp0eUFpejB44=;
        b=DGAFZi68V4r9Wx4f0cplJqY32JF8rmgTgP6CiVaT5RBc8Lc6MqU1PS1bZcPL2MGPZ1
         6+rIYl5Yd1ddp7FPYVZX4EmfXX/PUjxwkTNhOMM5y7j9jV+x/KYujKxIHvdcEp3pA1og
         9hpFYtBklYmWzMvGXe8B5xZSWzEcQV7LAwrD7t8hxtZQH/yiPe6hxhedyhsS/FM8cy0/
         IShoPMUANfZZHZ72/kqsdd/9IOXpFOv3bBhFSeb/ZiVpkoY/tazQgtfZ2BoL7yrZHrxJ
         Gfju9vBYVwZyPs1yobJ1AEBw2HeCtxKEWlxXEKGtKDcKXDEkuExP+Pttx0cUisdkRZYJ
         N13g==
X-Gm-Message-State: AOJu0Yyt+B+/Jnpr3CSuKC1eVEQb31Ei8ld2YQaBGsLzaanQpjG1WSdo
	iq1Wua7OPwTKgVYIENJOsDwj45zAbb37qG2RoSPUwG+9P9AxoUsQwks5+/UDGw4=
X-Google-Smtp-Source: AGHT+IGmHXoF7hVoH4LrL1HA9o2kfref7SRdGt3GxrFZMTVVUJtF0UT5eum1K94P6BZ2ygKg44r9ag==
X-Received: by 2002:a17:906:2411:b0:a28:d1f9:976 with SMTP id z17-20020a170906241100b00a28d1f90976mr129750eja.65.1705553819898;
        Wed, 17 Jan 2024 20:56:59 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id vx4-20020a170907a78400b00a2d62a515e8sm5795600ejc.212.2024.01.17.20.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 20:56:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libkcapi: upgrade 1.4.0 -> 1.5.0
Date: Thu, 18 Jan 2024 07:56:54 +0300
Message-Id: <20240118045654.6906-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 04:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108341

License-Update: Copyright years change

Changelog:

    move all sha* applications to the libexec directory to allow them to coexist with other packages sha* applications - the caller is expected to make a symlink to them
    add sha3sum
    add kcapi_md_sha3_* wrapper APIs
    various small fixes

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libkcapi/{libkcapi_1.4.0.bb => libkcapi_1.5.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.4.0.bb => libkcapi_1.5.0.bb} (90%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
similarity index 90%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index 3be8c76b5..35e9b032b 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.4.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a2562899bc38f1735868f0bf0c1dd1a5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"
 
 S = "${WORKDIR}/git"
-SRCREV = "1429ab42d48123cc8f73b96c69a87fb9c6d8a7c9"
+SRCREV = "fc937358e71253a6efaa3ba74885364976b040ea"
 SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
           "
 
-- 
2.25.1


