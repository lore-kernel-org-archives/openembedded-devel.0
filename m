Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0A576D242
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 00:05:13 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k8so9095740pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 16:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pa6hKUz3S/h6KQSp4fKKXH5dkE7i8nL4uToI5iY15Yk=;
	b=uoHwIX2dgZei1Iegquz7Zt/95PTxlibv9LC0NxighSC6sOYLZs/MQ5dG4MzMzwWunb
	94QmceHHWuLn5UrtBg6HhZsgiVXu2SUecvK9qiDElvQcKjXn2ay3SIs3nzaIwkybWZuj
	IUtWVJAhuF9N8MkQgs8TDesrbnigxUQVb01nJGxGOCr1QE8aCvTumzdV5dZYnswEWdfG
	9Brs3PpIfTff4vqcPlasxQgydglGZ7YeeGaz5NpFO5Ol0qeRBRjWF8ciErO5pcO6kSNM
	PcxwzTO/slMGz3OYHvCzQMqTmglI72o1FyX2AhAFLDjiaZA4M3flg0am1dVwmO3V1K49
	oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pa6hKUz3S/h6KQSp4fKKXH5dkE7i8nL4uToI5iY15Yk=;
	b=jk5/StmibwBZkv2vd5P5okaPFja0xxyz4IL0lRt031XfpuE9R3y+Ff1uxlg7A8V99d
	hiQwy6wSrDjJHi19wdTp+TYNHWE/CZc7x4MPLfo4VqF4tiY/WINO6eiLAAlglIn9CZ5V
	FSn/kKCvHAGaMWtZytRGE82OsnMR1cvcp840fc20v7PzKlGnHiHKF9pCjvrkd04NiWsn
	GE6K2VP43X/C7IdEdf5G8FsLTU2GfpeU23YhBdDwtErn5LnFHfCEry1b8hEySnK7Pusy
	G3KYQfXJQjHnnzAeguBaKochiuKz/H6B3PIpNZTTjwT558USb6VVAPwKEWz9WXt7jpD4
	Aing==
X-Gm-Message-State: AA+aEWaceZDq/so1KyxUDj0IYG+jwoN35PYg64A2iKnO/xjYuvgDLokN
	jeWBFY/Ia1iozXM/cK0bc2GSjmhvw7LPi7UQ55Q=
X-Google-Smtp-Source: AFSGD/VMaZpX3CSze5+KsFILpJYx1KjeuorQRIRo5+o2WxHQiPAF7L77VgcJvZOSQgIrG3cwajSQgQ307JBZIkrn0sI=
X-Received: by 2002:a17:902:bb05:: with SMTP id
	l5mr22451661pls.230.1543968314878; 
	Tue, 04 Dec 2018 16:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20181204141512.25927-1-eduardas.m@fods.com>
	<CAMKF1sphTtnuYGNFsWAPoeitakGJNxkt+ZzHGd6J8wOgG+DBJA@mail.gmail.com>
In-Reply-To: <CAMKF1sphTtnuYGNFsWAPoeitakGJNxkt+ZzHGd6J8wOgG+DBJA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 5 Dec 2018 01:05:01 +0100
Message-ID: <CAAQYJAvUEv9Fe3AXcLUj7jj75itmsZbg9S5MPfocJh2cGY8UbQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH] mksh: add version 56
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
X-List-Received-Date: Wed, 05 Dec 2018 00:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had not yet time to review and test-build the recipe but I pointed
it to the author, tg, the fellow helping with klibc.
Here his observations:

<ant_home> LICENSE =3D "MirOS & ISC"
<mira> ISC only if your libc doesn't have strlcpy
<mira> all but glibc have it
<mira> +    chmod +x ${S}/Build.sh
<mira> why?
<mira> just run sh ${S}/Build.sh instead
<mira> oh and add -r
<mira> saves time (-r disables automatic compilation of the manpage to
a catmanpage, BSD style)
<mira> inherit autotools   =E2=86=90 I doubt that ;)
<mira> you=E2=80=99ll also want to install an /etc/skel/.mkshrc or similar;=
 in
FreeWRT, OpenWrt and OpenADK where root is the only user we install it
as /root/.mkshrc

Cheers
Andrea
On Wed, Dec 5, 2018 at 12:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails to build with musl - http://errors.yoctoproject.org/Errors/Details/=
203419/
> On Tue, Dec 4, 2018 at 6:16 AM Eduardas Meile <eduardas.m@fods.com> wrote=
:
> >
> > The MirBSD Korn Shell is a permissively licensed shell currently used
> > by Android.
> >
> > Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
> > ---
> >  meta-oe/recipes-shells/mksh/mksh_56.bb | 34 ++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 meta-oe/recipes-shells/mksh/mksh_56.bb
> >
> > diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-s=
hells/mksh/mksh_56.bb
> > new file mode 100644
> > index 000000000..2ddcc6607
> > --- /dev/null
> > +++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
> > @@ -0,0 +1,34 @@
> > +DESCRIPTION =3D "The MirBSD Korn Shell - an enhanced version of the pu=
blic domain ksh"
> > +HOMEPAGE =3D "http://www.mirbsd.org/mksh.htm"
> > +SECTION =3D "base/shell"
> > +
> > +LICENSE =3D "MirOS & ISC"
> > +LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D6;endline=3D25;md5=3D7=
204fec4d12912f2a13fe8745bc356f9 \
> > +                    file://strlcpy.c;beginline=3D1;endline=3D17;md5=3D=
d953f28f0c43ee29e238ec9bc15df2a0 \
> > +                   "
> > +
> > +SRC_URI =3D "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
> > +
> > +SRC_URI[md5sum] =3D "4799a9ac6d55871d79ba66713d928663"
> > +SRC_URI[sha256sum] =3D "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4c=
dab08ca135d02afb77"
> > +
> > +inherit autotools update-alternatives
> > +
> > +S =3D "${WORKDIR}/${PN}"
> > +
> > +ALTERNATIVE_${PN} =3D "sh"
> > +ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
> > +ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
> > +ALTERNATIVE_PRIORITY =3D "100"
> > +
> > +do_compile() {
> > +    chmod +x ${S}/Build.sh
> > +    ${S}/Build.sh
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}${base_bindir}
> > +    install -m 0755 ${S}/mksh ${D}${base_bindir}/mksh
> > +}
> > +
> > +RPROVIDES_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerg=
e', '/bin/sh', '', d)}"
> > --
> > 2.17.1
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

