Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 81603606D0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 19:59:09 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v186so60719447wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HOZmC8eK4olnMNHseeGTq8MBXCoOvM6ZlduSWyWp2zY=;
	b=QMgoEcQzFgLtG/blYcpZzT+580h6PmflbLH0ZYqchCZdyvAR3jZyD178WMOQI46zPE
	IvZclGl2HBRK2Ay/9JJd3AjUXPacFHzXwtvbS2USoetEilFp817z1cOA1nqWMjNZj8dd
	78Fd0BfzS9eNjnaKu6PKuuOHWuSjlrr7TXcqYhUU+tTPDnfjhUCnDnke121T/uEqsQHd
	2nOUCTNGw3EwneG3qtxiiApky05Puxbj3Urga3W9ON6JQKeC7a50/BYpMWuTgGTY6Pqe
	uq2aqOWPx5kWdiS3KtOAqLMXUFiXv4YJAKiYk5cVUdW/1Q7gtO+Peu5wf+mbFmQL5nZw
	/rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HOZmC8eK4olnMNHseeGTq8MBXCoOvM6ZlduSWyWp2zY=;
	b=MRzRKa4CBvbSKUw6LrmH0Y4Vg57mMmJ3A1LeMoLgkTrQjjMG4wo803E/3Fi/ks46sP
	diMGXxzXiB8j43ZXefZfllj9sScXFSFxsJqCxa1AVjRjQ2Xrt3ZWnNkTNwQeotknpW+P
	g9hloKD42Z1lpNOl6oy2rqYBdtg1sR8a/rKQUKJmHATqMG9u8VIxNDNgpgKGj9HfcwyO
	3+0z1nKLYGW7k5Eufh4e2M2OlxLu+2blkHmzqis0qztKq7LqT2Dyeg8uvk4gWO8Hh+rf
	Zj3KebuAnqy0F639f8eQY2uI+0dGoY0RJlKpLqjHTZ+kZ1TLq/Q8XZmiE68zlLHOllaq
	2tYg==
X-Gm-Message-State: AMke39m0rfJv4DrLrf8lwzYSlxQ3qDiQk0Tu2q9snl/w4CFT6KDZqZrHLD90XTtnbrRO1FriNnpCvF6K2Pyv2g==
X-Received: by 10.28.172.68 with SMTP id v65mr7469660wme.49.1487534349218;
	Sun, 19 Feb 2017 11:59:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 19 Feb 2017 11:59:08 -0800 (PST)
In-Reply-To: <1487181811-31445-3-git-send-email-paul.gortmaker@windriver.com>
References: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
	<1487181811-31445-3-git-send-email-paul.gortmaker@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 Feb 2017 20:59:08 +0100
Message-ID: <CA+chaQfUYBZUrPMgTqGy_8N-pbPJqJ3nN=pEG3aqMQBvH6axWA@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/3] remove blacklist entries against blacklisted gstreamer
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
X-List-Received-Date: Sun, 19 Feb 2017 19:59:10 -0000
Content-Type: text/plain; charset=UTF-8

florence, gthumb, farsight2 are failing:

http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132936.html

On Wed, Feb 15, 2017 at 7:03 PM, Paul Gortmaker <
paul.gortmaker@windriver.com> wrote:

> With gstreamer now fixed, we can remove all the blacklist entries
> against it.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb                        |
> 2 --
>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb                       |
> 3 ---
>  meta-gnome/recipes-support/florence/florence_0.5.4.bb                  |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb       |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb            |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb            |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb       |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb      |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb         |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb      |
> 2 --
>  .../recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb      |
> 2 --
>  meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb   |
> 2 --
>  meta-oe/recipes-support/farsight/farsight2_0.0.22.bb                   |
> 1 -
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb                     |
> 2 --
>  15 files changed, 30 deletions(-)
>
> diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> index 682c6fa26f6b..4be29ac67934 100644
> --- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> +++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
> @@ -21,6 +21,4 @@ do_configure_prepend() {
>      sed -i -e "s: help : :g" ${S}/Makefile.am
>  }
>
> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer"
> -
>  PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop"
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> index 94a14c818f10..4a1313c544c2 100644
> --- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
> @@ -30,6 +30,3 @@ FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
>                  ${libdir}/${BPN}/extensions/*.extension"
>  FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
>  FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
> -
> -
> -PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> index d7e5b095944d..dfdb6bdb8c4d 100644
> --- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> +++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> @@ -18,5 +18,3 @@ SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb92
> 2d2988b6082e33d9acc46dd7bfe5
>  inherit gettext autotools gconf pkgconfig
>
>  EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi
> --without-panelapplet --without-xrecord"
> -
> -PNBLACKLIST[florence] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mp3_0.10.31.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
> index e7c7c21dac9f..1e2cd2a4ab79 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mp3_0.10.31.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mp3_0.10.31.bb
> @@ -12,5 +12,3 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>
>  SRC_URI[md5sum] = "adf0390f3416bb72f91c358528be0c38"
>  SRC_URI[sha256sum] = "dae0d0559a4e159c0dd92b7e18de05
> 9a5783f8d038904c7de4ca6393f7d55c7d"
> -
> -PNBLACKLIST[gst-fluendo-mp3] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mpegdemux_0.10.85.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
> index 9787dbae724a..7bba41a34165 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mpegdemux_0.10.85.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mpegdemux_0.10.85.bb
> @@ -10,5 +10,3 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>
>  SRC_URI[md5sum] = "7c4fb993f80b9ae631b11897733f0970"
>  SRC_URI[sha256sum] = "df04c91cc8e5d9a892c2492ed98997
> 4b4547beaa2a3647649e85113317897424"
> -
> -PNBLACKLIST[gst-fluendo-mpegdemux] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> meta-base_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> meta-base_0.10.bb
> index afd6a58a8c93..039abe14fa0f 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> meta-base_0.10.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> meta-base_0.10.bb
> @@ -71,5 +71,3 @@ RDEPENDS_gst-meta-video = "\
>
>  RRECOMMENDS_gst-meta-video = "\
>      gst-meta-audio"
> -
> -PNBLACKLIST[gst-meta-base] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> openmax_0.10.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> openmax_0.10.1.bb
> index 8b2bf752412f..2e015795695f 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> openmax_0.10.1.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> openmax_0.10.1.bb
> @@ -33,5 +33,3 @@ FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug/"
>
>  SRC_URI[md5sum] = "4d0370bfe99dea20918c84347abadb4e"
>  SRC_URI[sha256sum] = "9074d5a0591995133d19cfb15144f1
> 9664f902c1623f996595695cf2c2070e1f"
> -
> -PNBLACKLIST[gst-openmax] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-bad_0.10.23.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
> index 8abd63a142cc..38fccc8d01bb 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-bad_0.10.23.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-bad_0.10.23.bb
> @@ -59,5 +59,3 @@ do_configure_prepend() {
>
>  SRC_URI[md5sum] = "fcb09798114461955260e4d940db5987"
>  SRC_URI[sha256sum] = "0eae7d1a1357ae8377fded6a1b42e6
> 63887beabe0e6cc336e2ef9ada42e11491"
> -
> -PNBLACKLIST[gst-plugins-bad] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-base_0.10.36.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
> index 02252bfb62d8..eefd993e1655 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-base_0.10.36.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-base_0.10.36.bb
> @@ -42,5 +42,3 @@ CACHED_CONFIGUREVARS_append_x86 = "
> ac_cv_header_emmintrin_h=no ac_cv_header_xmm
>
>  # /usr/bin/gst-visualise-0.10 is a perl script.
>  RDEPENDS_${PN}-apps += "perl"
> -
> -PNBLACKLIST[gst-plugins-base] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-gl_0.10.3.bb
> index 62a6754464cf..6859f338e703 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-gl_0.10.3.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-gl_0.10.3.bb
> @@ -23,5 +23,3 @@ EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
>  ALLOW_EMPTY_${PN} = "1"
>  ALLOW_EMPTY_${PN}-apps = "1"
>  ALLOW_EMPTY_${PN}-glib = "1"
> -
> -PNBLACKLIST[gst-plugins-gl] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-good_0.10.31.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
> index cabbca548ba0..7e4a5256785f 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-good_0.10.31.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-good_0.10.31.bb
> @@ -46,5 +46,3 @@ SRC_URI[sha256sum] = "7e27840e40a7932ef2dc032d7201f9
> f41afcaf0b437daf5d1d44dc96d9
>
>  FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/
> gstreamer-0.10.schemas"
>  FILES_${PN}-equalizer += "${datadir}/gstreamer-0.10/presets/*.prs"
> -
> -PNBLACKLIST[gst-plugins-good] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-
> multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
> index d8a8fd5bcf82..199b47d76242 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-ugly_0.10.19.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-ugly_0.10.19.bb
> @@ -33,5 +33,3 @@ SRC_URI += "file://0001-cdio-compensate-
> for-libcdio-s-recent-cd-text-api-cha.pat
>              file://0002-Fix-opencore-include-paths.patch"
>
>  FILES_${PN}-amrnb += "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.prs"
> -
> -PNBLACKLIST[gst-plugins-ugly] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> rtsp_0.10.8.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> rtsp_0.10.8.bb
> index b31a7ee18fc3..b78bcaf5ac99 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
> @@ -16,5 +16,3 @@ EXTRA_OECONF = "--disable-introspection"
>  inherit autotools pythonnative gettext
>
>  FILES_${PN}-dev += "${datadir}/vala/vapi/"
> -
> -PNBLACKLIST[gst-rtsp] ?= "Depends on blacklisted gstreamer"
> diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> index a9ed0919a6bb..8c783a9f4770 100644
> --- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> +++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> @@ -29,6 +29,5 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
>  SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
>  SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606a
> abc27961eb4192f8729987a27dae6b3974"
>
> -PNBLACKLIST[farsight2] ?= "Depends on blacklisted gstreamer"
>  PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice"
>  PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base"
> diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> index c4d4cd2b8ecb..3c2a054ef057 100644
> --- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> +++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> @@ -40,5 +40,3 @@ do_compile_append() {
>
>  SRC_URI[md5sum] = "e5b9f799a57cb939ea2658ec35253ab9"
>  SRC_URI[sha256sum] = "d8dd260c486a470a6052a532392087
> 8a084e44a19df09b15728b85c9e3d6edf0"
> -
> -PNBLACKLIST[libnice] ?= "Depends on blacklisted gstreamer"
> --
> 2.7.4
>
>

