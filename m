Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 165C377108
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 14:31:56 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so138270290wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1bvpwvG+asgsEB5RoQAYVdXRf2okZrM59g6WICZiQGI=;
	b=dtsNceZeJT31marQ45eMWlrdZjTJgjDbj3mikPhEe83Vqtf2B4pE8XqKSczp3neh9A
	9bwYRGKt3BxYNL37/dgmuaoE3cPNeLBbg4Q+I8HKhjiO+ex3551lMhlQ3MffavYOiXCZ
	wFW+bnniqtsgFZDvEQxVei2XkqoHUhwuG6+BXsSuYe//RQzqny2HULeYgQWHnQJ2mXwV
	iTvwpM+hJRu/E6869ItpfApEHHsxhM6ipXFZESgFGujIO/YWcJbBp95pQ528g881AAHi
	Z2VBD8eGGtFq9YW8XhvG0KaGyU4+1hC4f49rqmDB8tBKwr5tFyg8VrRW5LDcR199BN7r
	nKMw==
X-Received: by 10.180.89.1 with SMTP id bk1mr24583624wib.56.1445524316540;
	Thu, 22 Oct 2015 07:31:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bd4sm17179324wjb.15.2015.10.22.07.31.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 07:31:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Oct 2015 16:32:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151022143220.GB2558@jama>
References: <20151008102504.GJ2385@jama>
	<1445277032-1590-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1445277032-1590-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH v2] aalib: add new recipe
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
X-List-Received-Date: Thu, 22 Oct 2015 14:31:58 -0000
X-Groupsio-MsgNum: 57974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 07:50:32PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../recipes-multimedia/aalib/aalib_1.4rc4.bb           | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4=
=2Ebb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb b/m=
eta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
> new file mode 100644
> index 0000000..6d7d461
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "AAlib is an portable library for rendering graphics as =
ASCII art."
> +HOMEPAGE =3D "http://aa-project.sourceforge.net/aalib/"
> +SECTION =3D "libs"
> +
> +DEPENDS =3D "ncurses"

Still few QA issues:

aalib-1.4rc4: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glibc/work/ar=
mv5te-oe-linux-gnueabi/aalib/1.4rc4-r0/packages-split/aalib/usr/lib/libaa.s=
o.1.0.4' has relocations in .text [textrel]
aalib-1.4rc4: aalib rdepends on libxdmcp, but it isn't a build dependency? =
[build-deps]
aalib-1.4rc4: aalib rdepends on libx11, but it isn't a build dependency? [b=
uild-deps]
aalib-1.4rc4: aalib rdepends on libxcb, but it isn't a build dependency? [b=
uild-deps]
aalib-1.4rc4: aalib rdepends on libxau, but it isn't a build dependency? [b=
uild-deps]

gphoto2-2.5.8: gphoto2 rdepends on aalib, but it isn't a build dependency? =
[build-deps]
gimp-2.8.14: gimp rdepends on aalib, but it isn't a build dependency? [buil=
d-deps]

> +
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +S =3D "${WORKDIR}/aalib-1.4.0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "d5aa8e9eae07b7441298b5c30490f6a6"
> +SRC_URI[sha256sum] =3D "0b214b98850f559e0a9ef7282de2ff336b094e1aacedefff=
3ffa50f07711db58"
> +
> +inherit autotools
> +
> +CFLAGS_append =3D " -fPIC "
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

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYo83EACgkQN1Ujt2V2gBwEGgCgnmC7e94WbMkJ6zSJdn048AZt
/nYAniWowoK75D3J+F6YDQ9hsnuxRJ5C
=8ILW
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
