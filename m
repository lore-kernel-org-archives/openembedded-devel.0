Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9430.1792507816040980605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aL2KHv2B;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so319837c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507815; x=1793112615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXq8ZWteUKqprCG9BksuKATfpewKcotK7uHwPe94ZkU=;
        b=aL2KHv2BpMX4qIOFHv3G4HjKkBDoj80Ue1Ps3YUVGUvgN21UPBZZTdI+8md4WH87nW
         wPuOMrBGgD7gtyCoNmwY4hICZTBM3ODIrY9BIUoWwmb3TIYHhTXzs6xeFTRbqIn/v+/J
         BZqDkF9KNU9vKP8QXCn6I0yHI25+2QAlgO+Fb6Ke1Z+IVJxnb2TYLuSyLFuefWRQuIXH
         0Ci+pykVBBT4w0+y7nVk6QiCNshgyURsH/D3umIxpBtIih+6kXNrHGf+hIa3OnE7GBJK
         NVmtbqaER762OKYERwZ5MzmM40q2naejXzraru/amilOQjZwrYL34jK85+CfLPFUSutj
         wR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507815; x=1793112615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXq8ZWteUKqprCG9BksuKATfpewKcotK7uHwPe94ZkU=;
        b=IrDy5e3sxnPsAn1IwST6k/XqohNsRMc4fX4dZd01o0TRo+aTNz0lsZCVHP51XvPUFn
         JOVJGjjnAX4yFMyYo0q938ZCpl4Wh1XfilLvhAUhWhga+bWNAeRibJzur7jMgCi/7JVo
         pW+FrfOAT37usIxsp+znUGgHcMNJLAHKlcVOWb3bqGEjvix48P9VKSteRJvXJAGZk71E
         KlzC+9EYIDywZuXcvKmpvuBp8QIj2OANanBimVYpoWMV8LxpKj2NzPh5zy/b5tKev+UY
         amsQcuZ4K8vMOtjgQKv341+Q4YWL/Ld9mmqGnExoSb/Ut7e4cxGQL3sNreuI+8EW+FdU
         qGDA==
X-Gm-Message-State: AFq9FYKVO6mTlhdPnTV6YoUDrbgYLbP8dVEbmtRHjc6OcfZZRayQ5z1B
	SYu4mziNS7dpKGzLZjXuP3vtV+dmIG96kJd6Nqh0FKmQ5sYxNj8Q2lfD7HsdmXsFG2I=
X-Gm-Gg: AYBFou32A3I1+rQwEOfmk5T/5FPxV33TkyqPwnbvy3+9l7Bj3XKp+j8YSB/xMCJ1MkM
	unC+ewx6qbO+SeGZFkZ8CcQyUlnTxfbVNkV8/rDRktUj04s617aVI2pmHvX5oFptCiqtUnodo6U
	vgdYYO80Bu3QpN9C6dji1IGFjuoi+RhNWUdUPcLOxQTpnO+gVEPtW/QYL2Zza0Saj+g5S5uh/V1
	nie+ohri6LRdNdtExSrR1Kn+rOuJTnZ/SbXLRwEdZQRsKN9vtQuM7fKKcGt89ng39LQYWeJx8B1
	cV5Ea4h3gQcKlRfr8S3KHtAuIs1DaXVdqwZM43zX1YOkLH/Hf+8FzrwePq80bXyFl7R/lZdgSjo
	DCk9Jp8vfCZb/WVdqYRvsTt4nTeLorKE2Vhr8d1+CQvSSbLGcHVX8oH6MMV+UzvGEoRckkAmEpz
	ykUVb9Ek2Sm4q9BO4TWsOYnvMQ6sKKqz4ojLhQsxoJbgKIDCUoFR83HrLxG+bT7c0CLd1ucmfyA
	DtjPoYEBKR9PQRiRN4dI/F1Hm2Pr6iqvIsWHEb1rzN1Yt13iKUwKOuE5KnOmsyH2q6tVcl8LZ0V
	qiSMtDD6YB40RV/Ks55P2SIm5nIANwzUgnjTgxSzFgNawcZq3K/E3Lhs5RIm/eU6anMJQAHaQTF
	zSnyY44GBMFGTJJm6IctT3I1rsn5CXECWpbUeKl/H/zlqDOyVGPnnKYM8J76PTpyo/AgRiZ6ZWZ
	zmEuw197BVdUce9r2DDo+yT0ejb4XoFUUNMvm06jG8VfYPvg==
X-Received: by 2002:a05:7022:ea8d:b0:18d:ac5a:89ef with SMTP id a92af1059eb24-18dac5a8b8dmr3406263c88.31.1792507814913;
        Tue, 20 Oct 2026 07:50:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm43888996c88.12.2026.10.20.07.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:50:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 3/3] frr: Fix build with bison rejecting paths in output directives
Date: Tue, 20 Oct 2026 07:50:07 -0700
Message-ID: <20261020145007.2409602-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020145007.2409602-1-khem.raj@oss.qualcomm.com>
References: <20261020145007.2409602-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 14:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131177
Content-Type: text/plain; charset="utf-8"

bison now carries the fix for CVE-2026-56390, which rejects '/' in
%header/%defines and %output file names, so generating the command
parser fails:

  lib/command_parse.y:20.10-30: error: invalid %header file name ignored
  lib/command_parse.y:21.10-30: error: invalid %output file name ignored

Backport the upstream fix which drops these directives and passes the
output file name with -o instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ths-in-bison-output-defines-directiv.patch | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_10.6.2.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
new file mode 100644
index 0000000000..ac732d9ebc
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 13 Oct 2026 15:33:02 +0300
+Subject: [PATCH] lib: Don't use paths in bison %output/%defines directives
+
+The fix for CVE-2026-56390 rejects any '/' in %output and %header (%defines)
+file names. The directive is then ignored, and bison reports an error
+and exits non-zero, which breaks the build:
+
+    invalid %output file name ignored
+    invalid %header file name ignored
+
+We only used these directives to place the generated files in lib/,
+because the .y.c rule ran bison without -o. Drop them and pass
+`-o $@` instead. With -d, bison derives lib/command_parse.h from the
+-o name, so the generated files stay the same.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7ad39d799d98c982713b29c1d0ba6d49691308b]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/command_parse.y | 4 ----
+ lib/subdir.am       | 2 +-
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/command_parse.y b/lib/command_parse.y
+index bc04bc93bb4c..4d9377e5df87 100644
+--- a/lib/command_parse.y
++++ b/lib/command_parse.y
+@@ -16,10 +16,6 @@
+ %define api.pure full
+ /* define api.prefix {cmd_yy} */
+
+-/* names for generated header and parser files */
+-%defines "lib/command_parse.h"
+-%output  "lib/command_parse.c"
+-
+ /* note: code blocks are output in order, to both .c and .h:
+  *  1. %code requires
+  *  2. %union + bison forward decls
+diff --git a/lib/subdir.am b/lib/subdir.am
+index 20947c306d60..dafebacf8e7a 100644
+--- a/lib/subdir.am
++++ b/lib/subdir.am
+@@ -537,7 +537,7 @@ CLEANFILES += vtysh/vtysh_cmd.c $(vtysh_cmd_split)
+ .l.c:
+ 	$(AM_V_LEX)$(am__skiplex) $(LEXCOMPILE) $<
+ .y.c:
+-	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) $<
++	$(AM_V_YACC)$(am__skipyacc) $(YACCCOMPILE) -o $@ $<
+
+ #
+ # generated sources & extra foo
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb b/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
index b72af9f244..f4a98e2471 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a

 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/${@oe.utils.trim_version('${PV}', 2)};tag=frr-${PV} \
            file://frr.pam \
+           file://0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch \
            "
 SRCREV = "c8efb33af96f9f1220d0fdda6ac049f9126edd6f"

