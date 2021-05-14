Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.9397.1621001342679519548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gy1GOx4V;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t4so16220880plc.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9M2NfIFSfPK6ix4MwPDO0ZKIXtGxmOH/hf9H/1fjMX8=;
        b=gy1GOx4VZ2kFSDF0p3rDJV4KnRW/c6cV2yJ9CuD4DpgHbOUEvpSGBCHrtvcRl1Rbuc
         +k7rqpj1cJthL5B4an0Vtm+ENjBsnTtAU6NhRWSPU7n7sqsVGpQ0NXu39V1KdtWPeWD4
         kH/NCzbBKLtET1nXZwyiL6Sz0AJ1LE4Lrb08HYgeY4ajkdSb5XQPNtPatchWHEQitYKf
         7yZvUWEQ1ZjRAT2y6MdiGpiypKNaR8s3c90TlZmLgtpx6HH87luCL/JuETXaEs8I21Fn
         ktSPGEdxQXOw/aDRYB6+mDKj7GbaHSLG8/lC8UHRQBqp6Tbyxw5bdZUY7Ud68i2HSMBs
         rv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9M2NfIFSfPK6ix4MwPDO0ZKIXtGxmOH/hf9H/1fjMX8=;
        b=AyiKfe7tkNWk1JdV1NV+CJp0Y3u9OeKfA3jNi0ndKRFxihDUqPqgrlZfEnO3gEThCC
         IMYVK5e8VvkGixUyOTl7ABAwy36MlH/vVWdBJy4tYr6IboNGQ4l4xWc1JzAtIiTPPAr/
         73OlHi2OqpYcCQpbDwkhPp6KTwGWG8JvADkFTyYJ8IJqN0zbtjLGNG5cCzOvn9eYIHs8
         WT1ZAbErnjCH8cKu5N6iKXOlNNhwKs/sAa9V4Ro7J+aBieB6zrPJwhc/ymouHrajJ33W
         8aOCAMhFguRyhjsdljJimpB3StPT46/Xej1qfD0fPR74jAiHDEZM4ocjE+++9fzl2aiE
         EX5A==
X-Gm-Message-State: AOAM533op3sSkU/ZRGRAMB0OIWd1kf15fJ7FVticmv8gc0TQV6lp6xqt
	KyOaHZRqQ3NgFNMojsNCXWRXFHzpp04lCg==
X-Google-Smtp-Source: ABdhPJy3mAi2QJENeiZIInVSV1oM04+TJrESO8JF8bnGW4OuTClpllLBztl9x+Feb+FC/B6smysI3Q==
X-Received: by 2002:a17:902:6b82:b029:ef:a4b7:bc6e with SMTP id p2-20020a1709026b82b02900efa4b7bc6emr6884743plk.53.1621001341949;
        Fri, 14 May 2021 07:09:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id g6sm4193735pfr.213.2021.05.14.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 07:09:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Fix build on riscv64
Date: Fri, 14 May 2021 07:08:59 -0700
Message-Id: <20210514140859.2575018-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wordlen is not so easy to calculate on rv64, therefore pass the right
ingredients so compiler does the right thing in the end

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index ef123075c7..7de89cf86b 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -36,6 +36,7 @@ SWIG_FEATURES_x32 = "-D__ILP32__"
 
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']}"
 
+SWIG_FEATURES_append_riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 export SWIG_FEATURES
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

