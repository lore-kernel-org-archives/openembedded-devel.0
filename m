Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sk1C3-0002ui-Gv
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 00:58:39 +0200
Received: by yenl13 with SMTP id l13so1358221yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 15:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VqlHtRnDmj8cizbevzLIkE1UqmwlGEqZ2ukovWXnLyY=;
	b=nADi8/Ks8Rt8KdNDCmCnZLFaOZO+jWP68CfxKdTrs9qajcRRg4C+XN669OgiXLJo3T
	uLj7kYYY5YlQDrsIAqWC45C8kH3QtA11sOfm3c2pES8sN7BRg5PhYbhId7vb/jmeazUg
	F8Nd2fJUQj3k3ZucXvklMCH7oFjh37u1MdEbiGW3vPkoAK+i8E2GeFaQtw3ED7nHitq8
	MekQ5vkV3VncnsZmAA5Q4D2zAyK8585PbT+dXaTp+Gkc4w96sdb4pv8TdofOm5/4Wlsg
	yu7Cc5iSHAU+I+94Ic7qJ35GIRIYdH7xQJQXHRhB///PFfUgkvVjyc9XOsjh7jgAdYVf
	+Jog==
MIME-Version: 1.0
Received: by 10.68.125.228 with SMTP id mt4mr177372pbb.21.1340837264549; Wed,
	27 Jun 2012 15:47:44 -0700 (PDT)
Received: by 10.142.144.18 with HTTP; Wed, 27 Jun 2012 15:47:44 -0700 (PDT)
In-Reply-To: <1340147078-27377-1-git-send-email-andrea.adami@gmail.com>
References: <CAAQYJAsdR1_T5Kc7rsA81Nmk+JfS4=Sw0XgZ31r+ewdKB71v=w@mail.gmail.com>
	<1340147078-27377-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 28 Jun 2012 00:47:44 +0200
Message-ID: <CAAQYJAsQ39zO_kmLbiGUwpJ12Ks_OQyTHEOtSsmJhWP6VaYUBQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH] ubi-utils-klibc: move to version 1.5.0
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
X-List-Received-Date: Wed, 27 Jun 2012 22:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 1:04 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb =A0| =A0 49 --------=
------------
> =A0.../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb =A0| =A0 49 ++++++++=
++++++++++++
> =A02 files changed, 49 insertions(+), 49 deletions(-)
> =A0delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.4.9.bb
> =A0create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.0.bb
>
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb=
 b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
> deleted file mode 100644
> index ebdd3f6..0000000
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -DESCRIPTION =3D "Tools for managing memory technology devices."
> -SECTION =3D "base"
> -DEPENDS =3D "zlib lzo e2fsprogs util-linux"
> -HOMEPAGE =3D "http://www.linux-mtd.infradead.org/"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://include/common.h;beginlin=
e=3D1;endline=3D17;md5=3Dba05b07912a44ea2bf81ce409380049c"
> -
> -PR =3D "r4"
> -
> -inherit klibc
> -
> -SRC_URI =3D "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;tag=3D=
995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
> - =A0 =A0 =A0 =A0 =A0 =A0file://Makefile.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://common.mk.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://libubi.c.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://libiniparser.c.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0file://ubiformat.c.patch \
> - =A0 =A0 =A0 =A0 =A0 =A0"
> -
> -S =3D "${WORKDIR}/git/"
> -
> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} -I${S}include -I${S}ubi-utils/include -DWITHOUT_XATTR' 'BUILDD=
IR=3D${S}'"
> -
> -do_install () {
> -
> - =A0 =A0install -d ${D}${sbindir}
> - =A0 =A0oe_runmake DESTDIR=3D"${D}" install
> -
> -}
> -
> -PACKAGES =3D "ubi-utils-klibc-dbg"
> -
> -PACKAGES =3D+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klib=
c ubiupdatevol-klibc \
> - =A0 =A0 =A0 =A0 =A0 =A0 ubimkvol-klibc ubirename-klibc ubirmvol-klibc u=
birsvol-klibc \
> - =A0 =A0 =A0 =A0 =A0 =A0 ubinize-klibc ubiformat-klibc ubicrc32-klibc"
> -
> -FILES_ubinfo-klibc =3D "${sbindir}/ubinfo"
> -FILES_ubiattach-klibc =3D "${sbindir}/ubiattach"
> -FILES_ubidetach-klibc =3D "${sbindir}/ubidetach"
> -FILES_mtdinfo-klibc =3D "${sbindir}/mtdinfo"
> -FILES_ubiupdatevol-klibc =3D "${sbindir}/ubiupdatevol"
> -FILES_ubimkvol-klibc =3D "${sbindir}/ubimkvol"
> -FILES_ubirename-klibc =3D "${sbindir}/ubirename"
> -FILES_ubirmvol-klibc =3D "${sbindir}/ubirmvol"
> -FILES_ubirsvol-klibc =3D "${sbindir}/ubirsvol"
> -FILES_ubinize-klibc =3D "${sbindir}/ubinize"
> -FILES_ubiformat-klibc =3D "${sbindir}/ubiformat"
> -FILES_ubicrc32-klibc =3D "${sbindir}/ubicrc32"
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb=
 b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
> new file mode 100644
> index 0000000..2095552
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION =3D "Tools for managing memory technology devices."
> +SECTION =3D "base"
> +DEPENDS =3D "zlib lzo e2fsprogs util-linux"
> +HOMEPAGE =3D "http://www.linux-mtd.infradead.org/"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://include/common.h;beginlin=
e=3D1;endline=3D17;md5=3Dba05b07912a44ea2bf81ce409380049c"
> +
> +PR =3D "r0"
> +
> +inherit klibc
> +
> +SRC_URI =3D "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;tag=3D=
ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
> + =A0 =A0 =A0 =A0 =A0 =A0file://Makefile.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://common.mk.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://libubi.c.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://libiniparser.c.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://ubiformat.c.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0"
> +
> +S =3D "${WORKDIR}/git/"
> +
> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} -I${S}include -I${S}ubi-utils/include -DWITHOUT_XATTR' 'BUILDD=
IR=3D${S}'"
> +
> +do_install () {
> +
> + =A0 =A0install -d ${D}${sbindir}
> + =A0 =A0oe_runmake DESTDIR=3D"${D}" install
> +
> +}
> +
> +PACKAGES =3D "ubi-utils-klibc-dbg"
> +
> +PACKAGES =3D+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klib=
c ubiupdatevol-klibc \
> + =A0 =A0 =A0 =A0 =A0 =A0 ubimkvol-klibc ubirename-klibc ubirmvol-klibc u=
birsvol-klibc \
> + =A0 =A0 =A0 =A0 =A0 =A0 ubinize-klibc ubiformat-klibc ubicrc32-klibc"
> +
> +FILES_ubinfo-klibc =3D "${sbindir}/ubinfo"
> +FILES_ubiattach-klibc =3D "${sbindir}/ubiattach"
> +FILES_ubidetach-klibc =3D "${sbindir}/ubidetach"
> +FILES_mtdinfo-klibc =3D "${sbindir}/mtdinfo"
> +FILES_ubiupdatevol-klibc =3D "${sbindir}/ubiupdatevol"
> +FILES_ubimkvol-klibc =3D "${sbindir}/ubimkvol"
> +FILES_ubirename-klibc =3D "${sbindir}/ubirename"
> +FILES_ubirmvol-klibc =3D "${sbindir}/ubirmvol"
> +FILES_ubirsvol-klibc =3D "${sbindir}/ubirsvol"
> +FILES_ubinize-klibc =3D "${sbindir}/ubinize"
> +FILES_ubiformat-klibc =3D "${sbindir}/ubiformat"
> +FILES_ubicrc32-klibc =3D "${sbindir}/ubicrc32"
> --
> 1.7.3.4
>

patch superseded, replaced by a new v2

Andrea


