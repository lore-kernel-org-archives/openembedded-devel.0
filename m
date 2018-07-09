Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBC674E95
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:29:46 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t4-v6so10568609vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WVKuZ51MJi8mcvOn8IowI169PapendtQL6GB6bXQd7A=;
	b=Vsi3fnWGvx7rkgnRd18YOkJTYtPDuoxhkbvJHeBJtM7CqToTXJ+gKs2wIokWXRYHPq
	nDM6ZF2xk9RUdvaniUdOkWtoHYChiGY1/iHSU/bWvCrhAuK/vQIEWxqabbgpd33jXFDA
	3RH4uxbYv8o7Dy0BccmYdXDDHChm+1HNjfssZjv4qAEVosSGLSkrUwEWNLQq/H4ESZUJ
	J7zjMCb63bMfojmZ/cUhvh2xbLbdRapy547UmTDSyY6yf+12RTU8LHAc8xSa1wOgByr2
	Q8YCEe3EK4tY8SuIc8T/BRsVDwiGnu8sHMyTBNg5ecUEZmdCCR4P+GaC2m6lk1p5uK0m
	KHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WVKuZ51MJi8mcvOn8IowI169PapendtQL6GB6bXQd7A=;
	b=Jf6LclmFwXWQeU5bEQaC92IYNWXUzqxgx+NOIGvkWRl7x1DnDYsk2Ba7qXnZatFsSY
	h0et3yM8bjn9J8+ErJGTJgNZ5NklHTUb1sExGfOEyCyFNrIocCn/Q+C71PKt711ApsiD
	fHJvVFPbQIosxPS0yKRXI5tpeOa+FXcJCi5w/q7LXftL2x7dOGfr5uEtNQ51/jQV3fyI
	Hr6NlE0/opmbcuN0GtP/KCbmlCPcQq9Ed0RpPkXypYUb/Vv1aTQ20V3j+RrtGjM4OTZX
	rEagfA1EnJAiZMk0rIa2cWeT+uUucmiq0wH9gbS7aXpPtZR+1BvXUVefBjkubD/f/2x3
	rjBg==
X-Gm-Message-State: APt69E02k8R0azaqcu4cdscvx0Gnj3dPQzMh2wLH5mzS5mzrqqPqqknj
	jkJDy4Vwo6jz3yZnFep5x+fH4fcowa3Pxf/JXGs=
X-Google-Smtp-Source: AAOMgpdz1lVGqZym4oJ5am3FJkReyjgqwS8YwawWXrYgAF1mrB9GJU6ahyg/92Twfbv6oyoSP5bUEDWZyWzPUiMiYfw=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr11101583vka.146.1531150187202; 
	Mon, 09 Jul 2018 08:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
	<CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
	<5B42C73E.6070009@windriver.com>
	<CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
	<8f9048e33461462790467523f3b89fdf@XBOX02.axis.com>
	<5B430283.6060202@windriver.com>
	<df1945d103d444ada773567805d1c763@XBOX02.axis.com>
In-Reply-To: <df1945d103d444ada773567805d1c763@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2018 08:29:21 -0700
Message-ID: <CAMKF1sr_XF-dy53jcc44WpzzhZ7+XP4Ka4W4OBSyYp--ZZQBjg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 15:29:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 8, 2018 at 11:58 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Yu, Mingli
> > Sent: den 9 juli 2018 08:37
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Khem Raj
> > <raj.khem@gmail.com>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
> >
> > On 2018=E5=B9=B407=E6=9C=8809=E6=97=A5 14:37, Peter Kjellerstedt wrote:
> > >> -----Original Message-----
> > >> From: openembedded-devel-bounces@lists.openembedded.org
> > >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > Of
> > >> Khem Raj
> > >> Sent: den 9 juli 2018 06:02
> > >> To: Yu, Mingli <mingli.yu@windriver.com>
> > >> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > >> Subject: Re: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
> > >>
> > >> On Sun, Jul 8, 2018 at 7:29 PM Yu, Mingli <mingli.yu@windriver.com>
> > >> wrote:
> > >>> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 23:01, Khem Raj wrote:
> > >>>> On Fri, Jul 6, 2018 at 2:27 AM Yu, Mingli
> > <mingli.yu@windriver.com>
> > >>> wrote:
> > >>>>> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 00:00, Khem Raj wrote:
> > >>>>>> On Wed, Jul 4, 2018 at 11:54 PM <mingli.yu@windriver.com> wrote:
> > >>>>>>>
> > >>>>>>> From: Mingli Yu <mingli.yu@windriver.com>
> > >>>>>>>
> > >>>>>>> Update LIC_FILES_CHKSUM as the file iozone.c
> > >>>>>>> used for LIC_FILES_CHKSUM updated
> > >>>>>>>
> > >>>>>>
> > >>>>>> Please describe what has changed that is causing the checksums
> > to
> > >>>>>> change.
> > >>>>>
> > >>>>> The source file iozone.c changed has causing the checksum change.
> > >>>>> I have already mention it in the commit message.
> > >>>>
> > >>>> Commit message does not say what changed,  We already know
> > >>>> something has changed thats causing the checksum change but here
> > we
> > >>>> usually document what changed specifically, purpose is to let
> > users
> > >>>> know of any change in licensing requirements that they need to be
> > >>>> aware of
> > >>>
> > >>> Thanks Khem!
> > >>>
> > >>> I will try to list the changes in V2 but actually the file iozone.c
> > >>> used for checksum is source file. It has so much code changes
> > unlike
> > >>> some packages use COPYRIGHT file or README.md file for checksum.
> > >>
> > >> Ok that=E2=80=99s probably not ideal then. It would be better to jus=
t use
> > the
> > >> needed lines from checksum
> > >
> > > Please note that it is only line 37-48 and 260-266 of iozone.c that
> > are used
> > > to calculate the checksums. However, I guess that that due to the
> > fact there
> > > is source in between line 48 and 260, some lines have been
> > added/removed, so
> > > that the line numbers used in the checksum calculation are now off
> > (or they
> > > were off already before). Looking at the current source, my guess is
> > that
> > > lines 260-266 should be changed to 269-275.
> >
> > >
> > > Someone should really ask upstream to include a LICENSE file....
> >
> > Thanks Peter!
> >
> > It's better to include a LICENSE file.
> >
> > But now, how about just use 37-48 lines to calculate the checksum?
> >
> > Hi Khem,
> > What's your opinion?
> >
> > Thanks,
>
> The problem is that the license information is really at lines 269-275.
> And at lines 37-48. Which is a mess...


ok. you can have two entries in checksum like we do for multiple license fi=
les.

