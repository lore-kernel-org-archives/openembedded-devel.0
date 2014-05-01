Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE0460808
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 21:02:45 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id gf5so595216lab.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m7nbh5vom+f7513LOJACSk6RCC13g7wwe/fGXmnhJJs=;
	b=qeFVbKnZrgwzaLtbT4tf41wl/el8HsSkg6qkJTFshJG4S6PsKz9j5RPmxnhyhxCgMy
	eqbajbmdNT//+4/JRHN8bxWMWL1CJf1TfwjZurX1nevwPE6TG4lToLZIBR9VypjE1LVX
	NHdQXco5vY7PoDI7g6FqDkn3fFxaissaOWBqekMSlqE5J29PiqlxrRQebdsUaABbdKBx
	CLKM9Ep4BMy1emm34j/eWp0TyJ9kaoWutnD48COuOz2wN7cuBmsljW4oTDBGDa92OKH4
	wkjmuabx/VPISReXXB4CiXZfPnrPcoMlZZHlal0z9/DD8ndB5gJ8GgsL7GudA58UQIli
	R5BA==
X-Received: by 10.152.88.70 with SMTP id be6mr9160664lab.13.1398978165999;
	Thu, 01 May 2014 14:02:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z10sm31079453lbu.1.2014.05.01.14.02.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 May 2014 14:02:44 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 May 2014 23:03:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140501210300.GU2486@jama>
References: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
MIME-Version: 1.0
In-Reply-To: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
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
X-List-Received-Date: Thu, 01 May 2014 21:02:48 -0000
X-Groupsio-MsgNum: 49638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cJrepmIQz131XP+8"
Content-Disposition: inline

--cJrepmIQz131XP+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2014 at 03:01:01PM -0500, Donald R. Poole, Jr. wrote:
> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
>=20
> Currently, if you are building native applications with Qt5, the current =
qmake5_base_do_install() method assumes an install into the image folder fo=
r the target. Since the native builds handle this a little differently, thi=
s patch should account for the native install scenario.

Can you explain a bit why you're building qt5 native application? Is it
used to build some target packages?

> ---
>  classes/qmake5_base.bbclass |   37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 18fdb2a..df8a59a 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -163,23 +163,30 @@ qmake5_base_do_configure () {
> =20
>  qmake5_base_do_install() {
>      # Fix install paths for all
> -    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR=
_TARGET},(INSTALL_ROOT),g"
> +    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ] ; then
> +        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT),(INSTALL=
_ROOT)${STAGING_DIR_NATIVE},g"
> +    else
> +        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING=
_DIR_TARGET},(INSTALL_ROOT),g"
> +    fi
> =20
>      oe_runmake install INSTALL_ROOT=3D${D}
> =20
> -    # everything except HostData and HostBinaries is prefixed with sysro=
ot value,
> -    # but we cannot remove sysroot override, because that's useful for p=
kg-config etc
> -    # In some cases like QtQmlDevTools in qtdeclarative, the sed above d=
oes not work,
> -    # fix them manually
> -    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}" =
] ; then
> -        echo "Some files are installed in wrong directory ${D}${STAGING_=
DIR_TARGET}"
> -        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> -        rm -rf ${D}${STAGING_DIR_TARGET}
> -        # remove empty dirs
> -        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> -        while test ${TMP} !=3D ${D}; do
> -            rmdir ${TMP}
> -            TMP=3D`dirname ${TMP}`;
> -        done
> +    # Only do this for target builds. Native install work a little diffe=
rently
> +    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ] ; then
> +        # everything except HostData and HostBinaries is prefixed with s=
ysroot value,
> +        # but we cannot remove sysroot override, because that's useful f=
or pkg-config etc
> +        # In some cases like QtQmlDevTools in qtdeclarative, the sed abo=
ve does not work,
> +        # fix them manually
> +        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGE=
T}" ] ; then
> +            echo "Some files are installed in wrong directory ${D}${STAG=
ING_DIR_TARGET}"
> +            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> +            rm -rf ${D}${STAGING_DIR_TARGET}
> +            # remove empty dirs
> +            TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> +            while test ${TMP} !=3D ${D}; do
> +                rmdir ${TMP}
> +                TMP=3D`dirname ${TMP}`;
> +            done
> +        fi
>      fi
>  }
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cJrepmIQz131XP+8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNitoQACgkQN1Ujt2V2gBzZVwCfUBBi9nG0w7qyAOAlAAIRBp8X
9PYAoI8UqSymIMfLsSpjwvJE3qq/LuH9
=fKb7
-----END PGP SIGNATURE-----

--cJrepmIQz131XP+8--
