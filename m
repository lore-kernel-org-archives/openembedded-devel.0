Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8550860BDA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:28:51 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n21so11928446ioo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 09:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OZJigvB9j8j+MgnDGFJe2w0JHMRq/tE08KlzMtZ2Z3A=;
	b=RsrnMFuey/tbcFjl6QG/z3CE4m7xhzjY+gZIomJFRbn7Pk2iCENOaVoCPf/0rpJ3+h
	5fAXB2Z2N7pvVgVocw/n5/r/vDmxZK0QFuAFipPN/n4MMB7ZGna36mBZ55Kvt0ShbVOX
	fuBQAoTAUV0Ta7Wy3qyDoT5CF1XyO+MVWAtx25mlj8uk0Mv6crWHuRgsda5x4Pj3WsjI
	WQ8h5Atlh/db7cZvKfkcbijwuI1dCuT6yPzRDXWJLdhpqYgTQE+CeWvZwJu7BPk6eBIp
	4rvza9mc4PsL8nPNbW6Rj8MkQn6vbw3gYs1SvdF7z6VbWarDOPSKpoFM8Ca8m+4s3RvO
	6ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OZJigvB9j8j+MgnDGFJe2w0JHMRq/tE08KlzMtZ2Z3A=;
	b=XSe+q7nusoOnWOrzMn2/1rMrm7xEBxljZSdNPOTNvzRK3yR3a5b3a8U/OCjL8X5ej1
	vFqXXCWysZuB16oXW5Lo37s27TIwT9rREHhCCH3w6ZUCLFJYcp1n83elR5WLqWGmY/NW
	FB4QtbvKm7rWdqoEPf0FcdhWD/Uvw10rLeIKFsJ9YeUwcKqYIvbVXK1obbr1tCTmUISr
	LfXjhRsYU1DiGsa4h+ee9BhXkmsHx2VanVDS39Ehe7wLLdLI+NVt6COAZHDhUN68lE3D
	aCDqSCKeJN5qPxluZnlWMGZ21ZCFo8O2KismVW3Fnh0OLTpCniPmYTGlBmOisMH6Swjy
	oN3Q==
X-Gm-Message-State: APjAAAUOCSMo9+9NigBkQ5YGAizfs8syo/3m3GT4cYTpOa6rrkU86hPr
	BVpe44IxCyAgbrT5owe8N6viMh/FdAXZnXmv96c=
X-Google-Smtp-Source: APXvYqygXxxUPJ8cYY17t2VlEwycjLIHMGzIO4deO/o+9ArCrPB+stG4Iv90lbZnQOaODPFC1pn2KFrwkuUj7NhX3ag=
X-Received: by 2002:a6b:b206:: with SMTP id b6mr5957199iof.299.1580578132464; 
	Sat, 01 Feb 2020 09:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
	<20200201163703.4264-3-schnitzeltony@gmail.com>
	<11ab5995-8055-2b57-caa9-93cabab79be7@windriver.com>
	<CAMKF1sodecN8LizT+VqpEECVTDd3JvpaX_LPdx4uMVfa_O68pw@mail.gmail.com>
In-Reply-To: <CAMKF1sodecN8LizT+VqpEECVTDd3JvpaX_LPdx4uMVfa_O68pw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 1 Feb 2020 18:28:40 +0100
Message-ID: <CALbNGRTBmuD+m9gMrKv442L3vqu9N9pDxZxYDLA4ScGT77Neow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
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
X-List-Received-Date: Sat, 01 Feb 2020 17:28:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2020 at 6:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> I have fixed it already locally.
Thanks
>
> On Sat, Feb 1, 2020 at 9:23 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > Typo:
> >
> > Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
> > should be:
> > Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.85.0
LOL I have at least on like this in my series'
> >
> > Thanks,
> > ../Randy
> >
> >
> > On 2/1/20 11:37 AM, Andreas M=C3=BCller wrote:
> > > Release 0.85.0:
> > > core:
> > >   * Fix case unsensitive search for Deseret and Osage. Issue #853
> > >   * Fix crash in unicodeToAscii7
> > >   * CairoOutputDev: make initialisation thread-safe
> > >   * Fix crash on broken files. Issues #869, #870
> > >   * Internal code improvements
> > >
> > > qt5:
> > >   * Fix FormField::name encoding
> > >   * Accept UTF-16 uiNames for form fields
> > >   * Fix search for "complex" characters
> > >   * Allow to load document from QIODevice
> > >
> > > utils:
> > >   * pdftoppm/pdftocairo: Fix -e/-o printing the wrong pages. Issue #8=
73
> > >   * pdftohtml: Fix issue with the font size sometimes being huge
> > >
> > > glib:
> > >   * make the frontend initialization thread safe.
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >   .../poppler/{poppler_0.84.0.bb =3D> poppler_0.85.0.bb}          | 4=
 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >   rename meta-oe/recipes-support/poppler/{poppler_0.84.0.bb =3D> popp=
ler_0.85.0.bb} (93%)
> > >
> > > diff --git a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb b/meta=
-oe/recipes-support/poppler/poppler_0.85.0.bb
> > > similarity index 93%
> > > rename from meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> > > rename to meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> > > index 5153868b6..857b67ff9 100644
> > > --- a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> > > +++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> > > @@ -7,8 +7,8 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar=
.xz \
> > >              file://0001-Do-not-overwrite-all-our-build-flags.patch \
> > >              file://basename-include.patch \
> > >              "
> > > -SRC_URI[md5sum] =3D "e14a8aca8809908ad4364c32c17bcb92"
> > > -SRC_URI[sha256sum] =3D "c7a130da743b38a548f7a21fe5940506fb1949f4ebdd=
3209f0e5b302fa139731"
> > > +SRC_URI[md5sum] =3D "5315084523a4d73e9514f51eef78a332"
> > > +SRC_URI[sha256sum] =3D "2bc875eb323002ae6b287e09980473518e2b2ed6b5b7=
d2e1089e36a6cd00d94b"
> > >
> > >   DEPENDS =3D "fontconfig zlib cairo lcms glib-2.0"
> > >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

