Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE8FC28B20
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 02:17:43 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.3876.1743214655751310503
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 19:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIhoQpHD;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso5979750a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 19:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743214654; x=1743819454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLP9PQf5HP5y7v1suZAe+iugCggmHJZWW9f+cD/9uGs=;
        b=FIhoQpHDwwUfVN+F+ZJjJWrb5LuPYKPPKw3s8sIMUDvW32GOis8bFQb5Jeb60CJzYj
         7nRyFRYdtpKGOp++yKITWnOSpiuqgKRMn3MQ7PCQHMHowxrxiS1GWlqqHbu1JQJgyxs9
         ok15MRETs1O0hOWpoNXWF0evQD2G9/IMp/bQEB1l5P5klOidFE40TCTbwbBO6QvmZ4p3
         vsVDeIcqIfB4+nmbuGKocoqOC4fd9Wtw+9UzrmESSxQaQGvP7/dQxcQFabhsmcxo6t9i
         Kvtbqr3QoUvFk5PrSAfC1+D7dSEE5RZjW657Pa9i6/EeJI+kg8ErTje0Mwa0SX0blF1B
         dv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743214654; x=1743819454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLP9PQf5HP5y7v1suZAe+iugCggmHJZWW9f+cD/9uGs=;
        b=ZrEdGyE6O/UJ81JDoapK2bHXciOqiCB/zuORxMUs09qn0PoyI3xPvBiOuEZETXX52H
         xKVVFInwHlCboNgDq9UtvW8lvzMpUOrCNEm8+t8L+kvx+b9v3kMa8hR9ei+O4b3mii7u
         QtHzjmNkeP7UsGcGnXSRFcObe6cYvsmCa0Iag4hW3FVfAKjx9bRJgG/Jnl46/M6xVO0a
         HvokwFOBi8PyuhGBPyVzhnSBe/BfzQR3TcvbFWJJRo8bmVykoJzceA8HOq5Pf9ZSEN6S
         YQG1WpEZzrcncxc1LvzDXWjtkBIeWoFAJZ5Kg/PpHZ3psCvLrzxd22e/GfTdchngbfs5
         8lEg==
X-Gm-Message-State: AOJu0Ywcs4TBnQxCvjYqcdT3ypABnrXckjf0iyTg1aFsqqhsPSgF0FRq
	9Zcx9HC31MfiLlufNNc1C6CZP5D5Sn8LmLJMaJ+3hDAq5MpYPBnqGM3RFllQ
X-Gm-Gg: ASbGncsDPiY3uiZ9QYpESa8SIvNe2bvTnB1K6/qJvxbCRz0xI5f0TMWZMycsFk1BYEi
	wiXF+bm3fA6M+rSHfK+wk62n1XACzJoByYS8/tZdqJfht5s1fVGlIKTF3dEFH2Z+z4agzulnEYU
	egJf1SbCJX4zq74Y20YN6OoFcHdIgcfEpbtI52XY7IYqHUt9ArTCjBeqSfqqe9qzzONKscL/iXW
	LpPSZ5893RIixv4T80C5D9rCSmP8723qRq3PoiPmaiWAVK4grfAmyn5rH2FgoBpBDgMZcsiqD3t
	nHefOZDylDi3Svy5OIjpPWE1Qt0wk0QwGSZz
X-Google-Smtp-Source: AGHT+IEY/hUJexAG2diMu+L4Y21+AEGpySVjGRodF/MEAiZ7/SbGjllonCseNHlJfBAV43BRkBKCRA==
X-Received: by 2002:a17:90b:2f07:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-3051c889b0dmr7800602a91.7.1743214654188;
        Fri, 28 Mar 2025 19:17:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b633bsm4947865a91.43.2025.03.28.19.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 19:17:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [meta-oe][PATCH] iperf2: Add _GNU_SOURCE define to cflags on musl
Date: Fri, 28 Mar 2025 19:17:31 -0700
Message-ID: <20250329021731.2535876-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 02:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116362

glibc defines struct udphdr as a union where members have aliased names

uh_sport -> source
uh_dport -> uh_dport
uh_dport -> len
check -> check

But musl only defines the aliases if _GNU_SOURCE is defined, ideally
iperf2 should be using uh_* names of the members so it is portable across
musl and glibc but thats for upstream to consider.

Fixes
| ../../iperf-2.2.1/src/checksums.c:175:19: error: no member named 'check' in 'struct udphdr'
|   175 |     if (!udp_hdr->check) {
|       |          ~~~~~~~  ^
| 1 error generated.
| make[2]: *** [Makefile:539: checksums.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index a439616ba4..b31532d4ea 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -15,6 +15,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
+CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 

