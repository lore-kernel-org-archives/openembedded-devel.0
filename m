Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0EC2700F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 14:56:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r129so9515052wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hF7vLUqQ8vsZAyIsG2CcwxMQtXKePh5GlQN7gXO1+p0=;
	b=CBiFzOv2rDFxnrutFXaBE/SMutJiBXPWQMGG790yhi0z+LsuNZCS3Y12SYYvijPlYJ
	RYES9eqGGR7HJvovojrcIR9SoHz/7cX/q2YDpeLDb9vSzctm8ZAerxXk8yDimyJsRKco
	Ee3lSTOrheLnfZjn9ktrMFMcqH+RCNOs/Z41cjCm+eI494/Uimxc6eefx948eiJim9KO
	Er9sFPsGs6mcsXxURPg1d6FL38pbo7yhF9GW9JMuW3nZv9nlWEklPJMaJAwrNrHdbjVC
	zXO7Wa++YFkCozG3n2GYTrjINN01MXkafk7A9w5/q42z6bU0N0iEX9uFMyQgCbMKYEdY
	B2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=hF7vLUqQ8vsZAyIsG2CcwxMQtXKePh5GlQN7gXO1+p0=;
	b=Ty6vqPUJZPydl4NEuPLNGpq7CawLkN5tWamoZIhdC0MVNpaDQZeVYWo3ue1Fg25Tki
	tkfdBIKh9AvUCU/XcQiORnztZirmWI6BQlnYJG7+zsc29Sw4ZCH0ziEQ35NstXJPi4sf
	dgHbo1jWgY3z7H9vDd7OjQovkLn+vJJZvUVpt8eKUN8ekDW6uXUv4ANqS6dvh3Krs6ql
	FUFzpeglpJv18o3zdZd/V6AzOH6K7Bgo9/UxEo+6VN+fAv0aQ03ZPeeNeF7zDW0s1v2q
	MG6w5d9UOeDSq9MCgaZckgSjShIOIdJKY0SSDnqHml+94De9y7NfiXDAjnqMpYGbIsED
	4gwA==
X-Gm-Message-State: AG10YOS6sPRgJQlfa0aeS8hbzDYmS8ht2qdE7BA168j8Jlyjzyqnz6BbxVdvONdSHEX05A==
X-Received: by 10.28.55.209 with SMTP id e200mr12929764wma.2.1454338570627;
	Mon, 01 Feb 2016 06:56:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g1sm12828906wmc.0.2016.02.01.06.56.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 06:56:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 15:58:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201145856.GB2639@jama>
References: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
	<1453266190-95648-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1453266190-95648-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH 2/3] fbset: Fix out of tree builds ( S != B )
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
X-List-Received-Date: Mon, 01 Feb 2016 14:56:11 -0000
X-Groupsio-MsgNum: 59787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 05:03:09AM +0000, Khem Raj wrote:
> Remove assumption about glibc =3D=3D linux
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ding-asm-types.h-is-needed-on-all-linux-s.patch | 34 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/fbset/fbset_2.1.bb         |  9 +++---
>  2 files changed, 39 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fbset/fbset/0001-fbset-includ=
ing-asm-types.h-is-needed-on-all-linux-s.patch
>=20
> diff --git a/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm=
-types.h-is-needed-on-all-linux-s.patch b/meta-oe/recipes-support/fbset/fbs=
et/0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch
> new file mode 100644
> index 0000000..7f45dbe
> --- /dev/null
> +++ b/meta-oe/recipes-support/fbset/fbset/0001-fbset-including-asm-types.=
h-is-needed-on-all-linux-s.patch
> @@ -0,0 +1,34 @@
> +From 06edd88833da93361d5408b880fbb890df332497 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 19 Jan 2016 01:55:47 +0000
> +Subject: [PATCH] fbset: including asm/types.h is needed on all linux sys=
tems
> +
> +including asm/types.h is needed to get Linux typedef's like
> +__s32 and so on which are independent of C library therefore this
> +define should not be guarded by __GLIBC__ but by __linux__
> +
> +Helps to compile it on musl systems
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + fbset.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/fbset.h b/fbset.h
> +index 9b1d2ac..0d8def8 100644
> +--- a/fbset.h
> ++++ b/fbset.h
> +@@ -15,7 +15,7 @@
> + #include <stdio.h>
> + #include <sys/types.h>
> +=20
> +-#ifdef __GLIBC__
> ++#ifdef __linux__
> + #include <asm/types.h>
> + #endif
> +=20
> +--=20
> +2.7.0
> +
> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes=
-support/fbset/fbset_2.1.bb
> index 1855932..ce49019 100644
> --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
> +++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
> @@ -16,15 +16,16 @@ PR =3D "r4"
>  SRC_URI =3D "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.or=
ig.tar.gz \
>             file://makefile.patch \
>             file://fbset-2.1-fix-makefile-dep.patch \
> -"
> +           file://0001-fbset-including-asm-types.h-is-needed-on-all-linu=
x-s.patch \
> +           "


I've removed closing quote indentation change, because it should be
first character on separate line (according to our styleguide).

> =20
>  inherit update-alternatives
> =20
>  do_install() {
>      install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man=
/man5
> -    install -m 0755 ${WORKDIR}/${BP}/fbset ${D}${sbindir}/fbset.real
> -    install -m 0644 ${WORKDIR}/${BP}/*.5 ${D}${datadir}/man/man5
> -    install -m 0644 ${WORKDIR}/${BP}/*.8 ${D}${datadir}/man/man8
> +    install -m 0755 ${B}/fbset ${D}${sbindir}/fbset.real
> +    install -m 0644 ${B}/*.5 ${D}${datadir}/man/man5
> +    install -m 0644 ${B}/*.8 ${D}${datadir}/man/man8
>  }
> =20
>  ALTERNATIVE_fbset =3D "fbset"
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavcrAACgkQN1Ujt2V2gBxGwgCeOlsJQWFUw1w7BUN8rEccIg/f
ngsAn0E5oxKi9GGETbkhamdP6I7i2BKb
=avmT
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
