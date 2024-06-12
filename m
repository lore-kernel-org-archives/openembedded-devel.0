Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34AEC27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 07:52:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.5984.1718178737762060897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 00:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZK4aYUQn;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so71981211fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718178736; x=1718783536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cd4XPIyBgKHM9Mnh6A4CchEzVFKlKyI/uNfF4g+WJUI=;
        b=ZK4aYUQnnGDv6+ylWrGe9Qi/uxAZp17GC+n4w3iMVB75gyW6Y4VztQ7+tlUipYk4lp
         c3YZ7D+f6qtX2F/wCKYK90YIEqStG4AE05PH75OPek7HWr8r+Eq2Q20am/82twItx83e
         E9BGpeXsDerN2uPumVcJ3TbxcCrMYQB+N5CRBg3weGSO4ea7EDJ0FpAGb/VYSarj0j63
         lHd0/z5zBVXVXn+u2JAcoqv0guv8vDl7SIt1xK4DBq1yhbVsdopizPVVnO6K3MDssEWW
         zOXFlOltmf/VbAyhwJqwv0KZgRXw4xXSzb5wmoUtv086CXFjpCId4Gj1bT5v7SYVjns8
         52ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178736; x=1718783536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cd4XPIyBgKHM9Mnh6A4CchEzVFKlKyI/uNfF4g+WJUI=;
        b=cCUqusJhTTyenmr5roSU19V2RF4NQTS6hw2BphdEnlHbhgGuX/FMbpqbtDWdW2MDmb
         Il2enSWV2y4cBK4UWBVUM83kM1rHhPnuF9lCzqeKyDk9zFj79tmiE+Kx2hs5iJqX4mVF
         JR9I7Ipe9GNvzoV0xKKt0R4KEcT9P2v8+4xx6OFYdH5gOwKaitSiofdXSTg2So1nf41V
         V/foZCictH7KW+RDS4zAKKDjR6DbVadGxUm3b5Vm0WR9vG8NV4dB2raXWPI4gw0kdvQ6
         Djl5z7D3zo/3nMiJoVD6BUf/ZkgDAhVAOXQH7AB8lL7mPU0qdSltccdB5O5slMc6GWrn
         tAMg==
X-Gm-Message-State: AOJu0YxLkTEeUG0A/pdOSe5pKXUKgIGEIlAQgDd0OY+iYDbP+/Yvzwak
	lgVolUDIiTw3mnrX5oy64yZhQuV20GHHwuJ0NBbPvREN3Gb0dfNIZxq1Sq0WO8LApnNL0EcC7VU
	1hx8=
X-Google-Smtp-Source: AGHT+IEMJh4t8unAQBFgkHPA1KErF8rObW+QPFkZ199su8+XkDo2A72WOZ0d/QrVIlf1TuxjMqMGBg==
X-Received: by 2002:a05:651c:1713:b0:2eb:f423:a78 with SMTP id 38308e7fff4ca-2ebfc9ab3bemr4509311fa.51.1718178735586;
        Wed, 12 Jun 2024 00:52:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebf8962b2esm3430771fa.126.2024.06.12.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:52:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][PATCH v2] cabextract: add utility to extract Microsft cabinet files
Date: Wed, 12 Jun 2024 10:52:14 +0300
Message-Id: <20240612075214.2234052-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 07:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110882

WoA firmware, fonts and some other useful files are being distributed as
a Microsoft cabinet files. Add recipes for the cabextract utility, which
is used to extract such files.

Cabextract can either use a bundled source tree for libmspack library or
an externally provided library. Package the library separately in order
to be able to share it with the meta-security layer.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Added fnmatch.c patch to fix rpl_fnmatch-related build issues.

---
 .../cabextract/cabextract/fix-fnmatch.patch   | 40 +++++++++++++++++++
 .../cabextract/cabextract_1.11.bb             | 22 ++++++++++
 .../cabextract/libmspack_0.11alpha.bb         | 16 ++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
 create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1.11.bb
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb

diff --git a/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch b/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
new file mode 100644
index 000000000000..bd486283b67d
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/cabextract/fix-fnmatch.patch
@@ -0,0 +1,40 @@
+From - Mon Jun 11 00:00:00 2024
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Subject: [PATCH] Don't play with fnmatch.c replacement
+
+Currently fnmatch.c, even if it is selected, conditionally disables compilation
+of fnmatch() funciton even though the rest of the code expects to get it (e.g.
+because Autoconf didn't detect the working implementation and enabled fnmatch.c
+to replace it). Drop the extra conditionals, to fix Autoconf magic.
+
+Observed error:
+
+ld: src/cabextract.o: in function `process_cabinet':
+/usr/src/debug/cabextract/1.11/src/cabextract.c:499:(.text.startup+0xf1c): undefined reference to `rpl_fnmatch'
+collect2: error: ld returned 1 exit status
+
+Upstream-Status: Submitted [https://github.com/kyz/libmspack/pull/51]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+Index: cabextract-1.11/fnmatch.c
+===================================================================
+--- cabextract-1.11.orig/fnmatch.c
++++ cabextract-1.11/fnmatch.c
+@@ -49,11 +49,6 @@ static const char rcsid[] =
+    it is simpler to just do this in the source for each such file.
+ */
+ 
+-#if defined (_LIBC) || !defined (__GNU_LIBRARY__)
+-
+-#if !defined(__GNU_LIBRARY__) && !defined(STDC_HEADERS)
+-#endif
+-
+ /* Match STRING against the filename pattern PATTERN, returning zero if
+    it matches, nonzero if not.  */
+ int
+@@ -216,5 +211,3 @@ int         flags;
+ 
+         return FNM_NOMATCH;
+ }
+-
+-#endif /* _LIBC or not __GNU_LIBRARY__.  */
diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
new file mode 100644
index 000000000000..0f06489ca978
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Software for extracting Microsoft cabinet files"
+DESCRIPTION = "tool for extracting Microsoft cabinet files"
+HOMEPAGE = "http://www.cabextract.org.uk/"
+SECTION = "console/utils"
+
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://src/cabextract.c;beginline=4;endline=11;md5=b0a10c6d3843f262114e7ecf91fc7e78"
+
+SRC_URI = "\
+    https://www.cabextract.org.uk/cabextract-${PV}.tar.gz \
+    file://fix-fnmatch.patch \
+"
+
+SRC_URI[sha256sum] = "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6"
+
+DEPENDS = "libmspack"
+
+EXTRA_OECONF = "--with-external-libmspack"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
new file mode 100644
index 000000000000..169a5f271be9
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A library for Microsoft compression formats"
+DESCRIPTION = "The library provides compressors and decompressors,\
+archivers and dearchivers for Microsoft compression formats: CAB, CHM, WIM,\
+LIT, HLP, KWAJ and SZDD."
+HOMEPAGE = "http://www.cabextract.org.uk/libmspack/"
+SECTION = "lib"
+LICENSE = "LGPL-2.1-only"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
+
+inherit autotools
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.39.2


