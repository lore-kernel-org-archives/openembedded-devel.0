Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA1C078558
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 01:29:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w761TdUt007253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2018 18:29:39 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 18:29:38 -0700
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
References: <20180801083239.11360-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <69958f41-e2d9-8189-aca9-3c8128a4bee1@windriver.com>
Date: Mon, 6 Aug 2018 09:32:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180801083239.11360-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
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
X-List-Received-Date: Mon, 06 Aug 2018 01:29:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

--Hongzhi


On 2018年08月01日 16:32, Hongzhi.Song wrote:
> v4:
>     add the optimization level of compiler, when define _FORTIFY_SOURCE
>
> v3:
>      add support for musl when build bpf and modify the recipe slightly
>
> Hongzhi.Song (1):
>    kernel-selftest: Add a recipe on kernel selftest
>
>   .../kernel-selftest/kernel-selftest.bb             | 104 ++++++
>   ...bpf-test_progs.c-add-support-for-musllibc.patch |  25 ++
>   ...-swap.h-micro-define-to-support-musl-libc.patch |  26 ++
>   .../kernel-selftest/kernel-selftest/COPYING        | 356 +++++++++++++++++++++
>   .../kernel-selftest/userfaultfd.patch              | 322 +++++++++++++++++++
>   5 files changed, 833 insertions(+)
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
>   create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
>


