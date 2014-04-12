Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5846865D84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 10:47:35 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so4847304eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y8ePnzXLM5zQP9TIUjgNZc7VyCoxQemUlqDCkTM4iT0=;
	b=lufJwztpuc6HrVGoM6IabaJ2pwq8S5hRiQ550fAIi0ebtKXwUo3wtiUC6hFhogEyJn
	gU5+LC7vj/sNuMBd7tGShGmsIxE7HfZnAR7pomKprfFZX6v8VUWoPB95KtTwTo6xVnQh
	Tyk6ebKAAaGBBjqFb0V1iiz5JrxTq1W9Z5OY8TdUIH7xDqhupbT/9Fxkk95eeVME/E6/
	qyb4axMyVyqxCEHvv1JHPbRFIf6sVdXXH9r7GWEZ8Q7FSm+Z57UHU8z+tQPv1IQpF/OD
	xn4Hz89iQxlmq7YfDHxfh1AsUWHXF3FLD1rIXJFV1oQ6JNcapE0OJVEpTgWxCpNihb8t
	5kgg==
X-Received: by 10.15.32.206 with SMTP id a54mr3716693eev.51.1397299656619;
	Sat, 12 Apr 2014 03:47:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm24438067eev.32.2014.04.12.03.47.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Apr 2014 03:47:35 -0700 (PDT)
Date: Sat, 12 Apr 2014 12:47:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140412104745.GX2132@jama>
References: <1396534851-14248-1-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
In-Reply-To: <1396534851-14248-1-git-send-email-ferlandm@sonatest.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] autobahn: fix 'Missing sha256 SRC_URI checksum'
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
X-List-Received-Date: Sat, 12 Apr 2014 10:47:36 -0000
X-Groupsio-MsgNum: 49197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yhqQ34TVR4fE8mPU"
Content-Disposition: inline

--yhqQ34TVR4fE8mPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 10:20:51AM -0400, Marc Ferland wrote:
> ---

Change looks ok, but missing your Signed-off-by.

>  meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/m=
eta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> index a1e8c5f..ac775c4 100644
> --- a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> +++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D " file://autobahn/__init__.py;beginl=
ine=3D1;endline=3D17;md5=3D1fde
> =20
>  SRC_URI =3D "https://pypi.python.org/packages/source/a/autobahn/autobahn=
-${PV}.zip"
>  SRC_URI[md5sum] =3D "160429e7fb043940e79aa7f4ebbab57a"
> +SRC_URI[sha256sum] =3D "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b=
26d6014bb9e6373e"
> =20
>  S =3D "${WORKDIR}/autobahn-${PV}"
> =20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yhqQ34TVR4fE8mPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNJGdEACgkQN1Ujt2V2gBy5KgCeL9F286Udelbe4g2Nk0LPUr63
86cAnj/rAQ3nGEWa2HPpdGQSkZD+dVZ1
=R/uI
-----END PGP SIGNATURE-----

--yhqQ34TVR4fE8mPU--
