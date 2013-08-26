Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 68E506008D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 11:16:40 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so1530108eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SKnZOY/oEbYUIVUyLH/cqNzuf5dfNsh8+7CUDj+Xzso=;
	b=RLSgFFvjMwz/V32qTb/qgUZzBY/yPeIYnvUg8oba2/YFJVW+UcVoWp+OYzyGoTHsvK
	lMYYCjPjZGW2a3PM7gQGLerCl3i2RPZYu9jke1HPmk2mnHlWbYbZp4Y/7nQgDPdkITjE
	bXmlfNLDofJRI+MCJMS9pPtzhgQ/d8yUQWFSkI63FQ/dgQKZolPXfDCOpDFUuVRIcEAw
	JadQ1GHzN+kYiVw1K4tVTh7eb1LWmeBJaW2hSMmaOM54SIQX4U0pQR9iv61t68Ngy7/R
	jX3Z1dKGhqUK2kBo8jr5sriO/PwHElNrM48SDW7WDEVj492QccLDQzBPS2vaYk/OujN7
	KB+Q==
X-Received: by 10.14.224.198 with SMTP id x46mr2845314eep.53.1377515799845;
	Mon, 26 Aug 2013 04:16:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm20595237eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 04:16:39 -0700 (PDT)
Date: Mon, 26 Aug 2013 13:17:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20130826111749.GQ3544@jama>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] ACPICA updates
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
X-List-Received-Date: Mon, 26 Aug 2013 11:16:40 -0000
X-Groupsio-MsgNum: 45851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5AmtYbcgdBTTPS58"
Content-Disposition: inline

--5AmtYbcgdBTTPS58
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 01:33:12PM +0300, Fathi Boudra wrote:
> Fathi Boudra (3):
>   acpica: fix parallel build
>   acpica: fix recipe to be OE compliant with spacing
>   acpica: bump to version 20130823

Looks good, thanks.

Only last commit would look even better when sent with -M, but I'm OK
with comparing them locally.

>=20
>  meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ----------
>  meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ++++++++++
>  .../acpica/files/fix-parallel-build.patch          | 80 ++++++++++++++++=
++++++
>  3 files changed, 117 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
>  create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
>  create mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-bu=
ild.patch
>=20
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5AmtYbcgdBTTPS58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbOV0ACgkQN1Ujt2V2gBx6UACeK2p0sVJeJ2rP4ZVMNFZ5f4EQ
FhEAoKvzHmW+MCJxp0l684Sie+fciN4z
=e9DG
-----END PGP SIGNATURE-----

--5AmtYbcgdBTTPS58--
