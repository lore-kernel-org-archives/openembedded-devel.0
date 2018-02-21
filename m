Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFFC7878B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:20:32 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id i6so421326plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 22:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KAsab7An/xNTTJbja+WNb9QiZOWnqkLMuwQqCNZIDPU=;
	b=FUXMfESYyRRHo5yiCmirQv59sogAjzikIIHBQwcvY1VmDFmbYRU/WnwydGO2+Dv5zG
	X55tqku/19mfPCKlOeD2rHw9S6IbJfc3wetkTKW0MeYPJymvBwrpT4jYc9qnObASqwhd
	02ULB8pmGZSviCv7JFOnqsCzk1V/4jwciU9gtmtIfD4ryhTDhM84BLvSNCgbM8Vk2XVa
	P20XsRXVg8MlUuVN9Zn5GwBKgvdCdBxSGzd4HQCJn9wREA45ode29SCQST1V7gLWF880
	jx+QFrI3srzIGMchcShKOvdFVZG0G5jl522IewUxpxnnOIYGhD64vkKqKMNXnF0NjLM1
	mlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KAsab7An/xNTTJbja+WNb9QiZOWnqkLMuwQqCNZIDPU=;
	b=T4RFEtVQmdIobZX0wUnr/7j3gKnZDhJQL1zK/QtHWop7vGO5LOZ76X0yPtW/yq6V85
	NK9A/kg2/FpdQTm6Vtz3jXoge2GGAM/5zqFQs5Wmroy3pXo1SbVQXs5UFvFGEFaYFpXC
	lePtaC3HJGBF4KsPRq/zK8+fX3ADkGlvPn6sh+ewIECnvnLAVZM//PSisJZkdEEZCHHX
	AL4B9Xlr5Et7daAqE5Gf3jmimsv+WuaRLPVieG1a/SFkBcSbJhNxxVPbNfMYt9ksRy1Q
	a+Qd20ffMMsLoaBlRz4Zj768x3ZJml0m4jAyRrUx8TbxbvtY+o+yWyqyEufei281SCiF
	PNDw==
X-Gm-Message-State: APf1xPBswWd6sOCzr7uUaO0fFRD8ZnuKoT//DvqWGdul6whuKguXEHM9
	Om2uv7dLOe23YYWF/6TKs0pVaY+TN3N97Zirm7vReQ==
X-Google-Smtp-Source: AH8x224N7LXg86NLczLqmOqoA07TF5cytATOULQanC596I1seSv5ymE8VQJKktlhHgXKIXJhBQhT5zhvdApGRAa3ZVA=
X-Received: by 2002:a17:902:6b48:: with SMTP id
	g8-v6mr2113915plt.151.1519194033956; 
	Tue, 20 Feb 2018 22:20:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.176.172 with HTTP; Tue, 20 Feb 2018 22:20:03 -0800 (PST)
In-Reply-To: <CAMKF1spcrZQ34imyqaXtcHRmphyU1Kfo5nNdo6qaaeOVSx51eg@mail.gmail.com>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
	<20180216220142.GS2786@denix.org>
	<CAMKF1spkGJpYTAmQ9gh+af51ya3qkZja8XMmVP5u=Q-ycc5qbw@mail.gmail.com>
	<20180216230846.GT2786@denix.org>
	<CAMKF1spcrZQ34imyqaXtcHRmphyU1Kfo5nNdo6qaaeOVSx51eg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2018 22:20:03 -0800
Message-ID: <CAMKF1soMJDnGmK08J+TVEw4dcVZqXfxqM=aAbO6ufg1DS8sjQg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Wed, 21 Feb 2018 06:20:33 -0000
Content-Type: text/plain; charset="UTF-8"

i can still see it with 5.10.1

                 from
/mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/git/src/gui/kernel/qgenericpluginfactory.cpp:40:
/mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15:
fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
               ^~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
make[2]: Leaving directory
'/mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/build/src/gui'

On Fri, Feb 16, 2018 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Feb 16, 2018 at 3:08 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Fri, Feb 16, 2018 at 10:59:39PM +0000, Khem Raj wrote:
>>> I am using arch Linux for host distro and security flags enabled May be
>>> that is something
>>
>> Could be... I'm on Ubuntu 16.04.
>
> maybe you can try to enable security flags and see if you see it

