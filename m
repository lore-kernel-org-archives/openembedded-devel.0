Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6CB379D61
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 19:22:39 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id v5-v6so2576512ywa.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 11:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jhbBF+LlcA1PlbeKn/jnqMjDAoFNj6jPbSHrgyByAtM=;
	b=Ad/dMiletV4NgahRTRAh+29MlyQ/C3+r0e9LoYtugzNyesFFdHRl4agrMbEWIQtRqy
	ttfofkVHHSouqaGCdOfuXi1t1TK1+og8XhoONHujnKC0W0kiw3GM14hiyJJuzzACrSNk
	xeYwMSl4PUpjsN876Atk8dQmJBZ2dzK1luK3oK++BaqN3s2ZJ3b4C9cooMH5l9NkipC0
	FnH5rLiMwfx8RulB7CXJEOoQ5xvSOtDE7T2KSZAYHk55hyOp+QL4d/JNpeD/My8c4kwM
	h1UKFz+qPAhPXRN4CINJnWe4p8WPLtDa5eoSHy32xILQ+59h93tnNWVjStqfsOavregA
	K22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jhbBF+LlcA1PlbeKn/jnqMjDAoFNj6jPbSHrgyByAtM=;
	b=GhYmUR8vm4PxUOxbPmPSHxT2in/is7KKYfmAAxST8G3ur99VB5GLJ0PjXxCrQWCGyL
	tFwgzp2PNP/u5uNlNtdQgdlRYt4R68rthHCVbkMTbbRAwrf5yd6zUERNKsJtsRoLEGMX
	FJ1bWgJXAjebGbXqanQfw2jR3hlB8JZhp9OU+J8B7IscGwFlOo/8hPycLYzZEPHXPz5L
	tMvhtV00Mxto+TMWxbE9qgtYdhF57ixFZ+afZWWh8qUccyIftpm9RbiHp8c8HYea1diK
	B2DOIE+3x5WElrYFx6WDOY1/qZbV417lfBRzgdeCxlQTE3bVeqkFCoy9l216whBK4U/k
	0p5Q==
X-Gm-Message-State: AGRZ1gLUGVCfJ9Fiv+FhA5MmUZSzvh53LnYWXGlqHe+fY6AKvsC3fyGA
	ZucbMTVpTbsL3w/ETJID17FFft77+EIEUEHbVdQ=
X-Google-Smtp-Source: AJdET5dySIwFCI+cwgEDFwiTYITIG7hH6NYEYYT+6DJ8mHZ86naHldAniYS6E+/XwKujeQoRSkFSXQ/IYS9Andd5zcg=
X-Received: by 2002:a81:2245:: with SMTP id i66-v6mr1516708ywi.8.1541618560786;
	Wed, 07 Nov 2018 11:22:40 -0800 (PST)
MIME-Version: 1.0
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 7 Nov 2018 20:22:27 +0100
Message-ID: <CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 19:22:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> fixes
> ERROR: Required build target 'blueman' has no buildable providers.
> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> index 8eb99ed..06a11b7 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} += "adwaita-icon-theme"
>  RDEPENDS_${PN} += " \
>      python3-dbus \
>      packagegroup-tools-bluetooth \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)} \
>  "
> -
> -PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,thunar"
> +PACKAGECONGIG ??= ""
> +PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,"
>
>  FILES_${PN} += " \
>      ${datadir}/dbus-1 \
> --
> 2.7.4
>
This is not right: How shall this happen if meta-xfce is not in your
layers - I suggest you run a cleansstate after changing layer
configuration

Andreas

