Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB80E7FA8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:40:43 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id e66so10020087qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tpXg7/5vXqRuJiSVm3rKAAeoOt0URkpYCZPAA8lPrRA=;
	b=pR787ZoB1Tsypfvjiw5+ogXBT8PX/Ndr1MtViwhqJj3wPyxQEvfmYK6uIE1/TXOgc7
	mR/VFOuWPrwVCgzeWDcmQv8Imn4a+hEIsFm3Cl6rVg+9l/T2pmakLNP4DKq09ilSE8ZN
	3aThyr1JKeq6HDObMr0LCk/C1WtSCmIGx+p1wcSbwekfrJL1chKkUe57hJtEm4eo4M5i
	eXkG9kED5oDI2dQV9IrUb0bJkE1uiVgDqx8575uused4TeHegK5N5TAiO+2dY6NuY+1r
	BbyxN9YQ4VYlehx0djU329nNhC2I3im+DIMIpn87CmbS2EPoyzpia6ev985BZwtAzAsQ
	kdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tpXg7/5vXqRuJiSVm3rKAAeoOt0URkpYCZPAA8lPrRA=;
	b=mpz4vvLSJ5mmzdR2Pvy17J2gudNsCY4Hey04PWO1b3YZ6r/D7ygIcdRaXL55DDVLsi
	k+bTWZcpd94uGTSvGTMYy03uIxfGlvHSe4tnMGBr2kSerbR3G3jvW0eeyS4JWG4MRm/0
	yExj/QWG4w35MHPmE9ZopIRfdev5Dq0d3KQ9+UwkcpCq6Hvkcwk5Zi9eH5Oab3lVYUJQ
	Ceibnyk3n9pTUGGkHS6m1AHlTS/bEWNrMMWg7aKVNCniFkBu0kULCITGOITAOEbWqJO3
	zIg4otra8Em8pPmSffPuQG7hz2HZFtnSjYGCiZowgkfxw1X6axIcdD1PHbwYRXsFKSyq
	ZYBQ==
X-Gm-Message-State: APjAAAWP7N81fDv9MQuX6afguYY8LakmMeBh/AQ+G5mE/eVdVfiyeu17
	nc9iPSAkCD5nRP3rkoJvvepnU7peyrage57hCI0=
X-Google-Smtp-Source: APXvYqy92BSGN75OW0S8/mPoUFHGkQZeXKzAJqBsXJ2kbzZuxo5k804v2sP9ALUg+9G7FGGPl2qEuCrh+zBKG3oITbw=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr2689868qkg.212.1572298844210; 
	Mon, 28 Oct 2019 14:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
	<20191027233545.4146-8-schnitzeltony@gmail.com>
	<CAMKF1sqVM6zVRftnq_fsPXRxp=fR+mEeofhgw6LFd3vgOUNFLQ@mail.gmail.com>
	<CALbNGRTmZWpYHDiG_2uXaQyGWi0GPwTvXhfsUcsNJ51Fx8AWAg@mail.gmail.com>
In-Reply-To: <CALbNGRTmZWpYHDiG_2uXaQyGWi0GPwTvXhfsUcsNJ51Fx8AWAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 22:40:24 +0100
Message-ID: <CAMKF1spH0prGFUio+prvufVwm9kah5rNtU8HT7+A6LwTtZOuyA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/19] colord: initial add 1.4.4
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
X-List-Received-Date: Mon, 28 Oct 2019 21:40:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 9:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Mon, Oct 28, 2019 at 9:08 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > https://errors.yoctoproject.org/Errors/Details/274841/
> This is exactly the same error V1 caused and it was fixed in V2 [1].
> Wanted to look what you applied but in master-next colord is already
> gone.
>
> So I have to ask: Are you sure you applied [2]/[3]?
>
> Maybe I caused confusion by not naming it V3...
>
> [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/2=
02531.html
> [2]
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-October/2=
02550.html
> [3] https://patchwork.openembedded.org/patch/166279/
>

I was applying latest from your pull request especially

https://patchwork.openembedded.org/patch/166279/


> Andreas
>

