Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD21DC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:54:17 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.7882.1638449656445328521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WIWLE0kD;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id e3so115720848edu.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Yo+HtM8HfpRSrwBzlP+T7twFoP0dJNqpzIV34fkmGg=;
        b=WIWLE0kDkx5zpTNagxMIlNCEkxP/aXzqJuIMoC5FSYTHW6Porh4nEeZMJpoVi589Js
         DGYzPN0u+eNqd7rqFjkKK7wknZHFFrXxyJqv9GDM4wvm1CHucNLeYAmp7Ge68itNH1pK
         keDrp9Tt/Y+LKKDB5ZFM55v9Nd2mKZEd1Zgx+TyiFh+d0twbB71gP1XZvs1rEiKB0Il5
         6tLkDaaDpwJMljkHou3Sh5GA5CxEJGwuGRRDW4S9fljzZ0ygPuGwBNyXedpOr/2WkAXe
         imiVwM0aPwJzdL38pyG59KRyV3+5JNGLn273Nryo8pXY6ZvyFByxV6d9Q11HaCUej1rY
         m+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Yo+HtM8HfpRSrwBzlP+T7twFoP0dJNqpzIV34fkmGg=;
        b=hfqnhfClaiMy7avkrbK2f7oC2xI6Ak5dWO8zR1l9jn+vKLK9VoLE4e7tH7LwwYAhHX
         QNF8aTbsslZ35qAWVkb8Swoc6eAGkW1kc5673Ji5KtxD5rzPVhLqXnVcKTKqEF0gpDHP
         mv5aYQTGwG8LM7ftzKpg7ivg0WceC6d6yjNjygSZ061SQ7iugTjONZLiSl29JyGNv1Lp
         WlLSIi6v8u3kS9rI2NZBNRPM3qi0USTPIp9UcXje2SgAvjAE1FKqnek4BFZhH/V6qxUB
         2uD8ebJkVbXT1FQDHfiEMn3JHNjMLPNuXBpYx58gD40aGHkuySpc6SjEgXF+USKkM9BR
         CbDQ==
X-Gm-Message-State: AOAM533l8PxkRf1zFs8uBUqLvFFlwF9EaQ5m2WhiP9miKnVNQJsULBAV
	EDD8W8IS2u1HAd1M3+DQC694zZjDWXt2sg==
X-Google-Smtp-Source: 
 ABdhPJz6Ej4jCln7SmfpNAwKsH0YN3ExqUODsECbUlrLLctvATKIsfXkPjzLrv7fML7u0Zx/TCMPfg==
X-Received: by 2002:a17:906:4d4a:: with SMTP id
 b10mr15587039ejv.89.1638449654584;
        Thu, 02 Dec 2021 04:54:14 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id
 sb19sm2014464ejc.120.2021.12.02.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:54:14 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [meta-oe][PATCH] gpsd: fix clang buid via export CC explicitly
Date: Thu,  2 Dec 2021 12:53:59 +0000
Message-Id: <20211202125359.2071687-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 12:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94185

gpsd scons build system defaults CC to 'gcc', which prevents clang
toolchain to be used.

Export CC and CPP explicitly via environment to override default
assignments in scons.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index ace907bc0..c11d4c76d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -48,6 +48,7 @@ do_compile:prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+    export CC="${CC}"
     export LD="${CC}"
     export LINKFLAGS="${LDFLAGS}"
 }
-- 
2.25.1


