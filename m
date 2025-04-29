Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F74C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 16:55:55 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.3448.1745945747434568985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 09:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOhKsifr;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6021e3daeabso3255882eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745945746; x=1746550546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4rpdCTDF5JFxp+sNetL1Z56vgeUiD/l4R7YbyaD+Gg=;
        b=WOhKsifrhi97QMirMOF4ed/kIMuOhgVhZYDRSpBSzvFQeqJ0lpRzar8j4oJd9VZpeL
         yZ2hAaTk301QiVDKmV2+6aM85bCuhrbpvZQt4ZIxUbhfuAIiQIRhISxDv4ZTdq6GnE0D
         JAGH/SLST/+T+a//m1fEI67tgn+69aCu7LAs0KUWM4cdfBqAPbPGbdkxY6wWgIiZye1G
         OEd9N7kJqep6yu4glMF+iwcT3u+MrfwIjK2fijHJwQDnmwf9dwfBfzoD+iRUOqwNfHGQ
         gHs3uDetfvReSNMHI5t01nAT2oyqTftxMXHQTFIM224eCtBIrv1eHYVxjQ6+bsmJWgnO
         UNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945746; x=1746550546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4rpdCTDF5JFxp+sNetL1Z56vgeUiD/l4R7YbyaD+Gg=;
        b=s18NMvccaoQqaBxcw2WfS+8E+3cmNEfK1lmjBZu2IqNPS+3pCta4dPMkpmBqnGIHuQ
         nvc9/27CNlmkE2RSDVM+dKtCHarIcxKQKnwR+YGng88sjnMTa5SV89HdbfDXnI1ys38K
         SncxClqyWMjkZSryQmvcaTRn1yirBfk0OhYFJTCmqJr/qKfF2wY6krtm5Re074pV1z6x
         tlhplS+BIpv4Ni9iu8BCGNNF8fBXWYKDDgEIn8bSGciqtCBu3eC3vyR0SYeVfjv1rCXR
         aXj+izUE4/SnVXdS6rFmzNYx4TPKAh/X7kdRp6swiJdCgHrpn3AHWC9K6ogTtoEPBgLG
         6wTw==
X-Gm-Message-State: AOJu0Yw2azH1PS0vInnS/Tag5MADky0qUDPr25ZYyNrXJ1YavxIOVcBu
	jcrUMGSCsLYlLjQvIjgpSKbmtJZgfDnUTfMs4KJjYG4zUA1744I5IG853gtozqmdPd7MG/Ne2th
	CbWACsFT5eTMh2C3E50GOXXpvlbYydN3K
X-Gm-Gg: ASbGncubw2ewlBUaWkIvRhu01Qhvl3BPOhsn1hEjlhcc+f0vnsp8ybqfPP+jFk3r1pQ
	T68Y5HAx+aNCG5lOgugcfHed5egi0jyGZeJKRED37UfbQVtJHT2xujZpdC39SLGdHge6W2jHmSf
	Kqy8+fyWcoyXBkFHsIzPyo
X-Google-Smtp-Source: AGHT+IGJk998s6Rc2IzR+NltA0zBzoiQxzLIkBM/fywNaxww6ttsuoc3TFarFpQ8qGOUi3ten852MsuuW/C2DFpuWC8=
X-Received: by 2002:a05:6820:1986:b0:606:361b:52a6 with SMTP id
 006d021491bc7-60685e949e5mr1781292eaf.4.1745945746567; Tue, 29 Apr 2025
 09:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250429041052.11681-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250429041052.11681-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Apr 2025 09:55:20 -0700
X-Gm-Features: ATxdqUGdWWn-CBZSkma5CGN8ssE9dLYk3K08GOiYob9uO-3-_lvXChI9ZEaOwr8
Message-ID: <CAMKF1srzu=C_Mi5YUacP3p70mb3wPbtcfcTA_Qeq97eFeOyQMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 16:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117242

On Tue, Apr 29, 2025 at 4:16=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
>     - Simple, stable, powerful.
>     - Apply for embedded devices to PC, server.
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelo=
g_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

move it into recipes-support please.

> new file mode 100644
> index 000000000..8acf50fe8
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,20 @@
> +
> +SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
> +
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
> +
> +PV =3D "1.0.6+git"
> +SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117238): https://lists.openembedded.org/g/openembedde=
d-devel/message/117238
> Mute This Topic: https://lists.openembedded.org/mt/112517962/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

