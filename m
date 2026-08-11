Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A68C5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:48 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48355.1786426664224985332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cvhicdEJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2652190a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426664; x=1787031464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pEaIHMT239SxsgTgmZukAzDwc9nT5B1Gbl6Xqbgs1k=;
        b=cvhicdEJ68zENFenaOQqgmgfFeQwzvL/oybn7twqdadVwk7NZRXLBrjE8LsaWz0uGX
         KlYMnaNUBZ7NCxU5boK+WmcgLNXDD4G4Z6ANGplTYgSPYg4QlAJ3+0t0jE8ZGKHFMliL
         AeXM/Jh+n2LlkNQISZ1TUHb/XyuBSHB6Ypyn8NNx41LxFtVgc5yC7D0VR1HuJHiyG3Wz
         A32C/jsaSMVz10GImfuMkFTEhgmZt5IrSYc26kNISIbDsgOpeO3DtpLiTKzvohidxqx6
         PBB9IlmRZK+/pI8+hcSBncHxQEmAlM3mUeESmlreMwGRPkyj8Zs8DrNKSCKQ2dnXLC41
         +3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426664; x=1787031464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+pEaIHMT239SxsgTgmZukAzDwc9nT5B1Gbl6Xqbgs1k=;
        b=ht6jCc6+gdsIXKusIkBPTrAglS7WFek8ak1WUuHrE6iMOG2R/oXNl9DHS6BhB3AJ0q
         wXFMkWk2nWFLveb5zSs9lxn8qU6t0nwSsLLQML8JZ45Eqh8oN4akB8WXgYIiCBm0Sn7+
         HakzD7gtxI1c9Jfkz/gbCrbqGZ6eRy4ev83mwQ0hSr+GsSAhN9xoI2VnK07mUOiJe/1q
         zpEy5N7ddFkjBmktGnNxfQ8qOsGiHewEeKoErQqFhD2H/HsCZqlY6kSJ9799W6Oz3pqh
         Lx0YRs6HvnE/JDba2NLizsnOGoCv33Ka0J2AzW3VPoHmY3as5th4kSJh7ZJhLgrSsegK
         gH1A==
X-Gm-Message-State: AOJu0YxHc6J5EgBThTj+4DhYUipzfls2UNt+OJw43poDB29gdYog2w8S
	IMEew17WGD3HBUrj3udpwJdyf+0uLcEGLcMFMivZQIvlaivue5k/6a+an6wUVFt+
X-Gm-Gg: AR+sD13YqLWNtU9I75rrNquOQoGbtLMI9W8MgLIG1aCCYr7MVedZILJZ0ySNA7+lKks
	w/BC+GdavUnb2BUWZhsVCocD6DVRIVN9/To8Tk+5ZVFztIzdBxykt3elMZ5sK+MuvwRjWz6Yomj
	AY3zJWjQJ7u1kDkVNg5Ge3HDC/d/3DmbMZ1jLsK01GBtyGC1ziElkv07Vh9wbuSLELzdLPbZzfs
	wq4YLGrmJ2SE+uP8j0Hx6VmxfL8msPcxNNd0jUTm6B39zg10wBsIsKpLWb8lBNo46Lt1jDZKX72
	x0ieFCb6JHg26gicUOmtI9QNTAR94GVxVjzBnQpDoniVqilnsMGn83i02I/bCAvj9vl0HqdTdz5
	dSwCmuGzlhjj2D5c9i6Cey5NjT26oZ2OOg3SwlHo7LspN6CNrGAqZ6KPFY7TOgF+q8A03RjJiNW
	4u37g1sLnuFatAuKfzTBzFV5YrQF9BN0GsdCQa0ROVXqNX7IqIdSZe/j+1AscwQDdwjEqCPc3Ij
	w==
X-Received: by 2002:a17:90a:ec90:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-392ec53e6c1mr916048a91.12.1786426663535;
        Mon, 10 Aug 2026 22:37:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] libdevmapper,lvm2: upgrade 2.03.41 -> 2.03.42,2.03.41 -> 2.03.42
Date: Tue, 11 Aug 2026 17:37:24 +1200
Message-ID: <20260811053728.4125303-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
References: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128910

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog[1]:
- Add `--lockopt retries=N` to lvmlockd.
- Add `--lockopt removeretry=SECONDS` to lvmlockd to retry vgremove.
- Use lockd_lv lock probes for pvmove holder availability in shared VGs.
- Auto-revert metadata when initial pvmove mirror activation fails.
- Refuse activation of pvmove-locked LV when pvmove runs on another node.
- Allow pvmove --abort without args when using lvmlockd.
- Add cluster lock lifecycle for pvmove LV in shared VGs.
- Add support for pvmove in a shared VG.
- Allow lvremove -f to remove pvmove-locked LVs after interrupted pvmove.
- Handle active pvmove during vgchange -an with force flags.
- Fix pvmove completion to use suspend+resume for DM table reload.
- Fix deactivation cascade during active pvmove.
- Support inactive LVs in pvmove with metadata-only mirror insertion.
- Kill orphaned polling process on pvmove --abort.
- Support formatting vdo volumes with kernel vdo target (version >= 9.2).
- Fix VDO index_memory_size_mb quantization and report minimum required pool size.
- Add vdo_format.c with pre-format logical size computation for kernel format.
- Add --enable-asan/--enable-tsan to build with sanitizer options.
- Mirror cleans orphaned missing DM nodes on image removal.
- Splitcache deactivates individually activated component.
- Fix memleak in vgimportclone and vg_write_commit_bad_mdas().
- Fix autoactivation on top of MD and loop devices if udev db records incomplete.
- Make MD device ready state check in udev to be in sync with MD udev rules.

[1] https://sourceware.org/git/?p=lvm2.git;a=blob;f=WHATS_NEW;h=45ba143df59ed17f39fc3cc802b2f0cb32cfddc5;hb=56bef2d3430fcc5d5b00f64c099251ea824ad16f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 77dec89bbf..8c00063775 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main;tag=${PV_TAG} \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "539014d16099ee8d46318b49e9014332e2dc7ef3"
-PV = "2.03.41"
+SRCREV = "56bef2d3430fcc5d5b00f64c099251ea824ad16f"
+PV = "2.03.42"
 PV_TAG = "v${@d.getVar('PV').replace('.', '_')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"

