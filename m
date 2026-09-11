Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5131C88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:49:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36652.1789123789014094506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GhItfNQS;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso8814485e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789123787; x=1789728587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+qqN2IfWSqme0YgIJuuAco1nObDSSGZwKHFsFwgygM=;
        b=GhItfNQSj4ANPRvE4529Ysg3FY+JmOuU+1cfdyuGckzeQoMGy0A+9j5c143YrEuURa
         iMakMVDThRZdpMiui6g1jcqfj2mtJd3n++eooAX/MeXnUPYfzgknziTYF88oYR17O88S
         6j1mdMybNoXg7SplW2O9ldPobB6S6Zx+x5yx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123787; x=1789728587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+qqN2IfWSqme0YgIJuuAco1nObDSSGZwKHFsFwgygM=;
        b=odxvZntpLSNP8P3aKIXkfqdNIfNr6hkKJDxP+ljc+DLH+zb3dvSYgENtaF1rQXwAGz
         YkcIltlNlxND3t1gGTtiyYbdjQ16k2kNS0ovfqttQbPc1qpRGcZ3UNUvE3yiPCazSvj+
         PUeyUc1iBJrrpKqW3c1U6oFLbArc1HJTNmZb19W2e53fIJYKmc8VZRd31mK6joYnTx9J
         nvZXrjJp7KvTj1Zsyr7O2Ixqpm5j493gauPlFuDwpWjafCax/y3RxbHBKQlTjJ/gh8ox
         h0gtAJFtMDA39nvwDXNFqICNcVkuaWNzYjtqPWLNBk8ZOvmCEd+CUTYdf5RiRTU3SYAL
         /cdQ==
X-Gm-Message-State: AFuF++nc3XUEqfRxEAM7k7SSIgpK3F1N5BNmNrYVYXt3jXC9q6IvaBvp
	ewJiGHw62wATPtXNAcC6eWX5khjvX9RzBydzOSoHqovuy4Gh9AByoNs/u/lEvT6FJV/vc8oyQyz
	pszSS
X-Gm-Gg: AYBFou1ndRXbC/9XYrM1LI/1GFGK23GzDcAvNNvsBO5TiKL6ctBHyp9WgoeXoHxRmp4
	52uqMLpY6GauCeCvOzCjiwH6HpBHL10GoR8SVN8f83dcPKg6lFovNx5y5wxAIHTCaNykxFu9mAG
	t7c+lxA8xAwrtiSEXs67wdC7jB9AFDokZ6wOI/0W/tsn2lJ/HdjfgKhncacTAS0oNfMxUOtdLTr
	4oTsiiq4hyA2A06188EKSgu5/nZi/e0oFJYDCc1VKwB1q9rt7wramVrSPmvn1Mq/ZcvGV2h+LUW
	/eMZDDhvdxEXi+89S1Qls6pTlPZhQkq2yAuov5+OqXG45/4cqGAB4pIF0a9F9JM3sqP8g1bHQVF
	OHPwzHTctJfjYQzeCYGIZ5ksLquUoCH0lybbxVT+2E+QgRlfqlOpa8zNFSiBq/VvCpZk9nxcOsS
	UYsZoGmaYzY1wsTZwu6QRpwCYS7dqtW6zye0piJUSGtHddju13811MHXqdPVQq1heHCSatjPwmG
	1466l3GgCERoM7g+0nMONahR/AbwKB3biadvKZG2Up5oyT7r6d4WqAU2Uj/o1/lO+9Skn7fCErS
	nsWneXDiuISclsVkWq12RhSZ
X-Received: by 2002:a05:600c:358d:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49e618880camr49156395e9.3.1789123787217;
        Fri, 11 Sep 2026 03:49:47 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62cffaa0sm19657265e9.0.2026.09.11.03.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:49:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] bitwise: Upgrade 0.50 -> 0.70
Date: Fri, 11 Sep 2026 13:49:43 +0300
Message-ID: <20260911104944.2779714-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 10:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129960

Upgrade to release 0.70:

- this release changes how &, ^ and | bind against each other. If
  you have expressions that mix them without parentheses, check
  them: 3 ^ 1 & 2 now gives 3, the same as a C compiler, where
  earlier releases gave 2.

Enhancements:

- Unary plus and minus in expressions: -5, 5 * -2 and 10 - -2
  evaluate instead of being rejected. On the command line, separate
  a leading minus with --: bitwise -- '-5'
- README documents the operators that actually exist, with their
  precedence, and which C operators are not supported
- Added CONTRIBUTING.md, and filled in ChangeLog, NEWS and AUTHORS

Bug Fixes:

- &, ^ and | now have the C precedence order, where & and ^ used to
  share a level
- Numbers that don't parse cleanly are now refused instead of
  guessing: 12a used to evaluate as 12, a bare 0x or 0b as 0, and a
  literal past UINT64_MAX as UINT64_MAX
- Shifts and BIT() at or past the width of the value give 0, instead
  of an answer computed from a masked shift count: 1 << 64 used to
  be 1, and 1 << 200 used to be 256
- Fixed a stack buffer overflow on tokens longer than 64 characters,
  reachable from both the command line and the : prompt
- Radix64 output now matches the system l64a(); a fallback shim was
  overriding libc and printing a different alphabet
- Parse errors no longer corrupt the curses display
- Fixed the ASCII line of the conversion output on big-endian hosts

Build and testing:

- make distcheck works; VPATH builds could not find the headers in
  inc/ at all
- -Wall -Wextra are on by default, and --enable-asan, --enable-ubsan
  and --enable-fuzzer join the existing options
- Tests for number parsing, shift edges and long tokens, plus a
  libFuzzer harness over the expression parser
- CI builds on Linux, macOS and Windows/msys2, and runs distcheck,
  the sanitizers and a bounded fuzzing run on every push

Drop 0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
because v0.70 Makefile.am already includes a similar fix to put
$(top_srcdir)/inc on the include path from git commit f4b9fa1.

Fix Big-endian and Little-endian output in ptest.out.expected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{bitwise_0.50.bb => bitwise_0.70.bb}      |  3 +-
 ...build-when-build-dir-is-not-same-as-.patch | 31 -------------------
 .../bitwise/files/ptest.out.expected          |  4 +--
 3 files changed, 3 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-extended/bitwise/{bitwise_0.50.bb => bitwise_0.70.bb} (85%)
 delete mode 100644 meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.70.bb
similarity index 85%
rename from meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
rename to meta-oe/recipes-extended/bitwise/bitwise_0.70.bb
index 397829c87b..f295a96805 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.50.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.70.bb
@@ -11,11 +11,10 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz \
-           file://0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch \
            file://run-ptest \
            file://ptest.out.expected \
            "
-SRC_URI[sha256sum] = "806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e"
+SRC_URI[sha256sum] = "b8f41f49b9b73ac3abb1e7533a410504f759673fc6e7f35acf56fc82e39cdf37"
 
 UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch b/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
deleted file mode 100644
index 76d12f9cd8..0000000000
--- a/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2089b514045d2de64a5d9c54e241731e85d77df2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Dec 2020 22:11:59 -0800
-Subject: [PATCH] makefile.am: Fix build when build dir is not same as
- sourcedir
-
-This ensures right include paths are added to compiler
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index eba85a1..da998ff 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -19,7 +19,7 @@ if COND_DEBUG
- MAYBE_DEBUG=-g -O0
- endif
- 
--AM_CFLAGS = $(MAYBE_COVERAGE) $(MAYBE_DEBUG) $(MAYBE_TRACE)
-+AM_CFLAGS = $(MAYBE_COVERAGE) $(MAYBE_DEBUG) $(MAYBE_TRACE) -I$(srcdir)/inc
- 
- check_PROGRAMS = tests/test-shunting-yard
- tests_test_shunting_yard_SOURCES = src/shunting-yard.c inc/shunting-yard.h \
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-extended/bitwise/files/ptest.out.expected b/meta-oe/recipes-extended/bitwise/files/ptest.out.expected
index c5ca3e5215..c1c3375fc0 100644
--- a/meta-oe/recipes-extended/bitwise/files/ptest.out.expected
+++ b/meta-oe/recipes-extended/bitwise/files/ptest.out.expected
@@ -4,8 +4,8 @@ Hexadecimal: 0x42
 Octal: 0102
 Human: 66
 Radix64: 0/
-IPv4 (Network byte order - Big):  66.0.0.0
-IPv4 (Reverwsed byte order - Little):  0.0.0.66
+IPv4 (Network byte order - Big):  0.0.0.66
+IPv4 (Reversed byte order - Little):  66.0.0.0
 ASCII: .......B
 Binary:
 0 1 0 0 0 0 1 0
-- 
2.47.3


