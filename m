Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B8DC0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 12:44:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9324.1737809066804164997
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 04:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JlA8m8pK;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2161343f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809065; x=1738413865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lw2Nu9ti/29sDQqa/75eyy8T4jCG8pZdl5uD9jr3w8=;
        b=JlA8m8pKj+M+sQ3Xw28xj52pDDudcltpXf72vHCXG8yrG8lPmW/fsGO1Py9jxK2hbG
         pe6l+skKdYUADcqG4BCLUFK/tneusGv6DKBkvJHEtT4R35TQBrj8iZtGcZceKvSnadzk
         aIwxPmMHL8uHeAVaET2HUTT9JyOMxPkW3l3DaIuMeEIfUs7VBBP2/B69z/I4niq1ghE+
         UkbAjIVCF+LcolZ2wYjc3NzdzGpdwz62N1qp+dP4gnGA940F+IkXry9H+2el4TzkQ0Yl
         AGp8FVdegbII1xw/mj0sIi1NuEwC+h8nmj5iXuu5AT9B5E9h17LwWHnS5j1FkLV4Bktr
         OqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809065; x=1738413865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lw2Nu9ti/29sDQqa/75eyy8T4jCG8pZdl5uD9jr3w8=;
        b=JtFU7o5NyyO51N/eaT9hNMFksnzne4blr6YPzzoa2K+I56xD8jR85ZC1LYKNYefig4
         gP419GbYyHPrl0xaQxXIQkG9bUNLD6UdAFZumKN8uVVWg8/EPtqclWxboqYVS/0HQEHS
         tKHn0mMCQu27Gl6k2tE1LZMF+jooaOp6ISJBYlo4oo6FDEwcvU6GRgUxkbz2FhStM0DV
         vhrc74xqThs22gftqJ8nHp/dOMpk6ik8Y+TH1jQUTkCA6dRxw1Yud53Js4QCyWW7rogQ
         tXrdyiPNUYkOBfrbOqEWy0ly/qS9cLDsUuBXS4UOcTq/3Npog1AfqqEVGmq456UBCdIw
         tfBw==
X-Gm-Message-State: AOJu0Yx7RXGO7s557QgNmj8HZkcuW8takMP2K4JW8B2saOdsoFASKF+D
	XKT4YtLAlraRPXXDuKivGMFmrilEWyJ4hK3DUtSm3vNDBRISgJCrZFzU2A==
X-Gm-Gg: ASbGncsnaKBmwe1XjFpsYbJX8fDGlxIg9/8fFAZd00857XGa4/b+UUGC2zXgVzfys4l
	Tn90KuG558lIE1HVW/YOw3axQA8zoYPh93hmg2Ke0/Eee1VeFtwhceNPb/PPTDoJHWhxJ5bpOU2
	oX3A1tWFjDl15vIotwoRfpq5fKLqMfBnIX8+E6Zy0pXvanQnx7xpOumR1kuR65m61kCY6Fmn440
	8TdP9M38F7VZyJy7gukMpOu4F6bIEeM1SF1iTmZMAA344yjXq/N+MUv63exAQA08+8slo30k6hv
	RecxtAqWiKpamuk9mMOc
X-Google-Smtp-Source: AGHT+IHyYNtUmoPsxgRCCLfbCwJvZO+XXEtlhQx5eVqZR3SUCFs79MgAlK13Cf2iyp7himJNUVCidQ==
X-Received: by 2002:adf:f682:0:b0:38b:e26d:ea0b with SMTP id ffacd0b85a97d-38bf566c314mr27364805f8f.25.1737809065082;
        Sat, 25 Jan 2025 04:44:25 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188c33sm5555733f8f.53.2025.01.25.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:44:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH] python3-posix-ipc: use correct C compiler to detect system features
Date: Sat, 25 Jan 2025 13:44:19 +0100
Message-ID: <20250125124419.245571-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115079

During compilation, prober.py (called from setup.py) uses "cc" to
compile some simple code, to detect if the used features are available.
However during cross-compilation we don't use "cc", but some other
compiler for cross-compiling.

Due to this, the feature detection can fail (maybe it fails always?),
as the correct C compiler for Yocto is not cc, but the content of
CC environment variable.

To solve this, instead of using cc always, take the C compiler from the CC
environment variable when it is available, and fall back to cc only
when this environment variable is not set.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...default-cc-from-environment-variable.patch | 45 +++++++++++++++++++
 .../python/python3-posix-ipc_1.1.1.bb         |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
new file mode 100644
index 000000000..86829869a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-Use-default-cc-from-environment-variable.patch
@@ -0,0 +1,45 @@
+From 2db4d9974052e28f25252b3204a73dd25de1dd89 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 25 Jan 2025 13:09:00 +0100
+Subject: [PATCH] Use default cc from environment variable
+
+In case the system uses a custom c compiler instead of cc
+(e.g. for cross-compiling), probing system features can
+fail or can misidentify the features due to the incorrect C compiler.
+
+Instead of using only "cc" for probing features, check if the CC environment
+variable has a custom C compiler set. If it is present, use that instead of
+"cc". If it is not present, fall back to "cc".
+
+Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/56]
+---
+ prober.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/prober.py b/prober.py
+index 48432b7..ace6d3b 100644
+--- a/prober.py
++++ b/prober.py
+@@ -52,14 +52,17 @@ def print_bad_news(value_name, default):
+ def does_build_succeed(filename, linker_options=""):
+     # Utility function that returns True if the file compiles and links
+     # successfully, False otherwise.
+-    # Two things to note here --
++    # Three things to note here --
+     #   - If there's a linker option like -lrt, it needs to come *after*
+     #     the specification of the C file or linking will fail on Ubuntu 11.10
+     #     (maybe because of the gcc version?)
+     #   - Some versions of Linux place the sem_xxx() functions in libpthread.
+     #     Rather than testing whether or not it's needed, I just specify it
+     #     everywhere since it's harmless to specify it when it's not needed.
+-    cmd = "cc -Wall -o ./prober/foo ./prober/%s %s -lpthread" % (filename, linker_options)
++    #   - In case the used C compiler is not cc, take it from the CC environment
++    #     variable
++    cc = os.getenv("CC", "cc")
++    cmd = "%s -Wall -o ./prober/foo ./prober/%s %s -lpthread" % (cc, filename, linker_options)
+ 
+     p = subprocess.Popen(cmd, shell=True, stdout=STDOUT, stderr=STDERR)
+ 
+-- 
+2.48.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
index 7106e9c5e..8fcf83b06 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
@@ -9,4 +9,6 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
 
+SRC_URI += "file://0001-Use-default-cc-from-environment-variable.patch"
+
 inherit setuptools3 pypi
-- 
2.48.1


