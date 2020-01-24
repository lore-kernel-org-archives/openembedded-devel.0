Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67B657FD83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 00:13:14 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id g12so341840ild.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 16:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qIg1azKUud7pz6WaJUP/sC0PX+86apWvkCS4AvkiVC8=;
	b=uOlFoqCF3Aw9e6BrgTvsWSBIy2srrJu3oJft+xfvR8zRxyAbaZOPKyubdFl3AoOxV5
	O8Gj6facknzuHc6Dqy4tYejEFXQhZfnzz/f5s0pQizewcc3FvldTBIGrmyNcR4yIusmu
	xbEtUN/U4WlcUaUgqM1PBuPBIWx+01/xSHB25Tc5s0KQOps1Yu98B9KjUtm8kfyOmm7l
	sJc8aM7JudmRHTsZHt47g8E80wGBJYZ4UbSeNUgXbwA24qR7czSeyfaR3BzFxyppEIl8
	W4caGjmOYjBz/B5e8s6pLNvgUVOcEOgdKZ4UykMa4XYVK9IupPgayqaN6BF9I7axN3Ul
	0W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qIg1azKUud7pz6WaJUP/sC0PX+86apWvkCS4AvkiVC8=;
	b=FUzT48yUgltK/WbCsYTkTMNd6gpCwmgE0ySOnM9k29Q/LC/fs0UEQ8cYvb8FkWv4DZ
	cCc4M1Bjl8koHE2IXe5VGDWGqWK0m6GDXT+nWtK8jLdFdVAQypQkQPma2FRhamP+1TVJ
	vdMu1t5C1iRb+CnJTASqeVYD8kFaK+POY8VyEDjyirkWbs7lPMhDOK2LjtJ7ymfaIEeL
	VrSsLS/soj8SgdqDdka3/uPFt2BKQqfZejbGs+ICx4RRwasXUXGOgLED+jK0Syl2RWzY
	sgWhE+1QFAHnkFEo/QZw5CvLktb1t7T9HJG+QC+CtFzLRgswf2gAwAgwm4Kq3UKsALiN
	/KwA==
X-Gm-Message-State: APjAAAXrZgezJ3nZFcnJjBg9dCX3PFA4SJoGmawyK7psB0FKDDubOuQO
	goQJ6O79Z3ynQdIuPrFUo1HHN+Xph0Rr9Qg/PwM=
X-Google-Smtp-Source: APXvYqzYngCHyHL5z0+MoB3Hy+QX5yY7hWRdwUpv7K/dxaEHzyGnnAV5FCvmdRmWGlHM6oejuwjztV6CrlzQyIJzj0k=
X-Received: by 2002:a92:8f44:: with SMTP id j65mr813980ild.144.1579824795420; 
	Thu, 23 Jan 2020 16:13:15 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
In-Reply-To: <CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 24 Jan 2020 00:13:04 +0000
Message-ID: <CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Fri, 24 Jan 2020 00:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
> >
> > On the offchance someone's tripped over this already/has pointers:
> >
> > Around the time python2 dropped out, I'm now seeing boot failures with:
> >
> > [  612.151548] systemd-journald[543]: Assertion
> > 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> > src/basic/time-util.c:55, function now(). Aborting.
> >
> > I suspect it's unrelated to py2, but that's delayed me getting to the p=
roblem.
> >
> > The board I'm targetting is AM335x based, but without an RTC (which I
> > suspect may be relevant).
> >
> > Anyone seen anything similar?
> >
> > --
> > Alex Kiernan
> Hi Alex,
>
> Have not seen that one yet. Will look for it once I can build images
> in current environment (python2/Qt5.14 broke loads for me). What I
> have seen were problems with timedatectl <-> ntp. Changing from local
> time to ntp-sync did not work: Time remained un-synced on recent
> images. Machine was Raspi so no RTC either.
>
> Don't know if this is related to your finding...
>

Looks like it's related to the glibc bump - reverting that changeset
gets it booting again. I struggle to figure out which of the myriad
wrappers are actually being used from inspecting the glibc source, but
if it's the one I think it is, there's clearly
clock_gettime/clock_gettime64 changes there which I doubt my kernel
has (we're currently using the TI 4.19.y kernel).

--=20
Alex Kiernan

