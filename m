Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C218BCCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17892.1763014836747352461
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiNirtN0;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ef378069so4029665ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014836; x=1763619636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5WqBP4fVR+skqhiANL7kYEDcN66oynSmU6hAPrwTpQ=;
        b=TiNirtN0TmSYpYE/UAruTmXmZ+xfa6b0ZR3QZjo+m3Abp1CC/2EDC7qJLypORX4lGK
         NN9zuOKCUM6S79DKiIICnP3zIqlIXZYr1nKNSoLkPbdCxSB7o7FH2o9l0MZlCBptQRsh
         /9B2JEBXeEr8WriKzrgGWSKoM33fK0BCKUceK/dyxhou6vdXRwBKHGccOxjmeAF5JX7m
         t+a+krF/jLV+QziSO8EUE/ZAtVMvpYBAoROlyPUN6T+0n2W8dsRZ6RYM0mra+ww5PT9J
         S8IICqv7pWC5YDV/9SDJeMsbuBAGUeqV2In2I7XH11oUVhhgBUjHzMJ7S18a0ZLitUx2
         NhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014836; x=1763619636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5WqBP4fVR+skqhiANL7kYEDcN66oynSmU6hAPrwTpQ=;
        b=lOzkhK0G+AgiOKzoDqgdL34t+HnnXTblngjGgNrvg7I1I5MwX2bubIkw+RpO1hcPLe
         8LXcqNdlwZqojkJZd+TnYjjgOeoSbpfFYC2OIgFOYOVT4Sj0dVwdbj0FhjNoU8WYPsx7
         AegEI07YVhpxPiN+1MkqEw8AVcMoDPTvQn0RLShQIiaX3HUWPFSGB7SVrk93r0oQDKog
         FpNu6JqqcI6Z0j45CMqzyO27EeuDmWmLAojGIp4wqqG4gYJxtlQPtfbWVOS4qaApB2gz
         DyqsVHSCF2LGeXSo6AXcDN+GqKQEajEiPciK+ii/4AQV4z2brvA42gfTXq8PK9sdAbqZ
         s92A==
X-Gm-Message-State: AOJu0Yx95tbWZk81cJgKJwXmFCFFQZRj481DWMuZCdiL8tVSUHtQnl8C
	pVdGlq3PVnJm0sVcRW57CrRI+LTNEy1imZdoaQJrheJKjogFSgatrki9NPBL0w==
X-Gm-Gg: ASbGncuqMV0m+WVPM09RCMXtjag/DO/Eu6BbdGOJIobPTOaPezqafLbUB9pD7LKL0Mj
	1fgqbEgmnJcJtAk119vGn/cUp9wLZhfbXJaZgmO/mfUFDhVUplkHp2DEAncP4u2ljaOfJb8b6I3
	dSdej6iSv5wbzeX5C9AlezVfz+5/yJat+R/fSswxWyqkbqwvbkSNSERYKKHqzDiFHttB+HNBR5f
	5/itd4rMkujC6azBfAiNoJ8EVFHDfsnoN8gzLBDSxJCkOV/hfIoPN7Eu3COMsDtewLX3YTrPweb
	tc30Twy+uCoZYfAG7rTDIOcvpoHuYACnMaMnX8ulXY32/LZ69upQi6LSufc6N5XVNRslD9z++kI
	ciaOFl1U2c3p15ddfZULUSV+1pjHExjPFjyClx2M+xtKqmKDqnCKmQ64yYx/NniZGWrowxO1m1b
	gD2F0ltdsbPuwziw==
X-Google-Smtp-Source: AGHT+IEh9SI5ALnG2ivj4KlBGdY1mW5U9LOtWrODBHFiyylJvx+v0cQuilWuqi9cQzLRoEtW+Vwpcw==
X-Received: by 2002:a17:902:f70c:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-2984ed92f35mr68523995ad.17.1763014835956;
        Wed, 12 Nov 2025 22:20:35 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 22/38] libbpf: upgrade 1.4.0 -> 1.4.2
Date: Thu, 13 Nov 2025 19:18:57 +1300
Message-ID: <20251113061914.3756301-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121620

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- remove unnecessary struct_ops prog validity check
- handle yet another corner case of nulling out struct_ops program
- fix libbpf_strerror_r() handling unknown errors
- libbpf: improve early detection of doomed-to-fail BPF program loading

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 368ed98e7e4004963de7b7ad3d9c1b0e71f192eb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbpf/{libbpf_1.4.0.bb => libbpf_1.4.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.0.bb => libbpf_1.4.2.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
index f2ec48f390..928482ba36 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "20ea95b4505c477af3b6ff6ce9d19cee868ddc5d"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.2"
+SRCREV = "1b357586a7a62db7fe27af4ebe4bdefe6986cfd6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

