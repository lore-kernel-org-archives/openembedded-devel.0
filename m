Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F57CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 16:50:27 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1559.1792169425137072307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 09:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUZ/pU+i;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-141395927feso191333c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792169424; x=1792774224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OAnocA3MLPaUGh/1RNcDO3uRpjS0VB/ztpV1Soj3X8=;
        b=jUZ/pU+iKKLpjYS76XXC6kC8on/T9uq3As8cADV54nnrEE6vxFc7Smo1tMmazNFoLT
         QfGUZukveASoDwgrjeikdz/f5yYgu2PFo7fXvmF/qoGgKTGhFbl6cUYTZTTS0Shqt+qR
         CwDAOpwJ//H7l1XXKAJ+JqN7uL4hfY7Xg6iHfXUUVDCVG49ZEWgIXRTk359FhCyGeCvB
         bmBgHv0HtGbu9hn7r0pnJWj48i/vqKaGGiwQmkSoaQf7n53/pNP6JnJHaif8aeT3u1dr
         cumIFrReZsA8gDZj4IYc+ZKhKIty/ZQoiyZE+jW3NSkD3ENTJusOz77LqSzNTvxu/BJJ
         Zz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169424; x=1792774224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OAnocA3MLPaUGh/1RNcDO3uRpjS0VB/ztpV1Soj3X8=;
        b=kR5E0avzSrVCIdg9bAFQNGyVUSXm4UmYWbXNwUGUyU285qDOwx1tOQipLTGi4aPvFm
         gmWIGK1ThicUT5LnlXvcpkx945way5nXCcoLUWW0nJRYfZwSDN2kANGdxTkxbGyT2yPf
         Ax23UC+QzbcPxeFSPHC7RWIq6TcScjnYyNv32hoBEAWpvjA2rN2CVbJOCnvtLBjKI9B6
         zGKB4BG6Ws1xjlqeI26fqCWXS31bCRIoIyqVgW1Gu8wou6bBv1duRJj9siGpoqa5AvSU
         Tpt835nJ2InhVQ/IHZYUOxVY+ILfkNWOKsSrRVkyffSp4GEA8YbP9JI1sNLydILw0fOp
         7a3Q==
X-Gm-Message-State: AFq9FYK8PKP1ErJ567qjF9kJHiVwJ2arSsI5yTxREjlyUg4LR8XpzSG4
	9gFu60nwRDn6oQfyqwUG52UyRnSJxTzpbkKB4jP2i/PcM4nOe5oJvDKnDsbdz9mJ/JT/eg==
X-Gm-Gg: AYBFou0LM/Sgg8MxBTayZE5AAVla85Ppgw+vidpbQZLN35EUW0HF8rpNsUlds7PoGCc
	PxUPRs752XZpGpqpLAzrSIKIoQLDKT6b5qTjMKdaoo4wOrwkPbWEqCpKpJ2uhX0aKCdSJA6YOBu
	BCXZ4mkmyEPUA91UH9ycp5x8Z6dNnKXeFuc5QELi6v7jvRvoJ6htjp6IaIVS9BoABcRDBtYYa9L
	xw9iJmKxPOsnCu7gKMhmOKmuMBWj1v9ilpqEhXupJHc0mSvO1lo0g/lFErqVcsSdEyBrk5eONzf
	DsTJoyWo1DJq18WNnryLmoFG+CSMfBYaAQs1srhdBmt7ZQt05RMd9hOsAjnIXazlWRlWmhrVWf2
	9eFnyjHNhYEEaW2cO6Ir5dH7Y3XteCrLWxdsVG2NHINuIqaEwXOoSNLfNnKkCiHElBKWAD+eXra
	Txl/y2rKIgpJVRuPkSi1p7k6F0Iai17apVjhacz7iuRRQv6hkVkjCEdPA/x5DCr6WAbczWKf6EQ
	jsh7Absq9h1beiKJ5sMxCVAbemnRiTBNwhZFk62f5hijTUEqavipIlWgen1LC8W5gekUGs1hJZn
	VAyaT78QbP07IcpEdhQAoJl+VFLhtz71AW2dUYnaeTcPgEpcWl8trFiC1ytCbX4Va6pcFzoWEg3
	+Fq5djPhRy6yV910hqQ7WW37oNK/j9hS6VmoDhmo3aLGp2Cm+bYoRiGugSAOyat2ZVOwQg2zM7m
	VJH1StUKG8UG4jlLLKvqTRAcIBCGFCrdnopJ4O5bW9yaiWbA==
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr511384c88.20.1792169424014;
        Fri, 16 Oct 2026 09:50:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm7396545c88.22.2026.10.16.09.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:50:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-posix-ipc: fix feature probing instead of forcing -lrt
Date: Fri, 16 Oct 2026 09:50:21 -0700
Message-ID: <20261016165021.2704044-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 16:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131079

posix_ipc decides at build time whether it needs librt and whether
message queues are available by compiling small probe programs in
build_support/discover_system_info.py. Its does_build_succeed() splices
the linker option into the compiler argv verbatim, so when no extra
library is wanted the compiler is called with a literal empty argument:

  $CC -Wall -o foo foo.c '' -lpthread

GNU ld treats '' as an input file and fails ("cannot find : No such
file or directory"); lld ignores it. With the gcc toolchain every probe
without -lrt therefore fails, the prober wrongly decides librt is
required, and on a C library without a usable librt message queue
support is dropped - which is how posix_ipc.MessageQueue went missing
(issue #916). The result depends on the linker rather than on what the
C library provides.

The previous LDFLAGS += "-lrt" workaround only papered over this, and
is itself libc specific: it forces linking librt even where mq_* live
in libc (glibc >= 2.34, musl).

Fix the prober to split linker_options with shlex, like it already does
for CC, so an empty value adds no argument, and drop the forced -lrt so
the probes decide per C library.

Verified on qemux86-64 for glibc and musl, each with the clang and gcc
toolchains: src/system_info.h defines MESSAGE_QUEUE_SUPPORT_EXISTS,
SEM_GETVALUE_EXISTS and SEM_TIMEDWAIT_EXISTS, and the extension module
imports all mq_* from libc with no librt NEEDED entry.

Fixes: https://github.com/openembedded/meta-openembedded/issues/916

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-not-pass-empty-linker-option-to-the.patch | 46 +++++++++++++++++++
 .../python/python3-posix-ipc_1.3.2.bb         |  4 +-
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-do-not-pass-empty-linker-option-to-the.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-do-not-pass-empty-linker-option-to-the.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-do-not-pass-empty-linker-option-to-the.patch
new file mode 100644
index 0000000000..37d801e42c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-do-not-pass-empty-linker-option-to-the.patch
@@ -0,0 +1,46 @@
+From a2d268590cd2e8460b40438b4eff894ae472a0f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 16 Oct 2026 16:26:28 +0000
+Subject: [PATCH] build_support: do not pass empty linker option to the
+ compiler
+
+does_build_succeed() builds an argv list and inserts linker_options
+verbatim. When no extra linker option is wanted it is "", so the
+compiler is invoked with a literal empty argument:
+
+  cc -Wall -o foo foo.c '' -lpthread
+
+GNU ld treats the empty argument as an input file and fails with
+"cannot find : No such file or directory", while lld silently ignores
+it. With GNU ld every probe that runs without -lrt therefore fails,
+which makes sniff_realtime_lib() wrongly conclude that librt is needed
+(or raise DiscoveryError on C libraries that have no usable librt),
+independent of what the C library actually provides. With lld the
+probes happen to give the right answer, so the outcome depends on the
+linker rather than on the target system.
+
+This regressed when the command was converted from a shell string
+(where an empty %s vanished) to an argv list.
+
+Split linker_options with shlex like CC already is, so an empty value
+contributes no argument and multi-word values still work.
+
+Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/114]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ build_support/discover_system_info.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index 1c3741f..669c234 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -57,7 +57,7 @@ def does_build_succeed(filename, linker_options=""):
+            '-o',
+            f'./build_support/src/{filename[:-2]}',
+            f'./build_support/src/{filename}',
+-           linker_options,
++           *shlex.split(linker_options),
+            '-lpthread'
+            ]
+     p = subprocess.Popen(cmd, stdout=STDOUT, stderr=STDERR)
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
index 111444580a..957580bf5d 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.2.bb
@@ -4,9 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3d8df223c2614dbf1aabdc1ca23cc10"

+SRC_URI += "file://0001-build_support-do-not-pass-empty-linker-option-to-the.patch"
 SRC_URI[sha256sum] = "6923232111329954a8349f7d99f212b6e96b5206e77fbd39aaf1b3cb4a5e9260"

-# Message queue support requires librt for proper linking
-LDFLAGS += "-lrt"
-
 inherit pypi python_setuptools_build_meta

