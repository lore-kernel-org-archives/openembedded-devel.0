Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 41D0F771B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:48:55 +0000 (UTC)
Received: by igvg19 with SMTP id g19so463327igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kxVFMZODV9mLBK2Vd1rHxNcEFSFGKNiV0T7fe9/TbYs=;
	b=xGOCKJxabzCVlmJi5QQAVJq4pZptxXREs3WhpxmJELwS0bh04+C2Nb2RVr67vUsAW0
	VvtoHwOGgcSRNjaF6r5fv4Ncc79uhESmNe+mAjsftr8PXNdcYNZRfaX2bQyRCp5i4CAN
	4AIyKXIze2uKRwVYvAU7Rqc/ZHqvMyhzVq6WEkWEk+NAhPWs1YitrpT9noyNKO9NUAUz
	udxGDn0B3l/rGfmmTlf4t1fbJpCnLBq8X2gOVIHXZqxqNQ3mT6DzrqoYmEc812QyOYJl
	Ho7DoCeqyqNd/2NyJ9ROtRyBbgFkaakK2Z0Gte/RRpxBf1VTRggLY2d/0lNUOEsBL2IA
	nT7Q==
X-Received: by 10.50.142.8 with SMTP id rs8mr11953714igb.77.1447271336162;
	Wed, 11 Nov 2015 11:48:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 11:48:26 -0800 (PST)
In-Reply-To: <662EEA96-421F-46A1-97F1-F07CE05D08FA@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
	<7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
	<B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
	<CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
	<75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
	<CAMKF1soRPp6yxDK+iF_SB0EO=Dvzx9oKDiRgRJqw0WXv2BbbAA@mail.gmail.com>
	<662EEA96-421F-46A1-97F1-F07CE05D08FA@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 11:48:26 -0800
Message-ID: <CAMKF1sruZfx4tO+_cwmzrM0XQj39L3mCyXK_WfSOdx8yfWnFvA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Wed, 11 Nov 2015 19:48:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 11:22 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 20:12 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>> On Wed, Nov 11, 2015 at 10:54 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>> In this special case I intend to say no, because:
>>>
>>>  The lsb support is limited to startup only - and the distro features
>>>  controlling startup are "sysvinit" and "systemd", respectively.
>>>
>>> Mixing systemd with linuxstdbase in overrides is possible but installing
>>> two init-script not knowing each other is likely asking for trouble. Maybe
>>> I'm wrong with that :)
>>
>> and only sysvinit is valid for LSB, if you use systemd then lsb is
>> violated anyway
>> you can encode that logic for completion if you want
>
> Currently I'd like not to complicate things before jethro :)
>
> When you have an example somewhere how it can be sanely done, and it's easily
> adopted - I'm happy to send an update for that. Otherwise I intend to wait
> after release and take the patch as it is to fix remaining issues before
> release is done.

jethro announcement went out yesterday so ..

https://lists.yoctoproject.org/pipermail/yocto/2015-November/027342.html

>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

