Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id E54C77C132
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 10:05:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e3so35588560ioc.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fmigIhvaGys0hrUIT98tr/xtxj4ZnOlEvoReSTHQX7M=;
	b=qnqBap7TEAryLxkM61u9nkp7H+pSkmDl9WL0B1ykbe/qxiDX2VQ4CuYm7cNI1Q/yeN
	wll6OmYAd3Wxwpi9H2mOYunhXq94N5e67rFy1ntWf5xofP78Zf7zpDZ6u5k0CJsErDBu
	VmalLCUypxC1tnPxxKZqmxXqE3L61p8HRNK9Xz/RRBGjZEowFLACNMSIH2Kq9cLC7IKc
	0CA/tsniVxtKdobzi4fxufCIUFMnl9M352WJ42hQ2kXfxi/t9wqbaAlZVSGlxCDF4HjO
	U2u+c/YO9Gum0J95LxF4XVmSRWdQ3++ERaTDZdA0wDpjG30DV1q9Cv+n+aTMLgBmO23o
	wQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fmigIhvaGys0hrUIT98tr/xtxj4ZnOlEvoReSTHQX7M=;
	b=gYo5ppWFHXbg8l0pNVw3tL/lTl68TgB5mBHX7enA8ZX/gpmVfWfu6Z+OHKV5wopTwT
	lwp+/pfxHUHxElLSR/lbWJsO/OTA6Ha0Nb/qPQKJ81NDqZsF/3mH8kSt1wUKaFKyIilc
	m1bDSPGXpKi3S0LL31Ml1IQrrFQuqJKOzyD/bO+JSEbe5UQy1rv9N19M0dcyfjd5w4Lt
	wJ/rkV5i2Tx/rCmXkru2Na6ojYCSRjGSdyGZ48Oo0uh2DdYlepsF0uDpRSJNpP3nbh+L
	v6YOc4a6Px0diGNn2JiE+dyb4C2B3GLeHC4FoD6Jqq6f+AQyk0qlNvnfatLB4vjyv3zW
	0c2g==
X-Gm-Message-State: APjAAAXBBV3aJFSonW4YIrZciD2HQsBFouDAjsh9TsDTyWzKFFWbxE0b
	BkJ0NIx0HJ6ix7hxDq71krrUB5nGeAjSoz/X/SuQuahV
X-Google-Smtp-Source: APXvYqxE4apz0vPGIEB/k1u3t2RboKvQUfW9DrDOHoXCtFaYytqAy2oihr3jOyKQ+H+FDJ91s3qHwo8SGo96o2IuznQ=
X-Received: by 2002:a02:230a:: with SMTP id u10mr7473718jau.117.1562061925816; 
	Tue, 02 Jul 2019 03:05:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP;
	Tue, 2 Jul 2019 03:05:25 -0700 (PDT)
In-Reply-To: <CAA=hcWTMO58OJmo2hqfMWqHKxB53XYzveKb2mULztW7BLiJYjA@mail.gmail.com>
References: <CAA=hcWS+-bC8S+90VqbRMW2wpTz2Rfv7umxKSHovQXWD2K6imA@mail.gmail.com>
	<CAA=hcWS-tgsh2Yyx6oZOjkiSKS0WPh9Z6nrhsiCzWScwWpuGOQ@mail.gmail.com>
	<CAA=hcWTMO58OJmo2hqfMWqHKxB53XYzveKb2mULztW7BLiJYjA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 2 Jul 2019 20:05:25 +1000
Message-ID: <CAA=hcWSRpk950q2Yj_sX+z2L255OeWwrH-9ZH_-JY6vifFSaPw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Tue, 02 Jul 2019 10:05:25 -0000
Content-Type: text/plain; charset="UTF-8"

Fixed, thank you

On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
> ERROR: Unable to start bitbake server (None)
> --- Starting bitbake server pid 2673 at 2019-07-02 11:54:24.011086 ---
> ERROR: local.conf:34: unparsed line: 'UBOOT_CONFIG=nand'
>
>
> On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
>> Tried to add  UBOOT_CONFIG=nand to local.conf and from command line,
>> bitbake does not like it????
>>
>> On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
>>> Hi,
>>>
>>> I am running BitBake Build Tool Core version 1.40.0, originally I
>>> built an image on imx6ullevk booting from SD card, I am building a new
>>> image for a customized i.MX6ULL board booting from NAND. The following
>>> link commented by Otavio Salvador for a patch to allow user to use
>>> UBOOT_CONFIG=nand either in local.conf or command line. Given the
>>> patch was many years old, I think that the current version is able to
>>> support UBOOT_CONFIG=nand either in local.conf or command line, there
>>> is no need to run the patch, is that correct?
>>>
>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082284.html
>>>
>>> Thank you.
>>>
>>> Kind regards,
>>>
>>> - JH
>>>
>>
>

