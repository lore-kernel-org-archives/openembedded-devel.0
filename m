Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD6ED7199F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Apr 2017 18:56:50 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id w64so24188558wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Apr 2017 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=d/10jBvT0Jh7TCi5c2fR/jwaT4f4pUWQgPZ/R6yyAW8=;
	b=JXNeYStnKGh6xVWgm7GcPfG4hgibYR+8X4Es9cjqt3RvlP33MyOVmIRsW3kRkX9lEs
	Pn0gOcPOzgtnpnH36pvCqkoypxf2Q9iy2fAaCQ8+G+U/eaDzP0h4KalDNCsmFIe+IMB/
	BcV152DomU4SgzcOdQPNmGYhFHZP0/addYZFACp6+DMfJmm/UEffEKKzZAyza9xZskxf
	t6920ZRs2DKgS/5J/czN+W2+OqTZo5C/0doe3DFmk8GAzKw65+OrYI28OL6Y+jf+Ks53
	vqTvEo1L/ltllsw1JvXLWqLylmq85YrzUTPge9P3VTwbZ80ED+FYgtE3W04BWByW4ZIW
	XT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=d/10jBvT0Jh7TCi5c2fR/jwaT4f4pUWQgPZ/R6yyAW8=;
	b=NoG9V9z1P8bdtYpwMmjxx3e4QOjnP3Ny6KqahzrhSvRytQtwgr/RbOUSsgsFHGCI9W
	y2Ahcr55qgYKsXqFHoYSy60TDZl9uwQoZXOhm/f6ZAJ91NTb7w5hQm9Y2paYerhSbG8V
	QS2zqH1J/mnLOs1NA6qmX3qIf9weuQV2hmjsk9WNSa6zgZaahvvRvIic3ssx/kam5Abv
	3TIRM/BLJYeHsRUQvKt7tQZo1bhI5Sgzx+qczeQjjDR55QGu2iXi4NMrv7Blk8xpeYUV
	RqjGqXqH4MhW5KA0UM93ZFbzpFo3/ZiSDjwfbATq3fDzvpDbhGX1CEFpi3h0ZsyDB2B7
	RvHA==
X-Gm-Message-State: AN3rC/68PclMbHEVfY3uPP6m6krKi9MqkB8NSPzUr3lTJU781BdcRh9kwQcQxJfn3GSMMa6nwKcOvDLykqmaBw==
X-Received: by 10.28.125.14 with SMTP id y14mr6845566wmc.101.1491764211916;
	Sun, 09 Apr 2017 11:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20170407213646.29455-1-marex@denx.de>
In-Reply-To: <20170407213646.29455-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Apr 2017 18:56:40 +0000
Message-ID: <CAMKF1spjhmOsDzpMd=Oc3aO_OTP_MaKhCu2WJpdrex0M+49szA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] fbida: Fix compile-host-path error
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
X-List-Received-Date: Sun, 09 Apr 2017 18:56:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 2:37 PM Marek Vasut <marex@denx.de> wrote:

> Remove the explicit reference to /usr/local/* in Variables.mk.
> This is completely bogus and causes failure during cross-compilation.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |  4 ++-
>  .../fbida/files/0001-Avoid-using-host-path.patch   | 34
> ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
>
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> index c14fc9b68..459a1e8d2 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> @@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
>
> -SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
> +SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
> +          file://0001-Avoid-using-host-path.patch \
> +          "
>  SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
>  SRC_URI[sha256sum] =
> "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
>
> diff --git
> a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> new file mode 100644
> index 000000000..cdf2c25d3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> @@ -0,0 +1,34 @@
> +From 8d8fa9f22d9f6a95523bac63ac3af724faf5ff92 Mon Sep 17 00:00:00 2001
> +From: Marek Vasut <marex@denx.de>
> +Date: Fri, 7 Apr 2017 23:26:09 +0200
> +Subject: [PATCH] Avoid using host-path
> +
> +Remove the explicit reference to /usr/local/* , this is completely
> +bogus and causes trouble during cross-compilation.
> +
> +Signed-off-by: Marek Vasut <marex@denx.de>
> +Upstream-Status: Inappropriate [upstream requires this]


This status is confusing


> +---
> + mk/Variables.mk | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/mk/Variables.mk b/mk/Variables.mk
> +index 99f787c..3ffd87a 100644
> +--- a/mk/Variables.mk
> ++++ b/mk/Variables.mk
> +@@ -42,12 +42,6 @@ CFLAGS              += -Wall -Wmissing-prototypes
> -Wstrict-prototypes \
> +                  -Wpointer-arith -Wunused
> + CXXFLAGS      += -Wall -Wpointer-arith -Wunused
> +
> +-# add /usr/local to the search path if something is in there ...
> +-ifneq ($(wildcard /usr/local/include/*.h),)
> +-  CFLAGS  += -I/usr/local/include
> +-  LDFLAGS += -L/usr/local/$(LIB)
> +-endif
> +-
> + # fixup include path for $(srcdir) != "."
> + ifneq ($(srcdir),.)
> +   CFLAGS  += -I. -I$(srcdir)
> +--
> +2.11.0
> +
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

