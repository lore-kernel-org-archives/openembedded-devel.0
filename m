Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04E3A6B5C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:22:14 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h144so52099736iof.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lwje++WJhEOYcXnQTAFLGxhCkzbYR+2ka7V/aOZszMA=;
	b=ZqJBgZA5o32JY45in0Uh93D96YWWIKcOjowwxC6/BeTaw/zqfzOyvzBRseIruJEhN/
	BtKiAF4KqkbPv0Sst82STdSgMXFySdJW2I/Y4EVSaBT7dIexuJ/uP5bd2x3M5Tk1McsD
	tFwH6od8D9pPVpiVTd8P3Zq1w6bFRqUpmORwrInoKt5Ljay7+3HYClCIBWIzjdEf0fTl
	yk4rh8zs8177h3nVB0aZ8suDXfAWrQF8eDpmprDXDeAqGbBay+n1cX+iwK/ij39GElsv
	QyfCshtw1vOb550xco26HT46EWrpgk9IkkGqAyBs78hRsEaFgNPAdHM59NYszNl+N1z2
	B2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lwje++WJhEOYcXnQTAFLGxhCkzbYR+2ka7V/aOZszMA=;
	b=hyAVuFFVLMtiejzZNTxsYcBplrpwik2Rb0tGzfOdpMMhS5ciTC4bg8FS2yEUjbc/dH
	wpUFeBWG7XLLDZvN12cgSnusM1Uv2H9n/uPqa5kfGhVwDyhcKl4ZQKC49cm7lvqvNyNg
	YprBUvj8DoiPOuoTxql0lFVVf1vkoGoq6iMFgFX7ZPcvwSTYU7v6xE7GELHNmkdEno8U
	NuawPfvUEODOzDAioJ8l5xf83Hw17vYeWgWsVMVSAvTxjHTx2YFbdg5+idDfZZKseTZb
	bJpltAQ6/CAo+yp/cYtGjW31Wq954Q+rTPjf1DxsujFAofEbiuKVwkOBsj0fkr3Xaa/p
	X+Yg==
X-Gm-Message-State: APjAAAXvvmhuPtCoT02pWJqYpFJ5ubCoNoWuMOKZb6O29QKNLenm28xV
	WwI8O4V+vfd8M1IZw/sJLvcT/vfpFsTzsdqyML6sZKmM
X-Google-Smtp-Source: APXvYqw/5KDy0Fkt9ZDaBlq+Y1rNEBwEb6emmqoUsk3p1VkNF4Q/hsEltOMaZLY1qlVmDoXd11TZLfpydFV+7n33wFM=
X-Received: by 2002:a02:3b6f:: with SMTP id i47mr17010572jaf.24.1568272935337; 
	Thu, 12 Sep 2019 00:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190912070050.4388-1-brgl@bgdev.pl>
	<CAMKF1so9rMwPvE=6jZqOhuisT+ZT-v6aePQMYCR7-0dOmWXzTg@mail.gmail.com>
In-Reply-To: <CAMKF1so9rMwPvE=6jZqOhuisT+ZT-v6aePQMYCR7-0dOmWXzTg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Sep 2019 09:22:03 +0200
Message-ID: <CAMRc=Mf4Uh3UMOR4-u9qJp8AdfYadCaWVDDV3qtH00f=4CcQ5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] yad: new package
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
X-List-Received-Date: Thu, 12 Sep 2019 07:22:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 12 wrz 2019 o 09:16 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
> Hi Bartosz
>
> On Thu, Sep 12, 2019 at 12:00 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This adds a recipe for yad (Yet Another Dialog) - a command-line utilit=
y
> > allowing to display configurable dialog windows from shell scripts and
> > parse the input from users.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  meta-oe/recipes-graphics/yad/yad_4.1.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/yad/yad_4.1.bb
> >
> > diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipes-=
graphics/yad/yad_4.1.bb
> > new file mode 100644
> > index 000000000..cfb13c4b7
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/yad/yad_4.1.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Yet Another Dialog"
> > +DESCRIPTION =3D "Program allowing you to display GTK+ dialog boxes fro=
m command line or shell scripts."
> > +AUTHOR =3D "Victor Ananjevsky"
> > +
> > +LICENSE =3D "GPLv3"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> > +
> > +SRC_URI =3D "git://github.com/v1cont/yad.git"
> > +SRCREV =3D "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
> > +PV =3D "4.1+git${SRCPV}"
>
> Lets rename the recipe PV to 4.1 since the SRCREV is pointing to that
> exact release.
>

So should I simply drop the assignment here?

Bart

> > +
> > +inherit autotools gsettings
> > +
> > +DEPENDS =3D "gtk+3 glib-2.0-native intltool-native"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +FILES_${PN} +=3D "${datadir}/icons/"
> > --
> > 2.21.0
> >

