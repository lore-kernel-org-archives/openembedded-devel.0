Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 811BD6C42C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:36:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s11so2950980wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gVAqnw5oXCNj1bKHp+Oiq0qpxus6RBcQimi+F7QruKc=;
	b=G5mwALRq13LxVTSE+yMAjoHBo/9L5ZxbLNYapHPK84JghEOejPTRdjnne7+Py1eyaO
	sY0/E5ezrnmjzdbKxHOcL3f7Ze0YCD5fz0r38despoYTxwO/5NrxEkMCFamxGQAaEL0X
	vgwigQxoBP8xXy4ukKfnhF/kburZfSFZPjxxve4Sp8jC89GSgJcerL1DowIkr1NIXNbn
	YP/dmwSXe8X8oqTmCXpjBi3QkBObMOAwmSSmqqLvGCpkLpIe4mMJZQ0iYLgDSpvJYaVy
	1Xn5ijZbQMR2YAjGu7Fla0k3U6SFsGlrhzjWGPQnCNE5f8OnRRs0FPvxzi4A1/LVb261
	sX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gVAqnw5oXCNj1bKHp+Oiq0qpxus6RBcQimi+F7QruKc=;
	b=Ryb/2A/eDXIDR/QJsvlbBLhMiSiSSP1PWVsPMELqI8tF6DhPFCbcYwD0GsSzvfG/ZE
	LfoFcX3NkPzl2BIUAOirpFm2bdCxuJsUKkD/gqSrl6/ADIpDkGmxTZ83Q3YGZrlGetl2
	/eFMuo9UNpaJVmXkRK9EybTpb2GJjonNXmRi37ATaIn/pzNLVfXym4pwWC/ndUQSN3EZ
	/UDGF4X+rdsJjCWnE0/sviLBjkzjLYfWVouGEj0ODqxbiI8PFCbxnbMnN3nEKFPCzUoL
	BSA7yddGyWeGbHVSapNNivKN03bEafZc3vKzSTXl2pkHiIlAMxPiXl6QjYE8Ajw5z5Wu
	oz/g==
X-Gm-Message-State: AGRZ1gK0uu+Aeno11kM7S0qwOGBTGN1B1I0zo0D0BRdunlXAiFT5nHQW
	lBUdeLYY8eiCQeYlndY/zf0JlhBnJiZahYF9FeI=
X-Google-Smtp-Source: AJdET5fIEetyOkQlyzUmMyqHL/dKgQtYVuUV1s68FzYWU++z0sySughSjiicwNSmMRCUvLPsE44ZbuZDUcjMLTzHxZY=
X-Received: by 2002:a1c:3489:: with SMTP id b131mr2168541wma.44.1542731782094; 
	Tue, 20 Nov 2018 08:36:22 -0800 (PST)
MIME-Version: 1.0
References: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
In-Reply-To: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Nov 2018 17:36:10 +0100
Message-ID: <CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
To: fabien.lahoudere@collabora.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] evince: Drop x11 requirement
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
X-List-Received-Date: Tue, 20 Nov 2018 16:36:21 -0000
Content-Type: text/plain; charset="UTF-8"

This was already removed once in:

commit 33c822a7c11df08f35dda18a44aae730f93c6130
Author: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Date:   Wed Sep 6 18:53:07 2017 +0200

    evince: Remove X dependency

    gnome-desktop is the only X dependency for evince.
    In order to build evince for Wayland based system without X support,
    gnome-desktop is added to DEPENDS only if x11 exists in DISTRO_FEATURES.
    So x11 is dropped from REQUIRED_DISTRO_FEATURES.

    Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

and then returned here:
commit 62376d673aa86b5f8ffb26c8a74046ee87ef4f66
Author: Armin Kuster <akuster808@gmail.com>
Date:   Wed Mar 7 08:08:57 2018 -0800

    evince: only include when x11 in DISTRO_FEATURES

    Signed-off-by: Armin Kuster <akuster808@gmail.com>

What's going on? But if everybody agrees on removing it, then you should
remove the distro_features_check inherit as well.

On Tue, Nov 20, 2018 at 5:24 PM Fabien Lahoudere <
fabien.lahoudere@collabora.com> wrote:

> evince works fine in a wayland only distribution.
> x11 requirement is not needed.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> ---
>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> index 8bf8a04..01f581a 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> @@ -6,8 +6,6 @@ DEPENDS = "gtk+3 libsecret
> ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-d
>
>  inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection
> distro_features_check systemd
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
>  SRC_URI =
> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive
> \
>             file://0001-help-remove-YELP-macro.patch \
>             file://0001-Add-format-attribute-to-_synctex_malloc.patch \
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

