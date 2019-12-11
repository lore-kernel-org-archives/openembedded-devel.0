Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 42A357F36E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:03:48 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id z12so17785422iln.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t8iFWF+D6ZM0G8+8qMrXqDSIQlYvVrCcCgvoUTN9Rck=;
	b=JHzCCa2NZcAPEELB2IaSYCC2lkys2rESFjS8GArr+Pjukt+q3mWYDop2ZQcdgPCvXO
	n4TLM4Px4flEuyAbTyUDPnwRkMfzdKE395HY8DZW0YWTrtyNmsxDgD6hJ7kzJ6LJPCeB
	A1/felczDnsAEQ5XXkPwDZX00Ik3sA9O2xHFykTbcjhOLDtybh1qNGINz7NkmtahRn9f
	aEGvvWzf3buk/1aoR0Q0v7/PzsrYfkV+1/jHYnn283bdoQYXdMZT0ZcYsPxAcMIheL9n
	rWFfEwKJcMpSqEUdC4tYA+N0VP+4SittAqq6857Dg0yfDn7tvFd2MKMs4HWS2dJJfq9T
	oAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t8iFWF+D6ZM0G8+8qMrXqDSIQlYvVrCcCgvoUTN9Rck=;
	b=PW+CwbMmy67E8YdODoILWiRmX8REDRYafiqWyADYRlnJzwmXjzYL0HtQh132MYX1Ba
	qXZ68Z6NmxpoNZBmGwjQdreaR0l6tPBcxEboQc71jXC0tUiYI6nL72K6u+x9CgB713fR
	0V/qyykTEvDucvnu9j48y7h50WTX50yBdlsA2HLQ/+BFrEOXYNC1uoVDCvlBdw/rfwnt
	dj0Eahojp8I0jsEtyOemuaOf8WUpGxIBDnfEj0sjrNMiGaQyLdCyexXgJ1tlBFKkIdnR
	fHFCxJJw9tEnp7a+QbqATqiX1mQfKKxCdSP0tUXxD4JpEiZ6PHHYvgMkAOvZzpzLTsPh
	K8fA==
X-Gm-Message-State: APjAAAWdm08uitBDmA+Pcs27/UyuP1UNs5M/bttRGMk8dcvtUR/XrgB/
	zfohjAt43bhH3Qh3W0T2LhyXpmOlELRVRc3KM+k=
X-Google-Smtp-Source: APXvYqwhQwi8F6geirwYWn3/GQV7BQ08ss/7PD2dOZNIVjSDFqv7ZF0ha+orEeQzP7HvLmj/HXAl7bHGpn1RDJL+/1E=
X-Received: by 2002:a92:405a:: with SMTP id n87mr331436ila.299.1576022629181; 
	Tue, 10 Dec 2019 16:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-6-schnitzeltony@gmail.com>
	<CAMKF1spG5KPsiw7PkDG0JwPVGwJudMFduieEcmf73trCUMSG-g@mail.gmail.com>
	<CALbNGRRdspaYTVH_0Zmbrs-fUJBtJOjpVSiy24kBN_bHmR1yXA@mail.gmail.com>
	<CAMKF1spq0EWDJg8gL14SQoGZRu7e_PTV9YcEiqQ_jEQ4BnqK_Q@mail.gmail.com>
In-Reply-To: <CAMKF1spq0EWDJg8gL14SQoGZRu7e_PTV9YcEiqQ_jEQ4BnqK_Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 11 Dec 2019 01:03:37 +0100
Message-ID: <CALbNGRT=6Q8A-riLEmX4f=-q7nqeN-DjDxWLwZXMSOk=qz5QMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 05/20] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Wed, 11 Dec 2019 00:03:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2019 at 12:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Dec 10, 2019 at 1:53 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Tue, Dec 10, 2019 at 8:57 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Dec 9, 2019 at 12:37 AM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
> > > >
> > > > It is a dependency for upcoming gnome-control-center
> > > >
> > >
> > > This seems to have hard dependency on systemd ? or can it be
> > > configured without systemd as well see
> > >
> > > https://errors.yoctoproject.org/Errors/Details/296904/
> > >
> > > in case it can not, then we need to exclude it from parsing when
> > > systemd is not in DISTRO_FEATURES
> > For systemd not in PACKAGECONFIG it needs
> > -Dsystemd_system_unit_dir=3D'no' to avoid this error.
> >
> > Test would take some hours so my question: oe-core's master has
> > already removed python2 from hosttools and to be honest I expect huge
> > fallout all over. So my question: How much time do I still have for
> > tests?
>
> The python2 removal code is in my tree for few weeks, so your patches
> should be testing against that already.
>
> I have already built an image with gnome3 packagegrroups for
> qemuarm64 it went fine. So its looking to be making good progress
> thus far.
>
Fantastic! Due to the fallout I saw in my other layers (meta-musicians
has loads of recipes with old code using very old waf - or even worse
waf as compiled binary..) I expected a 'game over' once that patch
lands.

Anyway patches go out in a few minutes.

Cheers

Andreas

