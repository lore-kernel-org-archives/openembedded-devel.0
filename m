Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0DB36C57B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:56:23 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d18so26597898qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GqdZIuArHT+qN3yu5Gn/cKe4BaTMWLFfgNBqaOeykmI=;
	b=nMlasT3UEbi8pw1vWwO1JEkBMI/J8A+QqHR3TFXv6RmKPlYy9n0yWoeP1BrCZ+bJfq
	CkRh5ulLCAOd1W2rZp4T6cRr6WgP+funpr7N7RjjzZIiej2YX5pYfZpsasH1E4E+Udt/
	jfizy7zwkJWOLVTJdPr7ZGFhzV/X4qv/x/7NghY8aVbkRbp0ofIZ3gyy2a2IbMFWfnCb
	KBaUJly10jeLia8BRDQpObfZ1LmTakEFvPjrURDksLp8821wsYdy41KETkDR2pRJLqJC
	YQ0l71MIgdZwcZgNZ4CP/5Aa7MnLdlafpuKRg0fwD5b5Cf/Qe2Pnn/CYF4Fh0Cdr2x1k
	807A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GqdZIuArHT+qN3yu5Gn/cKe4BaTMWLFfgNBqaOeykmI=;
	b=ACgmOIECpVbrALY7/qEZzblG+gU4e9Mg2j6wt2YJJC/uL/BtxZGMXhxh5nsT9Hd/Ob
	uatERnw4W1jE5VmBbpZS9bjh9/LjF3YsAj6eL2w+HR09wDi6/5R1q+CVbKMDcoEYWCaK
	NA9U0MqUKaCWE0C9vPjvw7hgXsbuah12FstxaEKYbl5kL4qj/jsianBrhAcFy7Oae7Lg
	lymrKRx8k5WpXl+iaLInP1LIjMqrKvXUwtg6EJepg8vvYRglvd+MQxVH4WOdI44zoOU1
	+ijBWycm1V/8DWL/lC4BVAeEVVHQwT2NbtTlJeEoOWYJRVUyjBfxHYQOqprAdeKDOxG/
	Z6hA==
X-Gm-Message-State: AA+aEWarzABEJDS3Z1t1a7bI/PPwT1xBXMk0VyURW3uoA10ecqjE1fEU
	keQaIuXDLgOuzFyr7J9k0vRS2XVfncIyLwpu5Rg=
X-Google-Smtp-Source: AJdET5cJQ493qDbrJW3RkdE5bfMbgf1W5gGpw54+tbn5t3GlMWGsAIkBTMHwljhbzhdaQ3/AaxlTlFMJhrFvbG4L1xk=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr36241708qte.29.1543424184510; 
	Wed, 28 Nov 2018 08:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20181123223022.30597-1-pbasista@gmail.com>
	<CA+chaQetQT7MbnrguBOhzANeL-w734KQRzWwcaL2+6oEwp-7zQ@mail.gmail.com>
In-Reply-To: <CA+chaQetQT7MbnrguBOhzANeL-w734KQRzWwcaL2+6oEwp-7zQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2018 08:55:58 -0800
Message-ID: <CAMKF1srFNJ0VMMQeZkr8W1knj0R1tGgXje8tqk6kG_2c-an=-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v4] Add a working Tvheadend recipe
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
X-List-Received-Date: Wed, 28 Nov 2018 16:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Martin, I missed it. I have now send a patch to add the recipe
for missing package.
On Tue, Nov 27, 2018 at 2:32 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> What is supposed to provide libdvbcsa? It's not in any public layers
> registered here:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dlib=
dvbcsa
>
> Latest world build shows the same issue:
>
> ERROR: Nothing PROVIDES 'libdvbcsa' (but
> /home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-multimedia/reci=
pes-dvb/tvheadend/
> tvheadend_git.bb
> DEPENDS on or otherwise requires it). Close matches:
>
> On Fri, Nov 23, 2018 at 11:31 PM Peter Ba=C5=A1ista <pbasista@gmail.com> =
wrote:
>
> > The original one was previously removed
> > by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
> > as part of a clean-up of blacklisted recipes.
> >
> > Signed-off-by: Peter Ba=C5=A1ista <pbasista@gmail.com>
> > ---
> >  .../recipes-dvb/tvheadend/tvheadend_git.bb    | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git=
.bb
> >
> > diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > new file mode 100644
> > index 000000000..95cf10bf6
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Tvheadend: TV streaming server and recorder"
> > +HOMEPAGE =3D "https://tvheadend.org/"
> > +
> > +inherit autotools-brokensep gettext gitpkgv pkgconfig
> > +
> > +DEPENDS =3D "avahi cmake-native libdvbcsa libpcre2 openssl uriparser z=
lib"
> > +
> > +LICENSE =3D "GPLv3+"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac88ce5db"
> > +
> > +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git"
> > +
> > +SRCREV =3D "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
> > +PV =3D "4.3+git${SRCPV}"
> > +PKGV =3D "4.3+git${GITPKGV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_OECONF +=3D "--arch=3D${TARGET_ARCH} \
> > +                 --disable-hdhomerun_static \
> > +                 --disable-ffmpeg_static \
> > +                 --disable-libav \
> > +                 "
> > --
> > 2.19.1
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

