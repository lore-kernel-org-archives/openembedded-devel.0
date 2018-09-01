Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4A879607
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Sep 2018 00:12:11 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id o18-v6so6777214wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lQi037gJ0O9Yh3ggCtM5Rr0Hej6x8xCWtDWx3ezOFZs=;
	b=AvVvzh8xDsiQceGVzOvOlzZrCLUqBVvlFZn8XEOy+d4hWdAsyUshfxlBjqidqIigwF
	v7wzHWv28MR7HHVCqjUI0CqLeUMMh48v/Y2joxpS9F5hbgdzca8yCJbtOMSwGZzjipl8
	OiIb59dt0hth2HKcS1Od89opyheqnxeX97MwgDOLOFLF/vx6bvqtJh9eAFrtcbgi3op6
	LCYrTLsHvi36L/eFq2Gvlr8eJEZfpMzSwpMTZ4nAacKiA39iViYoSTCSHtvoSJ5oqeZi
	0GUZbE1BtvfFTEKnQBOkuBKottTF+3e9SRp9SrmOvle0UNfL3lmA9RIxB/f6erUFZ4YS
	srtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lQi037gJ0O9Yh3ggCtM5Rr0Hej6x8xCWtDWx3ezOFZs=;
	b=RnP6lOOk2GCURuuPBskqWqMEb2l+yf6gbWvupX3/7Mjc9BXzofP/O93m4On29xjWoU
	8BW+elpoLIWeNf9ZU+LfM3/EPB4e8b5cjASvti9RRYfRsZzPkM94i37oBV2GqmM566jC
	ceZe8pEHHqnVYfD4leAA1mmsaCvMt8LvU07nBGa1Dh3TOJyN+J55z+07RKuEJ8Cgdhty
	a5wSLQoO/9rtFvgY725Ta2Ei/fe8XotDSkEVP9kdgfCmYXfItqCCwfdBRlJ7GYUdt1nZ
	o6rhFxk1tnsrtBz+b7JokPWx2ceHSyf60/G0QZ3ne3zosNnyZ4Z5MwYjVIu/nGBKHG1W
	QbLA==
X-Gm-Message-State: APzg51AkXoELni9HODgWTnQgrBMPv9m0fUeKXvC5Wy1XhVzTNCDmba6V
	8CCmqIueJE/WEzmr1Mld8bEav87N
X-Google-Smtp-Source: ANB0VdZE0FuhP4WYSvZAHu9VX51xm/krICg5BlfZjd3RB49quEgqgItaNyTeKJ+4xBPqvUkCNHGOyQ==
X-Received: by 2002:a1c:f703:: with SMTP id v3-v6mr5676759wmh.48.1535760731939;
	Fri, 31 Aug 2018 17:12:11 -0700 (PDT)
Received: from localhost.localdomain
	(host12-108-dynamic.246-95-r.retail.telecomitalia.it.
	[95.246.108.12]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm10287852wrr.81.2018.08.31.17.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 17:12:11 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Sep 2018 02:12:02 +0200
Message-Id: <1535760722-19558-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] linux-*-kexecboot: rename *_SYMLINK_NAME variables to *_LINK_NAME and *_BASE_NAME to *_NAME
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Sep 2018 00:12:12 -0000

As done in kernel*.bbclass with commit id f952c8e08b4

Fix empty zaurus-installer.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb | 4 ++--
 recipes-kernel/linux/linux-kexecboot_4.4.bb      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb b/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
index 64480eb..4d2def7 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
@@ -7,8 +7,8 @@ inherit nopackages
 PACKAGES = ""
 PROVIDES = ""
 
-KERNEL_IMAGE_BASE_NAME = "gcw0-kexecboot-${PV}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "gcw0-kexecboot-${MACHINE}"
+KERNEL_IMAGE_NAME = "gcw0-kexecboot-${PV}-${MACHINE}"
+KERNEL_IMAGE_LINK_NAME = "gcw0-kexecboot-${MACHINE}"
 
 # RAW for ubiboot
 KERNEL_IMAGETYPE = "vmlinuz.bin"
diff --git a/recipes-kernel/linux/linux-kexecboot_4.4.bb b/recipes-kernel/linux/linux-kexecboot_4.4.bb
index 576eea0..4a3df18 100644
--- a/recipes-kernel/linux/linux-kexecboot_4.4.bb
+++ b/recipes-kernel/linux/linux-kexecboot_4.4.bb
@@ -21,8 +21,8 @@ inherit nopackages
 PACKAGES = ""
 PROVIDES = ""
 
-KERNEL_IMAGE_BASE_NAME = "kexecboot-${PV}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "kexecboot-${MACHINE}"
+KERNEL_IMAGE_NAME = "kexecboot-${PV}-${MACHINE}"
+KERNEL_IMAGE_LINK_NAME = "kexecboot-${MACHINE}"
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"
-- 
2.7.4


