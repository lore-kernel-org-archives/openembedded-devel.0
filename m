Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 560E965D22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 10:02:06 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so2939181eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EZNqjL8A7F77+lUnHSotLWgVqCfLHOTmiBHuvX/4AcM=;
	b=JapylDrrZkJbBPw0loGDriYhv/TOezdycYb3ycO9Kb9D+NrOAA+8gNVsTilu+mcwyg
	HDkkmlWeSVTuAhfvVmudSceQLqGB+HJqvGRkONwdXyKGj0CY7i+/1kTEVkofxHuGfgbx
	ypHhTNTWW3G8iR1Uon6t5vyXq4BxhaoufePL0yLQ+8gOMX+JiY9gDPcvnZNLe74VwEcg
	6Fj4V/5wCcYN13AMSHMvvVM+vqMDc2GumgcAGT10bpsECqDAb6iXsF+/MM/BT2aA/yzc
	5l+EU6zcJQ5/QsxScPcy3lcOEA+5eUPFBmpOFcRBmmoFH1EDFfrvnA5PetufXn3Liz0k
	7uPg==
X-Received: by 10.15.43.77 with SMTP id w53mr37449292eev.10.1397988127348;
	Sun, 20 Apr 2014 03:02:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm93235135eef.26.2014.04.20.03.02.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 03:02:06 -0700 (PDT)
Date: Sun, 20 Apr 2014 12:02:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420100211.GK2486@jama>
References: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
	<1397149098-1303-2-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397149098-1303-2-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-oe][PATCH 1/2] bdftopcf: add recipe
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
X-List-Received-Date: Sun, 20 Apr 2014 10:02:11 -0000
X-Groupsio-MsgNum: 49318
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LIxvNfiQb+4m9exP"
Content-Disposition: inline

--LIxvNfiQb+4m9exP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 12:58:17PM -0400, Trevor Woerner wrote:
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-o=
e/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> new file mode 100644
> index 0000000..2b0775d
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "bdftopcf is a font compiler for the X server and font serve=
r"
> +HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
> +SECTION =3D "x11/app"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9a35333adf75edd1eaef84bca65a=
490"
> +DEPENDS =3D "libxfont"
> +
> +SRC_URI[md5sum] =3D "96a648a332160a7482885800f7a506fa"
> +SRC_URI[sha256sum] =3D "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb=
3e16946e5ffd2798"
> +
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +
> +BBCLASSEXTEND =3D "native"

bdftopcf-native failed in world build:

| checking whether make supports nested variables... (cached) yes
| checking for BDFTOPCF... no
| configure: error: Package requirements (xfont) were not met:
|
| No package 'xfont' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables BDFTOPCF_CFLAGS
| and BDFTOPCF_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/=
bdftopcf-native/1.0.4-r0/bdftopcf-1.0.4/config.log
| This file contains any messages produced by compilers while
| running configure, to aid debugging if configure makes a mistake.

You need to move require.*inc to the top, see:

# $DEPENDS [11 operations]
#   set /OE/build/shr-core/openembedded-core/meta/conf/bitbake.conf:255
#     ""
#   set /OE/build/shr-core/openembedded-core/meta/conf/documentation.conf:1=
32
#     [doc] "Lists a recipe's build-time dependencies (i.e. other recipe fi=
les)."
#   _prepend /OE/build/shr-core/openembedded-core/meta/classes/base.bbclass=
:81
#     "${BASEDEPENDS} "
#   set /OE/build/shr-core/meta-openembedded/meta-oe/recipes-graphics/xorg-=
app/bdftopcf_1.0.4.bb:6
#     "libxfont"
#   set /OE/build/shr-core/openembedded-core/meta/recipes-graphics/xorg-app=
/xorg-app-common.inc:6
#     "util-macros-native virtual/libx11"
#   _prepend /OE/build/shr-core/openembedded-core/meta/classes/autotools.bb=
class:24
#     "${@autotools_dep_prepend(d)}"
#   _prepend /OE/build/shr-core/openembedded-core/meta/classes/pkgconfig.bb=
class:1
#     "pkgconfig-native "
#   set native_virtclass_handler(e):25 [map_dependencies]
#     "util-macros-native virtual/libx11-native"
#   set data_smart.py:432 [finalize]
#     "${BASEDEPENDS} util-macros-native virtual/libx11-native"
#   set data_smart.py:432 [finalize]
#     "${@autotools_dep_prepend(d)}${BASEDEPENDS} util-macros-native virtua=
l/libx11-native"
#   set data_smart.py:432 [finalize]
#     "pkgconfig-native ${@autotools_dep_prepend(d)}${BASEDEPENDS} util-mac=
ros-native virtual/libx11-native"
# computed:
#   "pkgconfig-native ${@autotools_dep_prepend(d)}${BASEDEPENDS} util-macro=
s-native virtual/libx11-native"
DEPENDS=3D"pkgconfig-native autoconf-native automake-native libtool-native =
gnu-config-native  util-macros-native virtual/libx11-native"

other variables are overwritten from .inc as well.


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LIxvNfiQb+4m9exP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTmyMACgkQN1Ujt2V2gBx0iACfRijUqX1dNi83rt1b29m79fUQ
lZoAoKRk/DYTKQoOJNRrqHOI7I0guuNP
=1vkN
-----END PGP SIGNATURE-----

--LIxvNfiQb+4m9exP--
