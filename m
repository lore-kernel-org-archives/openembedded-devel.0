Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3457F03B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 21:01:25 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 201so4786330qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yZV+E2CRdR+csGERH9N6TlEE+PX4ukOH5gEAefoFeI8=;
	b=XnbyLtO72VtYfzcPepzh6oZ75bjX8qfO2rzThTWQNzRPURgsq5M4qpRpLA7OnNzY8W
	xX2mweRKUL+2XzqxcXk3jMWEetrkiBg7yOox70X0GjjGnVhSWVmY4b8AuWJwrUp6LYyR
	mEJKHS1t1Nd7SHDdgFzn4ofzpsHK9c4TGtJ+8pjL3kYNYb9qTbMt/fbeTagcC6+hcOj7
	0SboVjOePqXZlTPWASEkGgMbGTqprC2u1QEcPy38VGJnG7mFPJNgPBS/h/wGg3bmz/On
	SfZXIdSDGmSvk2QWu337UdkDlqRjMu0GelECBniaayF+AcVEflwTAXJFxD0LN5hQuaUz
	eJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yZV+E2CRdR+csGERH9N6TlEE+PX4ukOH5gEAefoFeI8=;
	b=jK0oBQZ5KeEAEmm9ZH0E28pV/iUFmHiDvRPAyGLzdcrNMwbKZYMCMKhiN6DfXJfzw0
	rwumRUXzdjuHyQ8aPvSLyKNrBlkDvsG9j8BwzqrHbRKxvcDgyDv5XpW/gQwtZYhpcuuY
	Zl6MPYHtXkfOpKYl0+LSn+89TXj4y2bc4GyOyx3qZeKVuwxnZAxdxsZZwLtqbT7BchOM
	6TG5VGE2nhymXVztSV7YG0Epp26ffCfdhQdzBpzwdzkLCaTSZCBRMhCxbnVTDpRKtLRk
	ya97nOhk+wG4Lv7LUl+eq+IYbiV8ta0E25RDeoVELJN/ajfbQHigZzr33BRW+Yh+Nccb
	G8Lw==
X-Gm-Message-State: APjAAAV2ENaJcU1KXbxzgvhfwatE9+GbPXZM8O6g8jbS0XZuIz7CVe1K
	mvG/9Y+Aa1hkc5CbDbhxBt57kEPrRLSfBfhoe5s=
X-Google-Smtp-Source: APXvYqyhqmwwSmXoavkvLpl6vKw2LuSzcU86tOQMU2Xd7PLwIVxU6/APjd2wzLZ/e6fkEjYxm6nVPlmpxqdUKVuFJPM=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr3462413qke.212.1562878885851; 
	Thu, 11 Jul 2019 14:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190711090803.18931-1-windel.bouwman@gmail.com>
	<CANx9H-AeowZ0OR+yq353qjSsYvGC=6H6eZuDZbvBywDNEyQTCg@mail.gmail.com>
In-Reply-To: <CANx9H-AeowZ0OR+yq353qjSsYvGC=6H6eZuDZbvBywDNEyQTCg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 14:01:00 -0700
Message-ID: <CAMKF1spngtnreVamNq+FZe0XZUcBJAJ-gev+4_XZAp4Ay3Ocgg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-humanfriendly: Add recipe for the humanfriendly package.
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
X-List-Received-Date: Thu, 11 Jul 2019 21:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2019 at 6:47 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> You are missing the subject prefix indicating which layer and the fact th=
at
> this is a v2.
>
> Add this argument to git send-mail:
>
> --subject-prefix=3D=E2=80=9Cmeta-python][PATCH v2=E2=80=9D
>

And this has duped me. I have applied v1, so please address the delta
between what we have in master
in v3.

> On Thu, Jul 11, 2019 at 2:08 AM Windel Bouwman <windel.bouwman@gmail.com>
> wrote:
>
> > Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> > ---
> >  .../python/python-humanfriendly.inc           | 25 +++++++++++++++++++
> >  .../python/python-humanfriendly_4.18.bb       |  2 ++
> >  .../python/python3-humanfriendly_4.18.bb      |  2 ++
> >  3 files changed, 29 insertions(+)
> >  create mode 100644
> > meta-python/recipes-devtools/python/python-humanfriendly.inc
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python-humanfriendly_4.18.bb
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python3-humanfriendly_4.18.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.i=
nc
> > b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> > new file mode 100644
> > index 000000000..94f7f8b81
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION =3D "Human friendly output for text interfaces using Pytho=
n"
> > +HOMEPAGE =3D "https://humanfriendly.readthedocs.io/"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE.txt;md5=3D690da298a43805797a4fa7bbe180b3c6"
> > +
> > +PYPI_PACKAGE =3D "humanfriendly"
> > +
> > +SRC_URI[md5sum] =3D "9573f9f37a5454d8205cfd1b9b8db9d2"
> > +SRC_URI[sha256sum] =3D
> > "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
> > +
> > +inherit pypi
> > +
> > +RDEPENDS_${PN}_class-target +=3D " \
> > +    ${PYTHON_PN}-datetime \
> > +    ${PYTHON_PN}-fcntl \
> > +    ${PYTHON_PN}-io \
> > +    ${PYTHON_PN}-logging \
> > +    ${PYTHON_PN}-math \
> > +    ${PYTHON_PN}-numbers \
> > +    ${PYTHON_PN}-shell \
> > +    ${PYTHON_PN}-stringold \
> > +"
> > +
> > +BBCLASSEXTEND =3D "native"
> > diff --git a/meta-python/recipes-devtools/python/
> > python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> > python-humanfriendly_4.18.bb
> > new file mode 100644
> > index 000000000..4e03a654c
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools
> > +require python-humanfriendly.inc
> > diff --git a/meta-python/recipes-devtools/python/
> > python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> > python3-humanfriendly_4.18.bb
> > new file mode 100644
> > index 000000000..2ca5fe36f
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3
> > +require python-humanfriendly.inc
> > --
> > 2.17.1
> >
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

