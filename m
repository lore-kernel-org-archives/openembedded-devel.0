Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.2249.1628238080231640829
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hFyCOxPk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id cf5so11996159edb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Aug 2021 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOrhhQYJLj728CbxEnaOtRHmY3ydmAylq7broOHLjhQ=;
        b=hFyCOxPk2RgsETUEtaL5F9xSdxkjTYF2OBNSOA4gMe5tOWY0/vEg5jUemS6I4U4dvS
         YfoO0hEQ7uNj/vKxB4L9QdzrbfscYVf71U0MRPuLfFK1b0HAczDg6HqmmEVKHSAw7ou1
         /h9z28Tl30UgP65y2A2+DRt/PihjvD5CoJ4ugVHrfclDKhtcTU7NQsJsrzmOcmhgddx6
         FCyP5PgbcfBYrj0ml4Q/G0QhR9thsrJJArdvyRs7as5KC7o4A7Aia4BZSss9O1QSogzr
         btZwVjLBJK4kvqajf2c2tPjdUY5awMYEvdJld1RNbhK7y8aQoIMbQhkMpWhcHgfbIdSx
         B4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOrhhQYJLj728CbxEnaOtRHmY3ydmAylq7broOHLjhQ=;
        b=nzHMTTyKt9IEScy/kV04tYMG9gVQhI+V6UGBwBSSdLzKaT1mxAY8ol7a2aPT3J/oX7
         6g/r3Iryupt67c5c1h9PM91PyBXNeUuf7O0fWgAN8CW0nIkSYiQluCnJRe14YpgUW5lY
         Ayz1kD32izp/MWY6efKNO0UlXtmHDmrJ7EulIaqI9pZTosiAGaDAPl6T39piPgFqERKw
         nchjiwqzpf0NRW8ejPQJsJJsiMbIRthUysQoLPR+SLkAaLh+5THDbdBDnylqRnSpuvoa
         4GXF5JXuY3YhuLYQ6bpgcW4Vb+IU/xJWxCDGH0D0/OKQ/IvKptW7Z0HoYXuJRhUcIPEX
         nX4w==
X-Gm-Message-State: AOAM533TzE/FZBx5DM7O2LC7Ido64EB8/R8xSYANydfDOwk5ucLVBTdq
	pSCZ3oh2EgaRvHSxY+h6mjNMn9JysHb2/w==
X-Google-Smtp-Source: ABdhPJykA9Kv8dRiiMu1FCQWP1nR3K0GyQVGtvNGx3TuGicM2fHYK+J+KVN4kxfgIuDxrWk+MFq42g==
X-Received: by 2002:aa7:dd84:: with SMTP id g4mr11512772edv.134.1628238078598;
        Fri, 06 Aug 2021 01:21:18 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c13sm3427458edv.93.2021.08.06.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 01:21:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-grpcio: make sure that GRPC_CFLAGS is expanded to empty
Date: Fri,  6 Aug 2021 10:21:15 +0200
Message-Id: <20210806082115.9699-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with bitbake change from:
  https://git.openembedded.org/bitbake/commit/?id=699e36c270d863258502d315ed00a1b940bfbf96
  the GRPC_CFLAGS now stays None when toolchain-clang isn't used
  causing:
  i686-oe-linux-gcc: error: ${GRPC_CFLAGS}: linker input file not found: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
index cbc8ce95fc..f68034763c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
@@ -34,6 +34,7 @@ BORING_SSL:arm = "1"
 BORING_SSL ?= "0"
 export GRPC_BUILD_WITH_BORING_SSL_ASM = "${BORING_SSL}"
 
+GRPC_CFLAGS ?= ""
 GRPC_CFLAGS:append:toolchain-clang = " -fvisibility=hidden -fno-wrapv -fno-exceptions"
 export GRPC_PYTHON_CFLAGS = "${GRPC_CFLAGS}"
 
-- 
2.30.2

