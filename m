Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40383C369D9
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 20:49:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13578.1745606526450314808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 11:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=fa1tooU8;
 spf=pass (domain: riscstar.com, ip: 209.85.128.54, mailfrom: erik@riscstar.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso23034175e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745606524; x=1746211324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXRHcPR06oNpeUiExQUfQt0naxffnTBSxVMfHLM7nRQ=;
        b=fa1tooU8S42xALd60a6GLXtBzVXI/4FzC3uoG9PV36UskazPCbcyR3co7sXUqb4+T9
         eufKoxDABU9Q45+y4FMA8ml51YN/dk2SHf2ue4QSVwjmHzuc3a51jvdzv8hlThjhtbwd
         9uuVWozTwCAxZeYUnHD3VMCLEsSjqCyDWqqtUwlEoa0O3xz0nvtpxtbyePQ5Ad3M82Pk
         wU6T9mz7ZNaG7Gnqlhvh2uFK4h2SG74ko+DihppNhiX2DVSO+fK0759TUQHz9Fj11K9E
         iUeIzVZUgvvwqh+KWZB6Wy6q+naHRte6VCrhVW1wK5ZBlJcil/5NjLeD6Wrh4JpuTbmy
         hOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606524; x=1746211324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXRHcPR06oNpeUiExQUfQt0naxffnTBSxVMfHLM7nRQ=;
        b=MJz9dK7B15Ycnwk01G/6LP4uGjecRwYUdkei+wZe+Bch//HGVZSxL9gm591kNBQdWd
         vxMwbGfp3yxQjBythh0W5q0siROwr/w9QFi4ACOLk1P+F/gVupsr+AQNuSvwkGwPrBGT
         kK6P7SjtZ9jsjdCY4BYgq4ghSAHY+D5dK3VoFlRwWMe4Qq42fDaBnFL6XghLIixUxF3C
         T5NzDwMCE29sB9iQBtazG+nAPDqU6pkMkoU9AhCqfgouWbVrJNBAqtqgoaGLFBCNkqLI
         3D6bSMD8hLCz8ItD8DJKTmnO4M0BO8ebQglvZPpqLCQ9+B8gvJuN1+HEZbE7BtSr+lLS
         AvVg==
X-Gm-Message-State: AOJu0Yymc3HprhWoSlk6Y95kmMgYHq3S5cqNPPOQw8yzSsI6lSBXxv/y
	1hIs+ogV5bMjHTp5/uanPDY6wU0auphtXMo+jPv2+zsIYkSICvyanJqNYOuWPlemWYBDSkaqXeS
	/q38=
X-Gm-Gg: ASbGncvT7LADngT8HsQajaQWLYXSyreR1hagM66Xl1QCPUd4JRjSD6V8t06MaWpwQGQ
	Dc/q8yutRrJys1/1ngiXIWfuoE8z4bFvyDyGajBD+6q/vxzScdo4DzgYlj29KBTwV/eKYMtzWBw
	w435J8eVEiUvpTW7GtKslkjQ8FUjx9Lj/mKT22WEuXP2E0bH65UV7MC0XAWdb07TluDpD3dLqAY
	4l3/F/zIFdL+Gi6yyqe3PxfhktV5663jL7KYpPhp2fFuT8iBUkz3Z6G4fHRKTkeqpZFrHxtJmP3
	LuXqiy3E9EkFTtWheMms/LR4CVBNJSt8
X-Google-Smtp-Source: AGHT+IHO0rf5GweSMfNKA2PdOGdR6iSsgsKHtgE3VocDaC4LypEpGOvsIlZYtHUYJLcXW9Q2w+HpFA==
X-Received: by 2002:a05:600c:4f06:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-440a65b64a9mr26718645e9.6.1745606524026;
        Fri, 25 Apr 2025 11:42:04 -0700 (PDT)
Received: from ablu-work.lan ([2001:9e8:d596:8d00::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm34045675e9.8.2025.04.25.11.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:42:03 -0700 (PDT)
From: Erik Schilling <erik@riscstar.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Erik Schilling <erik@riscstar.com>
Subject: [meta-oe][PATCH] zram: fix RDEPENDS for systemd service
Date: Fri, 25 Apr 2025 20:41:39 +0200
Message-ID: <20250425184139.1117690-1-erik@riscstar.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 20:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117174

This attempted to pull in the entirety of util-linux when systemd is
selected. That falls apart when building with `NO_RECOMMENDATIONS = "1"`
as util-linux only weakly recommends util-linux-zramctl.

Hence, we want to pull that in explicitly.

Signed-off-by: Erik Schilling <erik@riscstar.com>
---
 meta-oe/recipes-extended/zram/zram_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
index 89292118d0..e4522f89a1 100644
--- a/meta-oe/recipes-extended/zram/zram_0.2.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit update-rc.d systemd
 
-RDEPENDS:${PN} = "kmod \
-    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux','util-linux-swaponoff',d)}"
+RDEPENDS:${PN} = "kmod util-linux-swaponoff \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux-zramctl','',d)}"
 RRECOMMENDS:${PN} = "kernel-module-zram"
 
 
 SRC_URI = " \
            file://init \
            file://zram-swap-init \
            file://zram-swap-deinit \
-- 
2.49.0


