Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2872B76F8A;
	Tue,  1 Sep 2015 19:01:19 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so17321261wic.0;
	Tue, 01 Sep 2015 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=psnFcJV2Y7hbd/WHQeze9OivX981jwnUcU04LrvKn20=;
	b=FPGpfsCqrsQX7SrYY1dZOd9P5PTsREBZifFzdIS9kDYYo7NYHtIbwmQgFlR5a4iND9
	4sy+KNMvF57jXVp3z1wrvip1436u31xtFPUqLKeDLMAD8bD7oKj09Kpq5ONEtWi+aw/+
	4CFkewADqKbPLb3ofuBNv5mxSqjNiqft1EezN99mEqcC7PsRC+FF2fzH+HT6VZIfJ6ku
	qpaEC7ZgLWoYBk1sBzgK6iwcouyNov3UYyyDFQ33MKfdeLu4ijUNC06lU8Wp4D1UEl3d
	lcRY+vf9cN8rsU1CMCkL28MA6z7oSfTFTXvUqDkkyGYdHnFiqMpNgqH8r7xmajydtjGO
	Y1jA==
X-Received: by 10.180.92.225 with SMTP id cp1mr5254298wib.2.1441134079197;
	Tue, 01 Sep 2015 12:01:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f7sm4086981wij.17.2015.09.01.12.01.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 12:01:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Sep 2015 21:01:34 +0200
To: openembedded-devel@lists.openembedded.org,
	leimaohui <leimaohui@cn.fujitsu.com>
Message-ID: <20150901190134.GC2458@jama>
References: <20150831171216.A2C2D50518@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150831171216.A2C2D50518@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] leimaohui : sblim-sfcCommon: add new recipe
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
X-List-Received-Date: Tue, 01 Sep 2015 19:01:20 -0000
X-Groupsio-MsgNum: 57164
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 05:12:16PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 3aa61fb9512449477546320ec46cebf7e39daed0
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D3aa61fb9512449477546320ec46cebf7e39daed0
>=20
> Author: leimaohui <leimaohui@cn.fujitsu.com>
> Date:   Tue Aug 25 13:19:53 2015 +0800
>=20
> sblim-sfcCommon: add new recipe
>=20
> Sblim-sfcCommon is dependence of sblim-sfcb.
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I've already merged this, but can you please rename it to lowercase
sfccommon in follow-up patch? It's showing QA warnings:

sblim-sfcCommon-1.0.1: sblim-sfcCommon-dev doesn't match the [a-z0-9.+-]+ r=
egex
 [pkgname]
sblim-sfcCommon-1.0.1: sblim-sfcCommon-staticdev doesn't match the [a-z0-9.=
+-]+ regex
 [pkgname]
sblim-sfcCommon-1.0.1: sblim-sfcCommon doesn't match the [a-z0-9.+-]+ regex
 [pkgname]
sblim-sfcCommon-1.0.1: sblim-sfcCommon-doc doesn't match the [a-z0-9.+-]+ r=
egex
 [pkgname]
sblim-sfcCommon-1.0.1: sblim-sfcCommon-dbg doesn't match the [a-z0-9.+-]+ r=
egex
 [pkgname]
sblim-sfcCommon-1.0.1: sblim-sfcCommon-locale doesn't match the [a-z0-9.+-]=
+ regex
 [pkgname]

Also please set your git config to show full name ("Lei Maohui <leimaohui@c=
n.fujitsu.com>" instead of "leimaohui <leimaohui@cn.fujitsu.com>")

>=20
> ---
>=20
>  .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0=
=2E1.bb b/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
> new file mode 100644
> index 0000000..0f5515a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Common functions for SBLIM Small Footprint CIM Broker and C=
IM Client Library."
> +DESCRIPTION =3D "\
> +This package provides a common library for functions shared between Smal=
l Footprint CIM Broker (sblim-sfcb) \
> +Small Footprint CIM Client (and sblim-sfcc)."
> +HOMEPAGE =3D "http://sourceforge.net/projects/sblim/"
> +LICENSE =3D "EPL"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df300afd598546add034364cd0a533=
261"
> +SECTION =3D "Development/Libraries"
> +
> +DEPENDS =3D "cmpi-bindings"
> +
> +SRC_URI =3D "http://downloads.sourceforge.net/sblim/${PN}-${PV}.tar.bz2 \
> +          "
> +SRC_URI[md5sum] =3D "8aa2655d97bdea54c4750f220b40990c"
> +SRC_URI[sha256sum] =3D "b9b1037173d6ae0181c3bd5a316ddab5afd6a342ad0dbdc1=
8e940fc0ad2c3297"
> +
> +inherit autotools
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +
> +    rm -rf ${D}${libdir}/libsfcUtil.a
> +    rm -rf ${D}${libdir}/libsfcUtil.la
> +}
> +
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXl9g0ACgkQN1Ujt2V2gBxdBgCgsJB+/wpeD4U4OvLTiDxs3e/S
ymMAnRhrPb50hC7N6TXhI8X6MYZ+KLUs
=Yw0J
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
