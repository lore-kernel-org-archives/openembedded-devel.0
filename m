Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F65C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 03:52:50 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.22179.1693108367505949664
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Aug 2023 20:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oIvDRyMF;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76ef8b91a72so136620285a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 20:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693108366; x=1693713166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDaE9qjGhKiEb9mkyn82o7Ptdjpf2Lkj1end6GNwMrs=;
        b=oIvDRyMF2H8VHDtwZp4fLdWPTC7r8iU4IPTKgoJCTNzKnyUAMGyj1KM4GOFP/TVmiB
         u6pQUvigGegJ9JgKRQlTtECnGYWS8UvzwVSGLYNrpg3R8RcKOII0UvPSFgOTi/sc7tpr
         gmIl8ME9Naeea1Hi5BulL0D2/k5PuQEEfe7Q3ss7RSbJPRUHtjSVOY/yZig333CZtPWo
         3h+9OuZKgIUHBa28jfFtYgYG/B8KoiQ/xjcUpVLxcW3vRMOHjAYwxYnmNns26c8/+YWo
         5fKc5m5vsiruYaFcvEBOBT3jkNHerMlevX9QGU9qvzKRC+vdvI4w1tt5T0GHxX4wtRtX
         moOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693108366; x=1693713166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDaE9qjGhKiEb9mkyn82o7Ptdjpf2Lkj1end6GNwMrs=;
        b=VvjxNutT06Qa66AlGMsdNXfQDYHbvlzsvE612qVpKfQ77dTMkUlSBZ/Btc7IrAHPJp
         1XyWOUZ6UdcvEJ/YW1N9LtE16WNYwZw2HTjOGOPUZaE2qFfk3FPcQX/W9ezw7KAcVcrW
         a/+VV96nWPeuQkEFecetN5Muw6KeRpqyTzUs6Fev/BIiPoDBtcimAU1mw+t/lwrMVZZ6
         hIZYm54X4eDwjr3FNq0rXc5UCMkJQ5t1tGSzhRtVhGO/xZ/y1e5/1SRbcq6VaZO1EM12
         VSYmHPa+gKkbGYCgbkWbNTPRhFlyrNRpCm3nd7uejWB1jxzMvbyK/xFmfnus8wN31gxi
         jBVQ==
X-Gm-Message-State: AOJu0YwdSi9Bngfct027ocO/VqzaTL0ShLuUO+DKu8bx5QJMBeyMgA5H
	jdYeQrG2yLhO+QHnVrQo39HnMXsM6RV65g==
X-Google-Smtp-Source: AGHT+IHCV6XW3fkwXyT7E3QPrq+ftxNDkEZ96QHusBic2F+S3Bf4f7QsIU3yy3e4/6RbjuIAAcu5Lg==
X-Received: by 2002:a05:620a:2a0f:b0:76d:b2f2:cb7f with SMTP id o15-20020a05620a2a0f00b0076db2f2cb7fmr17849477qkp.12.1693108366237;
        Sat, 26 Aug 2023 20:52:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id nk7-20020a17090b194700b0026b70d2a8a2sm4264672pjb.29.2023.08.26.20.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 20:52:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libfaketime: Eanable LFS64 on musl
Date: Sat, 26 Aug 2023 20:52:44 -0700
Message-ID: <20230827035244.1434686-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104624

Musl has 64bit time_t inherently, ideally this library should be fixed
for that but lets apply the musl aliasing solution for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
index 49f68bf629..6a0a8f32af 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;protocol=https
 
 S = "${WORKDIR}/git"
 
+CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
+
 do_configure[noexec] = "1"
 do_compile () {
     oe_runmake
-- 
2.42.0


