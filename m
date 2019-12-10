Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4ACF7FC50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:50:44 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t9so16554002iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cEyrnV1by8No0TdHvCort48cefj78v8HRqEqLGcPhLg=;
	b=x+ObYBUUaSIroU7dBop5sAk/t5M/g9UAE3hs+aawXWQWTgENHqeasSvGgM4pGBJaSG
	TTbdf5hzCd0MpItncmkdu4/XkTU0YiOFIqqN4yPrqpU0ovhdmXXGmfBUAjMwWhDog0QO
	Hy7d/xhf14kH6lC+7NJDCJia3sm6k1ozIE0EZ84h5mUavthMaZYYPry+3GnDvDlOoSNH
	KBD/wNyavJQHLyGcSnKyc9bN3H5EotF7VJffdODDHn7g3dyR13xU97zw4oOEZTX9qiLu
	LfJF4ueGMidrDEebQBXBEbFfBEri3RBNwa03rntc5lfuTq2Vv8A8e2h92T12jDHu3PVL
	Pglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cEyrnV1by8No0TdHvCort48cefj78v8HRqEqLGcPhLg=;
	b=JOLc/OUsAoiKi3J/ZWFCmvwTaFSxUJiOHS7H8FXrq0pmM8IUJk93GBvZKO4YFc6WIU
	cb0F0ME8ttIOZ7nOOEL8SLt0UZ6ONMmenj45XK2WVf7tUM4uzf5fI6fon963y+HRCdoB
	9+flPuCtL0w4yRr1YlUTOQCcvQXGi5VWKtbpudU7FAVbBQ07MahOqjaAXqPzynb8Ciwd
	CWUhJ8CjozIrKJVSHkcF07sNQsvAk86NAETIh//QpMsLtDL4kp/tUEVOZM/9caqRPYxD
	2PwkvqpQku2oy/24yN9TcfCaC+8ROjCnEZLF0XXx559JRYDlVj3IlSZz8riUHxukmDZo
	B6Ww==
X-Gm-Message-State: APjAAAXUJR2sMR4EU+VQTmyB5Ag+SJ/l0PP4pJHiez8ao9X932xPxBWp
	Nmi9s6sm2pGXwE6uFiZa7CKZxwf/qY459b+HQq3cHQ==
X-Google-Smtp-Source: APXvYqyveOA21bKyST2Ja11yaAQJtQvrDEZWDZ4yeaiafgQM1gayVxUJV1lBSHKJMwZ4gxU4iMSlBzwHeV0VCGDJYRk=
X-Received: by 2002:a92:aa46:: with SMTP id j67mr33171785ili.189.1575993045540;
	Tue, 10 Dec 2019 07:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20191209144525.21752-1-brgl@bgdev.pl>
	<CAMKF1spX0HCZ-pcth0t80VSHMVvSN2BTyLb1jXg6h4LQG-XGOw@mail.gmail.com>
In-Reply-To: <CAMKF1spX0HCZ-pcth0t80VSHMVvSN2BTyLb1jXg6h4LQG-XGOw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2019 16:50:34 +0100
Message-ID: <CAMRc=Mfgfmp8vKufxQdtZ7ojL1GAWeXhh8KbpCr96CUThbsKYg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] librsync: new package
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
X-List-Received-Date: Tue, 10 Dec 2019 15:50:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 9 gru 2019 o 20:24 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
>
> On Mon, Dec 9, 2019 at 6:45 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > rdiff is a popular tool for calculating binary delta patches. It's
> > provided by the librsync package (unrelated to rsync already available
> > in poky).
> >
> > This recipe adds new packages for librsync and rdiff.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> >
> > diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-=
oe/recipes-support/librsync/librsync_2.2.1.bb
> > new file mode 100644
> > index 000000000..9d224767c
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Remote delta-compression library."
> > +AUTHOR =3D "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schuber=
t"
> > +
> > +LICENSE =3D "LGPLv2.1+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd73=
7b499"
> > +
> > +SRC_URI =3D "git://github.com/librsync/librsync.git"
> > +SRCREV =3D "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "popt"
> > +
> > +inherit cmake
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +PACKAGES =3D+ "rdiff"
> > +FILES_rdiff =3D "/usr/bin/rdiff"
>
> Please use ${bindir} instead of /usr/bin
>

Will do.

While at it: I noticed another problem and I'm not sure how to
approach it: the recipe provides the librsync package as well as
librsync-native by using BBCLASSEXTEND =3D "native". We also use
PACKAGES =3D "rdiff" to provide the rdiff executable in a separate
package, but it doesn't seem to provide the native package for rdiff
automatically. What is the right way to provide librsync,
librsync-native, rdiff and rdiff-native here?

This is needed as native rdiff will be used to actually create the
delta update images in the system I'm working on.

Thanks in advance,
Bartosz Golaszewski

> > --
> > 2.23.0
> >

