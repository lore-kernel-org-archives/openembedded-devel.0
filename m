Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5137BC54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:47:12 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.47355.1673192831355607135
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KzbYWZ93;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-14ffd3c5b15so6472503fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gfHU6WvKmLpAyTso9AU0WjyjarFBs1Ts7Vs6bWVzyU=;
        b=KzbYWZ93BTIxuSHsvSWo2qnbJZMML1RzIbIz8Ha2Y+gqcxWkgYpgE9HUGJahO9YqnW
         gVHSiXI6L/dp9tqNXVpdOvei0QYY3WqudxVdCAeSYAj6SF0f9VvQnaY/w7USAttvdA07
         xPGViqW9uuCjSeT8XjAooGBVeQtrBc9K6mkmJfLyELMnbAxVppFYRATjxDGHTzTl4lSK
         DlbnacN3Y8XeWihNUhkA3aB4BsjWi0XWgGUX//eJtdFTrZCGB3XdLAWhtFfvn96pkAxP
         N3d4dw2PvqKWFB5lzDdt3/rbvZCdgm5BB1IWOlYPQ0GQK7yPLU2FYrCSK57pf0QGh6V0
         IdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gfHU6WvKmLpAyTso9AU0WjyjarFBs1Ts7Vs6bWVzyU=;
        b=kXbQBIGK5l/EBrWOrCA6CVNWwUKesCcy5LCzHeNa5OcViy6nceznPmzM7X3NTMOTkm
         O/tfmKRGfB/0+P05YUzq0MIo5wlAjSnrsuPvmc2s3hw14Pz5iYsF4NCnnCE0kVIfZTEH
         xyD/FKe5q0jtCYpIjHPxY/bTnV5VK+OOrYiZDaTia2Nx+0o9BMn4t7KxCrJ4CV6gGPTw
         Tq9n0nhbymQFtrJ0li9VwJBElJD6u/2dQe9wlDb3WZ16YlhURALpp+PiyFB1Y+FfJiW2
         z34CS5iRH1xErorRnhEnU/8LXz52wjUZB59HhIVIpGBln9oOpCkOFCTsGSpogYmATZJ3
         JOXg==
X-Gm-Message-State: AFqh2kpddGRSALJJJjeZ/pCk0cMYZlnMXPMQRcVqGsbfkO4Te+de6WIo
	jYFRXmtz0fI4MT7xkm7IdeQw3NmzGABmYUn87DU=
X-Google-Smtp-Source: AMrXdXv8R2Qi7CEGQwf+AWI8ywmMUFWnWb0m/a8Ebg6XHeGeOFF3RvupHBaScUFJ2KxkYzzhqMi3flIFRLJj6u1kkVY=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr4469543oae.262.1673192830446; Sun, 08
 Jan 2023 07:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20230108130743.983639-1-f_l_k@t-online.de> <20230108130743.983639-4-f_l_k@t-online.de>
In-Reply-To: <20230108130743.983639-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jan 2023 07:46:44 -0800
Message-ID: <CAMKF1sqLn6PUQLh5fo82S08-op2XVtp9fBDadHpzQQGoHFxpHQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 4/5] seahorse: import recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100473

fails to build on qemuarm/clang/glibc but also same error on all other
combinations.

| ssh/libseahorse-ssh.a.p/operation.c:536:2: error: incompatible
pointer to integer conversion returning 'void *' from a function with
result type 'gboolean' (aka 'int') [-Wint-conversion]
|         g_return_val_if_fail (_data_->_tmp0_, NULL);
|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /mnt/jenkins/workspace/Yocto-world-arm/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/seahorse/43.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gmessages.h:660:16:
note: expanded from macro 'g_return_val_if_fail'
|         return (val); \
|                ^~~~~
| 1 error generated.

On Sun, Jan 8, 2023 at 5:08 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/seahorse/seahorse_43.0.bb   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb b/meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb
> new file mode 100644
> index 000000000..a43d045ae
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "Seahorse is a graphical interface for managing and using encryption keys."
> +LICENSE="GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +DEPENDS = " \
> +    avahi \
> +    appstream-glib-native \
> +    desktop-file-utils-native \
> +    gcr3 \
> +    glib-2.0 \
> +    gnupg \
> +    gpgme \
> +    gtk+3 \
> +    libhandy \
> +    libpwquality \
> +    libsecret \
> +    libsoup-3.0 \
> +    openssh \
> +"
> +
> +inherit gnomebase itstool vala mime-xdg
> +
> +SRC_URI[archive.sha256sum] = "5b1d1bfba74f3658227f3c82e296f330dd0fcd1ef4636b6a218228fee5ea832d"
> +
> +PACKAGECONFIG[key-sharing] = "-Dkey-sharing=true,-Dkey-sharing=false,avahi"
> +PACKAGECONFIG[ldap-support] = "-Dldap-support=true,-Dldap-support=false,openldap"
> +PACKAGECONFIG[pkcs11-support] = "-Dpkcs11-support=true,-Dpkcs11-support=false,p11-kit"
> +
> +PACKAGECONFIG ??= "pkcs11-support"
> +
> +EXTRA_OEMESON += "--cross-file=${WORKDIR}/meson-${PN}.cross"
> +
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +ssh-keygen = '${bindir}/ssh-keygen'
> +EOF
> +}
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100442): https://lists.openembedded.org/g/openembedded-devel/message/100442
> Mute This Topic: https://lists.openembedded.org/mt/96130657/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

