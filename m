Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A0DF676E5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 16:16:49 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p65so40650774wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3niufAhC1sOCfhyeuDUV6569uIrhupBpLfpd+INEKEo=;
	b=DeytoRQq2vDPMHhN+zm4g9z3iHufKElyVvadV2F48MZozpsrDdyMB0uM0yX+oQWfB2
	Gfaj/Q5GtHdmtKhkHGNzXBL8NEl8/nM6sPX93srHLnTObOLxz2rSLfJdFPlnmusf/vNh
	epzxuSlxMVNvvs7C6Me2pO8YhhPVOGdlDHt4w2eh2GmSH+ukzL+NechFL31ZPrZEyynb
	HKHBObAd8K20qFZAoh7SgeU7w2ZYVl4u4vMILLeBaH1or6gIPnMeumIWKJ908QKasDpe
	BVv3zRot0hrU7zxtu6MapCMZ2WtJunPICYsoZ5vun1JMDBoTh6XlTAbbTJBDEU+6vGx/
	GZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3niufAhC1sOCfhyeuDUV6569uIrhupBpLfpd+INEKEo=;
	b=CYL5dH6ym+UmeeQDDjpwGuPJRxj9Vr/d2iQ7rZJf/FBDkV3CltGPLu51UwXydcwkl3
	b2wsWxdc7rvdkzgiLN7kn0KBF95epc4Dxp5LJ7uvIkGwtYZjpexE5nxRksIm9/mo5MDw
	jhwwsb5iRZFCMIKCutg5VA6CRL5hfg9HJrWvXmCEmT3l2jyAm+j7MtMnfisIiTWoLudT
	3evlB9eWtF0giO9yITuLoxNgd6z7qxZsYzV1RkiqeC0g/miNSse5npOcxJ8leSmOH9lf
	WHSGcmERAdrvWQyGv+0nR7dZUTmUQzeLJPhQNrJTbkYwd9yboBbU8iYimVZ9Fbay1EPL
	+DTA==
X-Gm-Message-State: AD7BkJI8DfPqsf5+/pWCIsK/Dd8HodW5p3xgLB8bOuVZZZRiVrrRuXL1/dnVHvBON9l+6w==
X-Received: by 10.28.13.76 with SMTP id 73mr2725401wmn.14.1456849009467;
	Tue, 01 Mar 2016 08:16:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z6sm1488973wme.9.2016.03.01.08.16.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 08:16:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 17:18:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160301161840.GD6407@jama>
References: <1456474768-24329-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456474768-24329-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] qtbase: fix up pkgconfig replacements
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
X-List-Received-Date: Tue, 01 Mar 2016 16:16:51 -0000
X-Groupsio-MsgNum: 60284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 07:19:28PM +1100, Jonathan Liu wrote:
> The replacements were being done in qt_module.prf which is not included
> when building 3rd party libraries. To resolve this, move the
> replacements from qt_module.prf to qt.prf which is included when
> building any qmake project. The pkgconfig include replacement is removed
> as it doesn't seem to be needed anymore and causes issues when the
> includedir path in pkgconfig has part of its path replaced with
> ${includedir} resulting in a circular reference that causes the OE
> package_do_pkgconfig task to fail.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  ...le-Fix-pkgconfig-and-libtool-replacements.patch | 56 +++++++++++-----=
------
>  1 file changed, 27 insertions(+), 29 deletions(-)

This seems to break qtwebengine's pkg-config

NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r=
0: task do_populate_sysroot: Started
ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do_p=
opulate_sysroot: QA Issue: Qt5WebEngineCore.pc failed sanity test (tmpdir) =
in path /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/qt=
webengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0/sysroot-destd=
ir/usr/lib/pkgconfig [pkgconfig]
ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do_p=
opulate_sysroot: QA staging was broken by the package built above
ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do_p=
opulate_sysroot: Function failed: do_qa_staging
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/core2-64-oe-linux/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc919d3=
1_7e655fbb76-r0/temp/log.do_populate_sysroot.22802
NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r=
0: task do_populate_sysroot: Failed
ERROR: Task 22201 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/=
qtwebengine_git.bb, do_populate_sysroot) failed with exit code '1'

Any idea why this replacement wouldn't be used for qtwebengine?

>=20
> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libto=
ol-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-=
and-libtool-replacements.patch
> index 7520107..4807df0 100644
> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> +++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-repl=
acements.patch
> @@ -61,11 +61,36 @@ Content-Transfer-Encoding: 8bit
>  Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>  ---
> + mkspecs/features/qt.prf        | 13 +++++++++++++
>   mkspecs/features/qt_common.prf |  2 +-
> - mkspecs/features/qt_module.prf | 16 ++++++++++++++++
> - 2 files changed, 17 insertions(+), 1 deletion(-)
> + 2 files changed, 14 insertions(+), 1 deletion(-)
> =20
> +diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
> +index f62b6bb..91be8b3 100644
> +--- a/mkspecs/features/qt.prf
> ++++ b/mkspecs/features/qt.prf
> +@@ -321,6 +321,19 @@ contains(TEMPLATE, .*app) {
> +     QTPLUGIN =3D $$manualplugs $$autoplugs
> + }
> +=20
> ++contains(TEMPLATE, .*lib) {
> ++    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
> ++    pkgconfig_prefix_replace.replace =3D "prefix=3D"
> ++    pkgconfig_prefix_replace.CONFIG =3D path
> ++    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
> ++
> ++    # drop -L/usr/lib in .prl files
> ++    prl_replace.match =3D "-L\$${libdir}"
> ++    prl_replace.replace =3D ""
> ++    prl_replace.CONFIG =3D path
> ++    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
> ++}
> ++
> + QT_PLUGIN_VERIFY =3D DEPLOYMENT_PLUGIN
> + contains(QT_CONFIG, static) {
> +     QT_PLUGIN_VERIFY +=3D QTPLUGIN
>  diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common=
=2Eprf
>  index 38602f6..f9c401f 100644
>  --- a/mkspecs/features/qt_common.prf
> @@ -79,33 +104,6 @@ index 38602f6..f9c401f 100644
>       }
>       lib_replace.CONFIG =3D path
>       QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
> -diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module=
=2Eprf
> -index aefd3ae..775cda2 100644
> ---- a/mkspecs/features/qt_module.prf
> -+++ b/mkspecs/features/qt_module.prf
> -@@ -276,6 +276,22 @@ load(qt_targets)
> -         ltlib_replace.replace =3D $$QMAKE_LIBTOOL_LIBDIR
> -     ltlib_replace.CONFIG =3D path
> -     QMAKE_LIBTOOL_INSTALL_REPLACE +=3D ltlib_replace
> -+
> -+    pkgconfig_include_replace.match =3D $$rplbase/include
> -+    pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
> -+    pkgconfig_include_replace.CONFIG =3D path
> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_include_replace
> -+
> -+    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
> -+    pkgconfig_prefix_replace.replace =3D "prefix=3D"
> -+    pkgconfig_prefix_replace.CONFIG =3D path
> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
> -+
> -+    # drop -L/usr/lib in .prl files
> -+    prl_replace.match =3D "-L\$${libdir}"
> -+    prl_replace.replace =3D ""
> -+    prl_replace.CONFIG =3D path
> -+    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
> - }
> -=20
> - contains(QT_PRODUCT, OpenSource.*):DEFINES *=3D QT_OPENSOURCE
>  --=20
>  2.7.1
> =20
> --=20
> 2.7.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVwN8ACgkQN1Ujt2V2gBwTgACguHUFPNvuQxAY/KP5T11iDXa/
SbgAnjVgxneHJn0N7JNFspXpF3EN9d9h
=78IM
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
