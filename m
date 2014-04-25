Return-Path: <joe@deserted.net>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5060265D10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:27:48 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h18so1633483igc.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=VRd0DDprnKOQuzNCoDKQPiyX4acNOA7cI2t5liN+Rto=;
	b=Vq3yghzpmHlDaS/Q60l5ojR1rreomTWEckPYs3n0+ey9V7Yqncnk741xwzmxiR/UfO
	VnU14R0iMBv77xHDo6IxQYIyWM+38WelXnUOhDm8hXI/gngo2XXl/RYtA+XCig2vvHsS
	m0s0vX/mwQTik8kMI52nE9uG/ul9Hz19O5S3Q+6YlAWYRjHrR+IqOTso+jbGNi4pZmad
	UKByohsh6hzpdDEzTUhaez5mBD6FzfeZRf0ow4uIHx/gd+fCJT8fNnh8+xsMuAFqL9W6
	H555vL3RPwWNzbbbGi0GdALVmfyPxohR36ql4KJJKNkROPP3GNn67boglhEYeQ5xKDxi
	fV8A==
X-Gm-Message-State: ALoCoQl/SXcWZjEws1FLxoPAvwPhcMcxf8uN5+8mZKiftnMCf4PAFsEL+r/FusX52rFIwXZVl1G+
X-Received: by 10.50.109.130 with SMTP id hs2mr2022420igb.29.1398389269256;
	Thu, 24 Apr 2014 18:27:49 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	vf14sm3825921igb.8.2014.04.24.18.27.47 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:27:48 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:27:45 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425012743.GL10115@deserted.net>
References: <1397706091-8116-1-git-send-email-b40290@freescale.com>
	<e3335e4355fc4394b8f955272edc19f0@BY2PR03MB254.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <e3335e4355fc4394b8f955272edc19f0@BY2PR03MB254.namprd03.prod.outlook.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH ] sethdlc: don't search host directories for header files
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
X-List-Received-Date: Fri, 25 Apr 2014 01:27:49 -0000
X-Groupsio-MsgNum: 49477
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0qVF/w3MHQqLSynd"
Content-Disposition: inline

--0qVF/w3MHQqLSynd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chunrong,

[Re: [oe] [meta-networking][PATCH ] sethdlc: don't search host directories =
for header files] On 14.04.23 (Wed 03:21) B40290@freescale.com wrote:

> Pings

Sorry about the delayed response on this.  I'm honestly not entirely
sure what to do with this one.  A while back Trevor Woerner proposed we
remove sethdlc entirely:

http://comments.gmane.org/gmane.comp.handhelds.openembedded/62626

and I was ready to merge that when your update came in.  Your patch
addresses what looks like a host contamination problem, but does it also
address the 2.6.x kernel expectation he mentioned?  If so, or if you
can also take a look at it, great, otherwise I'm thinking it may be
appropriate to remove it entirely.  Age isn't an always an indicator of
obsolescence, of course, particularly in networking stuff where things
get working and don't have to be updated very often, ideally, but this
one is looking a bit suspicious.

-J.

>=20
> Thanks,
> chunrong
>=20
> -----Original Message-----
> From: b40290@freescale.com [mailto:b40290@freescale.com]=20
> Sent: Thursday, April 17, 2014 11:42 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
> Subject: [meta-networking][PATCH ] sethdlc: don't search host directories=
 for header files
>=20
> From: Chunrong Guo <B40290@freescale.com>
>=20
>     *The build process hard-codes searches of various directories
>      in /usr/src/linux/include when looking for header files,
>      delete this to avoid host contamination
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../sethdlc/files/fix-includedir.patch                    | 15 +++++++++=
++++++
>  meta-networking/recipes-connectivity/sethdlc/sethdlc.bb   | 11 +++------=
--
>  2 files changed, 18 insertions(+), 8 deletions(-)  create mode 100644 me=
ta-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch
>=20
> diff --git a/meta-networking/recipes-connectivity/sethdlc/files/fix-inclu=
dedir.patch b/meta-networking/recipes-connectivity/sethdlc/files/fix-includ=
edir.patch
> new file mode 100644
> index 0000000..49d6d42
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.
> +++ patch
> @@ -0,0 +1,15 @@
> +--- a/Makefileold	2014-04-16 22:05:58.070199084 -0500
> ++++ b/Makefile	2014-04-16 22:06:27.153074058 -0500
> +@@ -1,11 +1,10 @@
> + CC =3D gcc
> + CFLAGS =3D -O2 -Wall -W -Wno-long-long -pipe -INCLUDES =3D=20
> +-I/usr/src/linux/include -I/usr/src/linux-2.6/include
> +=20
> + all:		sethdlc
> +=20
> + sethdlc:	sethdlc.c
> +-		$(CC) $(CFLAGS) $(INCLUDES) -o $@ $<
> ++		$(CC) $(CFLAGS)  -o $@ $<
> +=20
> + install:
> + 		install -C -p -s sethdlc /usr/local/sbin/
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/me=
ta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> index 3a9692f..3459a36 100644
> --- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> @@ -1,27 +1,22 @@
>  DESCRIPTION =3D "set Linux HDLC packet radio modem driver port informati=
on"
>  HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
>  LICENSE =3D "GPLv2 & GPLv2+ "
> -LIC_FILES_CHKSUM =3D "file://Makefile;md5=3D19aada31930b2be84bf7138420d7=
7263"
> -
> +LIC_FILES_CHKSUM =3D "file://sethdlc.c;beginline=3D1;endline=3D10;md5=3D=
90f936879e9f8b755a138aeb348782eb"
> =20
>  SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18=
=2Etar.gz \
> +           file://fix-includedir.patch \
>  "
>  SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
>  SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706=
bd5b3d4f6ab6b04e"
> =20
> -
>  S =3D "${WORKDIR}/${BPN}-1.18"
> =20
> -DEPENDS=3D"virtual/kernel"
> -
> -EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}'=
 \
> -              KERNEL_DIR=3D${STAGING_KERNEL_DIR} "
> +EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}'=
"=20
> =20
>  do_compile_prepend () {
>      oe_runmake clean
>  }
> =20
> -
>  do_install() {
>      install -d ${D}/${bindir}
>      install sethdlc ${D}/${bindir}/
> --
> 1.8.3.2
>=20
>=20
--=20
-Joe MacDonald.
:wq

--0qVF/w3MHQqLSynd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZug8ACgkQwFvcllog0Xw4eACfRYT8NB2W5dVECJu1+uruBdpR
KAoAoIE2Ox8RsRlRmwaL0qo9hJ77PdB/
=Ihdi
-----END PGP SIGNATURE-----

--0qVF/w3MHQqLSynd--
