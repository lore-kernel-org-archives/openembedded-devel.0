Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9H38-00051a-FM
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 15:21:02 +0200
Received: by yia13 with SMTP id 13so2168906yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Bl88KF0+KRW1TpRCxq2y52FrqO1xSLL3b+GZB2FxeUk=;
	b=FIFTYaHg1dXJEQH00GfcwPJrw8TWvM4trGfh6wu2Vc3tETMBlgHRDRjRLbr+PvrWXt
	eyMUchmaQHQ8HrAziEpyXu/0DdBsXvM36DklipRcAx0vcAIpyFp5yntXfXAEBuL/lkJ3
	Xg2eNH0D90frRNtgIpssZbfxDZ5j2tNk9mjbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=VGQXfIGh1zijO+VgkFn2G2SFrBnNwfHNP56/Ewv8UkWikqNB2YqAL5KpQdn6aFA2HP
	24DahAXVbUl87XMipODnQYFgIc0FjTbrDETyndg109Qr901+IU6lpsClM9BxKNYcKa3X
	B2V6rlFlN9LTzMCzQBN3LbUY1bCym/6HVGfjo=
MIME-Version: 1.0
Received: by 10.236.179.34 with SMTP id g22mr6248621yhm.140.1302527928474;
	Mon, 11 Apr 2011 06:18:48 -0700 (PDT)
Received: by 10.147.114.11 with HTTP; Mon, 11 Apr 2011 06:18:48 -0700 (PDT)
In-Reply-To: <1302090248-16251-2-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
	<1302090248-16251-2-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 11 Apr 2011 15:18:48 +0200
Message-ID: <BANLkTi=nekBQAKgbMSsr7noYTnFMj_pwdQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] xorg: add new versions
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
X-List-Received-Date: Mon, 11 Apr 2011 13:21:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 6, 2011 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * xserver-xorg-1.10, dolt was removed in upstream a769f4c22a9cfb5ba248c92=
4a66c31ec966bd8a0
> * xserver-xorg-1.10, randr-support needs to be updated, but maybe won't
> =A0be needed when new xinput-calibrator with config in xorg.conf.d is
> =A0used (waiting for Marco)
> * xf86-input-tslib needs to be ported to XINPUT 12 ABI or obsoleted
> * tested only on om-gta02 for now, please test other devices

pushed first 2 patches with xserver-xorg upgraded to 1.10.0.902 but
with negative D_P, so 1.9.4 is kept as default version

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/xorg-doc/xorg-sgml-doctools_1.7.bb =A0 =A0 =A0 =A0 | =A0 =A08 =
++++
> =A0recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb =A0 | =A0 =A08 ++++
> =A0recipes/xorg-driver/xf86-input-mouse_1.7.0.bb =A0 =A0 =A0| =A0 =A07 ++=
++
> =A0recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb =A0| =A0 =A09 +++++
> =A0recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb =A0 | =A0 =A09 +++++
> =A0recipes/xorg-driver/xf86-video-ati_6.14.1.bb =A0 =A0 =A0 | =A0 =A08 ++=
++
> =A0recipes/xorg-driver/xf86-video-chips_1.2.4.bb =A0 =A0 =A0| =A0 =A07 ++=
++
> =A0recipes/xorg-driver/xf86-video-geode_2.11.12.bb =A0 =A0| =A0 =A09 ++++=
+
> =A0recipes/xorg-driver/xf86-video-intel_2.14.902.bb =A0 | =A0 11 ++++++
> =A0.../xorg-driver/xf86-video-siliconmotion_1.7.5.bb =A0| =A0 =A07 ++++
> =A0.../xorg-lib/libx11-1.4.3/keysymdef_include.patch =A0| =A0 19 ++++++++=
++
> =A0.../libx11-1.4.3/x11_disable_makekeys.patch =A0 =A0 =A0 =A0| =A0 29 ++=
+++++++++++++
> =A0recipes/xorg-lib/libx11_1.4.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A08 ++++
> =A0recipes/xorg-lib/libxfixes_5.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 13 +++++++
> =A0recipes/xorg-lib/libxi_1.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 10 +++++
> =A0recipes/xorg-lib/libxt_1.1.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 22 +++++++++++
> =A0recipes/xorg-proto/fixesproto_5.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A09 +++++
> =A0recipes/xorg-proto/xextproto_7.2.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A07 ++++
> =A0recipes/xorg-proto/xproto_7.0.21.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A07 ++++
> =A0recipes/xorg-util/util-macros_1.13.0.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 ++
> =A0...ack-assume-pixman-supports-overlapped-blt.patch | =A0 14 +++++++
> =A0.../hack-fbdev-ignore-return-mode.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0 3=
9 ++++++++++++++++++++
> =A0recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb =A0 =A0| =A0 29 ++++++=
+++++++++
> =A023 files changed, 293 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.7.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-input-mouse_1.7.0.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-video-ati_6.14.1.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.4.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.12.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-video-intel_2.14.902.bb
> =A0create mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.=
bb
> =A0create mode 100644 recipes/xorg-lib/libx11-1.4.3/keysymdef_include.pat=
ch
> =A0create mode 100644 recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.=
patch
> =A0create mode 100644 recipes/xorg-lib/libx11_1.4.3.bb
> =A0create mode 100644 recipes/xorg-lib/libxfixes_5.0.bb
> =A0create mode 100644 recipes/xorg-lib/libxi_1.4.2.bb
> =A0create mode 100644 recipes/xorg-lib/libxt_1.1.1.bb
> =A0create mode 100644 recipes/xorg-proto/fixesproto_5.0.bb
> =A0create mode 100644 recipes/xorg-proto/xextproto_7.2.0.bb
> =A0create mode 100644 recipes/xorg-proto/xproto_7.0.21.bb
> =A0create mode 100644 recipes/xorg-util/util-macros_1.13.0.bb
> =A0create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-a=
ssume-pixman-supports-overlapped-blt.patch
> =A0create mode 100644 recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-f=
bdev-ignore-return-mode.patch
> =A0create mode 100644 recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb
>
> diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.7.bb b/recipes/xorg-do=
c/xorg-sgml-doctools_1.7.bb
> new file mode 100644
> index 0000000..af85da3
> --- /dev/null
> +++ b/recipes/xorg-doc/xorg-sgml-doctools_1.7.bb
> @@ -0,0 +1,8 @@
> +require xorg-doc-common.inc
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "2588efb3f49f7fc6ecf41ce42e0b2e5e"
> +SRC_URI[archive.sha256sum] =3D "84fd94e5c50556e6f77501485f8a48724cf3c95c=
6d58480bc280258ba14580c8"
> +
> +FILES_${PN} +=3D " /usr/share/sgml/X11"
> diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb b/recipes/x=
org-driver/xf86-input-keyboard_1.6.0.bb
> new file mode 100644
> index 0000000..b3a7538
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-input-keyboard_1.6.0.bb
> @@ -0,0 +1,8 @@
> +require xorg-driver-input.inc
> +DESCRIPTION =3D "X.Org X server -- keyboard input driver"
> +DEPENDS +=3D " kbproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "e2abe9f13e526a73cb68a7d257546eba"
> +SRC_URI[archive.sha256sum] =3D "c46c790fec905d696573b7a374b10ab8b4389112=
a8f69993fe011006c99e858e"
> diff --git a/recipes/xorg-driver/xf86-input-mouse_1.7.0.bb b/recipes/xorg=
-driver/xf86-input-mouse_1.7.0.bb
> new file mode 100644
> index 0000000..6783e06
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-input-mouse_1.7.0.bb
> @@ -0,0 +1,7 @@
> +require xorg-driver-input.inc
> +DESCRIPTION =3D "X.Org X server -- mouse input driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI[archive.md5sum] =3D "7f31472689c15b6de62eff04d0fb57d7"
> +SRC_URI[archive.sha256sum] =3D "4e989542b5e9e0c5f9087288b18e70de1064dd27=
c83a4bc6dce58f3ea9d74994"
> diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb b/recipes/=
xorg-driver/xf86-input-synaptics_1.4.0.bb
> new file mode 100644
> index 0000000..17b9a33
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-input-synaptics_1.4.0.bb
> @@ -0,0 +1,9 @@
> +require xorg-driver-input.inc
> +DESCRIPTION =3D "X.Org X server -- mouse input driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.1"
> +
> +EXTRA_OEMAKE +=3D " sdkdir=3D${STAGING_INCDIR}/xorg "
> +
> +SRC_URI[archive.md5sum] =3D "cbe487f9d22237d1e39c7d0b5812ab7e"
> +SRC_URI[archive.sha256sum] =3D "5874d979f028636dbddf14fffb84b496b006e63d=
5ea8dfa120820e58642812c2"
> diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb b/recipes/x=
org-driver/xf86-input-vmmouse_12.7.0.bb
> new file mode 100644
> index 0000000..9cbd997
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-input-vmmouse_12.7.0.bb
> @@ -0,0 +1,9 @@
> +require xorg-driver-input.inc
> +DESCRIPTION =3D "X.Org X server -- VMMouse input driver to use with VMWa=
re"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "dc77181330f983c7d0ec1ea1592c2ca7"
> +SRC_URI[archive.sha256sum] =3D "00e5d527a0d97e6b2a6e8c519e1339427e66fa0a=
43af026858655c7c62bd9e35"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"
> diff --git a/recipes/xorg-driver/xf86-video-ati_6.14.1.bb b/recipes/xorg-=
driver/xf86-video-ati_6.14.1.bb
> new file mode 100644
> index 0000000..f388472
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-video-ati_6.14.1.bb
> @@ -0,0 +1,8 @@
> +require xorg-driver-video.inc
> +DESCRIPTION =3D "X.Org X server -- ATI display driver"
> +DEPENDS +=3D " xineramaproto xf86miscproto drm xf86driproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "395e23ad026e4246dd70bbd2143688b5"
> +SRC_URI[archive.sha256sum] =3D "e457285096e1e40f53ae5b58b948906c69add516=
0cc38ce510f0d15e82d91c75"
> diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.4.bb b/recipes/xorg=
-driver/xf86-video-chips_1.2.4.bb
> new file mode 100644
> index 0000000..d505b82
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-video-chips_1.2.4.bb
> @@ -0,0 +1,7 @@
> +require xorg-driver-video.inc
> +DESCRIPTION =3D "X.Org X server -- Chips display driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "7aed07116e56c0630f62d7d34d7526e1"
> +SRC_URI[archive.sha256sum] =3D "fb6dc34a8d7db82dc6d555cebe6f95c2269dda48=
72118978345f6e1215ab4d25"
> diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.12.bb b/recipes/xo=
rg-driver/xf86-video-geode_2.11.12.bb
> new file mode 100644
> index 0000000..3320bad
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-video-geode_2.11.12.bb
> @@ -0,0 +1,9 @@
> +require xorg-driver-video.inc
> +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "a99c521db731c2f1df309057a8465e4c"
> +SRC_URI[archive.sha256sum] =3D "28d845d727d99bfa4d4b93c5486ec01b72eb222e=
0910a766089db1103b1c2d92"
> +
> +COMPATIBLE_HOST =3D "i.86.*-linux"
> diff --git a/recipes/xorg-driver/xf86-video-intel_2.14.902.bb b/recipes/x=
org-driver/xf86-video-intel_2.14.902.bb
> new file mode 100644
> index 0000000..20f47d0
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-video-intel_2.14.902.bb
> @@ -0,0 +1,11 @@
> +require xorg-driver-video.inc
> +DESCRIPTION =3D "X.Org X server -- Intel i8xx, i9xx display driver"
> +DEPENDS +=3D " virtual/libx11 libxvmc drm xf86driproto "
> +RDEPENDS_${PN} +=3D "xserver-xorg-extension-dri \
> + =A0 =A0 =A0 =A0 =A0 =A0 xserver-xorg-extension-dri2 \
> + =A0 =A0 =A0 =A0 =A0 =A0 xserver-xorg-extension-glx"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "7c48151a87311beea39837812e7b9e2b"
> +SRC_URI[archive.sha256sum] =3D "da9ab33ad03c2a51d1c78d648d481f251b5fd3c1=
3f0644a58a7f097b08d6a27f"
> diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb b/reci=
pes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb
> new file mode 100644
> index 0000000..d358737
> --- /dev/null
> +++ b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.5.bb
> @@ -0,0 +1,7 @@
> +require xorg-driver-video.inc
> +DESCRIPTION =3D "X.Org X server -- SiliconMotion display driver"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "9ca392e16028a2f7c3ebc57f0aa4c1aa"
> +SRC_URI[archive.sha256sum] =3D "97dd597186029d5646923dde84f4c7f38080ce24=
c80fd127dcdb8fb36eec7913"
> diff --git a/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch b/reci=
pes/xorg-lib/libx11-1.4.3/keysymdef_include.patch
> new file mode 100644
> index 0000000..1a30e34
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.4.3/keysymdef_include.patch
> @@ -0,0 +1,19 @@
> +diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
> +--- libX11-1.3.6.orig//configure.ac =A0 =A02010-09-20 08:04:16.000000000=
 +0200
> ++++ libX11-1.3.6/configure.ac =A02010-09-28 16:29:26.000000000 +0200
> +@@ -355,7 +355,14 @@
> + # Find keysymdef.h
> + #
> + AC_MSG_CHECKING([keysym definitions])
> +-KEYSYMDEFDIR=3D`$PKG_CONFIG --variable=3Dincludedir xproto`/X11
> ++AC_ARG_WITH(keysymdefdir,
> ++ =A0 =A0 =A0 =A0AC_HELP_STRING([--with-keysymdefdir=3DDIR], [The locati=
on of keysymdef.h]),
> ++ =A0 =A0 =A0 =A0KEYSYMDEFDIR=3D$withval, KEYSYMDEFDIR=3D"")
> ++
> ++if test x$KEYSYMDEFDIR =3D x; then
> ++ =A0 =A0 =A0KEYSYMDEFDIR=3D`$PKG_CONFIG --variable=3Dincludedir xproto`=
/X11
> ++fi
> ++
> + FILES=3D"keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
> + for i in $FILES; do
> + =A0 =A0 if test -f "$KEYSYMDEFDIR/$i"; then
> diff --git a/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch b/r=
ecipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
> new file mode 100644
> index 0000000..9763313
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
> @@ -0,0 +1,29 @@
> +Index: libX11-1.3.4/src/util/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.3.4.orig/src/util/Makefile.am
> ++++ libX11-1.3.4/src/util/Makefile.am
> +@@ -1,24 +1 @@
> +-
> +-noinst_PROGRAMS=3Dmakekeys
> +-
> +-makekeys_CFLAGS =3D \
> +- =A0 =A0 =A0$(X11_CFLAGS) \
> +- =A0 =A0 =A0$(CWARNFLAGS)
> +-
> +-CC =3D @CC_FOR_BUILD@
> +-CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
> +-CFLAGS =3D @CFLAGS_FOR_BUILD@
> +-LDFLAGS =3D @LDFLAGS_FOR_BUILD@
> +-
> + EXTRA_DIST =3D mkks.sh
> +-
> +-if LINT
> +-# Check source code with tools like lint & sparse
> +-
> +-ALL_LINT_FLAGS=3D$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) =
\
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
> +-
> +-lint:
> +- =A0 =A0 =A0$(LINT) $(ALL_LINT_FLAGS) makekeys.c
> +-
> +-endif LINT
> diff --git a/recipes/xorg-lib/libx11_1.4.3.bb b/recipes/xorg-lib/libx11_1=
.4.3.bb
> new file mode 100644
> index 0000000..11f44cb
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11_1.4.3.bb
> @@ -0,0 +1,8 @@
> +require libx11.inc
> +#--without-xcb is not an option anymore
> +#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=3D15e5eaf62897b3=
179d1fbe457cb19f886f0449f8
> +DEPENDS_virtclass-native =3D "libxcb-native ${COMMON_DEPENDS}"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "85e942627aaa020813e0eb8433353563"
> +SRC_URI[archive.sha256sum] =3D "38b5ddd93291714a46a02cb8a5dd94b995a04ed7=
6a608551c44d1598e113635a"
> diff --git a/recipes/xorg-lib/libxfixes_5.0.bb b/recipes/xorg-lib/libxfix=
es_5.0.bb
> new file mode 100644
> index 0000000..db80f66
> --- /dev/null
> +++ b/recipes/xorg-lib/libxfixes_5.0.bb
> @@ -0,0 +1,13 @@
> +require xorg-lib-common.inc
> +DESCRIPTION =3D "X Fixes extension library."
> +LICENSE =3D "BSD-X"
> +DEPENDS +=3D "virtual/libx11 xproto fixesproto xextproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "678071bd7f9f7467e2fc712d81022318"
> +SRC_URI[archive.sha256sum] =3D "537a2446129242737a35db40081be4bbcc126e56=
c03bf5f2b142b10a79cda2e3"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +XORG_PN =3D "libXfixes"
> diff --git a/recipes/xorg-lib/libxi_1.4.2.bb b/recipes/xorg-lib/libxi_1.4=
.2.bb
> new file mode 100644
> index 0000000..c1d944b
> --- /dev/null
> +++ b/recipes/xorg-lib/libxi_1.4.2.bb
> @@ -0,0 +1,10 @@
> +require xorg-lib-common.inc
> +DESCRIPTION =3D "X11 Input extension library"
> +DEPENDS +=3D "libxext inputproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "3d14f7bfc4a4335cf0144de9b67a5444"
> +SRC_URI[archive.sha256sum] =3D "272b8041efc0a0203fb0ba33481ddec989539aed=
862181b58c8c3e410e325691"
> +
> +XORG_PN =3D "libXi"
> diff --git a/recipes/xorg-lib/libxt_1.1.1.bb b/recipes/xorg-lib/libxt_1.1=
.1.bb
> new file mode 100644
> index 0000000..946d511
> --- /dev/null
> +++ b/recipes/xorg-lib/libxt_1.1.1.bb
> @@ -0,0 +1,22 @@
> +require xorg-lib-common.inc
> +DESCRIPTION =3D "X11 toolkit intrinsics library"
> +DEPENDS +=3D "libsm virtual/libx11 kbproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "eb22c0a1f172b06b97a3f5ae89768412"
> +SRC_URI[archive.sha256sum] =3D "a2a1c29c684e3c9082cdb920b5aea802b179d191=
07b9ab2170fda07575559da7"
> +
> +EXTRA_OECONF +=3D "--disable-install-makestrs --disable-xkb"
> +
> +do_compile() {
> + =A0 =A0 =A0 =A0(
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unset CC LD CXX CCLD
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oe_runmake -C util 'XT_CFLAGS=3D' 'CC=3D=
${BUILD_CC}' 'LD=3D${BUILD_LD}' 'CXX=3D${BUILD_CXX}' 'CCLD=3D${BUILD_CCLD}'=
 'CFLAGS=3D-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLA=
GS=3D${BUILD_LDFLAGS}' 'CXXFLAGS=3D${BUILD_CXXFLAGS}' 'CPPFLAGS=3D${BUILD_C=
PPFLAGS}' makestrs
> + =A0 =A0 =A0 =A0) || exit 1
> + =A0 =A0 =A0 =A0oe_runmake
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +XORG_PN =3D "libXt"
> diff --git a/recipes/xorg-proto/fixesproto_5.0.bb b/recipes/xorg-proto/fi=
xesproto_5.0.bb
> new file mode 100644
> index 0000000..9ca1543
> --- /dev/null
> +++ b/recipes/xorg-proto/fixesproto_5.0.bb
> @@ -0,0 +1,9 @@
> +require xorg-proto-common.inc
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "e7431ab84d37b2678af71e29355e101d"
> +SRC_URI[archive.sha256sum] =3D "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c=
7fb2c2c92b7dc72870e424ce"
> +
> +
> +CONFLICTS =3D "fixesext"
> diff --git a/recipes/xorg-proto/xextproto_7.2.0.bb b/recipes/xorg-proto/x=
extproto_7.2.0.bb
> new file mode 100644
> index 0000000..37b4da2
> --- /dev/null
> +++ b/recipes/xorg-proto/xextproto_7.2.0.bb
> @@ -0,0 +1,7 @@
> +require xorg-proto-common.inc
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "220732210ceffb01bf1caf970e3b1bfb"
> +SRC_URI[archive.sha256sum] =3D "d2bc4208c6b1883ebe00bc5c0048e5d825038cda=
56775f74bb4aa89afdc576d5"
> +
> diff --git a/recipes/xorg-proto/xproto_7.0.21.bb b/recipes/xorg-proto/xpr=
oto_7.0.21.bb
> new file mode 100644
> index 0000000..c9f1a8c
> --- /dev/null
> +++ b/recipes/xorg-proto/xproto_7.0.21.bb
> @@ -0,0 +1,7 @@
> +require xorg-proto-common.inc
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "c5a93a69b701cf81925fab02b35b0d0e"
> +SRC_URI[archive.sha256sum] =3D "38ee2f032c3a9e30504593f8b5e6c1161a6629da=
ba93748a71c6f70c16f65548"
> +
> diff --git a/recipes/xorg-util/util-macros_1.13.0.bb b/recipes/xorg-util/=
util-macros_1.13.0.bb
> new file mode 100644
> index 0000000..5ecba18
> --- /dev/null
> +++ b/recipes/xorg-util/util-macros_1.13.0.bb
> @@ -0,0 +1,4 @@
> +require util-macros.inc
> +PR =3D "${INC_PR}.0"
> +SRC_URI[archive.md5sum] =3D "31e9ddcbc1d8bc8c09ab180443974dd1"
> +SRC_URI[archive.sha256sum] =3D "7bff944fb120192e7fe1706e9c0b7e41666e7983=
ce3e2bdef0b7734392d9e695"
> diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pix=
man-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.10.=
0.901/hack-assume-pixman-supports-overlapped-blt.patch
> new file mode 100644
> index 0000000..a947582
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-assume-pixman-sup=
ports-overlapped-blt.patch
> @@ -0,0 +1,14 @@
> +diff --git a/fb/fbcopy.c b/fb/fbcopy.c
> +index 07eb663..ba394b7 100644
> +--- a/fb/fbcopy.c
> ++++ b/fb/fbcopy.c
> +@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr =A0 =A0 =A0pSrcDrawable,
> + =A0 =A0 while (nbox--)
> + =A0 =A0 {
> + #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet=
 */
> +- =A0 =A0 =A0if (pm =3D=3D FB_ALLONES && alu =3D=3D GXcopy && !reverse &=
&
> +- =A0 =A0 =A0 =A0 =A0!upsidedown)
> ++ =A0 =A0 =A0if (pm =3D=3D FB_ALLONES && alu =3D=3D GXcopy)
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, =
srcStride, dstStride, srcBpp, dstBpp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(pbox->x1 + dx +=
 srcXoff),
> diff --git a/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-igno=
re-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fb=
dev-ignore-return-mode.patch
> new file mode 100644
> index 0000000..d3661cb
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-1.10.0.901/hack-fbdev-ignore-retu=
rn-mode.patch
> @@ -0,0 +1,39 @@
> +Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
> +(and probably other) while returning from chvt or resume on some
> +hardware (e. g. zaurus).
> +
> +Correct fix would require debugging of fbdev mode during LeaveVT and
> +EnterVT.
> +
> +This patch may cause staying in incorrect or corrupted display mode
> +after EnterVT, but on man affected devices it does not cause any visible
> +problems.
> +
> +Hacked code is never called on properly written drivers.
> +
> +Devices affected and testers involved for future patch removal:
> +Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
> +
> +See also:
> +https://bugzilla.redhat.com/show_bug.cgi?id=3D238451
> +
> +The bug (first line indicates that your device is affected):
> +
> +(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
> +
> +Fatal server error:
> +EnterVT failed for screen 0
> +
> +Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
> ++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
> +@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
> + #if DEBUG
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 print_fbdev_mode("returned", &set_var);
> + #endif
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* return FALSE; UGLY HACK to allow return =
from chvt */
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!check)
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb b/recipes/xo=
rg-xserver/xserver-xorg_1.10.0.901.bb
> new file mode 100644
> index 0000000..99a32e9
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg_1.10.0.901.bb
> @@ -0,0 +1,29 @@
> +# Assign it here, since the hal->udev transition happens post 1.7 in ang=
strom
> +DISTRO_XORG_CONFIG_MANAGER_angstrom =3D "udev"
> +
> +require xorg-xserver-common.inc
> +
> +DESCRIPTION =3D "the X.Org X server"
> +DEPENDS +=3D "pixman libpciaccess openssl dri2proto glproto xorg-minimal=
-fonts font-util-native"
> +PE =3D "2"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D " \
> + =A0 =A0 =A0 =A0 =A0 =A0file://hack-fbdev-ignore-return-mode.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://hack-assume-pixman-supports-overlapped-bl=
t.patch \
> + =A0 =A0 =A0 =A0 =A0 "
> +SRC_URI[archive.md5sum] =3D "d750cf5f6342b548b7ac2be56e9d1841"
> +SRC_URI[archive.sha256sum] =3D "de18f52c35fc3d3f18c7e905296f9de5ac42dc71=
e4e01da9ae8e154a78c7771c"
> +
> +do_install_prepend() {
> + =A0 =A0 =A0 =A0mkdir -p ${D}/${libdir}/X11/fonts
> +}
> +
> +# The NVidia driver requires Xinerama support in the X server. Ion uses =
it.
> +PACKAGE_ARCH_ion =3D "${MACHINE_ARCH}"
> +XINERAMA =3D "${@['--disable-xinerama','--enable-xinerama'][bb.data.getV=
ar('MACHINE',d) in ['ion']]}"
> +
> +EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdriv=
e --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disabl=
e-dmx"
> +EXTRA_OECONF +=3D " --enable-dri2 --disable-unit-tests --disable-docs --=
disable-devel-docs"
> +
> +export LDFLAGS +=3D " -ldl "
> --
> 1.7.4.1
>
>


