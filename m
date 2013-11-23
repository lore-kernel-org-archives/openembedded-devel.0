Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id D51266DC1C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Nov 2013 17:12:51 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so1262727eak.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Nov 2013 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b9EGrnGzTOmXKJW/J/TTcpJESbFGjgbd4FnzfGUq708=;
	b=Nu/5GsNN/qWNd8QxWGlclqopVeVi0RNAz/ZOx4F1Z62oAjF7FsGkbeTY4hfg1K9Fo/
	6Wcog5pVO+WZ6ftMJMNl3js07mMmnqeU0FIdYbj8rtrens6bTuKhNbTZiRlxpOanTBPv
	ZI8iCBGZ3KcPBOwMOr5HSL2bD+j52wVSauwE8xsGRj8KdYgnOthusZ4AjEa43/YvjalJ
	L30wR6bgFnPLt1HFORXVrLq4SW3xnmGMsphaKB0gEk5sI5ztLC9Ojkt04kLhc5+v8780
	Y3EtwGz7TrqNz97tiVFm1VWv6F4MP43fiPWHe53RomdS68i8gO66XQ4EdTcrqdrjw+Kf
	GgPQ==
X-Received: by 10.14.22.68 with SMTP id s44mr25061345ees.16.1385226770998;
	Sat, 23 Nov 2013 09:12:50 -0800 (PST)
Received: from mizar.localdomain
	(host251-255-dynamic.0-79-r.retail.telecomitalia.it. [79.0.255.251])
	by mx.google.com with ESMTPSA id b42sm86121083eem.9.2013.11.23.09.12.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Nov 2013 09:12:50 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Nov 2013 18:12:46 +0100
Message-Id: <1385226766-9849-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] Pull request 20131123
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Nov 2013 17:12:53 -0000

The following changes since commit 3ce1feb8ad6d7e274c437f91441bdf1b9cca46e3:

  linux-yocto-dev: collie: sync patches for 3.12 with linux-yocto (2013-11-20 23:34:48 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to f7d2dd6cd9144837996673cc396bc68114eb294a:

  linux-yocto-tiny-kexecboot: use mini defconfig and patches in SRC_URI (2013-11-23 17:08:32 +0100)

----------------------------------------------------------------
Andrea Adami (2):
      linux-yocto-handhelds.inc: split and remove, now we have more machines
      linux-yocto-tiny-kexecboot: use mini defconfig and patches in SRC_URI

 recipes-kernel/linux/linux-yocto-dev.bbappend      |   62 +-
 recipes-kernel/linux/linux-yocto-handhelds.inc     |   81 -
 .../akita/akita-tiny.scc                           |   11 -
 .../akita/akita.cfg                                |    4 -
 .../c7x0/c7x0-kexecboot.cfg                        | 1912 -------------------
 .../c7x0/c7x0-tiny.scc                             |   10 -
 .../collie/collie-kexecboot.cfg                    | 1800 ------------------
 .../collie/collie-tiny.scc                         |   29 -
 .../feature-top.scc                                |    1 -
 .../poodle/poodle-kexecboot.cfg                    | 1811 ------------------
 .../poodle/poodle-tiny.scc                         |   11 -
 .../spitz/spitz-kexecboot.cfg                      | 1917 --------------------
 .../spitz/spitz-tiny.scc                           |   13 -
 .../tosa/tosa-kexecboot.cfg                        | 1814 ------------------
 .../tosa/tosa-tiny.scc                             |   12 -
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |   79 +-
 recipes-kernel/linux/linux-yocto_3.10.bbappend     |   64 +-
 17 files changed, 202 insertions(+), 9429 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-handhelds.inc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita-tiny.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/akita/akita.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-kexecboot.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/c7x0/c7x0-tiny.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-kexecboot.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/collie/collie-tiny.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/feature-top.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-kexecboot.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/poodle/poodle-tiny.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-kexecboot.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/spitz/spitz-tiny.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-kexecboot.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/tosa/tosa-tiny.scc

