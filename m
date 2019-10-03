Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 934F86BD08
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 18:58:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x93Iw7cV012975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Oct 2019 11:58:07 -0700 (PDT)
Received: from [128.224.20.252] (128.224.20.252) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 3 Oct 2019 11:58:07 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20191003185557.34440-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <85ae0b24-9b48-23d4-37ce-78e85d98828f@windriver.com>
Date: Thu, 3 Oct 2019 14:58:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003185557.34440-1-Trevor.Gamblin@windriver.com>
Subject: Re: [meta-oe][PATCH] php: fix CVE-2019-6978
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Oct 2019 18:58:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/3/19 2:55 PM, Trevor Gamblin wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Patch for php to sync with the fix for the same issue in
> libgd.
>
> CVE: CVE-2019-6978
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../php/php/CVE-2019-6978.patch               | 192 ++++++++++++++++++
>   meta-oe/recipes-devtools/php/php_7.3.9.bb     |   1 +
>   2 files changed, 193 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
>
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch b/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
> new file mode 100644
> index 000000000..b7cdfd964
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2019-6978.patch
> @@ -0,0 +1,192 @@
> +From 089f7c0bc28d399b0420aa6ef058e4c1c120b2ae Mon Sep 17 00:00:00 2001
> +From: "Christoph M. Becker" <cmbecker69@gmx.de>
> +Date: Sat, 19 Jan 2019 10:35:39 +0100
> +Subject: [PATCH] Sync with upstream
> +
> +Even though libgd/libgd#492 is not a relevant bug fix for PHP, since
> +the binding doesn't use the `gdImage*Ptr()` functions at all, we're
> +porting the fix to stay in sync here.
> +---
> + ext/gd/libgd/gd_gif_out.c | 20 +++++++++++++++++---
> + ext/gd/libgd/gd_jpeg.c    | 17 ++++++++++++++---
> + ext/gd/libgd/gd_wbmp.c    | 18 +++++++++++++++---
> + 3 files changed, 46 insertions(+), 9 deletions(-)
> +
> +Upstream-Status: Backport [http://git.php.net/?p=php-src.git;a=commit;h=089f7c0bc28d399b0420aa6ef058e4c1c120b2ae]
> +CVE: CVE-2019-6978
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +diff --git a/ext/gd/libgd/gd_gif_out.c b/ext/gd/libgd/gd_gif_out.c
> +index 1f2a6b936a..2e1f38af70 100644
> +--- a/ext/gd/libgd/gd_gif_out.c
> ++++ b/ext/gd/libgd/gd_gif_out.c
> +@@ -97,12 +97,18 @@ static void cl_hash (register count_int chsize, GifCtx *ctx);
> + static void char_init (GifCtx *ctx);
> + static void char_out (int c, GifCtx *ctx);
> + static void flush_char (GifCtx *ctx);
> ++
> ++static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out);
> ++
> + void * gdImageGifPtr (gdImagePtr im, int *size)
> + {
> +   void *rv;
> +   gdIOCtx *out = gdNewDynamicCtx (2048, NULL);
> +-  gdImageGifCtx (im, out);
> +-  rv = gdDPExtractData (out, size);
> ++	if (!_gdImageGifCtx(im, out)) {
> ++		rv = gdDPExtractData(out, size);
> ++	} else {
> ++		rv = NULL;
> ++	}
> +   out->gd_free (out);
> +   return rv;
> + }
> +@@ -115,6 +121,12 @@ void gdImageGif (gdImagePtr im, FILE * outFile)
> + }
> +
> + void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
> ++{
> ++	_gdImageGifCtx(im, out);
> ++}
> ++
> ++/* returns 0 on success, 1 on failure */
> ++static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
> + {
> + 	gdImagePtr pim = 0, tim = im;
> + 	int interlace, BitsPerPixel;
> +@@ -125,7 +137,7 @@ void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
> + 			based temporary image. */
> + 		pim = gdImageCreatePaletteFromTrueColor(im, 1, 256);
> + 		if (!pim) {
> +-			return;
> ++			return 1;
> + 		}
> + 		tim = pim;
> + 	}
> +@@ -138,6 +150,8 @@ void gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
> + 		/* Destroy palette based temporary image. */
> + 		gdImageDestroy(	pim);
> + 	}
> ++
> ++    return 0;
> + }
> +
> + static int
> +diff --git a/ext/gd/libgd/gd_jpeg.c b/ext/gd/libgd/gd_jpeg.c
> +index 8cf71fcbc9..ef46c4a22c 100644
> +--- a/ext/gd/libgd/gd_jpeg.c
> ++++ b/ext/gd/libgd/gd_jpeg.c
> +@@ -132,6 +132,7 @@ const char * gdJpegGetVersionString()
> + 	}
> + }
> +
> ++static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality);
> +
> + /*
> +  * Write IM to OUTFILE as a JFIF-formatted JPEG image, using quality
> +@@ -153,8 +154,11 @@ void *gdImageJpegPtr (gdImagePtr im, int *size, int quality)
> + {
> + 	void *rv;
> + 	gdIOCtx *out = gdNewDynamicCtx (2048, NULL);
> +-	gdImageJpegCtx (im, out, quality);
> +-	rv = gdDPExtractData (out, size);
> ++	if (!_gdImageJpegCtx(im, out, quality)) {
> ++		rv = gdDPExtractData(out, size);
> ++	} else {
> ++		rv = NULL;
> ++	}
> + 	out->gd_free (out);
> +
> + 	return rv;
> +@@ -163,6 +167,12 @@ void *gdImageJpegPtr (gdImagePtr im, int *size, int quality)
> + void jpeg_gdIOCtx_dest (j_compress_ptr cinfo, gdIOCtx * outfile);
> +
> + void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
> ++{
> ++	_gdImageJpegCtx(im, outfile, quality);
> ++}
> ++
> ++/* returns 0 on success, 1 on failure */
> ++static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
> + {
> + 	struct jpeg_compress_struct cinfo;
> + 	struct jpeg_error_mgr jerr;
> +@@ -184,7 +194,7 @@ void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
> + 		if (row) {
> + 			gdFree (row);
> + 		}
> +-		return;
> ++		return 1;
> + 	}
> +
> + 	cinfo.err->error_exit = fatal_jpeg_error;
> +@@ -277,6 +287,7 @@ void gdImageJpegCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
> + 	jpeg_finish_compress (&cinfo);
> + 	jpeg_destroy_compress (&cinfo);
> + 	gdFree (row);
> ++	return 0;
> + }
> +
> + gdImagePtr gdImageCreateFromJpeg (FILE * inFile)
> +diff --git a/ext/gd/libgd/gd_wbmp.c b/ext/gd/libgd/gd_wbmp.c
> +index 55ced3443d..fd9edad2ca 100644
> +--- a/ext/gd/libgd/gd_wbmp.c
> ++++ b/ext/gd/libgd/gd_wbmp.c
> +@@ -82,6 +82,7 @@ int gd_getin (void *in)
> + 	return (gdGetC((gdIOCtx *) in));
> + }
> +
> ++static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out);
> +
> + /*      gdImageWBMPCtx
> +    **  --------------
> +@@ -93,6 +94,12 @@ int gd_getin (void *in)
> +    **  out:    the stream where to write
> +  */
> + void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
> ++{
> ++	_gdImageWBMPCtx(image, fg, out);
> ++}
> ++
> ++/* returns 0 on success, 1 on failure */
> ++static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
> + {
> + 	int x, y, pos;
> + 	Wbmp *wbmp;
> +@@ -100,7 +107,7 @@ void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
> + 	/* create the WBMP */
> + 	if ((wbmp = createwbmp (gdImageSX (image), gdImageSY (image), WBMP_WHITE)) == NULL) {
> + 		gd_error("Could not create WBMP");
> +-		return;
> ++		return 1;
> + 	}
> +
> + 	/* fill up the WBMP structure */
> +@@ -116,7 +123,9 @@ void gdImageWBMPCtx (gdImagePtr image, int fg, gdIOCtx * out)
> +
> + 	/* write the WBMP to a gd file descriptor */
> + 	if (writewbmp (wbmp, &gd_putout, out)) {
> ++		freewbmp(wbmp);
> + 		gd_error("Could not save WBMP");
> ++		return 1;
> + 	}
> + 	/* des submitted this bugfix: gdFree the memory. */
> + 	freewbmp(wbmp);
> +@@ -204,8 +213,11 @@ void * gdImageWBMPPtr (gdImagePtr im, int *size, int fg)
> + {
> + 	void *rv;
> + 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
> +-	gdImageWBMPCtx(im, fg, out);
> +-	rv = gdDPExtractData(out, size);
> ++	if (!_gdImageWBMPCtx(im, fg, out)) {
> ++		rv = gdDPExtractData(out, size);
> ++	} else {
> ++		rv = NULL;
> ++	}
> + 	out->gd_free(out);
> +
> + 	return rv;
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/php/php_7.3.9.bb b/meta-oe/recipes-devtools/php/php_7.3.9.bb
> index 23ab7ca8e..a5c7b9b6b 100644
> --- a/meta-oe/recipes-devtools/php/php_7.3.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.3.9.bb
> @@ -7,6 +7,7 @@ SRC_URI += "file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
>               file://0049-ext-intl-Use-pkg-config-to-detect-icu.patch \
>               file://0001-Use-pkg-config-for-libxml2-detection.patch \
>               file://debian-php-fixheader.patch \
> +            file://CVE-2019-6978.patch \
>              "
>   SRC_URI_append_class-target = " \
>                                   file://pear-makefile.patch \
My mistake - this should probably be coupled with the libgd fix. Will 
send a v2.

