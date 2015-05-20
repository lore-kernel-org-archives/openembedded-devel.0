Return-Path: <k4230r6@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id D506B601E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 07:42:49 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so61391637lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OUfNRlOprcl5FuSkX95Zw7ateRpl4jharBnJTlh5bWY=;
	b=rxmvebLzdSu86bbiUiq2QT7LLDNossDB9ZytYOpy3GyOeRTOH8L5aEI4gzSUc2oi4/
	ISqRH4xMCywAcpqX/kU9jLJNo1VtDiUFOdI5A13uY2OFglhjL224SVkA+tZbseJS7ak2
	uWGbTqoAlRa6Z1vFpVVbFTU4iqo2YHGGTRhRV/sC1GZuFoQNYzNzsGhCoFG8HWTm4u5N
	KT7jrJIpMKvIRgYvFtVLKiXBCTtq1RUYx34OjvrMRESDU/RJGm9p/KLN4qgTG0fKr4Of
	vfuBrdQyW64oidRoY0whrDoQjvIaghe2VOWbQ4feb/VS1qMndMoZDo1ARJql0NdVGBpm
	wHiA==
MIME-Version: 1.0
X-Received: by 10.152.121.6 with SMTP id lg6mr25053470lab.42.1432107768754;
	Wed, 20 May 2015 00:42:48 -0700 (PDT)
Received: by 10.25.82.65 with HTTP; Wed, 20 May 2015 00:42:48 -0700 (PDT)
In-Reply-To: <1432101873-25954-1-git-send-email-raj.khem@gmail.com>
References: <1432101873-25954-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 20 May 2015 09:42:48 +0200
Message-ID: <CAALGJZYzk+KDqMHZdcxfkDV0JsN9Qo=deQ-Qrd28AM0yBTR9DQ@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lirc: Make X support to be a packageconfig
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
X-List-Received-Date: Wed, 20 May 2015 07:42:50 -0000
Content-Type: text/plain; charset=UTF-8

2015-05-20 8:04 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> When we dont have x11 in distro features it fails to build
> since libx11 dependency is not satisfied
>
> Change-Id: I6774a83f965551a41afe12b1304e44e73fc789c0
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/lirc/lirc.inc      | 2 +-
>  meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
> index 77b6c28..429bc45 100644
> --- a/meta-oe/recipes-connectivity/lirc/lirc.inc
> +++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
> @@ -6,7 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
>  HOMEPAGE = "http://www.lirc.org"
>  SECTION = "console/network"
>  LICENSE = "GPLv2"
> -DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 libx11"
> +DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
What's happening if X11 is available, will this trigger a QA issue
because lirc links against x11 but x11 is not in DEPENDS Variable?

>  PRIORITY = "optional"
>
>  SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> index c3e61c4..7d93757 100644
> --- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> +++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> @@ -19,9 +19,11 @@ SYSTEMD_AUTO_ENABLE_lirc = "enable"
>
>  inherit autotools pkgconfig systemd pythonnative
>
> -PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
> +PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
> +PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
> +PACKAGECONFIG_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
>
>  #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
>  do_install_append() {
> --
> 2.1.4
regards,
Christian

