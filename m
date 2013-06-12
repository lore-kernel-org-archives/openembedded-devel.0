Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3466AAB0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 14:08:08 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so4451672eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qKPl8QctRCCLEypjRHjt/I5kBh7k/SwsBel5uPpdqwY=;
	b=bvKKWErj0qN5YsJJABrjB+WGXqVdxDHZ0gk38O71P+cvsOcOjjwSKEl4Mco9SUl/qH
	0IvB2sm7gRbhMuPqkZkOAw2xxm42WevDtU2qVDsEavDC5lnbcMtTxdNeNyVRnREFVzbM
	AqgY2BBslV9FkoWin/RsUp5Fr7EVgwMyHnSURuuZ5kmqUO4yx2fLlvdjwFWiSQr97hM9
	ZxRq9QYogi49V/FrzCcrPsIfY1XkY4Sn02TL/TrRZ2SN6lnafYm/5D/3ex5XajOEfWje
	qBBS3xWckXLM7yzgvihq/0fjREHrSCe0gLCDFgAKGf2fOmewpMPbs+K55ilyCe5pC/uh
	rL6w==
X-Received: by 10.14.211.69 with SMTP id v45mr21945240eeo.45.1371046088718;
	Wed, 12 Jun 2013 07:08:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z52sm37184433eea.1.2013.06.12.07.08.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 07:08:08 -0700 (PDT)
Date: Wed, 12 Jun 2013 16:08:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130612140832.GQ3233@jama>
References: <1371045305-11765-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1371045305-11765-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3] llvm-common: move cross script install to sysroot preprocess function
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
X-List-Received-Date: Wed, 12 Jun 2013 14:08:09 -0000
X-Groupsio-MsgNum: 45052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i13qRg9tmWEwo36p"
Content-Disposition: inline

--i13qRg9tmWEwo36p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 11:55:05PM +1000, Jonathan Liu wrote:
> The llvm-config script doesn't get placed in the target sysroot
> crossscripts directory otherwise.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-core/llvm/llvm-common.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-c=
ore/llvm/llvm-common.bb
> index 612fd34..192919e 100644
> --- a/meta-oe/recipes-core/llvm/llvm-common.bb
> +++ b/meta-oe/recipes-core/llvm/llvm-common.bb
> @@ -6,7 +6,10 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3=
f40d7994397109285ec7b81fdeb3
> =20
>  SRC_URI =3D "file://llvm-config"
> =20
> -do_install() {
> +ALLOW_EMPTY_${PN} =3D "1"
> +SYSROOT_PREPROCESS_FUNCS_append_class-target =3D " llvm_common_sysroot_p=
reprocess"
> +
> +llvm_common_sysroot_preprocess() {
>      install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>      install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_cr=
ossscripts}/
>  }

There is an issue with llvm-config without version when multiple
versions of llvm are built:

WARNING: The recipe llvm2.8 is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/bin/crossscripts/llvm-config
   Matched in manifest-qemuarm-llvm3.2
manifest-qemuarm-llvm2.9
manifest-qemuarm-llvm-common
Please verify which package should provide the above files.

Shouldn't we stage llvm-common only once and only from llvm-common
recipe? Not caused by this change, but
http://patchwork.openembedded.org/patch/50959/

Other recipes can stage llvm-commonVER.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i13qRg9tmWEwo36p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG4gOAACgkQN1Ujt2V2gBycYACgh894ycjhAUgdq9Qluh7ikbph
l8UAnj0UfQcTjfjTMRzR7HRh9Hljv4ze
=bPAp
-----END PGP SIGNATURE-----

--i13qRg9tmWEwo36p--
