Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 597D67FA5D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:08:55 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id e66so1047886qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 02:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nZPnQzgdS7wiH+g45jydgY2tpOoYySKmGq8KfheQwIk=;
	b=HyslE71Btjep/Tp2RXf33sCpkvdSrF6qK8dgjB140AcChrIWMpQyeiF6RxUGDjSy/s
	TiGQRMgZdb5fEn53XJ6rsvJwrEaP2ugO+eO4P38g8bQlilP7PpcDYc/YdFx2p4Lo61vL
	gMrbsaFT9rUjJv1TkbeMM+3/4corgYbTaOsYcEF46iYrZzfZjqUNjfFd/ZRMkBOYekG+
	fyWImgT6Vkud5uxJ3Do7vzVTZa8Iknl6lVn8OvZdStaUgxgKh2fMhCB5NvRyzo6JvdUq
	NoIzHiu2jVeXN13rQ2cnZbKhaGloVTPyjdcDM/Tb6rmr2FX2zHqItYP5onM3PEIDbXta
	sLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nZPnQzgdS7wiH+g45jydgY2tpOoYySKmGq8KfheQwIk=;
	b=UxJ0yKIRFF5KbEZkuL+jFjOCmle/7DyVu2vtIbCwDPBGb8QQkjH+0aLiPqKewoviEH
	Ai/sVLJPOuWEPUL9ASLIEzP83h2lIprwXvrvYM5fssdeH0/njW4nZvLX5f6OrREwsP/r
	/oVUxorM0dljNpP166ikAD9z1xgtdu3OYMR6+2KKH88/x1h3D9mip2sz6D0zrkwi2O8Y
	hl/0UPlrGVbIr5kMBGIUYZxtjZ3ZgGTPn/ffAADaZ2OABU0ijP5l1tStiA+J/lgULrSg
	kNw9uTiiQDgvOBcMVZ9y2EInwzlwmWdttmVhhlumV5Jui4i+etwESLIGQSdZ5Krs1gfY
	bIqg==
X-Gm-Message-State: APjAAAUSeRXdituG3B7CMWWZgTYr65ItM/LHNZ2dIO6Z4ZwIjFQWXpWM
	Oht8UBLqgtePkTsKMR+cvdsWkwNQqfpJMXTPNnKWdmBrxNI=
X-Google-Smtp-Source: APXvYqwThTeTMAJRFoOP/HRfNggm+G5XOTcyd2V2oV1YGNTQ8ES198uH4/YRfIBhkd6hd1LKCMMqoP0rmRaaG2KL93E=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr2011365qka.474.1571994535728; 
	Fri, 25 Oct 2019 02:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
	<CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
	<CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
	<9254d78a3ffd70fbda4f7fe4e5a10e8058a413cf.camel@phytec.de>
In-Reply-To: <9254d78a3ffd70fbda4f7fe4e5a10e8058a413cf.camel@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 10:08:44 +0100
Message-ID: <CAMKF1srmNZGx=1G5B=rAaaNHJ=pWqwq=pT3art=Sv8XtFDS7=w@mail.gmail.com>
To: Martin Schwan <m.schwan@phytec.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 25 Oct 2019 09:08:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 8:39 AM Martin Schwan <m.schwan@phytec.de> wrote:

> Ah, thank you! I should have checked that before. I expected to get a
> notification email for merged or otherwise updated patches.


Usually patchwork should do that not sure if that=E2=80=99s working or not

>
>
> On Fri, 2019-10-25 at 00:00 +0100, Khem Raj wrote:
> > Now I see that its already in master see
> >
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=3Daaeb37656349d=
b7f8562bf0ac1c11685f20a5212
> >
> > On Thu, Oct 24, 2019 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Hi Martin
> > >
> > > Thanks for following up on this usually patches appear on
> patchwork.openembedded.org and I pick it up from there it seems either I
> missed it or it did not appear on patchwork
> > >
> > > If it=E2=80=99s not staged in master-next and there is no response to=
 it then
> it went missing I am traveling these days so a bit sporadic on responses =
I
> will check it next time I am near computer and stage it if all is ok
> > >
> > > Thanks for your contribution
> > >
> > > On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de>
> wrote:
> > > > Hi,
> > > >
> > > > just wanted to kindly ask if anyone had time reviewing this patch?
> This
> > > > is my first patch for this project, maybe I am missing something. I=
s
> > > > there anything that stops this from being merged?
> > > >
> > > > On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
> > > > > Waitress is a pure-Python WSGI server.
> > > > >
> > > > > Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> > > > > ---
> > > > > Changes in v2:
> > > > >  - Fixed missing "K" in "LIC_FILES_CHKSUM"
> > > > > ---
> > > > >  .../recipes-devtools/python/python-waitress.inc        | 10
> ++++++++++
> > > > >  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
> > > > >  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
> > > > >  3 files changed, 14 insertions(+)
> > > > >  create mode 100644
> meta-python/recipes-devtools/python/python-waitress.inc
> > > > >  create mode 100644 meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb
> > > > >  create mode 100644 meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb
> > > > >
> > > > > diff --git
> a/meta-python/recipes-devtools/python/python-waitress.inc
> b/meta-python/recipes-devtools/python/python-waitress.inc
> > > > > new file mode 100644
> > > > > index 000000000..732c31dbd
> > > > > --- /dev/null
> > > > > +++ b/meta-python/recipes-devtools/python/python-waitress.inc
> > > > > @@ -0,0 +1,10 @@
> > > > > +SUMMARY =3D "A WSGI server for Python"
> > > > > +DESCRIPTION =3D "Waitress is meant to be a production-quality
> pure-Python WSGI \
> > > > > +    server with very acceptable performance."
> > > > > +HOMEPAGE =3D "https://github.com/Pylons/waitress"
> > > > > +SECTION =3D "devel/python"
> > > > > +LICENSE =3D "ZPL-2.1"
> > > > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e27a6966b2"
> > > > > +
> > > > > +SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
> > > > > +SRC_URI[sha256sum] =3D
> "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> > > > > diff --git a/meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> python-waitress_1.3.1.bb
> > > > > new file mode 100644
> > > > > index 000000000..26a628ea0
> > > > > --- /dev/null
> > > > > +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.b=
b
> > > > > @@ -0,0 +1,2 @@
> > > > > +inherit setuptools pypi
> > > > > +require python-waitress.inc
> > > > > diff --git a/meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb
> > > > > new file mode 100644
> > > > > index 000000000..83c8b66d8
> > > > > --- /dev/null
> > > > > +++ b/meta-python/recipes-devtools/python/
> python3-waitress_1.3.1.bb
> > > > > @@ -0,0 +1,2 @@
> > > > > +inherit setuptools3 pypi
> > > > > +require python-waitress.inc
> > > > > --
> > > > > 2.23.0
> > > > >
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

