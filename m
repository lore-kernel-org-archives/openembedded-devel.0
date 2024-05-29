Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60760C41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:30:04 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.5314.1716953395656363234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 20:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWmLmh/4;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-681a4427816so1251664a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 20:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716953395; x=1717558195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln2wtG2ZoEGEUZApSIuUmGrYH8VHAMYV21CTMA5lH8w=;
        b=JWmLmh/4TEOnE2mX4/IKtFirvtFzEEYWmk8gPqrcTiW1IN4Gjy7zlPZuGOu3cJEsgp
         qaghRmUOmY0CsWLIjpy5zAI8fG9eW4P6axNk+6Sg7kCzfD//J8K27PtGs4fIOEOOTKmu
         Iqg+v+6j99FcpttdYtxg3hR3QoB8Qmf0fLoJZJkY3xRgOaeb+NE+KrWlzzdo/i/DnXgp
         X9ykGy3F9OJQ7GxnNVM0G8rMKyYtvyU3fMMDhRIMEsgV9sdS5Fp6hUa8ZqFlRmEeoe91
         lXxeiHSX9ae6ziOG4Wl1r/MpEH2kDQrixPFKVu8+kDs7/qjGQd5bDhgtAF/BvJbHLSZY
         qNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716953395; x=1717558195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln2wtG2ZoEGEUZApSIuUmGrYH8VHAMYV21CTMA5lH8w=;
        b=kXPLn+WXj/M9Sirj2Nqd8w4DpY86DSPwj0J3M1fHJxCXSOWObvaGT9CN8orefKSwV9
         42aZ9Enpz9ksXlC9FtwDSpzVYme1Sjvv7CtLjZEaTyq4n0vF+oX54GMKF07n+w5AgDRg
         89jSEDps2SSdGlT35vqoWkKwllmwzWGiIbJQKxXZEC33oHK0c4kW8UOE+RFiAxlua3b3
         ZB5ogBRryy+lxfQWJ5JMsTFLSkMl1g/mmDLfP2BvkppwJikjPLcJoGQr3A0QMYBicbVW
         0TgiCm8G4K3VWdnhG9cJPglm76iR4+OfcqYKWjhw1DZmqV+WHkk+/xwaRM6Cx3wxnX0f
         8zJg==
X-Gm-Message-State: AOJu0YwuycAj4yYJQlZqepE0028A3bH5lBUBEtKmaHOlQ1SWzlQPdXe7
	BEP2mw+bXd4Nqq0yzAgowX0UthjLwbCi0CjRmIy+DtSUjNqYWwboByLp2QUTAwU=
X-Google-Smtp-Source: AGHT+IHENTD3OejECNe6nFiR4dDp/ecjQ8bqKmKb+vjSR5UpZA0A4Q++WJeZ1npezXzywTJH89m/FA==
X-Received: by 2002:a05:6a21:4987:b0:1b1:ec00:eae7 with SMTP id adf61e73a8af0-1b212e59c1cmr13880485637.60.1716953394715;
        Tue, 28 May 2024 20:29:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c00f389824sm2341384a91.1.2024.05.28.20.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 20:29:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] mariadb: Fix build on riscv32
Date: Tue, 28 May 2024 20:29:48 -0700
Message-ID: <20240529032948.150704-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529032948.150704-1-raj.khem@gmail.com>
References: <20240529032948.150704-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 03:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110604

Link explicitly with libatomic for 64bit atomics

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index bbfad1e478..695965f7d2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -78,6 +78,7 @@ BUILD_CFLAGS += "-fuse-ld=bfd"
 BUILD_CXXFLAGS += "-fuse-ld=bfd"
 
 LDFLAGS:x86:toolchain-clang = "-latomic"
+LDFLAGS:riscv32:toolchain-clang = "-latomic"
 
 EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DWITH_JEMALLOC=no \
-- 
2.45.1


