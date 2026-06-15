Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9604CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:52:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132792.1781538720043957022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PjM1KR61;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so15952905e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538718; x=1782143518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHECzecL3xIBtFa7m68LtBvra1rtg9Q0Y9aCZN/J09E=;
        b=PjM1KR61HHg7+1F+j1mUQpirFlaAOnJrkt0fvSf8QH4HZZIFEiQ0PEDwUAnwxmgRy5
         YsOPX2lMb4DvyKqgEJ1Dcf06RCU6mXuOo8KUQBpRMZafafuHGxV2tFqYPwDz3zSLpUyq
         8o5DokQ8rhb/8hAHVjkm1np81oFMg01g6eQ+jTc7e3o2osX4nq/42R/SC3zpTnyfqX3e
         7y5SXZpRdePdE/2n/WwO3z1N5WvNDF1pHSA9abghKfD30pyseOqftUeMb9Ga8EttKUi3
         3WrnbtZtGm8h9Rk8frGX7jl2fM/2a9rQP6LXeS/b34qJa+YzoMlMlLKLnP/tImUq059Z
         TDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538718; x=1782143518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHECzecL3xIBtFa7m68LtBvra1rtg9Q0Y9aCZN/J09E=;
        b=DuRyafmxYBJtE2Dan6NSG9iPxaHsD+YvKrtHUfnvDN4WsqnW041SANp+aBRCE+kUY3
         bFNkmNHjVi22Wv/sL1SLuYx8/krw4jB++7Jfjk8sMEfS2TVqPR314IIKALqR7Yfil7Hm
         nLmAJTbih6ia/Z4P3n31DzLbN3aLNuv7WH+tVa9xch6Gc13Q/qHHte1TKGpd+7h48BVs
         gLn6QfyK1qkwzJMIknoZw8n8V3a4mpY+5iyCwJ/mNfvJMn2m4A2ZBPAfopEwAsk8dwGr
         kTKtJ0y14caOFQGRxPg9tG3ejF1fFpTgMO8c+hXYTls5BF4G0sKypRnWUz9ycce6NDhb
         ugGw==
X-Gm-Message-State: AOJu0YwLDVsoQXUn9Y+sPH+ecwnXaVmCFvmhUaX+s3cfzvdTbx4ys2Dv
	9RdnUcsjLZIr9oNTLIa9kC3Hy4KURO5oe6LqNWKO1qU2/NBALYrebZo0JLv1w818
X-Gm-Gg: Acq92OGjC3zoxmzdZ6vcH4oReGzR0qAZtHXqqx0fYkx0pDpq5x6OHRJ0GPGwYsuKTkg
	xuD3Mf1X/RtM7TyLy72r5mlEXs7Jm+QYaqX8Gfguv6ROJcX0GS0x7zHb9UGfeYv0HCbN8SSLnR2
	KQ89Q8u+4WXDyQ+dfxBQPJg/BXDUTB3wv2Vl0KjxBObLoZj9KhTWZO9C2ABeC39IUd73BTmN5LL
	1C94RH2n4wyOzcZTpENH35fyKF1AZXswbIrDGjZdj0/gikdL9sBEMUckoriYvvrJEPFObef/H9x
	vaNFDFG27KkPYYyZdvm7DCkUwtagmWCAI6dx9kwthj5omX7MtTky6/F94JU3Pb2xR7irF9NiWQq
	sGJiNPMM+BGEB7g4/TNR8YxUNYwq++H6uJmsgmvnopEPf9o+CmrT17oUySfsIS2wKvUaNjsEOXP
	WsKGVbD7bBQZOip4qFYOFQjYQe
X-Received: by 2002:a05:600c:e556:20b0:490:bde3:d112 with SMTP id 5b1f17b1804b1-490ec5088b6mr139875035e9.30.1781538717999;
        Mon, 15 Jun 2026 08:51:57 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa97a07sm2276135e9.14.2026.06.15.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:51:56 -0700 (PDT)
From: uvv.mail@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH v2] tbb: Fix build error
Date: Mon, 15 Jun 2026 15:51:49 +0000
Message-ID: <20260615155149.280023-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127592

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Target and ptest packages miss the run-time dependency, which causes the
following build errors:

ERROR: tbb-1_2022.3.0-r0 do_package_qa: QA Issue: /usr/lib/tbb/ptest/gnu_15.2_cxx11_64_release/test_tbbbind contained in package tbb-ptest requires libhwloc.so.15()(64bit), but no providers found in RDEPENDS:tbb-ptest? [file-rdeps]
ERROR: tbb-1_2022.3.0-r0 do_package_qa: QA Issue: /usr/lib/libtbbbind_2_5.so.3.17 contained in package tbb requires libhwloc.so.15()(64bit), but no providers found in RDEPENDS:tbb? [file-rdeps]
ERROR: tbb-1_2022.3.0-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2022.3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 33741a7ac1..e09aa5d96a 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -30,7 +30,8 @@ EXTRA_OECMAKE += " \
                     -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
                 "
 
-RDEPENDS:${PN}-ptest += "cmake"
+RDEPENDS:${PN} += "libhwloc"
+RDEPENDS:${PN}-ptest += "cmake libhwloc"
 
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules

