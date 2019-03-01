Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFC617CDA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:34:09 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 199so1423064ljj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 11:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ow17cmcxQHMhYntmN+Pumipl79x4jFD/g1sqrbSnv4w=;
	b=GIxKt71XH+Ohe/8nEd87cb4vQ57NV2tF/gNpOjumuC/k68p+eXWHNg4hV7CTTligHt
	snrbpQh6Jo0QhNYBaP/9PTfsLRxgd+pmS9wgm8blaZOTNjld+1NHDO68rAFtL+IvbQ45
	In+XPFma7Am4mVhIIzjhpZ6QagvBpQMsAuUaCISpCRqcq7vWUcGfoiaTwM6EKWoq+CQK
	SajwX0s4BXXsEVVtu0akgvA5sVuWWk13I36YKTcFhDIH1fOcahkGFRWnMx0MjfksLUuI
	vESbTO5KWIeLTPBjyVRE7fKszYdMyrWbvvkk2Hy3B4jQZ1zBhE0yXEwIi7f97EUqsxHk
	S1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ow17cmcxQHMhYntmN+Pumipl79x4jFD/g1sqrbSnv4w=;
	b=NjKdAbhZDU/LmtwDUeRxNAcjQ1yPS9xh/jN+kCDAe4h9X6ypXlSEWGCOTknTitL4do
	kPWN+i2KK1epvstnqeLLUav9R6qcD5D9eqe9F/ER+0PXJctJrHUGU4JqLuyJFIozTIbr
	PNxeGNXSJIZIFWTfJPnQI7/Kz2NQPM9W9nBxdAamFIoL88i0xg/uEZkC/Sb9E/hBEstu
	0fg8lZMwXfM1fO+9KDPDwEDiic4L6IVe1NEqsD0SJgTzMJcqSyhqWRkyNDXfCjMt3bC7
	12YzWjY24kJDoGNqdC1HaLBbJAA4LBLbmuhdGeox4ZyO/AL4VtBtBU6m9fqadbpiTS8B
	Y+ew==
X-Gm-Message-State: APjAAAVdAt3qI8XmLqKebReMCVb57ORJxLoV4YwHJl+YYVNVbt/NQlzJ
	1ZGOkzJG87KjUkPKWeMguANi8+vrjZb2n3X1GH8=
X-Google-Smtp-Source: APXvYqzy7MTxr5Og01ObU/cnl/P9NIq7HshknGZrWo+OpldFJa6eth8T3oq68G028/dp7SBObkPutpI7wXooPFgsvUw=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr3654487ljw.7.1551468850323;
	Fri, 01 Mar 2019 11:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
	<CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
	<CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
	<CAMKF1sp0e0mwtOJZWT5RpsqEc_3+W++9JJ44nHDDU7UwEDkfrg@mail.gmail.com>
In-Reply-To: <CAMKF1sp0e0mwtOJZWT5RpsqEc_3+W++9JJ44nHDDU7UwEDkfrg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Mar 2019 11:33:11 -0800
Message-ID: <CAKmqyKOGaTjFD1RpNPgKVh0AtXHOVmEP=Jpyx4MPPzUmS7k2-A@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Mar 2019 19:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2019 at 11:06 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Mar 1, 2019 at 9:47 AM Alistair Francis <alistair23@gmail.com> wr=
ote:
> >
> > On Thu, Feb 28, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
> > > <Alistair.Francis@wdc.com> wrote:
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > > I was not sure what the license should be, it's a little confusing:
> > > > https://github.com/MycroftAI/mimic/blob/development/COPYING
> > > >
> > >
> > > ideally list them all with &
> >
> > Ok, it looks like there is a Sun, BellBird and CMU license that Yocto
> > doesn't understand. Should I add those licenses to the meta layer
> > first?
> >
>
> yes

Thanks for the help. Patches sent to add the licenses.

I'll respin a v2 of this as well.

Alistair

>
> > Alistair
> >
> > >
> > > >  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16 ++++++++++++=
++++
> > > >  1 file changed, 16 insertions(+)
> > > >  create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic_=
1.2.0.2.bb
> > > >
> > > > diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2=
.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > > > new file mode 100644
> > > > index 000000000..bd43fe389
> > > > --- /dev/null
> > > > +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > > > @@ -0,0 +1,16 @@
> > > > +SUMMARY =3D "A fast lightweight Text-to-speech engine"
> > > > +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech engin=
e developed by Mycroft A.I. and VocaliD, based on Carnegie Mellon Universit=
y=E2=80=99s Flite (Festival-Lite) software. Mimic takes in text and reads i=
t out loud to create a high quality voice."
> > > > +HOMEPAGE =3D "https://mimic.mycroft.ai/"
> > > > +SECTION =3D "multimedia"
> > > > +
> > > > +LICENSE =3D "BSD-like"
> > > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D416ef1ca5167707fe381d7b=
e33664a33"
> > > > +
> > > > +DEPENDS =3D "curl-native icu"
> > > > +
> > > > +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
> > > > +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
> > > > +
> > > > +inherit autotools
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > --
> > > > 2.20.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

