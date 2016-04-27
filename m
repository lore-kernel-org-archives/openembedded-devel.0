Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 771586FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 09:40:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r12so11182129wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 02:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WfOOf8C2ecbP/2iAbJN0+0V4Ahc6YV0wqE2stInXIBQ=;
	b=ba5shwb8a7oYUxbvZNoc0esS8LCLFNQbSEY+PNvHZctNvlAQPmpp6AnoibQaMaPbmQ
	v5I9RbGEer9gAtYhMIOkS42BrebYx8bPTNDoDLt75TOUoit1u+Wdi/IRj1rhDa132DFK
	RvC/6Y8UJSk+AqzL/DfR3Y4JzKlgkG+9SPX+f8u+45eZPaUziKdkNE+q7n0P7dQdqGKW
	8gJIrHUee9Ram+CQ0fjuTXER4jDpHH8DTwvjRQ9hEMw8jakL2q7ZLhi6vUefYqfeIyU0
	2HI5OGw9VOtK6lCOgGgD7mbNrQCZLm051ZeBoLjl/ZpDTv30key31sjMsF59jKz1NvlN
	6kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WfOOf8C2ecbP/2iAbJN0+0V4Ahc6YV0wqE2stInXIBQ=;
	b=RHApEsLNZuQ6XKm8VynJFsmlDOEufmJ0dboCRFAGGeOMF96LsM31kT4R6sR+VCPaKH
	Q6UirjjH2YDA3bjLIqEdg4D5tp3g4Rr78OBeV+5iQb+ikL/cHVXVihaXI8E8CiykF9uD
	GC6XrKJBrKytIiF9d+FyKisi8SUDdRAx5skCL9JzM7wyDXRMlYf16mnPa2tlABnHCVyb
	o9X0WtZ03pvTs9ynNIcber3tsHBZIcS58l7Jcgye+MFWIqNxZ5U3yl5FjODD3ZIxxE9F
	VKpL+lXLAwgCqZnzwJPaWthRRm05A/YMgpfSJwPPHaIkYg70z/7oDQpHDB2lfb5Icy2s
	c1tg==
X-Gm-Message-State: AOPr4FVmPlQJBHXBtE9oOKrN7+ABDy45CPeR0lhKfOh1wGkSgWO8RAMYeZv9apXTeUvLTQ==
X-Received: by 10.28.30.78 with SMTP id e75mr24676666wme.88.1461750004714;
	Wed, 27 Apr 2016 02:40:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm3037438wjb.48.2016.04.27.02.40.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 02:40:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 11:40:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427094034.GG2559@jama>
References: <1461689867-22284-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1461689867-22284-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe][PATCH] iksemel: Disable gnutls and whitelist it again
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
X-List-Received-Date: Wed, 27 Apr 2016 09:40:06 -0000
X-Groupsio-MsgNum: 61203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline

--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2016 at 09:57:47AM -0700, Khem Raj wrote:
> Change-Id: I67a5edc0e16d5b5f5cbf204f2b2713f1a0c17afb
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/iksemel/iksemel_1.4.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/rec=
ipes-support/iksemel/iksemel_1.4.bb
> index f1276f9..ae26d4b 100644
> --- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
> +++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
> @@ -4,16 +4,14 @@ HOMEPAGE =3D "http://iksemel.googlecode.com"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
> -DEPENDS =3D "gnutls"
> =20
>  PR =3D "r1"
> =20
> -# http://errors.yoctoproject.org/Errors/Details/25825/
> -PNBLACKLIST[iksemel] ?=3D "Not compatible with gnutls version 3.4 curren=
tly in oe-core"
> -
>  SRC_URI =3D "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=3Darc=
hive \
>             file://r25.diff"
>  SRC_URI[archive.md5sum] =3D "532e77181694f87ad5eb59435d11c1ca"
>  SRC_URI[archive.sha256sum] =3D "458c1b8fb3349076a6cecf26c29db1d561315d84=
e16bfcfba419f327f502e244"
> =20
>  inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--disable-gnutls"

Are you using different iksemel version?

ERROR: iksemel-1.4-r1 do_configure: QA Issue: iksemel: configure was passed=
 unrecognised options: --disable-gnutls [unknown-configure-option]
ERROR: iksemel-1.4-r1 do_configure: Fatal QA errors found, failing task.
ERROR: iksemel-1.4-r1 do_configure: Function failed: do_qa_configure

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

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgiNsACgkQN1Ujt2V2gBzNLQCeKK12aHkBoov2JSNBy3g5azsW
5wUAoKowcwKLZ22fJNWVEefWJiH4nj6y
=d4gW
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
