Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957D6C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:52:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.16992.1745923955667790862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 03:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UAqYE2Mt;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso4180284f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745923954; x=1746528754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl0339R3k3UTWvczlqjBb0kNdb8xe99r64YMH4M61iM=;
        b=UAqYE2MtC02fyb9BxwUDY7RxUopA8IPOmBo5HVM+lPwuhiO5LkGZt5unsrpg0PQaB1
         uh5c9A8X5Dr/3dTnHfHNjQr1L/ncMABoTsJukuIasarMBGpH7xLnKyEKSduIkNHdHUs4
         Proimfd7mNNBrNX2o6gQgQm5LFBs69ds/ObslUcjMxOaJgQbwCEFPcPEpCLW1MKgChBD
         HWoXv7zvTr2Ns0glOzEGiOyaegy7J14lSRulF4h7YGYHBLzVYpx3LicJJ+3SoeCi0xKE
         xaKGnQxOllx7WorB/Sy00n0dtZqHl7/6QmDQYcAdayhP2XQUJ4AHHQU8rtEuJxhZaYqp
         pS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923954; x=1746528754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl0339R3k3UTWvczlqjBb0kNdb8xe99r64YMH4M61iM=;
        b=P/QdKx3xgKXwtkNGQi4+4zuN8squlUfv60ghSIy0Xw7aOEXB8V2LJsCDFjetdc4tbT
         Lfh9fJCq2uNcMsIBAKj/lBj4izXyYd37JKev9mmcDLSQ8ttqpHCBRq782MgQyO/tDEso
         +VQHT1KT3bpw03u/zbWa/BJjTRoA2NsXsfI0hEuh25uhFVvauvWxY424J8973LeRABKH
         k9MWcw+MXeDy5FawyrTPkTZm7QJ80YKTZYDjQ70HXhIjBdbTbQrJGniA8iYvwH0Gw9vE
         2Xpurp+e0ak8F5vfVDHgbwd2pdbsd0WoEpCStDCbrLfE8g2W5ljneqcd/iISQRBXltvJ
         PReA==
X-Gm-Message-State: AOJu0YzFrxYaO0kxd+cECZcuV05Szfw66fStvBqhrigbXhZxiCeDXH4s
	qJtBxggei1R/o+LNq2mCe25diNtQeFnDzaYQEv66G5dEFT9Q6spaNMS7MkBv
X-Gm-Gg: ASbGncv1nXfy0V2OG6YS5jMdSd/RdtxQPHHggXpPSlHxr7fwa9UqK843GqDHTbqycEw
	zm4R2Km+3PpbcVsLrO+vgfpoAlUUDyHTZOaxHRjrFZ/cauUknbnRv84EIdrhuTW6FXeB7vzNiGL
	SHONYxkXx6GtUlRTc1lsGYwtySwc9s4kxF/psSg7paEDv5bTXPs/+mEIolaeq6EeEWJ17lhOfFh
	JC8faaPnghbIUJud5KEO4v+1bHLzwynlHYHNhi6kOJBHGxvxmlc8k5eVM6PoqCq4tgOqk9cRt3T
	0NBoSATvwppQsQHdZ20aXY2qCLREqcEBdQN8P+oJGOo=
X-Google-Smtp-Source: AGHT+IEubjhnJmma4F+TcUzp4pR1Qjk2ohe9+MSp+4EtiyTM42OZjxIkRJnDiu3eG1g/h9T1JcBxQg==
X-Received: by 2002:a05:6000:2905:b0:3a0:88f7:b49d with SMTP id ffacd0b85a97d-3a088f7b4ddmr2612309f8f.57.1745923954020;
        Tue, 29 Apr 2025 03:52:34 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8c7fesm13607584f8f.6.2025.04.29.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:52:33 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] libiodbc: use gnu17 and ignore incompatible-pointer-types to allow building with gcc-15
Date: Tue, 29 Apr 2025 12:52:24 +0200
Message-ID: <20250429105224.1462276-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429105224.1462276-1-martin.jansa@gmail.com>
References: <20250429105224.1462276-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 10:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117237

From: Martin Jansa <martin.jansa@gmail.com>

A fix was sent in:
https://lists.openembedded.org/g/openembedded-devel/message/116537
but it causes issues with clang as well as older gcc as reported on
ML and also in upstream PR:
https://github.com/openlink/iODBC/pull/111

Use gnu17 until this is properly resolved to avoid:
http://errors.yoctoproject.org/Errors/Details/852861/

In file included from ../../libiodbc-3.52.16/iodbc/execute.c:94:
../../libiodbc-3.52.16/iodbc/execute.c: In function '_ReBindParam':
../../libiodbc-3.52.16/iodbc/execute.c:643:49: error: too many arguments to function 'hproc3'; expected 0, have 8
  643 |       CALL_DRIVER (pstmt->hdbc, pstmt, retcode, hproc3,
      |                                                 ^~~~~~

http://errors.yoctoproject.org/Errors/Details/853276/
../../libiodbc-3.52.16/iodbcinst/unicode.c: In function 'dm_AtoUW':
../../libiodbc-3.52.16/iodbcinst/unicode.c:1565:16: error: initialization of 'ucs4_t *' {aka 'unsigned int *'} from incompatible pointer type 'wchar_t *' {aka 'long int *'} [-Wincompatible-pointer-types]
 1565 |   ucs4_t *us = dest;
      |                ^~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index 644c3ba07b..0478ef3403 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -31,3 +31,9 @@ EXTRA_OECONF += " --prefix=/usr/local \
 
 inherit multilib_script
 MULTILIB_SCRIPTS = "${PN}:${bindir}/iodbc-config"
+
+# avoid http://errors.yoctoproject.org/Errors/Details/852861/
+CFLAGS += "-std=gnu17"
+# http://errors.yoctoproject.org/Errors/Details/853276/
+# libiodbc-3.52.16/iodbcinst/unicode.c:1565:16: error: initialization of 'ucs4_t *' {aka 'unsigned int *'} from incompatible pointer type 'wchar_t *' {aka 'long int *'} [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"

