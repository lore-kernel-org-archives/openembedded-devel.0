Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P13hk-0003vw-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:56:48 +0200
Received: by gyg8 with SMTP id 8so436683gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4GMSdYitEK6fuI0AgLIT3PU/bVn8tWpqoR5joZc/nCs=;
	b=QMuO7Hrb/5FMRxGsnEByWKSRR4qtxIWg6/1kjraVj2Y8QBzZrZUENFkZZ5bWYtD640
	OogWBo1Mq81IdHgHVc27PZaKseaP8F/8JB09Fi3B/giiveImWcsa5AY9f5uz9ZAl4/Fp
	Y4bIGEOH9BXqgzEwwZC+7vWpgnyB4ePojseOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=orP4G21C40mbX+WJgYlgiIlGk3CpZVIaJyVgcX6+sOVxeR/rFbDpfSru6qSutyLd2V
	BOpx2Ryez/6KCzYu08+QymZbvyuNKmS0N3+rjDgGqyjlvnWxNoDYrUm1fXaz+LNkW1/t
	59e4hivngQWBSoJgRsAojH111JWaMyFAF8xVU=
MIME-Version: 1.0
Received: by 10.231.36.202 with SMTP id u10mr2436686ibd.64.1285793789063; Wed,
	29 Sep 2010 13:56:29 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 13:56:28 -0700 (PDT)
In-Reply-To: <1285792594-10032-15-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-15-git-send-email-obi@opendreambox.org>
Date: Wed, 29 Sep 2010 22:56:28 +0200
Message-ID: <AANLkTinYVSenDQqqN0kTBJq7R0_tpsXUD=iszxv0-3XF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/18] cdparanoia: create libcdparanoia packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Sep 2010 20:56:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Andreas Oberritter <obi@opendreambox.org>:
> * Create separate packages for the libraries, which
> =A0use a different license than the executable:
>
> "The cdparanoia command line tool versions 10.1 and later are
> =A0distributed under the GNU General Public Licence v2.0 or, at your
> =A0option, any later version of the GPL."
>
> "The 10.1 and later release versions of the cdda-interface and
> =A0cdda-paranoia libraries are distributed the GNU Lesser General Public
> =A0License v2.1 or, at your option, any later version of the GNU LGPL."
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/cdparanoia/cdparanoia_10.2.bb | =A0 14 ++++++++++++++
> =A0recipes/cdparanoia/cdparanoia_svn.bb =A0| =A0 15 ++++++++++++++-
> =A02 files changed, 28 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/cdparanoia/cdparanoia_10.2.bb b/recipes/cdparanoia/c=
dparanoia_10.2.bb
> index 7bb6035..894c038 100644
> --- a/recipes/cdparanoia/cdparanoia_10.2.bb
> +++ b/recipes/cdparanoia/cdparanoia_10.2.bb
> @@ -2,6 +2,7 @@
> =A0# Copyright (C) 2005, Advanced Micro Devices, Inc. =A0All Rights Reser=
ved
> =A0# Released under the MIT license (see packages/COPYING)
> =A0LICENSE =3D "GPL"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-=
III-10.2.src.tgz \
> =A0 =A0 =A0 =A0 =A0file://fixes10.patch \
> @@ -17,6 +18,19 @@ S =3D "${WORKDIR}/cdparanoia-III-10.2"
>
> =A0inherit autotools
>
> +PACKAGES +=3D "libcdparanoia libcdparanoia-dev libcdparanoia-static"
> +
> +LICENSE_libcdparanoia =3D "LGPLv2.1"
> +LICENSE_libcdparanoia-dev =3D "LGPLv2.1"
> +LICENSE_libcdparanoia-static =3D "LGPLv2.1"
> +
> +FILES_${PN} =3D "${bindir}/*"
> +FILES_${PN}-dev =3D ""
> +FILES_${PN}-static =3D ""
> +FILES_libcdparanoia =3D "${libdir}/lib*${SOLIBS}"
> +FILES_libcdparanoia-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV}"
> +FILES_libcdparanoia-static =3D "${libdir}/*.a"
> +
> =A0do_install() {
> =A0 =A0 =A0 =A0 oe_runmake BINDIR=3D"${D}/usr/bin" MANDIR=3D"${D}/usr/sha=
re/man/" \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0INCLUDEDIR=3D"${D}/usr/include/" L=
IBDIR=3D"${D}/usr/lib" install
> diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cd=
paranoia_svn.bb
> index 0f81d6c..5610450 100644
> --- a/recipes/cdparanoia/cdparanoia_svn.bb
> +++ b/recipes/cdparanoia/cdparanoia_svn.bb
> @@ -2,7 +2,7 @@
> =A0# Copyright (C) 2005, Advanced Micro Devices, Inc. =A0All Rights Reser=
ved
> =A0# Released under the MIT license (see packages/COPYING)
>
> -PR =3D "r2"
> +PR =3D "r3"
> =A0LICENSE =3D "GPL"
>
> =A0PV =3D "10.2+svnr${SRCPV}"
> @@ -21,6 +21,19 @@ PARALLEL_MAKE =3D ""
>
> =A0inherit autotools
>
> +PACKAGES +=3D "libcdparanoia libcdparanoia-dev libcdparanoia-static"
> +
> +LICENSE_libcdparanoia =3D "LGPLv2.1"
> +LICENSE_libcdparanoia-dev =3D "LGPLv2.1"
> +LICENSE_libcdparanoia-static =3D "LGPLv2.1"
> +
> +FILES_${PN} =3D "${bindir}/*"
> +FILES_${PN}-dev =3D ""
> +FILES_${PN}-static =3D ""
> +FILES_libcdparanoia =3D "${libdir}/lib*${SOLIBS}"
> +FILES_libcdparanoia-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV}"
> +FILES_libcdparanoia-static =3D "${libdir}/*.a"
> +
> =A0do_install() {
> =A0 =A0 =A0 =A0oe_runmake BINDIR=3D"${D}/usr/bin" MANDIR=3D"${D}/usr/shar=
e/man/" \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 INCLUDEDIR=3D"${D}/usr/include/" LIBD=
IR=3D"${D}/usr/lib" install
> --
> 1.7.1
>

I feel there should be an
RDEPENDS_${PN} +=3D "libcdparanioa"
to add the dependency that is now created (if i recall correctly
cdparanoia is statically build).
There is no -doc package?
Other wise this one looks fine to me. Will test tomorrow (time permitting).

Frans


