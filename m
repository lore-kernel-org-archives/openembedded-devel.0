Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DD7C88E65
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:11 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16784.1789257305222790044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PWeJixc6;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1019762a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257304; x=1789862104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EktRN6VI0yma8XlEpRPIyUzNb7Pxa2/t8vMR3ufsNeg=;
        b=PWeJixc6FosXHxfWz/RMYRsDw9L2Vhh8ljnZ2WfWA2WvcK6vl4SDShDvUcE71H0W9t
         Ldw+aRKwnxGObAejOxc/tBEu+nTxSXgjkrxqkwrCfzF6BAnDF+EW98am3vfPemTPX1Ce
         tNMfLW83oTAUEAmFCKZYvMr2C32cHZ0EQqeze2+hIViIq5m2/+ITsgp0GvnMuKqrhxVn
         WR2DpVdnHj4+q0ScB8xs5n5wOP7PBg1bgCnYVfJqhTO2hduPxSwHiq8K6l5InVTQ8WpQ
         cAeraWjTxdjycZw8823XxLBXnDXgwRLPMTR8OkI5gPdIYy1iMPwsDsXK6GZqcd1+QUZt
         MEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257304; x=1789862104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EktRN6VI0yma8XlEpRPIyUzNb7Pxa2/t8vMR3ufsNeg=;
        b=ecvck0t8jlVbxa2v+9KwSoqxImqnCal6ZHTU4t6L1MxUzkhrBLwK8Du/w5qsL54eTh
         OdD/BfVuT1pTKmbV5+H1lxpMIsE7moScyctvLrjazw77Cl9jGGPsmFQoPulPYOfRbhK3
         WjIUurRMZT+/CH9DVzLql5fKuNh4unkXFIq+6yzlvL/9EFurM7bQIjdPVDz2DD31mEyO
         uHZU2LV0q36+N+s5RpOixpXQwVosguwsr7zCs3D1ZXbyogeN2fqoxAl9rGPJlxzpyPlT
         4JfNmrYIiNoK6vRl+zMntKJ6BDDl5Auln7dJHbd9XXivNm6vi+NpEKR+l7AaGTbu2HnH
         FNdQ==
X-Gm-Message-State: AFuF++lfgM227m8TdONVN0tcOniiL/ImyrwFKRhJG8QBkYfQN7BLRYo3
	TU+JCAi+vU9jURmaAb3ZN3FP9u3F5CRg4oZ9esAHurzoFZ0WILuyJ2Ad/63iDQ==
X-Gm-Gg: AYBFou2cB7SyO0I7T7EoxMc3396zrsaObrX2ZQljR9HXC1dQcUnfDQ3NIut77uMyCE8
	BrxzIEWaiDd/Is4d7+xH7EK39IyPEXwUSdCz1lNQq43Sda27Z6ForUw3EIQKDWJ8AcP2aLpUJfV
	dkjs5OlwyH3R32xHAmUccLEjaYd6J8xtbcuvpLNJ0z1hltXGX/YLyqU1lcRlrzLIDXNL1Q0aAnj
	My7ytNErkW8uonqjavWut//SoLyMblmmkTed4SMfQA3VAwqcN9I+/lE6x9XnWyn+Ey9bYXHPg43
	6gyuNe+eNx4S4cWEDX9XQ6jOEN7lwAd9hmrnJ6xbRYq6iV3f9akEtiP/qOszGh4BIQJfuxVzVbY
	62NuP/6XU1vcu2G4J7f0lUyy7F+EXCb7dj7MEDmSV87Hnb4/oVAguKuJ6FlBtI0q/DaOQufYgeN
	b+A7V036j5/IhewwHAts2zz/ennVQgdYcrZ/SpoNehkOZIBqOoRcbgbe1PG3Rmlj0ZtNxOIk3tl
	ch/PsTP6jQPL07IZBhfiuLEslkw4jlFw1i6jedGLbG2IccpWz8huZL/eUZaS9VdNIamO7td7Zcr
	0649bROtg8rqrs4w4cVd1+JewNObVNJitZAoBofA+WaGgEq3ilAMJl6fvlH8flFXbrFfOjQGZNU
	5TSrTvHsxRSGRnVAOnLLYdcsOjh4ldDkD3ScUjzfH3jusAWAseqZ5/MjZ
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr20812399a91.23.1789257304567;
        Sat, 12 Sep 2026 16:55:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:55:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] bpftrace: Keep -fcanon-prefix-map away from the build host gcc
Date: Sat, 12 Sep 2026 16:54:56 -0700
Message-ID: <20260912235456.2358617-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
References: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129991

cmake/BuildBPF.cmake compiles the BPF data source with the plain gcc it
finds in PATH (find_program(GCC gcc)) rather than with the cross
compiler, because the BTF encoding step needs gcc plus pahole. The
recipe exports DEBUG_PREFIX_MAP and
0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch hands it to
that command so the embedded objects do not carry build paths.

DEBUG_PREFIX_MAP also picks up DEBUG_PREFIX_MAP_EXTRA, which is
-fcanon-prefix-map for the gcc toolchain
(meta/classes/toolchain/gcc.bbclass). That option only exists in
GCC >= 13: the cross compiler always has it, the build host's gcc may
not, and the ptest enabled build then fails with

  gcc: error: unrecognized command-line option '-fcanon-prefix-map';
       did you mean '-fmacro-prefix-map='?

Drop it, the way frr and kernel-selftest already do for the same reason.
The four -ffile-prefix-map= rewrites are all this needs: with the extra
removed tests/data/data_source.o still contains no build paths, only
/usr/src/debug/bpftrace/0.26.1.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bpftrace/bpftrace_0.26.1.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
index 836f4d2483..a2f6a93f66 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
@@ -28,6 +28,17 @@ inherit bash-completion cmake ptest pkgconfig

 export DEBUG_PREFIX_MAP

+# cmake/BuildBPF.cmake compiles the BPF data source with the plain gcc it finds
+# in PATH, i.e. the build host's compiler (see its own commentary for why it has
+# to be gcc), and 0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch
+# hands it DEBUG_PREFIX_MAP so the embedded objects do not leak build paths.
+# -fcanon-prefix-map, which DEBUG_PREFIX_MAP_EXTRA adds for the gcc toolchain,
+# only exists in GCC >= 13: the target compiler always has it, the build host's
+# gcc may not, and then the build dies with
+#   gcc: error: unrecognized command-line option '-fcanon-prefix-map'
+# The -ffile-prefix-map= rewrites are all this needs, so drop the extra.
+DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
+
 PACKAGECONFIG ?= " \
         ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
         ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \

