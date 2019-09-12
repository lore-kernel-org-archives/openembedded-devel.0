Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7427E5FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:29:17 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v11so29735391qto.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SpJ/krt/wyRCV0hQ80DCi57H4/LiioF8B4HWD+0CLjs=;
	b=m9GojXLfl3UxZ8qqMzcta/E7vxqMaWzpzAwauDVNUB/o4+AbDG246qiNpSD1RpDLFd
	bGRPt+iayLYLsfLSVKejPyYBRVni8w6WhXCUGRjBh+oGib0tzHHYBlqYNU2ORXHmkXwH
	mHmiMdUUNjI0LI0oUYW1/gsruKCXbt2CtoHf3ACb42PGYUyVS3hSlzLzBgfohdI4tLO5
	cCKxSh9DRfi+Wv8MKLzhjP6ADFdCAr/EDiR0CSImQ7Buu4U2+qAb9avEHM+OdrFuPMYd
	E8T8XBfs4YkWRP+1A4FbCbzWpaBV1nfMP6AnrWFIIIpmgQE/0ZKxyK8Dm44o12SfDu40
	ozsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SpJ/krt/wyRCV0hQ80DCi57H4/LiioF8B4HWD+0CLjs=;
	b=rOYq+nBk8eZskOA8nEkvZua27w+AnTG8qGxu4ik7yPPC6Kv0ycTJxHbFV3vcX5QMd5
	JfxBXemIn+LuJPCMxRkpiN2xARXDuZ9w6k/lVYmGt6CIGW7DUqvYASIxsxWSfKLyLBe8
	KdpeKk2CeNN5+cODT71fD7eCmCD53T0znz3CiEA5LFq7dcOqosWwPqqh1XqyUoVd8cXp
	wC4v2JKprovQjC3U6OFzS7DP4E7skgGs08VLSvflmGrL+EZ1KokiO+6g12tCFWxMLtrl
	GDJJG69Prj1Bk2qwMyXPtquLZinz4sEnxsF9V+Q4OCoZuiLjx8hB98ibd4J74+U3ANGt
	e+nQ==
X-Gm-Message-State: APjAAAVtj7LFnTs3cNTkptsuHLNMSI8+iGPuYbRlR0+kDd6ZfqP0pILb
	TwXJTORPUu8TUsiV0p9vOguT+II7K8xCb6cVCxT8tsWC
X-Google-Smtp-Source: APXvYqytfVsyXj1+Gnn3a4DRkMqY3mBfa8R2zHR/QPmwNk+00IBUVwfpiKpCAIM764ua5AWZIb5PRnglyTKQ0tZOzU0=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr41507021qtn.378.1568298558097;
	Thu, 12 Sep 2019 07:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190912070050.4388-1-brgl@bgdev.pl>
	<CAMKF1so9rMwPvE=6jZqOhuisT+ZT-v6aePQMYCR7-0dOmWXzTg@mail.gmail.com>
	<CAMRc=Mf4Uh3UMOR4-u9qJp8AdfYadCaWVDDV3qtH00f=4CcQ5w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf4Uh3UMOR4-u9qJp8AdfYadCaWVDDV3qtH00f=4CcQ5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Sep 2019 07:28:52 -0700
Message-ID: <CAMKF1sp889bArYQXS_Rk7UxO6UpmpukRB6_Cqk2-1pt8fdpTZQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
X-List-Received-Date: Thu, 12 Sep 2019 14:29:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 12:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> czw., 12 wrz 2019 o 09:16 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> >
> > Hi Bartosz
> >
> > On Thu, Sep 12, 2019 at 12:00 AM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > This adds a recipe for yad (Yet Another Dialog) - a command-line util=
ity
> > > allowing to display configurable dialog windows from shell scripts an=
d
> > > parse the input from users.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  meta-oe/recipes-graphics/yad/yad_4.1.bb | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644 meta-oe/recipes-graphics/yad/yad_4.1.bb
> > >
> > > diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipe=
s-graphics/yad/yad_4.1.bb
> > > new file mode 100644
> > > index 000000000..cfb13c4b7
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-graphics/yad/yad_4.1.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY =3D "Yet Another Dialog"
> > > +DESCRIPTION =3D "Program allowing you to display GTK+ dialog boxes f=
rom command line or shell scripts."
> > > +AUTHOR =3D "Victor Ananjevsky"
> > > +
> > > +LICENSE =3D "GPLv3"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
> > > +
> > > +SRC_URI =3D "git://github.com/v1cont/yad.git"
> > > +SRCREV =3D "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
> > > +PV =3D "4.1+git${SRCPV}"
> >
> > Lets rename the recipe PV to 4.1 since the SRCREV is pointing to that
> > exact release.
> >
>
> So should I simply drop the assignment here?
>

right yes

> Bart
>
> > > +
> > > +inherit autotools gsettings
> > > +
> > > +DEPENDS =3D "gtk+3 glib-2.0-native intltool-native"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +FILES_${PN} +=3D "${datadir}/icons/"
> > > --
> > > 2.21.0
> > >

