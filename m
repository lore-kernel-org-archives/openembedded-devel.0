Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 58B5C60807
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:24:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w16-v6so1548358wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G2APh3Ty+PLu2MfV1vIoZA9Rifu0Fgm8M+ldos6NTKk=;
	b=LMjO97i7WXBQPzVCZMk5omJxTuy8h137xZGjAcQ2i1apAmnYdqov50Wp66+p+0T+iZ
	Lf+DCMNpJ4zZRIxxx+PMCmBp1AjGaW1lEw7DEwUjRnLP1dbifhnuAoCSiJRY1/BTUZ1q
	bi4tQyM+0kMGcyYet7uvD3lMUpO4DBpLvr6solNGzl8zN/tM1Wdv1o/UuhBiWBsevtS4
	vuULDdReb0DBySAREaGZ1Fxw3GCs9MP8mV2Alu44ZVUEwtOyCAkeXjz0ONKgHUeAJAdR
	7AjFFHJDuyFUhR5qrS6V/MHV/jyQfkVAbaX3r0IgbIiU7YwkDNZm+dEo9vRt6sDmlGwC
	1ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G2APh3Ty+PLu2MfV1vIoZA9Rifu0Fgm8M+ldos6NTKk=;
	b=TTVahWYOXk2AFo2Y/pGhR+CV0asQ49ndQXGnej3jJP292UydQ/6r9dVOScTS2enrfL
	OLZ4Df9ExhFZ56kT9HQ5fUA/OiJuv8GudjSeeFLud7dQFTsotv/Akh0anGMSQ1rnZMcU
	zRe8o9XwPLsa1p/n2YLp9+vAHbh7z0Eg1w2Io/3gK1zSoTM6SynnILOC8OSrpub8XHxm
	fKZ74ge429kq56buNnRge+7dKoEwWfkJ0Kare6zgLnEG/oqZ+LLo8qBKX7inMx+CzQMD
	vSHBJ3PDjv0W641fd+sXOd2ycOVpRCI3KkSwGvRHVaMFw10weSYUXKSygUPGCLJPV7Is
	BQWg==
X-Gm-Message-State: APt69E04q7MT/gO2uaDIfM0HNu5SqsMwvWUS4z6on/Xd4KDUTYEZsntd
	bldlPLHL0QjvkbpDkmqwh3thvsJgVzjORzjsKAw=
X-Google-Smtp-Source: AAOMgpfncmpFpOuFeNFjuAdMqRX4V6aXT3rc9RVy64QXr8Ylvw4ZxTyprpIk6w+EQ+CSOp/X6WnaZOga/HnGp2OeYS8=
X-Received: by 2002:a1c:c05:: with SMTP id 5-v6mr1906537wmm.117.1530278663951; 
	Fri, 29 Jun 2018 06:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv37AbvjKMnu=N38KxfJtRLFzAU=0CVFSpi64LpZgG6KTag@mail.gmail.com>
	<20180629130543.GA3898@mail.itconsulting-heinold.de>
	<CAAfyv36RrHUbuVeUFTgHptMF6gosv4KD1=UUJuaLiTX40XCLRQ@mail.gmail.com>
	<20180629131940.GB3898@mail.itconsulting-heinold.de>
In-Reply-To: <20180629131940.GB3898@mail.itconsulting-heinold.de>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 29 Jun 2018 15:24:12 +0200
Message-ID: <CAAfyv34pLOfmn8xfjDmwtnQe=U6Mpp4OoJC_gCwF1YSuHrgV1g@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Jun 2018 13:24:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Henning,

On Fri, Jun 29, 2018 at 3:19 PM Henning Heinold
<henning@itconsulting-heinold.de> wrote:
>
> On Fri, Jun 29, 2018 at 03:08:53PM +0200, Belisko Marek wrote:
> > Hi Henning,
> > On Fri, Jun 29, 2018 at 3:06 PM Henning Heinold
> > <henning@itconsulting-heinold.de> wrote:
> > >
> > > On Fri, Jun 29, 2018 at 02:33:02PM +0200, Belisko Marek wrote:
> > > > Hello,
> > > >
> > > > I'm trying to compile openjdk-8 from actual meta-java master (I'm
> > > > using rocko poky though).
> > >
> > > Please try the rocko branch from meta-java and build again.
> > On rocko branch it works but I would need latest version of openjdk.
> In that case I think you need to backport the version upgrade to the rocko branch or
> wait until someone will do it. There some changes in master regarding the xorg-proto headers.
Isn't just copy of openjdk-8 folder enough to custom layer from master
branch? Seem from your response not so I'll try to look on patches
and then update all necessary bits and pieces. Thanks.
>
> Bye Henning

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

