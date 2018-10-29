Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 68E7079C5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:06:27 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id p23so9294374otf.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TMCiKgg2OioqeIFJZx3M9tW/pG41jLwChJn0NgQ6e9k=;
	b=g0Fs+GhHr5AvmS7nU7CDkytcdCWExNawZIRAGROum/ZhxlBviclckeFEITLFhrhavl
	PCsBRrNXsIrpk4ytK4rcBB92yIAepgWKqAsrZS/JpKhHPjsGUt7yMZ9zigdImJ66kwC3
	MMZgpyrFjGoFw16UwHNg0I56xIUeq6OtnFTJBFAQp4+ySnMoIUPiZTZv0jQb2YlIWXgy
	vRjPQVeHCvBZKYzsnxDjFuZx46pfhGXXQuHyTqRN/xmkRFRJ4Y/EGVCkpwriL2Ue+R8y
	xKiQpYv6rjjQ0GlIyzbql619W85lE3pBO4QePKkcOaBa5+sfXjThQFrqIsrkXER9k9/+
	ge3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TMCiKgg2OioqeIFJZx3M9tW/pG41jLwChJn0NgQ6e9k=;
	b=hm7rWwwY+K1yLmNVUnisBU2nnqD/86nCsr5NLg5MnO/ZlJbrNEusDF1R2BinBo+6RH
	VXiaQyETo9OvYBjfTRnCWX2fX4eoy3BaJhjwmSyZuVI3Fiu6JMtgygAB8gyBx+GgBO05
	c8NFz3NTqpBPO8+/3p//ziEsx/sI0yFC4T/FrCMM0c8JAez6yqIZlbZcsOBGPuwRMC1s
	XFp5FH37FRbg4wOGhLw+OssoJXe4pfJmfsNT6G/VTabFwy+VpAr1mf0HfGuMnmmrUvYn
	6EtWiA4LWe3a5r2Xi6gMZYfAKAFxxRAgLguBJ/A7HLDWOB0FtMTzwyJIo2w0JuJTUP+K
	dy7A==
X-Gm-Message-State: AGRZ1gKxHPIVLZ5LL8qJJz19CkkunKCo8jt87OAGrk9lYsDqK6K+2q7U
	mgO9f2tOjnMXX2hudRlQ1FsgRaFdiJIJ7GOiQlFIaD3w
X-Google-Smtp-Source: AJdET5eYNJBDHK9egZqwaqrwwHSpwfiODIiFf4p103M72ZUf/wx0rOj7gCo/Z6/RJPha1F5gObsvvD2sA4i7r20+5i8=
X-Received: by 2002:a9d:3c8d:: with SMTP id z13mr2319204otc.109.1540854388385; 
	Mon, 29 Oct 2018 16:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<d84e5b262a493ae9fe761ee9e22fec8f6d2dc59c.1540830650.git.brendank310@gmail.com>
In-Reply-To: <d84e5b262a493ae9fe761ee9e22fec8f6d2dc59c.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Oct 2018 00:06:15 +0100
Message-ID: <CALbNGRT5Ao_aXNgzjuzm7S7UrYdrYL3TbP40mVWmr+JTjKtStA@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 15/16] gnome-shell-extensions: add recipe for gnome-shell-extensions
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
X-List-Received-Date: Mon, 29 Oct 2018 23:06:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:42 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../gnome3/gnome-shell-extensions_git.bb      | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
> new file mode 100644
> index 000000000..8c02195d9
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gnome-shell-extensions_git.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "GNOME Shell Extensions"
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +            glib-2.0 \
> +            gsettings-desktop-schemas \
> +            gjs \
> +            gnome-desktop3 \
> +            gdm \
> +            mutter \
> +            wayland \
> +            wayland-protocols \
> +            evolution-data-server \
> +            libcroco \
> +            polkit \
> +            gnome-bluetooth \
> +            gstreamer \
> +            keybinder \
> +            gnome-settings-daemon \
> +            ibus \
> +            librsvg \
> +            python3 \
> +            sassc-native \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
> +
> +SRC_URI = " \
> +           git://gitlab.gnome.org/GNOME/gnome-shell-extensions.git;protocol=http;branch=master;tag=3.30.1 \
> +          "
> +
> +RDEPENDS_gnome-shell = " \
> +                         gnome-shell \
> +                        "
^ I think it should be RDEPENDS_gnome-shell-extensions
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMESON += " -Dextension_set=all "
> +
> +FILES_${PN} += "${datadir}"
^ Put this at the end of the recipe please
> +
> +inherit pkgconfig meson gobject-introspection gettext
> --
> 2.17.1
>

