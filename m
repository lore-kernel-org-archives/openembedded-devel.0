Return-Path: <ricardo@foundries.io>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D07BC78D42
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 03:06:21 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id v17-v6so11721437qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 20:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jMdgY3TfILyc/PJZYhUMUh4YmPp+MEAbGgWtFR3yZes=;
	b=18xAJs6ZLxECaV0pHWlyncirHvYSpHPGS29mkeLZ9GWKdock73YpoJgI36n+3DuuVZ
	KoYusuZ6gyTyTdXBtcd3f1lqI9nkr6QhJcxWSq5tnD4BYdgz3JdNBOrU45P705rBWa1A
	Oa9hvhOKVngvzPFktdUp/yAwkJ4hMHm0np6kqwhM3POpN6GSrn6lkkGDlZ6nVZ3L28LT
	olXxuCdy52ikyN4qe3/1iS7M7b40Vg25sq047ViOYA2qZHt7yvSxKYTSbhmw6Hwsvi8j
	Yx4w0yG2DBiCz8nuVGO9wFeZEQNwMns7X8eU1lk4i5kv3+qe7+R7BviD65KRgYKZAMvm
	6+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jMdgY3TfILyc/PJZYhUMUh4YmPp+MEAbGgWtFR3yZes=;
	b=X4NvFcFPqZvfuVLsVFu2OX39v73OZmErvAklLq1f9ClO+qiHZWpOZHNSgVtdVQD2sK
	4sZ4U3VR2c+eyP5bY+ZwyUTblFi08uRUKrLCW4Oo9jIxlOZLwFuDhplulUj8gfsDWKcH
	MUZUwXUG+uMh8JZcsCkRcANUOJDs33UspezyWbqohlrAcfO/oK8CYqP8Vs06bWdiytBG
	OCJNlXiMcueFrwpO5QLGQpvhiqaSwDKxG5yztAHTM69ji/g1RyyFWAqDseN/rgk4ClWy
	v+hvrsp/sGbpONi5+eQCsgC8zPJHakvAmdfw2adrrp8ts0fQOGxpQ4iSSnL4p7GMOjEP
	IY0A==
X-Gm-Message-State: AOUpUlEbsRDzar5RQIXBE2aUdC3/ZExnpS/R4pzmAoV7MoYvRkqtn4x/
	zYvkTizo0ufGVMgYqwbHkfdZpqvLVQ==
X-Google-Smtp-Source: AAOMgpcb+Z4mkZyT/VZcqqaJNfzpALeTgXsTCpJbPQlfhtkWuEK4UYZQuE9WEI18FyWMIljQlk0kMQ==
X-Received: by 2002:a37:1113:: with SMTP id
	b19-v6mr22910092qkh.242.1533092782348; 
	Tue, 31 Jul 2018 20:06:22 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.186])
	by smtp.gmail.com with ESMTPSA id
	e1-v6sm9581041qkd.15.2018.07.31.20.06.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 20:06:21 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Aug 2018 00:06:13 -0300
Message-Id: <1533092773-22300-2-git-send-email-ricardo@foundries.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
References: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
Subject: [PATCH 2/2] mozjs: add support for RISC-V
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 03:06:22 -0000

Based on pending patch that was already submitted at
https://bugzilla.mozilla.org/show_bug.cgi?id=1318905.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../mozjs/mozjs/add-riscv-support.patch            | 70 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch b/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch
new file mode 100644
index 0000000..4354a9d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/add-riscv-support.patch
@@ -0,0 +1,70 @@
+Add RISC-V support
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1318905]
+
+Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
+
+diff --git a/build/autoconf/config.guess b/build/autoconf/config.guess
+index d5d667d..1277a86 100755
+--- a/build/autoconf/config.guess
++++ b/build/autoconf/config.guess
+@@ -1029,6 +1029,9 @@ EOF
+     ppcle:Linux:*:*)
+ 	echo powerpcle-unknown-linux-${LIBC}
+ 	exit ;;
++    riscv32:Linux:*:* | riscv64:Linux:*:*)
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
++	exit ;;
+     s390:Linux:*:* | s390x:Linux:*:*)
+ 	echo ${UNAME_MACHINE}-ibm-linux-${LIBC}
+ 	exit ;;
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
+index 6fe6591..56e6730 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -362,6 +362,9 @@ def split_triplet(triplet):
+     elif cpu.startswith('aarch64'):
+         canonical_cpu = 'aarch64'
+         endianness = 'little'
++    elif cpu in ('riscv32', 'riscv64'):
++        canonical_cpu = cpu
++        endianness = 'little'
+     else:
+         die('Unknown CPU type: %s' % cpu)
+ 
+diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+index 15dd4bf..4f37218 100644
+--- a/mfbt/double-conversion/utils.h
++++ b/mfbt/double-conversion/utils.h
+@@ -60,7 +60,8 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || defined(__aarch64__)
++    defined(__AARCH64EL__) || defined(__aarch64__) || \
++    defined(__riscv)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
+index dfc7cf8..4f8d666 100644
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -48,6 +48,8 @@ CPU_bitness = {
+     'mips64': 64,
+     'ppc': 32,
+     'ppc64': 64,
++    'riscv32': 32,
++    'riscv64': 64,
+     's390': 32,
+     's390x': 64,
+     'sparc': 32,
+@@ -79,6 +81,8 @@ CPU_preprocessor_checks = OrderedDict((
+     ('s390', '__s390__'),
+     ('ppc64', '__powerpc64__'),
+     ('ppc', '__powerpc__'),
++    ('riscv32', '__riscv && __SIZEOF_POINTER__ == 4'),
++    ('riscv64', '__riscv && __SIZEOF_POINTER__ == 8'),
+     ('Alpha', '__alpha__'),
+     ('hppa', '__hppa__'),
+     ('sparc64', '__sparc__ && __arch64__'),
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index adc27ac..b042674 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.o
            file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
            file://0005-fix-do_compile-failed-on-mips.patch \
            file://disable-mozglue-in-stand-alone-builds.patch \
+           file://add-riscv-support.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.7.4


