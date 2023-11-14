Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054DAC4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.5383.1699931303189027842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqAOosqh;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c4ed8eef16so3542023b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931302; x=1700536102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpOQO9cOF0S+ZeobZ+YTElzdWMTL7C/gwgO6N67ccoM=;
        b=BqAOosqhdfW4D0G2hwVnCOQHR4mVkUvx0ASlM9Sx6dV360k2qF4jKGAeBtYnZxAn9M
         FjknwDBbrsdgTzylxU0U51fizl+JvJqiaoP8hUFYDzrynUIw+B71A2Wzx96wEZBwxYIg
         TdU+K8tHNf8pV0NRJvW2arvsrku8MJH6s9521lT3zlCu3TrXjQhDXUhNVmoclITvI1mw
         rxWmH/Vr4qU6wQK8W1gW/389xVjPkOrdYd6DPFM6uV4d4um0PFa+EpBBBHWjVaHdFhyn
         7FaFInAE8XTJGO6gS3wc9vlyBHUCmE2Yg4tS/zyCyWBRaEyENwQiXolZ+3v7SxhSNURE
         fKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931302; x=1700536102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpOQO9cOF0S+ZeobZ+YTElzdWMTL7C/gwgO6N67ccoM=;
        b=MfFgUpNS0N+qyPQULWchddx9pM59JpKc3CuUcC5zzIiJ4S+snnyWUIiNaNXg4JEtyX
         pwP9a+ndnvNsM2ET3HERZZ/RXJ6cre1wPjHZwEyqCwRGX0u4xudRNMuJDHHtEYjH8Lk0
         QAtZwbA4/+mFOSk6hgkJhX5+vPjY3HiuPcrijHeIOs+XeyC9ThzFyU5+MDyWKOGNmiNf
         SLNi2YSJsB68URegajkObFE/6gTeJnIV2SfskayQoy5gIClOPb4cvu60V8cEN8EQwokY
         qsznmRV6iZ5rt030yOdTs3WmtxtwcpC8XxUFqqabv7My1aymQA1NRAN6/MlbHGD2lKo+
         mOKQ==
X-Gm-Message-State: AOJu0YzPC/nROHWH4WtWIw+pqKWsFBGX2jlDSqefm8ydYItZxHzmxN8j
	9AC0aMZlYzfuqj9mBZXpVLlGEjaslmO+GA==
X-Google-Smtp-Source: AGHT+IHHZA4RVf3gR74KhLs4GxIKHAcaerndm5KC5oSGTlKF+zjoOZG9weK2a75n2ulorj+NWDt/+w==
X-Received: by 2002:a05:6a20:1447:b0:17e:2afd:407f with SMTP id a7-20020a056a20144700b0017e2afd407fmr11504849pzi.9.1699931302169;
        Mon, 13 Nov 2023 19:08:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/10] beep: Upgrade to 1.4.12
Date: Mon, 13 Nov 2023 19:08:08 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-7-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106694

Fix build with clang while here, need to disable Werror as newer=0D
compilers find more warnings.=0D
=0D
Do not save intermediate objects and disable ubsan, we do not build=0D
runtime for it by defaults=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 .../beep/{beep_1.4.9.bb =3D> beep_1.4.12.bb}         | 19 +-----=0D
 ...se-Werror-as-it-fails-with-newer-clang-11.patch | 63 -----------------=
=0D
 ...-beep-library-Make-it-compatible-with-c99.patch | 78 ++++++++++++++++++=
++++=0D
 3 files changed, 81 insertions(+), 79 deletions(-)=0D
=0D
diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb b/meta-oe/recipes-=
extended/beep/beep_1.4.12.bb=0D
similarity index 59%=0D
rename from meta-oe/recipes-extended/beep/beep_1.4.9.bb=0D
rename to meta-oe/recipes-extended/beep/beep_1.4.12.bb=0D
index ec62f31870..442acd1a93 100644=0D
--- a/meta-oe/recipes-extended/beep/beep_1.4.9.bb=0D
+++ b/meta-oe/recipes-extended/beep/beep_1.4.12.bb=0D
@@ -8,24 +8,11 @@ LICENSE =3D "GPL-2.0-or-later"=0D
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"=0D
 =0D
 SRC_URI =3D "git://github.com/spkr-beep/beep.git;protocol=3Dhttps;branch=
=3Dmaster \=0D
-           file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.p=
atch \=0D
-"=0D
-SRCREV =3D "8b85ddd09f73b9fd7caa5679298781a57af194ac"=0D
+           file://0001-beep-library-Make-it-compatible-with-c99.patch"=0D
+SRCREV =3D "11453a79f2cea81832329b06ca3a284aa7a0a52e"=0D
 S =3D "${WORKDIR}/git"=0D
 =0D
-EXTRA_OEMAKE =3D " \=0D
-    COMPILER_gcc=3D'${CC}' \=0D
-    LINKER_gcc=3D'${CC}' \=0D
-    COMPILER_clang=3Dno \=0D
-    LINKER_clang=3Dno \=0D
-"=0D
-=0D
-EXTRA_OEMAKE:toolchain-clang =3D " \=0D
-    COMPILER_clang=3D'${CC}' \=0D
-    LINKER_clang=3D'${CC}' \=0D
-    COMPILER_gcc=3Dno \=0D
-    LINKER_gcc=3Dno \=0D
-"=0D
+EXTRA_OEMAKE =3D "prefix=3D'${prefix}' CFLAGS=3D'${CFLAGS}'"=0D
 =0D
 do_install() {=0D
     oe_runmake install DESTDIR=3D'${D}'=0D
diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-=
it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended/beep/files/00=
01-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch=0D
deleted file mode 100644=0D
index ba7681b983..0000000000=0D
--- a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fail=
s-with-newer-clang-11.patch=0D
+++ /dev/null=0D
@@ -1,63 +0,0 @@=0D
-From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 2001=0D
-From: Khem Raj <raj.khem@gmail.com>=0D
-Date: Wed, 23 Dec 2020 18:00:59 +0000=0D
-Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+=0D
-=0D
-Upstream-Status: Pending=0D
-Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
----=0D
- GNUmakefile | 1 -=0D
- 1 file changed, 1 deletion(-)=0D
-=0D
---- a/GNUmakefile=0D
-+++ b/GNUmakefile=0D
-@@ -91,12 +91,13 @@ comma :=3D ,=0D
- # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.=0D
- # Example usage:=0D
- #   $(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-tables))=0D
--define CHECK_CFLAGS_gcc=0D
--CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-c=
heck.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm=
 -f compile-check.gcc-o > /dev/null 2>&1),$(1))=0D
--endef=0D
- =0D
- COMPILER_gcc =3D gcc=0D
- LINKER_gcc =3D gcc=0D
-+ifneq ($(COMPILER_gcc),no)=0D
-+define CHECK_CFLAGS_gcc=0D
-+CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-c=
heck.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm=
 -f compile-check.gcc-o > /dev/null 2>&1),$(1))=0D
-+endef=0D
- CPPFLAGS_gcc =3D=0D
- CFLAGS_gcc =3D=0D
- CFLAGS_gcc +=3D -std=3Dgnu99 -pedantic=0D
-@@ -113,30 +114,24 @@ CFLAGS_gcc +=3D -save-temps=3Dobj=0D
- LDFLAGS_gcc =3D=0D
- LIBS_gcc =3D=0D
- =0D
--ifneq ($(call pathsearch,$(COMPILER_gcc)),)=0D
--ifneq ($(COMPILER_gcc)),no)=0D
- COMPILERS +=3D gcc=0D
- endif=0D
--endif=0D
- =0D
- COMPILER_clang =3D clang=0D
- LINKER_clang =3D clang=0D
-+=0D
-+ifneq ($(COMPILER_clang),no)=0D
- CPPFLAGS_clang =3D=0D
- CFLAGS_clang +=3D -Wall -Wextra=0D
- CFLAGS_clang +=3D -Weverything=0D
- CFLAGS_clang +=3D -Wno-padded=0D
- CFLAGS_clang +=3D -std=3Dgnu99 -pedantic=0D
--CFLAGS_clang +=3D -Werror=0D
--CFLAGS_clang +=3D -fsanitize=3Dundefined=0D
- CFLAGS_clang +=3D -O -g=0D
- LDFLAGS_clang =3D=0D
- LIBS_clang =3D=0D
- =0D
--ifneq ($(call pathsearch,$(COMPILER_clang)),)=0D
--ifneq ($(COMPILER_clang),no)=0D
- COMPILERS +=3D clang=0D
- endif=0D
--endif=0D
- =0D
- =0D
- ########################################################################=
=0D
diff --git a/meta-oe/recipes-extended/beep/files/0001-beep-library-Make-it-=
compatible-with-c99.patch b/meta-oe/recipes-extended/beep/files/0001-beep-l=
ibrary-Make-it-compatible-with-c99.patch=0D
new file mode 100644=0D
index 0000000000..240e075a89=0D
--- /dev/null=0D
+++ b/meta-oe/recipes-extended/beep/files/0001-beep-library-Make-it-compati=
ble-with-c99.patch=0D
@@ -0,0 +1,78 @@=0D
+From 66b06e03fc25a168e06c7af5ccccc3162ddbf92a Mon Sep 17 00:00:00 2001=0D
+From: Khem Raj <raj.khem@gmail.com>=0D
+Date: Mon, 13 Nov 2023 17:18:55 -0800=0D
+Subject: [PATCH] beep-library: Make it compatible with < c99=0D
+=0D
+Upstream-Status: Pending=0D
+Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
+---=0D
+ beep-library.c | 9 +++++----=0D
+ 1 file changed, 5 insertions(+), 4 deletions(-)=0D
+=0D
+--- a/beep-library.c=0D
++++ b/beep-library.c=0D
+@@ -44,7 +44,7 @@=0D
+ int open_checked_char_device(const char *const device_name)=0D
+ {=0D
+     struct stat sb;=0D
+-=0D
++    int fd =3D -1;=0D
+     if (-1 =3D=3D stat(device_name, &sb)) {=0D
+         LOG_VERBOSE("could not stat(2) %s: %s",=0D
+                     device_name, strerror(errno));=0D
+@@ -57,7 +57,7 @@ int open_checked_char_device(const char=0D
+         return -1;=0D
+     }=0D
+ =0D
+-    const int fd =3D open(device_name, O_WRONLY);=0D
++    fd =3D open(device_name, O_WRONLY);=0D
+     if (fd =3D=3D -1) {=0D
+         LOG_VERBOSE("could not open(2) %s: %s",=0D
+                     device_name, strerror(errno));=0D
+@@ -90,6 +90,7 @@ void safe_error_exit(const char *const m=0D
+ {=0D
+     const int saved_errno =3D errno;=0D
+     char strerr_buf[128];=0D
++    size_t errlen, msglen;=0D
+     const int ret =3D strerror_r(saved_errno, strerr_buf, sizeof(strerr_b=
uf));=0D
+     if (ret !=3D 0) {=0D
+         if (write(STDERR_FILENO, "strerror_r error\n",=0D
+@@ -98,14 +99,14 @@ void safe_error_exit(const char *const m=0D
+         }=0D
+         _exit(EXIT_FAILURE);=0D
+     }=0D
+-    const size_t msglen =3D strlen(msg);=0D
++    msglen =3D strlen(msg);=0D
+     if (write(STDERR_FILENO, msg, msglen)) {=0D
+         /* ignore all write errors */=0D
+     }=0D
+     if (write(STDERR_FILENO, ": ", 2)) {=0D
+         /* ignore all write errors */=0D
+     }=0D
+-    const size_t errlen =3D strlen(strerr_buf);=0D
++    errlen =3D strlen(strerr_buf);=0D
+     if (write(STDERR_FILENO, strerr_buf, errlen)) {=0D
+         /* ignore all write errors */=0D
+     }=0D
+--- a/GNUmakefile=0D
++++ b/GNUmakefile=0D
+@@ -155,7 +155,6 @@ $(eval $(call CHECK_CFLAGS,common_CFLAGS=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Wall))=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Wextra))=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Weverything))=0D
+-$(eval $(call CHECK_CFLAGS,common_CFLAGS,-Werror))=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Wno-padded))=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Werror=3Dformat-security))=0D
+ $(eval $(call CHECK_CFLAGS,common_CFLAGS,-Wno-disabled-macro-expansion))=
=0D
+@@ -169,11 +168,6 @@ $(eval $(call CHECK_CFLAGS,CFLAGS,-fanal=0D
+ $(eval $(call CHECK_CFLAGS,CFLAGS,-fstack-protector-strong))=0D
+ $(eval $(call CHECK_CFLAGS,CFLAGS,-fstack-clash-protection))=0D
+ $(eval $(call CHECK_CFLAGS,CFLAGS,-fcf-protection))=0D
+-$(eval $(call CHECK_CFLAGS,CFLAGS,-fsanitize=3Dundefined))=0D
+-=0D
+-=0D
+-CFLAGS +=3D -save-temps=3Dobj=0D
+-=0D
+ =0D
+ $(info # common_CFLAGS=3D$(common_CFLAGS))=0D
+ $(info # CFLAGS=3D$(CFLAGS))=0D
=0D
-- =0D
2.42.1=0D
=0D

