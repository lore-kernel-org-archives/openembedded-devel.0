Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFCCC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:27:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.2527.1709839649869370695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZSdLldV;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-21e6be74db4so714694fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709839649; x=1710444449; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbKiqf64zW2qqmBIm9yNZTu4K0V4oEOUEts18hQuuuI=;
        b=fZSdLldVz2/x+FSPeU1bW1cY507jzr8QWp6YDYfWqMsjKoFdPvYfPw6Lx/8bhIy+nU
         0LP/72CJc7ffKRW1VJJ/u4L6n+62BRpEqNhVufDONmjP+MOrA/0FrP2rvclHjd1QFiLb
         0TdYkhaLoICKeVlqKYus7+iXs3P8UyVARxUWhxQLfm8eyTOc1fsgtlC6LzCLMm4VrnYj
         vaKF5v3u6oz+zrfAWMwH9LHAuy9nK4xNWWVw7DMl4kFwJq3A0ScSi0TfEMg94ufI1a+1
         TZkaXBrhcjZ/hpGQeZf2uVGxyNQsaLDe4eGNqI/RGJgqTjTd8ie8xTw909ljbb+Ilbwr
         lMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709839649; x=1710444449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbKiqf64zW2qqmBIm9yNZTu4K0V4oEOUEts18hQuuuI=;
        b=Mc28KamxYwLXLrHqoaRcvfSY6Cm2cGi2IUXhu7qNkRzzTc0eG4HNFZ+Fju7MBd3MxI
         WCj+vpzYqI9e9TmLojGC7F/e2pek8XjTiTXBN6EuN5TddLffZr6l9M1jOwmfOAg32D/K
         bCnigg3EyOJQeGI+RMv2wWMe0Xrw+Fd+mJ2LowAF0PRDzX9vYu/gvB0TsasgrMMKZL91
         YBq9wqZ4KNQcbG80UZiryL0sKkIHBQ9dV/oYxSsoU3o/kJLhi49x+bzsvNOaO0qR0cFc
         JbEaOVQIp5Xpf5zku42NpffDEDEfqGwnusYEqTPG8w2HhptY7Dc7oqOSPbFJP8VjJqv1
         JyRg==
X-Gm-Message-State: AOJu0YxWx/Oqw5nRhs6TLPT9U+WoG7hMkODjWPiRK24DaSRGa5Xl+Wds
	xbUyjEhooQFEs5Y58b9qQ5JtRQ/Cx1id1ioPhDu5/QKX1S98dX6jpQDQLJoKYLZz6BTWYTOp+ZD
	vhWZ65z+Dps7VO89+/KMVbbc/egWTJN3O
X-Google-Smtp-Source: AGHT+IFI4t+XZbTxju5/CBO+On12FHws9RKJ6gqRDhSJkfQwoPcX4j9P2uYtjnINrwp2GZ70BOXiZNofmWf2uwElLWU=
X-Received: by 2002:a05:6870:ff43:b0:220:dc43:f9d5 with SMTP id
 qo3-20020a056870ff4300b00220dc43f9d5mr955784oab.47.1709839649100; Thu, 07 Mar
 2024 11:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20240307192009.24569-1-andre.paiusco@gmail.com>
In-Reply-To: <20240307192009.24569-1-andre.paiusco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 11:27:03 -0800
Message-ID: <CAMKF1srkVVZQz2KFi0YHMmq7ZC3y6Rkc-qQA=pGG04eSfPcLgA@mail.gmail.com>
Subject: Re: [PATCH v3] ydotool: Add new package
To: Andre Paiusco <andre.paiusco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 19:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109207

On Thu, Mar 7, 2024 at 11:20=E2=80=AFAM Andre Paiusco <andre.paiusco@gmail.=
com> wrote:
>
> CC: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  .../recipes-graphics/ydotool/ydotool_git.bb   | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..dd033208b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
>      xcursorgen \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "=
", d)} \
>      yad \
> +    ydotool \

this should also be covered by DISTRO_FEATURE check

>      parallel-deqp-runner \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "=
", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts=
", "", d)} \
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/re=
cipes-graphics/ydotool/ydotool_git.bb
> new file mode 100644
> index 000000000..2525ea70b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Generic Linux command-line automation tool (no X!)"
> +DESCRIPTION =3D "ydotool is not limited to Wayland. You can use it on an=
ything as long as it accepts keyboard/mouse/whatever input."
> +LICENSE =3D "AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deb1e647870add0502f8f010b19de3=
2af"
> +
> +DEPENDS =3D "systemd"
> +PV =3D "1.0.4+git"
> +
> +SRC_URI =3D "git://github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branc=
h=3Dmaster"
> +SRCREV =3D "c07ae72be46c40912023b91b8ba737630d8720e1"
> +
> +inherit cmake systemd pkgconfig features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_DOCS=3DOFF \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "ydotoold.service
> \ No newline at end of file
> --
> 2.44.0
>

