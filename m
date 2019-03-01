Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 178A37CDB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:37:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id x10so13205266wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 11:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JjqqtV8J8XNsB8fm7D1Nv58Dl/Q/KAAaIDlloSNkcrw=;
	b=TMQv4+PNMn3ut8rKyscoobS0GfO4CH1w8O/ZFBSPXcNBftkKEWq8i6syEyCkqqG5sP
	3M7O7phh1yGU25LYjDyE+YVfj+3w0yGQEUw9GMpcIcU4ty5HznaADIPnx3ZLpZJ34n+4
	H5CKHTcz9RexjL5o5NsuaUqLDzbzxDsJJ8o+5wMm7ZlIyoHTv04rROaWAVPIHwgdkTL6
	ZYbbfwPmApVpJH0hcv1qPItWzELPBK81kO6lD/JdqdR/msA3NlvSBChdW6KK9pD7Es0d
	f4wcQh2ww6lUXeJnwGzoEiYESpoU+Pz0/iOsdVdCvoC7JRAvFLl/JeE5DxL9qZq0Pqor
	HyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JjqqtV8J8XNsB8fm7D1Nv58Dl/Q/KAAaIDlloSNkcrw=;
	b=afccwofOX0cRLs4HKzvhThfMwra9kxvFUho569oURYCirYerPvHpju2Jc6IIJ7rj6R
	1f9nRPzLXoErEX1WqxjzuGUX2VPduRktQOz6mr7WPcwRDDW8uZ+VcOJSKZMZqi6IP5Nm
	GmW39ydvZAOYLC97JcgdtZGX4EwjS79/v4zUyWinUZvLmfPZeLqXluP/dXUh0Y4fBBE2
	cSdKSVFJ+lj+dH1VAiPb+PimRYhXcS4lIEy7GY3tJReQVJZbb16eCvzwlCDhVkZs7BEY
	+DqjuUMLUDwCTqhv14JMmYCw26iof7tN0wQKY5cyd787cp1QDQgZi+shLoJsZW+g1l4j
	AnCg==
X-Gm-Message-State: APjAAAXVjsYLreUAD+0kaxRqlJ6pxoszRqOjvHCXbQPWjn1qvGeI0NiP
	iRSc1LuFUmdBVZBzsiVjJj4tnvvZZPVhoy5cVWE=
X-Google-Smtp-Source: AHgI3IbHukZXiiVED2FhcF1VAwbdcmbKBr83332rqGXIOrll0rV4NEFr5PRatxnb1uBkuwKr6LzmK7wL3wMmas4wyFM=
X-Received: by 2002:a1c:4301:: with SMTP id q1mr4142928wma.44.1551469022684;
	Fri, 01 Mar 2019 11:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
	<CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
	<CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
	<CAMKF1sp0e0mwtOJZWT5RpsqEc_3+W++9JJ44nHDDU7UwEDkfrg@mail.gmail.com>
	<CAKmqyKOGaTjFD1RpNPgKVh0AtXHOVmEP=Jpyx4MPPzUmS7k2-A@mail.gmail.com>
In-Reply-To: <CAKmqyKOGaTjFD1RpNPgKVh0AtXHOVmEP=Jpyx4MPPzUmS7k2-A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Mar 2019 20:36:51 +0100
Message-ID: <CA+chaQdokthy-jjqUoa8GocK+KoQH34ihrQCkdMLhYy5wv49iw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 01 Mar 2019 19:37:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you expect other recipes to use these license texts?

Otherwise they belong to meta-multimedia/licenses and add:
LICENSE_PATH +=3D "${LAYERDIR}/licenses"
to meta-multimedia/conf/layer.con

On Fri, Mar 1, 2019 at 8:34 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Mar 1, 2019 at 11:06 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Mar 1, 2019 at 9:47 AM Alistair Francis <alistair23@gmail.com>
> wrote:
> > >
> > > On Thu, Feb 28, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
> > > > <Alistair.Francis@wdc.com> wrote:
> > > > >
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > > I was not sure what the license should be, it's a little confusin=
g:
> > > > > https://github.com/MycroftAI/mimic/blob/development/COPYING
> > > > >
> > > >
> > > > ideally list them all with &
> > >
> > > Ok, it looks like there is a Sun, BellBird and CMU license that Yocto
> > > doesn't understand. Should I add those licenses to the meta layer
> > > first?
> > >
> >
> > yes
>
> Thanks for the help. Patches sent to add the licenses.
>
> I'll respin a v2 of this as well.
>
> Alistair
>
> >
> > > Alistair
> > >
> > > >
> > > > >  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16
> ++++++++++++++++
> > > > >  1 file changed, 16 insertions(+)
> > > > >  create mode 100644 meta-multimedia/recipes-multimedia/mimic/
> mimic_1.2.0.2.bb
> > > > >
> > > > > diff --git a/meta-multimedia/recipes-multimedia/mimic/
> mimic_1.2.0.2.bb b/meta-multimedia/recipes-multimedia/mimic/
> mimic_1.2.0.2.bb
> > > > > new file mode 100644
> > > > > index 000000000..bd43fe389
> > > > > --- /dev/null
> > > > > +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> > > > > @@ -0,0 +1,16 @@
> > > > > +SUMMARY =3D "A fast lightweight Text-to-speech engine"
> > > > > +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech eng=
ine
> developed by Mycroft A.I. and VocaliD, based on Carnegie Mellon
> University=E2=80=99s Flite (Festival-Lite) software. Mimic takes in text =
and reads
> it out loud to create a high quality voice."
> > > > > +HOMEPAGE =3D "https://mimic.mycroft.ai/"
> > > > > +SECTION =3D "multimedia"
> > > > > +
> > > > > +LICENSE =3D "BSD-like"
> > > > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D416ef1ca5167707fe381d7be33664a33"
> > > > > +
> > > > > +DEPENDS =3D "curl-native icu"
> > > > > +
> > > > > +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
> > > > > +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
> > > > > +
> > > > > +inherit autotools
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

