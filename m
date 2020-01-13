Return-Path: <h4nn35.work@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id DD3D37FCBA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 16:19:28 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id k14so9459632otn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=2kzIaxCDMubFFeoTy0bPoeE8SGK3WEBDzLDz6e8yiSM=;
	b=Cd+aY6+zBLHDwkcHztW1aMv/y3QMELkk2+08Hx7/AloZ7+8bxnV9KBTC8Mj9nFfWLG
	GyK3DAFAwFG7Rpe51qdGXi1x614Dxeh16uDZEP80MAoXrbiF1gKcAgnuLMwhtlIY6+uo
	F5Xy5Q8wjwzkEM4fA7k7iI71x39TVLU489tihR534Buk9BG85zBB9fOAW8jSvDzqwAln
	d3PhlQDkGh4qfD+CQK7BDzeo7dAtuyGI5mM3152kA+M7S4tUv6QvKnlZ9Z48chwlPEU4
	EPhc9CpoqAFQBoJnyUm7mNDXub1xTts7wZxlaLP1DRfLstSrgAXpHp8POHxF8sbL+FVS
	8ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2kzIaxCDMubFFeoTy0bPoeE8SGK3WEBDzLDz6e8yiSM=;
	b=Uo+vc05c2IgdxO9zKRiATMhOm4f63EMu8J4XT0WAcw3WCBwKJOSMpuONSntk/I+q7J
	Z7zRU48IVRle+0g0/25KIy2GCMWBWGs2vJn/YEyBP8zlOfmWzuhCKja/v+j+tFeRo3KX
	w5ECCvZi6/VyQ5eFMfAxTAvJqlJ+FeR3aRSgLGeGbm7jA2QjFRLEUE0pVVvm609PpRas
	WqZR8OBqLjR41eD13HdBtiX1QgdjFXHDJOl1oUA/4bSMQRv0ANAxxQ2HYhuIswnFnEOK
	9Y/sDwxL/5I1NDPKfiB93wOQzZrr9OCxH3Lb70pT/e6Ya5ZihXvhHMwASOwjM4h08gdj
	aSGg==
X-Gm-Message-State: APjAAAW5ZGUTe81CnkROYsjB0AWs1u1d8j2ha5jJi5BTFJosTveCL4F2
	2wjDgS0L0ohT29KkoeCXtQXO/mT07S5nshtaEMDQckQ=
X-Google-Smtp-Source: APXvYqzgQjnxeEhYX1eFry2vWb7e8CnqS9REev3Voq0kRsfX+LXCbS+OTJSkZ3yTl3A05sj/5x7xHX53lXUly8Tw3fU=
X-Received: by 2002:a05:6830:4d9:: with SMTP id
	s25mr13928020otd.171.1578932369833; 
	Mon, 13 Jan 2020 08:19:29 -0800 (PST)
MIME-Version: 1.0
References: <8a4e5e98356b4c4fa68ad47e69bbb7e2@G08CNEXMBPEKD06.g08.fujitsu.local>
In-Reply-To: <8a4e5e98356b4c4fa68ad47e69bbb7e2@G08CNEXMBPEKD06.g08.fujitsu.local>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Mon, 13 Jan 2020 17:19:18 +0100
Message-ID: <CAHvQdo0dGbG16A_d0wj-G-jDHnN3OujRm5_27M9ZGEC-BWY=oA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Subject: Re: [meta-oe] [zeus] samba and libldb problem
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
X-List-Received-Date: Mon, 13 Jan 2020 16:19:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 23, 2019 at 7:32 AM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi All
>
> I found a build error in zeus branch when do_configure  of samba.
>
> Log is as follows:
> | Checking for python version >= 2.4.2                                              : 3.7.5
> | python headers                                                                    : using cache
> | Checking for system pyldb-util.cpython-37m-x86_64-linux-gnu (>=1.5.6 <=1.5.999)   : not found
> | ERROR: System library pyldb-util.cpython-37m-x86_64-linux-gnu of version 1.5.6 not found, and bundling disabled
> | WARNING: exit code 1 from a shell command.
> |
>
> It was caused by the depend of samba libldb with lower version 1.5.5 that at this moment 1.5.6+ is needed.
>
> $ ls meta-networking/recipes-support/libldb
> libldb  libldb_1.5.5.bb
>
I see the same error when building samba for zeus.
Could we backport the upgrade for libldb to 1.5.6?
http://lists.openembedded.org/pipermail/openembedded-devel/2019-November/202919.html
Thx, Hannes

>   --
> Best Regards
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

