Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 186F67FA4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:36:58 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id g50so16378591qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 12:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f1NqL6eI6ZruJn5IxmuGIhYsqHbXFhwDcCTsjy/hGvU=;
	b=tiZB+vKDl4oh4MRkIoTuEHPpR0FHlRicaiMJJBF6Cbvcj+Q4SOw6Gu3xD9COMdcPjZ
	JOG6DCY4ucHEXqa7HQth+oOHoQ9gZQwLowJLTBG11d0HcO5ZaxITl1v81WmZ4b6bFyXa
	DUuYvZFMiKzArzfGONkU6dlAteZf95N7RcNu0E7A9W80lJr5c/pg4M39ZcPRemMTXD9B
	r01p/ao6pe0rGPgF+TN6QfWn2HOJSsS0fEvm2EVV4NQjc5PaHYyYAr3K7zCLOPa5a18u
	CPBCrHjlOc8irtjN8NZlh4LsDVt3NXKtoQSvsnhOJtRrPiSYPy3Za9pjhm2Se4ZiA0/I
	R/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f1NqL6eI6ZruJn5IxmuGIhYsqHbXFhwDcCTsjy/hGvU=;
	b=KEFbhVveiaq+QJMVRZJzQB5xK/142IK83A4ioL5xP1zpMdeYp+IKAKrszRdMx9CqXA
	V5nGVeoscdnGzdC8Ok6KJMxVmebK0gCf7iM/G1Eve+ZylId0BPchEHqb9RQ+I6UBZB96
	vjBUJFv/fYL+pW2a9HT5jG2Cqb8YQTi2hWcy9qn8bduSZf4i0zpksU9iT0zFWb1QRN29
	C9D45dVRhr4JQDb9gUInYL81VS8Yl8czQlSmDytc6NILiga7pB4+pRfejVtPznILuThN
	9dyGWA3+9i9dYSEsYPhyrO0U2R137HR5+gUCxWJCQX0dGS4zS1qNJZjNp4Uk4nlqwNzH
	cqFw==
X-Gm-Message-State: APjAAAWJuj8F4YBnIod95ovVVlfuIn/Ph3N/t195lLh/7gUgcxR6HVUD
	CpXPHY5edT4hOrV3lnuwc986ou4jYfIcJwG/RkDnYImC580=
X-Google-Smtp-Source: APXvYqwfnrQsMdtinTJFXXh5CkmTCpyz+ZQlLJR90L6XouP9iouZomK0/F1VWC7yZMPFfig8lT7gfNQJACxqCF2vy8o=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr165227qti.80.1572291419464;
	Mon, 28 Oct 2019 12:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191028185447.3553-2-bunk@stusta.de>
In-Reply-To: <20191028185447.3553-2-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 20:36:32 +0100
Message-ID: <CAMKF1soT7MoQc7CG9qEYDjJpYevDzB9M5WDPmsWCbfGZTRc1yg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] gstd: Fix the version number
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
X-List-Received-Date: Mon, 28 Oct 2019 19:36:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 7:55 PM Adrian Bunk <bunk@stusta.de> wrote:

> This is Gstd 0.6.3 for GStreamer 1.x.
>
> Also merge the inc into the recipe.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb            | 3 ---
>  .../gstreamer-1.0/{gstd.inc => gstd_git.bb}                 | 6 +++++-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/
> gstd_1.0.bb
>  rename meta-multimedia/recipes-multimedia/gstreamer-1.0/{gstd.inc =>
> gstd_git.bb} (82%)
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> deleted file mode 100644
> index 94f6b575b..000000000
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require gstd.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> similarity index 82%
> rename from meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> rename to meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> index 455d89684..828caa883 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
> @@ -1,8 +1,9 @@
> -DESCRIPTION = "Gstreamer Daemon 1.0"
> +DESCRIPTION = "Gstreamer Daemon"
>  SUMMARY = "GStreamer framework for controlling audio and video streaming
> using TCP connection messages"
>  HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
>  SECTION = "multimedia"
>  LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
>
> @@ -14,6 +15,9 @@ SRC_URI = "git://
> git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SR
> <http://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=$%7BSR>
>             "
>  S = "${WORKDIR}/git"
>
> +# Remove the +really when upstream version is > 1.0
> +PV = "1.0+really0.6.3"


We already have 1.0 so will this sort above that ?
If not we have to maybe either keep it faking 1.0 or bump PE


> +
>  inherit autotools pkgconfig gettext gtk-doc
>
>  do_configure_prepend() {
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

