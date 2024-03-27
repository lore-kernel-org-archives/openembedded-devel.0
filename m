Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05FFC47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 18:22:28 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.1140.1711563744136447081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 11:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jEc29jJZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2220a389390so81723fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711563743; x=1712168543; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5O+FHCD47/bxPvcyKLe1NqhNMGHfqC+a53WkWIEB+o=;
        b=jEc29jJZoajwKj/1n5PG+ZLeokIZnpIwgydwyn4/0R5SNlMGK2+Xeco0QFc5hYVk+y
         ZNC0wzQXWAzWBkRFHG3HkR154B7rhFhD/po+8DY8rbtg+5qgyoe+IgGwjtl735pWw1p+
         +9958kbDmwoQcSzN69uBNt05h1K4IGEfvBfRHU3kw8mX06JmDiRePUa62LdWNtEmkQSh
         DkmCqWL0+BlZRZ7/NFTi+WOqaBUyr/e3LQzu1E5nVh3Pfw/zOXTvveJ1WXt9iCLaw+uL
         R9FW9qUUlVDtqFd3FgGwGbnWK0H2Drnlv1ARmuZrn+MP1yUNDsNb9/U4knwgPQEs2plE
         4CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711563743; x=1712168543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5O+FHCD47/bxPvcyKLe1NqhNMGHfqC+a53WkWIEB+o=;
        b=aN/QD4CHjcNoy+hhVTUPAFvoXzuP9V3TyT9H/wZdtYFk9RWEah/VWNtjk1skWoAQH4
         J868Ht2KsJSbQghemdtXjgyBNCk4+eN08UCl20a5pcQe/B6foLyetqCMeXyCmJiUPNuF
         rTE788gZC90kjR7nYek6RZuv+wWvYEPn6zTB5sz2Sa1ngQZi2ZhcuAcE5kUlbZyeiqVy
         RnFQgcMtegNKNi88XWD5Wpt5/C3zf1/lHhvxmQlUhsGk9ToSTAlkbbwN0Fbgc1Z0ZIo0
         FCdtSIY9QFN7Not8b1Ua630ntjl0+YXZ+dKmsm7qrCtp1MZ2l0JmQHgKUB1jSDJ6qTtI
         2iSQ==
X-Gm-Message-State: AOJu0YzH27zK4skO/Z/9XWO2taK8KtNl8BPlqlFbItFfToLZcavXfhbp
	ozza1dP5I/fTytXRslR9atwKJ6owzVwu2s/TnO5LA3Own+BlzLInWmLKGc37o2nEqL5c3MMc39o
	Vhzp3kQDudWXZ7IceSVO6NfU1PLM=
X-Google-Smtp-Source: AGHT+IGgHlJfkDyAKjWxtIR9UNe2qF1/lM7fHXpCkEuVi6qBVvOB+ixLauDwXz3ED9o4iqrU4ZSeCqBEb/eloofPBBw=
X-Received: by 2002:a05:6870:6c0c:b0:22a:4334:7449 with SMTP id
 na12-20020a0568706c0c00b0022a43347449mr37028oab.7.1711563743379; Wed, 27 Mar
 2024 11:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160808.22384-1-f_l_k@t-online.de>
In-Reply-To: <20240327160808.22384-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2024 11:21:56 -0700
Message-ID: <CAMKF1soAGh=z3e4pU9oYBiGQbXm9T7jpxJC+K1u6h1DpL0jGVA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-user-share: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 18:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109647

this does not work properly with non-systemd distros

09:44:18 ERROR: Nothing PROVIDES 'systemd' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
DEPENDS on or otherwise requires it)
09:44:18 systemd was skipped: missing required distro feature
'systemd' (not in DISTRO_FEATURES)
09:44:24 ERROR: Nothing RPROVIDES 'gnome-user-share-dev' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
RDEPENDS on or otherwise requires it)
09:44:24 No eligible RPROVIDERs exist for 'gnome-user-share-dev'
09:44:24 NOTE: Runtime target 'gnome-user-share-dev' is unbuildable, removi=
ng...
09:44:24 Missing or unbuildable dependency chain was: ['gnome-user-share-de=
v']
09:44:29 ERROR: Nothing RPROVIDES 'gnome-user-share' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
RDEPENDS on or otherwise requires it)
09:44:29 No eligible RPROVIDERs exist for 'gnome-user-share'
09:44:29 NOTE: Runtime target 'gnome-user-share' is unbuildable, removing..=
.
09:44:29 Missing or unbuildable dependency chain was: ['gnome-user-share']

On Wed, Mar 27, 2024 at 9:07=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - add it as runtime dependency to gnome-control-center because without it=
,
>   the file sharing options are hidden.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-control-center_46.0.bb              |  2 +-
>  .../gnome-user-share/gnome-user-share_43.0.bb | 23 +++++++++++++++++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-=
share_43.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-contro=
l-center_46.0.bb
> index a691b8d3f..4acb96967 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
> @@ -69,4 +69,4 @@ FILES:${PN} +=3D " \
>
>  FILES:${PN}-dev +=3D "${datadir}/gettext"
>
> -RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
> +RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper gnome-user-share"
> diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
3.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> new file mode 100644
> index 000000000..450ea6cfa
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "This is gnome-user-share 43.0, a system for easy sharing of=
 user files."
> +LICENSE=3D"GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +
> +DEPENDS =3D " \
> +    glib-2.0-native \
> +    glib-2.0 \
> +    systemd \
> +"
> +
> +inherit gnomebase gsettings
> +
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=
=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D ""
> +# default path is /usr/sbin/httpd
> +PACKAGECONFIG[httpd2] =3D "-Dhttps=3Dhttpd,,,apache2"
> +PACKAGECONFIG[apache2] =3D "-Dhttps=3Dapache2,,,apache2"
> +
> +FILES:${PN} +=3D "${systemd_user_unitdir}"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109646): https://lists.openembedded.org/g/openembedde=
d-devel/message/109646
> Mute This Topic: https://lists.openembedded.org/mt/105180141/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

