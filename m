Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id D99906F7A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:08:47 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so3735135eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Auw5TGn2jlB0xeBO/YmGhicT4wIaO6q0p0AMYWkdbSA=;
	b=jWT2gZrlNyhioOfuLOp/lILFLexqzpLZe7nMOC/sajx0HVtqpWk6D3iP1Ijj8D5n4V
	4zP61N5oYko19V3sq6MldCr6mafGu67s0CRxLACeVK2GDiGJ4i/QzrH7WurH6wI2bG/a
	5SYnb/k2S4xLs8MIJY8tFB9kA/KDHtiTcq2AEPlU6pRO3D9kU71/IuCuKXKZTG/fQTNX
	ggyf5xI8+nBsWG1ktho9KMEyh+1l5/ZAjnMfI6iKGPp9jmcyhFtiQO4qqrE6OKhJfZfc
	Zoe75XHShDpJRfB29O38hR/Odpchn6p7krOjbWejjxQiFzAQmVfOG8QFCxCcgNWgntmP
	kiVQ==
X-Received: by 10.14.220.193 with SMTP id o41mr41693613eep.22.1394546927617;
	Tue, 11 Mar 2014 07:08:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm57904673eep.11.2014.03.11.07.08.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:08:46 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:08:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311140858.GA2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-3-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1394227575-27897-3-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 3/7] can-utils: Create git version
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
X-List-Received-Date: Tue, 11 Mar 2014 14:08:48 -0000
X-Groupsio-MsgNum: 48591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 03:26:11PM -0600, Lauren Post wrote:
> Linux CAN network development utilities - newer version than canutils
>=20
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  .../recipes-extended/socketcan/can-utils_git.bb    |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/socketcan/can-utils_git.bb
>=20
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-o=
e/recipes-extended/socketcan/can-utils_git.bb
> new file mode 100644
> index 0000000..53632c8
> --- /dev/null
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Linux CAN network development utilities"
> +DESCRIPTION =3D "Linux CAN network development"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937=
c2bc47fbc49d690"

Please use something from source tree, not COREBASE.

> +DEPENDS =3D "libsocketcan"
> +
> +SRC_URI =3D "git://git.gitorious.org/linux-can/can-utils.git;protocol=3D=
git;branch=3Dmaster"
> +SRCREV =3D "67a2bdcd336e6becfa5784742e18c88dbeddc973"

Please set PV.

> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfGPoACgkQN1Ujt2V2gByf6ACgpj0odf2JUUav+imgkIQgjr3A
75kAn3olsOr7Mk0kjbXhKza5wzcIdsMq
=D1Gc
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
