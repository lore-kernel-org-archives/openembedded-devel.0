Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1649.1792738442583459307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MI2TX0/Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05b210703so281034b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738442; x=1793343242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjlj1qdfBWU9lG0JyGhTSSgmWwCZp5WfmMqAr/+tokc=;
        b=MI2TX0/Yv0fZTiCwkDVtyjc0Nzq8ap8X2tH4ckuyHqFVby0rly00llt2QWy6kOXcUX
         zr3Wf8p1EvjZnTjuqMS9G/RtQZ+DIONwscto7cVCDpycTJchJ9xULNFRohgQ/TSVsfvb
         Je9pxVyJHfiD53j/iIMVpBns3cWYCImljYs9ZkkE02AijZ9YNgIDSxbeaQ+Vnt1KXT0b
         V2pu4csXnI1DZQQfBL62iw8YJSRBpDPjZKavn18wOluAhDX/qt7rqI6GeZGpBfzP7fos
         4WGpUJdKNn7OpJzz+J+M4CobIJ7Rb8CfXrWJ3Rs6ThLkCfq0gCZXhJH2Kadw5ZP8pW8D
         1GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738442; x=1793343242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjlj1qdfBWU9lG0JyGhTSSgmWwCZp5WfmMqAr/+tokc=;
        b=rt49padMCUIkhRvIR0ouyRWbo4w5gpv3FJI6Gix2jEwN7cVFMIyvd2FLtJE+RLiEIA
         s5/xSLlwGBTZ0AGLd3GU2pCFMl+OplBBr/qQNgTi2U5pv4xRhDYEmlwADeQUF59dP6F0
         8ZmL2DBhFlXESBKYEpep6duVpvu6hYFfxUczIucTHcWziipI7raH1z1RFkHTiREPly2n
         1PyIWAXQg1TZxqC1psS4+syU9h2hpDjulJIPlPqG0yZe2Mh4JNrvaD/M+nTt3YOApxRa
         3zqX2Ue2ldpoRRPehrszGzCei90CMOREDRfF3ng/Inzqc/9XF3VEs5Iw+ihEsgV4htjv
         fggQ==
X-Gm-Message-State: AFq9FYK6GSVyvquiA3G3XBW9XV8W8M7pILGua0gIUFl638k75TmwHnax
	K+e6UhmwWCmAmVo4HWq3asNx6gaVtZdT59evqwe+oBDhA2tJxLalpUIRb6qCvTjPTnI=
X-Gm-Gg: AYBFou2zwenFjg+S3c/5gyFE6m/PnLu+LwQA6us+Ju2LayRd+X11P9vPWm3dtMC8PYw
	tLvQkvljUf9Ev7zEose2RFtwn2UG6FLeTvEmSY3RzbORm8StEu+Ivoqx7ocaOqzrFvVaZHd0/A/
	H4uKfvLS7/7hDSnRc+JyNVLU3dbM0NGJDBzQc2egk3d++bNFICKyYAMSPmkuHk1ZcoabD//CHtz
	sAT9jCZgyN5G24ZJdt+jWCy8q/ekrjoa8ODafTATHISqt8qd2OexKRUbxbhi6x2tY4MGGK0xsUs
	cJFBDQEZ3GsbEKZGpmyp8Irsajdv+ALaRrNZZizNsRciE9GzwVvtCU+mZJS1mekQk9DFNX55q1P
	FGUT0H74RLZxjhJvR7ro5pn4y82e8ZRKne7cka8A49v7GX2BwATGiWqxLNAJC/Jw/h9VM2OCiYO
	mxOAuiM6obtySmhi8GlTRfq/bHE2TqQcTM7h8Uz3I6fmOOjpqLxVOO6VkOP67zlifbdJJJbhHdf
	jrsQvimTwWtMCrr3WuTjHrdXXOuzR91FvlfjUNOsoM6Jy2uFykVQkB4A6gLXp3iYq6IK5LoZbFL
	veObQm16YZB/9K8TxkvRZkO/vO7k9JF3D+9Nq/mmwpAlUJtJ75mQITLJfCv1ZN/LvK63KRJcHaM
	mP1KenIgGWYTA/GhiMzARSCoKk8NSLetLYh05zq+thjIm8qSwWBGJ9+ilTlJo/cnJW1WT+uvJhA
	oBPAEzR7sGAqdX3dUlK0Yu8JNmQ1bIoMwqJgXco8eQj/+KHX9DDBXxp3NstoQzV5FZBMleLYQgt
	jEDd8JdyhY9M1vnjfb7Yzx80WpGezQ=
X-Received: by 2002:a05:6a00:f89:b0:89f:feb6:5d5d with SMTP id d2e1a72fcca58-8a2c62ac969mr1279263b3a.33.1792738441790;
        Thu, 22 Oct 2026 23:54:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 07/29] pgpool2: Define SIZEOF_LONG and SIZEOF_LONG_LONG
Date: Thu, 22 Oct 2026 23:53:28 -0700
Message-ID: <20261023065350.3228996-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131331
Content-Type: text/plain; charset="utf-8"

When cross compiling for a 32-bit target such as riscv32, configure
cannot test the long long snprintf format and builds the replacement
snprintf(), which fails because SIZEOF_LONG and SIZEOF_LONG_LONG are
never defined:

  snprintf.c:651:2: error: "cannot find integer type of the same size as size_t"

Add a patch that checks the size of long and long long in configure.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Check-the-size-of-long-and-long-long.patch | 39 +++++++++++++++++++
 .../recipes-support/pgpool2/pgpool2_4.7.3.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0002-configure-Check-the-size-of-long-and-long-long.patch

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0002-configure-Check-the-size-of-long-and-long-long.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0002-configure-Check-the-size-of-long-and-long-long.patch
new file mode 100644
index 0000000000..ef546383a6
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0002-configure-Check-the-size-of-long-and-long-long.patch
@@ -0,0 +1,39 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 01:00:00 -0700
+Subject: [PATCH] configure: Check the size of long and long long
+
+The replacement snprintf() in src/parser/snprintf.c handles the %z
+length modifier by comparing SIZEOF_SIZE_T with SIZEOF_LONG and
+SIZEOF_LONG_LONG, but configure only defines SIZEOF_UNSIGNED_LONG,
+SIZEOF_VOID_P and SIZEOF_SIZE_T. The undefined macros evaluate to 0 in
+the #if, so whenever the replacement snprintf() is built it fails with
+
+  snprintf.c:651:2: error: "cannot find integer type of the same size as size_t"
+
+This happens e.g. when cross compiling for a 32-bit target such as
+riscv32, where configure cannot run its long long snprintf format test
+and falls back to the replacement implementation.
+
+Check the size of long and long long so these are defined on every
+target.
+
+Upstream-Status: Submitted [https://www.postgresql.org/message-id/20261021153104.43840-1-khem.raj%40oss.qualcomm.com]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -211,6 +211,11 @@
+ AC_CHECK_SIZEOF([void *])
+ AC_CHECK_SIZEOF([size_t])
+
++# The replacement snprintf() compares SIZEOF_SIZE_T against these to handle
++# the %z length modifier
++AC_CHECK_SIZEOF([long])
++AC_CHECK_SIZEOF([long long])
++
+ # Decide whether float4 is passed by value: user-selectable, enabled by default
+ AC_MSG_CHECKING([whether to build with float4 passed by value])
+ PGAC_ARG_BOOL(enable, float4-byval, yes, [disable float4 passed by value],
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
index 2648cc1f9f..d5f1f75d4e 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
 	   file://define_SIGNAL_ARGS.patch \
+	   file://0002-configure-Check-the-size-of-long-and-long-long.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
