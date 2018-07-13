Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3617574586
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 14:06:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6DE6GMT005220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Jul 2018 07:06:17 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 13 Jul 2018 07:06:16 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jul 2018 07:06:14 -0700
Message-ID: <20180713140616.15664-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 0/1] Add a recipe on kernel selftest
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
X-List-Received-Date: Fri, 13 Jul 2018 14:06:17 -0000
Content-Type: text/plain

0001-kernel-selftest-Add-a-recipe-on-kernel-selftest.patch:
    1. This patch add support for musl libc.
    2. I don't reproduce the error about Makefile with your auto.conf.
    3. Boot failed using your auto.conf with error:
       ---
       [  576.229543] mount[2571]: segfault at 0 ip   (null) sp bfb52e0c error 
                      4 in mount.util-linux[8048000+9000]
       You are in emergency mode. After logging in, type "journalctl -xb" to view
       system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
       to boot into default mode.
       /sbin/sulogin terminated by signal SEGV.
       ---
       runqemu qemux86 nographic slirp qemuparams="-m 2048"
    4. With this patch set, I have fixed all musl related issues in my build.
       It builds and works well. But I still have not met the error in yours.

       In my case, I just start build from latest poky without any change
       other than a few necessary kernel config fragments. I'd like to
       reproduce your error but I can't. Could you please provide more info
       about your build config?

0001-x86-remove-qemu-usermode-from-MACHINE_FEATURES_BACKF.patch:
    This patch is to fix gobject-introspection do_compile.

    With m32, qemu-usermode will be back filled and gobject-introspection 
    tends to use qemu-i386. Is this the way to fix? If you have no objection 
    I will commit to oe-core next.

Hongzhi.Song (1):
  kernel-selftest: Add a recipe on kernel selftest

 .../kernel-selftest/kernel-selftest.bb             | 104 ++++++
 .../kernel-selftest/kernel-selftest/COPYING        | 356 +++++++++++++++++++++
 .../kernel-selftest/userfaultfd.patch              | 322 +++++++++++++++++++
 3 files changed, 782 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch

-- 
2.11.0


