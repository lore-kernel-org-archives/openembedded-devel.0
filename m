Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PdyC1-0006ql-9n
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 05:56:49 +0100
Received: by fxm17 with SMTP id 17so3459930fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 20:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=olP/pIfN7bxxhS9XufC/iTFwfhnGK7pgFdFsg3irrjc=;
	b=JlaJsswpB0VgA3TlFIpFiAPQd8jDY85fU7ls7M3oz7Nrynmn2k2gjzXLsnEdxiRECX
	dBbNDn5BS1EyFa9F2ueqIUdybN8DTvxi1yIyDP6BePvgSfvac4H+jE+AA8N5d9VHNz7v
	PHG3dHVwRRyXMHcPfK604498lQySwMZGlNAwg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hF90mBY7CMe983x/Ea1CphUgkkZ0chaZjCX8uR/tpVPOriGD4FXHtHRr6UHTY5vOHe
	lFWlrsx2aTaWHCqNwLhbnCgc4udXR/fDcNfKPqLn1dk8wXMBM44Z0QNxQc2uJOjCSxiD
	r0SiHk3SUFPGvGnufMdjipJ1X1xsyZLMvLUGI=
Received: by 10.223.96.202 with SMTP id i10mr1710876fan.50.1295067373280;
	Fri, 14 Jan 2011 20:56:13 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a2sm751951faw.22.2011.01.14.20.56.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 Jan 2011 20:56:12 -0800 (PST)
Date: Sat, 15 Jan 2011 05:56:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110115045639.GD21179@jama>
References: <1295043924-18487-1-git-send-email-lm@larsmichelsen.com>
MIME-Version: 1.0
In-Reply-To: <1295043924-18487-1-git-send-email-lm@larsmichelsen.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Fix building of package live555
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
X-List-Received-Date: Sat, 15 Jan 2011 04:56:49 -0000
X-Groupsio-MsgNum: 28063
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 11:25:24PM +0100, Lars Michelsen wrote:
> The file http://www.live555.com/liveMedia/public/live.2010.10.15.tar.gz
> did not exist anymore on the server.
>=20
> So bumped version to the current file: live.2011.01.10.tar.gz
>=20
> Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
> ---
>  recipes/live555/live555_20101015.bb |    7 -------
>  recipes/live555/live555_20110110.bb |    7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  delete mode 100644 recipes/live555/live555_20101015.bb
>  create mode 100644 recipes/live555/live555_20110110.bb
>=20
> diff --git a/recipes/live555/live555_20101015.bb b/recipes/live555/live55=
5_20101015.bb
> deleted file mode 100644
> index eb6dfe3..0000000
> --- a/recipes/live555/live555_20101015.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require live555.inc
> -
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI[md5sum] =3D "29734ddc6fddbb1a3a8f51a6de7a21c5"
> -SRC_URI[sha256sum] =3D "278d99c0880f324769164d6872fea88f8d82ec5b87bb66c9=
2035f46ee2f10adc"
> -
> diff --git a/recipes/live555/live555_20110110.bb b/recipes/live555/live55=
5_20110110.bb
> new file mode 100644
> index 0000000..cf64b83
> --- /dev/null
> +++ b/recipes/live555/live555_20110110.bb
> @@ -0,0 +1,7 @@
> +require live555.inc
> +
> +PR =3D "${INC_PR}.1"

new versions should start with 0 (in this case "${INC_PR}.0")

> +
> +SRC_URI[md5sum] =3D "978cd8443735d47b53ee624a985a047e"
> +SRC_URI[sha256sum] =3D "39f23d4c140f9a0bfd6fa11f38c75ae8c3b4fab1930ca1ac=
b8ad66e70947dbc1"
> +
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0xKQcACgkQN1Ujt2V2gBy8tgCgp8u9bR9GQYFt9NZgN34AbkYS
vwEAoJl+l6/+Zeu6DFrcGmd08IKSwdJb
=6Wy2
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
