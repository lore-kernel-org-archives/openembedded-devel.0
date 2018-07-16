Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97436752C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 10:02:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6GA2mbC005061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 03:02:48 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 03:02:48 -0700
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <9f7cbbdb-06e0-203b-dd2f-6d781f4e9967@windriver.com>
Date: Mon, 16 Jul 2018 18:04:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713140616.15664-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta-oe][PATCH v2 0/1] Add a recipe on kernel selftest
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
X-List-Received-Date: Mon, 16 Jul 2018 10:02:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2018年07月13日 22:06, Hongzhi.Song wrote:
> 0001-kernel-selftest-Add-a-recipe-on-kernel-selftest.patch:
>      1. This patch add support for musl libc.
>      2. I don't reproduce the error about Makefile with your auto.conf.
Hi all,

I really can not reproduce the error with either my own local.conf or 
Khem's.
The errors I encountered is different with Khem using Khem's conf.

>      3. Boot failed using your auto.conf with error:
>         ---
>         [  576.229543] mount[2571]: segfault at 0 ip   (null) sp bfb52e0c error
>                        4 in mount.util-linux[8048000+9000]
>         You are in emergency mode. After logging in, type "journalctl -xb" to view
>         system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
>         to boot into default mode.
>         /sbin/sulogin terminated by signal SEGV.
>         ---
>         runqemu qemux86 nographic slirp qemuparams="-m 2048"
>      4. With this patch set, I have fixed all musl related issues in my build.
>         It builds and works well. But I still have not met the error in yours.
>
>         In my case, I just start build from latest poky without any change
>         other than a few necessary kernel config fragments. I'd like to
>         reproduce your error but I can't. Could you please provide more info
>         about your build config?
>
> 0001-x86-remove-qemu-usermode-from-MACHINE_FEATURES_BACKF.patch:
>      This patch is to fix gobject-introspection do_compile.
>
>      With m32, qemu-usermode will be back filled and gobject-introspection
>      tends to use qemu-i386. Is this the way to fix? If you have no objection
>      I will commit to oe-core next.

Gobject-introspection is disable using default conf when setup a new 
poky project.
So gobject-introspection is enabled by uncertain configuration add by Khem.
And then, this error maybe has no relation with my recipe.

--Hongzhi

>
> Hongzhi.Song (1):
>    kernel-selftest: Add a recipe on kernel selftest
>
>   .../kernel-selftest/kernel-selftest.bb             | 104 ++++++
>   .../kernel-selftest/kernel-selftest/COPYING        | 356 +++++++++++++++++++++
>   .../kernel-selftest/userfaultfd.patch              | 322 +++++++++++++++++++
>   3 files changed, 782 insertions(+)
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
>


