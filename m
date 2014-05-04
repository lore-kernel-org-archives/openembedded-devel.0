Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id B5856601A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 21:27:56 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so4758225lbd.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fWS+LhpTmh2NDxQbh0QrrsVrktAh9OVPGA8THEbgCME=;
	b=0hGamM2TlHmmWqWKnPvg/3R8cToOnTJwYmmv/k/B929Ea6s5vqnyrQks2atfhdTdW9
	b8hK7T9Os4qfMCk9p66a4s+X37/Ema/JImzHuHaK5G0L2EBoE9eOH8sqjWCA5Ws/4hsD
	WVq5b69bD/9PHNdXGK24lig8VbZTu+SL5WbqcHGlOhPFMYm7u9mnyUqk0LYtA3xq/+8k
	+uL65KOmrwIEN2tk0TvBM6ZBJRZyzBXQAtraCD3h9qLRnpPpe1KrhznbVmQKoSNtrpk0
	t4p+vEbuvt06BwmpJHxkK97Pl/sRZgX1TPzVFXIkCnis/uDGPN3JdKZXu+VsXeYiEcBc
	jNZQ==
X-Received: by 10.112.26.199 with SMTP id n7mr22571268lbg.27.1399238876707;
	Sun, 04 May 2014 14:27:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lc3sm6198476lab.7.2014.05.04.14.27.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 14:27:55 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 May 2014 23:28:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140504212814.GF2486@jama>
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
X-List-Received-Date: Sun, 04 May 2014 21:28:00 -0000
X-Groupsio-MsgNum: 49686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ko/wM9QIu/xrLSxa"
Content-Disposition: inline

--ko/wM9QIu/xrLSxa
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

I think it would be more readable if we use
qmake5_base_do_install_class-target
qmake5_base_do_install_class-native
qmake5_base_do_install_class-nativesdk

instead of "${BUILD_SYS}" =3D "${HOST_SYS}" inline, can you please update
patch that way and test it on your use-case? thanks


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

--ko/wM9QIu/xrLSxa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNmsO4ACgkQN1Ujt2V2gBwGjgCgrRqz9hNAKejcHpY+mQguWbup
quUAoJzi1CTQ9WTil3S30mEqsc6+uzqJ
=euXl
-----END PGP SIGNATURE-----

--ko/wM9QIu/xrLSxa--
