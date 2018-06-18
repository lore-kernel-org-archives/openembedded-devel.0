Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id D0D05719AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:35:40 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id m21-v6so11603405uan.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uGe6/TRKm78LM+lc0MoJeXc0q3IQZcBDIOGiv5TXtGw=;
	b=LHN8dmE+p8W9KrB4M42LVCzWAC+FmB3y+gbWc/bj6+ewNBQK6NhOUY741zsUeXCO5y
	eUoMtKQMLRqiAQko1Pliiha+jowCD5/VLXhp8fld7thzTVLMHaKN22r8mH3Wgsy09/Yi
	nSf4LmyEn0xNbEO3aM6KeEWHZGQcJ7u8Q27jB0xOBEvGffFUBhFHby54PRjOlQhPmxfd
	NelLlJzk/CgEAGCua5ml2ZIJPxGLMH9rbzIPQUA5sfUoWUr/kw6BAoE3/FMfkyaQ8aR4
	aheQIkz9AQOQaJ5+ceWQVdHE3GWmH7tXYAXS5d725VFT+Y6AlG0QrHN1ewazY9ksrdpD
	YSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uGe6/TRKm78LM+lc0MoJeXc0q3IQZcBDIOGiv5TXtGw=;
	b=dx9OYn0IvhsKsSHpC9jkK9l4E4kY/fAUmGinzWAsI9EgETmQY1wpLTzHo9+3POLz+2
	3iy2q7A8evQZyH2iMCbGI0rwQQ8sBUgEVL+Y2sOOdRjyoipcFksTjH+265umJ57Y1R9Z
	MTefjZ2uG0zpUJp3uvvxiARO282KlzWVseaGYVhJt1z5ftN9mf/+045X6AA9DQKnautB
	T3AGa3YPVF7Klw+kLjNt4exvwILb6yhABmMCWVBTshP21t9zSY++YkZ5NwmuwGwau3Dt
	udTckvRk2JuieWUUeudMYp2lTjPlWllKyJLidij07Us60m6+F/VErScgv3S7t2u+Ly+B
	UMvA==
X-Gm-Message-State: APt69E1VrUPFmxqzSFZfekYWFsUVR+KKISWOw1scNsIMhpKXGNFUfCYo
	4r54t/aJwuhkHgjee+Uhou4YKOVWSCbWFgYCVmE=
X-Google-Smtp-Source: ADUXVKK03I77GBcPbLaoOIbsDzXhG8GOCS+nW/mggTY2BGIH3fX4AA6tiPUi/d7qtx7KvlG4qr5+4X7Sy/NPpOeipYw=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr9151269uad.49.1529354141630; 
	Mon, 18 Jun 2018 13:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
	<CAPuovELz+L+8keBVWYCjFnWPSGPoTf5_X_TZpyKuGdf9bea1fg@mail.gmail.com>
	<CAMKF1sp3Hhh3c3_xLkZ3EJHbS=fhOLk4EY+6BMzSGP+ZPHECNA@mail.gmail.com>
	<CALbNGRQej6Mf1WA-4FTBom_LJBj1St8Dxe4Cb+JL0CJu1copvw@mail.gmail.com>
In-Reply-To: <CALbNGRQej6Mf1WA-4FTBom_LJBj1St8Dxe4Cb+JL0CJu1copvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 13:35:15 -0700
Message-ID: <CAMKF1soLLQmphemcQZsum-oir_ODemTECrX0GJPRgDiCZTKH8w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:35:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 1:20 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Jun 18, 2018 at 8:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jun 18, 2018 at 11:03 AM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >>
> >> On Mon, Jun 18, 2018 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Mon, Jun 18, 2018 at 9:51 AM Mark Asselstine
> >> > <mark.asselstine@windriver.com> wrote:
> >> >>
> >> >> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see =
a
> >> >> QA Error/Warning regarding files 'installed-vs-shipped':
> >> >>
> >> >>     ERROR: QA Issue: thunar: Files/directories were installed but n=
ot
> >> >>     shipped in any package:
> >> >>       /usr/lib
> >> >>       /usr/lib/systemd
> >> >>       /usr/lib/systemd/user
> >> >>       /usr/lib/systemd/user/thunar.service
> >> >>
> >> >
> >> > perhaps this should be moved to /lib/systemd/system
> >>
> >> Possibly but really I had to go under the assumption that the folks
> >> that came before me and created the recipe and completed version bumps
> >> have tested it in its current location (which is a valid location for
> >> systemd service files by the way). So my intention was to address the
> >> QA issue and not change the overall behavior of the recipe.
> >>
> >
> > Thats fine.  Let me wait on Andreas to validate this approach.
> >
> >> MarkA
> >>
> >> >
> Strange I have build/run tested this patch for master and sumo without
> issues. Must have missed something. Will check on my other machine
> tomorrow what went wrong.

it did not happen with my builds either and my QA policies are same as poky=
.
so I wonder too

>
> Whatever the result is: Move seems wrong: All other user units I found
> on my system are at /usr/lib/systemd/user/

OK, that makes sense to keep it as it is.

>
> Andreas

