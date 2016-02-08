Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 45FD560017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 22:00:27 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p63so133681970wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 14:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xFqKqJPrOSWZuJESe/BVELscVXFyz8NWDniyQzr5OAA=;
	b=bp2D704mj7XeaTVEYdojtPWAooGiKQbURUBpbOhInxPoSp3cPEV2nnH9sthuFgBLfW
	xbZNa/Lu6mfymQdul+VL9BifaXB9pEnHk2cW6wrFdV1q1Pzx54m9Stwr5DgLmd+cmZtI
	1IrUQiUGmn5iVzvNSzHSdgxyXT1nQX5ASl3hq4m8Q1wzHebeKgJhvRkrf6tOsquscawN
	KnoMp9uQ/ZueWdIUDYGEP8qBJug7CCt1O9XXY/dVtJnP/GPcIwySSEYUaDwflFOp7cXc
	1pry8TpKovqU6s7lWHbsG5uBy7wM7rmCnmJM2vqyLZnD0YEYa95jXtfBrjxhh6NzS8W9
	nlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xFqKqJPrOSWZuJESe/BVELscVXFyz8NWDniyQzr5OAA=;
	b=ZzXSt6ETaJbQoaa3CYnpUCH0NeWmfZ44wLe1A1xke+nceiiECL8MFK7m7Xu6sKQsOQ
	L1KTU/owcnfGv76EBWy7xmebeSD+p1OHq4ElRkd4g43Stxeu9pBq2htq97ZHLE3Qdmu4
	Ht7w9NDwBFW85pnE8f1wH+wsm7P8QCVcKxEQPvAbwxhnXdnakNJAV3nl51772WI4BDVQ
	/Lfb8pBZI5Gpu7W0UiR3gBFhuZY9aHe6P+O0peMfn2tJ9Ujj0wGe43nyHWMtypdODxRK
	LLga/huljjJS8CbB9FP1rRkI0drH5rQKW8PFmrLXKp9YfBOuKjH3JrPAP3IVeLwniHEU
	8S5A==
X-Gm-Message-State: AG10YORX5Y2uFXLdILfnbHGlJqc8Wzv9NISbPhiDUdv9CvAobekVYAvRNA1NX6hzMylxOA==
X-Received: by 10.194.78.148 with SMTP id b20mr5881076wjx.71.1454968827728;
	Mon, 08 Feb 2016 14:00:27 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it ([95.236.250.222])
	by smtp.gmail.com with ESMTPSA id
	n131sm14441380wmf.9.2016.02.08.14.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 14:00:27 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 23:00:04 +0100
Message-Id: <1454968804-15055-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: upgrade to 4.4
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
X-List-Received-Date: Mon, 08 Feb 2016 22:00:30 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...inux-yocto-tiny-kexecboot_4.1.bb => linux-yocto-tiny-kexecboot_4.4.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-initramfs/recipes-kernel/linux/{linux-yocto-tiny-kexecboot_4.1.bb => linux-yocto-tiny-kexecboot_4.4.bb} (100%)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
similarity index 100%
rename from meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb
rename to meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
-- 
1.9.1


