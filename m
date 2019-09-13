Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2147B7D5C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:13:51 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 4so26382802qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 17:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZNjwYJC6o1lsKhxfD0XFqCIChAQrFRRvF7qcovzDOek=;
	b=RLCsM4YUgsgBLm6gGE9CseC+2uTy4hacGbIVoi8HzMfbevGViyWNX+ohOZex5Jb2m4
	TExrne+y23ABHL77XBebyl8fbsiDtF7l85bJVMUb/E58wHMh0BlAnCL8CD94FA+1bf7h
	kdyckBbOGAanbYvsDS8/F3okqpx5NtAlVydtdRBwoM2E7BNWHAXBHe3LYmVw2fkkWbYd
	INjsT8UUiUXCsPG5xL24Eb+k8HSR5ksEzW/uS2PSz5kXM3ONyMu2H/Zl5inEXsDBqbJJ
	voKvmi+FAo292pLgESoAGLMvkpGGkLZyRrPBRpI7sGlAE+wHg0Ju9heWaI9qF31nMxV6
	Q0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZNjwYJC6o1lsKhxfD0XFqCIChAQrFRRvF7qcovzDOek=;
	b=JLoY5gVsekHbjj5K8lKr1LC4K+/8lSZ8EQ9C+i6rJZqTSWIiQRwD64mNfka88D0hhp
	zNR84AXrU1nNjtq9Z8UdoxJxHnAFqZTYCDbn0Hko2kS3yfyyOE69/o1sADzsX6c/ZPXJ
	/lyKXyB25eZT6cyQyHNPpALCjviJ9NDTVPhAQMl2GmwFBGYZoXjsQCSfj2nKwoapRtWc
	HAsZD/X7kZuZ51hYiL8wP6nVT++6i7HwW0C4XciB7IZhQUbwI9JUS9vVKtqYKn/kqcVZ
	WGL0akL5cscqDlvQ8nmFMvBj8LnGUSpyQRDUd0xof3kye8EuMs8o4n9HFx2Qgnm0PrDg
	3xJg==
X-Gm-Message-State: APjAAAW13MvyI1EJlil4ODKti8LjrM6trANCM6AzwZZaCYSJZZpsujL0
	gKxD0do48/+KR27vu6HtXzDDYzYppchOtkIW07GATQpQ
X-Google-Smtp-Source: APXvYqy6LCiy8sbxSsmt6lfjtuR6f/kMzrsmiUgCIED2nvaYuz8dWvbhMhOUdj/yAqHHipQKQZloM9fLNIIgyZzqcY8=
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr5925351qkb.212.1568333631769;
	Thu, 12 Sep 2019 17:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190912201831.51848-1-raj.khem@gmail.com>
	<20190912211249.GA25165@localhost>
In-Reply-To: <20190912211249.GA25165@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Sep 2019 17:13:25 -0700
Message-ID: <CAMKF1soJEsowGL1-VfzYk2Q=i73SsnD79zM5=nS_r+6W4uaEJw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] mycroft: Make rdep on alsa-oss conditional on glibc
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
X-List-Received-Date: Fri, 13 Sep 2019 00:13:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 12, 2019 at 2:12 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Sep 12, 2019 at 01:18:31PM -0700, Khem Raj wrote:
> > alsa-oss does not build for musl so its marked incompatible for musl
> >...
> >  # Mycroft uses Alsa, PulseAudio and Flac
> > -RDEPENDS_${PN} += "alsa-oss alsa-utils alsa-plugins alsa-tools"
> > +RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
> > +RDEPENDS_${PN}_append_libc-glibc = " alsa-oss"
> >...
>
> This looks wrong - either it needs also-oss or it does not need it.

actually I do not see is needing alsa-oss, it seems to be ok with
pulseadio-alsa plugins
but since I have only tried with musl I tried to keep it unmodified
for glibc but I guess we
should just remove it.

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

