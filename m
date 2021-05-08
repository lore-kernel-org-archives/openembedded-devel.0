Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.8045.1620489463182575514
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 08:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ucHU0Z4c;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id m124so9583279pgm.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zliGppD3PXHEwvnQQBDhKxK4Vaai7hhxbJK+0FUHdl0=;
        b=ucHU0Z4csVHS29ul5y/+HNzY8ZgXbPH+41vGIBkDlahOtq7pa8pP+IEzC2k63Wi14b
         11Mq9+lBy32cBEb2AGUcZL7lphoFIVoeEdjeYm7up2r8OwvNSZdn1cbuQTkP7VPvH18v
         DTugXMAH2oRJrLyxGAB8KdACOBqGYf9Pwd0nHt96QEVq3sZ8hPMl6xsdr8IDq2KeNged
         I3MpQGb3A/+UhTY2y/4QzEh7UNVK2Xl/poaZmOIXSO/ZwTBsEFJ6mKQOf+wVC0O81kkj
         ykU5iLNYN+Yjt/Lr9VQnZMlzCE1YJSU+Oc0DnR+vYTdCJLug3q8h65//v8+2VpmqZ6yx
         oMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zliGppD3PXHEwvnQQBDhKxK4Vaai7hhxbJK+0FUHdl0=;
        b=lHHkh8LxRMw1plk8e1HQ+3H3C/e4WTvgRxs9qB2Zj7KVlbqeTF5NmdcNAvw/HxdFZ2
         WucMrMx01G+MNzm6XRZr3ygZ8octJ70GCitVh9wx4wGYwVZVxYImxaRyN/dnDZCb2lYK
         kqZAKoFELw8s+1ty/qK0li3yqcRK7Azd9dQKcIjm/6w12ARd5nmWgEeOHwA+JBzF6TtY
         RJrGn6Hj+ukmqmDu3EenjqPjuPLlnf/sH8DPLa7C6PL6IBOv7HBXTsI6Qt2mgvHOArzI
         0oz6QreiimIUSrhHNw7XCxOIZ4GHsQqekBJsCu+mH2GGoJR0qPQ5xVGRBWOkDy/TQuG7
         lJLw==
X-Gm-Message-State: AOAM532ubkqTayZuHE5jvh2RkWvGZV8hAe5SMWHRHQwYGpA+NuM6QxBs
	YXidB/7Z22kmF8+lhpF4iFUcyTk6812NOg==
X-Google-Smtp-Source: ABdhPJyhswjoU237u4YtrZYhqvBLpWNSO8aYWwZKw9AYlhz8Ff8MkVN4il9x74kIqX6MgFDxkIUEbg==
X-Received: by 2002:a63:a42:: with SMTP id z2mr15979438pgk.52.1620489462432;
        Sat, 08 May 2021 08:57:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id q19sm6999814pgv.38.2021.05.08.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 08:57:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH v2] python3-m2crypto: Pass correct ABI defines to swig
Date: Sat,  8 May 2021 08:57:39 -0700
Message-Id: <20210508155739.3380129-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508155739.3380129-1-raj.khem@gmail.com>
References: <20210508155739.3380129-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This ensures that WORDSIZE is as per the target, currently this does not
get it right for cross-compilation env, and OE uses multilib headers by
default ( even when you do not use multilib ) which means if WORDSIZE
is wrong it will go on to include wrong headers due to these artificial stu=
bs

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
v1->v2:
- Fix typos in commit
- Drop do_configure_prepend as its no longer needed

 .../python/python3-m2crypto_0.37.1.bb         | 28 ++-----------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb=
 b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index 896d9d2cc4..ef123075c7 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -33,31 +33,9 @@ DISTUTILS_INSTALL_ARGS +=3D "build_ext --openssl=3D${STA=
GING_EXECPREFIXDIR}"
=20
 SWIG_FEATURES_x86 =3D "-D__i386__"
 SWIG_FEATURES_x32 =3D "-D__ILP32__"
-SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__"
-export SWIG_FEATURES
=20
-# Get around a problem with swig, but only if the
-# multilib header file exists.
-#
-do_configure_prepend() {
-    ${CPP} -dM - < /dev/null | grep -v '__\(STDC\|REGISTER_PREFIX\|GNUC\|S=
TDC_HOSTED\)__' \
-    | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > ${S}/SWIG/gcc_ma=
cros.h
-
-    if [ "${SITEINFO_BITS}" =3D "64" ];then
-        bit=3D"64"
-    else
-        bit=3D"32"
-    fi
-
-    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "${S}/$i"
-        done
-    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "${S}/$i"
-        done
-    fi
-}
+SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.g=
etVar('SITEINFO_BITS') !=3D '32']}"
+
+export SWIG_FEATURES
=20
 BBCLASSEXTEND =3D "native"
--=20
2.31.1

