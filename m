Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0427C531DE
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.116215.1723697134736188578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XE7k6gRe;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso413650b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697134; x=1724301934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E98c90KfYzm8wUgc9h7dmt05qoFOaWrcNNt1dpmv+Wg=;
        b=XE7k6gRechoeIlgBE/i97sdKyMFoMKkvdARTSOGrldYAMGp9N8pBI8zB+lfEyxSkYG
         vlsSEknytd3LkS7UQlJs3GZ7W4i4mx8EC5XV3WNjmS92/gNnoZFPPZ88CEN5LnBLpoZS
         YmAYt+LxR4yPLF4uH6OiAJKnv/0STTwj0sGbhvq5KcoGbrSQL/GXHUwRtxqf5r4W8tic
         Jv565KC/ErXZjz8gKhaR+yhr0ze492HICO5dAOUhI4IagErzuxOmmhtl+ERYiOgcFugA
         KJvCcW1cfUUJa92cDbVHqKy/ya1EXrajfm/onPDw12MyFLU81ruISILDX64VTSyr78La
         PbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697134; x=1724301934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E98c90KfYzm8wUgc9h7dmt05qoFOaWrcNNt1dpmv+Wg=;
        b=kPxOACwWY9xWBc7VV3Z7TTDqBl/giHwIZww33JE+JYwYuH9rLIyML+l+h/cg7nmatU
         UgEBRz45uNZXUebtSg3zwqkFhysMjZWmHp6Re37edw6GNOZKMobMEs8fWdPyXrxOapBC
         i8h5cGn53nmv4fCRUXMyEqBKB/aO+fbNcZb4HRmC6UX0aNE7AY0ieMjhP7IQ1m7NyQeY
         v9jNddy9+vZ2T1YmE0oi1KvyLoaDmTQZMUHlMNdRhYajT7bSTtQwSG/H9Q5k5RkzvciR
         3qaouwQI3MRXa7AQmftypsDryqGH3HECRUckNfS1upjSE/UPmJaATN/kUyrgVNbEbCuZ
         U4jA==
X-Gm-Message-State: AOJu0Yw6c2SBsUnOGd04Cp+yqPaBEz4TOmnzuLHdVAkQOBvlHZ39s2Ku
	uaVhpodHlYCXKclp/TUh6gakHnjeRTxoQpHpKM7LNTMKvitZdjD6y7YdLQ==
X-Google-Smtp-Source: AGHT+IHMwrgKKCfTmxI+a0I1I5koxxFnzRgIufStax5Jt+Rr+xfNIocW7LLmSYz/Cp2BR5WEyChgFw==
X-Received: by 2002:a05:6a00:b87:b0:70b:5394:8cae with SMTP id d2e1a72fcca58-712673eb12bmr5749682b3a.28.1723697133654;
        Wed, 14 Aug 2024 21:45:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/9] sharutils: Let POSIX_SHELL be overridable from environment
Date: Wed, 14 Aug 2024 21:45:20 -0700
Message-ID: <20240815044523.1030831-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111814

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

