Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 197FF77026
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:13:09 +0000 (UTC)
Received: by iouu10 with SMTP id u10so34900382iou.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=G5oB0up+hWwFrjFzWU/pYeZ5LSnbU79n59LzHCSytzE=;
	b=WdO2zutF3nQfHbAKtZ8nEcm6lNn6H6fBNOS9cqZHYOL+wFyJJQglBM0IerUjYukv7f
	61O09dctgsRyi5OT1A8Y4LPbkRjgbNzfiHWPWonLaToAqWMTiTFhmpAa4Ni/7IOppfwb
	kyI1YoofgSp9gIPD5sOmfo+YOP/STSeF3eZ/aPPBAilQnw71lE2GqGN5pGFxjVqb0p2F
	OI4Bxyl3VqxpERmEAHVJ9jVK58lJ3IJw2Coe6arDCzgDkLYjj9GrLrww/Cu5OiXxEbQ4
	sTrs28VT9Xg+SuZpH7SIPLMsU7DYB7ZndyFpU27WS8BYgQIg9hESVPvRQyQ6DiqXe0+3
	3pPg==
X-Received: by 10.107.9.152 with SMTP id 24mr10411554ioj.112.1447269189786;
	Wed, 11 Nov 2015 11:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 11:12:40 -0800 (PST)
In-Reply-To: <75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
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
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 11:12:40 -0800
Message-ID: <CAMKF1soRPp6yxDK+iF_SB0EO=Dvzx9oKDiRgRJqw0WXv2BbbAA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 19:13:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 10:54 AM, Jens Rehsack <rehsack@gmail.com> wrote:
> In this special case I intend to say no, because:
>
>   The lsb support is limited to startup only - and the distro features
>   controlling startup are "sysvinit" and "systemd", respectively.
>
> Mixing systemd with linuxstdbase in overrides is possible but installing
> two init-script not knowing each other is likely asking for trouble. Maybe
> I'm wrong with that :)

and only sysvinit is valid for LSB, if you use systemd then lsb is
violated anyway
you can encode that logic for completion if you want

