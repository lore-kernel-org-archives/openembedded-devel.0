Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8HJX-0005GM-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 21:58:07 +0200
Received: by pzd13 with SMTP id 13so16225639pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=SIU4lnAFsqg2IgaKePFo/0UVWII+ej/lg7L8/YyUDPA=;
	b=F+ZB2bFERk1ir4kHDuR86iAv2HejS5X3FZr5Cf7yTFd/dcBDPNbM/H2BgJ1XZci9kC
	7leCTHZo9E9zlwnSkjxBUQeAtnSmexIDNSuVP/RLb9R9FO7+q+imJlhy+u8cbkoF9XJ+
	vno1c7p2VYCF7gdKbAD+oswvHKlXjMgd5cLVQ=
Received: by 10.68.208.229 with SMTP id mh5mr31761928pbc.124.1317066760166;
	Mon, 26 Sep 2011 12:52:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Mon, 26 Sep 2011 12:52:10 -0700 (PDT)
In-Reply-To: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
References: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Sep 2011 12:52:10 -0700
Message-ID: <CAMKF1sqyyi++nmZw2yedVo4UKTZ-MotjUKdJ2AwP0ftdwp0beA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] fuse: Upgrade recipe to version 2.8.6
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
X-List-Received-Date: Mon, 26 Sep 2011 19:58:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2011 at 9:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../fuse/fuse-2.8.6/define_GNU_SOURCE.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 12 +++++++
> =C2=A0meta-oe/recipes-support/fuse/fuse_2.8.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 34 ++++++++++++++++++++
> =C2=A02 files changed, 46 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/define_G=
NU_SOURCE.patch
> =C2=A0create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.6.bb
>
> diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.pa=
tch b/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
> new file mode 100644
> index 0000000..c673a4c
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
> @@ -0,0 +1,12 @@
> +Index: fuse-2.8.6/util/fusermount.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- fuse-2.8.6.orig/util/fusermount.c =C2=A02011-09-13 00:23:14.00000000=
0 -0700
> ++++ fuse-2.8.6/util/fusermount.c =C2=A0 =C2=A0 =C2=A0 2011-09-25 00:23:5=
3.051019038 -0700
> +@@ -7,6 +7,7 @@
> + */
> + /* This program does the mounting and unmounting of FUSE filesystems */
> +
> ++#define _GNU_SOURCE
> + #include <config.h>
> +
> + #include "mount_util.h"
> diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recipes=
-support/fuse/fuse_2.8.6.bb
> new file mode 100644
> index 0000000..06eead1
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "With FUSE it is possible to implement a fully functiona=
l filesystem in a userspace program"
> +HOMEPAGE =3D "http://fuse.sf.net"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2&LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62bf790f0a"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "eaa32c8cef56a981656a786f258a002a"
> +SRC_URI[sha256sum] =3D "1ec1913e38f09b2a9ec1579e1800805b5e2c747d1dce515e=
316dbb665ca139d6"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-kernel-module"
> +
> +PACKAGES =3D+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev lib=
ulockmgr-dbg"
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-fuse""
> +
> +FILES_${PN} +=3D "${libdir}/libfuse.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/libfuse*.la"
> +
> +FILES_libulockmgr =3D "${libdir}/libulockmgr.so.*"
> +FILES_libulockmgr-dev +=3D "${libdir}/libulock*.la"
> +FILES_libulockmgr-dbg +=3D "${libdir}/.debug/libulock*"
> +
> +# Forbid auto-renaming to libfuse-utils
> +FILES_fuse-utils =3D "${bindir} ${base_sbindir}"
> +FILES_fuse-utils-dbg =3D "${bindir}/.debug ${base_sbindir}/.debug"
> +DEBIAN_NOAUTONAME_fuse-utils =3D "1"
> +DEBIAN_NOAUTONAME_fuse-utils-dbg =3D "1"
> --
> 1.7.5.4
>
>

A bit of self-review revealed that newly cooked
define_GNU_SOURCE.patch was not being applied which I have fixed
locally.


