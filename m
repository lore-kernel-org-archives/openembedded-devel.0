Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D347373173
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:15:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so12762119wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KFlDAPT88tGo7rEPP2Iec0FUgDsp4Zmj5E3MISLXJbA=;
	b=U+0hLP2GCRbVruW+YLa1aBvrS6K+boy7GmRbhqAdhgcAMlY4eqn9z3jB6hG7ajrNgu
	UggPWUBddqkCg14ptkPy6+EkwdJLoBEZ4UmcRVDjqwj0LkMSeFgdcSjgZgEjylI5+zph
	hONexOu2gwl/yFctFe5hGd4PrlBoDWFVRAPBNxykm9cD5jRUusYVVQ/10p6b/lwq4IzP
	4K7tD2IeFjhTWTfJmEnY3LAmC5qqQaZ/udB1BsnrOXkiM3j+DJqNciL4D2ynssanQ4xp
	OqH0uJxL+3axDJLeE325XlCYgneyO5daP7yKSc3aCQK/oNmGsSPOBiPYC3RNxrsIGn2A
	1rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KFlDAPT88tGo7rEPP2Iec0FUgDsp4Zmj5E3MISLXJbA=;
	b=SZrspQjm/igXxMNUREGK125+/TWEgJSI+LxjZAG/Emq2+VAgsYB/dixI4O2K/TMZ39
	nBZhUTFS1b+IMF+SCy/GByRwZrMSvbsIH18O1qj8KT7Si9n4TwiWmJWPFboQKB+ecUqp
	LZ5KR6vblK3TQYeVvpYU+dmzhSBn1p/HQzYllsLnJ2XSgn7ku9jlbxgdbL6N+o6b6Ge3
	lJaw0lVFl0NL9mH1GXD3mo1k0hc3EHKYuAGC+NJaXIZql8AU4kzNqzmt/wNnXQjt91ho
	vqZchD5rRKFx6kcZXqG1BbX4Vsa1aiRu6fRKAd6n+Qkh2PcD/AgWwCEXUBiCxzeWJy6E
	0oAQ==
X-Gm-Message-State: AD7BkJJ/mXLQDzZ0Jl1YUC9Li8Yd5aWpAdXqJ+eEsVCsRIMkdF77Pv1IHHIBJde85uBClQ==
X-Received: by 10.194.118.106 with SMTP id kl10mr11414944wjb.154.1458828910743;
	Thu, 24 Mar 2016 07:15:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hx10sm7572320wjb.25.2016.03.24.07.15.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 07:15:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2016 15:19:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160324141948.GA2518@jama>
References: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
	<1458318648-6295-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1458318648-6295-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 2/2] libftdi: Fix cpp-wrapper options
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
X-List-Received-Date: Thu, 24 Mar 2016 14:15:11 -0000
X-Groupsio-MsgNum: 60654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 05:30:48PM +0100, Martin Jansa wrote:
> * fixes following issue found with test-dependencies
>   WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build depende=
ncy?
>   WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build depe=
ndency?
> * when boost is found it was still building libftdipp1.so.2.2.0
> * as shown in log.do_package:
>   DEBUG: calculating shlib requirements for libftdi
>   DEBUG: libftdi: Dependency libftdi1.so.2 requires package libftdi (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lib=
ftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
>   DEBUG: libftdi: Dependency libusb-1.0.so.0 requires package libusb1 (us=
ed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/l=
ibftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
>   DEBUG: libftdi: Dependency libstdc++.so.6 requires package libstdc++ (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/=
libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
>   DEBUG: libftdi: Dependency libgcc_s.so.1 requires package libgcc (used =
by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libf=
tdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
>   DEBUG: libftdi: Dependency libusb-1.0.so.0 requires package libusb1 (us=
ed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/l=
ibftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdi1.so.2.2.0)
>   DEBUG: libftdi: Dependency libc.so.6 requires package glibc (used by fi=
les: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1=
=2E2-r0/packages-split/libftdi/usr/lib/libftdi1.so.2.2.0)
>   DEBUG: Python function package_do_shlibs finished
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/libftdi/libftdi_1.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb b/meta-oe/rec=
ipes-support/libftdi/libftdi_1.2.bb
> index eb4d86c..1d15711 100644
> --- a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D "a6ea795c829219015eb372b03008351=
cee3fb39f684bff3bf8a4620b55
>  S =3D "${WORKDIR}/${BPN}1-${PV}"
> =20
>  PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don,-DFTDI_BUILD_CPP=
=3Doff,boost"
> +PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don -DFTDIPP=3Don,-DFT=
DI_BUILD_CPP=3Doff -DFTDIPP=3Dooff,boost"

s/ooff/off/g

already done in master-next branch

> =20
>  inherit cmake binconfig pkgconfig
> =20
> --=20
> 2.7.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbz94MACgkQN1Ujt2V2gBxAWgCeP1kQ1Q/joKjJqClh8I739V8M
BKEAn2SwO2QyHpNrGd0ZJCR7nCoSNZ2J
=6QL5
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
