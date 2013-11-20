Return-Path: <joe@deserted.net>
Received: from mail-qe0-f50.google.com (mail-qe0-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id C98396D6F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 21:34:10 +0000 (UTC)
Received: by mail-qe0-f50.google.com with SMTP id 1so6750324qee.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=wOUvH8QAzeCiqAobTAB8PmgpUfk2AHReUQ4MSlVUNgU=;
	b=GXfretMHDQI0HT8IrYs/6ZEyUp9U8nuhnZGD7niQ3Qvh19frVi1bWC6Wr2hIFIZIU5
	1kM2sTXbUZJPdQmxlKfR2tG8jhhiLVAwvKSgUgo1rZPGyCfnFMrQtt298zDB3YyeaMFX
	NRBkoPMMEeZN3ENPlh6b5VQmc2NuhzUErF3xOp558OhWQI24wgQXhNtdzgmU07+tyuMP
	uBQFxKn4JhT2ISgR0VVddTuGWKCzSHTvxCmNvC7QXycGljCUQCpNJlUT+VIWXkI1d4Bx
	CK6cLhzh//ts8z+og6VF14KeV1jU2RKF4j7PrfRMGeurqVFViUXNWvB1G4SiybUSIiFA
	5JJw==
X-Gm-Message-State: ALoCoQnJ5eyQaFo3Ip6IywS16e+nNViIXJ10vBWu3y3vRurT62fb2Mby7KihlgmSD8VlO8ChDF3V
X-Received: by 10.224.54.5 with SMTP id o5mr5539140qag.9.1384983252457;
	Wed, 20 Nov 2013 13:34:12 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h2sm26155944qaf.10.2013.11.20.13.34.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Nov 2013 13:34:11 -0800 (PST)
Date: Wed, 20 Nov 2013 16:34:09 -0500
From: Joe MacDonald <joe@deserted.net>
To: b40290@freescale.com
Message-ID: <20131120213407.GC3748@deserted.net>
References: <1383533016-31244-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1383533016-31244-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3 2/3] barnyard2: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2013 21:34:11 -0000
X-Groupsio-MsgNum: 47217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

And also merged.  Thanks.
-J.

[[oe] [meta-networking][PATCH v3 2/3] barnyard2:  add recipe] On 13.11.04 (=
Mon 10:43) b40290@freescale.com wrote:

> From: Chunrong Guo <B40290@freescale.com>
>=20
>   *Barnyard2 is a output system for Snort
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../barnyard2-1.8/barnyard2-cross-fix.patch        |   21 ++++++++++++++=
++++++
>  .../barnyard2/barnyard2_1.8.bb                     |   18 ++++++++++++++=
+++
>  2 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/barnyard2/barnya=
rd2-1.8/barnyard2-cross-fix.patch
>  create mode 100644 meta-networking/recipes-connectivity/barnyard2/barnya=
rd2_1.8.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8=
/barnyard2-cross-fix.patch b/meta-networking/recipes-connectivity/barnyard2=
/barnyard2-1.8/barnyard2-cross-fix.patch
> new file mode 100644
> index 0000000..0e94598
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnya=
rd2-cross-fix.patch
> @@ -0,0 +1,21 @@
> +Index: barnyard2-1.8/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- barnyard2-1.8.orig/configure.in	2010-08-03 15:12:06.000000000 +0400
> ++++ barnyard2-1.8/configure.in	2010-08-03 15:13:46.000000000 +0400
> +@@ -73,7 +73,6 @@
> +     # libpcap doesn't even LOOK at the timeout you give it under Linux
> +     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap timeout is ign=
ored])
> +     AC_SUBST(extra_incl)
> +-    extra_incl=3D"-I/usr/include/pcap"
> +     ;;
> +   *-hpux10*|*-hpux11*)
> +     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
> +@@ -230,7 +229,7 @@
> + # In case INADDR_NONE is not defined (like on Solaris)
> + have_inaddr_none=3D"no"
> + AC_MSG_CHECKING([for INADDR_NONE])
> +-AC_RUN_IFELSE(
> ++AC_COMPILE_IFELSE(
> + [AC_LANG_PROGRAM(
> + [[
> + #include <sys/types.h>
> diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8=
=2Ebb b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> new file mode 100644
> index 0000000..14acdac
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Barnyard2 is a fork of the original barnyard project, d=
esigned specifically for Snort's new unified2 file format"
> +HOMEPAGE =3D "http://www.securixlive.com/barnyard2/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +DEPENDS =3D "libpcap"
> +
> +SRC_URI =3D " \
> +	http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \
> +	file://barnyard2-cross-fix.patch \
> +	"
> +SRC_URI[md5sum] =3D "72fc6c490db6ea6a0f46c27d24998067"
> +SRC_URI[sha256sum] =3D "1abfe6530d721debd98921421722b02c844c289564730b1e=
85729e4915b2bb7a"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--enable-prelude --enable-gre --without-mysql"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/barnyard2.conf"
--=20
-Joe MacDonald.
:wq

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKNKs8ACgkQwFvcllog0XyJzACfXH4Y+XutSx27gOa+59bS/SoR
iI0An3hq3f0UtUMSi67hvjN80eGPsl/i
=XKey
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
