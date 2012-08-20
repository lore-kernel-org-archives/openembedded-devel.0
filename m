Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3Ngw-0001Jp-IR
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:50:34 +0200
Received: by wibhn17 with SMTP id hn17so3088460wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qxfBcIkvp7yksPwbacNFBFcmEwZ3u0A4gdybKhtjjYY=;
	b=fOw+FX9pPzL/IFqWOQ3TxJwjON5VjsWHjioQ9PS7Js+CgtR+TijRAGQmavpG1CXT49
	spaM5wMDCjhT3fGdvRhtyuvHc5Oez85faOqfioQrx3Su2ynTn82N5GHqr3egPWnhWtN5
	ZmCcIfa0PJZHGD1zs1b6VLku9/oekfnA/oJf8EbcZVNpt/f/QWKtn/9DB43nb/MGTEeV
	VLIfCVaMBRB1KsS8Oiwu1XZQ6PK3nOzEBGpcmDf3juzAOhVAhoi0v8zTYvb7yHwuRNjj
	qSUvg1De1DFdQJsdVXbEE4gVZ42RNUNa8P258nbR7Q0wqF0JsUZPPcZVpalXJVRjLT3J
	/BNQ==
Received: by 10.180.20.204 with SMTP id p12mr27113825wie.7.1345451912482;
	Mon, 20 Aug 2012 01:38:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm27009755wiv.11.2012.08.20.01.38.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:38:31 -0700 (PDT)
Date: Mon, 20 Aug 2012 10:38:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120820083833.GC3063@jama.jama.net>
References: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] pixman: remove append from meta-oe
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
X-List-Received-Date: Mon, 20 Aug 2012 08:50:34 -0000
X-Groupsio-MsgNum: 40262
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2012 at 04:31:49PM +0200, Andreas M=FCller wrote:
> If [1] is going to be accepted, there is no need for pixman in meta-oe.
>=20
> [1] http://patches.openembedded.org/patch/34885/

I've merged your updated patches with renamed .bbappend and removed PRINC=
=20
for meta-oe to parse until [1] is applied in oe-core if someone is interest=
ed=20
(it's in contrib/shr branch).

Cheers,

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...lated-workarounds-in-cpu-features-detecti.patch |  121 --------------=
------
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --------------=
----
>  .../xorg-lib/pixman_0.26.2.bbappend                |   13 --
>  3 files changed, 0 insertions(+), 248 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-=
ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-=
Generic-C-implementation-of-pixman_blt-with-overlapp.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbapp=
end
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qem=
u-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graph=
ics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-feature=
s-detecti.patch
> deleted file mode 100644
> index b56e690..0000000
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-relat=
ed-workarounds-in-cpu-features-detecti.patch
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -From dad8537110c27b45795f8879a3e0a54aa77546b9 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Tue, 11 Jan 2011 18:10:39 +0200
> -Subject: [PATCH] ARM: qemu related workarounds in cpu features detection=
 code
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - pixman/pixman-cpu.c |   67 +++++++++++++++++++++++++++++++++++++++++---=
------
> - 1 files changed, 55 insertions(+), 12 deletions(-)
> -
> -diff --git a/pixman/pixman-cpu.c b/pixman/pixman-cpu.c
> -index aa9036f..a8f2494 100644
> ---- a/pixman/pixman-cpu.c
> -+++ b/pixman/pixman-cpu.c
> -@@ -333,15 +333,30 @@ pixman_arm_read_auxv_or_cpu_features ()
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <sys/mman.h>
> -+#include <sys/utsname.h>
> - #include <fcntl.h>
> - #include <string.h>
> - #include <elf.h>
> -=20
> -+/*
> -+ * The whole CPU capabilities detection is a bit ugly: when running in
> -+ * userspace qemu, we see /proc/self/auxv from the host system. To make
> -+ * everything even worse, the size of each value is 64-bit when running
> -+ * on a 64-bit host system. So the data is totally bogus because we exp=
ect
> -+ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cau=
se
> -+ * segfault (null pointer dereference on x86-64 host). So in order to be
> -+ * on a safe side, we require that AT_PLATFORM value is found only once,
> -+ * and it has non-zero value (this is still not totally reliable for a =
big
> -+ * endian 64-bit host system running qemu and may theoretically fail).
> -+ */
> - static void
> - pixman_arm_read_auxv_or_cpu_features ()
> - {
> -     int fd;
> -     Elf32_auxv_t aux;
> -+    uint32_t hwcap =3D 0;
> -+    const char *plat =3D NULL;
> -+    int plat_cnt =3D 0;
> -=20
> -     fd =3D open ("/proc/self/auxv", O_RDONLY);
> -     if (fd >=3D 0)
> -@@ -350,32 +365,60 @@ pixman_arm_read_auxv_or_cpu_features ()
> - 	{
> - 	    if (aux.a_type =3D=3D AT_HWCAP)
> - 	    {
> --		uint32_t hwcap =3D aux.a_un.a_val;
> --		/* hardcode these values to avoid depending on specific
> --		 * versions of the hwcap header, e.g. HWCAP_NEON
> --		 */
> --		arm_has_vfp =3D (hwcap & 64) !=3D 0;
> --		arm_has_iwmmxt =3D (hwcap & 512) !=3D 0;
> --		/* this flag is only present on kernel 2.6.29 */
> --		arm_has_neon =3D (hwcap & 4096) !=3D 0;
> -+		hwcap =3D aux.a_un.a_val;
> - 	    }
> - 	    else if (aux.a_type =3D=3D AT_PLATFORM)
> - 	    {
> --		const char *plat =3D (const char*) aux.a_un.a_val;
> --		if (strncmp (plat, "v7l", 3) =3D=3D 0)
> -+		plat =3D (const char*) aux.a_un.a_val;
> -+		plat_cnt++;
> -+	    }
> -+	}
> -+	close (fd);
> -+
> -+	if (plat =3D=3D NULL || plat_cnt !=3D 1 || *plat !=3D 'v')
> -+	{
> -+	    /*
> -+	     * Something seems to be really wrong, most likely we are
> -+	     * running under qemu. Let's use machine type from "uname" for
> -+	     * CPU capabilities detection:
> -+	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.h=
tml
> -+	     */
> -+	    struct utsname u;
> -+	    hwcap =3D 0; /* clear hwcap, because it is bogus */
> -+	    if (uname (&u) =3D=3D 0)
> -+	    {
> -+		if (strcmp (u.machine, "armv7l") =3D=3D 0)
> - 		{
> - 		    arm_has_v7 =3D TRUE;
> - 		    arm_has_v6 =3D TRUE;
> -+		    hwcap |=3D 64; /* qemu is supposed to emulate vfp */
> -+		    hwcap |=3D 4096; /* qemu is supposed to emulate neon */
> - 		}
> --		else if (strncmp (plat, "v6l", 3) =3D=3D 0)
> -+		else if (strcmp (u.machine, "armv6l") =3D=3D 0)
> - 		{
> - 		    arm_has_v6 =3D TRUE;
> -+		    hwcap |=3D 64; /* qemu is supposed to emulate vfp */
> - 		}
> - 	    }
> - 	}
> --	close (fd);
> -+	else if (strncmp (plat, "v7l", 3) =3D=3D 0)
> -+	{
> -+	    arm_has_v7 =3D TRUE;
> -+	    arm_has_v6 =3D TRUE;
> -+	}
> -+	else if (strncmp (plat, "v6l", 3) =3D=3D 0)
> -+	{
> -+	    arm_has_v6 =3D TRUE;
> -+	}
> -     }
> -=20
> -+    /* hardcode these values to avoid depending on specific
> -+     * versions of the hwcap header, e.g. HWCAP_NEON
> -+     */
> -+    arm_has_vfp =3D (hwcap & 64) !=3D 0;
> -+    arm_has_iwmmxt =3D (hwcap & 512) !=3D 0;
> -+    arm_has_neon =3D (hwcap & 4096) !=3D 0;
> -+
> -     arm_tests_initialized =3D TRUE;
> - }
> -=20
> ---=20
> -1.7.8.6
> -
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic=
-C-implementation-of-pixman_blt-with-overlapp.patch b/meta-oe/recipes-graph=
ics/xorg-lib/pixman-0.26.2/0008-Generic-C-implementation-of-pixman_blt-with=
-overlapp.patch
> deleted file mode 100644
> index 34f96ed..0000000
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-Generic-C-impl=
ementation-of-pixman_blt-with-overlapp.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 0c7aa6a3ebc29d7986d2417371df210f3e9a65b4 Mon Sep 17 00:00:00 2001
> -From: Siarhei Siamashka <siarhei.siamashka@nokia.com>
> -Date: Tue, 16 Mar 2010 16:55:28 +0100
> -Subject: [PATCH 8/8] Generic C implementation of pixman_blt with overlap=
ping support
> -
> -Uses memcpy/memmove functions to copy pixels, can handle the
> -case when both source and destination areas are in the same
> -image (this is useful for scrolling).
> -
> -It is assumed that copying direction is only important when
> -using the same image for both source and destination (and
> -src_stride =3D=3D dst_stride). Copying direction is undefined
> -for the images with different source and destination stride
> -which happen to be in the overlapped areas (but this is an
> -unrealistic case anyway).
> ----
> - pixman/pixman-general.c |   21 ++++++++++++++++++---
> - pixman/pixman-private.h |   43 ++++++++++++++++++++++++++++++++++++++++=
+++
> - 2 files changed, 61 insertions(+), 3 deletions(-)
> -
> -diff --git a/pixman/pixman-general.c b/pixman/pixman-general.c
> -index 2ccdfcd..90461b6 100644
> ---- a/pixman/pixman-general.c
> -+++ b/pixman/pixman-general.c
> -@@ -227,9 +227,24 @@ general_blt (pixman_implementation_t *imp,
> -              int                      width,
> -              int                      height)
> - {
> --    /* We can't blit unless we have sse2 or mmx */
> --
> --    return FALSE;
> -+    uint8_t *dst_bytes =3D (uint8_t *)dst_bits;
> -+    uint8_t *src_bytes =3D (uint8_t *)src_bits;
> -+    int bpp;
> -+
> -+    if (src_bpp !=3D dst_bpp || src_bpp & 7)
> -+	return FALSE;
> -+
> -+    bpp =3D src_bpp >> 3;
> -+    width *=3D bpp;
> -+    src_stride *=3D 4;
> -+    dst_stride *=3D 4;
> -+    pixman_blt_helper (src_bytes + src_y * src_stride + src_x * bpp,
> -+                       dst_bytes + dest_y * dst_stride + dest_x * bpp,
> -+                       src_stride,
> -+                       dst_stride,
> -+                       width,
> -+                       height);
> -+    return TRUE;
> - }
> -=20
> - static pixman_bool_t
> -diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
> -index cbd48f3..c20d9f0 100644
> ---- a/pixman/pixman-private.h
> -+++ b/pixman/pixman-private.h
> -@@ -10,6 +10,7 @@
> -=20
> - #include "pixman.h"
> - #include <time.h>
> -+#include <string.h>
> - #include <assert.h>
> - #include <stdio.h>
> - #include <string.h>
> -@@ -998,4 +999,46 @@ void pixman_timer_register (pixman_timer_t *timer);
> -=20
> - #endif /* PIXMAN_TIMERS */
> -=20
> -+/* a helper function, can blit 8-bit images with src/dst overlapping su=
pport */
> -+static inline void
> -+pixman_blt_helper (uint8_t *src_bytes,
> -+                   uint8_t *dst_bytes,
> -+                   int      src_stride,
> -+                   int      dst_stride,
> -+                   int      width,
> -+                   int      height)
> -+{
> -+    /*
> -+     * The second part of this check is not strictly needed, but it pre=
vents
> -+     * unnecessary upside-down processing of areas which belong to diff=
erent
> -+     * images. Upside-down processing can be slower with fixed-distance=
-ahead
> -+     * prefetch and perceived as having more tearing.
> -+     */
> -+    if (src_bytes < dst_bytes + width &&
> -+	src_bytes + src_stride * height > dst_bytes)
> -+    {
> -+	src_bytes +=3D src_stride * height - src_stride;
> -+	dst_bytes +=3D dst_stride * height - dst_stride;
> -+	dst_stride =3D -dst_stride;
> -+	src_stride =3D -src_stride;
> -+	/* Horizontal scrolling to the left needs memmove */
> -+	if (src_bytes + width > dst_bytes)
> -+	{
> -+	    while (--height >=3D 0)
> -+	    {
> -+		memmove (dst_bytes, src_bytes, width);
> -+		dst_bytes +=3D dst_stride;
> -+		src_bytes +=3D src_stride;
> -+	    }
> -+	    return;
> -+	}
> -+    }
> -+    while (--height >=3D 0)
> -+    {
> -+	memcpy (dst_bytes, src_bytes, width);
> -+	dst_bytes +=3D dst_stride;
> -+	src_bytes +=3D src_stride;
> -+    }
> -+}
> -+
> - #endif /* PIXMAN_PRIVATE_H */
> ---=20
> -1.6.6.1
> -
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend b/m=
eta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
> deleted file mode 100644
> index b5be2b5..0000000
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbappend
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> -
> -PRINC :=3D "${@int(PRINC) + 10}"
> -
> -SRC_URI +=3D " file://0008-Generic-C-implementation-of-pixman_blt-with-o=
verlapp.patch \
> -  file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch=
 \
> -"
> -
> -NEON =3D " --disable-arm-neon "
> -NEON_armv7a =3D " "
> -NEON_armv7a-vfp-neon =3D " "
> -
> -EXTRA_OECONF +=3D "${NEON}"
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAx94kACgkQN1Ujt2V2gBxMgACeMKjmIJYmfSZHp0Zo83nggyb4
4BMAoJm/ZOoAlBVhHRLRvNn94/5Z6c/h
=uYL4
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
