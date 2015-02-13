Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id C4626733DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:35:45 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so13588024wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 16:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3Cu+qRObBkLSwEnfQB/eoyAMHDgthGLUZZLZW5/Ue1g=;
	b=Q4W+REt/roxRnyKXeRTTB39G8GAEwLZuWpAQE7t/F7G51KiIBVGx2bkQ8NYyFIUKfd
	iDJ65NhzUgdAe3jlxT3gWqD0wvRyvTMo36UeVbYhQbUuEWBGUDdB2f2UQtqkKtkhyIiv
	2ITvoUUtSjgWFtbYuDahlUKI/NGkZ4+E8NIhNxG43OzrNo7/7sUCBNUpwiUMu4zxixQ/
	KmRsbOJvX5xvYCmC6/BfwaLhDug/+YH8h2Lt2hyWmn86hYElWik9gwr0IL4zqGvd9MXH
	1k/YHi/mmflZNKv/0JuIRCHDKmzFHuyz4dH9Nn7eOe8Z0y3ZozejoYwB/cRL+ciVLXYt
	djMA==
MIME-Version: 1.0
X-Received: by 10.194.2.240 with SMTP id 16mr13130230wjx.108.1423787745041;
	Thu, 12 Feb 2015 16:35:45 -0800 (PST)
Received: by 10.194.85.225 with HTTP; Thu, 12 Feb 2015 16:35:45 -0800 (PST)
In-Reply-To: <1423787491-16213-1-git-send-email-gary@mlbassoc.com>
References: <1423787491-16213-1-git-send-email-gary@mlbassoc.com>
Date: Fri, 13 Feb 2015 01:35:45 +0100
Message-ID: <CA+chaQc9YMyaa5j4aAt1hvxZwA02abX-idEv7n3uUQ-77-eU3g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-oe][PATCH v2] mplayer2: Remove blacklist
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
X-List-Received-Date: Fri, 13 Feb 2015 00:35:49 -0000
Content-Type: text/plain; charset=UTF-8

You need to explicitly disable mpg123 when not selected.

On Fri, Feb 13, 2015 at 1:31 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> mplayer2 no longer needs to be blacklisted as OE-core has moved
> to libav_9.16.
>
> [v2] Also update build dependencies to quash QA warnings.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 7c04ff1..d928243 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -3,7 +3,8 @@ SECTION = "multimedia"
>  HOMEPAGE = "http://www.mplayerhq.hu/"
>  DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
>             libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
> -           libxv virtual/libx11 libass speex faad2"
> +           libxv virtual/libx11 libass speex faad2 libpostproc libvorbis \
> +          libxscrnsaver portaudio-v19"
>
>  RDEPENDS_${PN} = "mplayer-common"
>  PROVIDES = "mplayer"
> @@ -13,8 +14,6 @@ RCONFLICTS_${PN} = "mplayer"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>
> -PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
> -
>  SRC_URI = "git://repo.or.cz/mplayer.git \
>
>  file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
>  "
> @@ -112,6 +111,7 @@ EXTRA_OECONF_append_armv7a = " --enable-armv6
> --enable-neon"
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
>  PACKAGECONFIG[lame] = ",,lame"
> +PACKAGECONFIG[mpg123] = ",,mpg123"
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

