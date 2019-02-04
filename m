Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 58C84600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 17:36:51 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id d15so456968qkj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 09:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0IsSnbSk3I3la/zETbXr1xREPjQwq3OH10OYskibHPQ=;
	b=dQS7XVi7ZxHqmndp1h4WLNQYizSAXKU4Qu3iLuXvFS3lN52Zlb7NVnXaaHgkNkSVgR
	GDZLJA5WCvWQwm/crjEc7jOPCMQrYbiByHoYc+m/r3ozv6Yx4VdWTUjWMhNTjZigmFK3
	lHjY272NF34Yo/8B6yLBwW06vZA1ZIBJxL0N4PepseVtb7z8HIzU4V6272OOnJS436qe
	yfQWfqVZz/rWpq4b7QF378B+XeKhogpvM7ItCiBK+gMesppBrkN79Z7Rb3SMP2vCM392
	bB3d50FYdRCnQHCj1Hwwse7AB7CGu8ND6MgkducGk1Fy+wZBuEdrwap8BTtAb/FPp9rq
	3AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0IsSnbSk3I3la/zETbXr1xREPjQwq3OH10OYskibHPQ=;
	b=qbnnT8NQAqr/6snnIF/ktiTV3vFRJBEy4c1vHvt4vLyEZayCsSf9N8jR/bNH5SCzFg
	7oJAxCuxhDIGoCfR7Wl80hyPUofgukvkfTYRMZcYA/BbEgwU2BInOBn/3q5wepXMQXzC
	AlGUWpdZzKDLvihJtfAIaR+1YmzMskF5/8Hwyx3smh5u4B8QEiMri5uhAaZR4TgLpsQc
	AZ7y4ElM+e/HdFAqE0BV6r2hBK858dotaWvwRMw5/JI4MHdqeNlFOq3CU6GkN24Sa+r8
	uI/JUswxXPN1nO45oEgew3XQ3D7JzcqXTgkI8TKGlgV+ybmAspf1xoCN7u6aGI/HMZSt
	SqWA==
X-Gm-Message-State: AHQUAuaSXyYZcsBUVZX+CFSLPc/Fm6z8J48k+t7mCndivKc7pVkG/2vf
	l5qS2zIat1UTO4y1W8OQJkMC9aqmWUIKr3CySI0=
X-Google-Smtp-Source: AHgI3IYMhMwqdMqQ5q7uTKFfiMe1Kw6x16V/rVo1A54iQMWphNv4ZF67mzPn3k0oh+eW/+tlJatyJD+jDai+0mJMmwc=
X-Received: by 2002:ae9:ef88:: with SMTP id d130mr441932qkg.2.1549301812049;
	Mon, 04 Feb 2019 09:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20190204150204.18007-2-bunk@stusta.de>
	<e8244752-a10d-1ae1-5b9b-2854532e4a24@gmail.com>
	<20190204161028.GA17997@localhost>
In-Reply-To: <20190204161028.GA17997@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Feb 2019 09:36:41 -0800
Message-ID: <CAMKF1sr=_6Vin43mFPGbsCH1x3180iQwbVHa=wtH00_w2dp=8A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][thud][PATCH] wireless-regdb: update 2018.05.31 -> 2018.10.24
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
X-List-Received-Date: Mon, 04 Feb 2019 17:36:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 4, 2019 at 8:10 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Feb 04, 2019 at 08:00:18AM -0800, akuster808 wrote:
> >
> > This is a big jump. Is this a bug fix only update ?
>
> This is data describing what your wireless device can legally do
> in your country.


Armin this should be safe to bring in

>
>
> > - armin
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

