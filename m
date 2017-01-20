Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 74D10719A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:52:07 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id i68so6377683uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=k+bAseu2VvJ22HwK3yvKTKrqVO4ZC6idzI4ILoAqbsw=;
	b=Wth2kgAfH/fg287dm1z7NnpCJMK3yaZWNSoYIqTArzONAOExdzQMea65zzxLkh9FUw
	lBhET/ksGQybDvaHr0Y7P0wEHWE7kkUcq0HnhI0rOATUTH3MdzQTMxEkIyHH06XGwH1w
	XCq+ZTTnCWlWdLsRvhUvyVDKM41UF8heRfkbES+x3wHlZeSz1aRwidPpkuxs6G2QXdhJ
	NuxAoMftQBPL3ermLMLO8/bGwPPs/FwsXrKpjkoDdUpAp+KVyrPKMja02PJhg+GxkzWI
	QF2bnu6EkMtGzh7jjoSz1abJsDA0CJq0hWverqbNLwxl2S+WCxC9EAlFoOZsvFg4uV3W
	lb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=k+bAseu2VvJ22HwK3yvKTKrqVO4ZC6idzI4ILoAqbsw=;
	b=efQGtbPzzL9GsYsaYlOc7RsiH2O6RPhLb4ZiIkQDoxacU9QWTVsXudRG8Ecwl9Ssfh
	n5yy5FjMurHTJ7tajNTHM9041FO8HWcffy7Gl9lykano8azTVG95qMduvbpp3oTJ4Dx5
	DylBwalZnTjLw8ahB0GkvDd9mrTbIaO0eVG5u1eggYWgzza9yGeA8NS5VmuQX6hlct4F
	tjmeG7Axw7myhU1MwpmChRfAmpxFilQCYhcTpR+oVmfLt+o9051LjKF8y/b5mLxtqW2F
	JWCzsC3PJxW/gCxRD0hyoUxxEAGrCxezv/J9xsxuXPG4uZFG7ztoYaJearDs785Ik7Uc
	baLQ==
X-Gm-Message-State: AIkVDXJbUVUQ5hiLoLpgNZYutKYgxDSCUK/7pfhlB7PcxC0d/QFVyudAS0C9lBc/2hqyvTY1wA0bVLJfGvvYXw==
X-Received: by 10.176.66.66 with SMTP id i60mr7035248uai.131.1484895127297;
	Thu, 19 Jan 2017 22:52:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 19 Jan 2017 22:51:36 -0800 (PST)
In-Reply-To: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
References: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2017 22:51:36 -0800
Message-ID: <CAMKF1spnG0SjdGk8rb8oR4G__vdj5xhdDdMTDw_bgtBkYr4W7A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Minor improvements: configure complains it can't find oe-device-extra.pri, and add libxkbcommon in the dependencies
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
X-List-Received-Date: Fri, 20 Jan 2017 06:52:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 5:07 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> During configure, it complains it can't find oe-device-extra.pri, but it doesn't result in any error. Fix it, though, just in case.
> In qtwayland, xkb should be optional, but it's not for the moment, so add it to the dependencies.

Does this also mean that now we need to enable x11 along with wayland
for distro features ?

>
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  recipes-qt/qt5/qtbase_git.bb    | 3 +++
>  recipes-qt/qt5/qtwayland_git.bb | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 6541973..258c7ed 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -173,6 +173,9 @@ do_configure() {
>          ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
>      fi
>
> +    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
> +    touch ${S}/mkspecs/oe-device-extra.pri
> +
>      ${S}/configure -v \
>          -opensource -confirm-license \
>          -sysroot ${STAGING_DIR_TARGET} \
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
> index e315924..51421d5 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = " \
>
>  #FIXME: xkb should be optional; we add it here to fix the build error without it
>  #       (https://bugreports.qt.io/browse/QTBUG-54851)
> +DEPENDS += "libxkbcommon"
>  PACKAGECONFIG ?= " \
>      compositor-api \
>      wayland-egl \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

