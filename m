Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA53771AE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 18:02:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so59715438wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 10:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4cHRF+FDM4OAYPh8f4m6bjl/AoGLxKnXMlfyjwEqCRw=;
	b=d7X8BuVrQAfgBWv5PlCzM3RCM3Qqkhyivz9nusuYaGXqiniRevIfdOsys/+sFWoTWj
	izwQdEyiBxQlsj7ol3VEFyiIghrKYenKQ1esyUkiS35wiBVckz+QI+0b/3dQ84p7qVOB
	ExdB128LYTlntPa5cWCx8DN6oucqbmLe8IhI7YmCz32ZFXthKaW6wc467kk5R7a8tC9B
	I5RIubGC0HjQ4d8MPxxgw5cgL/6gIAZghVAYfSzxOMi32KI8ywpg2NweU5suR9ZRjbJS
	yKliksMjsNS/sztooB0UH7gxbcxXlidNHY4ZFRwD+oBgHTe1U9hwYucN4BAVVF0/GL7R
	WxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4cHRF+FDM4OAYPh8f4m6bjl/AoGLxKnXMlfyjwEqCRw=;
	b=fNfu0pLoHtfF4ISYpPD0u76zARRCfvXd+wBufoRF96V8aofJ2/FZHyAqd41Cw9h9Zm
	dPs6UY7bJqNWBOFL0Ngqfai3hboswmK9IjTyYKrBAymxzOOMj+jXrXGGo/qWoxDeZdxg
	RVh7qdPZmXJ1FJm5lNhJE8ReSwC7m2kI8Qc/po/jRbXEErOitzWbhMYRSxmUxqEJzAVk
	txeLtZvOn2zjOAYxWZzDvuro9Z1vEr8P+OjhXsl8JrsBwtMCnNA8Sk1QnmV0eg8qtajc
	tIvV2Nevr3Pqjfk65geoRAxNqMPjIne+29g4izGkX61PmpkFW8jPOmscWulLiyMGuesY
	efNw==
X-Gm-Message-State: AIkVDXIy0ZRoEfSvw8yYkQ/T4Hc/5pPJWbKKk0tjv6dYmwqD9PwD4zMRsx+vVuaIy0Mx2g==
X-Received: by 10.28.14.65 with SMTP id 62mr64110221wmo.85.1483639379464;
	Thu, 05 Jan 2017 10:02:59 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	kp5sm104907172wjb.8.2017.01.05.10.02.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Jan 2017 10:02:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Jan 2017 19:02:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170105180258.GA3243@jama>
References: <1483345698-2761-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
MIME-Version: 1.0
In-Reply-To: <1483345698-2761-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-networking][PATCH] tcpdump: upgrade to 4.8.1
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
X-List-Received-Date: Thu, 05 Jan 2017 18:03:01 -0000
X-Groupsio-MsgNum: 64642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2017 at 09:28:18AM +0100, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Causes:
ERROR: tcpdump-4.8.1-r0 do_configure: QA Issue: tcpdump: configure was pass=
ed unrecognised options: --enable-ipv6 [unknown-configure-option]
ERROR: tcpdump-4.8.1-r0 do_configure: Fatal QA errors found, failing task.
ERROR: tcpdump-4.8.1-r0 do_configure: Function failed: do_qa_configure

> ---
>  .../recipes-support/tcpdump/{tcpdump_4.7.4.bb =3D> tcpdump_4.8.1.bb}    =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb =3D> tc=
pdump_4.8.1.bb} (91%)
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/m=
eta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> similarity index 91%
> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> index e18228f..18efb9b 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
> @@ -12,8 +12,8 @@ SRC_URI =3D " \
>      file://add-ptest.patch \
>      file://run-ptest \
>  "
> -SRC_URI[md5sum] =3D "58af728de36f499341918fc4b8e827c3"
> -SRC_URI[sha256sum] =3D "6be520269a89036f99c0b2126713a60965953eab921002b0=
7608ccfc0c47d9af"
> +SRC_URI[md5sum] =3D "32f57943649f276e09236ba66622bb0c"
> +SRC_URI[sha256sum] =3D "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb4=
96d51f0ae88d831c"
>  export LIBS=3D" -lpcap"
> =20
>  inherit autotools-brokensep ptest
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWG6KRAAKCRA3VSO3ZXaA
HImwAJ9eEY/xoenYeUhy+fPWWtS9o8QZbACaAxXOqq2QK4s8fw8KnvXyGfRRoTU=
=Cd31
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
