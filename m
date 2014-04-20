Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A76E465DD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:29:56 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2926495eei.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5v9dVDuD3mC4gxu8Bl2JcBIkHM0o8XKwP1sZBle0TT8=;
	b=w8QnMGFsyXfc5TfEpiGIHr1P0fK2D3EGGaPF1fPVcEwd/x330PDBW4ITX8nBh9FaOh
	Onb8vt2OznlQY4rEY3l8nKQrfUB0XS8jKdO3SBX8vwHZ3++5DzmQv5V3YVx6PHMXuRc1
	QfWN+wCI0ISuQGqyB2lwy+WlWPmubANRjpw3IqkQLeQvynqt3auTlnhVRGKvqm+iIgCk
	CxBbGTjhzgkMCcdjEPIt3tM8VoBPO7Bn7rOT8LeyAgaI2/YwZBBQgXfIu1evEt+2F25k
	GDL5A8zsrvjyKiOjsywF4xzGSxvJjFB2AxvUjKVzoQ3LrtL4LNGjNdkOlMTVwNTUrsp3
	W67Q==
X-Received: by 10.15.36.6 with SMTP id h6mr37944888eev.54.1397993397459;
	Sun, 20 Apr 2014 04:29:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm93832340eeu.23.2014.04.20.04.29.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:29:56 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:30:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420113001.GV2486@jama>
References: <1396977887-26644-1-git-send-email-trevor.woerner@linaro.org>
	<1396977887-26644-2-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396977887-26644-2-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-multimedia][PATCH] libdc1394: disable building examples
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
X-List-Received-Date: Sun, 20 Apr 2014 11:29:57 -0000
X-Groupsio-MsgNum: 49329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NUQP2JP/Zo+En7Or"
Content-Disposition: inline

--NUQP2JP/Zo+En7Or
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 01:24:47PM -0400, Trevor Woerner wrote:
> Building the examples suffers from host contamination and therefore does =
not
> succeed.

Merged, thanks!

>=20
> 	| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3D=
armv5te
> 		-marm -mthumb-interwork --sysroot=3D...
> 		-I/usr/include/SDL ...
> 		-lrt -L/usr/lib64 ...
> 	| /SSD/build/distroless/tmp/qemuarm-eglibc/sysroots/x86_64-linux/usr/lib=
exec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/ld:
> 		warning: library search path "/usr/lib64" is unsafe for cross-compilati=
on
> 	| /usr/lib64/librt.so: file not recognized: File format not recognized
>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.b=
b b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
> index 7c6d2ab..5bc77f2 100755
> --- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
> +++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
> @@ -19,4 +19,4 @@ S =3D "${WORKDIR}/git/${PN}"
> =20
>  inherit autotools pkgconfig
> =20
> -EXTRA_OECONF +=3D "--disable-doxygen-doc"
> +EXTRA_OECONF +=3D "--disable-doxygen-doc --disable-examples"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NUQP2JP/Zo+En7Or
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTr7kACgkQN1Ujt2V2gBwROgCgoZ6Yk0Cgtcdhk6mjEFY+9gbI
IyoAn3KhjEccCuRAuvGMEIqe/QgDH6Vh
=LRis
-----END PGP SIGNATURE-----

--NUQP2JP/Zo+En7Or--
