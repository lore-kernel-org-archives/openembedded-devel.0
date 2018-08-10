Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id C5F0D74C1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 21:54:00 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id r21-v6so11911583qtm.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jD5nRhL4XKqrzau21nIFTlFEYlwyCxFm6o8mER8XO3U=;
	b=lZKluygb7agoeAvuczhO3fSBU4HCXS68UbsIsNzBWDCRLTHT2riY5te7YU4ZmXSqVh
	+rhBBGbxk5UtYNLuApIV5esnKtK7ZReAf12jotLIZ23XZazqallH3eLE2Hq9wSshm4LZ
	OMBZmFmJC4cTlwG9Qje15TlpF0DEEWu/lCNgFfvP0NZZOz45lh8IyDi6RoJX545tksac
	izfdfcxwyVoriKtGXYb3l2boBUxfVyG6ISoXNUCmiZRzvsdpoSQjsttb4LeFq/FuX02B
	i7NRr9Xj8kOnmVDXP/xVMxV9k9LgxpHro75cvCZCa1vRuDi5vMO6uaEDsNs7teLbok6y
	qPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jD5nRhL4XKqrzau21nIFTlFEYlwyCxFm6o8mER8XO3U=;
	b=sUdjlKDmNuBBceX/5zgMISd5BW1MNMnWmdVDVR5HUveMEMBvIavDq/1HHHpC1yElMT
	wBn2nCKrVofGMC+hTVPnF6aI+/FSkWi9aDSx7QxDgQd231gqTkeXykATuLt4uCb1gDkf
	7RDqBXAeNxxB/MIAeC/H1CPsxVbPdOGmhLuOaNpyDywJPZlb2MlNgmYLYXb00U7wIdcr
	vZZjNStKkGRAX/LoxlfcYRlVWybsRnOCPy+Vum/4rGcqtS9ha4gizyuFSGxxHptIARul
	sLYMyoGqitCEtWBXD9DEL6IzAXHMttBR5aw+NnYwF7APagf1uLBtueE2RqZTU9xf9U1o
	S7PA==
X-Gm-Message-State: AOUpUlFQl02fOXGAsM8SYji+soDMpfj5amAjG8reK7N8hDbYInnHhe76
	8nuoDZdbQCj5i8eRUHSdqISjyNBd7qFEOPLqYRA=
X-Google-Smtp-Source: AA+uWPy3SFxvhrba6YUDRYEms1owOl4vIIQ3ovvfsrdj8u+as0/1vDm0tO3hTVqKRwTvG4CdmlshdzcPVH6o24LS8U4=
X-Received: by 2002:a0c:983d:: with SMTP id
	c58-v6mr7452105qvd.221.1533938041422; 
	Fri, 10 Aug 2018 14:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <1533682863-25087-1-git-send-email-alex.kiernan@gmail.com>
	<CADseiPmto9xeXiAmpGQ88GksoCw0qjgJzhjC=VFaxCksYdAExg@mail.gmail.com>
	<CA+chaQfT5qC=3L4jNVS6pUHg1Us5Mg26xK9s0F+sO5oHFOjE8w@mail.gmail.com>
In-Reply-To: <CA+chaQfT5qC=3L4jNVS6pUHg1Us5Mg26xK9s0F+sO5oHFOjE8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Aug 2018 14:53:35 -0700
Message-ID: <CAMKF1srUwgnsx0B2N2KhDDrn_mDVGhN=PG5vnhvir4KDZf3n0A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	alex.kiernan@hivehome.com
Subject: Re: [meta-python][PATCH] python-m2crypto: Move swig fix to configure task
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
X-List-Received-Date: Fri, 10 Aug 2018 21:54:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 10, 2018 at 2:04 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Depending on in which order the changes are applied you might want to
> remove CLEANBROKEN added in:
> https://patchwork.openembedded.org/patch/153208/
>

I think we need a V2 of the above listed patch since Alex's fix is
right way for this recipe.

> On Fri, Aug 10, 2018 at 10:52 PM Ian Coolidge <ian@boundarydevices.com>
> wrote:
>
> > Thanks for this, this fixes that recipe.
> >
> > On Tue, Aug 7, 2018 at 4:01 PM, Alex Kiernan <alex.kiernan@gmail.com>
> > wrote:
> >
> > > From: Alex Kiernan <alex.kiernan@hivehome.com>
> > >
> > > Fixes:
> > >
> > > | DEBUG: Executing shell function do_configure
> > > ...
> > > | SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
> > > | error: command 'swig' failed with exit status 1
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >  meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> > python-m2crypto_0.26.4.bb
> > > b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > > index 272c76c..7e22163 100644
> > > --- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > > +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> > > @@ -27,7 +27,7 @@ export SWIG_FEATURES
> > >  # Get around a problem with swig, but only if the
> > >  # multilib header file exists.
> > >  #
> > > -do_compile_prepend() {
> > > +do_configure_prepend() {
> > >      ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> > > __REGISTER_PREFIX__ | grep -v __GNUC__ \
> > >         | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> > > SWIG/gcc_macros.h
> > >      if [ "${SITEINFO_BITS}" = "64" ];then
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

