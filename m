Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40639CCF2C4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9881.1792302969927879682
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RUsmlgBd;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1802430eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302969; x=1792907769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1cKOz5NrEDj27+Pqy7orZuoxmRn7WAUuKM4SoX98x4=;
        b=RUsmlgBdZGQjpEfk7YFXduCEzEBYH3Wg5wn1ld9ZE6KomFxHUy//00HbU3c+MG8boS
         wBmxlwRHcEm858fsb8P0cy8sgizLb6E+g+y08uxOuHLeo+VvW/CGb7RzDEutG9FZu4Pg
         b0hyocXXye/OY78WThsorn1os8UeLp71jf6Hn52JTLvhxQNSd34p8IVdJxOQumHJNQaE
         lz80Rg70S8Vd0yHdD4aDHBx0POl6cuL9rq9bkDXsbZ5ZOM3EGgFywIB8QjmCPks3wB0M
         ZLFAg7KEZpsjgz2H0geQ8nKcIB2VeNEHwj2hmmYBV96s39L0oDODu58jmkXA2842Tw8z
         cLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302969; x=1792907769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1cKOz5NrEDj27+Pqy7orZuoxmRn7WAUuKM4SoX98x4=;
        b=abtYPvsam4zG3+G5UCN68V2R4otnEN/a7wykGYdVC5UOJ6MgT7EzhMIvrSacRQWhyE
         28hDXCpMN9JVOaseQAJ160UE52/8uhYVhvQF4tCcvqErKHiSbjQPtJFKWdpocWkvlWA6
         TsmEPPtLC3Q5CxSD58rc4QbF7LrDJG8XXOnsPO2tj/YbWI5fwVrXiwQQOd2rIF7Bpdy4
         eksXGPUe7XCCh+NMliTPBAZGjqJTeohrEuS7qi1ZGhnoXuIRnZfkCtpTkSnXIoLO2Ftp
         8YkVyJyn1q4JK2xKivnu2P+ZEmdROvRD2aX6B8PQ7AO3Hqh2u/yw28j+TLFA8IhOEila
         AetA==
X-Gm-Message-State: AFq9FYIdmw50a68HW3WYilGIWTanRa/I//x9nn6KCaMGJ4HuhIUOjMLf
	I0DQ7nIghvsF2cQBd8fHmtoDHIF/TyZj+ZnmS4OAknSYOZaNE/13SghoUcVO/duSMdg=
X-Gm-Gg: AYBFou2JEX6EUay4Os0lw7aLtsxBqe7DvsR37/bSDSOJ3p2T4kD2haTmTGJzsqEAQpl
	o1nfpmrO84uhJNxgQyIAPF5HmFziNih9kjKpvQP+VCKzZLBqmWyXdpoa4UCzJE2q00Xf7vpyrPI
	9lk5VzwAI/qzow704ahbjDccezLqtxcjMal0hRabAFvIACOebAvqRRTrtI98urdzR2DtUsXngvQ
	B4Cxxv4Z+ZcbPhtFDQye7GPzHLOgwwF3KRyYXKYICfeEhtxV7bn25LHCEbHO+nPsiW9gFINM0Ng
	dTF2CXM2CpGi9+W3D3E6RsAWVgV9Ll2OnE/V0xJImwHN1hznu4CZSOdijFPO/4GvezEk9wwrcIU
	TEh0sNXP0yNwtz+t1A9ad6MC96Mf3JlnEDaUzc8S6U4ziq63Nbj3/s1foMX7yhj6TZJoD77Svy0
	GXMnQd3JveI7ARq5h6U7nRDJkVOkuYqHvtN6xJMVpPJhQem46AdsXRe+Smg0POV8z5cC2Y3vFeI
	ECn7J+atQQe+wjZLgiEkYIE0QYm0MINm/dEoyxfkelyE07rge4SDHocB7ccpVC0Z6fiFBK2hwez
	n/bCYGzGs6vewVvyhDGt021DqYpfT87ZqFug9Tvx/5F4yvyPlFJ/mROIHo3ZJnYkC16m5kzaM6Y
	I4s67l2jHJq+fQAo+Ajd4KEnoWga1XxPTCCrqzSZBDpmUUxIjqNK7ITL9ByJdH6ewFIcNVvuMFO
	piRYlpuKdOgPuooDjRxQELe9nSCM9MDqR86ePogkDEE7peUg==
X-Received: by 2002:a05:7300:81:b0:35f:f77d:40 with SMTP id 5a478bee46e88-3619e925f40mr6649813eec.4.1792302968814;
        Sat, 17 Oct 2026 22:56:08 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/11] libbpf: Enable build on riscv32
Date: Sat, 17 Oct 2026 22:55:28 -0700
Message-ID: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131083

It was compatible on all core supported arches except rv32, which builds
now, so remove this regexp

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
index 6341fa3ab1..67069d7293 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.8.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master;tag=v
 SRCREV = "85c0d575a447651bbeb8e2376eacd64c30dce9a6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
 S = "${UNPACKDIR}/${BP}/src"
 

