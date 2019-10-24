Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE3017F990
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:46:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id u22so37577894qtq.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hpNIVJX+fFeVtAkcriyskElAsArT+INClnZ68WzNgyE=;
	b=JQjnJWztq4OPZyOyGV0LTkI81gQHhwaqnn9UpD4XfNnej46tsBuN2ev9bK4wm+ULWF
	2MVE7i41DIsBaPXRNZsyK/CXNg+D2mgOgcXHy0vd/cv66m8AhRGazRf5Bh+QdUzqGaOo
	l+ay9fa7p+4kCXcre9QHwmaDOs4LZOj3KMYckq2gQGPSoq2Nu3XHf8AQrm6EqL6l7aD6
	xzO+4f7tZFBFR6X6DqONwgFcfKB6X3bLOn4K6P4rW1Yy6oWa7n/bQ5gyhhKq6CinUByy
	ioH1dZE2p+8HPv4z980tHwYovaME41xGjPTOXI28s8Ll6ymcsJ1iJph0r9c/yIBf1zRE
	8q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hpNIVJX+fFeVtAkcriyskElAsArT+INClnZ68WzNgyE=;
	b=kREEhJ0nuAc7DecywAC780k9H79Y5K/CBzvJRmdJqPaBeCcvJ2y/HY3Et81wl8JFjF
	MmC8+aV2Fvrxw2gJUEIS4IT6ZsVfWahg5kxGkfeW5YnAQq/R8HLamP+1rdpT+wDqAUFZ
	3wM2o+/1puFrKG2K6Ven0YgqN4TVVDf3ORKgNjt7yx+Luu5FI2Rwy1SjzMfsNixdzvFM
	hKQxrniWhOIu92F9hbITP+jqjFFZQjlr2gumG91mEy8dcnKa/nBNnh1igIs/vxQyKZYS
	P675CTjdFFY3EIkS/glI3MhvJeg55s7yJVAWkEsLIgWBO/HVIkh49okudV01fRsRgBuL
	Waxw==
X-Gm-Message-State: APjAAAVpzyraOc2t3VnbQKQ2PyGeGUCPXsdPQ8rdzuhz8l8gPx3BAdcS
	zyFmvKbinUnJ0rYbqOKIYw2dEkgGQI6nKAcDAJ8=
X-Google-Smtp-Source: APXvYqwtN7x+NN8zriwbmAtvpRl5o1zcU8VJgofaJCLoaIkT299M5vdewjLrQiOstaRR4zO5C6gWB4Xqado0rLtn+YM=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr3955263qtl.53.1571921189107; 
	Thu, 24 Oct 2019 05:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
In-Reply-To: <84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 13:46:18 +0100
Message-ID: <CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
To: Martin Schwan <m.schwan@phytec.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Thu, 24 Oct 2019 12:46:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin

Thanks for following up on this usually patches appear on
patchwork.openembedded.org and I pick it up from there it seems either I
missed it or it did not appear on patchwork

If it=E2=80=99s not staged in master-next and there is no response to it th=
en it
went missing I am traveling these days so a bit sporadic on responses I
will check it next time I am near computer and stage it if all is ok

Thanks for your contribution

On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de> wrote:

> Hi,
>
> just wanted to kindly ask if anyone had time reviewing this patch? This
> is my first patch for this project, maybe I am missing something. Is
> there anything that stops this from being merged?
>
> On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
> > Waitress is a pure-Python WSGI server.
> >
> > Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> > ---
> > Changes in v2:
> >  - Fixed missing "K" in "LIC_FILES_CHKSUM"
> > ---
> >  .../recipes-devtools/python/python-waitress.inc        | 10 ++++++++++
> >  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
> >  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
> >  3 files changed, 14 insertions(+)
> >  create mode 100644
> meta-python/recipes-devtools/python/python-waitress.inc
> >  create mode 100644 meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-waitress.inc
> b/meta-python/recipes-devtools/python/python-waitress.inc
> > new file mode 100644
> > index 000000000..732c31dbd
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-waitress.inc
> > @@ -0,0 +1,10 @@
> > +SUMMARY =3D "A WSGI server for Python"
> > +DESCRIPTION =3D "Waitress is meant to be a production-quality pure-Pyt=
hon
> WSGI \
> > +    server with very acceptable performance."
> > +HOMEPAGE =3D "https://github.com/Pylons/waitress"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "ZPL-2.1"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27a6966b2"
> > +
> > +SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
> > +SRC_URI[sha256sum] =3D
> "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> > diff --git a/meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb
> > new file mode 100644
> > index 000000000..26a628ea0
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools pypi
> > +require python-waitress.inc
> > diff --git a/meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb
> > new file mode 100644
> > index 000000000..83c8b66d8
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3 pypi
> > +require python-waitress.inc
> > --
> > 2.23.0
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

