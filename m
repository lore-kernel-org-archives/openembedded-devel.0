Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B8C057FF2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:51:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so3704706wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2GuQXmORJz1Bt/pTpsP7vF0vJ2niGqqROolriotuCn4=;
	b=LgoeqjYivFSsshlqJJ4pU7RVMZSTgNdi0+xfYwZmD+BMLO9dYtazLcNM3rCdPKswDq
	rJUkjRxEVjXwwl/MrzaCNf9X6unb4C2kHpHwRTVfcmrqFVcHVOHyNV5eGnhVn0L1KDFj
	1ltc/KLbGcqFmJyl7zrGq7jte1Mhq4OsLKWfqIK0cPH77WIp8vxz2GxWSUuHIQU0C9/v
	kbv8bLARb6lQAazV51qcJ6miGZgn/0yzW8W6MbNoqlhzA4khcdAp4PrBt0jaBuCdh2eR
	XVMSTHcbgUGSSbcnCMHCSKPVQDywzCsymrnoK44U6rElrmMVfDdwewW6cjM0UzLMuasd
	wKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2GuQXmORJz1Bt/pTpsP7vF0vJ2niGqqROolriotuCn4=;
	b=Df70bk0evz+3r5kNec8Zg5uCvmfXDGGnBEBLpl6ElNCfJXA7tvgdvpMeHX5jhvMaup
	uYqJUHbqrAZi25PpmB72BuNw9HbjqnLtWS9PPjLW8fMN+bm5+2ogkFd45ae3+1GcLLZA
	XGAl5Aknt2asAurR8zJkjriZpz7ir5Za8FF1Kj9ZfL7NKDJJ4T0Hg9pwindSiEtrAode
	pgHKiaWj6jVeXNUdNu6Tw8F8WS1ApNSOadKxyXG+M8yN8CjybZ5vKthaVdHEk/CmJWZy
	7bPr4DSsBHEC1OwZfrwapr1yCJV+IFh+srBKGg36rNzQNAls5QQ2S8cRW5zNcRj9eM9A
	TUUg==
X-Gm-Message-State: APjAAAU4LPSefXZHt7NyzTmkqJF+ttxnBIJHphhmFTu0TMPx/kf85GW+
	KbzzFSa3L1LEpo11F1H0iRdksVC87Mt5rIViKlN2OVKY
X-Google-Smtp-Source: APXvYqxWhBX3hJMAV6sQjR696iLvvVYtgfOXqmfIVdZ1+47Tr+mbq3GpB4Lvx0Xn8l86r8k48yeOqmLRDc6JpIQUsCM=
X-Received: by 2002:adf:81c2:: with SMTP id 60mr4895752wra.8.1578495068498;
	Wed, 08 Jan 2020 06:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
	<CAMKF1spvn+Uqi2q4QsxajLcY0wjPN6dG3vSW-gS4=qmu2dcrbQ@mail.gmail.com>
	<CAMKF1sovYLH8_eMN6V9n2ZwqA4G2pzMFd_O_ToqVAgAca19stQ@mail.gmail.com>
In-Reply-To: <CAMKF1sovYLH8_eMN6V9n2ZwqA4G2pzMFd_O_ToqVAgAca19stQ@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Wed, 8 Jan 2020 15:50:56 +0100
Message-ID: <CAATN8PXP74UtpU3PygmhQ1y4cvbc77PAqpnA69cOUDPC+ixSTQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Wed, 08 Jan 2020 14:51:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hello, I'm submitting a revised patch that now seems to build fine.

thanks for the review!

Gianfranco


Il giorno mer 11 dic 2019 alle ore 05:20 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Tue, Dec 10, 2019 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fails with clang http://errors.yoctoproject.org/Errors/Details/296908/
> > I guess it needs to use KERNEL_AR
> >
>
> It really is generic issue fails with gcc too
> http://errors.yoctoproject.org/Errors/Details/296946/
>
>
> > On Tue, Dec 10, 2019 at 1:39 AM Gianfranco Costamagna
> > <costamagna.gianfranco@gmail.com> wrote:
> > >
> > > ---
> > >  ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7
> ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)
> > >
> > > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.0.14.bb
> > > similarity index 92%
> > > rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.2.22.bb
> > > rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.0.14.bb
> > > index 0f8d7af3f..bd7339e1a 100644
> > > --- a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_5.2.22.bb
> > > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.0.14.bb
> > > @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
> > >  SRC_URI = "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
> > >      file://Makefile.utils \
> > >  "
> > > -SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
> > > -SRC_URI[sha256sum] =
> "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
> > > +SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
> > > +SRC_URI[sha256sum] =
> "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
> > >
> > >  S = "${WORKDIR}/vbox_module"
> > >
> > > @@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
> > >
> > >  # autoload if installed
> > >  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
> > > -
> > > -PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
> > > -
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

