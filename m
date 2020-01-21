Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id E05A37FD9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 15:39:25 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id k6so3110264qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lU7CzGGNzkzIAY+twGy19kV/cEZPTCq0SNhTRugS3eI=;
	b=SbKbM9phTqfJmrPsGF1OTJTaclViZ1PzzFYA0MJMJdL67fp11hfo4YjkqertlniI4Z
	N1UswABuPm41jEWFLKjM3IB16YtsHL6ZC0ZwTDibjrILGGVeDRMerYnxjqn5G/pZuW8G
	EROY9vh/aAwZnSBdtShZ/zpxYp1jpIp5DwZog/00th6maTH0rCd9BYBbN6bDJpY0x8ug
	2W/SiwubH75M1pzr4EKMFBD+CmbGgxzQveuYgMvs/av2AHQi5IeuOJFFHDmLERIIP6qj
	ZCLBsXpPIfgkBi/nu0Rd3FMen90sKLYqcudFKiM8qai/7ZQ8FvaBsaM+u0VvYM0lUfeo
	V4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lU7CzGGNzkzIAY+twGy19kV/cEZPTCq0SNhTRugS3eI=;
	b=Pr7VpGFfPdVeMG6cpS/FHvt3HM0Z0GtRVFrQPunTzhPRAyenSXfvZE04i2FZuuCIZe
	Tl5uQIE1rBZpyjWRL3uDLuRQ5FSkNR5E5qR68qxYoCMHIjgPCZNzI0eBZyPg2j353Jlc
	AEQ+bitKyu+NfAY+ZHXlFGqQavZYt55KHhRMsSmDke5Bs2zJ9Ri/ROOGF+kGFrPwPw3v
	cYJCa5CHEafLxdxQthgi3r60ZnKhikXz7ZheL6k/6kM0f1/XeDJ8XOLoAa7zY5H4FJWj
	T7CEVuuPuQf5LrR9H8+ePGdM/wXQvKAwRh7hehZMUz3O2HXumO2yZILCD192WCMtxfPv
	Mvgw==
X-Gm-Message-State: APjAAAW5WtPxB5rP2A1J0CwgbE2kjzF2hRRffJdeRBWKXKQTXMa9Wphh
	cdJ8QYoX7r+Xmlyhm7v9CNVEQzcbz9ghA2BbCWk=
X-Google-Smtp-Source: APXvYqy97UZ5czPrb+TRdTCTIqArDULIjf29Jeq0j4NLPEkVZ60tmL8GsRcMxnme2Nve1PVPWko2yU4x2TRX46K7aY8=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr4887800qkg.71.1579621166471; 
	Tue, 21 Jan 2020 07:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20200121012416.544541-1-raj.khem@gmail.com>
	<CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
	<CALbNGRTpRzagOxVx4XjEwGaJQmGXPEY3BPUaUT8kb+3nLKV1TA@mail.gmail.com>
In-Reply-To: <CALbNGRTpRzagOxVx4XjEwGaJQmGXPEY3BPUaUT8kb+3nLKV1TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 07:39:15 -0800
Message-ID: <CAMKF1sqEPh1L2W1yaVg8pBSTXVrkpsmo=xbbxEv2Mt4R0K3wFA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: Upgrade to 60.9.0
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
X-List-Received-Date: Tue, 21 Jan 2020 15:39:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 11:34 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Tue, Jan 21, 2020 at 8:13 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
> wrote:
> >
> > On Tue, Jan 21, 2020 at 2:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Use firefox ESR src_uri instead of gentoo pre-generated image
> > > Pre-generate old configure script
> > > Ask for python 2.7 specifically during build
> > ^This is what configure.py already does
> ^ 's:configure.py:configure:'


Right I have since removed this part

>
> >
> > Although I wanted to finish python3 first (yes there is progress) I
> > sent  out similar with autoconf-2.13 and some clean-up. Are you
> > working on this either?  If yes I can do something else.
> >
> > Andreas
>

