Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.2540.1609812992695981074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 18:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YEeB4p7i;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id j26so19956990qtq.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 18:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sD3AhnoNP/AxgKLDEcgxgevpq1si9UcTmj8zZB4aTiU=;
        b=YEeB4p7iGbu3G2Cj0SDynznkr06tdSiSkFY140s/4sbGaQtTFVQRh5mdPIQ8e63mxg
         tNN4n0WgWyrkPKoRDwa1VLkD78Hn197naQkI/b/+txcTs8pWut+QPkefUtvyxYOyPoEY
         oCBQaNOnCRqCM5diDJobRpwMS8kw5Kawb6eFH+rWW7PwvD1oHrDgO/T6AM6YDu/+i0pT
         sEi1epoCKVqtdwKFEW6wBPC31NlQN+EbHs8Gwbvu7U2u/dM3u7G44k79WyXoIgP2ADH/
         B5zf2MgmeSeVjVk9tqLGRaEJ3DimpKwRglMBPGqZu8I6H29AFR9n9xZB4g/6gm0Y0dSz
         FJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sD3AhnoNP/AxgKLDEcgxgevpq1si9UcTmj8zZB4aTiU=;
        b=j/C6o1B37Ko+DcLBmshB5SEmtSlKA9jxpw0jEVjSje+ip+Sm211yi2Vko0V712MISQ
         Gyt9oDhx2hZpKUc9eX08PlDFlFEYo3goxF5kR3z1VzBSIIH1Z/qjbO6x7gExLcYX6Ral
         iq5hj5WjhNH/TPgAsscua4gvDtjfR1FhcufsPti5tHJXBRPkrg6+kd6JszDJIxVej2Nn
         YZyiT9wSe4zV2HvXV2sz9Hmw5hNLsgbKg/B76O69R4FewwQOCTG8q7gDj7oZmbbbROH8
         A9AWAVWskJICP4FZvJvATIEUnxybApaKPH7Y6dTRToDRnvKHHJYb0lGvWzRNWQUkIiLr
         wC8w==
X-Gm-Message-State: AOAM5338W25ucY9337OQoignFFNDrvUJgcrxISVsar9PpQV+wLrhBM4P
	7klKPckODTvW2a/mYmD699Fkm8Vyk7rMEMJEZfs=
X-Google-Smtp-Source: ABdhPJzOkuG1+lgv28SZ+joiqtgkNrAyG9WUoffaZRO3pRfOep/V6VK4B3rCFdETQGHDxDEHnaB3ziceKsCyBoLKBGs=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr73820091qto.53.1609812991696;
 Mon, 04 Jan 2021 18:16:31 -0800 (PST)
MIME-Version: 1.0
References: <1609769901-7544-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1609769901-7544-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 4 Jan 2021 18:16:06 -0800
Message-ID: <CAMKF1spXF6GRKwEJYSouPXz+CUqHKT51HexWUNiC9TW9WQGeog@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] openjpeg: upgrade 2.3.1 -> 2.4.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This causes poppler to fail see
https://errors.yoctoproject.org/Errors/Details/540476/

On Sun, Jan 3, 2021 at 6:18 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> CVE-2020-15389.patch
> CVE-2020-6851.patch
> CVE-2020-8112.patch
> Removed since these are included in 2.4.0
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../openjpeg/openjpeg/CVE-2020-15389.patch    | 51 -------------------
>  .../openjpeg/openjpeg/CVE-2020-6851.patch     | 36 -------------
>  .../openjpeg/openjpeg/CVE-2020-8112.patch     | 50 ------------------
>  .../{openjpeg_2.3.1.bb => openjpeg_2.4.0.bb}  |  5 +-
>  4 files changed, 1 insertion(+), 141 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
>  delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
>  delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
>  rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.1.bb => openjpeg_2.4.0.bb} (78%)
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
> deleted file mode 100644
> index f5ce11a27..000000000
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
> -From: Even Rouault <even.rouault@spatialys.com>
> -Date: Sun, 28 Jun 2020 14:19:59 +0200
> -Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
> - of valid and invalid images (CVE-2020-15389)
> -
> -Fixes #1261
> -
> -Credits to @Ruia-ruia for reporting and analysis.
> ----
> - src/bin/jp2/opj_decompress.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> ---- end of original header ---
> -
> -CVE: CVE-2020-15389
> -
> -Upstream-Status: Backport [git://github.com/uclouvain/openjpeg.git]
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> ----
> -diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
> -index 7eeb0952..2634907f 100644
> ---- a/src/bin/jp2/opj_decompress.c
> -+++ b/src/bin/jp2/opj_decompress.c
> -@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
> - int main(int argc, char **argv)
> - {
> -     opj_decompress_parameters parameters;           /* decompression parameters */
> --    opj_image_t* image = NULL;
> --    opj_stream_t *l_stream = NULL;              /* Stream */
> --    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
> --    opj_codestream_index_t* cstr_index = NULL;
> -
> -     OPJ_INT32 num_images, imageno;
> -     img_fol_t img_fol;
> -@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
> -
> -     /*Decoding image one by one*/
> -     for (imageno = 0; imageno < num_images ; imageno++)  {
> -+        opj_image_t* image = NULL;
> -+        opj_stream_t *l_stream = NULL;              /* Stream */
> -+        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
> -+        opj_codestream_index_t* cstr_index = NULL;
> -
> -         if (!parameters.quiet) {
> -             fprintf(stderr, "\n");
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> deleted file mode 100644
> index 1e14149c8..000000000
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
> -From: Even Rouault <even.rouault@spatialys.com>
> -Date: Sat, 11 Jan 2020 01:51:19 +0100
> -Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
> - coordinates are beyond INT_MAX (fixes #1228)
> -
> -CVE: CVE-2020-6851
> -
> -Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> -
> ----
> - src/lib/openjp2/j2k.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
> -index 14f6ff41..922550eb 100644
> ---- a/src/lib/openjp2/j2k.c
> -+++ b/src/lib/openjp2/j2k.c
> -@@ -9236,6 +9236,14 @@ static OPJ_BOOL opj_j2k_update_image_dim
> -     l_img_comp = p_image->comps;
> -     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
> -         OPJ_INT32 l_h, l_w;
> -+        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
> -+                p_image->y0 > (OPJ_UINT32)INT_MAX ||
> -+                p_image->x1 > (OPJ_UINT32)INT_MAX ||
> -+                p_image->y1 > (OPJ_UINT32)INT_MAX) {
> -+            opj_event_msg(p_manager, EVT_ERROR,
> -+                          "Image coordinates above INT_MAX are not supported\n");
> -+            return OPJ_FALSE;
> -+        }
> -
> -         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
> -                          (OPJ_INT32)l_img_comp->dx);
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
> deleted file mode 100644
> index 6158601af..000000000
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 05f9b91e60debda0e83977e5e63b2e66486f7074 Mon Sep 17 00:00:00 2001
> -From: Even Rouault <even.rouault@spatialys.com>
> -Date: Thu, 30 Jan 2020 00:59:57 +0100
> -Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
> -
> -That could lead to later assertion failures.
> -
> -Fixes #1231 / CVE-2020-8112
> -
> -CVE: CVE-2020-8112
> -
> -Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ----
> - src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
> - 1 file changed, 18 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/lib/openjp2/tcd.c b/src/lib/openjp2/tcd.c
> -index deecc4df..aa419030 100644
> ---- a/src/lib/openjp2/tcd.c
> -+++ b/src/lib/openjp2/tcd.c
> -@@ -905,8 +905,24 @@ static INLINE OPJ_BOOL opj_tcd_init_tile(opj_tcd_t *p_tcd, OPJ_UINT32 p_tile_no,
> -             /* p. 64, B.6, ISO/IEC FDIS15444-1 : 2000 (18 august 2000)  */
> -             l_tl_prc_x_start = opj_int_floordivpow2(l_res->x0, (OPJ_INT32)l_pdx) << l_pdx;
> -             l_tl_prc_y_start = opj_int_floordivpow2(l_res->y0, (OPJ_INT32)l_pdy) << l_pdy;
> --            l_br_prc_x_end = opj_int_ceildivpow2(l_res->x1, (OPJ_INT32)l_pdx) << l_pdx;
> --            l_br_prc_y_end = opj_int_ceildivpow2(l_res->y1, (OPJ_INT32)l_pdy) << l_pdy;
> -+            {
> -+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->x1,
> -+                                  (OPJ_INT32)l_pdx)) << l_pdx;
> -+                if (tmp > (OPJ_UINT32)INT_MAX) {
> -+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
> -+                    return OPJ_FALSE;
> -+                }
> -+                l_br_prc_x_end = (OPJ_INT32)tmp;
> -+            }
> -+            {
> -+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->y1,
> -+                                  (OPJ_INT32)l_pdy)) << l_pdy;
> -+                if (tmp > (OPJ_UINT32)INT_MAX) {
> -+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
> -+                    return OPJ_FALSE;
> -+                }
> -+                l_br_prc_y_end = (OPJ_INT32)tmp;
> -+            }
> -             /*fprintf(stderr, "\t\t\tprc_x_start=%d, prc_y_start=%d, br_prc_x_end=%d, br_prc_y_end=%d \n", l_tl_prc_x_start, l_tl_prc_y_start, l_br_prc_x_end ,l_br_prc_y_end );*/
> -
> -             l_res->pw = (l_res->x0 == l_res->x1) ? 0U : (OPJ_UINT32)((
> ---
> -2.20.1
> -
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> similarity index 78%
> rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> index a0740a274..82d17e669 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
> @@ -8,11 +8,8 @@ DEPENDS = "libpng tiff lcms zlib"
>  SRC_URI = " \
>      git://github.com/uclouvain/openjpeg.git \
>      file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
> -    file://CVE-2020-6851.patch \
> -    file://CVE-2020-8112.patch \
> -    file://CVE-2020-15389.patch \
>  "
> -SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
> +SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
>  S = "${WORKDIR}/git"
>
>  inherit cmake
> --
> 2.25.1
>
>
>
>
> 
>
