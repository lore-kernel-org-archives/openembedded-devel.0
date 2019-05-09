Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A47CC7DE94
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 17:05:12 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id a17so2099686qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e3MWoyRhdSh2i4zEWMpePdFoPRwDNbJ7ZtF1y5CkkQE=;
	b=tCUj+BAB5u/VJzP6AY29C9JMJTA9jWLii21D4aa6Hgrc7xGwzvG7MjVww070CCBVvB
	3HxGrBFllY16prHEarlxoXqXV1oAAaLJw1agWqKUBR+dVAX9MHOfTBxS//p96WLzwHDc
	zhfk0uF3Ias2TbTRygR/Ie/gdBhKfFvoDbLGgKPXTximLgFqXNigOpbpQ3hlNb7diJON
	AY/nZ7mL51B3536Roo5/q7YQbO9frpTO2yUOBTTQsGL9dWRLH9rfsezKeuIDWW9qMd5v
	ITYXrhkmm2jIqoDckZbFjs5VpZDRzQ+MO5K9YRiXFDhVNqhnhVapy0tXcMaATzQNywNI
	K+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e3MWoyRhdSh2i4zEWMpePdFoPRwDNbJ7ZtF1y5CkkQE=;
	b=Q7t7CCN+P6XfKQs/hQIhbiohEYF5E460cjR2c/fx79nChZpMuwGkIe7BCVZUY3n7Qb
	ocOISiE41c1eghwvVy5qbZQWwEetu500H4UNIValtqpya4KOc/t3CLVpuW7kUpMozCX1
	fT+J5xLLmaajlc8rQe7UZ+c+6OuG+DRdhdgFwxAvYv93clkPhZS24p3Ul6MuKORXin4+
	aS5xCS4UN93jGhNn6ZSWjz4MCMRObJxmsPpzJOrbbizt6tS5CPYNfrdJ+U787e5Fr+Fq
	ktSP9pg28sOJIycTXy7+7EXhImVTeuvys+1NMpUfmoyOhcgc5XzIhdPcycu6J5ci/fkv
	eFIg==
X-Gm-Message-State: APjAAAW41V17H2qSiQ+28ItwmWyR8xeaVZqgYttniaMaqkSeHURuM69O
	mkS7F3p+WqbJ5iT6S75bO+6dPP7b8LWq0VCzCGQ=
X-Google-Smtp-Source: APXvYqwshVG28BiRx7Q7Mck+J+u5A/Vnb1JnkB7i3Z7XppB6mjVNSdbAilG6raNhLbR1Pf9NY19GJbzsTDhCBaWc9Ww=
X-Received: by 2002:aed:3827:: with SMTP id j36mr4667387qte.196.1557421513151; 
	Thu, 09 May 2019 10:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <155735130373.6243.13450815632034893448@git.openembedded.org>
	<20190508213504.26FC4234A1D@git.openembedded.org>
	<CALbNGRRq5NnZ0GXihZU=kNNfBjOUg6Ep83eM8A7FTDWhkpACaA@mail.gmail.com>
In-Reply-To: <CALbNGRRq5NnZ0GXihZU=kNNfBjOUg6Ep83eM8A7FTDWhkpACaA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 May 2019 10:04:47 -0700
Message-ID: <CAMKF1soa-y+rgri-izajQtVrdbBycpQ+oqeLfqfNdD95DuVz6g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [oe-commits] [meta-openembedded] 04/06: fluidsynth: Explicitly disable readline support
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
X-List-Received-Date: Thu, 09 May 2019 17:05:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2019 at 3:41 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Wed, May 8, 2019 at 11:35 PM <git@git.openembedded.org> wrote:
> >
> > This is an automated email from the git hooks/post-receive script.
> >
> > khem pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 07f0d6fed45f6f6148b5e6634e543c9fff0e1fbd
> > Author: Adrian Bunk <bunk@stusta.de>
> > AuthorDate: Wed May 8 22:58:51 2019 +0300
> >
> >     fluidsynth: Explicitly disable readline support
> >
> >     readline is GPL, so make it explicit that it shouldn't
> >     be enabled accidentally.
> >
> >     Signed-off-by: Adrian Bunk <bunk@stusta.de>
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_g=
it.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> > index 4f600a2..9a8cb87 100644
> > --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> > +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> > @@ -8,7 +8,7 @@ SRC_URI +=3D " \
> >      file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.p=
atch \
> >  "
> >
> > -EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('ba=
selib').replace('lib', '')}"
> > +EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('ba=
selib').replace('lib', '')} -Denable-readline=3DOFF"
> >
> >  do_configure_append() {
> >      make_tables.exe ${B}/
> >
> Have to be more clear here:
>
> NAK
>
> It removes history functionality from fluidsynth console. This is
> extremely useful for benchmarking because results vary and entering
> same commands over and over again is just tedious waste of time (did
> that for the NEON patch)
>
> Unfortunately this code is part of the library so just not installing
> fluidsynth-bin won't help.
> So pleaaaaase add a PACKAGECONFIG for this (with whatever default - I
> am tired of strange priorities in here)
>

dont worry too much about master-next, as its a CI branch mainly. I
pick patches for all layers and throw it at
autobuilder so we can get some build results while review happens on
mailing lists. I remove the patches which
get review feedback to address them. This is due to the fact that it
takes quite long for builds to finish so pre-emptive
cherrypicking helps a bit with process.



> Andreas

