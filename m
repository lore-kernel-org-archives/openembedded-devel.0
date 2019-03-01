Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id D5D447CDB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:06:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z39so29067453qtz.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U13s/dAt0P7eC9GbtygTQ/tjCfXr7xF1DT5vOsC9ME8=;
	b=eZ6KTOLMen4sDo9t3w0Ox+lT6ZsvRKKir/pAjCUs2zMOiLyriMTKKhHKSXbGcGGo/O
	QKG1/pDqTeEjuuQUO2duZM0MRK1T0xgw0lYtRs75m409e+f9d4REEqjdzvwXR6zYblB7
	7/x6u/Ho+KQ9bJ04RVxOHJlbVwGSFP2zbthDVmcuKM3eDNQBLj04eRvDUmMCvnkvrHHk
	RRYcCqTQIihIpy+ymnIPXcA0jsylgrbklTO19GNIjW1PFHovZCyQ9rgc8ZTKuaMPoFeJ
	u0vKUfs6kRanZgdqHPKNqHddWXf38/qqFbYZ4zivJ4qJjPBRR5fQ5VVV4IdfC33HrycQ
	EEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U13s/dAt0P7eC9GbtygTQ/tjCfXr7xF1DT5vOsC9ME8=;
	b=gMNA88B5ne7KfCKAhLs/NUUlsedd+WLy0hn5XICnSh6hdnsN6qhlQNRUg1ljp2Ybnk
	LoFaUUZBEJOibdCLpibCAwFpD0xLEcxynroQtqN9OLN4lwnobnAoyIxDSWvHb9irHIlv
	icf9Ad4TxQSPCP05k0kF33QSLvkKuRdE8rJ5gI5HpLGKMkbpxKNtii5XU7nNHAfaa83I
	P+5PVoGUWbswZjRdrTf/bfSm2/z/7ttCEDYYFXkVqwMPpJXf7I4sUxVfkHwdu1g80ocn
	wwLebZlQlC5Mj8y19BFB/IGX2xXX9EW64acg9kBor5+hM8i/eGwTwLj4cWBQHpCYl0h/
	3fQA==
X-Gm-Message-State: APjAAAWAoW08A6owUd2OVK11wCDZWtxeFkDgYj1pyX2SBIjbiAAaREUF
	oM8VOx4+tyVBNLayluAc8WGn1dG2u7j6HJsgSm8=
X-Google-Smtp-Source: APXvYqyBcPGFGy0cEIL/OWHAe7iunNzLwq4YspfQfTJ0+uArxr4eus/ieexXmh8K1QJCMP2wTb/7XNIqpYGULuOA9YU=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr5157693qte.196.1551467182379; 
	Fri, 01 Mar 2019 11:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
	<CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
	<CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
In-Reply-To: <CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 11:05:55 -0800
Message-ID: <CAMKF1sp0e0mwtOJZWT5RpsqEc_3+W++9JJ44nHDDU7UwEDkfrg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mimic: Initial commit of version 1.2.0.2
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
X-List-Received-Date: Fri, 01 Mar 2019 19:06:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2019 at 9:47 AM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Thu, Feb 28, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
> > <Alistair.Francis@wdc.com> wrote:
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > > I was not sure what the license should be, it's a little confusing:
> > > https://github.com/MycroftAI/mimic/blob/development/COPYING
> > >
> >
> > ideally list them all with &
>
> Ok, it looks like there is a Sun, BellBird and CMU license that Yocto
> doesn't understand. Should I add those licenses to the meta layer
> first?
>

yes

> Alistair
>
> >
> > >  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16 ++++++++++++++=
++
> > >  1 file changed, 16 insertions(+)
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic_1.=
2.0.2.bb
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.b=
b b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > > new file mode 100644
> > > index 000000000..bd43fe389
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > > @@ -0,0 +1,16 @@
> > > +SUMMARY =3D "A fast lightweight Text-to-speech engine"
> > > +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech engine =
developed by Mycroft A.I. and VocaliD, based on Carnegie Mellon University=
=E2=80=99s Flite (Festival-Lite) software. Mimic takes in text and reads it=
 out loud to create a high quality voice."
> > > +HOMEPAGE =3D "https://mimic.mycroft.ai/"
> > > +SECTION =3D "multimedia"
> > > +
> > > +LICENSE =3D "BSD-like"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D416ef1ca5167707fe381d7be3=
3664a33"
> > > +
> > > +DEPENDS =3D "curl-native icu"
> > > +
> > > +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
> > > +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
> > > +
> > > +inherit autotools
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > --
> > > 2.20.1
> > >
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

