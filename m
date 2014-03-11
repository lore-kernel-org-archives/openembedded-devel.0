Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D3CA76F783
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:22:18 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so4379487ead.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YhwihOoRGJEvptO1ytMeDhDD1a6InAfQno3r4eqWe+k=;
	b=CFuRZKoUvjVzeHTbQjDu7SqCrghaHzANjjr6YMNCrAfO/6R9rEw5pWaYO40gAaQDf4
	PSyd9Ue4CoLq1OFEJq+7NE1gSULMPv2suHnYsuJduiQ036v7XMhgIHWxhNSGSSKuqw+f
	3OnN9pSzHy98mP+Q07Ohc/vTCav3dfA447X6kUqYW5VqDbMG1DJOEuQbo8poJywDCAmU
	COl2noHFXNKjukCwtQteVFGJ1Oj+myjpYS8NaAFVkrW11jhb0wbuD2eaX7Kx8EVfuJRt
	wonky+oxmdIEL1paTY86hjAQcCrTuGltZ/0NASEtI8QBKzzeHTL6du0et6lH792c4e9h
	ummg==
X-Received: by 10.14.216.3 with SMTP id f3mr4029912eep.66.1394547738684;
	Tue, 11 Mar 2014 07:22:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm58039293eex.9.2014.03.11.07.22.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:22:17 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:22:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311142230.GD2137@jama>
References: <1393548691-24359-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1393548691-24359-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.50+git80ac184
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
X-List-Received-Date: Tue, 11 Mar 2014 14:22:21 -0000
X-Groupsio-MsgNum: 48594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 01:51:31AM +0100, Andreas Oberritter wrote:
> Allows to install versions for Qt4/X11 and Qt4/Embedded into
> the same filesystem by overriding the target name.
>=20
> This version also removes a superflous .pc file from ${libdir}.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe=
/recipes-qt/libconnman-qt/libconnman-qt.inc
> index 77e70e8..3f91be2 100644
> --- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> +++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
> @@ -3,8 +3,8 @@ HOMEPAGE =3D "https://github.com/nemomobile/libconnman-qt"
>  SECTION =3D "qt/lib"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://libconnman-qt/clockmodel.h;endline=3D8;md5=
=3Dea9f724050803f15d2d900ce3c5dac88"
> -SRCREV =3D "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
> -PV =3D "1.0.46+git${SRCPV}"
> +SRCREV =3D "80ac184d859ea90c026403f5a520644945a5081a"
> +PV =3D "1.0.50+git${SRCPV}"
> =20
>  SRC_URI =3D "git://github.com/nemomobile/libconnman-qt.git;branch=3Dmast=
er"
> =20
> @@ -12,7 +12,7 @@ S =3D "${WORKDIR}/git"
> =20
>  inherit pkgconfig
> =20
> -EXTRA_QMAKEVARS_PRE +=3D "CONFIG+=3Dnotests"
> +EXTRA_QMAKEVARS_PRE +=3D "CONFIG+=3Dnotests TARGET_SUFFIX=3D${QT_DIR_NAM=
E}"
> =20
>  do_configure_prepend() {
>      # Hack *.pro variables
> @@ -37,7 +37,6 @@ FILES_${PN}-dev =3D " \
>      ${libdir}/libconnman-qt*${SOLIBSDEV} \
>      ${libdir}/libconnman-qt*.prl \
>      ${libdir}/pkgconfig/connman-qt*.pc \
> -    ${libdir}/connman-qt*.pc \
>  "
>  FILES_${PN}-plugin =3D " \
>      ${PLUGINS_TARGET}/qmldir \
> --=20
> 1.8.3.2

last world build reports failure to build libconnman-qte with this, can
you please look into it?

| x86_64-oe-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/s=
ysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-rpat=
h-link,/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemu=
x86-64/usr/lib -shared -o libConnmanQtDeclarative.so components.o networkin=
gmodel.o technologymodel.o savedservicemodel.o moc_components.o moc_network=
ingmodel.o moc_technologymodel.o moc_savedservicemodel.o   -L/home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -L../l=
ibconnman-qt -lconnman-qt4 -lQtDeclarativeE -lQtScriptE -lQtSvgE -lQtSqlE -=
lQtXmlPatternsE -lQtGuiE -lQtNetworkE -lQtDBusE -lQtXmlE -lQtCoreE -lpthread
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/libexec/core2-64-oe-linux/gcc/x86_64-oe-linux/4.8.2/ld: error: cann=
ot find -lconnman-qt4
| collect2: error: ld returned 1 exit status
| make[1]: *** [libConnmanQtDeclarative.so] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/core2-64-oe-linux/libconnman-qte/1.0.50+gitAUTOINC+80ac184d8=
5-r0/git/plugin'
| make: *** [sub-plugin-make_default-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libconnman-=
qte/1.0.50+gitAUTOINC+80ac184d85-r0/temp/log.do_compile.15974)

(link to full log in last State of bitbake world, Failed tasks 2014-03-11 e=
-mail)
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfHCYACgkQN1Ujt2V2gByzEACgmmd24e/iLY+DVU5FWdJtFtmf
sjgAn3KcVxyA87zQ9tMF4NZCd4z3fO0/
=bhnx
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
