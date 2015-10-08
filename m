Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C6EA060125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:10:08 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so18292419wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KB89UUSEJj7MgHYfRv0LfaefV3FAylSCIC7BRNGKFRM=;
	b=tD/UpPpvY7gPOMnHqwzzmVXb6FYDfITBxWYYSzRr3vhb4TnU/N/NuMqb6vigR1+VtJ
	BB0PtUkAtgy4Yf0Ib/pdOiWjDRE1EnVk0o+V1SU9Nfpb4h6N8ud36oizRPcHQ+m1IvUq
	TDa0R4j0PRuywFqLhJxGk2cHQqLqGHQVj7SKUOIa5Ea9gYXEBDiLaHRZbN0pWCZVBUxi
	31+Sz4cPdMJ7AkKpPql6relmr+PGszdBiVvn3tP5D52uTO0d7Ol7yz8hZSD7A87BqUxV
	p0JiIrtBpgdb6/R/Noq2psYrjKRGyRXcRWePXX4gpLTAl7NU/bvfvcrZ6QMsCE3kS5yy
	r2nQ==
X-Received: by 10.194.71.83 with SMTP id s19mr6769266wju.150.1444299008272;
	Thu, 08 Oct 2015 03:10:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mc20sm6547237wic.16.2015.10.08.03.10.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:10:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:10:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008101019.GF2385@jama>
References: <1443047695-22567-1-git-send-email-haris.okanovic@ni.com>
MIME-Version: 1.0
In-Reply-To: <1443047695-22567-1-git-send-email-haris.okanovic@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe] [PATCH] inotify-tools: Add
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
X-List-Received-Date: Thu, 08 Oct 2015 10:10:09 -0000
X-Groupsio-MsgNum: 57732
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline

--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 05:34:55PM -0500, Haris Okanovic wrote:
> Add inotify-tools package, a C library and a set of command-line
> programs for Linux providing a simple interface to inotify kernel
> subsystem.
>=20
> https://github.com/rvoicilas/inotify-tools/wiki
> http://lwn.net/Articles/104343/
>=20
> Testing: Built and installed IPK onto an x64 system (OE Fido).
> inotifywatch and inotifywait successfully detected changes to
> a test file.
>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_3=
=2E14.bb
>=20
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb =
b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
> new file mode 100644
> index 0000000..75183ba
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "inotify command line utilities"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dac6c26e52aea428ee7f56dc2c5642=
4c6"
> +
> +SRC_URI =3D "http://github.com/downloads/rvoicilas/inotify-tools/inotify=
-tools-${PV}.tar.gz"
> +SRC_URI[sha256sum] =3D "222bcca8893d7bf8a1ce207fb39ceead5233b5015623d099=
392e95197676c92f"

You're also missing md5sum :/ please test your patches a bit more before
sending them.

> +
> +inherit autotools-brokensep
> --=20
> 2.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQQoACgkQN1Ujt2V2gBwDewCguvAGnFKsGYHbOsnY0hqARXSl
8vcAoKeZ61dUi0G9H7Y6XHaK5gGkVvMi
=QKwg
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
