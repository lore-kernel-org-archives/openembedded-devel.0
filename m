Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE720C4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:52 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7420.1784746185840461910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 11:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z5XzC3VA;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-caf45fc5202so9398051a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746185; x=1785350985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAmfm70JhrdGZc6rPcUD5bKUrYrxdhSTTqnAiiJU+Bw=;
        b=Z5XzC3VAKA3+ehVXAR61vbTDpveo+T7tds3t8/1BPIyBujK+5F85V6WPUFZafxO1SD
         qKWAvsAbYRy+04Vdc1mnjTTSaKtmQtIRzDJclCkMv+XexyCG/ElNLd1S4SGGk6OfVZll
         M56P84Bv6qsttgJLp64SbV6VnZ3IsqpcRkmYRTKXQrUdJTdcjyBQoMgEelGGjVilgG2W
         2+JNFEzohVPj242RFjTStvT7mjYwMHSvWbv7ZEIYA9npOrr4/oDjIqATRH1Nlxv5pF2U
         hoxTCvTePXcWtTQeeO3aJyG5GzQaVbXBIp4NWvjsqTtDIfKxhOs7d7FG/RWSxfbNTyVy
         B87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746185; x=1785350985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAmfm70JhrdGZc6rPcUD5bKUrYrxdhSTTqnAiiJU+Bw=;
        b=BTE8R1P/bkLt7o9P8EViFyFPcs91rcE9stMTd4cUyXY9mpIZ/h6Mrgy014X/rW+3qT
         0Qp3zCPpBRO8FzEQEhQ5Ax0Jcg3b1LNT2x56fbrlyEJtv5jBMtOqNt0M3esWEf4WLj6g
         ynukRZDLFvbWJf/SGOOX7RtzNhkm1JnukzMtOFpG1QXN7O3R8zsrvnKPdCLwWRrGrA5V
         MM83eCngcfFui/fGHQkYx/ZPnAZi48jPbQH1lj16hdrtv+WMUrl1QFeVyaNsNgRyekT1
         Qv9rQoYNOEBPKOPXRYaFO+PHYV8gT4s13WQ9Wzlq+AxWc2B7PY6KMkuq52Um/vfildZm
         7czg==
X-Gm-Message-State: AOJu0Yx0Y6dR/+rgkQWC9aYUXIURm+Zi93IzWyDmjFYMUK9tcVkizOjy
	9Q22n3Br9gOeyPlyLInyj9MBiXFnI8y9X6KCuUehYT4YgE7IjDZ/zKLbg9vQ7Q==
X-Gm-Gg: AR+sD136S0OebRSu1a2DFMfmldozQtdQbV/huIuxbB6SuxVTde8DxJD6rJ1RkE3arDM
	f+qJrYoC0CRvTgLMWuQHIS1IMnWjpee7IwzAKKtfmaxNvie9vF0tK3UKQVLM5vZ4H7wr651fR3U
	Du6u/WLILLildK5avcyUv5zjW54A/HkQbsrJcCGixqWWvoOWlh9seGr+QnITAcBjUIhnTqb+V6A
	cPx6zYNNJuNJnMRBbVw4zyDBf8V3Uvp1rOSs5yxGE+ce0e6zLJtbpuoN8gEqq07DdlRKJSOSjBK
	geN/cRjv1alAPYz9AF+ue9IdL0FuLd8If0HYdyTyBFkuPIop9skiFF04r0Bc3ZEOaVlbal4aly4
	16bIM+0kEnfbXKyjR8cRLO+7kFnaiRczZFhcRM8xYyOaNcbRBuBAtKhANU52ArBc1S2PbAGScwq
	WZTeFuUOhtJgdxyIc8Bu6Su420dqXaoosiBJrSCInrqBcCsD8vNO2bK38zA4LMYKJngbeiNIKpZ
	kw2Ynq4nGSkxA1giE7ZAnhChx3uoixtMZNKa5rHvkAdeJoQPfRJsEd/h8Y7nAO/H+lwsSKdpDDB
	ptJZn2544+OoaS+QO0g=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c3ad62a286mr25689760637.21.1784746185097;
        Wed, 22 Jul 2026 11:49:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm11115841eec.26.2026.07.22.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:49:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/5] vboxguestdrivers: depend on virtual/libc for userspace mount utility
Date: Wed, 22 Jul 2026 11:49:36 -0700
Message-ID: <20260722184939.495321-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
References: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 18:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128409

do_compile failed building the userspace mount helper:

  mount.vboxsf.c:38:10: fatal error: errno.h: No such file or directory
  vbsfmount.c:36:10: fatal error: assert.h: No such file or directory

The kernel modules build fine; only the userspace utility fails. This
recipe inherits module, and module.bbclass sets INHIBIT_DEFAULT_DEPS=1
(kernel modules build -nostdinc and do not need libc). That suppresses
BASE_DEFAULT_DEPS (virtual/cross-cc virtual/compilerlibs virtual/libc)
and only re-adds virtual/cross-cc + virtual/cross-binutils, so the
target libc headers and crt objects are never staged into
recipe-sysroot. But this recipe also compiles an ordinary hosted
userspace program (utils/mount.vboxsf), which needs libc.

Add back virtual/compilerlibs and virtual/libc. Using the same
virtual/* provider names OE lists in BASE_DEFAULT_DEPS keeps this
correct across libc (glibc/musl) and toolchain (gcc/clang) choices.
Verified errno.h is staged and mount.vboxsf compiles, links and is
packaged into ${base_sbindir}.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../vboxguestdrivers/vboxguestdrivers_7.2.8.bb            | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
index 6b6a2f23ff..de47bb0e5a 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
@@ -5,6 +5,14 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${VBOX_NAME}/COPYING;md5=217590d3a513571b94632edf5fa1169a"

 DEPENDS = "virtual/kernel"
+# Besides the kernel modules, this recipe also builds a userspace utility
+# (utils/mount.vboxsf). module.bbclass sets INHIBIT_DEFAULT_DEPS=1, which drops
+# BASE_DEFAULT_DEPS ("virtual/cross-cc virtual/compilerlibs virtual/libc") and
+# only re-adds virtual/cross-cc + virtual/cross-binutils. As a result the target
+# libc headers/crt objects are never staged into recipe-sysroot, so the userspace
+# compile fails with "errno.h: No such file or directory". Restore the libc and
+# compiler-runtime deps needed to compile and link the userspace utility.
+DEPENDS += "virtual/compilerlibs virtual/libc"

 inherit module kernel-module-split


