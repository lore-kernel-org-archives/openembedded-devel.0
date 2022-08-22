Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4D5C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 10:47:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.16610.1661165261944796147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ed0JNCOU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id h1so5358655wmd.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OQ3o8lk96bUPloA11p/GNeuxmbiGC0tp/TiJ52TWyWk=;
        b=ed0JNCOUMBU232pvRDJpJQLeJZMZ1CxKyu+9vY5BnvGLFwkab71TppvbC0ikJyQ8oz
         42Uqk6w+fA36LazhwVmUB6vCrFCspgSsaWqU9mI8o22RS579ip0KDDsdfEZhtbG+Rezm
         26lSqIy1UNLKFqQxvLX0aJHID/mQ+SUT6EoubjTpupgdyO8rGeYRwtS+KoBlG9K2Mu77
         lzIYhZPqiCIxxzmwPpueWLDNz/we/nYemoUav175F+wbuUFJ92UuHeRWkpKkhr/qn8Mq
         nmxk5OWVj3bfisvJVm6u93wnCOzd3DdUFfJHLb900+Wk+GXDNNvVDdCrb/c4xyTV0cMR
         iKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OQ3o8lk96bUPloA11p/GNeuxmbiGC0tp/TiJ52TWyWk=;
        b=eNcMtYqw2XvEYUoxzrb55wvYy33RHhZMICEpul3k816+rxO6OUSuYmz42olTD1rFi6
         NeJc11lxOgn+C0vFuM8DT2ArCa5XxCW0m0muc0nbnFKDp0GeSkX5QVeFfoIUvsUpKens
         ZsxaVJWspiz9me+5HvxIbBc4hfYBAqkYZSVJmWfCbpUDoctPx2ooWi5m2Ou2uOSW6Vqn
         Ryb+ZIt5T4cJeSRFYk4f6AjicdufOPmZVdAHjfdChYC+6dzyk5OoICkrS6Uu2xfOh8BU
         PJq/xA/7pSfAax0ABQ7hAjB7QNGcIUZD+kdujCxYgle23h/BnU9AWHkspDKqk42wHj0s
         DLcQ==
X-Gm-Message-State: ACgBeo1fCly9tY3FC2yx237ytBpQz860/QReqvxFHeDfE7+xClMtbUMX
	a4LInrOgVy7mCc5ro7NooWOpIbbGKHA=
X-Google-Smtp-Source: 
 AA6agR7TOuKJOOM7w5hKPbRybuV7L8vmucxwSCdYCxf/eclR33OSZGtPsqc/vR//085XZNpCSFO5FQ==
X-Received: by 2002:a7b:c3c3:0:b0:3a5:a783:e37d with SMTP id
 t3-20020a7bc3c3000000b003a5a783e37dmr11973061wmj.80.1661165259889;
        Mon, 22 Aug 2022 03:47:39 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 g12-20020adfa48c000000b00224f5bfa890sm11795283wrb.97.2022.08.22.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 03:47:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-networking][master][kirkstone][PATCH 1/2] wireguard-module:
 1.0.20210219 -> 1.0.20210219
Date: Mon, 22 Aug 2022 10:46:59 +0000
Message-Id: <20220822104700.1475721-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 10:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98363

Also change the git protocol to https.

Relevant changes:
- 18fbcd6 version: bump
- 3ec3e82 compat: handle backported rng and blake2s
- ba45dd6 qemu: give up on RHEL8 in CI
- c7560fd qemu: set panic_on_warn=1 from cmdline
- 33c87a1 qemu: use vports on arm
- 894152a netns: limit parallelism to $(nproc) tests at once
- f888673 netns: make routing loop test non-fatal
- f9d9b4d device: check for metadata_dst with skb_valid_dst()
- f909532 qemu: enable ACPI for SMP
- ec89ca6 socket: ignore v6 endpoints when ipv6 is disabled
- fa32671 socket: free skb in send6 when ipv6 is disabled
- ffb8cd6 qemu: simplify RNG seeding
- 4eff63d queueing: use CFI-safe ptr_ring cleanup function
- 273018b crypto: curve25519-x86_64: use in/out register constraints more precisely
- 4f4c019 compat: drop Ubuntu 14.04
- 743eef2 version: bump
- 3c9f3b6 crypto: curve25519-x86_64: solve register constraints with reserved registers
- 8e40dd6 compat: udp_tunnel: don't take reference to non-init namespace
- ea6b8e7 compat: siphash: use _unaligned version by default
- 5325bc8 ratelimiter: use kvcalloc() instead of kvzalloc()
- e44c78c receive: drop handshakes if queue lock is contended
- 5707d38 receive: use ring buffer for incoming handshakes
- 68abb1b device: reset peer src endpoint when netns exits
- ea3f5fb main: rename 'mod_init' & 'mod_exit' functions to be module-specific
- cb001d4 netns: actually test for routing loops
- 2715e64 compat: update for RHEL 8.5
- 2974725 compat: account for grsecurity backports and changes
- 50dda8c compat: account for latest c8s backports
- d378f93 version: bump
- fb4a0da qemu: increase default dmesg log size
- 8f4414d qemu: add disgusting hacks for RHEL 8
- fd7a462 allowedips: add missing __rcu annotation to satisfy sparse
- 383461d allowedips: free empty intermediate nodes when removing single node
- 03add82 allowedips: allocate nodes in kmem_cache
- b56d48c allowedips: remove nodes in O(1)
- 3c14c4b allowedips: initialize list head in selftest
- 4d8b7ed peer: allocate in kmem_cache
- 6fbc0e6 global: use synchronize_net rather than synchronize_rcu
- 405caf0 kbuild: do not use -O3
- b50ef4d netns: make sure rp_filter is disabled on vethc
- e67b722 version: bump
- 1edffe2 Revert "compat: skb_mark_not_on_list will be backported to Ubuntu 18.04"
- 2cf9543 compat: update and improve detection of CentOS Stream 8
- 122f06b compat: icmp_ndo_send functions were backported extensively

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...odule_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} (85%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
similarity index 85%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
index ce2ba6552..d80bdd87a 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
@@ -1,8 +1,8 @@
 require wireguard.inc
 
-SRCREV = "122f06bfd8fc7b06a0899fa9adc4ce8e06900d98"
+SRCREV = "18fbcd68a35a892527345dc5679d0b2d860ee004"
 
-SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat;branch=master"
+SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat;protocol=https;branch=master"
 
 inherit module kernel-module-split
 
-- 
2.34.1


