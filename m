Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaXYx-0006dW-Kh
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 22:35:47 +0200
Received: by mail-ee0-f54.google.com with SMTP id e50so1079839eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2013 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9zEOd/kZWJRx9vzZyEzZ0qq5FqUycvwgmymG7zYqW1o=;
	b=Bernm+aItN66UUJA0aN3mllMvV+3N3a4ifvBjvKkxk+I/LxjuPvZhlVLsfZzgot0XO
	8JWIJVslh8JEVZM5L9Ghimc36ko27f1QJ2+uZQWvDFulvq/JxUJJeVx5q88/gGboYs33
	3RNO4aTE+TMqwnoTIyxMTWy8LNRd/stoewRxFxgDD/vIZ19endFum5oqznH7rPwPNjBQ
	QnQG0Nx5uPE0km5GwMAgT7C0dT+6D3o+1cT8oatuflXRcn33Oy/FVOxB8l8qz5uk36O/
	Q122u9fe7Kzf8IIH4TGaFkwH86SE+5hMyQNTJDNzetlogFtauv94a2HCcWlkYv9B2UQk
	NbXw==
X-Received: by 10.15.95.74 with SMTP id bc50mr32800873eeb.36.1368130655368;
	Thu, 09 May 2013 13:17:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r10sm6284588eez.10.2013.05.09.13.17.33 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 13:17:34 -0700 (PDT)
Date: Thu, 9 May 2013 22:17:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130509201735.GG3188@jama>
References: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Joe.MacDonald@windriver.com
Subject: Re: [PATCH 1/3] macchanger: Fix SRC_URI for multilibs
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
X-List-Received-Date: Thu, 09 May 2013 20:35:49 -0000
X-Groupsio-MsgNum: 44646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For which layer is this? no tag in Subject and path to recipe doesn't even =
start
with meta-networking

=2E/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb

On Thu, May 09, 2013 at 03:03:23PM -0500, Mark Hatle wrote:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  recipes-support/macchanger/macchanger_1.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-support/macchanger/macchanger_1.5.0.bb b/recipes-sup=
port/macchanger/macchanger_1.5.0.bb
> index ff30558..2ecfab2 100644
> --- a/recipes-support/macchanger/macchanger_1.5.0.bb
> +++ b/recipes-support/macchanger/macchanger_1.5.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
> =20
>  PR =3D "r0"
> =20
> -SRC_URI  =3D "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
> +SRC_URI  =3D "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
> =20
>  SRC_URI[md5sum] =3D "79b7cdaeca3d8ebafa764c4b0dd03ab7"
>  SRC_URI[sha256sum] =3D "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb203=
1120826cd73fa8fe"
> --=20
> 1.8.3.rc1.25.g423ecb0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGMBF8ACgkQN1Ujt2V2gBwt5QCfUdvJMznXkohGr2G0i5tzs8ek
QTIAn2VxpnSgJ6JAxFmHGK+E1ky7eTYz
=z3q+
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
