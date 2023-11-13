Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF0BC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.1179.1699905864802739438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TX0nhb7M;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b6a837a2e1so2749951b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905864; x=1700510664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3EOt5aLDR40ejwTUgAHbZJYfFXUgzsPZuY8tpy+LPc=;
        b=TX0nhb7MZ7Ml3YdDO6JHNstfqKBXlKGjISOHwclYf5vCGXeOqRRiB3hutT9c2K0sDm
         6rVsomdBwEjTUljr/pYq54els8AOFs7pLWZST6KcRyi70UXiCkO24IxOSyeGcWFxzjUw
         A35E0MePBHKTj6GMof4ZUZrB1jQBudA2vWrkZfc11khMhRJ4E9zbuShmnPpF8cGi5tug
         f3n4zDuYzLIvlDvAVQpzdJ00V0FRO4pBQlxz77WgV76K2p2R4f7D/hsQHs4VgLgxaJPX
         zpNoZ00mw97VM5rwO7YQuI7QImj9yqbkq5DG/GvKft7xvfPrNg018jEwKUXAoT0myp0J
         EZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905864; x=1700510664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3EOt5aLDR40ejwTUgAHbZJYfFXUgzsPZuY8tpy+LPc=;
        b=MDv9mdn810WvoOSu4R739Vb8JFW/OQJUJYs7vbxgvlOlyqqFTXbLattkaIu5OqeMW1
         z7QTh7lc8ed78MX4lrMvIePVs2fhkuS6HcIbee/1UacfOVKPSo7a2Ane3/j38nXc9MFf
         Lc16i9X4TbGaRSKg3enTLbadCFJtsA8rRAXyWVSwP51voasJ8mz8lyKOm3Xvs0onyEtB
         WGQWMbgF7XQuqidRCX5ejO9r9C5wMO+dPjbamvXW3z/5sdStwsa7VWT81PI4RxtMXPsp
         t00TBEP2gREAvU4wSdhi8FYQqHJ2BDjYKLLmGqkRlKtus8farZLh2JcTFSfKifkIyY0h
         p50w==
X-Gm-Message-State: AOJu0YynSOXk8H5FPj2hF15h7Y7ATbapbfiH2beL6QLLeEK+G8C/XAzm
	L+FRf7UeDkviCtRkiToZc+Z3pgHaFYNFCA==
X-Google-Smtp-Source: AGHT+IHlWctxMPc/hwXLf7QyHOdQ5Ql6ZQ+Eo6EU5pH7t9Pu7tMI70gZA4N/DpbvF2hV9exJYx7vXA==
X-Received: by 2002:a05:6808:1aa9:b0:3a7:57a6:e077 with SMTP id bm41-20020a0568081aa900b003a757a6e077mr7532969oib.37.1699905863858;
        Mon, 13 Nov 2023 12:04:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/6] cannelloni: Fix build with clang and libc++ runtime
Date: Mon, 13 Nov 2023 12:04:14 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-1-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-bits-stdc-.h-only-when-using-libstdc.patch | 37 ++++++++++++++++++++++
 .../cannelloni/cannelloni_1.1.0.bb                 |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
new file mode 100644
index 0000000000..71f447c94b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
@@ -0,0 +1,37 @@
+From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Nov 2023 00:07:23 -0800
+Subject: [PATCH] include bits/stdc++.h only when using libstdc++
+
+We have other c++ runtime implementations e.g. llvm's libc++ which does
+not provide this header bits/stdc++.h, therefore make sure that this
+header is only included when using libstdc++
+
+Fixes
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0/git/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found
+|    27 | #include <bits/stdc++.h>
+|       |          ^~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/56]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tcpthread.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tcpthread.cpp b/tcpthread.cpp
+index a1b3047..bb5a7b2 100644
+--- a/tcpthread.cpp
++++ b/tcpthread.cpp
+@@ -24,7 +24,9 @@
+ #include <cstdint>
+ #include <cstdio>
+ 
++#ifdef __GLIBCXX__
+ #include <bits/stdc++.h>
++#endif
+ 
+ #include <linux/can.h>
+ #include <string.h>
+-- 
+2.42.1
+
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
index fb457dc03b..dfa7437ba8 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
@@ -2,7 +2,9 @@ SUMMARY = "a SocketCAN over Ethernet tunnel"
 HOMEPAGE = "https://github.com/mguentner/cannelloni"
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master \
+           file://0001-include-bits-stdc-.h-only-when-using-libstdc.patch \
+          "
 SRCREV = "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
 
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

-- 
2.42.1

