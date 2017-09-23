Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBAF7839E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:15:53 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id g69so1345408vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z6la+FcZdbnRLTgWEGah4Rrf8RmJTjvLiNnHoAwFvig=;
	b=ixX4720rLSXZHH0dQWHu+eL3WkUm5Vr8FhW/0kL2XVCUvJA8y55Jl5AJVG4EmcikKh
	ehKBwJLWhlAZ5S/nigUQpddnWxj8GG07eE8S4ITwF+ZuLEyocAvplroD+A70l8rm5+Vm
	g0KbO5+fo1j8aGn1SvlSG84q3dV0NPB74HLjGL6Ph6MzuYaeswa5ZU+hXanDkNZ2ovSg
	jw8ECN4E5X0m7ZZNnqTrp3rqW8m22ypbLh360alNnmh8BHn/ydTUgJP2+wo5ZC/Fsn1w
	7att3mT08Urtw2vh9GwK+qRV8IIUoCZqKa7LAM35fqcB1hI+wObPKx06+rTuR/KvyCq2
	Kspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z6la+FcZdbnRLTgWEGah4Rrf8RmJTjvLiNnHoAwFvig=;
	b=EvaEkC7Uorp/60hgfP3P5I9WeIcjiRNeXBZMGD2cGY0jldRlB4DzJmfsy1kO/LDmuN
	tMEj+GdJHY6BVg9IGT5ypaSmRV8I2S/3zmVl1TMgx5gHTMaSU7G1Rg94bdvPVmj1B6zB
	Zs8BxSBWVmGwykSvk0eaT6/Y/LBM1sK4hBBD5foPhC27gNf5L/yP4fWMMsZ8mJXonHsD
	Q9fmcc2zinaR21QssJ5Mmd1mSNPlx6FuZX/esEtpbYxm+StRS8nrfD4s/s8ZU14xLwAw
	9n+OdGV0+SUx6k/Zfi2UomSbIFUVKBqa7InZJcnN8Ukp2mZRZJj+MLnrr7fM1NXIjXkr
	K7PA==
X-Gm-Message-State: AHPjjUjP4ZjAacZqyeUHM6adZvIln+KEtjFIShoPEBBznHuL3qgv98Q3
	sGWF9suCrt0kgDf0KNEqdRF1viAxZKXwZBVJiMg=
X-Google-Smtp-Source: AOwi7QAF6z7YpWiUMsD8DCdvBotVJI09o+6oQ4ZHFbave8m1onYjXJXqbxgB/B58mnR6nmQVMB9Ktaw5Y29k2YzJe/8=
X-Received: by 10.31.96.16 with SMTP id u16mr773337vkb.176.1506125754613; Fri,
	22 Sep 2017 17:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.70 with HTTP; Fri, 22 Sep 2017 17:15:54 -0700 (PDT)
In-Reply-To: <CAMKF1srBOJ9_E4sDx5iH8-r9b0NayX0-Wh-d4yWi9Ahjps2MNQ@mail.gmail.com>
References: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
	<CAMKF1srBOJ9_E4sDx5iH8-r9b0NayX0-Wh-d4yWi9Ahjps2MNQ@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Sat, 23 Sep 2017 09:15:54 +0900
Message-ID: <CACrLJgB3TDPRuehnJ8xg8nqF_XjEVQyuVjL=NdQAWoWTwKxrgA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: How to use two toolchains
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
X-List-Received-Date: Sat, 23 Sep 2017 00:15:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem, Randy

Thanks for your comment and I'll try using multilib.

I found another option in
https://www.openembedded.org/wiki/Adding_a_secondary_toolchain

Thanks
Changhyeok

2017-09-23 0:55 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

> On Fri, Sep 22, 2017 at 7:22 AM, Changhyeok Bae
> <changhyeok.bae@gmail.com> wrote:
> > Hi
> >
> > I would like to use 64 bit for kernel and 32 bit for userspace(rootfs).
> > Toolchain is created by OE (Not prebuilt toolchain)
> > Could you recommend good way to use different toolchains to achieve my
> goal?
>
> I think you can look into multilib where, 64bit is default but then you
> constuct
> an image where rootfs is virtually just 32bit packages
>
> > If you have good examples, it's very helpful to me.
> >
> > Thanks
> > Changhyeok
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Thanks
Changhyeok

