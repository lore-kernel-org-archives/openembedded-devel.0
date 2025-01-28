Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99D5C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 17:14:28 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.2567.1738084463177494938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 09:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h/yuQulc;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2b29662f823so1166184fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738084462; x=1738689262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA2zP7rzo/NLdKwm3j1yRcNCp6wLqqmBvYP1DmEARBY=;
        b=h/yuQulc+Tl2I491m2JQ56GR0sNZOZR5m+qZR3qT+3UENuPxxnkwlthAUcFIxKdZNt
         zpbFN/XcueqJaS5n+qjVFoWdtwZkShNyDkxumPlIZWrBwur8FZ1qLAClADV91V7nXyb4
         rYrwURIlL3Yb21J6+Ti5o9whdPLLmB5jDU1AGvLSqX0GkfYURrUqZ1wYTvmcNgNFSuif
         whgDq0TYNnL4hbDrIBSCC87ZOjmf7b6jcxmZR1bPkfxcONw6x8DlpY0G57mbzoo19kF4
         BFW4kJW5TFgVnxrEC9Wys4QwlpeVHse3qu8gj6kIXoYhWYev4NmnPfEgN6P9gyISy7pl
         1I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738084462; x=1738689262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA2zP7rzo/NLdKwm3j1yRcNCp6wLqqmBvYP1DmEARBY=;
        b=dh+oZmrk8uZ4ZVtcWNtM62azP3YMJbwqy2b8+A97l8gp/7G6/Eg5HRkfLxzNWQiBf8
         UalyvyFpEp/RH2VnGs5BBtBBHWG8o8AP9PLQA+K18euVip8IPVREHZ9DZOwFEgRzAoly
         iXJ3DHvZYUyYGfbMbSTFT04nRZ/mtR2uvVq8shgPMqMJipRkt0DeDQEe4XiraOgiT1Av
         L+HrfiO62/DIJxOzP7wXPgr5lQy3rV1X4z/R6XJdNc5HgkqDa7CM5I8Z05QGCExTbsIR
         /VR/8Vm8FFcMFFZzFNzV0L8FucyVDQljYrzZt3zGCNviQwaSv1GG719iy5UrDldR43rQ
         VRaA==
X-Forwarded-Encrypted: i=1; AJvYcCUS69F38AY21Cn4aEDxzgHVoq6wFZgqZCzdcmU3Tu9wtzvGmXxCNkz97s+FqrghA6IRhWb1DZZTDH1Cy/eJKUsShaM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOoPcKLqyVPA7dEbZ/mAazem7oHBRSxxLr6VkvU1Pinm4bq2Zw
	xw4pDoheDmKOEUDPTvds8ttQkRSQX2jfe5qThU+IRle2anHaCQzBD+flJgGLBZf03zkedRFQ+m+
	KQUJHRJz8lff5k9NNtiv46I5u1sA=
X-Gm-Gg: ASbGncvdDCc5wkv9RxZ6uR/jpGNgy4XRpnvJXjRJ4cFKwoGwKK+STR5+PwzDmc75yxy
	PebhzLs4/YLGNpVMYpsrlTe+zzRIK7JnTIv11d/jm/xR4pklnddAQIORuQpQoviN8+aiYbRA=
X-Google-Smtp-Source: AGHT+IGXW4Wh3Yqtu6Qhx0B54ITTNOTZ/6racnEmHYT8qwCgpebL6EhdlBemiGc29fw9RLrNm9X0rLwoXZCUM8m8Lf8=
X-Received: by 2002:a05:6871:7a09:b0:29e:5e83:150e with SMTP id
 586e51a60fabf-2b1c0aee5fcmr26117131fac.27.1738084462393; Tue, 28 Jan 2025
 09:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20250128131656.61467-1-brgl@bgdev.pl>
In-Reply-To: <20250128131656.61467-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2025 09:13:56 -0800
X-Gm-Features: AWEUYZnimy15owYDY7W7OXFtyPHGLQEBDe6hk-s7X3Vn983TcoZ5uvQ0VQAlyjo
Message-ID: <CAMKF1sqBLaSbN4XtB+XPjYk82Q3twJiOvA68b9-sMd5VC+bbfw@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] cheese: new recipe
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 17:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115120

On Tue, Jan 28, 2025 at 5:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a recipe for cheese - a Gnome application for taking photos and
> videos with webcams.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  ...kWidget-cast-to-avoid-an-incompatibl.patch | 29 +++++++++++++++++++
>  .../recipes-gnome/cheese/cheese_44.1.bb       | 26 +++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese=
-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch
>  create mode 100644 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-Gt=
kWidget-cast-to-avoid-an-incompatibl.patch b/meta-gnome/recipes-gnome/chees=
e/cheese/0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch
> new file mode 100644
> index 0000000000..8d2d413149
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-GtkWidget=
-cast-to-avoid-an-incompatibl.patch
> @@ -0,0 +1,29 @@
> +From d8b8f27730cca948a5e5346b8ed2db0793bb16e7 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Fri, 19 Jan 2024 21:31:33 +0100
> +Subject: [PATCH] libcheese: Add GtkWidget cast to avoid an
> + incompatible-pointer-types error
> +
> +This is required for compilation with GCC 14.
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cheese/-/merg=
e_requests/70]
> +---
> + libcheese/cheese-flash.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libcheese/cheese-flash.c b/libcheese/cheese-flash.c
> +index 59959dbd..e4023221 100644
> +--- a/libcheese/cheese-flash.c
> ++++ b/libcheese/cheese-flash.c
> +@@ -132,7 +132,7 @@ cheese_flash_set_property (GObject      *object,
> +       GObject *parent;
> +       parent =3D g_value_get_object (value);
> +       if (object !=3D NULL)
> +-        priv->parent =3D g_object_ref (parent);
> ++        priv->parent =3D GTK_WIDGET (g_object_ref (parent));
> +       else
> +         priv->parent =3D NULL;
> +     }
> +--
> +2.45.2
> +
> diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/=
recipes-gnome/cheese/cheese_44.1.bb
> new file mode 100644
> index 0000000000..c58d475675
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Take photos and videos with your webcam, with fun graphical=
 effects"
> +SECTION =3D "x11/gnome"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da17cb0a873d252440acfdf9b3d0e7=
fbf"
> +
> +inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gset=
tings gnome-help gtk-doc
> +
> +SRC_URI +=3D "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incom=
patibl.patch"
> +
> +SRC_URI[archive.sha256sum] =3D "5f2185c4c99e54ddf2b8baf60c82819950e54952=
e132e8639875f3edcbf8f68e"
> +
> +DEPENDS +=3D " \
> +    clutter-1.0 \
> +    clutter-gst-3.0 \
> +    clutter-gtk-1.0 \
> +    gnome-desktop \
> +    libcanberra \
> +    libxslt-native \
> +"
> +
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +
> +# Man page build wants to access sourceforge
> +EXTRA_OEMESON +=3D "-Dman=3Dfalse"
> +
> +FILES:${PN} +=3D "/usr/share/"

perhaps use ${datadir} here instead of hardcoding /usr/share

> --
> 2.45.2
>

