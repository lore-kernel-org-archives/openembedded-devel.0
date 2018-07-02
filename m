Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9D878956
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 14:28:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s12-v6so298243wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2018 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PGNcZKGb/2iRT0bx7yD9pqxYk0sN9yCMD1L9yxwvQio=;
	b=CWmwlsw7jfYSI1TtayEbr1knOAUGEBeSG999ToWNV0+WR71KBRoPJS+ryX6L6urLcL
	GsDPqNzlZNqkK4jmmjlLhqQbLgRIX6gMYxBKNVW62ZZU8PHcKyKV0xUsZvkSRSGJVC+s
	WS76OzmlWfYpI8CS7ADs8g7w6figYbJ6xdzv50Ip4sUIPzRA07Jr5wWXOamsqzzJ35YT
	Yb4Up8qmdSwJJVfiSOi8hhXyo66dhjcIJY33HOmfg54cp8Wp7lHTkqf5BZSnh6UXmM93
	nJBTSIa+fgUNQryVJif0Oz6r9Sqwh9fesbkR2WhPjwDQeRgoPycnKfHuUBKHNylkhgBh
	fU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PGNcZKGb/2iRT0bx7yD9pqxYk0sN9yCMD1L9yxwvQio=;
	b=JAoHuKGGoUd92PscePrKeThy+izwpSvWbbJDQphOhCsNx9C3AXodVo1F7isPaOdN52
	nd6dDIZvdzK3PD7AWL7cXtlAG9+VG1RLv1/f1cGowadghzHft9ueTarTfHjG+xsM/oxV
	3IXamSJAclNZzO4aA1PQ7ioik+4QT4RhlZ5ux9Ed4A1hHH1ZKTqydxPgXyDIQq2eBdzp
	mtAYN0bNy8qFJCt5doMpDwyg66g8wq94shGBnk8uDyhUElSHHCnZLd/m8Qt/W0mpA8Of
	LF/aDNsjpNo9KVeuRBD0Vsu9+QlwOFrxF7F+ubVL1Lk1X9Kac5+WbomgI8uSRh3gtiE3
	wAag==
X-Gm-Message-State: APt69E3jIHxmhIzqqT5CAKTOr6E+TsakJCtuecQkBSZWYRnXnK7sc9Tt
	PVeU2ErEVF7mcz+7YXrXcV0i4crFxl6mZpnZtUIcMQ==
X-Google-Smtp-Source: AAOMgpcHKxvDkVSC1uSS6Jim5/eGhQT0PdOv3K/7sey5dvrYoiP/UTgzXMQGdn8+FJsXvmhBFX6XYfa3SDissxh3hM0=
X-Received: by 2002:a1c:c14:: with SMTP id 20-v6mr3729489wmm.117.1530541712630;
	Mon, 02 Jul 2018 07:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv37AbvjKMnu=N38KxfJtRLFzAU=0CVFSpi64LpZgG6KTag@mail.gmail.com>
	<20180629130543.GA3898@mail.itconsulting-heinold.de>
	<CAAfyv36RrHUbuVeUFTgHptMF6gosv4KD1=UUJuaLiTX40XCLRQ@mail.gmail.com>
	<20180629131940.GB3898@mail.itconsulting-heinold.de>
	<CAAfyv34pLOfmn8xfjDmwtnQe=U6Mpp4OoJC_gCwF1YSuHrgV1g@mail.gmail.com>
In-Reply-To: <CAAfyv34pLOfmn8xfjDmwtnQe=U6Mpp4OoJC_gCwF1YSuHrgV1g@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 2 Jul 2018 16:28:20 +0200
Message-ID: <CAAfyv37UG69L=nkcpekm09B+4cD7sZOzVo1+5WrRS5YSjc8xoQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Jul 2018 14:28:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Henning,

I tried with sumo but java aborts:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119164.html

On Fri, Jun 29, 2018 at 3:24 PM Belisko Marek <marek.belisko@gmail.com> wrote:
>
> Hi Henning,
>
> On Fri, Jun 29, 2018 at 3:19 PM Henning Heinold
> <henning@itconsulting-heinold.de> wrote:
> >
> > On Fri, Jun 29, 2018 at 03:08:53PM +0200, Belisko Marek wrote:
> > > Hi Henning,
> > > On Fri, Jun 29, 2018 at 3:06 PM Henning Heinold
> > > <henning@itconsulting-heinold.de> wrote:
> > > >
> > > > On Fri, Jun 29, 2018 at 02:33:02PM +0200, Belisko Marek wrote:
> > > > > Hello,
> > > > >
> > > > > I'm trying to compile openjdk-8 from actual meta-java master (I'm
> > > > > using rocko poky though).
> > > >
> > > > Please try the rocko branch from meta-java and build again.
> > > On rocko branch it works but I would need latest version of openjdk.
> > In that case I think you need to backport the version upgrade to the rocko branch or
> > wait until someone will do it. There some changes in master regarding the xorg-proto headers.
> Isn't just copy of openjdk-8 folder enough to custom layer from master
> branch? Seem from your response not so I'll try to look on patches
> and then update all necessary bits and pieces. Thanks.
> >
> > Bye Henning
>

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

