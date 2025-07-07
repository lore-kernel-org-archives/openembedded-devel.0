Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DDFC71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:04:49 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.4724.1751925880800340411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eT32kSZN;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b3a3a8201so30207281fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751925879; x=1752530679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGbzXJDkd4ZFaEk/gcmsplW5EXQZrje8JOLEvRrtht0=;
        b=eT32kSZNzxm2dkfQNcAcgiUDuLkLsrgEAnyr4bvcq8MMN/MA/0bJRHn9ifj93X+BoH
         oKh0ChmSRG5E7dPqopOHhyeiKc/JRlzmNK4jSyDrbLSJTMFhyMQTTSTTHJKy/ymeytob
         Ue6xyxqEUb4u0oAsRgmChCkAvbciks6bLLjgKgs+NTCnCJDX1R/FWUVeBwvgW/HZwKh4
         xvXiBOzf2F/QABI6lnzL+zgfvaJUnOIuebKe+nkZdiMXcA75eM6dtbiTsVUCY6RCovcw
         N43LTpn2fqngL+XGf8fsRBj3jeN7COYfJpUS1CBuG+MJC+9aWMdxogpjjGdqQofIr4dt
         9KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751925879; x=1752530679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGbzXJDkd4ZFaEk/gcmsplW5EXQZrje8JOLEvRrtht0=;
        b=EtsGCOuQq4qeZ3mIL/PKesYVHvsMaeofHfbWWC7Ayd1JjH4u3qZbamqbrWI46JDKNI
         f1kQddCx2HEKSfRnGpojj4MZe/fJ54Nv8MekUPaFedY6LUEM0rAHrn02OdonXJmbMc78
         Cn8XMf5hKHjaDz4CmeSEYLs4IWIl2S+9OPQS3v+sNiuQo/5TN9AxhmueDRrSJ6rPZeew
         6VJ81dauYDDOu0kS3haatK4mxw3ykj5bE9cusbu34hzS6pxLj+HRTBJpS74AGej+I1VS
         dQ4YPSYHboxAamAzzG5fdn39wUt5JOn2MMmFIQErVlC6LK1r7MPsphjsusK4x+0Mpz7Q
         1uqw==
X-Gm-Message-State: AOJu0Yz0H4Nr+rN1rrlzuMfBEG+ZOqjQ7QujW/x1go0hAEKenXKdPDVR
	tvzQfs6LaAPC1eaVZ5r4QFlbswgFr5fNXX0XJuinmvg74d5kEOZMVfNC5SX6dynV1UNdduSdMqS
	XjoSUDRfp35hMpof1wGAMJMZ9MXxCJy8=
X-Gm-Gg: ASbGncvg4ec9V6rmGHnhPzImYgTaohX6CyyHkilu/ABjaecqoQl9T5yAcDEY7dm2TPJ
	rmLRGeYtLHdeCOvrKfZ5dicbWWNcozBN0f3KuoJUKJw07yTwjT2+hTCPT6P3sKOVMnQp3jTVYk3
	Ynt0zdwfxriXRUtj6OwzX+BwUk2hCDXNdQAydOltR54RXys8sXTJltfmnd
X-Google-Smtp-Source: AGHT+IFFya14xvOn831O5XLAMPDQBwQRqwdmOA0TRot+n+Vj/SNdZ2T7R+PjWHrolss4TNlS64pO/ia7ZWs7uBxd5LU=
X-Received: by 2002:a05:651c:2117:b0:32a:8062:69b1 with SMTP id
 38308e7fff4ca-32e5f568c3dmr48494461fa.8.1751925878607; Mon, 07 Jul 2025
 15:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250701192744.586044-1-hiagofranco@gmail.com>
In-Reply-To: <20250701192744.586044-1-hiagofranco@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Jul 2025 00:04:27 +0200
X-Gm-Features: Ac12FXzrfJ-ZnyFm6VXJiMW-ZQEjbuojZBUAzmJ4vQdtfoB8qAIRFtY44DkZtJ8
Message-ID: <CA+chaQdT2ujqd_yzgyRUNnMNmhS6vOoW06VaEmwtYAA9AiWSSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gpicview: add recipe
To: hiagofranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118288

On Tue, Jul 1, 2025 at 9:28=E2=80=AFPM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> GPicView is a simple and fast GTK+ image viewer for X which is
> lightweight, desktop independent and has minimal lib dependency.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  .../gpicview/gpicview_0.3.1.bb                | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
>
> diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-o=
e/recipes-graphics/gpicview/gpicview_0.3.1.bb
> new file mode 100644
> index 000000000000..dab11a02bc1a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Lightweight image viewer for X"
> +DESCRIPTION =3D "GPicView is a simple, lightweight and fast GTK+ based i=
mage \
> +viewer with minimal lib dependency and desktop independent."
> +HOMEPAGE =3D "https://github.com/lxde/gpicview"
> +BUGTRACKER =3D "https://github.com/lxde/gpicview/issues"
> +SECTION =3D "x11"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +DEPENDS =3D "glib-2.0-native intltool-native jpeg"
> +
> +SRC_URI =3D "git://github.com/lxde/gpicview.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
> +SRCREV =3D "ca13623c6176585db4759ce4371fbf89c56fa630"
> +
> +inherit autotools mime-xdg pkgconfig
> +
> +PACKAGECONFIG ?=3D "gtk3"

This should respect DISTRO_FEATURES, e.g. like this:
PACKAGECONFIG ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES',
'${GTK3DISTROFEATURES}', 'gtk3', '', d)}"

I'll send a fix tomorrow.

> +PACKAGECONFIG[gtk2] =3D ",,gtk+"
> +PACKAGECONFIG[gtk3] =3D "--enable-gtk3,,gtk+3"
> +
> +FILES:${PN} +=3D "${datadir}/icons"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118194): https://lists.openembedded.org/g/openembedde=
d-devel/message/118194
> Mute This Topic: https://lists.openembedded.org/mt/113935295/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

