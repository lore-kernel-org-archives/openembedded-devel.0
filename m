Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.241.1617899818010432845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5NFOBmC;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id w1-20020a4adec10000b02901bc77feac3eso652399oou.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7i8O6tSV/TDIgGbtnn3oSKAdBT66SYJ0GhNdP5vHhiw=;
        b=Z5NFOBmC0oeRR0ne4el9uWCFUgt0ospdS/ltc6O0SKo/sKlzl/PEJsfvCjO3gChUqW
         krxHvwkOFbmGEZhpSimeFl3HP1aX7YDD504J3K6QUT3JGpG0bl4ZQmVDiWaHIl0HzSuv
         BS9K2Scz+iWZSR17qmXJQIOQF5+O4IGewE9zWqlE6QFg9fXVElquEYvs4dYkKTE+aWGb
         2TKCF4+FRi8j66K0TqRGJbUdkbl58Rl2ZIIsj/2sXUvwbhRKeuv0CgHN1I7qW1nGisEQ
         Kgy1HlkWrpTn6hpDMbP22wMnQhtYquN2H01hDClpOG/fCIgaV/USkELIkpegAxLym3DI
         vSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7i8O6tSV/TDIgGbtnn3oSKAdBT66SYJ0GhNdP5vHhiw=;
        b=qDl53DkUM2kX4Ru5UD+boX7UcNYaJttvCyOZPH8xU6ZpoOzqQaCTVIJh4tXIAhzP+W
         M0HFcI7MCdXG7uEGbhjBrjcZCRGC2RexNhWhzDKOp9YG1RQxBjjZxdMQTY3g6DhzJ6vH
         9sHuRSAhu1Wnb5gXYNQn6feXYxv9GLPeP4DHfkSsfGm2/xAttThsVdq+bSEBC9UkohbT
         /pevfnSLimQPvQETPqMfKnTEz7wUE6T2anfrstatV+wTPfr290SuLkkVRWCUX8LtvG3N
         l2wmUlydZNwzBRkJwuJWKnA8s07dt1mOAuvk0xmnHXm+oN7m5AurcTKgyK5eQ+5aUyjl
         WwSg==
X-Gm-Message-State: AOAM533vyESMdyKTFzZwdugSlSzMevE0OELydwXDfzsfPH2zTJ07ZP93
	Jhh1xqeZXgS5ZOL4NBbLsvJQL02qQs4=
X-Google-Smtp-Source: ABdhPJxABf0zEgKkXK6oRBhbNgv0hOMfeNkn57hMQ8UAE9BaGt+cNwu20t/3SsKx/YUeN0+GxW8JMQ==
X-Received: by 2002:a4a:e2c6:: with SMTP id l6mr8245445oot.31.1617899817224;
        Thu, 08 Apr 2021 09:36:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 48/64] python3-bitarray: Upgrade 1.8.2 -> 1.9.0
Date: Thu,  8 Apr 2021 09:35:55 -0700
Message-Id: <8b22a2a83a9990953701ba50406c1bbbba7b8d92.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.9.0:

- add shift operations (`<<`, `>>`, `<<=`, `>>=`)
- add `bitarray.util.ba2base()` and `bitarray.util.base2ba()`
- documentation and tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit befe8552bdefc3fa289c9a5a966b5a8c96377ada)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-bitarray_1.8.2.bb => python3-bitarray_1.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.2.bb => python3-bitarray_1.9.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
index 8fd4b6c31f4..12ac3d964f4 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "96136d9add2b9b3b73e1eb7538b8d12547ee82dc3fbd31addef829371ce2a1bd"
+SRC_URI[sha256sum] = "db00073387af7fe30852d96b04742a0cdbc7feaf3158558520ab7898b0435ee2"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

