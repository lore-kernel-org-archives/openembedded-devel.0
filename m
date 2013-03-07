Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDcsz-00012P-6K
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:37:38 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so440080pbc.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eUVkjnvAqma41UAdm+xg/MWBf36O2L6nx8zhZXmVDFc=;
	b=ic9nQjTGLGPHqaoX3pedSqhXofCkkfjXYV31fXK96uPU4L3iek4oiFrcxlFblqb/z7
	2IdDeSlKrQM34SnrG8J3FIH0Zh8F6h8Bwsi/uSDZGxHY7c6MbCtja8x668oBA5PYX+UF
	z4bbNlCntIiGS+IqW/PAbJPIL3MdDcMKYlVXAjHm4c/bTXYCDRmwAFz8/Quvf7Fkb+5f
	N52pER2dmvUKxm1CYDR+iIHdVWPn5RZwfOBTIOOVlfIHc3REg564OQ9caKkIkT7NlZWK
	rX2szCWYJlhHwW1eELeHwtbaAlxBKyDbybuP8tGgy98OT3LcvhpSY+6+70+mmLeXyVoK
	fJ3w==
X-Received: by 10.66.117.106 with SMTP id kd10mr3424149pab.148.1362669664275; 
	Thu, 07 Mar 2013 07:21:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id aj2sm2551004pad.14.2013.03.07.07.21.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:21:03 -0800 (PST)
Date: Thu, 7 Mar 2013 16:20:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130307152058.GO32228@jama.dyndns-home.com>
References: <1362668200-16189-1-git-send-email-s.stirtzel@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1362668200-16189-1-git-send-email-s.stirtzel@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] maliit-framework: fix for Qt based applications
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 15:37:38 -0000
X-Groupsio-MsgNum: 43435
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/d7X7C0hV/blnKmH"
Content-Disposition: inline

--/d7X7C0hV/blnKmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 03:56:39PM +0100, Samuel Stirtzel wrote:
> Previously Qt based applications did not trigger the Maliit virtual keybo=
ard
> The Qt inputmethod plugin could not be loaded because it did not link to =
libmaliit-1.0.so
> It is also necessary to set the Qt default input method to "Maliit"
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch |   23 ++++++++++++++=
++++++
>  .../recipes-support/maliit/maliit-framework_git.bb |   13 +++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-=
Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
>=20
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to=
-libmaliit-1-0-in-inputcontext-plugin.patch b/meta-oe/recipes-support/malii=
t/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
> new file mode 100644
> index 0000000..749ddbe
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmal=
iit-1-0-in-inputcontext-plugin.patch
> @@ -0,0 +1,23 @@
> +From cc33efdedbec9e9a55e9a0c6756516fd84d42e53 Mon Sep 17 00:00:00 2001
> +From: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +Date: Fri, 1 Mar 2013 11:31:41 +0100
> +Subject: [PATCH] Link to libmaliit-1,0 in inputcontext plugin
> +
> +Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +---
> + .../input-context-plugin/input-context-plugin.pro  |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/input-context/input-context-plugin/input-context-plugin.pro=
 b/input-context/input-context-plugin/input-context-plugin.pro
> +index eefbe93..296e2fa 100644
> +--- a/input-context/input-context-plugin/input-context-plugin.pro
> ++++ b/input-context/input-context-plugin/input-context-plugin.pro
> +@@ -15,3 +15,5 @@ CONFIG +=3D plugin
> +=20
> + INSTALLS    +=3D target
> + target.path +=3D $$QT_IM_PLUGIN_PATH
> ++
> ++LIBS +=3D -L../../lib -l"maliit-1.0"
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/met=
a-oe/recipes-support/maliit/maliit-framework_git.bb
> index a164e78..91e79ac 100644
> --- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> @@ -10,6 +10,7 @@ inherit autotools qt4x11 gtk-immodules-cache
>  SRC_URI =3D "git://gitorious.org/maliit/maliit-framework.git;branch=3Dma=
ster \
>      file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.pat=
ch \
>      file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.pat=
ch \
> +    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
>      "
> =20
>  SRCREV =3D "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
> @@ -65,4 +66,16 @@ do_install_append() {
>      sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/q=
t4/mkspecs/features/maliit-plugins.prf
>  }
> =20
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +#can run online and offline
> +echo "EXPORT QT_IM_MODULE=3DMaliit" >> ${D}/etc/profile

IIRC this needs to be $D
otherwise it's expanded by bitbake and you get path to your ${D} on
target.

Same for postrm

> +}
> +
> +pkg_postrm_${PN} () {
> +#!/bin/sh
> +#can run online and offline
> +sed -i "/EXPORT QT_IM_MODULE=3DMaliit/d" ${D}/etc/profile
> +}
> +
>  S=3D "${WORKDIR}/git"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/d7X7C0hV/blnKmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4sFoACgkQN1Ujt2V2gBy9XgCdFlSkpy0eXDjZEynr0Un9F9kQ
jHcAn1l5oXgc17xfF7D9xDmRNkiUE5bP
=/G+X
-----END PGP SIGNATURE-----

--/d7X7C0hV/blnKmH--
