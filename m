Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B629CFCA19A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 22:14:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26996.1773094446313943622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 15:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4PP8Ysm;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35983877dc5so3946361a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094445; x=1773699245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVooxmFBL4p+/lT/I0y8DQXOlVSBPW1yrx32LLiHUD4=;
        b=b4PP8Ysmkkp03V+RvdJMl4PRCuinD1p1upPJNPocl31LVfcH9S6GsnbjYF//+v7W+w
         5paEiCAxkBBP8nZ3/R5B0aOHcrwbg4CD3Tc2bSOuDqzK7kUluJ8tD9/IzFfLf2Di6KOr
         /PlWlfK7dc2CejCtCTLAmghBbO5BDJ+WfRt8Mrbosu7+opqmaETxNc+XgwM9elU0NO0r
         7Gk1g+tGA7wH3K2eOE4EoFes6VNjW66HlZNHAMKRbC2IzPUwU8/icbF40fg8pppUpN5C
         nmDJG/LeNk/WOPLMynKuqmAxCzXgv3Eelgj851/y/vrdhlsD3anPo9HyoWSXAOH17jOU
         eAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094445; x=1773699245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVooxmFBL4p+/lT/I0y8DQXOlVSBPW1yrx32LLiHUD4=;
        b=fIv8oHBc2x2sojJF6KeTgOqCv/tojyDhrFVWW0qHFbxoNKr2Qq66uL6Egz/pEPedX6
         mH30k6jH3yLHooKUDeHQ/giq85zITaK5sT73h6bTQKzpllfJV1eJU5b4r1NZO5bYH7u9
         P/vngbq+WkrZ+4GN4IW300vvIIk1eJYoqIQ4EIf+arHUsSE2BpQ3iKn8TjF61lriB0Lk
         ufMb6iQrTKkd2YJknqzoqLlMsmEQka2YDjkLS1wUmMPDue5XozNNISO4+QaWPx+DWn2s
         0yksxYkpmDJaeZAv/Fdt5sD2R2VFHAxNvbr4IgBrn8vQFicT2hqJLz7nIc8x+bs3ynzh
         AnZw==
X-Gm-Message-State: AOJu0Yx9rhjG4tSxam7iW1gZoaS+N1CHT6JPBzz38Jhe6AEYHqyMqpBd
	UfQFCbpLZfKDEDyVdVz2ZYFCyAUmhcTH1pa8DNRLEYW4JRFR6rVsQUw5F9/szw==
X-Gm-Gg: ATEYQzwE7oCEggv/WPvF909UCnmDMHDd/g3nuLOH2bxKsQQiMTBOIoZ0VKoA3h/qPNT
	PJpr3JaE19t6nYTFmTBZtzxhKsP+okUeDjAKApE919tNMj94VV9tyRnxZSiT8FL/WjwjBmoFKbF
	ykDYNz/JLHoFdGPCkbAmFhi3NsWNiyCvzSo5Ymg0z28tcnuvGtRKHvWfp8PTze3Kr58cN3LDPHN
	oLyTP4bjqsJIhEoOhhlMi6YBWPvBbFYuy8+Tl/OVGBPW7B7Vq0pE0ynqQfyQiv7nGg8fxBoYg5U
	NF8269cMDS3kzp06B0EVYwYG/MFKJxOdZWJXc92Kj4pkKmdhi2fo4b7OadaWr5zIl4rT2ZQE1Xw
	YM9azA3Kg1t+l3lZwDJL5JDKnEyQT4exebFAJrczg4T6yn4ecQ2AzXEpST0Xdkd9uOuRfxoLwdF
	k1UkiHlOCHcZbsny0v7tveQd777niKulT7HcQ=
X-Received: by 2002:a17:90b:39cc:b0:359:8888:6519 with SMTP id 98e67ed59e1d1-359be119427mr11562908a91.0.1773094445369;
        Mon, 09 Mar 2026 15:14:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbc060d7sm5991413a91.2.2026.03.09.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:14:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystem][whinlatter][PATCH 1/4] btrfsmaintenance: upgrade 0.5 -> 0.5.2
Date: Tue, 10 Mar 2026 11:13:51 +1300
Message-ID: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 22:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125008

From: Liu Yiding <liuyd.fnst@fujitsu.com>

1.Changelog:
  fix syntax error in run_task, preventing jobs to start
  start scrub jobs sequentially if RAID5 or RAID6 data profile is found
  fix btrfsmaintenance-refresh.service description

2.Update 0001-change-sysconfig-path-to-etc-default.patch for 0.5.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7adb1a61d26d14132f98c5373d2cee2e91b84361)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...enance_0.5.bb => btrfsmaintenance_0.5.2.bb} |  4 ++--
 ...-change-sysconfig-path-to-etc-default.patch | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-filesystems/recipes-utils/btrfsmaintenance/{btrfsmaintenance_0.5.bb => btrfsmaintenance_0.5.2.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
rename to meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
index 645e38ca49..6722b63c10 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 SECTION = "base"
 
-SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https \
+SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https;tag=v${PV} \
     file://0001-change-sysconfig-path-to-etc-default.patch \
     file://0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch \
 "
-SRCREV = "be42cb6267055d125994abd6927cf3a26deab74c"
+SRCREV = "beb9e2d166cbd856297fe8d28e89e8b36961a723"
 
 UPSTREAM_CHECK_URI = "https://github.com/kdave/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
index d425206f0e..b064adcc86 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
@@ -1,6 +1,3 @@
-From b49dbe17e0d9ae463e5a34e6991aa2d3c70d2fb1 Mon Sep 17 00:00:00 2001
-From: Claudius Heine <ch@denx.de>
-Date: Wed, 11 May 2022 14:33:13 +0200
 Subject: [PATCH] change sysconfig path to /etc/default
 
 OE uses /etc/default for service configuration, not /etc/sysconfig which
@@ -11,6 +8,9 @@ Change the files accordingly
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Claudius Heine <ch@denx.de>
+
+Update for 0.5.2
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  btrfsmaintenance-refresh.path    | 4 ++--
  btrfsmaintenance-refresh.service | 2 +-
@@ -32,16 +32,16 @@ index d56ad11..f0b4132 100644
  [Install]
  WantedBy=multi-user.target
 diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh.service
-index 4ed1eb4..d6225a6 100644
+index 19e51c0..223fca9 100644
 --- a/btrfsmaintenance-refresh.service
 +++ b/btrfsmaintenance-refresh.service
 @@ -1,5 +1,5 @@
  [Unit]
--Description=Update cron periods from /etc/sysconfig/btrfsmaintenance
-+Description=Update cron periods from /etc/default/btrfsmaintenance
+-Description=Configure systemd timer schedule according to /etc/sysconfig/btrfsmaintenance
++Description=Configure systemd timer schedule according to /etc/default/btrfsmaintenance
+ Documentation="file:/usr/share/doc/btrfsmaintenance/README.man"
+ Documentation="file:/usr/share/doc/packages/btrfsmaintenance/README.man"
  
- [Service]
- ExecStart=/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh systemd-timer
 -- 
-2.33.3
+2.43.0
 

