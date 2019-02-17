Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7025A6C514
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 20:04:51 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id p48so17063647qtk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 12:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JyKETdpU1vzosVs19rKfvj1NnRGAvR3SojiirB/bXCM=;
	b=JhoumSBFmGj3u9ojmSV+YAmvsj8VWocNP3z8qfGRq/msCouHyB99irOw4Q6L8vRcEm
	Zac8lAUH6Jsf8K49LO2yFiOCQpeElkhy8vy0Ai2pxvpTg+9ac4PeiCoWluulchNLOLKZ
	HoDo+mxjXO681/acTaa9P2X47RGiZJnHdPNuwPWiLU0+UdhVnj/cAtONYNazU0R08Zcp
	D9+tRb0SNwavVTVP65amnMOFoUozJ3peddRPhF34UCic6c1ih+rFTmwMcwK1HHarKmdl
	oosomT6vmyrd9Lf2+tLDS+Hkz3UTkS3Sg6POiYmbcW3tgDX8D74zv9DCvRstCh8UKATi
	YLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JyKETdpU1vzosVs19rKfvj1NnRGAvR3SojiirB/bXCM=;
	b=ZQRRfyM/Fc2p8woJnoFlgimaMPVc9OYOld8oPPYKC2cWZTlDlS+L48b/T0W1Y+R7w5
	821PLaBtk3563hzmIbtfOQZb9j+WBCoXo7H7dpkF2flD0Zs3rrvdK1qzMGeJz745NtPo
	VdNziQb/xFhGeQtH2eiAMIfYM+xs/55S/GeTfEUcUrgPNb7WvyOVZWt529moUCJqHdtN
	UDlW4bsVIZydHQDUfqkB//wur2J8n3h0LZ986BN2V6vLRpUvXTPDjOOtg3yvLs5YoCr2
	O7vgNGOYF+jwyVX8ef50QQWW4XzM/QqMiFByWnVYiM+4iJMWu8K+u7p5qIfeKVgduaj4
	yOJA==
X-Gm-Message-State: AHQUAua2Y5qYg+hd0Ww/qrErQhDTJ01BxK81OIiJmjoNCXqRnmvtdDfL
	YCOpJkH3c1PkEjj3a+Y14uYYYcvEGRX5K/GdSQg=
X-Google-Smtp-Source: AHgI3IaGYKUg0QYXfIvH45Vb/CA3nHi+/qPObZKiCNvbQNAUUZFOTJAPyre06kyOhOhTl4yY8O2gwqkQlvg9WSmamaU=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr15260989qva.50.1550433892187; 
	Sun, 17 Feb 2019 12:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20190215014113.52315-1-wak@google.com>
In-Reply-To: <20190215014113.52315-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Feb 2019 12:04:26 -0800
Message-ID: <CAMKF1sqT-TRTXdzPA=-abmMrBE0X2PrW9J9pECNNckm7C0Y7sQ@mail.gmail.com>
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dbus-broker: 16 -> 17
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
X-List-Received-Date: Sun, 17 Feb 2019 20:04:51 -0000
Content-Type: text/plain; charset="UTF-8"

Fails with musl/qemux86

| [45/177] /home/jenkins/oe/world/yoe/build/tmpfs/work/i586-yoe-linux-musl/dbus-broker/17-r0/recipe-sysroot-native/usr/bin/meson
--internal symbolextractor subprojects/c-utf8/src/libcutf8.so.0
'subprojects/c-utf8/src/8c544e0@@cutf8@sha/libcutf8.so.0.symbols'
--cross-host=linux-musl
| ninja: build stopped: subcommand failed.


On Thu, Feb 14, 2019 at 5:41 PM William A. Kennington III via
Openembedded-devel <openembedded-devel@lists.openembedded.org> wrote:
>
> This change cleans up a number of things about the build
>  - Upstream no longer depends on glib
>  - We dont ever runtime depend on reference dbus
>  - Docs are disabled by default so we don't need to specify the option
>  - There is no native tooling so we shouldn't need a native bbclass
>  - No longer depend on gitsm since upstream provides release tarballs
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  .../{dbus-broker_git.bb => dbus-broker_17.bb}   | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>  rename meta-oe/recipes-core/dbus/{dbus-broker_git.bb => dbus-broker_17.bb} (60%)
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
> similarity index 60%
> rename from meta-oe/recipes-core/dbus/dbus-broker_git.bb
> rename to meta-oe/recipes-core/dbus/dbus-broker_17.bb
> index ac0f325a4..e940bb656 100644
> --- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
> @@ -6,18 +6,12 @@ SECTION = "base"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
>
> -DEPENDS = "dbus glib-2.0 expat"
> -
> -PV = "16+git${SRCPV}"
> -SRCREV = "fc874afa0992d0c75ec25acb43d344679f0ee7d2"
> -
> -SRC_URI = "gitsm://github.com/bus1/dbus-broker;protocol=git"
> -
> -S = "${WORKDIR}/git"
> +SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "4ec7491745a88ec5112644b0e2b9a0abe9107c85d7650be8988d88efb52da84b"
>
>  inherit meson pkgconfig systemd distro_features_check
>
> -EXTRA_OEMESON += "-Ddocs=false"
> +DEPENDS = "expat systemd"
>
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> @@ -25,8 +19,3 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>
>  FILES_${PN} += "${systemd_system_unitdir}"
>  FILES_${PN} += "${systemd_user_unitdir}"
> -
> -RDEPENDS_${PN} = "dbus"
> -
> -BBCLASSEXTEND = "native"
> -
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

