Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.6318.1622029987050068279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c3clIbRz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id k5so653451pjj.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QPg8yjkZIa5uqFAF5luKerm3hUjIEAIiSXaVjEC7rl8=;
        b=c3clIbRznTpSNWkmH+2tAFm0ilBsdV0xCRcIHo4y18pGPiXCWK76wQ1+gwb2UdP4G8
         ro4uOCeQWaSqYPr8xncY01DdXUqWQp/2gKKWREFjq6x4p08o7yUZNYOkp/0l8sgOe4Jd
         isOKd0cmum5IyAC7taJApvwPXIKGBxip+S5+TdXFo2ILlZicCZuOWDqmVnPYN0K4THei
         rhqZqSzBYWKbqo9Vh4PLsOX+Vi0LFsZdx6jvT9BgTPdUO5QSVBTqULvIhCqq2bpMzueB
         BrjOE5tZyz4eL2xZifh7krfZwHoQ5pkcSwl/6kBOHuLpDCw71VSXCX+CUdQ1JK/D6kIP
         Ozuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QPg8yjkZIa5uqFAF5luKerm3hUjIEAIiSXaVjEC7rl8=;
        b=t1XtCezMjzZcxo0i67SZlQMMfRm1XctO9JKnBn6lwRRPUS2B5XdEhZhSAWHX6mrgeb
         S2gpw0P1FsSdMi/EUojJHziRegtEuMUxclBP2vUr0xloTa+FGoq+EZfIl7w2WqgmCnRp
         5k9Uz+t0nFUTfCPLpcJiJismS/383HdUxoEkE0OEfT0+K6MiJHQWorC1IfJ8ZRI3yK/C
         1Q6ICY34Lx2YxYQyXtvoR3WRqOPsC58zUfnX8PI9BK9kJheLG4YHrrAZOkAzM4lS3y7z
         6D0YTr7LU1E9u4Bd5vC/tsLTKuS7Yb+L/k6lzwC1G26CnGVma1/P4s1GSi+J/f/YnByW
         3lGg==
X-Gm-Message-State: AOAM532BNWIbDiFAwMgd+dd+fYuxJSDvl78Td3eVaWrfMP4PSE1CFn2W
	5Pb0VktUw+lPIQAWl8GxM7Jct8WWJ7wbBA==
X-Google-Smtp-Source: ABdhPJzFZelrDeyxIQw3gqyGDU929FxNzUpan9geaHd66F9Z/tO1paM0v+9xzfTqPZXmIt5xuf/76w==
X-Received: by 2002:a17:903:208a:b029:ef:9465:ad10 with SMTP id d10-20020a170903208ab02900ef9465ad10mr35554244plc.53.1622029986436;
        Wed, 26 May 2021 04:53:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:06 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 21/23] opencv: Disable tbb on riscv/musl
Date: Wed, 26 May 2021 04:52:36 -0700
Message-Id: <0567340210657268e21d6b2ce55fa82291f4a0d5.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

getcontext|setcontext functionality is provided via libucontext for musl
but this library is not yet ported to RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a116630318789f08ebc6f350c37ef43f0884cb30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 1dcd8586cd..226bad5778 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -108,6 +108,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG_remove_powerpc = "tbb"
+# tbb now needs getcontect/setcontext which is not there for all arches on musl
+PACKAGECONFIG_remove_libc-musl_riscv64 = "tbb"
+PACKAGECONFIG_remove_libc-musl_riscv32 = "tbb"
 
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-- 
2.17.1

