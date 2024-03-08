Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19034C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:32:34 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.10844.1709861546679491220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCbQMYd5;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-21f70f72fb5so276999fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861546; x=1710466346; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5vYwInzF3tc2SyofNDGzov0o+vOELrRGCxQOQm22yg=;
        b=LCbQMYd596QhPgeqX6zrOpMcdgw8q8qBrT/kXRCWmqpMXg1kI6BniDnXTHqZ6w2hRf
         /JajrOyJSv5wlV0Hf0mrlXN8I6uUl0aXAQOCnyRC60B30ve/Lg1BPofVpepPrMDpOTI4
         jSCIndmZXnrrtg5Y3ID9UAP3CJsZ04wVQ2rPg6McTRjQGg6ERvVDgIkBP10S6tbQ8ynV
         UqLlidDDmNGdJ7C8G89kWweTiruIT8sJf3ZueK3PVAtZvh+Jz49ypvKjlxD7sHhNFJ9p
         qu0kDLMQdSsiSTxfzxAfZ2aathME1IXYK6+2W+L6rcR8PTpSNDPbFCBIEP6BrNGF4T0R
         u8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861546; x=1710466346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5vYwInzF3tc2SyofNDGzov0o+vOELrRGCxQOQm22yg=;
        b=IPFe9nCgYYcp8an3AjRNUim+ex+gnu1zd1eyZp8dHyLaTmjHEo2AidRRCmOyNoA8Qa
         8YVgT3j57/hhzD6o7aSIlbkW4ONiZ25gMABll4gR7Q8zAyW1dWjmypixb+ir9JGdmk+Z
         7EQafByrKx21aCnL8bpF4VLqk5z7+LXCcve7PHZqaKvgNzts34D/SOek7RL/grLt9pHl
         orirFZWd8XNx0fEOJhOwE22TIwKn6GfHzCwhAewZB1XxHKn3MyLi2qzPkF9HomuMpixL
         BbNjVOjwV24NwK6vsY2FomDXg1hw0+xhjg0wLYTHRpph/BM8aMkZ24vNJtlGBSWRHbiS
         8cNQ==
X-Gm-Message-State: AOJu0Yy318OiqxuyHKa/ruqfK1GKquLG7OqKjDX03wE8nJyNHgswN0vU
	lGmsbccNGQLG8Sxsze7gA9zmRorK7dFwxrT30vjcqE77J0S4DQYlwl1dHwhjrYAair8uNRoka6s
	BDz3bTuCSxv86tljoq306WvFSvsI7OuEH
X-Google-Smtp-Source: AGHT+IFWB8GnOLxQX6dGmSpMJrI2DuPM8JKTBGcmCcT8EX5beC5tw1Aj3+d7kMmgOhTPagpuB8064TG3mcc1PmnsV60=
X-Received: by 2002:a05:687c:3414:b0:220:d07a:fbc9 with SMTP id
 le20-20020a05687c341400b00220d07afbc9mr1083576oac.59.1709861545929; Thu, 07
 Mar 2024 17:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20240307200746.26808-1-andre.paiusco@gmail.com>
In-Reply-To: <20240307200746.26808-1-andre.paiusco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 17:31:59 -0800
Message-ID: <CAMKF1sq8qy4zA53gTgFq2FZpZ9zvbNjpPY3DnycOVN=yFvW2xA@mail.gmail.com>
Subject: Re: [PATCH v4] ydotool: Add new package
To: Andre Paiusco <andre.paiusco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109217

On Thu, Mar 7, 2024 at 12:07=E2=80=AFPM Andre Paiusco <andre.paiusco@gmail.=
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
> index 6e2012dae..16d919cb6 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
>      xcursorgen \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "=
", d)} \
>      yad \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ydotool", "", d)=
} \
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

this is an unterminated string, bitbake would have told you during
parsing. Please test the bits before sending for review.
It saves time.

> \ No newline at end of file
> --
> 2.44.0
>

