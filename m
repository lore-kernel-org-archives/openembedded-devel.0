Return-Path: <limon.anibal@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECFD71A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:53:15 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id i124so13065354wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ji376/Z/8BQY6sW402nLOfZfFfFzxmUKpU0zE9Nqgso=;
	b=mVEk72TmuKeVBjoAVq5W5PHiikaoIq4Sw4Mj7J1gbFvkjZZtjkZ5XQ9sXoU786lopv
	C2DhiA2C/txbz09UotNxegcluVc/N+7LMToLVvO9iz+T3ZKK45x/KmlitOwoX/TT4CKg
	E4d+gO6Z7LmN+5UdbZdL8K87ikLY3OnooZZ1PA/rg54AlYHapDQI6erIspKIEs7rQDQy
	xcLTBjY/LnPXEpSl++UsyFBDbIwadmYNBz9CE29kI9vaRFVRLThWIANZvO8x+AR1DMcu
	baJ8x6FXbe57GLYCmXYb+xglDPUqZl+kLgqWjZBQa4uOwhyVdIEvtiNcSXFE7KcVvIIn
	XMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ji376/Z/8BQY6sW402nLOfZfFfFzxmUKpU0zE9Nqgso=;
	b=lbwoC8dl9XfJMKrtbrTjWFboQ5b0iN8npXAjo+SysXRzeUyHWG0jbvp//9DxD7xpU7
	bC6lo4HRCg/hr954QPdW2xglcjBn9vvMC5mS69KWClJ6Sun3cxOli4SC3XK/HhWxjsCU
	3nqc6AZ2EbUo6yYmZYFf8i7f+6WKcbZSP+GbeV1UbxBu1ayAbOLb4PwKn8xvKaoQbnsA
	2QhPwEZfMKSY90ILl/Ys+8N5qkVogC9Gvmc4P0MAAurifEDkA0gL8g55XFY2oXWtEXL/
	A4Eq7YcbPtFr9IfqJYQ4p3lAxn9bRJ5QYVuryIOrw4jdUet7PMyYPmQc/B0N8fDK3Vat
	tFog==
X-Gm-Message-State: AMCzsaVpePQIOF4XUPyWEmaWNOqEU8wJ2oBuZqVxP8lKBgla8uduBynN
	N6WH8QwkqMyeVX+ux0Kp78ixq9ltHSEEXNLp6R4=
X-Google-Smtp-Source: AOwi7QCyKrpQhFYXFb/6rsGUmQyyz+LffepA+KsQruU9gcvFHIy6txCkt9lv9Pb265VTRWeDSYRGGnOO7TLsLl+inDM=
X-Received: by 10.80.212.208 with SMTP id e16mr2729343edj.263.1507812797080;
	Thu, 12 Oct 2017 05:53:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.72 with HTTP; Thu, 12 Oct 2017 05:53:16 -0700 (PDT)
In-Reply-To: <CAMKF1spJt3boF3g=2kTu-wYzm8wZDTRo7hZ-5QzZ2YVU7R61MA@mail.gmail.com>
References: <20171011143144.23691-1-limon.anibal@gmail.com>
	<CAMKF1spJt3boF3g=2kTu-wYzm8wZDTRo7hZ-5QzZ2YVU7R61MA@mail.gmail.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 12 Oct 2017 07:53:16 -0500
Message-ID: <CAPS-YPDSG3rZtTOb4hfoTOeD2V2w2NoLa=eVhHOeAAVgJqc+2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 12:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 12:04 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 11, 2017 at 7:31 AM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gma=
il.com>
> wrote:
> > From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> >
> > A tool to generate load and stress a system, currently this recipe
> > is on a couple of layers [1] and is not updated, a good reason to
> > have in meta-oe.
> >
> > [1] https://layers.openembedded.org/layerindex/branch/master/
> recipes/?q=3Dstress-ng
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18
> ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> >
> > diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> > new file mode 100644
> > index 000000000..f8b0a0d27
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "A tool to load and stress a computer system"
> > +HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a42
> 63"
> > +
> > +DEPENDS =3D "zlib libaio"
> > +
> > +SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar=
.gz
> "
> > +
> > +SRC_URI[md5sum] =3D "e0f6497a8c06f5d652bc2ad88d449c12"
> > +SRC_URI[sha256sum] =3D "37cc73e42f5bdb0e0571ba88f6a69b
> 8f05ee28e51afcafc2231c1058b1a5dd18"
> > +
> > +CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"' -O2"
>
> do we need -O2 always?
>

No isn't required, i will remove the flag and let the buildsystem put the
optimization per machine.

Anibal


> > +
> > +do_install_append() {
> > +    install -d ${D}${bindir}
> > +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> > +}
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

