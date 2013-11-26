Return-Path: <joe@deserted.net>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 527176BCA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:23:52 +0000 (UTC)
Received: by mail-qe0-f41.google.com with SMTP id gh4so3372173qeb.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=9RkYTld6KZai070//hXXJuf5tfgn2lcvfcHrTn2pWFw=;
	b=UpY/KOdjYP1tbcPpM9RCEEI16WkiQ4dCJZgoDR7VIqcPgPtstGQNMi8KCNq9lNBXKq
	L0ljR0DaVd4ef2hEKKLXhCOMBUYoyevp1rPGkPeeDBMNUvP3L8vY2Ae+WE3g1cS73MqW
	J+7G9LLBwmZ6Z00KphSUzsIuEKtqbklx12mYLSb1YPt2JRqYffxehgJh45hOJSX/rjTS
	9rVYfk11WsR85uKbZl61pqda//LVfSWwhzdx27Tyt80dVmqN1HxL+sDyA0EjZOmFpOdi
	bVC3lqlW5lkljs38emrWpMoCvdMeGOAMh9NFbsbW2eOm2dQFVQkDOsVz/J4JBlsB7ohx
	Losg==
X-Gm-Message-State: ALoCoQmaXNVoFQxz2a0z1W1LUJ1E6PcdAYQVJ0n5wfqI35HnEnNTC9pmHcFAKMc2Y2Gaiv1x/eDk
X-Received: by 10.229.5.4 with SMTP id 4mr57496770qct.2.1385483031570;
	Tue, 26 Nov 2013 08:23:51 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id n7sm6620368qai.1.2013.11.26.08.23.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 08:23:50 -0800 (PST)
Date: Tue, 26 Nov 2013 11:23:48 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131126162347.GC3939@deserted.net>
References: <1384291464-12185-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384291464-12185-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] quagga: use /bin/false as the login shell
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
X-List-Received-Date: Tue, 26 Nov 2013 16:23:52 -0000
X-Groupsio-MsgNum: 47269
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking] [PATCH] quagga: use /bin/false as the login shell] =
On 13.11.13 (Wed 05:24) Robert Yang wrote:

> Use /bin/false as the login shell, just like what Ubuntu does,
> otherwise there might be secure issue.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index 2106c9b..677b1c5 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -148,7 +148,7 @@ INITSCRIPT_PARAMS_${PN}-watchquagga     =3D "defaults=
 90 10"
>  # Add quagga's user and group
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "--system quagga ; --system quaggavty"
> -USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/run/quagga/ -M=
 -g quagga quagga"
> +USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/run/quagga/ -M=
 -g quagga --shell /bin/false quagga"
> =20
>  pkg_postinst_${PN} () {
>      if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
--=20
-Joe MacDonald.
:wq

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEUEARECAAYFAlKUyxMACgkQwFvcllog0Xx6fgCXaC4M3w4sdWpLkusEo6A6efWb
wwCfZWFo4//EKnSR6GXrgdTwVb1jgoE=
=4SsI
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
