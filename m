Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C11BD6A8BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:33:16 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so3769863eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2PfziyniTFZgWwsIBhkly7D/cNpKEyLjtu8v39hOY+o=;
	b=iG6cSJMX0GF7sY3MREQPtErlTczKVH3Yh63KJq+iC19Uv90PRBwNggty9qfBsqI3Ot
	duOk2mPtrHjk9gXDzl851FH6SAUi4xRUmbnxptATSewueLvi5Qd9t++BEuZ/OYoRlAam
	b8kzaued+PTGsO7/ozEfXw4+t5LBPuaUPNBOpX90gyfUrvs5068qazRQ1DV6G9w8Estc
	9k3DpUchwXwtb1HiFBuJpsz5Aq0y8lNOo9IM9MyNM0WOPstLyf7bsHLd9DIreGnBhlQo
	PDmK1/4SjJC6Y/C6pqyxNEuRFxVD2t5QBdx8VhyY+0DVTPz28HRfHCaumK94A4Ch7R2+
	vqCA==
X-Received: by 10.15.35.129 with SMTP id g1mr17212442eev.110.1370964796727;
	Tue, 11 Jun 2013 08:33:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm21686115eex.17.2013.06.11.08.33.15 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 08:33:16 -0700 (PDT)
Date: Tue, 11 Jun 2013 17:33:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611153339.GF3233@jama>
References: <1370647783-7693-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1370647783-7693-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-gnome][PATCH] gnome-disk-utility: use PACKAGECONFIG for nautilus extension
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
X-List-Received-Date: Tue, 11 Jun 2013 15:33:17 -0000
X-Groupsio-MsgNum: 45035
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline

--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 04:29:43PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb
> index a0fd9bd..1bdae34 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
=2E0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "GNOME disk utility"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9115d11797a5e6b746b4e9b90194=
564"
> =20
> -DEPENDS =3D "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/l=
ibx11 libatasmart nautilus"
> +DEPENDS =3D "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/l=
ibx11 libatasmart"
> =20
>  PR =3D "r3"

Was this patch created from dylan branch?
patching file
meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
Hunk #1 succeeded at 3 with fuzz 2.
Hunk #2 succeeded at 20 (offset 1 line).

PR is r4 since:
commit 4791fb851eb96d5785616b1793d4e6367aa52ad9
Author: Andreas M<C3><BC>ller <schnitzeltony@googlemail.com>
Date:   Fri May 3 12:31:05 2013 +0000

    gnome-disk-utility: backport property DeviceAutomountHint

but resolved and now in queue for jenkins

> @@ -19,6 +19,9 @@ SRC_URI +=3D "\
> =20
>  EXTRA_OECONF +=3D "--disable-scrollkeeper"
> =20
> +PACKAGECONFIG ??=3D "nautilus"
> +PACKAGECONFIG[nautilus] =3D "--enable-nautilus-extension,--disable-nauti=
lus-extension,nautilus"
> +
>  do_configure_prepend() {
>      sed -i -e "s: help : :g" ${S}/Makefile.am
>  }
> --=20
> 1.8.3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3Q1MACgkQN1Ujt2V2gBz4bQCfTv1Z4flonb82NYMa362l4ZAt
0EkAmgIpNb6tQQNRpVNoJShIUfGPoCxv
=ceVE
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--
