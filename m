Received: from mail-ia0-f181.google.com ([209.85.210.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tg9A9-00027l-Mf
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 08:12:58 +0100
Received: by mail-ia0-f181.google.com with SMTP id s32so3075173iak.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 22:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VmTHUjyxw/DXPSTn/C79fyDjl5l6GazjkT7ojKxbbEc=;
	b=H6KJl/T7nvA3Xh2/p/OV957l1yjZcr6Vp1ue67oDExCAxVI0inY4oNnXtHWaf7og6i
	wE4o0HngeXcgsftL/pBhpsz8xeMcEVUnfQOl3IladfQtcC0cdgd6cEzamw/bjOOw/GVg
	47mTNkGhSlGkCVvN3Sv74gANiBhUdLwOqtXKn/ZSZMoRFKpDpECjbWfwIj/xE+pohfmB
	ZlkKG+TqeWNx+OVmMPJwqjBVRuYn6JASRKwL25nTc8b1jFefpezOnBaP7sormjuqoV4L
	qH6f48iM2Op1Buo9gHDyjKqJa9mKBg6x9/9ZHjKrNQJxB1goNjlCJsSS3RnSp1d9JYUM
	0FQw==
MIME-Version: 1.0
Received: by 10.50.104.232 with SMTP id gh8mr874363igb.45.1354690713509; Tue,
	04 Dec 2012 22:58:33 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Tue, 4 Dec 2012 22:58:33 -0800 (PST)
In-Reply-To: <1354662118-31597-1-git-send-email-pab@pabigot.com>
References: <1354662118-31597-1-git-send-email-pab@pabigot.com>
Date: Wed, 5 Dec 2012 07:58:33 +0100
Message-ID: <CALbNGRT7R_4ZycbG+Fg5dJWBTmiXfbr3p+HK5b0rE=5qE_v6qw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][danny][PATCH] Revert "libgphoto2: fix build"
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
X-List-Received-Date: Wed, 05 Dec 2012 07:12:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 5, 2012 at 12:01 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> From: "Peter A. Bigot" <pab@pabigot.com>
>
> This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.
>
> Patch made in response to oe-core commit 841ea3c1c breaks builds using
> oe-core danny branch which branched before that commit.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  .../0001-configure.ac-remove-AM_PO_SUBDIRS.patch   |   48 --------------=
------
>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    2 -
>  2 files changed, 0 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/00=
01-configure.ac-remove-AM_PO_SUBDIRS.patch
>
> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-conf=
igure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libg=
photo2-2.4.11/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
> deleted file mode 100644
> index 5e135db..0000000
> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.4.11/0001-configure.a=
c-remove-AM_PO_SUBDIRS.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 31a5d2f7db18737aef08c34e8707b4f69f7e5156 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Sun, 21 Oct 2012 17:59:20 +0200
> -Subject: [PATCH] configure.ac: remove AM_PO_SUBDIRS
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -together with oe autotools.bbclass this is done twice and causes:
> -
> -| autoreconf: running: aclocal --system-acdir=3D/home/Superandy/tmp/oe-c=
ore-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2=
/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=3D/home/Superandy/tmp/oe-=
core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Superandy=
/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-=
2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/=
work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2=
-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-ang=
strom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /hom=
e/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/=
libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I auto-m4 -I m4m
> -| configure.ac:230: error: `po-directories' is already registered with A=
C_CONFIG_COMMANDS.
> -
> -Upstream-Status: Inapropriate [configuration]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - configure.ac                 |    1 -
> - libgphoto2_port/configure.ac |    1 -
> - 2 files changed, 0 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 2f8e1b8..2e90acf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -227,7 +227,6 @@ ALL_LINGUAS=3D"da de es eu fr hu it ja nl pl ru sv u=
k vi zh_CN"
> - GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_CURRENT_MIN}],[The gPhoto Team=
],[${MAIL_GPHOTO_TRANSLATION}])
> - AM_GNU_GETTEXT_VERSION([0.14.1])
> - AM_GNU_GETTEXT([external])
> --AM_PO_SUBDIRS()
> - AM_ICONV()
> - GP_GETTEXT_FLAGS()
> -
> -diff --git a/libgphoto2_port/configure.ac b/libgphoto2_port/configure.ac
> -index 0b66d58..df47357 100644
> ---- a/libgphoto2_port/configure.ac
> -+++ b/libgphoto2_port/configure.ac
> -@@ -116,7 +116,6 @@ GP_GETTEXT_HACK([${PACKAGE}-${LIBGPHOTO2_PORT_CURREN=
T_MIN}],[Lutz Mueller and ot
> - ALL_LINGUAS=3D"cs da de fr es eu it ja nl pl pt_BR ru sk sv uk vi zh_CN=
 zh_TW"
> - AM_GNU_GETTEXT_VERSION([0.14.1])
> - AM_GNU_GETTEXT([external])
> --AM_PO_SUBDIRS()
> - AM_ICONV()
> - GP_GETTEXT_FLAGS()
> -
> ---
> -1.7.4.4
> -
> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta=
-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> index d7f6ac0..affe571 100644
> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> @@ -15,7 +15,6 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${=
PV}.tar.bz2;name=3Dlibgphoto2
>             file://10-camera-libgphoto2-device.fdi \
>             file://10-camera-libgphoto2.fdi \
>             file://40-libgphoto2.rules \
> -           file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
>  "
>
>  SRC_URI[libgphoto2.md5sum] =3D "16a22b9739e45a95980ed62705fe7333"
> @@ -26,7 +25,6 @@ inherit autotools pkgconfig gettext lib_package
>  EXTRA_OECONF =3D " --with-drivers=3Dall udevscriptdir=3D/lib/udev ac_cv_=
lib_ltdl_lt_dlcaller_register=3Dyes"
>
>  do_configure_append() {
> -       cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_p=
ort/po/
>         cd ${S}/libgphoto2_port/
>         autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF=
} $acpaths
>         cd ${S}
> --
> 1.7.7.6
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


