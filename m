Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B27D3901A
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:42:27 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20555.1768423338394147940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 12:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YwZP4+up;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-450be85b7d9so143916b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 12:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768423337; x=1769028137; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w15dRbGvAaEWlp7N+lGFdLT+sRPYXyJ2iK8x5oZTXSY=;
        b=YwZP4+upwrzEINckt0teKD1kDXpBzSL9sdYv/RX7FVgEBRpGC+aZcTanFBoGpnbv/R
         3vd63iG0OX3fAU0L4HopmphUcD9Xpo3HWdhG3Pi37VZSCFmypEngZaqIHV8E7lf3e3Ve
         s4pQsOpMj/1JX1aJgXplMEV3JAixL4932Mr0L8h7WZ9ZOR41ejRlEerNcqGdYc6kyIDw
         SRjrnStdXEs2Fm1tMwLo3ISVPymf7vzJ5HhERi/jB0swYoCOHyz8tRNHj8Kq9Po5hJvD
         HdJNuydQKFBfY5ewntw+I8o2jBu3ozjiIP9r585Ow5w/i8Cfhybi4Og6lhuMg4fAAEgB
         DtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423337; x=1769028137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w15dRbGvAaEWlp7N+lGFdLT+sRPYXyJ2iK8x5oZTXSY=;
        b=RRfxZYzYvjoySw6dYnLvRrZoJ8ibgqiEFFY7sa5K3/sfsduS+Augn9jqlj+2yma/1j
         6hi7fFgSj+H4yJ/rSZ1o4p9f3xw7ksgSeRaQsx5lv8doZSxVd7GRWkKpehZZfBj+Oeue
         aqGE6bgZxqZ8nQnL7oTRhmTZRZ2bj0eOYLDlQkRWc7ta2RQe7VwVN2fsu6dFtsAUoCtL
         7Om2t5FNQwIHc4taYUetKqjpe/MZM8ndnvHHyO2/g7fb2+SXsf1DR/y+ggxSlH2Aue9k
         jBCR/lyOFB00ePOYxmbiP1+0XP+yVs9OaBMnIMY3hIFIeOfMCAjDKBz+gH80pZ2voaDz
         AWbw==
X-Gm-Message-State: AOJu0YyRsSTmkLMrRdqxD7kEEH2v64uItKEkkxfY6r9STOLo1DU/OLVN
	FYJlTW6yixqBBPFjlJXzwIR+7rdrvNIaGCzZM3WOiJRUhHFtSYs+r4FDKNFVuht7Lf3mQ9ICNfT
	PWr4o5Ge6R+QE45MOtGA0ZBWsUccLXer42rLr
X-Gm-Gg: AY/fxX7iNPkYE6UI2mNokIT2MUMwgX5yImGGT65Ma42F18jkFAe/LclD+3GCHXANk7W
	BhwybKiPK0JA6Ex+/EJbrKeeo4NCzb/BK0UvPUW/91deEhrzyiglNEc56YDH7ckQi2rQ/exfJrF
	ssnYlD1lqDMBS+wRJl3V35BNHQbGEObVLNYDtOH3WHCRc4hC5nKGsax9sM/g0bvQDhrfOUliNVu
	1LfT2xJLw/G396hspAA1xHa43flNXIufwF90cKNSX0i2fInfmr5wZfZs80K9lDnbkpcc5qN
X-Received: by 2002:a05:6808:13d2:b0:45a:6f18:8c74 with SMTP id
 5614622812f47-45c71521684mr2640380b6e.45.1768423337476; Wed, 14 Jan 2026
 12:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20260114172553.1241309-1-adam.duskett@amarulasolutions.com> <20260114172553.1241309-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260114172553.1241309-2-adam.duskett@amarulasolutions.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 15 Jan 2026 09:42:06 +1300
X-Gm-Features: AZwV_Qgs_oAouQ0nUjxURSt7lq99rPIplYgqXolPQo9IvBtRv190s3oKifpMQNQ
Message-ID: <CADySD0FT4tcpT0FKL=JmBvu=71GcBHHZKoMAMLhWxmtU2UYk4Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] [meta-oe] kmscon: Add recipe
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 20:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123486

On Thu, Jan 15, 2026 at 7:16=E2=80=AFAM Adam Duskett via
lists.openembedded.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
> Provide sane defaults that do not have dependencies, such as
> a dummy and terminal session support and basic fbdev support.
>
> kmsconvt@.service must be added separatly or else
> do_rootfs fails with the following error:
>
> ```
> do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the inten=
tion
> is to defer them to first boot, then please place them into
> pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is n=
o
> longer supported.
> ```
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/re=
cipes-graphics/kmscon/kmscon_9.2.1.bb
> new file mode 100644
> index 0000000000..9f19bd18e6
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> @@ -0,0 +1,63 @@
> +SUMMARY =3D "Simple terminal emulator based on linux kernel mode setting=
 (KMS)."
> +DESCRIPTION =3D "\
> +    Kmscon is a simple terminal emulator based on linux kernel mode sett=
ing \
> +    (KMS). It is an attempt to replace the in-kernel VT implementation w=
ith \
> +    a userspace console. \
> +"
> +HOMEPAGE =3D "https://github.com/kmscon/kmscon"
> +BUGTRACKER =3D "https://github.com/kmscon/kmscon/issues"
> +CVE_PRODUCT =3D "kmscon"
> +
> +SECTION =3D "graphics"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d4602d249f8a3401040238e98367=
d9e"
> +
> +DEPENDS =3D "\
> +    libtsm \
> +    libxkbcommon \
> +    udev \
> +"
> +
> +SRC_URI =3D "git://github.com/kmscon/kmscon;branch=3Dmain;protocol=3Dhtt=
ps"

please include tag=3Dv{PV} in the SRC_URI

> +SRCREV =3D "7d46650dbb0826f9b89de42f879be879391c14fd"
> +
> +inherit meson pkgconfig systemd
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}=
"
> +
> +PACKAGECONFIG[backspace_sends_delete] =3D "-Dbackspace_sends_delete=3Dtr=
ue, -Dbackspace_sends_delete=3Dfalse"
> +PACKAGECONFIG[font_pango] =3D "-Dfont_pango=3Denabled, -Dfont_pango=3Ddi=
sabled, pango"
> +PACKAGECONFIG[multi_seat] =3D "-Dmulti_seat=3Denabled, -Dmulti_seat=3Ddi=
sabled, systemd"
> +PACKAGECONFIG[opengl] =3D "-Drenderer_gltex=3Denabled -Dvideo_drm3d=3Den=
abled, -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm virtual=
/egl virtual/libgles2 virtual/libgbm"
> +PACKAGECONFIG[video_drm2d] =3D "-Dvideo_drm2d=3Denabled, -Dvideo_drm2d=
=3Ddisabled, libdrm"
> +
> +EXTRA_OEMESON =3D "\
> +    -Delogind=3Ddisabled \
> +    -Dextra_debug=3Dfalse \
> +    -Dfont_unifont=3Denabled \
> +    -Dsession_dummy=3Denabled \
> +    -Dsession_terminal=3Denabled \
> +    -Dtests=3Dfalse \
> +    -Dvideo_fbdev=3Denabled \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "kmscon.service"

can use {BPN}.service

> +FILES:${PN} +=3D "${systemd_system_unitdir}/kmsconvt@.service"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${sysconfdir}/systemd/system
> +        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
> +            ${D}${sysconfdir}/systemd/system/autovt@.service
> +    fi
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', =
d)}; then
> +        sed -e "s@#drm@drm@g" \
> +            -e "s@#hwaccel@hwaccel@g" \
> +            -e "s@#render-engine=3Dgltex@render-engine=3Dgltex@g" \
> +            -i ${D}${sysconfdir}/kmscon/kmscon.conf
> +    fi
> +}
> +
> +RDEPENDS:${PN} =3D "xkeyboard-config"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123483): https://lists.openembedded.org/g/openembedde=
d-devel/message/123483
> Mute This Topic: https://lists.openembedded.org/mt/117265881/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

