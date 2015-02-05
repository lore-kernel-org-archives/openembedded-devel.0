Return-Path: <ka6sox@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id D39AA60017
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 19:03:14 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id z81so8087704oif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:from:date:message-id:subject:to:cc
	:content-type; bh=f8EHTzJWqJYQr15fWKjVT/lXUtqtcphnyb5hS/+jscE=;
	b=sdCYN7hZTAjXk4huuWVEPIgnq05OVlhpTV8gnlPkeHh9Bh3rzLviFtel6z/2ynVWpl
	4jZArEDySPjH1ejTKcvAvtiBXUpBkpdHtos7R5cvopw7YPMQidXnLgRhyHrHhDm2HtSp
	5QTyb3kpwHEvQtQHVyfx800pv2AWkAjvdhtGnK1ClI1x2JnE6qL2OPdHnAR9BJu3uIaA
	tWxR5PP3yeE1YwFqtSbFOgQDRIKfyuCQaAZNFiGiGX6nGuxnTqvIrOENQXEc7Ro2OzLW
	1PyMPCqzT9Uisecyz7+yTZTlRBtEPhPiu2IQrjr1gVQs6ZnDvgG0E0uvqKE57qVrYwN3
	ADUA==
X-Received: by 10.202.59.131 with SMTP id i125mr3091546oia.125.1423162995476; 
	Thu, 05 Feb 2015 11:03:15 -0800 (PST)
MIME-Version: 1.0
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
	<CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
	<CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
Date: Thu, 05 Feb 2015 19:03:14 +0000
Message-ID: <CAHQecY68g7wjJMEV3ph3ZFqAH_tdQ0JcH1AkuJkgEwkW3rXu_A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 19:03:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

150GB

On Thu, Feb 5, 2015, 10:50 Ash Charles <ashcharles@gmail.com> wrote:

> Hi,
>
> Why clean the downloads directory?
>
> Roughly how big is the download directory after a world build?
>
> For gumstix, I maintain a source mirror on AWS S3 populated by our
> automated builders running BB_GENERATE_MIRROR_TARBALLS =3D "1".  If it
> would be useful to the community, I can see about adding files to this
> as an additional mirror.
>
> --Ash
>
> On Thu, Feb 5, 2015 at 10:04 AM, Tom King <ka6sox@gmail.com> wrote:
> > We have the BW, Jenkins can do the rsync from the World Builds (if we
> >  clean the downloads directory) and I'll have to add some space to the
> > Mirror Server but thats doable.
> >
> > Tom
> >
> > On Thu, Feb 5, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >> > On Feb 5, 2015, at 8:49 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com>
> >> wrote:
> >> >
> >> > On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> >> >>> -----Original Message-----
> >> >>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> >> >>>
> >> >>> I agree, #2 is the best option to take care of the older branches.
> >> >>>
> >> >>> Tom, can you please fetch the following files and add them to the =
OE
> >> >>> source
> >> >>>
> >> >>> mirror:
> >> >>>  http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> >> >>>  http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> >> >>>
> >> >>> I've verified the md5sums match the recipe:
> >> >>>  29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> >> >>>  e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> >> >>
> >> >> Good to know we agree on the best option.
> >> >>
> >> >> Could I make a humble request to speed up the copy of the packages
> to OE
> >> >> source mirror?
> >> >>
> >> >> We have a BSP layer that depends on this and currently our build is
> >> broken
> >> >> fetching crda.
> >> >
> >> > I've been thinking about this, and this is getting ridiculous.
> Instead of
> >> > manually adding files to the OE source mirror, I think it's time we
> >> simply had
> >> > a populated fallback source mirror that has all the sources for at
> least
> >> the
> >> > recipes in layers hosted on openembedded.org (if not other commonly
> used
> >> > layers) aside from OE-Core which is already handled by the
> >> yoctoproject.org
> >> > mirrors. This issue keeps coming up far too often.
> >> >
> >> > Is there a possibility we can set this up?
> >>
> >> We can infact setup a rsync from download directory of Martin=E2=80=99=
s world
> >> build jobs
> >> looking at Tom for help
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

