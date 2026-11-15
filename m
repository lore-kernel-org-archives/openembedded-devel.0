Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3860.1794729005969972384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QJRQzeGU;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3704d30b84fso2948674eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729005; x=1795333805; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvPsDvBBAq7Wh62AfKJSLM5e5xgKl/lul9v8rD0fS1o=;
        b=QJRQzeGUVpD75+zMsrlPCY7P1+E2tbDsKaPXiZIsyk/vuFuG3PxFqcB22JsPXzBa1a
         7KJkX2Mx0mjNtg8vJgUtTP+eHcz4if5BHHohj/BOVsAaaJHEY9K4M+PMopfAhI1pxeJW
         S3lo/AbBA12ymaWbolP2tuGzDgYoIOByPcLJ6XOv7gvi1uwAfCw2NLdxYLVTidhiwZwP
         AyGtm1xIV/STE3XyG3OQA0RRUFLOuWCCuPBgU6TXYXiF/tho2KT2hDRE4GYtznzltjk4
         M3cnOv+veVI6DBKfBKXuWGnzToQ4f7ehoHJdALAUDi6b+jIMLND7SKTwLQxBO1RKjix3
         UyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729005; x=1795333805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvPsDvBBAq7Wh62AfKJSLM5e5xgKl/lul9v8rD0fS1o=;
        b=lpWmiZfHs+D6zrtfh1VAB7lfcnqFYE8BY0FEj7gtPfdGJ3XMvr3fKBXyfCVsMgxf/s
         +v9v2vd1d+rNe4MoKcBhrvHurOm7yQQrzGpNNng1IB6wgxd6AR78NvkrhOCsj5sBR4uN
         n7Kp5NQBJWtqQrdu4j0/xGsMvQa/wFybQRjbB47ZNXJ+RcFT+dsJSuSvJxR/UcJF0u2o
         7fXVcvvumIbrsIxViMg6l5csLCrTk5O587kiAN1AjljhF2otVuhnsEqaCS3Pp0B94Gek
         K7+xsxsgrXwBlz2n3gcRj7/E0DoYJC7/hrWJ/o91Fr51M3pRDB7Je8LbyMIcKawNXAXs
         os3g==
X-Gm-Message-State: APuU4Z9skhB5Z4cQ3moEFLK5zk/mSeAJxi8HfJfqglQf8GgKABoeueRm
	TmgvW3Z1uQpcJbdv8sBq5nwzTYo0ZFhhb5juhECo657s/eWQI74L8kRAiBogc+vV
X-Gm-Gg: AYBFou0eKhglbAxsERE5cZd9REfcC43jK12rZOJqnJnnE/837qGNYItsg11xSNnNpK5
	ZvQqIMs9oF3VHo4uIBp3sxP90VblpasaPPpZd28lVG3qqSBso35B6mL+liY6kQZZ6QWHWmnkFNf
	2RfF9sYDLryYEIWstaTsW59IANljGmtW7M4e5gdoo/Dwf1Ir1iMKSj07BHaV7qOP+e0FJ3vGZvF
	05ingq+w7jm8qVK4DlIRBDoTysH58eClUPunl5YzXRB8ypcTvsMrvFwPIpM9PArVt4ucNj9Sm+c
	JJ1mINP64CQuyGuIBN0zPWhCBLv6z57IaB09rAZFDBrE1xUDxbKeH++C0u9rtjwPDxsazF1kTxx
	S2wfs2+S+nhGljOfZHU94MAg6+HoeHF05YZHg1rats8ZakX7tTbOPfFuiOAV1aIB51KJfz7ObmJ
	3bCe48Z0L6AmhmQJxEQJKXzBi1Ng9tTOkT+gpnGY43gUjB/hHEivL9CJaNx1bcjSf+Swjc9KyE+
	Dxz+huE4n7RVLLPhFctCMvk8bak9zAzyReqfCmkaOK1OkQXC7p9iy1Rh+N+kS8wvltb4wtxJ2I7
	zTPiCY6chCan8DUbRRvIELdnrYNejWkBbUC5ATggjc1tzPurmd5230L6+ZpD6PRHZuh9NC6BsqU
	y995vB/MM6I3X8T1dSsBTNCNBseclaPmd5p8nm6Ks67O5gFEgf6QNghPHup9758X2F/2O/3NYzt
	jYlJvqXnh4IvuuKgH3t9D42QENhhE+WRNZSM7t8kB7Sp837RjJCwdm5V3BSArH3OqkgLGxOoZrL
	caVS8eTnfdOVnRP+3nZ72YG/nJ9vBping2r/XRFmMjpkfa4RSvO604U8NSC4h9KfN10j4OxCcqF
	5tETJNzwhNTmft5FqYENjySJYw==
X-Received: by 2002:a05:7301:f2b:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-37968d8b5c6mr7401222eec.40.1794729005242;
        Sat, 14 Nov 2026 23:50:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 28/96] libstemmer: upgrade 3.1.1 -> 3.2.0
Date: Sat, 14 Nov 2026 23:48:06 -0800
Message-ID: <20261115074918.2932593-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132298
Content-Type: text/plain; charset="utf-8"

Refresh 0001-Build-so-lib.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libstemmer/0001-Build-so-lib.patch        | 24 +++++++++----------
 ...ibstemmer_3.1.1.bb => libstemmer_3.2.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/libstemmer/{libstemmer_3.1.1.bb => libstemmer_3.2.0.bb} (96%)

diff --git a/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
index 356ef8b469..99799e0019 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
+++ b/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -14,38 +14,38 @@ Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- GNUmakefile           | 7 +++++--
- libstemmer/symbol.map | 6 ++++++
+ GNUmakefile           |    7 +++++--
+ libstemmer/symbol.map |    6 ++++++
  2 files changed, 11 insertions(+), 2 deletions(-)
  create mode 100644 libstemmer/symbol.map
 
 --- a/GNUmakefile
 +++ b/GNUmakefile
-@@ -311,12 +311,12 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.
+@@ -332,12 +332,12 @@
  JAVA_CLASSES = $(JAVA_SOURCES:.java=.class)
  JAVA_RUNTIME_CLASSES=$(JAVA_RUNTIME_SOURCES:.java=.class)
-
+ 
 -CFLAGS=-g -O2 -W -Wall -Wcast-qual -Wmissing-prototypes -Wmissing-declarations -Wshadow $(WERROR)
 +CFLAGS=-g -O2 -fPIC -W -Wall -Wcast-qual -Wmissing-prototypes -Wmissing-declarations -Wshadow $(WERROR)
  CPPFLAGS=
-
+ 
  INCLUDES=-Iinclude
-
+ 
 -all: snowball$(EXEEXT) libstemmer.a stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
 +all: snowball$(EXEEXT) libstemmer.a libstemmer.so stemwords$(EXEEXT) $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
-
+ 
  algorithms.mk: GNUmakefile libstemmer/mkalgorithms.pl $(MODULES)
  	libstemmer/mkalgorithms.pl algorithms.mk $(MODULES)
-@@ -424,6 +424,9 @@ libstemmer/libstemmer.o: libstemmer/modu
+@@ -447,6 +447,9 @@
  libstemmer.a: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
- 	$(AR) $(ARFLAGS) $@ $^
-
+ 	$(AR) $(ARFLAGS_)$@ $^
+ 
 +libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
 +	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
 +
  examples/%.o: examples/%.c
- 	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c -o $@ $<
-
+ 	$(CC) $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -c $(o_for_obj) $@ $<
+ 
 --- /dev/null
 +++ b/libstemmer/symbol.map
 @@ -0,0 +1,6 @@
diff --git a/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb b/meta-oe/recipes-support/libstemmer/libstemmer_3.2.0.bb
similarity index 96%
rename from meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
rename to meta-oe/recipes-support/libstemmer/libstemmer_3.2.0.bb
index 0e74366268..4cf7724d15 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
+++ b/meta-oe/recipes-support/libstemmer/libstemmer_3.2.0.bb
@@ -8,7 +8,7 @@ DEPENDS:append:class-target = " ${BPN}-native"
 SRC_URI = "git://github.com/snowballstem/snowball.git;branch=main;protocol=https;tag=v${PV} \
            file://0001-Build-so-lib.patch \
            "
-SRCREV = "cd195b51e948a902a4312f023f4a14392516a543"
+SRCREV = "6389c79f91cd67ed2de3ebdcf84ec8c2d2d23c11"
 
 LIBVER = "0.0.0"
 
