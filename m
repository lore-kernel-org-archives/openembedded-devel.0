Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E21CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:57:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6111.1763373426870800364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AR1wYtX1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b736f48ba11so483790266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763373425; x=1763978225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKiQvYCCuBsTxqvLK0C8qbBXPsUdR67d5L5tc8QRWR0=;
        b=AR1wYtX19LCRcuyTdFJbnt4A6qjvskWm8db6/A+U99umapPdOEM4HyGBKyEeTdmYOr
         UX6y/Z3x4QRlLm3Sj/aYo0jg2/Z0rYN5AUdlzpOHNdJ14E2EVvCw71j0puvftmhBcaBC
         DvCh19QB7eMgXmjqjtehcGCIgSG8OmT0QgitJ07ENr3h44TsThYbizAyZIFXPMUjc7LC
         lC//FIVCYC/iuQx3rSGUM9LazOQQ84roqwwOc3/Rucy9YqNQRPQM2kOjn1fWIclzcV6/
         6ajxBmEDOBe0xkhPC02PTOhnjhbPkJlRX1fv26+ZeViD8iwwwhF2as3tgjYNvWJbiUdM
         MtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373425; x=1763978225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKiQvYCCuBsTxqvLK0C8qbBXPsUdR67d5L5tc8QRWR0=;
        b=Ey6P2wwfsUkdTR2efNXhqCmYANDg4Zw2jT6vFEEvRQH+K8vWEWLG6xMW79r0gtzefb
         u/AI6BwOd+9BCHf9voAWgoFRgSDLcaQnN7IYK8Of6Nkb5nOa9RUANLb70rNr5rg3+3KP
         rPoPHk/NiqzTFDayJVAoOp69OCHf7ZsbLNzLNyQYWWgkyirivM+8rPWHJDLft4IAu3SY
         1CCsqvOypuE/ESBNLgJ6K9CeNY7ngO+2MkCTqJEfYvCYkHm6AzwuRFa/sIbx01be301s
         HP66bEF9xievDuf5S/4eeVIutMp8tZ4ufh8clEIVHOAM7x1s4LmaEnIsDwyynMx2WcNe
         o+Ew==
X-Gm-Message-State: AOJu0Yxq6FbHHvRTztWAKjReVQfw75BEZlHN38x2d2UbtUNWv1a6615v
	aoh2bVf0y/zfnbhMQMFLs5SO6E4+iZpdnak/dP9LroV+xQr1sA2k2d1Ak5JtNw==
X-Gm-Gg: ASbGnctfSEcQ6lPJqF/tI40B/9xNHUpN95ztEkbsj312+wzU11K4A62gkG1uGHSMZwy
	rVli2Sgf883eq51ZnE4rk7xyceMHKC4jdCqk1HH9sI3/fmYjM5HY3b7C4wgV4Oql6l3rKmpx7mY
	Cr7UnU49SE0DqkA802AU2ZAC8Y1ZsAt6cCHGI5e3prnN6aBJoV+3z8GMBWxhXG12jkY4WefMOYu
	r8bspXOsBm+q2sfXUogCvzhNZwTalEYQ4gl9s+vsDYy9IU4m6n6sIjpiS3AvaCNmYrbrORlNlb9
	3vxF+KO9DleGGDynybHDXwJtZN1+VlbXoal3/EoAezLcrcrW7WIuqm0SnBjtLZGg9AOuAmTNv/z
	oFbR9OPJQJ97gtEgNSkwoICcsHfPlukdsWRSZ1C8ynMD8R8SO8EtKJy0HjREZeqtAs6SGSEsgia
	1yZ5gmxyaqz25slYt2KlV8qPHH
X-Google-Smtp-Source: AGHT+IFnBpQbeHv92GX14TCzkEvbuxb3s+rvkxzALTf+HctUt/bHi8GwEP26TUXumPOXM5U9huGj8g==
X-Received: by 2002:a17:907:94c5:b0:b70:aebe:2ef7 with SMTP id a640c23a62f3a-b734839b941mr632653666b.14.1763373424662;
        Mon, 17 Nov 2025 01:57:04 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac68dsm1042108666b.62.2025.11.17.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:03 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [kirkstone][meta-oe][PATCH 1/5] nspr: fix buildpaths issue
Date: Mon, 17 Nov 2025 10:56:55 +0100
Message-ID: <20251117095659.937489-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121771

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: nspr-4.29-r0 do_package_qa: QA Issue: File /usr/bin/nspr-config in package nspr-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ig-nspr-config.in-don-t-pass-LDFLAGS.patch | 30 +++++++++++++++++++
 meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch b/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
new file mode 100644
index 0000000000..6ebc9c4ae6
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
@@ -0,0 +1,30 @@
+From 13e9d66c24d1dce5179805ae5e1bf940409b4914 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 10 Aug 2022 15:21:07 +0800
+Subject: [PATCH] config/nspr-config.in: don't pass LDFLAGS
+
+Don't pass LDFLAGS to avoid exposing the build env info.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/nspr-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/nspr-config.in b/config/nspr-config.in
+index 2cb62a0..2bec715 100755
+--- a/config/nspr-config.in
++++ b/config/nspr-config.in
+@@ -136,7 +136,7 @@ if test "$echo_libs" = "yes"; then
+       if test -n "$lib_nspr"; then
+ 	libdirs="$libdirs -lnspr${major_version}"
+       fi
+-      os_ldflags="@LDFLAGS@"
++      os_ldflags="LDFLAGS"
+       for i in $os_ldflags ; do
+ 	if echo $i | grep \^-L >/dev/null; then
+ 	  libdirs="$libdirs $i"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index c9215fc275..e79bd6127b 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://0001-Fix-Wincompatible-function-pointer-types.patch \
+           file://0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
            file://nspr.pc.in \
 "
 

