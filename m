Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBA5CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 23:57:08 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.865.1778630224745779834
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 16:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BoYlaAtS;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so3239117a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 16:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778630224; cv=none;
        d=google.com; s=arc-20240605;
        b=CrDhYXf9E0qh+hq3zoXREDfocFSCUFU27vbuW4u2/C7pN2vikv9lP31YvkDL0DKM8t
         vHmP/AZuD9CeSelmix38vyqqfJorUmJcTeODwE6vbOGICy3jbrtFOww2AG5o74gSMfo4
         zlLTani13FeUqwEa5KBPE5P1e6s6QRU3hu7sWb+bRyrR+Fkfjnu7neSna9JGYj8+j2RZ
         jFECEMI6wM+z6xMR5ZJjNUg5fwILk0cQ7O2gu6yc3dZQM0hi2zpF1Ufvtck/7IobNIU0
         0K2hz9Uqk6yZ0Sys1f1Q0LFVhGPyhyO1eafJx4r26Vs6GWL/JhSmrjlj+98vbU3dGWuE
         b8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6rC8VTUFc1eJEfMLgOSFM+NtSxDCCjIrjyVwrLeJfrA=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=HnMrKyRor5fatWezoBzltnnxGlu8iS6dSv/o0ZDGSnApthiEY1CgdHhVqux4IIpxX3
         cKBSkGR2SrAeaqOvGR8xpHVtsZy+v8FakJgRcXUy/IhPY2CbTg/DkLY1nZG2mFfe3exf
         04XSyC0B6YGhG5Cn6r5ca25a96Auk2IwbVh4O4TZQO2dq0Slu5SCeXx8AGrPDwaDksuO
         9jeOXHsYfKfknh6aN7xPJAcP4nsKihaCp0OidJAWKHiQnaUWPDPf6b4YEeEEurW8Zv1w
         xSq98eTGrIsYSWDweJW5NyS6sYSMaDg4yAtoyrjRPSc0qycoI83dUc/Jok5S6znN3pDA
         llxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630224; x=1779235024; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rC8VTUFc1eJEfMLgOSFM+NtSxDCCjIrjyVwrLeJfrA=;
        b=BoYlaAtSvqMqYFi7hOxcWVGCCGMhiSui0ylnt/zGD5XD/JSP7U542kkIOepNwcFw3a
         q0yNJSy3uJevQXBHIb4ujdTdhXlfhzdSsE1aJEN3PqcGAdLjuXKN9E+ClQiT28ply9/e
         2tmHNYm7Vd4NN+v0BeolYKFl6v58a+20aK0bQRejr/oJjWbziVYmHV9LZWRfyxs9LOQu
         PTijLq5ksjTiZSgulT3/TkNE2MwYdk5zuJeam2cUlHFUO3gtHUmr51pxXjP0HbIjSNLf
         sqnSHHnuiQWP9BJgtralyEKFvZYJ10FY99ur1RrSFDJHiiTvrWSCxyu75LQHSC/OyFzl
         xQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630224; x=1779235024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6rC8VTUFc1eJEfMLgOSFM+NtSxDCCjIrjyVwrLeJfrA=;
        b=ZmZhHvgTj26ohhNYyEdGCw05zO4UDGYDfrEHQwk3ckOZFL1aPIc8Ocx7bZYw2hgfEZ
         LhfKx0MzgnmgAuanflWaLyBqyY3qSbX35eWADXWoWrbFFWgbS3i4ojLycM0ZuoZdXybD
         rdbdkJW7Koe8u5N1wXj+nYZnwHdSmjKu4CD+FCkwEnI4t9faa51R5CVcgd+uGphMyqI+
         2iPZA8Kv4uMZcgxGHfer3/Hx5974QYOcfYoHUqMQHfhxl0Rv/1dG/hPVbuoIZOxAG+Si
         ayO8Y+7WJNvVklpomelorB/i7mD61ify04SMGe8EnUJXdkCkpDIqt27+1uo2iWcOsdxT
         UKfw==
X-Gm-Message-State: AOJu0YweLLoKFQ7A0+wspmqX1J7K5uoHI+YK2WsD4cY/bkkBiyaG6+Jm
	aP6fgvM3LN1hSR9KPOuDchjrncoonSjqw87L8HQDG07mgbZrT604FU/3CAC7pIUJQZ9l1ONLsqM
	tAep4htRTQ7Y8NUAruIeG1eAcewyMmwI=
X-Gm-Gg: Acq92OHPlxqfWh9q9bP/dDTmD2cBhFiJ3Ct18gVG1zFaTnlTkB/k1Ihbf0R7Z5gdlV6
	mAXfOHipNJ6HQeVkbEowxJzivehlveLBDa5XKSFLRbh+y79F3LFwHqNBMcNOezlAOp0XgmYfbzl
	WQma+79UiWAhELxV8UYeTstu1hWTGPHVNViI25wC8E+aKCudHshLDlzpd4rYrJV4wdlMlDHl+vo
	iZE09MJD0z1hM54U2pCTJxvWRYq7brLtYYdSHOkzftki29ZjAXusbeCCl051j6ER9BRa3/SdPjf
	UUr/zXBxcw==
X-Received: by 2002:a05:6830:25c3:b0:7d7:fb03:f6ba with SMTP id
 46e09a7af769-7e3da51cdfemr568921a34.21.1778630223794; Tue, 12 May 2026
 16:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260512163727.3832144-1-ross.burton@arm.com> <20260512163727.3832144-2-ross.burton@arm.com>
In-Reply-To: <20260512163727.3832144-2-ross.burton@arm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 May 2026 11:56:52 +1200
X-Gm-Features: AVHnY4I__fVfxdaCjSe5_4kCSQ9ZKvU3jOMe5QPakccUTRYICcHMvbuDwcbAI-c
Message-ID: <CADySD0FRGBe_D3Xgdcxj-xSYjmo4qXqpQWXWDvg1LE-dBDK4sQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] libdazzle: add recipe (from oe-core)
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 23:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126876

3.44 was released in 2022 and the project is in archived state, do we
really want to add this recipe?

On Wed, May 13, 2026 at 4:37=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This was previously in oe-core but is being removed as it is no longer
> used by anything in that layer.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libdazzle/libdazzle_3.44.0.bb              | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0=
.bb
>
> diff --git a/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb b/m=
eta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
> new file mode 100644
> index 0000000000..9bca7e9dce
> --- /dev/null
> +++ b/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "The libdazzle library is a companion library to GObject and=
 Gtk+."
> +DESCRIPTION =3D "A wide range of components from utilities for GIO, widg=
ets for \
> +GTK+, an animation framework, state machines, paneling and high-performa=
nce \
> +counters are included."
> +LICENSE =3D "GPL-3.0-or-later"
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libdazzle"
> +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libdazzle/issues"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
> +
> +inherit gnomebase upstream-version-is-even vala features_check gobject-i=
ntrospection
> +
> +DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3"
> +
> +SRC_URI[archive.sha256sum] =3D "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765=
212f0e28f78e6c1783d18eae"
> +
> +GIR_MESON_OPTION =3D 'with_introspection'
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126873): https://lists.openembedded.org/g/openembedde=
d-devel/message/126873
> Mute This Topic: https://lists.openembedded.org/mt/119281118/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

