Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B63B360167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 01:08:37 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id em10so8924880wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 17:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NsiONUosCDY2pgtN6K9znA0Hh8RKcSh0EMwkzaQ/U2k=;
	b=cCUdmqrWQkGJZ9i/Ayvo028J9ep5x5OHH4WmJQh4EEffrPjMKWDQB+o4wrjJDbf65g
	pqqgJevIxD7tC/cdOIDj6RpKg+dzSUO2AA3BGrGrPtnKK1gV8Usq39Z7zbfgvvVlFRK9
	0zis8Ar8NYuMTkUi4xaJeCQiDna/dmsCZKvzMeisA9yM4Kd1fMo3AJX8lIeXV8IeG9T8
	w82VkjQUqR5EW0ThfdqDzBtxmagHU6WB7C8o9rQVxJXUlowhc8sLJJpE1Yb4M+yx+9FZ
	zX0JuYqxSYkTZXCXRnHQYlJD7gDOVZnpwlAzkjsodi4gM4l2YOCBNY8bVwvOfKW5dNGP
	cuQA==
MIME-Version: 1.0
X-Received: by 10.194.234.40 with SMTP id ub8mr13484970wjc.100.1423789718196; 
	Thu, 12 Feb 2015 17:08:38 -0800 (PST)
Received: by 10.194.85.225 with HTTP; Thu, 12 Feb 2015 17:08:38 -0800 (PST)
In-Reply-To: <1423788858-16687-1-git-send-email-gary@mlbassoc.com>
References: <1423788858-16687-1-git-send-email-gary@mlbassoc.com>
Date: Fri, 13 Feb 2015 02:08:38 +0100
Message-ID: <CA+chaQdfVy4bdE+-Yq7YakQ9pYnSkDLEGiqxAsVnkq7rP26KrA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v3] mplayer2: Remove blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 01:08:41 -0000
Content-Type: text/plain; charset=UTF-8

Does it have --enable-* options for the new PACKAGECONFIGs? If yes then it
should specify them as well (advantage at least in some projects is that
when it explicitly asking for foo and foo is unusable it will end with
fatal error instead of ignoring broken foo dependency.

On Fri, Feb 13, 2015 at 1:54 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> mplayer2 no longer needs to be blacklisted as OE-core has moved
> to libav_9.16.
>
> [v2-v3] Also update build dependencies to quash QA warnings, using
> PACKAGECONFIG for most optional features.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 7c04ff1..2de26b0 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -3,7 +3,7 @@ SECTION = "multimedia"
>  HOMEPAGE = "http://www.mplayerhq.hu/"
>  DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
>             libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
> -           libxv virtual/libx11 libass speex faad2"
> +           libxv virtual/libx11 libass speex faad2 libxscrnsaver"
>
>  RDEPENDS_${PN} = "mplayer-common"
>  PROVIDES = "mplayer"
> @@ -13,8 +13,6 @@ RCONFLICTS_${PN} = "mplayer"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>
> -PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
> -
>  SRC_URI = "git://repo.or.cz/mplayer.git \
>
>  file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
>  "
> @@ -109,9 +107,14 @@ EXTRA_OECONF = " \
>  EXTRA_OECONF_append_armv6 = " --enable-armv6"
>  EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
>
> +PACKAGECONFIG ??= "vorbis postproc"
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
>  PACKAGECONFIG[lame] = ",,lame"
> +PACKAGECONFIG[postproc] = ",--disable-libpostproc,libpostproc"
> +PACKAGECONFIG[vorbis] = ",--disable-libvorbis,libvorbis"
> +PACKAGECONFIG[portaudio] = ",--disable-portaudio,portaudio-v19"
> +PACKAGECONFIG[mpg123] = ",--disable-mpg123,mpg123"
>
>  FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O4 -ffast-math"
>  BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

