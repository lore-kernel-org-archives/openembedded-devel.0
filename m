Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web08.10275.1605380668914388159
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 11:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gcm58jYi;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id w4so9454631pgg.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 11:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s6psva62ivKmRPUgu1fhxnMF4U9q5TNSEOeWWfNVTjU=;
        b=Gcm58jYiKvg3T9e4BH2kxtsX9R1PZk7nWz9g5lvgzdG3zU+wC0nh3Zc7bmOIVFUKjW
         E4CxPXRXzv1l3nBkJjViFxn7aK1LVHoOwX95UuYlBcdRpKXcGtjOvM0vQ+ATefSaD38A
         E2v/K+aHz9RkEcvwXu0rwRF8y+1idhCPS7DuZ1o+iQus77Bz0od9+r3DCM3YzaOqO1+V
         Cu/BkBgMxmNypiMAXvzfvJ9KtWRuBYXGN97scXkkRd29SO2r84EqEKhb9o/NnfU2cCUX
         8preMT8OzJ2kXxpMNooXHMMzN055Xuf+U649pCBaNh5F/II0NtRGmTbZmCxGUEow3r0/
         WHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s6psva62ivKmRPUgu1fhxnMF4U9q5TNSEOeWWfNVTjU=;
        b=qdtNKpV6uJVRZBgaSpIhk+CA9+ctCBYdu0ASwGRa1uHxn5/hcAyvi4pxJU29XRwxXr
         huAg8QKq2Jye67uBj88Qr6SdSSdm6XiLYIPP5dhnLGhUMMt9eqd4/C7BuRd84LYHBAa+
         ZY1pi254j6fifWZUE2lyaegM8EYNQIyx+6A3Ja3peXsx0Qi89tSVkBWqVw/SpWXsSNzE
         p2ADY0RWFH8Fa90KseT68Xn8rRBugPEkVFO1fXmT0rNiu1oARkn+tBEaPnXb5ivAhxne
         ttbowr/XSLlpyPxA4Sq7DxYXXUtQ183buZsUHFM2xEqww3UUd2pm4ixt3Ajw+jnlLM0p
         hvFA==
X-Gm-Message-State: AOAM530cLrCQGkJKGBinyUagC8HOwtgKGxnjwoTRg5J0AJXmluyKsl5y
	eQ+B4p55DrRpfbiCVf9t58DZ7OySj46NeM9D
X-Google-Smtp-Source: ABdhPJyfTaQhErNPMzCLNrWk4oa03JwUVd2jpdGVrJzzRpRgThxnNGBnsvMPPEfofrwW7r+o1IoTKw==
X-Received: by 2002:a63:2406:: with SMTP id k6mr6619931pgk.366.1605380668285;
        Sat, 14 Nov 2020 11:04:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 82sm13274444pfv.149.2020.11.14.11.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:04:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 3/5] kexec-tools-klibc: Add leading whitespace for append operator
Date: Sat, 14 Nov 2020 11:04:20 -0800
Message-Id: <20201114190422.2777143-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114190422.2777143-1-raj.khem@gmail.com>
References: <20201114190422.2777143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 7ad55d8b8c..d28cfc90f2 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -68,7 +68,7 @@ COMMON_CFLAGS += "-O2 -I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgat
 CFLAGS_x86_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
+CFLAGS_aarch64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-- 
2.29.2

