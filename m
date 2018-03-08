Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C533789F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 01:10:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w281AIpr025200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Mar 2018 17:10:20 -0800
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 7 Mar 2018 17:09:33 -0800
To: Tim Orling <ticotimo@gmail.com>
References: <1520385452-205564-1-git-send-email-hongxu.jia@windriver.com>
	<CANx9H-CNoBQUc2_GmrcO8y5wCTQN-9Dr-u7=Dxv7kP9ScTLP1w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <fa8d68e4-5ef4-5dbf-99d0-d3fb814d6503@windriver.com>
Date: Thu, 8 Mar 2018 09:10:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-CNoBQUc2_GmrcO8y5wCTQN-9Dr-u7=Dxv7kP9ScTLP1w@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-blivet: fix invoking dd timeout caused partition failed
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
X-List-Received-Date: Thu, 08 Mar 2018 01:10:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年03月07日 21:39, Tim Orling wrote:
> Can we make the default not be infinite timeout? You are solving a 
> corner case, special need with a default infinite timeout that may 
> have unforeseen side effects in the general case (like a system that 
> never responds). Just a thought. What does upstream think?

The python3-blivet is part of target installer anaconda, while you do the
installation by using qemu to simulate without kvm on your desktop,
it will have a low speed disk/cpu to triger the above issue.
(BTW if you use virtualbox to simulate, it works well)

I guess the upstream fedora almost not have the situation to work
(which runqemu is our yocto specific), so they do not care about it.

But I will try to talk with them, to see whether they accept our fixes 
or not.

See:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-anaconda/tree/README

//Hongxu

> On Tue, Mar 6, 2018 at 5:18 PM Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     This large timeout is needed when running on machines with
>     lots of disks, or with slow disks.
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      .../0014-invoking-dd-with-infinite-timeout.patch   | 31
>     ++++++++++++++++++++++
>      .../python-blivet/python3-blivet_2.2.0.bb
>     <http://python3-blivet_2.2.0.bb>         |  1 +
>      2 files changed, 32 insertions(+)
>      create mode 100644
>     meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
>
>     diff --git
>     a/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
>     b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
>     new file mode 100644
>     index 0000000..12a9e4f
>     --- /dev/null
>     +++
>     b/meta-python/recipes-extended/python-blivet/python3-blivet/0014-invoking-dd-with-infinite-timeout.patch
>     @@ -0,0 +1,31 @@
>     +From 92fe7dfd01131c93a9b2013cabf77d5f46900fab Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Tue, 6 Mar 2018 17:28:56 +0800
>     +Subject: [PATCH] invoking dd with infinite timeout
>     +
>     +This large timeout is needed when running on machines with
>     +lots of disks, or with slow disks.
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + blivet/devices/partition.py | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/blivet/devices/partition.py
>     b/blivet/devices/partition.py
>     +index a7372fb..8947472 100644
>     +--- a/blivet/devices/partition.py
>     ++++ b/blivet/devices/partition.py
>     +@@ -594,7 +594,7 @@ class PartitionDevice(StorageDevice):
>     +         cmd = ["dd", "if=/dev/zero", "of=%s" % device, "bs=%d" % bs,
>     +                "seek=%d" % start, "count=%d" % count]
>     +         try:
>     +-            util.run_program(cmd)
>     ++            util.run_program(cmd, timeout=-1)
>     +         except OSError as e:
>     +             log.error(str(e))
>     +         finally:
>     +--
>     +1.8.3.1
>     +
>     diff --git
>     a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>     <http://python3-blivet_2.2.0.bb>
>     b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>     <http://python3-blivet_2.2.0.bb>
>     index cacca67..46dc32d 100644
>     ---
>     a/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>     <http://python3-blivet_2.2.0.bb>
>     +++
>     b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
>     <http://python3-blivet_2.2.0.bb>
>     @@ -23,6 +23,7 @@ SRC_URI =
>     "git://github.com/rhinstaller/blivet;branch=2.2-devel
>     <http://github.com/rhinstaller/blivet;branch=2.2-devel> \
>     file://0011-invoking-fsck-with-infinite-timeout.patch \
>     file://0012-invoking-mkfs-with-infinite-timeout.patch \
>     file://0013-Revert-Adapt-to-logging-module-name-change.patch \
>     +  file://0014-invoking-dd-with-infinite-timeout.patch \
>      "
>
>      inherit distro_features_check
>     --
>     1.8.3.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


