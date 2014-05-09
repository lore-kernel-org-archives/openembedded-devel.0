Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f172.google.com (unknown [209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id BBD00606E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 12:50:20 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id l4so5419065lbv.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EH4bX5ZGi9cOuqxnPB4B7tlXmrIepFYJuVXdXvBevlQ=;
	b=oaSeSpkVqxoZ5l+KFlWOdiyZqN799ykNhTBVDO70myyBCheXVZYl0IM7ZUlbFaqrdE
	oHQhhX+xbgbGS5C1TsMjguK7/jQ/b3OlW/zrHifAAdT0Pt3+0AuRfSpz2zrQC5kN5LK/
	cDsV+bCy77jOAQNz9DNuprkDQJVODIDC51nM9pHoefJD5zYvmM1fNSqs9I7MS+xi+GwH
	Z+6XAHZR/wxReRQKquJmLkAml7A3rEDLoi9Rtt7MJqkIDKxZZNnpEn8LaELWg8MJSSnV
	4qBhh6ep1xayCYRNdQk5tR1u0T4jMw9+xPtPLfdCc69+5/PWiutWP+8t5ZXWLkKlSiSV
	HXTg==
X-Received: by 10.152.23.233 with SMTP id p9mr1817181laf.31.1399639820505;
	Fri, 09 May 2014 05:50:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bj7sm4341255lbc.22.2014.05.09.05.50.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 05:50:19 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 May 2014 14:50:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140509125043.GT30955@jama>
References: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
	<1399401265-29167-2-git-send-email-donald.poole@swri.org>
MIME-Version: 1.0
In-Reply-To: <1399401265-29167-2-git-send-email-donald.poole@swri.org>
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
X-List-Received-Date: Fri, 09 May 2014 12:50:21 -0000
X-Groupsio-MsgNum: 49812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BfbbJsf3thGkpLcA"
Content-Disposition: inline

--BfbbJsf3thGkpLcA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 01:34:24PM -0500, Donald R. Poole, Jr. wrote:
> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
>=20
> Currently, if you are building native applications with Qt5, the current =
qmake5_base_do_install() method assumes an install into the image folder fo=
r the target. Since the native builds handle this a little differently, thi=
s patch should account for the native install scenario.

Add SOB line.

> ---
>  classes/qmake5.bbclass      |    8 ++++++--
>  classes/qmake5_base.bbclass |   46 +++++++++++++++++++++----------------=
------
>  2 files changed, 29 insertions(+), 25 deletions(-)
>=20
> diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
> index e1dda0d..01454f3 100644
> --- a/classes/qmake5.bbclass
> +++ b/classes/qmake5.bbclass
> @@ -19,6 +19,10 @@ do_configure() {
>      qmake5_base_do_configure
>  }
> =20
> -do_install() {
> -    qmake5_base_do_install
> +do_install_class-target() {
> +    qmake5_base_do_install_target
> +}
> +
> +do_install_class-native() {
> +    qmake5_base_do_install_native
>  }
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index df8a59a..5a380d0 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -161,32 +161,32 @@ qmake5_base_do_configure () {
>      ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} -r =
$QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error cal=
ling $CMD"
>  }
> =20
> -qmake5_base_do_install() {
> +qmake5_base_do_install_target() {
>      # Fix install paths for all
> -    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ] ; then
> -        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT),(INSTALL=
_ROOT)${STAGING_DIR_NATIVE},g"
> -    else
> -        find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING=
_DIR_TARGET},(INSTALL_ROOT),g"
> -    fi
> +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR=
_TARGET},(INSTALL_ROOT),g"

This looks like incremental patch from your v1, please rebase and send
v3.

> =20
>      oe_runmake install INSTALL_ROOT=3D${D}
> =20
> -    # Only do this for target builds. Native install work a little diffe=
rently
> -    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ] ; then
> -        # everything except HostData and HostBinaries is prefixed with s=
ysroot value,
> -        # but we cannot remove sysroot override, because that's useful f=
or pkg-config etc
> -        # In some cases like QtQmlDevTools in qtdeclarative, the sed abo=
ve does not work,
> -        # fix them manually
> -        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGE=
T}" ] ; then
> -            echo "Some files are installed in wrong directory ${D}${STAG=
ING_DIR_TARGET}"
> -            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> -            rm -rf ${D}${STAGING_DIR_TARGET}
> -            # remove empty dirs
> -            TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> -            while test ${TMP} !=3D ${D}; do
> -                rmdir ${TMP}
> -                TMP=3D`dirname ${TMP}`;
> -            done
> -        fi
> +    # everything except HostData and HostBinaries is prefixed with sysro=
ot value,
> +    # but we cannot remove sysroot override, because that's useful for p=
kg-config etc
> +    # In some cases like QtQmlDevTools in qtdeclarative, the sed above d=
oes not work,
> +    # fix them manually
> +    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
> +        echo "Some files are installed in wrong directory ${D}${STAGING_=
DIR_TARGET}"
> +        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
> +        rm -rf ${D}${STAGING_DIR_TARGET}
> +        # remove empty dirs
> +        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
> +        while test ${TMP} !=3D ${D}; do
> +            rmdir ${TMP}
> +            TMP=3D`dirname ${TMP}`;
> +        done
>      fi
>  }
> +
> +qmake5_base_do_install_native() {

Why don't you use

qmake5_base_do_install_class-native() {

here and leave qmake5.bbclass and qmake5_base_do_install as it is?

> +    # Fix install paths for all
> +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT),(INSTALL_ROO=
T)${STAGING_DIR_NATIVE},g"
> +
> +    oe_runmake install INSTALL_ROOT=3D${D}
> +}
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

--BfbbJsf3thGkpLcA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNszyMACgkQN1Ujt2V2gBwGtQCfTpagANaMFfkhdR8tiKe2hl7E
1cAAn072yUbB7Hxd5R3nOjd60EBacAyS
=fthQ
-----END PGP SIGNATURE-----

--BfbbJsf3thGkpLcA--
