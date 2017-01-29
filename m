Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D685C77355
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 09:48:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so69640552wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AfXAsqgSeGkDclAAsRdh4d8VshguMvv7Lc7BLO7pTEk=;
	b=GKc00tFAZ/fgmuG8jSXOPdfPNS7k8TaWvLmHg1xQ9DLvkMKvoPgH8FunEObrp/HOBV
	feHJwwamsaMBt7+XnUk7JKjBtiJ01DbQyK8qyCpU3qlWE++OHdKMOcCDThbw/lRTtdE2
	wqDLISNsk1FUlBb5gtp9EclxcLpq7MohiFLGPWADyfFwQ58G8lHqb8qfHxeSz43/X0U+
	UmHOYZYsIitShiAMm6kJUQjGgkNvry1VFf4N/Xtc9W5j3VPke08SBps3/rjvfRS3KF0L
	Mh2BabB5/2WFqQKjRl4frXvs8nq1adbUeH4m6D2yDDX84YL23AyXWNVO/moWIAnVh05V
	UBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AfXAsqgSeGkDclAAsRdh4d8VshguMvv7Lc7BLO7pTEk=;
	b=E8tecrDThA+ueOyL9DlRjdFKEyWkMQQ1rdSBJzHrzt1BvxUEvrvQU/4WA7lT/C3oM6
	aOAXJ33uMWMmCg0U/KX+i3vQ76vsoiUcJcr1eyw3eGwvGqw02dXenIYPB/gVCfnzMjJf
	2wwixEVXhsXi0qZagb91a96DJnilf84XWrBE19Hp+HN+lr9tlpgcKGHEdxTdUi8Gvrwg
	XhewyaAmO5M/ztSqFJuY//qtkxjSEc8InxtO5KHRr5426DEOktb5P7JU3fioS0GfyusE
	0Y+yWWC8EWgWsbmx50J2DwJOLWZjknr8gGT32OcYFcKhZKiCoq/7eJZfGRaVeZ/ams0k
	3L8A==
X-Gm-Message-State: AIkVDXJbjjzyATjZIvtSbmuYQWsOO9Hp1CrvE4S8Qz7rqjHLnzD5Dt6mm3zO2DuoHosvEg==
X-Received: by 10.28.103.3 with SMTP id b3mr9053602wmc.99.1485683325562;
	Sun, 29 Jan 2017 01:48:45 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host49-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.49])
	by smtp.gmail.com with ESMTPSA id
	198sm12919092wmn.11.2017.01.29.01.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Jan 2017 01:48:44 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2017 10:48:34 +0100
Message-Id: <1485683314-5788-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld] Pull Request 20170129
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
X-List-Received-Date: Sun, 29 Jan 2017 09:48:46 -0000

The following changes since commit 3bf35a8a1da5b1ef63acd70988fcb89128297d97:

  linux-handheld_4.4: update from 4.4.8 to 4.4.10 (2016-05-11 22:33:22 +0200)

are available in the git repository at:

  git://github.com/LinuxPDA/meta-handheld 

for you to fetch changes up to 9c85edecd3793d8c031ec79ecd8906413a7a3f95:

  meta-handheld: remove unneeded noexec tasks (2017-01-29 10:40:46 +0100)

----------------------------------------------------------------
Andrea Adami (8):
      linux-kexecboot_4.4: fix KERNEL_IMAGE_BASE_NAME
      linux-gcw0-kexecboot_4.0: fix KERNEL_IMAGE_BASE_NAME
      gcw0.conf: catch up with renaming of KERNEL_OUTPUT in oe-core
      linux-gcw0: provide recipe for the 4.7 kernel.
      linux-gcw0-kexecboot: update to 4.7
      linux-gcw0_4.0: remove old recipe
      linux-gcw0-kexecboot_4.0: remove old recipe
      meta-handheld: remove unneeded noexec tasks

 conf/machine/gcw0.conf                             |  2 +-
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb      |  4 +-
 .../gcw0/defconfig                                 | 54 +++++++++++++++-------
 .../gcw0/defconfig                                 | 52 +++++++++++++++------
 recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb   | 30 ------------
 recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb   | 30 ++++++++++++
 .../linux/{linux-gcw0_4.0.bb => linux-gcw0_4.7.bb} |  5 +-
 recipes-kernel/linux/linux-kexecboot_4.4.bb        | 32 ++++++-------
 8 files changed, 126 insertions(+), 83 deletions(-)
 rename recipes-kernel/linux/{linux-gcw0-4.0 => linux-gcw0-4.7}/gcw0/defconfig (82%)
 rename recipes-kernel/linux/{linux-gcw0-kexecboot-4.0 => linux-gcw0-kexecboot-4.7}/gcw0/defconfig (83%)
 delete mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb
 create mode 100644 recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb
 rename recipes-kernel/linux/{linux-gcw0_4.0.bb => linux-gcw0_4.7.bb} (60%)

-- 
2.7.4


