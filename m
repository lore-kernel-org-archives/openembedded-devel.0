Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A54E378558
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 01:35:34 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d4-v6so12111221qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2018 18:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LckgjuUm1gf19/NaDmE9dOKAQUreM7l1i5meDs7Eys8=;
	b=WvdKMzzI3c51LNF277N58TH2UM9f7dYARMkPq9taM6yRJqgy7lULlit5LFqiLGWV19
	o+98PZpvXeVqdXmyFiSSYCM3v/xjiMzah+IHbyEvJOVfdlbkHzREDtengKHS5Xhh7Wlj
	rgQmKJolL6rLbuV+J4dwRCnYuot0mL2phjPyzPuLPRRub/qr066Rfh7emXLrp6bROUw/
	XZxKSOhTOnT6mv/016zabP4binbght9SV+KvfjVCsDqRcyOO083QL2l4x88m+es2o90T
	C4KwBN0sZPVCcaPfnxD+kYAZjRl7OPxJTAdvndjJuq4ilL1RmqxHTCYDOe0OYs2z2AS4
	V8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LckgjuUm1gf19/NaDmE9dOKAQUreM7l1i5meDs7Eys8=;
	b=KGkGNcO6W/blTLHuZ49Qk6Bj7mdkz9MPhyGpFP3MFYc5vtPyYOKDJhejwfrz4x/0Eb
	YoTzGZ2v4N9xvmS+Zekm3fg1ohRkfMakOmH/u0vpy5nL6EmtmG4SlUzUR5d0qTezGHQz
	oLTnxEP3A9Li941WjHKSQdmgi5D7F3FHJhZUZU5gojd9YPIGg8JQxuilztn3Ri7fcZ3F
	xiehzO3e6PRZIdjQLRHAUxZchUGVTEyY1VEcAlvlRuwEZcL0PooUbiw2+UMT/C0N/4kX
	K1fzf2hhwVyRF1eHwj//U0gaWqBCCVHvxdJoIpI3cYVDbxy7fL4UqMwHi5yCkq9wlrCw
	+tIQ==
X-Gm-Message-State: AOUpUlECLHy1ur7/NB6vdgM51z339XCsT/EgGBbwwHqDpYRGdN4117C2
	ppvL9gyYBKfXsfjLk29W9/Z1wvJf1gcEY1WdUtx7PWjq
X-Google-Smtp-Source: AAOMgpe55HjVAS28EgCAm73SJ8LsvcZx9ibcI5DnzKeGb1wMgZ30MNCIg+J99KFWHdMdaVXx2S9MXAGN9M1hlTo9D0g=
X-Received: by 2002:a0c:e0c8:: with SMTP id
	x8-v6mr11367353qvk.74.1533519335329; 
	Sun, 05 Aug 2018 18:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180801083239.11360-1-hongzhi.song@windriver.com>
	<69958f41-e2d9-8189-aca9-3c8128a4bee1@windriver.com>
In-Reply-To: <69958f41-e2d9-8189-aca9-3c8128a4bee1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2018 18:35:09 -0700
Message-ID: <CAMKF1spCit8YhDJuVN07BoP=m5hS+gg=3HFgCsN48HJJXY7QNg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4 0/1] Add a recipe about kernel selftest
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
X-List-Received-Date: Mon, 06 Aug 2018 01:35:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 5, 2018 at 6:29 PM Hongzhi, Song <hongzhi.song@windriver.com> w=
rote:
>
> ping

its still failing for


qemuarm
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/838/console

qemuarm64

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm64/111/console

qemux86

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/839/console

qemux86-64

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/792/console

you can look at jenkins jobs or patchwork for latest status of the patches.
>
> --Hongzhi
>
>
> On 2018=E5=B9=B408=E6=9C=8801=E6=97=A5 16:32, Hongzhi.Song wrote:
> > v4:
> >     add the optimization level of compiler, when define _FORTIFY_SOURCE
> >
> > v3:
> >      add support for musl when build bpf and modify the recipe slightly
> >
> > Hongzhi.Song (1):
> >    kernel-selftest: Add a recipe on kernel selftest
> >
> >   .../kernel-selftest/kernel-selftest.bb             | 104 ++++++
> >   ...bpf-test_progs.c-add-support-for-musllibc.patch |  25 ++
> >   ...-swap.h-micro-define-to-support-musl-libc.patch |  26 ++
> >   .../kernel-selftest/kernel-selftest/COPYING        | 356 ++++++++++++=
+++++++++
> >   .../kernel-selftest/userfaultfd.patch              | 322 ++++++++++++=
+++++++
> >   5 files changed, 833 insertions(+)
> >   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-self=
test.bb
> >   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-self=
test/0001-bpf-test_progs.c-add-support-for-musllibc.patch
> >   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-self=
test/0001-swap.h-micro-define-to-support-musl-libc.patch
> >   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-self=
test/COPYING
> >   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-self=
test/userfaultfd.patch
> >
>

