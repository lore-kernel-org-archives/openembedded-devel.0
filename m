Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.3599.1622775794474075498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 20:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VTQTivmU;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id l23-20020a17090a0717b029016ae774f973so4415992pjl.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 20:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfCuJHrQekC/yIb8fRe91+ywkKmWt30JZK4sRdHJzSI=;
        b=VTQTivmUv7a1w9Dt7mySJegkQRNtkKBRwyFl0DHunRhv0X9IhJiV2usqSg/XJK0BOD
         q6ZeqiXeVIbhv0NCnKNaMV+nCHgBFgLEu5BVYYSNej7BHMolFIJ1n1dNsHmOToyPS/fl
         3qqw052zujIV29FiyzQEu6N/R4zeCgZqx/0jQQJb7qjFUWxU415cch8+B7GPpAX50eKF
         wR/xwpVV4s6v2GjKUNb2QnXHIRDysPoHfykXVaI3cn+rUqpbPQqwph+2UqXErI/BY6CT
         9d6oGYhHS9/73F+fnO+y1X3gozoRNVEkaEny5+oO6dRX9StFNT3PhdFHkFmTIzgIrXk2
         uZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfCuJHrQekC/yIb8fRe91+ywkKmWt30JZK4sRdHJzSI=;
        b=nM5kYAg+sMD2LgebuR53ulbKACMsTCJjkmT6z5GUkKRmU6vNCBFF5QftM0f3fL6wCW
         ZM3bUHC1aKYLGfzmp5szoDszutGsg44LlavixxyZFXjf9TN00D9iX6fuLlXh+vOaM+Cf
         GJXnPqmMxtm99MzxwD6jGtTjBxqv5IRA446BFVCcfywGWgrPRvrXPZueDbQ5yreCVLNe
         7HsKsa+++f92rL5SQGb0bRCRNlSH2PSzqB21VimE/jPy3nQiNzF2n6Vf+u5WA3qf0fUy
         4M9vAKP8HyZ2aCwfz14tzT/QibsZFAGwogrZO7+DPcMt/p15rPTtIw+0x+kd0G4Gk6HF
         g2ZA==
X-Gm-Message-State: AOAM532rpBpLhXMwlh5Hd2PdmVXlCUm4g/5LBd5WofNp2cJnwvBK41ER
	IABdjh8aF3RnWTPi5juFeo3F63uNq9VMMQ==
X-Google-Smtp-Source: ABdhPJw+c5TrQX8Qf06VntgfM6O+h1WAFfkk5NXZCXMZ+WrkssUFLFAGaGV3eD+6h3XBQgAt+lXBwg==
X-Received: by 2002:a17:90b:14cc:: with SMTP id jz12mr2567095pjb.210.1622775793621;
        Thu, 03 Jun 2021 20:03:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id 203sm364496pfw.124.2021.06.03.20.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 20:03:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: Add packageconfig for warning-as-errors
Date: Thu,  3 Jun 2021 20:03:11 -0700
Message-Id: <20210604030311.1994627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable the options by default, as we use different compilers there are
more warnings to handle then upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
index 8c2457ce06..3c7df44513 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
@@ -32,6 +32,7 @@ inherit cmake
 PACKAGECONFIG ??= "shared-libs programs"
 PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
 PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
+PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
 
 EXTRA_OECMAKE = "-DENABLE_TESTING=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
 
-- 
2.31.1

