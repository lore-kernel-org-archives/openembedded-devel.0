Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFEC7FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:37:25 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id u10so14143977qvi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ImkDwyhOdk/p/8tfhO+klhgxQ2k2VfMUMv30xZ9SX0w=;
	b=k9k+UE48IuMPAoNoOAVLEP5/klH+EhUA1t49zHhm77biynrP2B/iIpGHTMfc6/pkme
	lNvPeQd0UKZ6nFgVjKjRKmlqTDZHck9aZ++WlnYIzhNrFeuDZ/v5C+kIHyWgH7+ey3ZP
	Od/Xh7PPVTwj0ZGUCzJj5HueB5sVIOIl6NhedY9W0JQidoaq4WLYbW0h3GaanT7ZFaP3
	5nCUE4BeLfjBgwE8LeflftZBDLOyfdK8YcupmOT2onmT5ihHpeTYDkb8fvfbmii9NGnn
	OuGWDBYFg7eXlpGxwyBV/rU98dEc4QuY7PlmduNJ0Xx2gEpR4R0HRjL5vGVAYWpveglj
	nS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ImkDwyhOdk/p/8tfhO+klhgxQ2k2VfMUMv30xZ9SX0w=;
	b=hM/Jz6X9pj9u8RFxQRiYovVkgUHmx6JT7Naj80v/Ds2boOt+U6dbWHa/euPKfe1nkK
	q3qhOg/GTkTcrDF62qhqB5yuOIdJs3dB2ZL+H1NbY8hsq2m9hcMEa8VaXX24lFba4tEV
	r7r1h0LjcNc68br5gS3WPvjaZLK87SHwHKF/ZnoUA9bCsy1UtTKSf0Rk7sisdmmBOzUx
	XgsFhLQAsHVLMwZBI6rQ9FRXh7O0yITnn80G9jcFNX68D41O4QAsKuBi96z4tsIGLfkf
	A5eQmbLvSeY83lz6BbBLU8JlzjHwjfSzwhZNO/y3pUmHJpBCTuNzcjbe0K9bj663Z0kJ
	/CuA==
X-Gm-Message-State: APjAAAXtEncnKKoXksR9MhdpflCip6YilwvhRbM1ucjG5hleErdmttiY
	EjUWhjwripHuJ2VUk7DmqW1rVyh8M2rQeNnbTVRhypPU
X-Google-Smtp-Source: APXvYqxqAAj3eGKu9DR0mRUrBBPKLNdPydt8AanpOHBcZoOuTlvwoUt1UVSEwvob1/o8JIGfBk7432+wMqXk2QjktVc=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr275343qvo.55.1579534645861;
	Mon, 20 Jan 2020 07:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20200120003527.1518697-1-raj.khem@gmail.com>
	<20200120003527.1518697-4-raj.khem@gmail.com>
	<20200120142025.7ee3bc42@opendreambox.org>
In-Reply-To: <20200120142025.7ee3bc42@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 07:36:59 -0800
Message-ID: <CAMKF1sq_Zqf520iuoLba5dW7_XcZhoRFwzt3yhpnorcSF4sDMw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/5] meta-oe: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 15:37:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 20, 2020 at 5:20 AM Andreas Oberritter <obi@opendreambox.org> wrote:
>
> Hi Khem,
>
> On Sun, 19 Jan 2020 16:35:26 -0800
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > diff --git a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> > index d00d1e2a08..ab657e6f08 100644
> > --- a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> > +++ b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> > @@ -4,7 +4,7 @@ SECTION = "devel/python"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
> >
> > -inherit setuptools pypi
> > +inherit setuptools3 pypi
> >  SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
> >  SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
> >
>
> You added python3-jsmin in patch 1/5, so you'd better just remove python-jsmin.
>

yes right.

> > diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> > index 0cbd07f666..af95e327c4 100644
> > --- a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> > +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> > @@ -5,9 +5,9 @@ LICENSE = "LGPLv2.1"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
> >
> >  GNOMEBASEBUILDCLASS = "meson"
> > -inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
> > +inherit gnomebase gobject-introspection distutils3-base upstream-version-is-even
> >
> > -DEPENDS += "python glib-2.0"
> > +DEPENDS += "python3 glib-2.0"
> >
> >  SRCNAME = "pygobject"
> >  SRC_URI = " \
>
> Rename to python3-pygobject?
>

yes

> > diff --git a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> > index 901fdc7637..67488acd33 100644
> > --- a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> > +++ b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> > @@ -4,7 +4,7 @@ SECTION = "devel/python"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=030b09798681482b9ad12ac47be496ea"
> >
> > -inherit setuptools pypi python-dir
> > +inherit setuptools3 pypi python3-dir
> >
> >  SRCREV = "425bdeeb2d87c36e2313dc4b8d69ff2bb5a02ee9"
> >  PYPI_SRC_URI = "git://github.com/trentm/which"
>
> python3-which?
>

which is py2 only there is which available in py3 already. I will just delete it

> Best regards,
> Andreas

