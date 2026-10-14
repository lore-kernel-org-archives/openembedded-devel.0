Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00313CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:26:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9337.1791969963475841034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EO79Cwxl;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89d6bd67045so614158b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969963; x=1792574763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82mi7uN1CTwHA36gJe3vwQAQe2oXMuprdTRsO4HgWkU=;
        b=EO79CwxlPPihktOTpT5WnZgkcda48T4Z6rHxDaPpWGBVPAHILR9qYRS5Bkbi4Y9lka
         Sop1Wx5A5tWf3iFgsscR9sWXGHos0Bmz5MDwFqVs4yjfVSk/gUl5aOY0X8SyJMMnS1J5
         +kuLNb2QGAqvgH/8/gKdmI3DVX5wcp2LLvmO2H/t6ge3wrFw8pDutxPJP50isYDoxBaf
         eIFETIZzfDDDJMO9a23oXBBaPGw1qiIll7Y0l7UOQ/E7LTGEoQEkhoOvlGQIQ0ODteMb
         Ihv/MA0FvBK7ju7/yspQblTbcJnYLf+/KjEkjfoR/QA+uQQHNr41IX5uS/9zAgHIMCj0
         07Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969963; x=1792574763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=82mi7uN1CTwHA36gJe3vwQAQe2oXMuprdTRsO4HgWkU=;
        b=WJkdqLihWSAT3+HxKEAvNU5tOAWbnrynpGim7wJ1YI+w1NmgLzkPD68Mi6n55Q/+tH
         0gUkQbfXo/Dp4i90s0Igi82ICLuGEq3oc+RWRniXyOPAo8mkxTpkKGCuL74BYnW+qH6B
         IHkGf7KNtwwxQQDBtmbbkqMH57U65HbQ8fSRMV2imMVJbVVbB+inKFxxyno75MktPj32
         8y/OSxsYhzhkdZcjYLwBIo544T/rQEFyPJ23u6fnjbfS0t01m5GlC3xtssxDi7wCFpZS
         qxnMsDS+J7V8q/Fx9k3rgQAXPoWVyfTl3NuYyeKDwnp7UTPDs9jRDHe4ImybjF1DtByF
         8SGg==
X-Gm-Message-State: AFq9FYJcLIn1oEnuNjCrrBzYiucF9YJY319h7UCW+4hXavll6F3i98AW
	CVHGi+sstoox6FxJduERj9uDZjZjquvssu1rxmMxzokuG4/rvHHF7/d1Ia56GA==
X-Gm-Gg: AYBFou2u8zrTvcT9SXQs/VPjipugNliZZ6Lz0rvlDBEr2OPr8kJEKTKBKKzmU3iMqr9
	7imHMY5k0dxRvcoJGT5w53aHuADXhb7hkz0j6YlQUeXPPR0kTKdzDTQu1zQakxuaDZt0JtDb27o
	6szeiLdC0B99nkvDwiDQQm5ZzG3sOAHeWyelz8gawCoKHn27RCrUuQdVkxsJZmwkxKF33CL9TIn
	XQuJMBS42mMsm28jS9a9Eit/ts5AEv2D0/Kfr4Iefmiu8DWUoDUG1tjh6w9pDKE8hTfpvTCqqlI
	FCwBot0RTFEgM9YnoBj6s6GVZ+tPT42qSUpa4iZjabOlq4fdy10n6eEP+7/Z57zae8fBCDYMS3b
	zJNKgVmcSQ1akQSOErpSObsoe6Mi7ACVPnej1XcFBNXzvoH5Zs+39XPjDL3S8mIQQnVVahUbDlm
	VhFDScKPKH/EX+QkfK2oDEo/t+5UXbb/1h0RD9YUAXPmRQSNX0nvsFMqUs8hi3tfHDGLUW7HvX4
	hUdnPDuTr/awUkb9tuqoz4tRg1SkLD/2z7f3Hg=
X-Received: by 2002:a05:6a00:4307:b0:891:41ae:ad68 with SMTP id d2e1a72fcca58-89695ebf3d9mr10129793b3a.23.1791969962802;
        Wed, 14 Oct 2026 02:26:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:26:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 17/17] libbpf: upgrade 1.7.0 -> 1.8.0
Date: Wed, 14 Oct 2026 22:25:13 +1300
Message-ID: <20261014092514.454505-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130885

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Update LGPL 2.1 license text[1]

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v1.8.0

[1]https://github.com/libbpf/libbpf/commit/f7081a6baf3f54949aacb8c2fc11bb30783b83e9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.7.0.bb => libbpf_1.8.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.7.0.bb => libbpf_1.8.0.bb} (84%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.7.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
similarity index 84%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.7.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
index f6cb024706..6341fa3ab1 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/libbpf/libbpf"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
+LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1-only;md5=21de888f1891efa635f1706a7ad3886b"
 
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "f5dcbae736e5d7f83a35718e01be1a8e3010fa39"
+SRCREV = "85c0d575a447651bbeb8e2376eacd64c30dce9a6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

