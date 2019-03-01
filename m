Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 379F97CD59
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:47:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g80so21157534ljg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LZhbcLz0HJRekRBGP0CpowPDSB2oTEr0b6WQkllu4P8=;
	b=rb33n0/3P2KyP/xmd+IvQOOde1pkvn3yF47ZsqinX2ZeTID1K2dqvNZ0O37xNQNI7k
	9kE7VPbww6zgdYwctKcCXgUHsCuioAtDJXIlD0ZAajEazm4XN1CT+3wNT+0QcytRpx7p
	MmzcXF7cjUbYC2BT7WWFtygvSV25u5eudIt1OHNSg16Tkcq0bFfIMcPCYlY7Z9+aaB1A
	mkxQofZuculVgLwz+puZcX6bLFEPHa2K8v5ybG9DqzdLK1ZxmvBSSzww6l0uKnnBRrnW
	DCMKfrk9I/Csv1s790I3/BmPL2A6FCApO34UWpOxAxgo9+tYittKysLnDcDYL6tnMjDo
	jOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LZhbcLz0HJRekRBGP0CpowPDSB2oTEr0b6WQkllu4P8=;
	b=iM78/F07ywWKXiEnj8ar+F4N4Gc47QhaJos9PFeW9E5p8X1m5zO/tRUMS2zRQYaXYu
	+OkuK4WRDkzHMmzRX6f0GxqGxZYjfVgdd15crweHn9NPXQQBCDXVDy2h6+aZC4WjTDxu
	gH6+bKAI20y62MaeN533axGieZZ/tx3ruFTBCCa8fvEBcBUgGjlTOkAdMHwjYmtJv4lD
	eME1mPJC0arn410fgGc249OQovElUAfV+0Dse17cDexVzcW05nfzQoZC+37G+omwiA49
	36Qd4PcyoXxPxH8l181O+tD6Gg2/aNGTTRBhsI+dz17NRoM8LQ9Vr/gxhTOkeUVNJhDy
	VVoQ==
X-Gm-Message-State: APjAAAVaoBalCFRYBjd585oSwSet2T5Hdlz0WevjrmOamvshkW4YKCi+
	CDcqpJX72y3x1u/QZRh7H7MQnbmR5i9gLrXE6+E=
X-Google-Smtp-Source: APXvYqw1Z/LLRGRY7QxyVfSJNE97z2Y9QXPG4tZ5DrDEtiICr1wh9GrfwqMfoiqzlJoqUzjEtrB/6EPpOsCPC7QzWUI=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr3445320ljj.191.1551462425458; 
	Fri, 01 Mar 2019 09:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
	<CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
In-Reply-To: <CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Mar 2019 09:46:07 -0800
Message-ID: <CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 01 Mar 2019 17:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > I was not sure what the license should be, it's a little confusing:
> > https://github.com/MycroftAI/mimic/blob/development/COPYING
> >
>
> ideally list them all with &

Ok, it looks like there is a Sun, BellBird and CMU license that Yocto
doesn't understand. Should I add those licenses to the meta layer
first?

Alistair

>
> >  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic_1.2.=
0.2.bb
> >
> > diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb =
b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > new file mode 100644
> > index 000000000..bd43fe389
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "A fast lightweight Text-to-speech engine"
> > +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech engine de=
veloped by Mycroft A.I. and VocaliD, based on Carnegie Mellon University=E2=
=80=99s Flite (Festival-Lite) software. Mimic takes in text and reads it ou=
t loud to create a high quality voice."
> > +HOMEPAGE =3D "https://mimic.mycroft.ai/"
> > +SECTION =3D "multimedia"
> > +
> > +LICENSE =3D "BSD-like"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D416ef1ca5167707fe381d7be336=
64a33"
> > +
> > +DEPENDS =3D "curl-native icu"
> > +
> > +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
> > +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
> > +
> > +inherit autotools
> > +
> > +S =3D "${WORKDIR}/git"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

