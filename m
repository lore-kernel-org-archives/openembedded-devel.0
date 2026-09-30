Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862B2CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:30:44 +0000 (UTC)
Received: from mail-pz2-f15.google.com (mail-pz2-f15.google.com [74.125.228.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115.1790811043363246774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ig3oV58j;
 spf=pass (domain: gmail.com, ip: 74.125.228.15, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f15.google.com with SMTP id d2e1a72fcca58-88379342f7fso2620897b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811043; x=1791415843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IATvYRRKG5d4QkQMLS3tF8koIAwUOvkHkfnbtOb8keo=;
        b=ig3oV58jPVgjixsxdtVohvQrj+gsLAsVMwwM9eDQxJtNMh9IjGNUtelSrx3gm735rk
         rZxEmRUeNEH2XB8ynvqXCGhQwjhRTVI5N3TRamBAtE0pjJxK2e5a76/bmhDNUcd+hDFp
         M4UBR4bJKFbhHXf9tdlDIugvlVsyMUc0Svkk52tPt6xVAyuNXC7sOff0Kp5hzZ33a/XL
         R4xREbmebHsdXwGiprydY0SaQRQMfJ2FBSTi1kVkIfl9r2K0Ikdhsk8Z77oXo2+kvD5x
         2Kvg/2YoH1gj2vAde8LUk4cGKH0O3J67hfnu7ByKiolofWGRGVt47NDumCgKMVnELSUZ
         KV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811043; x=1791415843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IATvYRRKG5d4QkQMLS3tF8koIAwUOvkHkfnbtOb8keo=;
        b=c4PxcfKcyJv4gzxSa4RBNYfTlOOX/hBp1ZY5N3iBXyWmWu5iyEBTmO8Y08gU3/Xsrk
         FQw1koW90d3Ut9C7lbRjLzoMAYp2xcCqmOeD+0dSduzyPx79KsZYcGVVxZ+F9NHCq5xW
         8/YvnLQ1p/iX1TvSwLL/rRtI0A6OWwTlZ089Tzu1X5Mq+reEWnICkVGA8W6pfXa+i8as
         Szmg9HqDFze1ZObYH0yf29WBAMj8Qq/6EGeHm2UpZcWBL6sI52YfF6ffM/O6OMjtUWrc
         1dWK/xLLgr0Savz7Rjkz5AoHcn4+xE+AETWz/F7SRmSuoqjUkdDwpPLDgMyFbvNvm+Q7
         vl9w==
X-Gm-Message-State: AFuF++l34cpC53SdsOYQ8O5Fg+JK7tK19AWGN3YRispnxLKArnZUrhsX
	L9nPSBBjh06aRuNv6i8VSgQB8XxaPBucSreII2duhL2J9Yf8C5QG1HVOeMxdCg==
X-Gm-Gg: AYBFou0okOzyGtH0sfcQRzAhL+p2G8nPShKzIU8CneI5SWnpfZN76FjeDtZcm1c2rrf
	z1R2iUqhT/3o5Gx2vEgKF7c7etoiv7Gn9xiCuhDjrOedSlcrWrgXJ8CTZXZtnnkVxebzPmqIUtQ
	od7ZdqBJtjCOYo0XFQsVfhr3iM4nbXvUZ1/+iXbTyBZyQMfCaBp2crKIr75egCqRrvVCsrIqnfy
	dJPmHKCORQkoU1a9Wc0Roxq8fWrhgD+m34ewBMaMxZGy+08MABXlj2Od6eE/reyMsko1MbfyhDN
	+xZmTo+ZJJQAMpDz1lQxzVMUhcX8DDR+LVYPVEpM1cMbyHwSFxG5o257HYWFHsxLBcFzZneBmFK
	VUJpVz9iInGeikb4gLzmosMBub6fYLZa+WkcR5as1QobjiJiiyglgvFxEegl8EqPM5pfhIsPPgT
	i9lpshRjuJez1gNT0IupM9soOPXBj92g4sEIm1vjq2G4HzZwligOeyeIT2AQVdLBKH1cIYmQKWK
	xaVlzBlinC0+8W/3mBx/yE=
X-Received: by 2002:a05:6a00:430a:b0:886:29a4:a00 with SMTP id d2e1a72fcca58-8874b357ec8mr2234033b3a.47.1790811042457;
        Wed, 30 Sep 2026 16:30:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/14] libdevmapper,lvm2: upgrade 2.03.42 -> 2.03.43,2.03.42 -> 2.03.43
Date: Thu,  1 Oct 2026 12:30:21 +1300
Message-ID: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130534

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Update 0001-Avoid-bashisms-in-init-scripts.patch as cluster mirror log
daemon is dropped[1]

Changelog:
- Wipe stale signatures before formatting a VDO data LV on thin storage.
- Warn on non-power-of-2 thin pool chunk size; prompt when --chunksize is used.
- Fix lvmpolld shutdown when reaping a finished client thread.
- Fix dmeventd raid repair after partial replacement or resync completion.
- Retry failed dmeventd snapshot extension with exponential backoff.
- Fix dmeventd snapshot threshold advance when lvextend failed.
- Fix dmeventd snapshot unmount on Invalid/Overflow, not 100% usage alone.
- Reject undersized --pooldatavdo conversion before allocating pool metadata.
- Allow lvchange --refresh and properties on hidden thin and cache pool sub LVs.
- Allow 4K stripe size smaller than page size (except on DAX and MD RAID).
- Set recursion limit to 1024 LVs when processing device tree.
- Remove cmirrord and clustered mirror log daemon support.
- Remove legacy vgimportclone.sh script (superseded by native vgimportclone).
- Respect /run/mdadm/creating-<md_dev_name> in 69-dm-lvm.rules.
- Add `lvmconfig --edit Section/Field=Value` to set an lvm.conf setting.
- Add `lvmconfig --edit Section/Field=-` to remove an lvm.conf setting.
- Fix use-after-free of host tag list on toolcontext refresh.
- Fix memleak of config tree list nodes on toolcontext refresh.
- Fix lvmconfig output of merged and unregistered config nodes.
- Recurse into subsections when merging config trees.
- Make lvmpersist reject non-block devices and unsupported device types.
- Make lvmpersist validate `--vg`/`--device` and key options before use.
- Make lvmpersist check for required PR tools (sg_persist, nvme, mpathpersist, jq).
- Make lvmpersist clean up registered keys when interrupted during start/takeover.
- Make lvmpersist report failures from start, stop, clear, remove and query commands.
- Fix lvmpersist `--vg` device list splitting to avoid pathname expansion.

[1]https://sourceware.org/git/?p=lvm2.git;a=commit;h=f999dcc03828d097d0cd7288c224efdc07c44ac7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-Avoid-bashisms-in-init-scripts.patch | 21 +------------------
 meta-oe/recipes-support/lvm2/lvm2.inc         |  4 ++--
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
index fb58793a17..c97cd7a86c 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
@@ -12,11 +12,10 @@ Rebase to 2.03.01
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  scripts/blk_availability_init_red_hat.in | 4 ++--
- scripts/cmirrord_init_red_hat.in         | 4 ++--
  scripts/lvm2_lvmpolld_init_red_hat.in    | 4 ++--
  scripts/lvm2_monitoring_init_red_hat.in  | 4 ++--
  scripts/lvm2_monitoring_init_rhel4       | 4 ++--
- 5 files changed, 10 insertions(+), 10 deletions(-)
+ 4 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
 index 347c39574..b2e9cf932 100644
@@ -36,24 +35,6 @@ index 347c39574..b2e9cf932 100644
 +	echo "Usage: $0 {start|stop|status}"
  	;;
  esac
-diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
-index c82f8f547..a3a321d9c 100755
---- a/scripts/cmirrord_init_red_hat.in
-+++ b/scripts/cmirrord_init_red_hat.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # chkconfig: - 22 78
- # description: Starts and stops cmirrord
-@@ -103,7 +103,7 @@ case "$1" in
- 		;;
- 
- 	*)
--		echo $"Usage: $0 {start|stop|restart|status}"
-+		echo "Usage: $0 {start|stop|restart|status}"
- 		;;
- esac
  
 diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
 index 176ff5dcb..825f6ad84 100644
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 8c00063775..62e0b725c7 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main;tag=${PV_TAG} \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "56bef2d3430fcc5d5b00f64c099251ea824ad16f"
-PV = "2.03.42"
+SRCREV = "7b0bce6909611966bdc1e17c2408e1ec3b0f8c17"
+PV = "2.03.43"
 PV_TAG = "v${@d.getVar('PV').replace('.', '_')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"

