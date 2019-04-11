Return-Path: <ticotimo@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id 61B1A7D8F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 01:03:30 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id n4so2514566vsm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 18:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kQE0pb3g2AQ02ravq5I1L10DdyWzKyPUZXpErwowbYk=;
	b=EGSsF5nN+FnsauhgfbAv++It+m2LA4bTiFIY3j3YRNZkTyJExPhby+8RDOOCkFCnq9
	F9/XA6rKVCgC3a6r/d7Z5SVd4OEHzy6d+QmDcPZuLnVu01Jr9ecRtwmVnrwyYXgkwYz1
	qRI3baCOiSrJkODgHN1bf4fmH1a14dSQJprw4DD/Xv5sXgtPW80Aqts6b8QjKdKQaP0m
	FQQj7W2HsS8gmjAe2MYRxadc9AZHl6a/dw4kk7uUugduU+nvvRY3Rni5yT7p6Zf7hkCr
	tYJpr2MmkdX/Bm4VhS5z6Aplwo7HO7EDceytxrjAlAbu+JOALcW+6kAr5mHZVCF6dJBw
	byoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kQE0pb3g2AQ02ravq5I1L10DdyWzKyPUZXpErwowbYk=;
	b=oZtQoa1OrUIEJikqnc9U1JL8V6Y8LF2zAQ/OkMOxbb/aK43rffdY238ECdHFRum4bp
	RxytMgEodQy9Iyt5MuqjOnmCO1FWpT0KB+A38Cl1TJrXLLLhEh52VHLfbOsAHAMAFL5j
	SQF+fBdU8AyOzw0KhDt3ngi0Y4eSW59x3IhZ4sG8jbvwtXyNFgLqcI8LUIyL6IBIfx8b
	ZkLe6EKpGkdmL+C49ZMn72sRq8s5/vZnqHffmGCOuMrBecd7ID2mn5tR1H7376UCbksm
	aLeppPudY1HCfNwGSa4SVN3Rg9oj1/iuh9EyV0a6aOfjWQIRs7+V3Der7qbzEdv/tWoZ
	drjw==
X-Gm-Message-State: APjAAAWswtDmTmg7LxoOUQoEM2Cc5Iy1Pk11QhnZ2XVN3KviD7mOYSTg
	BRhcJtPLzjODbUiO2jue/1pxdvhtddxUYTPJ9YQ=
X-Google-Smtp-Source: APXvYqyfNcLNedLbm+EYyb4xbWzJnsTs5DqtMA+W/LtV0ZQCgW+YAa7oGABxO2UuNti+rNvbejJMzZ0+zlHXXeak4ho=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr27347809vsd.56.1554944611065; 
	Wed, 10 Apr 2019 18:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <d5eb2bd0-173b-79b5-922c-a1f0fa097552@balister.org>
	<CAMKF1srN+kBat8eKj_tw_7y_pv3zWWjAu92L0abCYQFSnfGXcA@mail.gmail.com>
	<20190410194007.3hs4efbdwg5z3lei@jholzmayr.localdomain>
In-Reply-To: <20190410194007.3hs4efbdwg5z3lei@jholzmayr.localdomain>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 10 Apr 2019 18:03:20 -0700
Message-ID: <CANx9H-ATiUjhZ9dmMbk=hJEfAPDQDjTCO46AOGqVrA=ouavYWA@mail.gmail.com>
To: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Scipy, this never ending thread must end
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
X-List-Received-Date: Thu, 11 Apr 2019 01:03:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 12:53 PM Josef Holzmayr <
holzmayr@rsi-elektrotechnik.de> wrote:

> On Wed, Apr 10, 2019 at 09:05:19AM -0700, Khem Raj wrote:
> > On Wed, Apr 10, 2019 at 8:27 AM Philip Balister <philip@balister.org>
> wrote:
> > >
> > > Over and over people ask about Scipy.
> > >
> > > I've built lapack and created an image I could natively build scipy
> with
> > > before. Since FORTRAN isn't normally built, adding this recipe to an
> > > existing layer isn't a good idea.
> > >
> > > I'm going to create a layer meta-fortran for this recipe and then sta=
rt
> > > collecting the wisdom of the community to create a scipy recipe.
> > >
> > > Does anyone have a better approach then this for creating a scipy
> > > recipe? I know people have been really close before.
> > >
> >
> > I think this is a good idea.
>
> +1
>

+1
That would also possibly enable R language.

>
> >
> > > Philip
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Josef Holzmayr
> Software Developer Embedded Systems
>
> Tel: +49 8444 9204-48
> Fax: +49 8444 9204-50
>
> R-S-I Elektrotechnik GmbH & Co. KG
> Woelkestrasse 11
> D-85301 Schweitenkirchen
> www.rsi-elektrotechnik.de
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Amtsgericht Ingolstadt =E2=80=93 GmbH: HRB 191328 =E2=80=93 KG: HRA 17039=
3
> Gesch=C3=A4ftsf=C3=BChrer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
> Ust-IdNr: DE 128592548
>
> _____________________________________________________________
> Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
> Gesch=C3=A4ftsf=C3=BChrer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
> USt-IdNr.: DE 128592548
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

