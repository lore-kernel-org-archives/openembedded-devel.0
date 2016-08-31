Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87CCA6FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 18:10:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d196so4670162wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uD+G88wggUyT7pZre7zuERgjXYyeskfgmBZl2JO9LQE=;
	b=zffw/HFzkYrFtgKbRsN/sciK+qcf4BEH+q8+H+3eibZWpALBBc8OFzjrsQSJNYCvDC
	xinMSp8w+G0Zw6qd9sMDoSADbXAG5AQ58/6m1iuhPRR2Y9BcDyW1L5FXcQmxHsQEQXG/
	xgDut15ISQ0twa5ZLoO/5m88nc4mixi7znd8LfmuD8h1Jvpdg2a33Y8/HyMjGiFAUG/S
	17Aaa40oHtsP6iSX2rOeeeWjDrt02dgaHLTuSv6tmTU4jgUEYKqsrFrLAHWwAu89Zu4+
	izzqrvdqBnBawrP6L9ayrnwQIJj9O32B9MOQ6EKxRGFFlFVPhSSk1JQS0WrYzKsaOj+d
	IVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uD+G88wggUyT7pZre7zuERgjXYyeskfgmBZl2JO9LQE=;
	b=hv6GnyRXQkZLdBRXE/bZDufn+LmljFklTFXzmJ9jwjX3Nrr3i+DJUPbijpTzPYQTSx
	jdCp6YEQo14v2BLxjPPgVd9w30l7BLC0c9k9BR3ygcw1oSCGbqGKk2e8Ccxtnj9NETeK
	5Ge4cUR7ZCzniaXIiIQY3KWbAqVWnr3mYENcRfzVZMYR2aBBrHcSikxFmOFx4Zs8i+Ca
	WV2NkK4hTtS6zVSM6oNPSzzvYzNJhIIHLiHmWzFoVwPvfkm3uaSsIFsE7mxZCKOrfqOy
	0YRGmD4X07DhB7H5SEOQgOoy0IthvyWWVpdYJxGExVHJsb+rNpqzsVUZqfVv4+JFt4tg
	z88w==
X-Gm-Message-State: AE9vXwOu9FI/wZDT6AoKJvBHcJCSZ7mh2EHMyGc9J7+cXaa4wOl922HsqQT/WvZNzLF4qA==
X-Received: by 10.28.4.194 with SMTP id 185mr24006515wme.91.1472667001548;
	Wed, 31 Aug 2016 11:10:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	wr2sm1046634wjb.12.2016.08.31.11.10.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 11:10:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 20:10:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831181000.xdrlcpn4xw5zsll2@jama>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
	<1471892491-6177-13-git-send-email-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1471892491-6177-13-git-send-email-fabio.berton@ossystems.com.br>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-python][PATCH 13/17] python-requests, python3-requests: Update to version 2.11.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 18:10:04 -0000
X-Groupsio-MsgNum: 62913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytcxyrybugcsgo7z"
Content-Disposition: inline

--ytcxyrybugcsgo7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 04:01:27PM -0300, Fabio Berton wrote:
> This commit also change RDEPENDS code style and add python-urllib3
> as runtime dependence.
>=20
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta-python/recipes-devtools/python/python-requests.inc | 17 +++++++++++=
+++---
>  ...hon-requests_2.10.0.bb =3D> python-requests_2.11.1.bb} |  0
>  ...n3-requests_2.10.0.bb =3D> python3-requests_2.11.1.bb} |  0
>  3 files changed, 14 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-requests_2.10.0.bb =
=3D> python-requests_2.11.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-requests_2.10.0.bb =
=3D> python3-requests_2.11.1.bb} (100%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/me=
ta-python/recipes-devtools/python/python-requests.inc
> index e00b257..287078a 100644
> --- a/meta-python/recipes-devtools/python/python-requests.inc
> +++ b/meta-python/recipes-devtools/python/python-requests.inc
> @@ -3,7 +3,18 @@ HOMEPAGE =3D "http://python-requests.org"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd9bb3515869c0f426cb8441c899ae=
7f5"
> =20
> -SRC_URI[md5sum] =3D "a36f7a64600f1bfec4d55ae021d232ae"
> -SRC_URI[sha256sum] =3D "63f1815788157130cee16a933b2ee184038e975f0017306d=
723ac326b5525b54"
> +SRC_URI[md5sum] =3D "ad5f9c47b5c5dfdb28363ad7546b0763"
> +SRC_URI[sha256sum] =3D "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3=
ef545f46eae1a133"
> =20
> -RDEPENDS_${PN} =3D "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-ne=
tserver"
> +RDEPENDS_${PN} +=3D " \
> +    ${PYTHON_PN}-email \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-ndg-httpsclient \
> +    ${PYTHON_PN}-netserver \
> +    ${PYTHON_PN}-pyasn1 \
> +    ${PYTHON_PN}-pyopenssl \
> +    ${PYTHON_PN}-pysocks \
> +    ${PYTHON_PN}-urllib3 \
> +"

There is already 2.11.0 version in master-next and this RDEPENDS
additions break python3 version:

ERROR: Nothing RPROVIDES 'python3-pysocks' (but /home/jenkins/oe/world/shr-=
core/meta-openembedded/meta-python/recipes-devtools/python/python3-requests=
_2.11.1.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-pysocks' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pysocks']
NOTE: Runtime target 'python3-requests' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-requests', 'python3-=
pysocks']
NOTE: Runtime target 'python3-pymisp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pymisp', 'python3-re=
quests', 'python3-pysocks']
NOTE: Runtime target 'python3-pymisp-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pymisp-dev', 'python=
3-requests', 'python3-pysocks']

> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-requests_2.10.0.b=
b b/meta-python/recipes-devtools/python/python-requests_2.11.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-requests_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python-requests_2.11.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.10.0.=
bb b/meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ytcxyrybugcsgo7z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHHXgACgkQN1Ujt2V2gBxY2gCeOaygj7oTFbXVpYEd189EXOVC
8HgAniYVdXYQrh+uO3OsX3abgQyKjt45
=e8kZ
-----END PGP SIGNATURE-----

--ytcxyrybugcsgo7z--
