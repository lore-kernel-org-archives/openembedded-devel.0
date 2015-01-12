Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 39C347246D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 14:40:27 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so14882097wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gJkVhabZWkIpHj6UkqD/iJFkCJCQDKxYfei+ygczbkw=;
	b=bDhCRvjNzs/nCzWjyrK69zzLJN3pdP4zAULmUoZ5B0atOR3qlIh2bCGPnOXsyJnS+S
	9/S+SLzRPqSxOKTwNgMmjzKqwHjfvZUK6eSE7Ch6eDwOZoEax/JSmQAbpa7Dv0owDp6m
	dE5uEvWWRTFSR2Adw/ybmUBjQ50Wg43hJr6hqx787T8IKWaItIpzUhieVOohv4aXxLDy
	RvhTcKtiL7ae7rx4mNOoSugpPDhvIqrSkfoMM6bQhSJIHk+6hGggVyta8NQuzyvgoTB3
	NZNqRYjr1mFt7pl54aM9uEUgR7jTgVX1AyCJDWYyGeNDtaoWphCyqj4s6JxLipeWulYR
	ZG+A==
X-Received: by 10.194.93.5 with SMTP id cq5mr4498999wjb.84.1421073627520;
	Mon, 12 Jan 2015 06:40:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u3sm10449406wiw.24.2015.01.12.06.40.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jan 2015 06:40:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Jan 2015 15:40:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150112144028.GC2513@jama>
References: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: otavio@ossystems.com.br
Subject: Re: [meta-oe][dizzy]PATCH] php5: update to later minor version 5.4.36
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
X-List-Received-Date: Mon, 12 Jan 2015 14:40:34 -0000
X-Groupsio-MsgNum: 53810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline

--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2015 at 04:30:34AM -0800, Armin Kuster wrote:
> Dizzy is missing several CVE's and upgrading to a later version within th=
e same
> series seems reasonable since most changes are bugfixes or Security relea=
ted.
>=20
> if you are ok with this approach, please Ack and I will stage this with t=
he next series of updates I am working on.

Looks good, except missing [ before "PATCH]" which breaks commit
subject when cherry-picking from patchwor.

>=20
> - armin
>=20
> 18-Dec-2014
> Core:
>     Upgraded crypt_blowfish to version 1.3.
>     Fixed bug #68545 (NULL pointer dereference in unserialize.c).
>     Fixed bug #68594 (Use after free vulnerability in unserialize()). (CV=
E-2014-8142)
>=20
> Mcrypt:
>     Fixed possible read after end of buffer and use after free.
>=20
> 13 Nov 2014
> Core:
>     Fixed bug #68365 (zend_mm_heap corrupted after memory overflow in zen=
d_hash_copy).
> Fileinfo:
>     Fixed bug #68283 (fileinfo: out-of-bounds read in elf note headers). =
(CVE-2014-3710)
> GMP:
>     Fixed bug #63595 (GMP memory management conflicts with other librarie=
s using GMP).
> PDO_pgsql:
>     Fixed bug #66584 (Segmentation fault on statement deallocation).
>=20
> 16 Oct 2014
> Fileinfo:
>     Fixed bug #66242 (libmagic: don't assume char is signed).
> Core:
>     Fixed bug #67985 (Incorrect last used array index copied to new array=
 after unset).
>     Fixed bug #68044 (Integer overflow in unserialize() (32-bits only)). =
(CVE-2014-3669)
> cURL:
>     Fixed bug #68089 (NULL byte injection - cURL lib).
> EXIF:
>     Fixed bug #68113 (Heap corruption in exif_thumbnail()). (CVE-2014-367=
0)
> OpenSSL:
>     Reverted fixes for bug #41631, due to regressions.
> XMLRPC:
>     Fixed bug #68027 (Global buffer overflow in mkgmtime() function). (CV=
E-2014-3668)
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-devtools/php/{php_5.4.33.bb =3D> php_5.4.36.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php_5.4.33.bb =3D> php_5.4.36.bb} (=
97%)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_5.4.33.bb b/meta-oe/recipes=
-devtools/php/php_5.4.36.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/php/php_5.4.33.bb
> rename to meta-oe/recipes-devtools/php/php_5.4.36.bb
> index 6fdfe0f..43c7736 100644
> --- a/meta-oe/recipes-devtools/php/php_5.4.33.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.4.36.bb
> @@ -30,8 +30,8 @@ SRC_URI_append_class-target +=3D " \
>              file://php-fpm-apache.conf \
>            "
> =20
> -SRC_URI[md5sum] =3D "c6878bb1cdb46bfc1e1a5cd67a024737"
> -SRC_URI[sha256sum] =3D "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d=
19b74c2278e40bb5"
> +SRC_URI[md5sum] =3D "70e223be4bb460e465b7a9d7cb5b9cac"
> +SRC_URI[sha256sum] =3D "b0951608c3e8afb978a624c7f79a889980210f5258f666c1=
d997bd6491e13241"
> =20
>  S =3D "${WORKDIR}/php-${PV}"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSz3NwACgkQN1Ujt2V2gBydtACdF7L/5C+zGJ6lVxLPhWH8P3o6
t5UAn0hKsqvVbhk43V3lk9Gl8aswARWR
=mrEI
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
