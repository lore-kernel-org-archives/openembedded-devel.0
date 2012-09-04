Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8vLo-0004UU-4z
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Sep 2012 17:47:40 +0200
Received: by bkcik5 with SMTP id ik5so3369355bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N5+rlZU+w4EDLb/FlaW7aDt1owRLujCX3edUz30LS5M=;
	b=qEQv2gMr/PEOT69mAXPZth9Rlz1hgT0rlHa+i3GtaZX6PtNV7RaNnEidz4rDECAlr4
	lJRjTDGK6Ep302KeGgxx8Mc/xJB6T7OqSY/bKhTC3h5TXCB6K7t+V8OHoItUstMYZwb1
	5ej0tvT46Ckdy9vvUEhX8lPmwDcEKDB3depzQxoGyos14mqBnS89Xn1H3twRf8cqf+wE
	swO9dXeB7SGSyJxlI6H3lvVaJVuf0yEL2dOtm6v6cOeGBU9/mEPKoTSLb/6WVmEIjbo0
	b5p87m+nZcGC9sV0rknaZTZdAIp+asydMFB5yHvhn9MKtOBB4dh1mq5L/jdPySIHx745
	pOAQ==
Received: by 10.204.145.90 with SMTP id c26mr8521528bkv.34.1346772918029;
	Tue, 04 Sep 2012 08:35:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm10771413bkc.3.2012.09.04.08.35.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 08:35:16 -0700 (PDT)
Date: Tue, 4 Sep 2012 17:35:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120904153544.GF3372@jama.jama.net>
References: <1346766298-25410-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1346766298-25410-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] task*: rename to packagegroup to match oe-core
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
X-List-Received-Date: Tue, 04 Sep 2012 15:47:40 -0000
X-Groupsio-MsgNum: 40449
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2012 at 03:44:57PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-core/meta/meta-toolchain-efl.bb               |  2 +-
>  .../task-efl-sdk.bb =3D> packagegroups/packagegroup-efl-sdk.bb}  |  4 ++=
--
>  .../packagegroup-efl-sdk.inc}                                  |  0
>  .../packagegroup-efl-standalone-sdk-target.bb}                 |  4 ++--
>  .../packagegroup-x11-illume.bb}                                |  6 +++-=
--
>  meta-oe/conf/layer.conf                                        |  2 +-
>  .../task-basic.bb =3D> packagegroups/packagegroup-basic.bb}      |  6 ++=
+---
>  .../{tasks/task-boot.bb =3D> packagegroups/packagegroup-boot.bb} |  2 +-
>  .../packagegroup-cli-tools.bb}                                 |  2 +-
>  .../packagegroup-x11-server_1.0.bb}                            |  4 ++--
>  .../task-x11_1.0.bb =3D> packagegroups/packagegroup-x11_1.0.bb}  |  2 +-

Wait with this one (and the following one) so that maybe we'll be able=20
to use packagegroup-core-x11-* from oe-core

>  .../packagegroup-sdk-target.bb}                                |  4 ++--
>  .../packagegroup-fonts-truetype.bb}                            | 10 ++++=
+-----
>  .../packagegroup-qte-toolchain-target.bbappend}                |  0
>  .../packagegroup-basic.bbappend}                               |  0
>  .../packagegroup-xfce-base.bb}                                 |  2 +-
>  .../packagegroup-xfce-extended.bb}                             |  4 ++--
>  17 files changed, 27 insertions(+), 27 deletions(-)
>  rename meta-efl/recipes-efl/{tasks/task-efl-sdk.bb =3D> packagegroups/pa=
ckagegroup-efl-sdk.bb} (84%)
>  rename meta-efl/recipes-efl/{tasks/task-efl-sdk.inc =3D> packagegroups/p=
ackagegroup-efl-sdk.inc} (100%)
>  rename meta-efl/recipes-efl/{tasks/task-efl-standalone-sdk-target.bb =3D=
> packagegroups/packagegroup-efl-standalone-sdk-target.bb} (81%)
>  rename meta-efl/recipes-efl/{tasks/task-x11-illume.bb =3D> packagegroups=
/packagegroup-x11-illume.bb} (85%)
>  rename meta-oe/recipes-core/{tasks/task-basic.bb =3D> packagegroups/pack=
agegroup-basic.bb} (89%)
>  rename meta-oe/recipes-core/{tasks/task-boot.bb =3D> packagegroups/packa=
gegroup-boot.bb} (97%)
>  rename meta-oe/recipes-core/{tasks/task-cli-tools.bb =3D> packagegroups/=
packagegroup-cli-tools.bb} (96%)
>  rename meta-oe/recipes-core/{tasks/task-x11-server_1.0.bb =3D> packagegr=
oups/packagegroup-x11-server_1.0.bb} (86%)
>  rename meta-oe/recipes-core/{tasks/task-x11_1.0.bb =3D> packagegroups/pa=
ckagegroup-x11_1.0.bb} (95%)
>  rename meta-oe/recipes-devtools/{tasks/task-sdk-target.bb =3D> packagegr=
oups/packagegroup-sdk-target.bb} (91%)
>  rename meta-oe/recipes-graphics/{tasks/task-fonts-truetype.bb =3D> packa=
gegroups/packagegroup-fonts-truetype.bb} (72%)
>  rename meta-oe/recipes-qt/{tasks/task-qte-toolchain-target.bbappend =3D>=
 packagegroups/packagegroup-qte-toolchain-target.bbappend} (100%)
>  rename meta-systemd/meta-oe/recipes-core/{tasks/task-basic.bbappend =3D>=
 packagegroups/packagegroup-basic.bbappend} (100%)
>  rename meta-xfce/recipes-xfce/{tasks/task-xfce-base.bb =3D> packagegroup=
s/packagegroup-xfce-base.bb} (97%)
>  rename meta-xfce/recipes-xfce/{tasks/task-xfce-extended.bb =3D> packageg=
roups/packagegroup-xfce-extended.bb} (95%)
>=20
> diff --git a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb b/meta-efl/=
recipes-core/meta/meta-toolchain-efl.bb
> index 875d8f8..b7b7fca 100644
> --- a/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
> +++ b/meta-efl/recipes-core/meta/meta-toolchain-efl.bb
> @@ -1,4 +1,4 @@
> -TOOLCHAIN_TARGET_EFLTASK ?=3D "task-efl-standalone-sdk-target task-efl-s=
tandalone-sdk-target-dbg"
> +TOOLCHAIN_TARGET_EFLTASK ?=3D "packagegroup-efl-standalone-sdk-target pa=
ckagegroup-efl-standalone-sdk-target-dbg"
>  TOOLCHAIN_TARGET_TASK =3D "${TOOLCHAIN_TARGET_EFLTASK}"
>  TOOLCHAIN_OUTPUTNAME =3D "${SDK_NAME}-toolchain-efl-${DISTRO_VERSION}"
>  require recipes-core/meta/meta-toolchain.bb
> diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.bb b/meta-efl/recipe=
s-efl/packagegroups/packagegroup-efl-sdk.bb
> similarity index 84%
> rename from meta-efl/recipes-efl/tasks/task-efl-sdk.bb
> rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
> index 5c1a13a..bfaf5d4 100644
> --- a/meta-efl/recipes-efl/tasks/task-efl-sdk.bb
> +++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
> @@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3
> =20
>  ALLOW_EMPTY =3D "1"
> =20
> -require task-efl-sdk.inc
> +require packagegroup-efl-sdk.inc
> =20
>  PACKAGES =3D "${PN}"
> =20
>  RDEPENDS_${PN} =3D "\
> -    task-core-sdk \
> +    packagegroup-core-sdk \
>      ${SDK-EFL} \
>      ${SDK-EXTRAS}"
> diff --git a/meta-efl/recipes-efl/tasks/task-efl-sdk.inc b/meta-efl/recip=
es-efl/packagegroups/packagegroup-efl-sdk.inc
> similarity index 100%
> rename from meta-efl/recipes-efl/tasks/task-efl-sdk.inc
> rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.inc
> diff --git a/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb=
 b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-targe=
t.bb
> similarity index 81%
> rename from meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
> rename to meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-=
sdk-target.bb
> index 95a66b9..21d1540 100644
> --- a/meta-efl/recipes-efl/tasks/task-efl-standalone-sdk-target.bb
> +++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-=
target.bb
> @@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3
> =20
>  ALLOW_EMPTY =3D "1"
> =20
> -require task-efl-sdk.inc
> +require packagegroup-efl-sdk.inc
> =20
>  PACKAGES =3D "${PN} ${PN}-dbg"
> =20
>  RDEPENDS_${PN} =3D "\
> -    task-core-standalone-sdk-target \
> +    packagegroup-core-standalone-sdk-target \
>      ${SDK-EFL} \
>      ${SDK-EXTRAS}"
> diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/rec=
ipes-efl/packagegroups/packagegroup-x11-illume.bb
> similarity index 85%
> rename from meta-efl/recipes-efl/tasks/task-x11-illume.bb
> rename to meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
> index 20cf2b8..30cb090 100644
> --- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
> +++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
> @@ -7,15 +7,15 @@ PR =3D "r2"
> =20
>  # WORK IN PROGRESS
> =20
> -inherit task allarch
> +inherit packagegroup allarch
> =20
>  # Default theme and config
>  ETHEME ?=3D "e-wm-theme-default"
>  ECONFIG ?=3D "e-wm-config-illume2"
> =20
>  RDEPENDS_${PN} =3D "\
> -  task-x11-server \
> -  task-x11-utils \
> +  packagegroup-x11-server \
> +  packagegroup-x11-utils \
>    \
>    e-wm \
>    ${ECONFIG} \
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index dcacb32..8a529c8 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -26,7 +26,7 @@ BBFILE_PRIORITY_openembedded-layer =3D "6"
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    pointercal-xinput \
>    mplayer-common \
> -  task-x11-server \
> +  packagegroup-x11-server \
>    fbset-modes \
>    gpsd-machine-conf \
>  "
> diff --git a/meta-oe/recipes-core/tasks/task-basic.bb b/meta-oe/recipes-c=
ore/packagegroups/packagegroup-basic.bb
> similarity index 89%
> rename from meta-oe/recipes-core/tasks/task-basic.bb
> rename to meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> index 47b09de..e46afc2 100644
> --- a/meta-oe/recipes-core/tasks/task-basic.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> @@ -1,4 +1,4 @@
> -# This recipe is intended as a 'simpler' replacement for task-base.
> +# This recipe is intended as a 'simpler' replacement for packagegroup-ba=
se.
>  # Please communicate your use cases and suggestions to the mailinglist(s)
> =20
>  DESCRIPTION =3D "Basic task to get a device online"
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f=
40d7994397109285ec7b81fdeb3
> =20
>  PR =3D "r9"
> =20
> -inherit task
> +inherit packagegroup
> =20
>  # packages which content depend on MACHINE_FEATURES need to be MACHINE_A=
RCH
>  #
> @@ -24,7 +24,7 @@ MACHINE_EXTRA_RRECOMMENDS ?=3D ""
>  TASK_BASIC_SSHDAEMON ?=3D "dropbear openssh-sftp openssh-sftp-server"
> =20
>  #
> -# The section below is designed to match with task-boot, but doesn't dep=
end on it to allow for more freedom=20
> +# The section below is designed to match with packagegroup-boot, but doe=
sn't depend on it to allow for more freedom=20
>  # when writing image recipes.
>  # It also avoids the choice between connman/networkmanager/ifupdown sinc=
e that is an image feature, not a
>  # distro feature.
> diff --git a/meta-oe/recipes-core/tasks/task-boot.bb b/meta-oe/recipes-co=
re/packagegroups/packagegroup-boot.bb
> similarity index 97%
> rename from meta-oe/recipes-core/tasks/task-boot.bb
> rename to meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> index 6c27ffe..ac31118 100644
> --- a/meta-oe/recipes-core/tasks/task-boot.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f=
40d7994397109285ec7b81fdeb3
> =20
>  PR =3D "r57"
> =20
> -inherit task
> +inherit packagegroup
> =20
>  # packages which content depend on MACHINE_FEATURES need to be MACHINE_A=
RCH
>  #
> diff --git a/meta-oe/recipes-core/tasks/task-cli-tools.bb b/meta-oe/recip=
es-core/packagegroups/packagegroup-cli-tools.bb
> similarity index 96%
> rename from meta-oe/recipes-core/tasks/task-cli-tools.bb
> rename to meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> index a849978..0ab3703 100644
> --- a/meta-oe/recipes-core/tasks/task-cli-tools.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT=
;md5=3D3da9cfbcb788c80a0384
>  PV =3D "1.0"
>  PR =3D "r19"
> =20
> -inherit task allarch
> +inherit packagegroup allarch
> =20
>  PACKAGES +=3D "${PN}-debug"
> =20
> diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/=
recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
> similarity index 86%
> rename from meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> rename to meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.=
bb
> index 7e43d55..def5d43 100644
> --- a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
> @@ -3,10 +3,10 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
>  PR =3D "r9"
> =20
> -inherit task
> +inherit packagegroup
> =20
>  # for backwards compatibility
> -RPROVIDES_${PN} +=3D "task-xserver"
> +RPROVIDES_${PN} +=3D "packagegroup-xserver"
> =20
>  XSERVER ?=3D "xserver-xorg \
>             xf86-input-evdev \
> diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes=
-core/packagegroups/packagegroup-x11_1.0.bb
> similarity index 95%
> rename from meta-oe/recipes-core/tasks/task-x11_1.0.bb
> rename to meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
> index 326e09f..93eab95 100644
> --- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  PR =3D "r11"
> =20
> -inherit task allarch
> +inherit packagegroup allarch
> =20
>  PACKAGES +=3D "${PN}-utils"
> =20
> diff --git a/meta-oe/recipes-devtools/tasks/task-sdk-target.bb b/meta-oe/=
recipes-devtools/packagegroups/packagegroup-sdk-target.bb
> similarity index 91%
> rename from meta-oe/recipes-devtools/tasks/task-sdk-target.bb
> rename to meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.=
bb
> index 03141f2..3ad9b55 100644
> --- a/meta-oe/recipes-devtools/tasks/task-sdk-target.bb
> +++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "Packages required for a target (on-devic=
e) SDK"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> =20
> -inherit task allarch
> +inherit packagegroup allarch
> =20
> -RPROVIDES_${PN} =3D "task-native-sdk"
> +RPROVIDES_${PN} =3D "packagegroup-native-sdk"
>  RDEPENDS_${PN} =3D "gcc-symlinks g++-symlinks cpp cpp-symlinks \
>                    binutils-symlinks \
>                    perl-modules \
> diff --git a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb b/meta=
-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
> similarity index 72%
> rename from meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
> rename to meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truet=
ype.bb
> index 112e8cb..816a67f 100644
> --- a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
> +++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.=
bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT=
;md5=3D3da9cfbcb788c80a0384
>  PV =3D "1.0"
>  PR =3D "r1"
> =20
> -inherit task allarch
> +inherit packagegroup allarch
> =20
>  PACKAGES +=3D "\
>    ${PN}-core \
> @@ -13,13 +13,13 @@ PACKAGES +=3D "\
>    ${PN}-japanese \
>  "
> =20
> -RRECOMMENDS_task-fonts-truetype =3D "\
> +RRECOMMENDS_packagegroup-fonts-truetype =3D "\
>    ${PN}-core \
>    ${PN}-chinese \
>    ${PN}-japanese \
>  "
> =20
> -RDEPENDS_task-fonts-truetype-core =3D "\
> +RDEPENDS_packagegroup-fonts-truetype-core =3D "\
>    fontconfig-utils \
>    \
>    ttf-dejavu-common \
> @@ -28,12 +28,12 @@ RDEPENDS_task-fonts-truetype-core =3D "\
>  "
>  #  ttf-dejavu-serif \
> =20
> -RDEPENDS_task-fonts-truetype-chinese =3D "\
> +RDEPENDS_packagegroup-fonts-truetype-chinese =3D "\
>    ${PN}-core \
>    ttf-arphic-uming \
>  "
> =20
> -RDEPENDS_task-fonts-truetype-japanese =3D "\
> +RDEPENDS_packagegroup-fonts-truetype-japanese =3D "\
>    ${PN}-core \
>    ttf-sazanami-gothic \
>    ttf-sazanami-mincho \
> diff --git a/meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend =
b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappe=
nd
> similarity index 100%
> rename from meta-oe/recipes-qt/tasks/task-qte-toolchain-target.bbappend
> rename to meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-tar=
get.bbappend
> diff --git a/meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend =
b/meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-basic.bbappe=
nd
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
> rename to meta-systemd/meta-oe/recipes-core/packagegroups/packagegroup-ba=
sic.bbappend
> diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/r=
ecipes-xfce/packagegroups/packagegroup-xfce-base.bb
> similarity index 97%
> rename from meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
> rename to meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> index d9fcc30..7627576 100644
> --- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
>  PR =3D "r2"
> =20
> -inherit task
> +inherit packagegroup
> =20
>  RDEPENDS_${PN} =3D " \
>      xfwm4 \
> diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xf=
ce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> similarity index 95%
> rename from meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
> rename to meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended=
=2Ebb
> index 0c13a64..469a2b7 100644
> --- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3
> =20
>  PR =3D "r3"
> =20
> -inherit task
> +inherit packagegroup
> =20
>  # mandatory
>  RDEPENDS_${PN} =3D " \
> -    task-xfce-base \
> +    packagegroup-xfce-base \
>  "
> =20
>  # nice to have
> --=20
> 1.7.12
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBGH9AACgkQN1Ujt2V2gByHpwCZAb48wtx7XHGPo4jBodLapSnL
2GQAoIKvoq0edTVa5kwzvZO97GsiMwM5
=dEza
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
