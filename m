Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75801C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 07:00:14 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.4494.1645081213441251914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WgwXQljT;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id b22so3869779qkk.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vv+em0ZsaHHwGrvQT84xBeQdrljDUrIrO1V/TH9Qc3A=;
        b=WgwXQljTiiIjombUJH8W838/xDzznICu5YA0MmIlLC0JJppOh4ILqGVnxPmVjeKgcd
         TI7Ef9zzVEzrfVIqiniY4rYHeEj27u+G04cEebVaW4K0YtZJk9lY3+ov7dOR+sAREau5
         j1q+2bPQx5TA8037hMFfHwGw2yl+t4pMJjgUs3d6N2g3WWk+QZdD6DV2iD+F+YM7nKut
         ni0Le7ndqRNsulxQqM1UAP790i7eMjxnySTChIcdl61+E0EhgEUjwcNpOWYvumce3MFn
         Q3UTLoC2dUKyQWqdyGfIHvsEYHYe9UTUxI7dA+5hOrCFDLeH6S75vynuvVbkpGuSz3uc
         bVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vv+em0ZsaHHwGrvQT84xBeQdrljDUrIrO1V/TH9Qc3A=;
        b=ik0aY826o7BLSAemlmOyvVWeg/nXntXB4LOVvvPLi54Sva9sRO+xme4+3mmhSKtb+P
         d4Dr77aUCIZqcKgXSFysBFxWv/Ivllqj2P0vZR130o0zhICuDoSKbRKrTUMJBmXuYPj+
         80brq2X68zY6WnyFkHDV2EaNCVPUmrBkrE8FvPmzUkWpLJX85Bd0Mw0zR4kQOKPJbnqs
         ojh96qGJDuWA8/Q9ENzPXhCoKOUriU9fPKTFBbu5w8fszDRacWU0yobEA/w5lFbtL0Kj
         yik85gJH/xT4TnRnbPX+Z1jrHOCvK2gQB0rW0Ss0Po2gckKeQkFv4YOflWtHgs7FUiGR
         6NeA==
X-Gm-Message-State: AOAM5312L0UpLF1M39bQgwVV4K4pecKOnbI4Kq5Cl2ZrmnYxSw2haZ3w
	qzKK1v/zx57474t6JJ2Y3BEHhvlq00YhgbJiA/Y=
X-Google-Smtp-Source: 
 ABdhPJyM7I1dEyZ7QSMWz7WmEy2ZuTz8wo7x/UHFQKmsAoVAhZpu4ciUc08IgG6bZ3dElFDZVeFJkS6vU28Tz7nn8yc=
X-Received: by 2002:a37:2d85:0:b0:60d:d69d:9f28 with SMTP id
 t127-20020a372d85000000b0060dd69d9f28mr735431qkh.227.1645081212451; Wed, 16
 Feb 2022 23:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20220216165722.25908-1-f_l_k@t-online.de>
In-Reply-To: <20220216165722.25908-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2022 22:59:46 -0800
Message-ID: 
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 07:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95352

seeing configure failure
https://errors.yoctoproject.org/Errors/Details/625735/

On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
>  .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
>  create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> new file mode 100644
> index 000000000..ac83de486
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> @@ -0,0 +1,15 @@
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 16 Feb 2022 10:38:04 +0100
> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
> +
> +--- a/meson.build      2022-02-16 10:38:04.170081321 +0100
> ++++ b/meson.build      2022-02-16 10:38:28.257864179 +0100
> +@@ -44,7 +44,7 @@
> + libpwquality = dependency('pwquality')
> + posix = valac.find_library('posix')
> + ssh_bin = find_program('ssh')
> +-ssh_keygen = find_program('ssh-keygen')
> ++ssh_keygen = find_program('ssh-keygen', native : false)
> + gpg_bin = find_program('gpg2', 'gpg', required: get_option('pgp-support'))
> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required: get_option('pgp-support'))
> +
> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> new file mode 100644
> index 000000000..ec1328598
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Seahorse is a graphical interface for managing and using encryption keys."
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +DEPENDS = " \
> +    avahi \
> +    gcr \
> +    glib-2.0 \
> +    gnupg \
> +    gpgme \
> +    gtk+3 \
> +    libhandy \
> +    libpwquality \
> +    libsecret \
> +    libsoup-2.4 \
> +    openldap \
> +"
> +
> +inherit gnomebase itstool vala
> +
> +SRC_URI:append = " file://meson-build-dont-look-for-native-ssh-keygen.patch"
> +SRC_URI[archive.sha256sum] = "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
> +
> +FILES:${PN} += "${datadir}"
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95340): https://lists.openembedded.org/g/openembedded-devel/message/95340
> Mute This Topic: https://lists.openembedded.org/mt/89189799/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

