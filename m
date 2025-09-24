Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C270CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:11:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.8354.1758705086487688804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSD75VDO;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso10430730a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758705085; x=1759309885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArvxitSHwP5RbvAVg7pKgnYJTlJ2UaIJwqiBein7Tno=;
        b=bSD75VDOwzIfioEVCHP1KGpTaBIuO5wlanOrfaxLLGeXWBsOcx+DJJX6YQlP7fGU9C
         iRnstw5+JmCkeIz+4S8fM0ka52c1MQpTxIu9xbw30NhmR3piZLvuFt3HniV9ZblBBo4m
         FnPN5ZeKKNQwlG1HXuZ3XvRQ4ljsGHiaAm0dFxibDvMr87Yq3LcQ+2ZFBwQkkOMNNeUP
         x7FzH2G1ZWSr9pZlkImNTzMpCWnGGQNyPNabWP79mTSa8STfFG756LTuuFaW+Xg9TSlD
         dxpWv9pS3VUsNEORIVolBTVZxH/8xLctbnE4ZtwGPJK/HUB30DOFIJjd+2CZRprpypVt
         TX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705085; x=1759309885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArvxitSHwP5RbvAVg7pKgnYJTlJ2UaIJwqiBein7Tno=;
        b=gvfll8FPQ0N2DpbyyHFPtkEAblwqG3j0tNIH96W/cOtvb7h94+SwABdeNIB9xl87hJ
         MZvVdstOsC7AoLeywzL5NPvpTYPRgqQKU/40KVX/wA+iQgmA1bPQTtu6fOf907e+N+c0
         jBrc05Kh5xAzP/Iv/4Sv7/C8myqx62cTSVsBLai7alxIZKTRgbg+xV+8W8dQZuMUVB+J
         4euXITyz/MbB6zS5gIJyP+xCsEq6ieHSYjl9dmyHIohGKVkNLsQA9xh70fL0z4PZsNbs
         ePIANVhsKV+qqlOLJSpgXLunXGlH8T6VPOEeLjK4ttG4mxMjiprFor1el5MOsNbtZv0W
         lXTg==
X-Gm-Message-State: AOJu0YwTZ9J4Sdu/ZvO10fSVbzpuBEmbXSvix1s943j/k1PBtmwbb8CS
	StDnUfbNwfCiXjo3tViiECosaOtSV9Xk+5CpAcDFiTjQ85ICTHlCOQ1HO3xVsLbf
X-Gm-Gg: ASbGncuvtL7p6Ra2tTCPPACodBX7KZ1aED8lbNGOwuNgHeJEjJFofyL+8V4fmRUztI4
	fy0bFtcPm0RhJV4lIS9W0i5LpKtXn5g7f4Ud5s4QV3W0oamvLgiVg1mObJBmOnf/HV7kB7OnAor
	DmUagj5b5LEFRXsKbMVhmu6T8TKnUubgcU1Qub9D20RWCnwkUdE2zHjugzRoXTF8JQOiDvtDnjt
	3YCGoG6YYokQNNFk8HDS4H7hx+zGgFN/nEBnjYzuOEpTs2HL6NLcnB1PFz36Au7JK5DNpbSp8b8
	kMf3w4nyWgeBJWRuzwLzhbZY6tvwZ79sFTW2dpP3a1pMsITyR0bIvlG7Nzck1tZicVZhZFv64R6
	PlBtq80VUc8hx2ipMxriB
X-Google-Smtp-Source: AGHT+IFXGBgdN699UsfwEgFwW/pbrGhG7NuNS+SfspDtPL+mkro5C04AMhFcqOfmF0AeHsEbAgr/jg==
X-Received: by 2002:a05:6402:234b:b0:62f:64b0:9cc2 with SMTP id 4fb4d7f45d1cf-634677b6e57mr5460067a12.16.1758705084452;
        Wed, 24 Sep 2025 02:11:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f2b4d3sm12599012a12.42.2025.09.24.02.11.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:11:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] keepalived: upgrade 2.3.2 -> 2.3.4
Date: Wed, 24 Sep 2025 11:11:22 +0200
Message-ID: <20250924091122.3888855-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119794

0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch is included
in this release, so drop the patch.

Many changes and updates, easier to look in the changelogs themselves
rather than pasting here:
https://www.keepalived.org/release-notes/Release-2.3.3.html
https://www.keepalived.org/release-notes/Release-2.3.4.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...not-emit-compiler-flags-into-object-.patch |  4 +--
 ...clude-linux-if_ether.h-if-not-needed.patch | 34 -------------------
 ...eepalived_2.3.2.bb => keepalived_2.3.4.bb} |  3 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.3.2.bb => keepalived_2.3.4.bb} (93%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
index e44e2035c2..92be7510d4 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch
@@ -15,8 +15,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1013,8 +1013,7 @@ if test "$enable_hardening" != no; then
- 	  "-Wp,-D_FORTIFY_SOURCE=$FORTIFY_SOURCE" \
+@@ -1066,8 +1066,7 @@ if test "$enable_hardening" != no; then
+ 	  "-Wformat -Werror=format-security" \
  	  "-fexceptions" \
  	  "-fstack-protector-strong" \
 -	  "--param=ssp-buffer-size=4" \
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch
deleted file mode 100644
index f6a38668ee..0000000000
--- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f129c588f7c8a66e595d8ae96a43d585018e79cd Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Thu, 7 Nov 2024 11:09:43 +0000
-Subject: [PATCH] vrrp: Don't include <linux/if_ether.h> if not needed
-
-The musl headers do not allow including both <linux/if_ether.h> and
-<net/ethernet.h> since they both define struct ethhdr.
-
-It is likely that we do not need to include <linux/if_ether.h> at all
-since with both glibc and musl including  <net/ethernet.h> is sufficient,
-but removing <linux/if_ether.h> is for another day.
-
-Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/f129c588f7c8a66e595d8ae96a43d585018e79cd]
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
----
- keepalived/vrrp/vrrp.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/keepalived/vrrp/vrrp.c b/keepalived/vrrp/vrrp.c
-index 96b2c4c8..4b06e387 100644
---- a/keepalived/vrrp/vrrp.c
-+++ b/keepalived/vrrp/vrrp.c
-@@ -40,8 +40,10 @@
- #include <netinet/ip6.h>
- #include <stdint.h>
- #include <net/if_arp.h>
--#include <linux/if_ether.h>
- #include <net/ethernet.h>
-+#if !defined ETH_HLEN || !defined ETH_ZLEN
-+#include <linux/if_ether.h>		/* This may not be needed at all - try removing and see if any issues raised */
-+#endif
- #ifdef _NETWORK_TIMESTAMP_
- #include <linux/net_tstamp.h>
- #endif
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb
similarity index 93%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb
index 6fb4886b96..be0f915b47 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb
@@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
-           file://0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch \
            "
-SRC_URI[sha256sum] = "77f4a22e5a23fa8e49b8916acdfb584c864e72905a2f1de2a7f62ed40a896160"
+SRC_URI[sha256sum] = "6afd95ddb7d3e0d3b8b8e5b3a489144131b61a01b06d29e883d0c44acc8a36bf"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"

