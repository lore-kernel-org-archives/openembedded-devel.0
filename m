Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B2FC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:48 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.19192.1663590826487048450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JzHgOjEf;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id d1so21732101qvs.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=oLcRdc2epiXyn8Ri1HANYPUNsB0wwSbLjMCxSB8U9gg=;
        b=JzHgOjEfLOtRpGUuZgVZ7vswYyUFpJonJ3FFdqgqSqcODiX+wIReOqMc037j0svaao
         z/LLk1NLOBS593pxFNuOqCzAxWbZXgILcUxXHy50bSUqvyUv8FAN6M0uNNcjDpaot7Pd
         84kTtdQt1iaNWjPQZPrYu7vpnIDaLDnZcd7Nb2QGFOLaOpbTzxbEUw3VHQEh92NhtmjF
         98FOq08Xhqjnhtr6nFFqZifeNd0VoXHA6CkSO4d2x04THxUC1F1AzHKU14neAL8KhU57
         X1Rn47Rl9YfNIwfc3AlUnukumFgtpG3Cc/LXEiWCLCxBmjOyBUocIbdMeaFXoUCEg3td
         ASRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oLcRdc2epiXyn8Ri1HANYPUNsB0wwSbLjMCxSB8U9gg=;
        b=Uf6U44fACkZuZwkfFo+I7tWB/Ey5sgfmwWEdzQAA9RrxYBtfWHiJ7rWzEB7TzkMXom
         Gf1ZJzhTgKGDZS5H4vlyq6Y2mo0QA26kjUqVIfhDk8ciYMeC8BpeydL9gstJPaCYGueB
         c6NL2VvZ9dyvvjyhi4mkKI73ghMw56mYIVF4sa1tNoVR1KQgT8rKlSuWg/TWK6jak1YM
         HUgK7daDeehq7e/dogtxqDdEY1tOOkECFiD71G9Za6GFYRKlfR6SP22kVvjfa0Htecy1
         A/BpNeXpMByoQJIkBDwla05h0NXK3Zmyqpjy439Del8kmLL+X6NbZW+upmHbvFLxUFzt
         mDbQ==
X-Gm-Message-State: ACrzQf2qGNPYOeWp5NhGxMHTxASxMMDa1z06l/LN9DvEyaKOa0qehh3Z
	VLz8h0rp8YsjI18Kf8aDBw+jEQMWWsc=
X-Google-Smtp-Source: 
 AMsMyM6XdzbhXzKc481ZzdRuCFlVwGNLJfKozjGavtBTOGg2dlqPzfvdmy2t9gNSVFua0MPjgrkB/g==
X-Received: by 2002:a05:6214:19c7:b0:4ad:32e9:a414 with SMTP id
 j7-20020a05621419c700b004ad32e9a414mr5789243qvc.115.1663590825099;
        Mon, 19 Sep 2022 05:33:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/11] wireguard-module: 1.0.20210219 -> 1.0.20220627
Date: Mon, 19 Sep 2022 08:33:29 -0400
Message-Id: 
 <4d804bdf92f7542217a7eef7c376bc9f277e4e16.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98853

From: Jose Quaresma <quaresma.jose@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e2a2320a7953fd70e8b416f9f6741d0b6654f280)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...odule_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} (85%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
similarity index 85%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20210219.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
index ce2ba65526..d80bdd87ab 100644
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
2.25.1


