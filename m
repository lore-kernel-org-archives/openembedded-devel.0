Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8719C98312
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 08:49:48 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5308.1768639778686263421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 00:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUZceM0f;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c83c49213so1933539b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 00:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768639778; x=1769244578; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhpYSzRoL3imfdM+VIYEORkVGfx8aGpPtyH3atXnyGY=;
        b=WUZceM0fSCdYmVvl9v0IShpvWJhKZ/vzteO5v8wPiIZX69fsPvv9f+c+ux70/CYpHS
         tKYkKhpc2wb81Tt8VdOVU9AxOEcXdQPtvaLngpFItOfJTJj3TXgsrRjbUbC8Lo44YMr0
         63ug9odmxK5OyXJMn3trGoIMBfcNsiQOv/s+lT7dH4KKHjD8yvgz1A82c1XrNAjLTN3W
         DhKYpz+0NiE5XmmJUqqX7VCLV5hJm7oNicjaz2KgddYzWftxuHJ3995InhlvpVKoSKoK
         f20llYacCyK0lqEouuTiMJWA13z5e2W7uf00dmxdKmsIRNS/1xM06G67Aq9aHAUj6Fw/
         9aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768639778; x=1769244578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhpYSzRoL3imfdM+VIYEORkVGfx8aGpPtyH3atXnyGY=;
        b=a9UgPG4/6lNw8BJDDJqjCnWvAgnoJLkw496eEruuW3VaNC/oBW76WnLEdPt15WVt00
         gSuwVFzleGDZI9bjmGCsfIc/zuJu3roNXsiu3L9ASfu0j2XFtM3CDJiaKsPsgkoWdcxw
         lJjw3g8BKG2BBzMZwrn2RUHtbwuNxCa94zU8TbOdEAg+KE2O+p+CzIG30nTm6Cyopoic
         DiUyVY1rGiN/Lit1khy1H5LlfrH++7ZZIc8W5oACOVxDCeDnEVY9/fIwTJn0qE54R1zb
         zue88JnW9ZwEZRfSDKpUovPb6jwvNdn7zMteJQP4+kWhdDz6HjAhZhGB5MXLmrNCPc8y
         dGoQ==
X-Gm-Message-State: AOJu0YymWAdFmjOrqbURWneRlZsQrXIOUvBhBO5He89G7ILDtverlpBK
	qr+Hfj2DQvBjz2VzBVK7mKV16pQ8ZyAFizB4JlzAw9p3TvTUXS8tdHxCLm2edRj3XBaF9C5VDbN
	diC7++002YHe3iCoWdvSnoaI/iGDZFpo=
X-Gm-Gg: AY/fxX7bmHf4wIAEeIebKjMJAw5ihl0dG3WWisImyYaJm1oectqFvetpn4J2thml4+4
	hByREfpKX2ZWwn4LU+YC5DXpAe4cz2kJuP5BWJB57ZyS44hH6BNhfXa1Bue5HpcJgsd1BfnKZ8v
	m3CDyuOA3DjbQ3lHpsP+/lavd7zLmDCSJLTDmKpdCqeTWIWn830rYvoBP2iOyJ66tVdMrLG1Y0F
	lR5vRxdhbZKG8720jbyuACPtBhc9bFFymxdtlErTKYoBk8Uy8G5JFsNhLFdnUjPLhRQQM54
X-Received: by 2002:a05:6808:221e:b0:43f:63cc:aefa with SMTP id
 5614622812f47-45c9c149d81mr2269248b6e.48.1768639777715; Sat, 17 Jan 2026
 00:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20260116075959.111147-1-f_l_k@t-online.de>
In-Reply-To: <20260116075959.111147-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 17 Jan 2026 21:49:25 +1300
X-Gm-Features: AZwV_Qiq2aHkMKc64YzBdKyWt8BV2fJ9HaW3ajo-MVjDxGskmsWMRk-pzetU17k
Message-ID: <CADySD0FQ1TaSHvtcs+7ksBe5NJTmd0VepTnYOYie44T112G9tw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
 0.7.0 -> 0.8.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123544

On Fri, Jan 16, 2026 at 9:00=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Remove patch that downgraded gbm_bo_create_with_modifiers.
> Meanwhile gbm_bo_create_with_modifiers2 should be save to use?
>
> Fix to work with manpages class
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...screencast-Fix-build-with-older-mesa.patch | 53 -------------------
>  ...7.0.bb =3D> xdg-desktop-portal-wlr_0.8.1.bb} |  9 ++--
>  2 files changed, 4 insertions(+), 58 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wl=
r/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
>  rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-deskt=
op-portal-wlr_0.7.0.bb =3D> xdg-desktop-portal-wlr_0.8.1.bb} (74%)
>
> diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch b/meta-mu=
ltimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001=
-screencast-Fix-build-with-older-mesa.patch
> deleted file mode 100644
> index ff4fcc292a..0000000000
> --- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From ef60a76e2a21b7649632dcf71d125039604a56b5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 18 Jun 2023 10:42:19 -0700
> -Subject: [PATCH] screencast: Fix build with older mesa
> -
> -gbm_bo_create_with_modifiers2() is quite new and there are still distros
> -that ship 21.2 and older. e.g. powerVR mesa implementation
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/screencast/pipewire_screencast.c | 8 ++++++--
> - src/screencast/screencast_common.c   | 4 ++--
> - 2 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/screencast/pipewire_screencast.c b/src/screencast/pipew=
ire_screencast.c
> -index 0611fd5..7d66810 100644
> ---- a/src/screencast/pipewire_screencast.c
> -+++ b/src/screencast/pipewire_screencast.c
> -@@ -234,9 +234,13 @@ static void pwr_handle_stream_param_changed(void *d=
ata, uint32_t id,
> -                       uint32_t n_params;
> -                       struct spa_pod_builder *builder[2] =3D {&b[0].b, =
&b[1].b};
> -
> --                      struct gbm_bo *bo =3D gbm_bo_create_with_modifier=
s2(cast->ctx->gbm,
> -+                      struct gbm_bo *bo =3D gbm_bo_create_with_modifier=
s(cast->ctx->gbm,
> -                               cast->screencopy_frame_info[cast->buffer_=
type].width, cast->screencopy_frame_info[cast->buffer_type].height,
> --                              cast->screencopy_frame_info[cast->buffer_=
type].format, modifiers, n_modifiers, flags);
> -+                              cast->screencopy_frame_info[cast->buffer_=
type].format, modifiers, n_modifiers);
> -+                      if(!bo)
> -+                              bo =3D gbm_bo_create(cast->ctx->gbm,
> -+                              cast->screencopy_frame_info[cast->buffer_=
type].width, cast->screencopy_frame_info[cast->buffer_type].height,
> -+                              cast->screencopy_frame_info[cast->buffer_=
type].format, GBM_BO_USE_RENDERING);
> -                       if (bo) {
> -                               modifier =3D gbm_bo_get_modifier(bo);
> -                               gbm_bo_destroy(bo);
> -diff --git a/src/screencast/screencast_common.c b/src/screencast/screenc=
ast_common.c
> -index d6d13db..2e4fc18 100644
> ---- a/src/screencast/screencast_common.c
> -+++ b/src/screencast/screencast_common.c
> -@@ -143,8 +143,8 @@ struct xdpw_buffer *xdpw_buffer_create(struct xdpw_s=
creencast_instance *cast,
> -               uint32_t flags =3D GBM_BO_USE_RENDERING;
> -               if (cast->pwr_format.modifier !=3D DRM_FORMAT_MOD_INVALID=
) {
> -                       uint64_t *modifiers =3D (uint64_t*)&cast->pwr_for=
mat.modifier;
> --                      buffer->bo =3D gbm_bo_create_with_modifiers2(cast=
->ctx->gbm, frame_info->width, frame_info->height,
> --                              frame_info->format, modifiers, 1, flags);
> -+                      buffer->bo =3D gbm_bo_create_with_modifiers(cast-=
>ctx->gbm, frame_info->width, frame_info->height,
> -+                              frame_info->format, modifiers, 1);
> -               } else {
> -                       if (cast->ctx->state->config->screencast_conf.for=
ce_mod_linear) {
> -                               flags |=3D GBM_BO_USE_LINEAR;
> ---
> -2.41.0
> -
> diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-po=
rtal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
> similarity index 74%
> rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-de=
sktop-portal-wlr_0.7.0.bb
> rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desk=
top-portal-wlr_0.8.1.bb
> index c3056c9e86..3deeb1078d 100644
> --- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.7.0.bb
> +++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.8.1.bb
> @@ -13,18 +13,17 @@ DEPENDS =3D " \
>      virtual/libgbm \
>  "
>
> -inherit meson pkgconfig features_check
> +inherit meson pkgconfig features_check manpages
>  REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
>
> -SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster \
> -           file://0001-screencast-Fix-build-with-older-mesa.patch"
> +SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster"

can please also include tag=3Dv${PV} in the SRC_URI

>
>  PV .=3D "+git"
> -SRCREV =3D "d9ada849aeca6137915de2df69beaef4e272cc1d"
> +SRCREV =3D "256eb4a9f6ecffd64289d6501d036c2094b47db6"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
>
> -PACKAGECONFIG[man-pages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisabl=
ed,scdoc-native"
> +PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisable=
d,scdoc-native"
>  PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled -Dsd-bus-provider=3Dlibs=
ystemd,-Dsystemd=3Ddisabled"
>  PACKAGECONFIG[basu] =3D "-Dsd-bus-provider=3Dbasu,,basu"
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123527): https://lists.openembedded.org/g/openembedde=
d-devel/message/123527
> Mute This Topic: https://lists.openembedded.org/mt/117294478/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

