Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODggm-0004k4-Im
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:27:49 +0200
Received: by gxk28 with SMTP id 28so2545187gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8naAlEXrRwVs3Hv2R7X2OlycRr+H+iO8svhyKaFD2fc=;
	b=BiB9itmcuVV06dPHCidpMPpI0ujyLkr326BmYhmwM+Tx1OzwjVmffggSD13trJg2DP
	OxAa4U9nnqYiLYYw7XWHWJ73hULPqjBKhrRMS0XcvSwdv5YrrHUVCUKu/C3De1QcUZUV
	AbCJLZ+FDsvTr/urJFC4cGFQXAFzlQoSgVWek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XAgotEm9F11z2QhCWLSqKbwqg4yYK3Afo3NMg/dCFmj0CwS+s/L9r4SuTAsLB3UVTC
	tHHk0BnWBMVYH8BcBouPUq4SLygypFAW1oA0WjG+hujl30A3Pvna/0UFSMqWuuk6SMGK
	PhuTnlTdOX8xYJXfIXBLPZZDR2hS/vosdavsQ=
MIME-Version: 1.0
Received: by 10.100.29.19 with SMTP id c19mr4527070anc.191.1274027021815; Sun, 
	16 May 2010 09:23:41 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Sun, 16 May 2010 09:23:41 -0700 (PDT)
In-Reply-To: <1274025403-5145-1-git-send-email-eric@eukrea.com>
References: <1274025403-5145-1-git-send-email-eric@eukrea.com>
Date: Sun, 16 May 2010 09:23:41 -0700
Message-ID: <AANLkTinfIVZf5c1E-PNGifTu6FBzV4v0CwDYSkLglkI6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] psplash: unbreak recipe
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
X-List-Received-Date: Sun, 16 May 2010 16:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2010 at 8:56 AM, Eric Benard <eric@eukrea.com> wrote:
> psplash was broken by my previous patch for several machines / distro
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D31402cd6f=
9d1e7887926bfde465bb25b07f6dbea
>
> this patch should fix this and is compile tested for kaeilos and angstrom=
 distro
> and for boc01 and omap3pandora machines
>
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> v3: use --find-copies-harder, sorry for the 2MB+ previous patch
> v2: rebased after Koen's fix for Angstrom
>
> =A0recipes/psplash/files/boc01/psplash-poky-img.h =A0 =A0 | =A0 10 ++--
> =A0recipes/psplash/files/configurability.patch =A0 =A0 =A0 =A0| =A0 16 ++=
+---
> =A0recipes/psplash/files/kaeilos/psplash-poky-img.h =A0 | =A0 10 ++--
> =A0recipes/psplash/files/openmoko/psplash-poky-img.h =A0| =A0 10 ++--
> =A0recipes/psplash/files/psplash-poky-img.h =A0 =A0 =A0 =A0 =A0 | =A0 10 =
++--
> =A0recipes/psplash/files/psplash_grayscale.patch =A0 =A0 =A0| =A0 62 ++++=
++++++----------
> =A0.../psplash-omap3pandora/configurability.patch =A0 =A0 | =A0 16 +++---
> =A0.../psplash/psplash-omap3pandora/logo-math.patch =A0 | =A0 26 +++++---
> =A0.../{psplash-hand-img.h =3D> psplash-poky-img.h} =A0 =A0 | =A0 10 ++--
> =A0recipes/psplash/psplash.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> =A010 files changed, 90 insertions(+), 82 deletions(-)
> =A0rename recipes/psplash/psplash-omap3pandora/{psplash-hand-img.h =3D> p=
splash-poky-img.h} (99%)
>
> diff --git a/recipes/psplash/files/boc01/psplash-poky-img.h b/recipes/psp=
lash/files/boc01/psplash-poky-img.h
> index 8c23e48..7cb17fa 100644
> --- a/recipes/psplash/files/boc01/psplash-poky-img.h
> +++ b/recipes/psplash/files/boc01/psplash-poky-img.h
> @@ -1,10 +1,10 @@
> =A0/* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
>
> -#define HAND_IMG_ROWSTRIDE (384)
> -#define HAND_IMG_WIDTH (128)
> -#define HAND_IMG_HEIGHT (64)
> -#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> -#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
> +#define POKY_IMG_ROWSTRIDE (384)
> +#define POKY_IMG_WIDTH (128)
> +#define POKY_IMG_HEIGHT (64)
> +#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> +#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
> =A0 "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\267=
\377" \
> =A0 "\377\377\6\267\267\267~~~\227\227\227\265\265\265\331\331\331\371\37=
1" \
> =A0 "\371\372\377\377\377\11\334\334\334\234\234\234tttUUUTTTZZZ\201\201\=
201" \
> diff --git a/recipes/psplash/files/configurability.patch b/recipes/psplas=
h/files/configurability.patch
> index c968865..90a9c34 100644
> --- a/recipes/psplash/files/configurability.patch
> +++ b/recipes/psplash/files/configurability.patch
> @@ -232,15 +232,15 @@ Index: psplash/psplash.c
>
> =A0 =A0/* Draw the OH logo =A0*/
> =A0- =A0psplash_fb_draw_image (fb,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- HAND_IMG_W=
IDTH)/2,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - HA=
ND_IMG_HEIGHT)/2,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- POKY_IMG_W=
IDTH)/2,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - PO=
KY_IMG_HEIGHT)/2,
> =A0+ =A0psplash_fb_draw_image (fb,
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- HAND_I=
MG_WIDTH)/2,
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - HAND_IMG=
_HEIGHT)/2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_WIDTH,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_HEIGHT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_BYTES_PER_PIXEL=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_RLE_PIXEL_DATA)=
;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- POKY_I=
MG_WIDTH)/2,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - POKY_IMG=
_HEIGHT)/2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_WIDTH,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_HEIGHT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_BYTES_PER_PIXEL=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_RLE_PIXEL_DATA)=
;
>
> =A0 =A0/* Draw progress bar border */
> =A0- =A0psplash_fb_draw_image (fb,
> diff --git a/recipes/psplash/files/kaeilos/psplash-poky-img.h b/recipes/p=
splash/files/kaeilos/psplash-poky-img.h
> index d262d6c..73b1375 100644
> --- a/recipes/psplash/files/kaeilos/psplash-poky-img.h
> +++ b/recipes/psplash/files/kaeilos/psplash-poky-img.h
> @@ -1,10 +1,10 @@
> =A0/* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
>
> -#define HAND_IMG_ROWSTRIDE (720)
> -#define HAND_IMG_WIDTH (240)
> -#define HAND_IMG_HEIGHT (136)
> -#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> -#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
> +#define POKY_IMG_ROWSTRIDE (720)
> +#define POKY_IMG_WIDTH (240)
> +#define POKY_IMG_HEIGHT (136)
> +#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> +#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
> =A0 "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377=
\377" \
> =A0 "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377=
" \
> =A0 "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377=
" \
> diff --git a/recipes/psplash/files/openmoko/psplash-poky-img.h b/recipes/=
psplash/files/openmoko/psplash-poky-img.h
> index 26f7f41..42cdb63 100644
> --- a/recipes/psplash/files/openmoko/psplash-poky-img.h
> +++ b/recipes/psplash/files/openmoko/psplash-poky-img.h
> @@ -1,10 +1,10 @@
> =A0/* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
>
> -#define HAND_IMG_ROWSTRIDE (1440)
> -#define HAND_IMG_WIDTH (480)
> -#define HAND_IMG_HEIGHT (640)
> -#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> -#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
> +#define POKY_IMG_ROWSTRIDE (1440)
> +#define POKY_IMG_WIDTH (480)
> +#define POKY_IMG_HEIGHT (640)
> +#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> +#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
> =A0 "\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0=
\0" \
> =A0 "\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0=
" \
> =A0 "\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0\0\0\377\0=
" \
> diff --git a/recipes/psplash/files/psplash-poky-img.h b/recipes/psplash/f=
iles/psplash-poky-img.h
> index c54f04c..5278177 100644
> --- a/recipes/psplash/files/psplash-poky-img.h
> +++ b/recipes/psplash/files/psplash-poky-img.h
> @@ -1,10 +1,10 @@
> =A0/* GdkPixbuf RGBA C-Source image dump 1-byte-run-length-encoded */
>
> -#define HAND_IMG_ROWSTRIDE (880)
> -#define HAND_IMG_WIDTH (220)
> -#define HAND_IMG_HEIGHT (137)
> -#define HAND_IMG_BYTES_PER_PIXEL (4) /* 3:RGB, 4:RGBA */
> -#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
> +#define POKY_IMG_ROWSTRIDE (880)
> +#define POKY_IMG_WIDTH (220)
> +#define POKY_IMG_HEIGHT (137)
> +#define POKY_IMG_BYTES_PER_PIXEL (4) /* 3:RGB, 4:RGBA */
> +#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
> =A0 "\310\354\354\341\377\2\342\342\330\377\352\352\337\377\323\354\354\3=
41" \
> =A0 "\377\2\346\346\333\377\345\345\332\377\377\354\354\341\377\206\354\3=
54" \
> =A0 "\341\377\2\335\335\322\377\350\350\335\377\323\354\354\341\377\2\343=
" \
> diff --git a/recipes/psplash/files/psplash_grayscale.patch b/recipes/pspl=
ash/files/psplash_grayscale.patch
> index 8f42369..531d63a 100644
> --- a/recipes/psplash/files/psplash_grayscale.patch
> +++ b/recipes/psplash/files/psplash_grayscale.patch
> @@ -1,17 +1,17 @@
> -diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.c
> ---- psplash.orig/psplash-fb.c =A02007-08-29 20:27:49.000000000 +0200
> -+++ psplash/psplash-fb.c =A0 =A0 =A0 2009-01-15 18:42:11.000000000 +0100
> -@@ -62,7 +62,8 @@
> +diff -Nru psplash_orig/psplash-fb.c psplash/psplash-fb.c
> +--- psplash_orig/psplash-fb.c =A02010-04-22 16:17:33.000000000 +0200
> ++++ psplash/psplash-fb.c =A0 =A0 =A0 2010-05-16 15:49:40.000000000 +0200
> +@@ -132,7 +132,8 @@
> =A0 =A0 =A0 =A0goto fail;
> =A0 =A0 =A0}
> -
> +
> =A0- =A0if (fb_var.bits_per_pixel < 16)
> -+ =A0if (fb_var.bits_per_pixel !=3D 1 && fb_var.bits_per_pixel !=3D 2
> -+ =A0 =A0 =A0&& fb_var.bits_per_pixel < 16)
> ++ =A0if (fb_var.bits_per_pixel !=3D 1 && fb_var.bits_per_pixel !=3D 2
> ++ =A0 =A0 =A0 && fb_var.bits_per_pixel < 16)
> =A0 =A0 =A0{
> =A0 =A0 =A0 =A0fprintf(stderr,
> - =A0 =A0 =A0 =A0 =A0 =A0 "Error, no support currently for %i bpp frame b=
uffers\n",
> -@@ -143,7 +144,18 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Error, no support currently for %i bpp fra=
me buffers\n"
> +@@ -258,7 +259,18 @@
> =A0 =A0return NULL;
> =A0}
>
> @@ -30,8 +30,8 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.=
c
> =A0+}
>
> =A0inline void
> - psplash_fb_plot_pixel (PSplashFB =A0 =A0*fb,
> -@@ -153,7 +165,7 @@
> + psplash_fb_plot_pixel (PSplashFB =A0 =A0*fb,
> +@@ -268,7 +280,7 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8 =A0 =A0 =A0 =A0green,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8 =A0 =A0 =A0 =A0blue)
> =A0{
> @@ -40,7 +40,7 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-fb.=
c
>
> =A0 =A0if (x < 0 || x > fb->width-1 || y < 0 || y > fb->height-1)
> =A0 =A0 =A0return;
> -@@ -161,17 +173,17 @@
> +@@ -276,17 +288,17 @@
> =A0 =A0switch (fb->angle)
> =A0 =A0 =A0{
> =A0 =A0 =A0case 270:
> @@ -62,22 +62,22 @@ diff -urN psplash.orig/psplash-fb.c psplash/psplash-f=
b.c
> =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0}
>
> -@@ -188,6 +200,18 @@
> - =A0 =A0 =A0 *(volatile uint16 *) (fb->data + off)
> - =A0 =A0 =A0 =3D ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
> - =A0 =A0 =A0 break;
> -+ =A0 =A0case 2:
> -+ =A0 =A0 =A0shift =3D (3 - (off & 3)) << 1;
> -+ =A0 =A0 =A0*(fb->data + (off >> 2)) =3D (*(fb->data + (off >> 2)) & ~(=
3 << shift))
> -+ =A0 =A0 =A0| (((11*red + 16*green + 5*blue) >> 11) << shift);
> -+ =A0 =A0 =A0break;
> -+ =A0 =A0case 1:
> -+ =A0 =A0 =A0shift =3D 7 - (off & 7);
> -+ =A0 =A0 =A0if (((11*red + 16*green + 5*blue) >> 5) >=3D 128)
> -+ =A0 =A0 =A0 =A0*(fb->data + (off >> 3)) |=3D (1 << shift);
> -+ =A0 =A0 =A0else
> -+ =A0 =A0 =A0 =A0*(fb->data + (off >> 3)) &=3D ~(1 << shift);
> -+ =A0 =A0 =A0break;
> - =A0 =A0 default:
> - =A0 =A0 =A0 /* depth not supported yet */
> - =A0 =A0 =A0 break;
> +@@ -303,6 +315,18 @@
> + =A0 =A0 =A0 =A0 *(volatile uint16_t *) (fb->data + off)
> + =A0 =A0 =A0 =A0 =3D ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >>=
 3);
> + =A0 =A0 =A0 =A0 break;
> ++ =A0 =A0 =A0case 2:
> ++ =A0 =A0 =A0 =A0shift =3D (3 - (off & 3)) << 1;
> ++ =A0 =A0 =A0 =A0*(fb->data + (off >> 2)) =3D (*(fb->data + (off >> 2)) =
& ~(3 << shift))
> ++ =A0 =A0 =A0 =A0| (((11*red + 16*green + 5*blue) >> 11) << shift);
> ++ =A0 =A0 =A0 =A0break;
> ++ =A0 =A0 =A0case 1:
> ++ =A0 =A0 =A0 =A0shift =3D 7 - (off & 7);
> ++ =A0 =A0 =A0 =A0if (((11*red + 16*green + 5*blue) >> 5) >=3D 128)
> ++ =A0 =A0 =A0 =A0 =A0*(fb->data + (off >> 3)) |=3D (1 << shift);
> ++ =A0 =A0 =A0 =A0else
> ++ =A0 =A0 =A0 =A0 =A0*(fb->data + (off >> 3)) &=3D ~(1 << shift);
> ++ =A0 =A0 =A0 =A0break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 /* depth not supported yet */
> + =A0 =A0 =A0 =A0 break;
> diff --git a/recipes/psplash/psplash-omap3pandora/configurability.patch b=
/recipes/psplash/psplash-omap3pandora/configurability.patch
> index c968865..90a9c34 100644
> --- a/recipes/psplash/psplash-omap3pandora/configurability.patch
> +++ b/recipes/psplash/psplash-omap3pandora/configurability.patch
> @@ -232,15 +232,15 @@ Index: psplash/psplash.c
>
> =A0 =A0/* Draw the OH logo =A0*/
> =A0- =A0psplash_fb_draw_image (fb,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- HAND_IMG_W=
IDTH)/2,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - HA=
ND_IMG_HEIGHT)/2,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- POKY_IMG_W=
IDTH)/2,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - PO=
KY_IMG_HEIGHT)/2,
> =A0+ =A0psplash_fb_draw_image (fb,
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- HAND_I=
MG_WIDTH)/2,
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - HAND_IMG=
_HEIGHT)/2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_WIDTH,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_HEIGHT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_BYTES_PER_PIXEL=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_RLE_PIXEL_DATA)=
;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->width =A0- POKY_I=
MG_WIDTH)/2,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - POKY_IMG=
_HEIGHT)/2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_WIDTH,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_HEIGHT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_BYTES_PER_PIXEL=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_RLE_PIXEL_DATA)=
;
>
> =A0 =A0/* Draw progress bar border */
> =A0- =A0psplash_fb_draw_image (fb,
> diff --git a/recipes/psplash/psplash-omap3pandora/logo-math.patch b/recip=
es/psplash/psplash-omap3pandora/logo-math.patch
> index 21467af..2ebfd7c 100644
> --- a/recipes/psplash/psplash-omap3pandora/logo-math.patch
> +++ b/recipes/psplash/psplash-omap3pandora/logo-math.patch
> @@ -1,15 +1,23 @@
> =A0upstream: http://bugzilla.openedhand.com/show_bug.cgi?id=3D801
> =A0comment:
> =A0Do better math when showing logo vs progressbar.
> +---
> + psplash.c | =A0 =A02 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
>
> ---- psplash/psplash.c.org =A0 =A0 =A02007-09-22 20:33:36.000000000 +0300
> -+++ psplash/psplash.c =A02007-12-01 21:27:08.000000000 +0200
> -@@ -258,7 +258,7 @@
> +diff --git a/psplash.c b/psplash.c
> +index 54a65cf..7a52e05 100644
> +--- a/psplash.c
> ++++ b/psplash.c
> +@@ -269,7 +269,7 @@ main (int argc, char** argv)
> =A0 =A0/* Draw the OH logo =A0*/
> =A0 =A0psplash_fb_draw_image (fb,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(fb->width =A0- HAND_IMG=
_WIDTH)/2,
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - HAND_IMG_HEI=
GHT)/2,
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - HA=
ND_IMG_HEIGHT)/2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_WIDTH,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_HEIGHT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HAND_IMG_BYTES_PER_PIXEL=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(fb->width =A0- POKY_IMG=
_WIDTH)/2,
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (fb->height - POKY_IMG_HEI=
GHT)/2,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((fb->height * 5) / 6 - PO=
KY_IMG_HEIGHT)/2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_WIDTH,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_HEIGHT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0POKY_IMG_BYTES_PER_PIXEL=
,
> +--
> +1.6.3.3
> +
> diff --git a/recipes/psplash/psplash-omap3pandora/psplash-hand-img.h b/re=
cipes/psplash/psplash-omap3pandora/psplash-poky-img.h
> similarity index 99%
> rename from recipes/psplash/psplash-omap3pandora/psplash-hand-img.h
> rename to recipes/psplash/psplash-omap3pandora/psplash-poky-img.h
> index 13c64cf..c07ae86 100644
> --- a/recipes/psplash/psplash-omap3pandora/psplash-hand-img.h
> +++ b/recipes/psplash/psplash-omap3pandora/psplash-poky-img.h
> @@ -1,10 +1,10 @@
> =A0/* GdkPixbuf RGB C-Source image dump 1-byte-run-length-encoded */
>
> -#define HAND_IMG_ROWSTRIDE (2400)
> -#define HAND_IMG_WIDTH (800)
> -#define HAND_IMG_HEIGHT (480)
> -#define HAND_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> -#define HAND_IMG_RLE_PIXEL_DATA ((uint8*) \
> +#define POKY_IMG_ROWSTRIDE (2400)
> +#define POKY_IMG_WIDTH (800)
> +#define POKY_IMG_HEIGHT (480)
> +#define POKY_IMG_BYTES_PER_PIXEL (3) /* 3:RGB, 4:RGBA */
> +#define POKY_IMG_RLE_PIXEL_DATA ((uint8*) \
> =A0 "\347\0\0\0\202\0\0\1\1\0\0\0\202\0\0\1\202\0\0\2\1\0\0\1\202\0\0\2\2=
02" \
> =A0 "\0\0\3\1\0\0\2\202\0\0\3\202\0\0\4\1\0\0\3\202\0\0\4\202\0\0\5\1\0\0=
" \
> =A0 "\4\202\0\0\5\202\0\0\6\1\0\0\5\202\0\0\6\202\0\0\7\1\0\0\6\202\0\0\7=
" \
> diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
> index d7b59ae..d16ae3e 100644
> --- a/recipes/psplash/psplash.inc
> +++ b/recipes/psplash/psplash.inc
> @@ -9,7 +9,7 @@ RCONFLICTS_${PN} =3D "exquisite"
>
> =A0SRCREV =3D "422"
> =A0PV =3D "0.0+svnr${SRCPV}"
> -PR =3D "r26"
> +PR =3D "r27"
>

ah can you redo it once again after my commit plz.

> =A0# You can create your own pslash-poky-img.h by doing
> =A0# ./make-image-header.sh <file>.png POKY
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


