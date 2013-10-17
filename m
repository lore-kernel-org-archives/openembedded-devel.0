Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDCF60FF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 15:33:59 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1169452eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 08:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fE6WW5IEp/qj2C/bOqShNaPzHfzSGjWURjuxHfhi0Ek=;
	b=uPBxAObRAe+KlFEi26hjm7J38oWWP3ADC30REdU7RT4bubRiiImri/Sf0602wMTL++
	pDgJP+3WAyRgsz/09wR/xVT2apKiPqIpgmMW1VgcGwv0O9RG1cFtqJ9ZjUD3OPlCNAGJ
	zNLIuT232m80+td/g6L2lq5/5hGZ1aTVNiDFdLkIewYilMy/gxcKKqDfjFwzMnWSCiND
	431QvUAHaViRO5vrM0DO4z+Pq4slXphHrC2hYo6qDfWOGZnRuLn6NQwReKCHnlCX+B+j
	+5KoHWUXAWkXpET6pfNXf2RvQ8Xn037nSRcVV9xRKurR/SR5zZJ6VmeZYXOy/zv/EQQo
	1ojQ==
X-Received: by 10.15.98.194 with SMTP id bj42mr13613028eeb.12.1382024040910;
	Thu, 17 Oct 2013 08:34:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm194374200eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 08:34:00 -0700 (PDT)
Date: Thu, 17 Oct 2013 17:34:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131017153405.GC3930@jama>
References: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>
	<1381760413-15098-2-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1381760413-15098-2-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [meta-oe][PATCHv3 1/3] json-c: add 0.11
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
X-List-Received-Date: Thu, 17 Oct 2013 15:34:00 -0000
X-Groupsio-MsgNum: 46772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 03:20:11PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
>=20
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>  meta-oe/recipes-support/json-c/json-c_0.11.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-support/json-c/json-c_0.11.bb
>=20
> diff --git a/meta-oe/recipes-support/json-c/json-c_0.11.bb b/meta-oe/reci=
pes-support/json-c/json-c_0.11.bb
> new file mode 100644
> index 0000000..e0391f5
> --- /dev/null
> +++ b/meta-oe/recipes-support/json-c/json-c_0.11.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "JSON-C implements a reference counting object model that al=
lows you to easily construct JSON objects in C"
> +HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee21=
6f2"
> +
> +SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.=
gz"
> +
> +SRC_URI[md5sum] =3D "aa02367d2f7a830bf1e3376f77881e98"
> +SRC_URI[sha256sum] =3D "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983e=
dbfac9149494448c"
> +
> +PARALLEL_MAKE =3D ""
> +
> +inherit autotools

It conflicts with libjson from oe-core:
WARNING: libjson-0.9 is already registered as shlib
provider for libjson.so.0, ignoring json-c-0.11 trying to register the
same

openembedded-core/meta/recipes-devtools/libjson/libjson_0.9.bb

You probably want to upgrade libjson in oe-core if it's the same json-c...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJgA20ACgkQN1Ujt2V2gByN0gCgpdQgYqU2V6fXqoWs4NR3dXa8
29YAoIEXqfBUrbDhXG+goomAe5wdgLmT
=EGRi
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
