Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.8064.1626076613128412596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 00:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=PI3puN9A;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.47, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f47.google.com with SMTP id he13so32793046ejc.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oElHkz+0KZNUuJ4mGSplIKJWdOFCll0dEbfxESKL9O8=;
        b=PI3puN9AMz17GuiXg7t05Z5Ei6tEfDEMBrNJe9bwLKQ6DW3gsBascREnjecBSULZKM
         L/1cO7of0LtSQGhdQsBs6TiD6RBDcQRei3gkWOG09s8OIE50ByFmPZaVSewQAqKb9HKp
         QF6RYPDYUi01uOsM92aKb+8MnEV24xSNPamHVQrPHoD9bpLPShAbyJ8oofQ87e2L/6y7
         t5eWIOb4vdimY2wL+cypuPE6KAqP4Jv8axs1bQIUrnXzAZVSvhVGmt/7UsOwjagVdJGR
         YISDrvHZDkw33Zqim5zE6+fMtv4I0WvMOxZ/d2WhPxLQUrNi4NoeGamvVf13VlATg3uM
         lAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oElHkz+0KZNUuJ4mGSplIKJWdOFCll0dEbfxESKL9O8=;
        b=W9Y5EAO4uHMnCmn90gNvAz5Mz+RiFalpS+d1VZGrkvQKlPMYo8yBFM5QzRHy1X0rbr
         kynT76PLBVQFMFlrNEbQ5KoEiYkYZzMkdzkinPGSlV2ExkNfPVZPUkIDFPbbnr+FbZ6Z
         qjmeV4woTwqKbgEstTiQJke5fkjQqRHk877Pc9sfLb672cq+4oVAD/i/zRFBKKiD7+Sd
         QxS9LJM5uD3ZK7gk6t4tGYbJw60QqTHYztuNdQiqEYf1VpVhhUgsSLV8HLsjuQmDhVuT
         7wEkeUvKXInejXyPetiK/+yqSAHI9CUco9XIAF5YATDDoU5s+/zsVBbYFXAcsdxjDsBl
         AzCw==
X-Gm-Message-State: AOAM533vljsjtNGLgs9z1QBtZhwKGcGzlUFr11ZLFiqLxGpnmTbiywMy
	DaFVompqrwMQFUgHhWmsf3exyT+nAOFqM7vaIgvQFw==
X-Google-Smtp-Source: ABdhPJzWfs1VtUjeERlwI75xxZk5UVuQ7kwlzgjcAnmggYSBKMwcK07SrSY/MT8SuqnjNQ1GM3Hw8mL4SL6TpIML0hE=
X-Received: by 2002:a17:906:1703:: with SMTP id c3mr4077509eje.64.1626076611487;
 Mon, 12 Jul 2021 00:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210709143957.2758-1-brgl@bgdev.pl> <CAMKF1sqxroHisqNVdSWnMs4nRt5mtU4dHQ_cqrbQLyAK0i3+Kg@mail.gmail.com>
In-Reply-To: <CAMKF1sqxroHisqNVdSWnMs4nRt5mtU4dHQ_cqrbQLyAK0i3+Kg@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 12 Jul 2021 09:56:40 +0200
Message-ID: <CAMRc=Mc=ALAHWjSZNHE8JBqmLGfr7AyhVvKj+FHTm9dp1QPCPQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-joblib: new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 5:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jul 9, 2021 at 7:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Add a recipe for joblib: a set of tools to provide lightweight pipelining
> > in Python.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  .../packagegroups/packagegroup-meta-python.bb   |  1 +
> >  .../python/python3-joblib_1.0.1.bb              | 17 +++++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
> >
> > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > index 9c44d38ce..72ca86b04 100644
> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > @@ -196,6 +196,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
> >      python3-jdcal \
> >      python3-jedi \
> >      python3-jmespath \
> > +    python3-joblib \
> >      python3-jsmin \
> >      python3-jsonpatch \
> >      python3-jsonpath-rw \
> > diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
> > new file mode 100644
> > index 000000000..4e63b056c
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY = "Joblib is a set of tools to provide lightweight pipelining in Python."
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b289008fb813a27c9025f02b59d03d"
> > +
> > +inherit setuptools3 pypi
> > +
> > +SRC_URI[md5sum] = "9914b330916395c0a1feca54949867a3"
>
> We do not need md5sum
>

I'll remember in the future. Can you fix it up when applying or do you
want me to resend?

Bart

> > +SRC_URI[sha256sum] = "9c17567692206d2f3fb9ecf5e991084254fe631665c450b443761c4186a613f7"
> > +
> > +RDEPENDS_${PN} += " \
> > +    python3-asyncio \
> > +    python3-distutils \
> > +    python3-json \
> > +    python3-multiprocessing \
> > +    python3-pprint \
> > +    python3-pydoc \
> > +"
> > --
> > 2.30.1
> >
