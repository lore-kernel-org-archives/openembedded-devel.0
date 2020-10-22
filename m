Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.3169.1603326499562506743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 17:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FRjpiJYo;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b69so4677717qkg.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 17:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWlsLQuHiqWoz4kDELcUopN24QMPLsEQwMrS6O0PFNU=;
        b=FRjpiJYoNLRzAnRUxO4+EmC/Jyfu0G9/bEezV6GHVo/Ul3X1XzV++TJqsv3yRYyWD8
         5H/dRDSP3R8z70mEab33U2CVdPdTrMgFBjjwAsGrbChgjr+Dg2u3pd+S+86VL0sJAxFV
         gvYg95QoFtgcSxkFivAyVdXOtko3iA62NQUPK9q0uEPZwKOoJNm3aYnThnAotj4VyxjK
         ZQBdup2tyPe2/DMD+54U6UAFNiRYisFBFaoJk+Adh+2OpUcGi9shsyoH+54b/FvBu/g8
         S67kh/rpJYcwFBlBWOyMbtV1koOBHj5Mx2tE5c0JijaNZ95plF0qf9sAj6voaJ2a9+b6
         kDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWlsLQuHiqWoz4kDELcUopN24QMPLsEQwMrS6O0PFNU=;
        b=PNStzkDOs+Rv/xVJmFWHDrskTY657Pen6CB7zqASl/Wfo3gR71gVVwD0LYCXWtYJTM
         lkONM3JjUJXygmiV7HECn4SAf4r1hr/PX5HPebfh9E7y5SXCwXF99GYJNpThFhcSaoZN
         d57N8N1nBdhEMfiwvBGekjyfLoeRyrVDuTG7sbxZUYswvcwL/mBqVw0TRYV3vcLTinkx
         8yV6Ea3RtmfizbN/IvhNLlfU2Z18SgKdmYzKcWJRRdEdn54eb9WFn7J52z7VV//htZBI
         /21w1KWmagR0ouweNfhWXXqrgkm+nbv5c26+MYp1j8EYT2fTapnjN6DOfnNcbvOZC97E
         vczA==
X-Gm-Message-State: AOAM533mtvcZMU63GTEQPQ+PFCbGcgvHHi3uBGLXWzG6vxhIw/LuuHiC
	ZgkhVlafbsSsy2MmT5SoGUgMvq9eiHk41tG+SZc=
X-Google-Smtp-Source: ABdhPJyYn2CX9Vvwbw9qnDSlc6caiaT1TF32yMmefg63r0XUv+ErPFC5Hbczus0njdPBg9FBxgM26oueiOMfeenHe/g=
X-Received: by 2002:a05:620a:1187:: with SMTP id b7mr59754qkk.212.1603326498543;
 Wed, 21 Oct 2020 17:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201021040049.933690-1-alistair@alistair23.me>
In-Reply-To: <20201021040049.933690-1-alistair@alistair23.me>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 17:27:52 -0700
Message-ID: <CAMKF1soDAFv_tb8s0KkWxotDXh0nGhkJ2zSz6BLyB1DZ3QFf+A@mail.gmail.com>
Subject: Re: [oe] [PATCH] wayland-init: Allow setting idle time to 0
To: Alistair <alistair@alistair23.me>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

do you intend this for oe-core? if so then the mailing list its sent
to should be oe-core ml

On Tue, Oct 20, 2020 at 9:01 PM Alistair <alistair@alistair23.me> wrote:
>
> Add a PACKAGECONFIG that can be used to set the idle-time to 0. This is
> useful for always on machine (such as kiosks) and for debugging.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 07cec75fb3..b7a99be646 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -15,6 +15,10 @@ SRC_URI = "file://init \
>
>  S = "${WORKDIR}"
>
> +PACKAGECONFIG ??= ""
> +
> +PACKAGECONFIG[no-idle-timeout] = ",,"
> +
>  DEFAULTBACKEND ??= ""
>  DEFAULTBACKEND_qemuall ?= "fbdev"
>  DEFAULTBACKEND_qemuarm64 = "drm"
> @@ -45,6 +49,10 @@ do_install() {
>          if [ -n "${DEFAULTBACKEND}" ]; then
>                 sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
>         fi
> +
> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
> +               echo "idle-time=0" >> ${D}${sysconfdir}/xdg/weston/weston.ini
> +       fi
>  }
>
>  inherit update-rc.d features_check systemd
> --
> 2.28.0
>
>
> 
>
