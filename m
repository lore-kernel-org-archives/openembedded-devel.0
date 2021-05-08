Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.3274.1620452985791207166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 May 2021 22:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGHn+wqt;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id g24so6377267pji.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 May 2021 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WMuR9m8nHUEXw//zTKe0fF8dd4Wt28HV/0NrsqZhOg=;
        b=GGHn+wqtiTPPU6Gz8PpgQ83fTLpfrBNjaYVc29KBVZb9QD5CozzKW8PHzH6SnKZLap
         iRa+lNNZr2SMhdffyxpdX9bDBSJBk9HI0DTl/MHLff5DXiyifT56kBXRGzQMsHnNz87w
         p8dMFiyJq0tsxOVVfQgB+gAb2IqHT3IEzWEWqoZl2NMCODpbzzY+6VtE+3D2SkFPZMX3
         48A/jz8EUtw4dqmtLipveCO7n29e8RWAHihKC2Fqhhuhc4QsDSKFjP9aWMz7tOYVdCFL
         pGlKLOy6KD2E+dnYtHK4YzQ5olVCirOop3cnK8nvcW5VRUgsBRXbtejs64vnKz1lnle3
         aIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WMuR9m8nHUEXw//zTKe0fF8dd4Wt28HV/0NrsqZhOg=;
        b=CSHPZgbuaACNAMYiR6G+KzdzYDWJXnbcAhP9rf3kj+2XieJ2N5WVU877UAwYonBGWe
         tPqTNA5DGwAd4buLK0HFvJv5SmIhrm6lEWg/MihOgBSNYUKDBEj1laWBs0/anZpXOuLM
         P4IZggXpbkdFrIdQ3X0SSsHwexI+xCGWlc0ceG8ya4GlM/WZGttv0dgjsU2nUKXQhANz
         xgbBxb8l+asxAmxls6c3I8YPGNc5i8CaF4krRz2DdqlWFLV+bDuv2fdHYwoGGC+uB7ul
         rEa7qev3NSHI1Z5eLSK5xzcfseWNb2Z5XExoIG7g5lAdFs2DKMPTJjn2iOLl4tHcNppg
         +Gyw==
X-Gm-Message-State: AOAM530W/gguAfZRRqa82ZD4t55bOt03+1ZgXRaJ38mTZPVmc6s/DJoA
	71JLXzrivGe1RyKsqY62gry80KJHWNQaKQ==
X-Google-Smtp-Source: ABdhPJykjTBfhGwv43m72pG13nN80MPCZ6J4sXJfmzdbzRp1Q6yu6+Py20+F9ugUIjYilFAppTfGkA==
X-Received: by 2002:a17:90b:786:: with SMTP id l6mr28440055pjz.182.1620452985024;
        Fri, 07 May 2021 22:49:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id 187sm6136695pff.139.2021.05.07.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 22:49:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Pass correct ABI defines to swig
Date: Fri,  7 May 2021 22:49:42 -0700
Message-Id: <20210508054942.1527640-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This ensures that WORDSIZE is as per the target, currenrly this does not
get it right for cross compiling, and OE uses multilib headers by
default which means if WORDSIZE is wrong it will go on to include wtong
headers due to these artificial stubs

Fixes
swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2cryp=
to/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch=
64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/work/cor=
texa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aa=
rch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/inclu=
de-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1=
-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-gli=
bc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/in=
clude -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0=
/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/pyth=
on3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/include/=
openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/cortexa5=
7-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG/_m2c=
rypto_wrap.c SWIG/_m2crypto.i
  TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recip=
e-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find 'open=
ssl/opensslconf-32.h'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python3-m2crypto_0.37.1.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb=
 b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index 896d9d2cc4..305987d4f0 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -33,7 +33,9 @@ DISTUTILS_INSTALL_ARGS +=3D "build_ext --openssl=3D${STAG=
ING_EXECPREFIXDIR}"
=20
 SWIG_FEATURES_x86 =3D "-D__i386__"
 SWIG_FEATURES_x32 =3D "-D__ILP32__"
-SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__"
+
+SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.g=
etVar('SITEINFO_BITS') !=3D '32']}"
+
 export SWIG_FEATURES
=20
 # Get around a problem with swig, but only if the
--=20
2.31.1

