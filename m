Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711B4C36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:47 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3848.1743454901096076371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDgGYpnQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso7788975a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454899; x=1744059699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/ip74jm8g4OzTA2hpr09CU+2XAWPDUN49fGwuJGsU4=;
        b=UDgGYpnQox0zSFc4hYSZb04ts9TcmhBP8GwNsN2ixc8Eqd9inrPQp2/B2w2DudcbCC
         2OmFeOjPmO8UuiXRKG9KlV+yOyCONJ8i/LxwjhcbQv6Koc4EqxnACHZJgzoST1BzTbhe
         dhtttOjM/2yNf5OAPNnMW8EMfaXUxRRAX3ufFVuxlfKOMggcP+TRUaYwDbJy+YzmmfaJ
         4KX1kybvfn67kePAGnAix8GyrEyuT6G2gLT2jtzPd6LPpyhs1BFZpgPrLLklKkv4d14B
         uZDMnTMZ+igbO8EfJUBvFuzZ8ZKnvIyWKcFLTYqZa7Q0Al8tzm8DwmT8wsmPX54SSFkR
         N4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454899; x=1744059699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/ip74jm8g4OzTA2hpr09CU+2XAWPDUN49fGwuJGsU4=;
        b=iFh30RJDPKphxQRS+ds+TxkR1x+aIpk2YbDXYtMBW7DAZHQNZadFwzVFQFIGhY6WHy
         X7vyOCLIwRJivRPaxdX8uor085TuYE+PLuuOBxGaqfTz5+OVvrGiQK3d9sbqtAXr/7dZ
         MkGeeOdDcAGMMWNxZTrObXVvXgX6WY4hrw1a4KGih+GHDi9CCOOtN/Ft4aQ6gM03v3VU
         164fG7sClrkqHX8J75VjxLpAskMVMVHM0/652F5jq0um+/XROasWxKZ2UKRO+Ch1Ezho
         JUIWtBUf2b2q/7tBpke0rD5MfZT6GQSh2Rtc+K6aAzrUngWK/iAXwUi8qpcEQbRUCjEk
         JwXg==
X-Gm-Message-State: AOJu0Yz1l0QXorH2ZuXUPZOMPywuH+Vu/pbAdVVlDwr8rty2Y5UewlTn
	ZVxvh0zvj9oqY4zDbKWCQTgVo18ETCwhteiAW+HxEiI0IeNae8Eupt8POP1D
X-Gm-Gg: ASbGncs9ZxuRRsm/0cStxbD0fK7sCx7vZHnzdUavhaCrT+JagaG39eLnTGp1cJ9ZthC
	01UDajWRTy9yPPBpqTUAmNJCYm8dva18eN4a2+mOikz1OiE6+0eWjjjilXp0rt5F9tr72yCxR7Z
	DUh8L6vgPQ7z6uoi/H8UQc/WxS3LoYv6PBhKDGP8tSEkEZVqlFeoNGE8CV6ac5rHaQMNC9Y6guR
	aChGz+I9YH+qxmJ7DWkfdro7CbQNYqscLlIoO52x33H47JeFuSznOnaOotZ3Dmx5IlhbU2P0Qzw
	9Busd3XqMcVV/o1lQsZr4ltsW8RatN6NxMHnXcUDX/1+lTmOBESESm1EmBAmKfOPwXwZiAhZmNX
	p8A==
X-Google-Smtp-Source: AGHT+IEbcBqPR3il1DtE2jxoWThaW9Ire5gYMEO2VmTP52JE5gZddhcM+YHgmoDiJJKoO45uwZvdDA==
X-Received: by 2002:a05:6402:34cb:b0:5e4:c119:7ff8 with SMTP id 4fb4d7f45d1cf-5edfcbd22c4mr9650018a12.4.1743454894767;
        Mon, 31 Mar 2025 14:01:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc17e0704sm6094878a12.66.2025.03.31.14.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:34 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 21/21] sharutils: Let POSIX_SHELL be overridable from environment
Date: Mon, 31 Mar 2025 23:01:01 +0200
Message-ID: <20250331210101.3460858-21-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116457

From: Khem Raj <raj.khem@gmail.com>

This helps fix
WARNING: sharutils-4.15.2-r0 do_package_qa: QA Issue: File /usr/bin/shar in package sharutils contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-POSIX_SHELL-from-the-environment-d.patch | 47 +++++++++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |  3 ++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch
new file mode 100644
index 0000000000..6d8a5e2128
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch
@@ -0,0 +1,47 @@
+From fb8bf1c1b1d0bf8e9bc637c0e67219fab1a9eb03 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Aug 2024 15:24:57 -0700
+Subject: [PATCH] libopts.m4: accept POSIX_SHELL from the environment during
+ the configure step
+
+This lets us set it to the canonical path /bin/bash, even on systems
+where both /bin/bash and /usr/bin/bash are available, and therefore
+which(1) might return /usr/bin/bash (depending on PATH order).
+
+Both copies of libopts.m4 are marked as generated files, but the files
+from which they were generated do not seem to be present in the sharutils
+package. This change is equivalent to part of a 2016 autogen commit
+<https://git.savannah.gnu.org/cgit/autogen.git/commit/?id=db064b9a>.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/autogen.git/commit/?id=db064b9a]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopts/m4/libopts.m4 | 1 +
+ m4/libopts.m4         | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libopts/m4/libopts.m4 b/libopts/m4/libopts.m4
+index 1a896d9..3b88426 100644
+--- a/libopts/m4/libopts.m4
++++ b/libopts/m4/libopts.m4
+@@ -114,6 +114,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+   AC_PROG_SED
+   [while :
+   do
++      test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which bash`
+       test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which dash`
+diff --git a/m4/libopts.m4 b/m4/libopts.m4
+index c7ba4f3..a1127e1 100644
+--- a/m4/libopts.m4
++++ b/m4/libopts.m4
+@@ -114,6 +114,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+   AC_PROG_SED
+   [while :
+   do
++      test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which bash`
+       test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which dash`
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 2a16b18288..7a506d034d 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -13,10 +13,13 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-building-with-GCC-10.patch \
            file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
            file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
+           file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch \
            "
 SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 
+EXTRA_OECONF = "POSIX_SHELL=${base_bindir}/sh"
+
 do_install:append() {
     if [ -e ${D}${libdir}/charset.alias ]
     then

