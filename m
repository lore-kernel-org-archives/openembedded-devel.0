Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5F43601F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:09:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u18-v6so2035496wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9yawklm9Z4k4SY5vW1rMeb7480N/nnamzOnxfcn/eP0=;
	b=gH1aRhInOst/1P1figTWhhmQ82Blwq5dqbZ+nh+mFoy+Tkt0yk2jUnnqLmLOt+rjMZ
	s5AUEaiRjNarYpw1ZWoJ3eMFP29TAtNWZRVVD9Q083W+WmWft8O+huQfbSkl+9LMPStu
	89Dkr4Sm+OeeQHBpqN63kl6ndhn2XZPnWm1FBIB8d5BOvN4FlcuejHfXBAxsdA0xlR/y
	gTaSejVnNUWq3TEh6BVxE61C4LuS2TQbUlGV6cNvWCeY7oDhwzwntCY6EYP0+Vf54iTj
	2sfcwbXYNND2QELHNJeDekGBNx6bKRi3gb8tdi///DOWizzOCgEEnRBHqPIRSin1KdWG
	lHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9yawklm9Z4k4SY5vW1rMeb7480N/nnamzOnxfcn/eP0=;
	b=XTJ9lrGQSdCjrKavggafqTcS9UAif2p/5xK61dXOOb1pq7Vd5jagZav6O69s/PKH2n
	uyWy6vcddf/9Vp0soW+LxPiSiKj0ogwZd0M5aPfa2Y4Z3ZWyehgFC2R77BRZw1eYgPD+
	cflDmaJcamHbwqJGSamZvk9Hc/Cq3ZiztjniihoC5Ji86zLHnTEFy4I2nG7RaceAUkCN
	nboVAFecso2emG8Hun+x5NifUikQxHGx3nS6Yp2r+qlubv4OUH2NrMjdnFP5eTr3Wmou
	P5M0jQvxPrG63pHJjo0lyJyKksYJ3TcIZ5q+6iFRMabeFpZkzYrme46QwlvFfwoQgR/j
	vk+w==
X-Gm-Message-State: APt69E0eKBVbbSkiDGSkk1kfuSQc8m3XH/brCKF0++DEt0OxeFbkCvSq
	lc7B6YZ8OnXI4so6RSh71/PtwcRKobrGcdZFbIQ=
X-Google-Smtp-Source: AAOMgpdEju05TaBo6ZhT5Bkfih1DVfeVmpx4YLL6SVUbR3VC7g32OvS4Q7Xtf4iLAy/COD0+cbcOrQj00lUkJ87/lR4=
X-Received: by 2002:a1c:4602:: with SMTP id t2-v6mr1649540wma.21.1530277745284;
	Fri, 29 Jun 2018 06:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv37AbvjKMnu=N38KxfJtRLFzAU=0CVFSpi64LpZgG6KTag@mail.gmail.com>
	<20180629130543.GA3898@mail.itconsulting-heinold.de>
In-Reply-To: <20180629130543.GA3898@mail.itconsulting-heinold.de>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 29 Jun 2018 15:08:53 +0200
Message-ID: <CAAfyv36RrHUbuVeUFTgHptMF6gosv4KD1=UUJuaLiTX40XCLRQ@mail.gmail.com>
To: henning@itconsulting-heinold.de
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java openjdk-8 fails to compile for beaglebone
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
X-List-Received-Date: Fri, 29 Jun 2018 13:09:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Henning,
On Fri, Jun 29, 2018 at 3:06 PM Henning Heinold
<henning@itconsulting-heinold.de> wrote:
>
> On Fri, Jun 29, 2018 at 02:33:02PM +0200, Belisko Marek wrote:
> > Hello,
> >
> > I'm trying to compile openjdk-8 from actual meta-java master (I'm
> > using rocko poky though).
>
> Please try the rocko branch from meta-java and build again.
On rocko branch it works but I would need latest version of openjdk.
>
> Bye Henning
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

