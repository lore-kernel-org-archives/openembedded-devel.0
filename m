Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0E16D230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 15:45:36 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d79so31447892qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p3NGPzFteTp2qEuJZM/EyDWvPnOKgpMeSfRElO0MatE=;
	b=aC5UFZQ61JBYIi1syjUCrXVFe/fVvRDodtErhFVk4VMeFYEAX9bBguCD2Jo31sW1BP
	fPbk4cOyjSfWyiXbKdygm8Jg3t4kLDZVzJ8qeur5Zjp00tphxyYVvjepa+hnvsE2QcW+
	lyUwycwoYZZvt5ayDYlSVXTeFszaM1EpEqZ2l2yFH6O3Lt/E9dNnBDC7+O2zamQYbj+8
	h6cr+Mb/jz7vCt4mgofkshopQGI+ayyNu4WRBVN16X8CsGdTXaizAzi2MfR4Abcks+vL
	xAWIH0mQwAIQMw+gW+ANZx+hgHiqs8/iLyLYe96RiyiKLfQ28wFb8HPISnQ/krywsYij
	CaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p3NGPzFteTp2qEuJZM/EyDWvPnOKgpMeSfRElO0MatE=;
	b=DTSmoAo5H2RFIhq4Nt5iy6BsA+bNfL4g4WGu17kWIFf/oblm2jB+A6cO2Fg3TH0mst
	h4FmNP7qvlu2irdpt4kcruB/9bVyBEWTPEVP7AaMDkdTmeeBIjHzsic1uk+9coMBaNV4
	LVP9uJm2HieTaI7TM+ikpV1iuD0STGkGIACrdu2SnD/kpW+ADcC8nvovunjvP0SAzl3V
	SjE4mH/fAAcWlB8TFmElqEWE8IaoY8p2pE0ZdD++8uurrzfS6JFlUdJoDTYlRbZ+LXa9
	QGuyFMwDUsQDB/tXqOziSsvEvteI70ZurOxpNtBdPr2wkJk2RWV4sT1piVON/7TGmpP7
	h4dw==
X-Gm-Message-State: APjAAAVdYA/5yt3c2ZROWsbJT4vumt8SCIpWoghDiMm7W/fPglrxMe3M
	js3YdcfegzX7ZYbTDJHdmBk4GiHNoPp5ovhYe5t5SfA2
X-Google-Smtp-Source: APXvYqxhjG4yqOMMCK7MWkwiaiHJuaoutp6qBvvHoytkGx1qX68GuWuXR+vhiHpp4FmFbrRDwp3T1pwRbDbiw/xjeT4=
X-Received: by 2002:a37:4243:: with SMTP id p64mr32824292qka.9.1563896736993; 
	Tue, 23 Jul 2019 08:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190722130224.9972-1-bunk@stusta.de>
	<CAMKF1sqM6spF1vd0+=fzJz0WyzHx1u_FofPUn=uiE8w9ybc1fw@mail.gmail.com>
	<20190723152012.GA25024@localhost>
In-Reply-To: <20190723152012.GA25024@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 08:45:10 -0700
Message-ID: <CAMKF1sqjVQrEGYDkxhH-66qY_pD3cQFDkU6FkE8iEB+_FE5LCg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] meta-gnome: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Tue, 23 Jul 2019 15:45:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 8:20 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Jul 22, 2019 at 09:07:20AM -0700, Khem Raj wrote:
> > Adrian
> >
> > Seeing this failure
> >
> > https://errors.yoctoproject.org/Errors/Details/253680/
>
> A reverse dependency lacked a direct DEPENDS, and this was exposed now.
>
> I've updated both patches and did some more testbuilds,
> please let me know if you find more build failures I missed.
>

thanks

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

