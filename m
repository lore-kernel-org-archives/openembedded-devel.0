Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2D3C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:48:22 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.47372.1673192894192119453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PEGjy5ZT;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id r11so5186542oie.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaj2RSYyJcwnMKeEUQmmuuOg0mmO1ATyZbvgX7IANII=;
        b=PEGjy5ZTqc/QYi6btQ7Ah1DumjnQjOJ91UK6XLCT2kXu4okuQaXOuK7D/pXK4p3ORP
         S3/Lg4oeOKtFRzopb+JFDlpC4kq5TayfdvgFYmXD82qcP1zsdPnliCbunLciM81SG3aB
         zu9FGOXVQbCW5MQpi6QhQ5o8lVYZ9CuMgOrwU6TDk0xMOfKfu7IbeExl5jabCtlJU2u7
         LDFFbkYVs5pBsFCNEd2hmGf/y1gBJ+sUoLPAx3g0W7wneq0oOruf5LsfGcR9oSq4p+Oa
         ZoOPEl495C/TFdZnIsU1jTdY1jw+fcN5XyeqZJ1qBCoE0qzxeRm+z88Tq/tXkFovQ7YH
         +mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaj2RSYyJcwnMKeEUQmmuuOg0mmO1ATyZbvgX7IANII=;
        b=Rz522uFCjvyFoXbJjhG+rv6kf2uoWCnomtuJI/98x3uysYP412mFSAQm/1cPaF9iZf
         r7ygpj12AbXUdVxsbNq59E0KyOkUDn+jDgIjvX8Ej0PmLgq79p0n4IDPXwgziw+WRVZ6
         dz7Ls5Ao7Xp+0ITwUrwLFwJ5oDl5gMBKsYMBZkID+OzO75igOkdmXUOqGeRjZnz9y5Ah
         +D7BCLyurIolqkWZ1J6HQ5ayeSxXsX9lNDu6L5b+WpPo/5vmLQN3eG18+ZEc8uj+pDSW
         K4wZJyUqMfXK4S3ZYzPrsdYVw1T7rDC7E4KffzaUE56Auk40GAHLJD+y/ycb5jbA8jr1
         i59w==
X-Gm-Message-State: AFqh2kpMeq2sLx1Fj/VkeGPViuUHJbnZsn6ajQQescIHUU5SRvPB1WQ/
	ZV5QOJJTkE3FuDyvg+G3spipSMfdDT4ZVyDhaGQ=
X-Google-Smtp-Source: AMrXdXv1bqhPryRj7I7dAB9HUPkh5viRcq5sbQ+Nud1jZtUrqQG0jyZiwGJ9rH4M1UMYHRXCntSZpNwzLwzOyyFZFt8=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr3592904oia.262.1673192893378; Sun, 08
 Jan 2023 07:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20230108130743.983639-1-f_l_k@t-online.de> <20230108130743.983639-5-f_l_k@t-online.de>
In-Reply-To: <20230108130743.983639-5-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jan 2023 07:47:47 -0800
Message-ID: <CAMKF1srmoqxmdWFs6Ga22kyFLS_Az6DWi+U=2Nj30mpF3xBfqg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 5/5] gnome-chess: import recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100474

fails to build on qemuarm/glibc/clang

valac -C --vapidir
/mnt/jenkins/workspace/Yocto-world-arm/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/gnome-chess/43.1-r0/git/src
--pkg config --pkg posix --pkg pangocairo --pkg librsvg-2.0 --pkg
libadwaita-1 --pkg gtk4 --pkg gmodule-2.0 --target-glib 2.44.0 --pkg
glib-2.0 --color=always --directory src/gnome-chess.p --basedir
../git/src --gresources=../git/data/chess.gresource.xml
--target-glib=2.44.0 --gresources ../git/data/chess.gresource.xml
../git/src/chess-scene.vala ../git/src/chess-view.vala
../git/src/chess-window.vala ../git/src/gnome-chess.vala
../git/src/new-game-window.vala ../git/src/preferences-window.vala
../git/src/preferences.vala
../git/src/promotion-type-selector-dialog.vala lib/libchess.vapi
engine/libengine.vapi
| error: Package `librsvg-2.0' not found in specified Vala API
directories or GObject-Introspection GIR directories

On Sun, Jan 8, 2023 at 5:08 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-chess/gnome-chess_43.1.bb           | 35 +++++++++++++++++++
>  .../gnome-chess/gnuchess_6.2.9.bb             | 19 ++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
>  create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
> new file mode 100644
> index 000000000..643e6befe
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "GNOME Chess is a 2D chess game, where games can be played between a combination of human and computer players."
> +HOMEPAGE = "https://wiki.gnome.org/Apps/Chess"
> +LICENSE = "GPL-3.0-only"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
> +
> +GTKIC_VERSION = "4"
> +
> +DEPENDS = " \
> +    appstream-glib-native \
> +    cairo \
> +    desktop-file-utils-native \
> +    glib-2.0 \
> +    glib-2.0 \
> +    gtk4 \
> +    libadwaita \
> +    librsvg \
> +    pango \
> +"
> +
> +RRECOMMENDS:${PN}  = "gnuchess"
> +
> +SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;nobranch=1"
> +
> +inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
> +
> +GIR_MESON_OPTION = ""
> +
> +S = "${WORKDIR}/git"
> +PV = "43.1"
> +SRCREV = "95c7fb91daf36014fc1c2a7ec20b7400a21cd316"
> +
> +FILES:${PN} += "${datadir}"
> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> new file mode 100644
> index 000000000..8ca40229e
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "GNU Chess is a chess-playing program."
> +HOMEPAGE = "http://www.gnu.org/software/chess/"
> +LICENSE = "GPL-3.0-only"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9d2e6a21f1b6fb9f5"
> +
> +S = "${WORKDIR}/chess-${PV}"
> +
> +inherit autotools gettext
> +
> +do_configure:prepend() {
> +    touch ${S}/ABOUT-NLS
> +    touch ${S}/man/gnuchess.1
> +}
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100444): https://lists.openembedded.org/g/openembedded-devel/message/100444
> Mute This Topic: https://lists.openembedded.org/mt/96130659/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

