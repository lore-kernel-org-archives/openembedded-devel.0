Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.7379.1625583200230643146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g1zn1qxP;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id q10so3495147pfj.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Z9mobdTSh1SSOeyr3mGCkhQPiTteJwQRMP5V9mEU/E=;
        b=g1zn1qxPkMf/mXoygXTN8CwwBGaStpC9+FGGiUD8PuNZiRsl/X9dLxLT1JX5PMprWB
         oTOXpyZGhC5Z3aDWcfWmcr1ZNCg5v7xHnu6hmmVYuhH9defRi8Fv9HyYFw/d2qjJlgYQ
         VWo37eBQhWrFzhDV0HoRPOKQH4ZgyzOLqgvxMDrdHQiZk6+V4gz/bGDWsCZOp0zZNXD9
         tTCM22rmraGqcCZfIgoYSxEzIAEkt7Nv+5lLWf4zAb9G+23ITm3dIomWS2qN2YzU4LU2
         //2N5grsLHaGcRkel2Nuqlh2/FoHwAyTy5KDvCrZS9JnOhOTOIIEISfpxnSxHAZcPrL1
         T7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Z9mobdTSh1SSOeyr3mGCkhQPiTteJwQRMP5V9mEU/E=;
        b=mZvVg0nzCqs5BO4Y4fXajrDOjwtgcOv/rcH3Tqyb6fEMxYMuqtTP2ENs2S5fYviPrP
         EtnJu83WLH8NCAc9gC22thIrCe7/fE6PoK16QSuVgkSqHoM6xfWv2ph/fnpwOJFudI4D
         LN/z4tHRnZESBeyccO476iUoFUNTwnrlgIbJHW4TuOWOkHum2ftXy4n7l+CMKaBEmdyZ
         4qFdCg/Cr+wMog6KO4lLW1BRV5qGkHpR1FUu3OK4/sSoUBKYhHZniRZnvfuZmoGTf62+
         S++WK0Qlm9vbhM+teZxVCTd7BK1jfvCC3orxcjzERxXn8oTxHa15rxA+ziMKKGPgsOE/
         KUrw==
X-Gm-Message-State: AOAM530Zr53cHLyE/bTQ4yi2iskahnITUUFxD4I4FBj8LxJcfNVNnuUN
	43aJc/yLzt+jb8mwFWIVGvTVJv3P6mEacw==
X-Google-Smtp-Source: ABdhPJxT32UeL87V8vWUL4qJfbiZADwrgZLBwTQswJPotHMJzZ0u84NKapg2bqtEOu9sgOTEX6e3Xw==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id n12-20020a62e50c0000b02902f9b9b1d44fmr21075106pff.42.1625583199728;
        Tue, 06 Jul 2021 07:53:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:19 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/11] nss: Fix build on Centos 7
Date: Tue,  6 Jul 2021 07:53:06 -0700
Message-Id: <54207c3575ae610e68e5ec4f6e7c698d3a6ba1d0.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

Centos 7 has glibc 2.18 and nss-native build fails due to implicit
declaration of function putenv during build. This is because of the
Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

  putenv(): _XOPEN_SOURCE
      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
      || /* Glibc versions <= 2.19: */ _SVID_SOURCE

and because nss coreconf/Linux.mk only defines

 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE

So on such system with glibc 2.18, neither macro makes putenv()
available. Add -D_XOPEN_SOURCE for the Centos 7 and glibc 2.18
native build case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 0e127975b4..30370573d4 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -55,6 +55,8 @@ TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+CFLAGS_append_class-native = " -D_XOPEN_SOURCE "
+
 do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
 }
-- 
2.25.1

