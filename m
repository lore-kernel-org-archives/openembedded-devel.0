Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C37C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 22:17:58 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.37445.1744582674737778704
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 15:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3tzwRkB;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so1972333b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744582674; x=1745187474; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVKdnB/kgPK4VPweYVqu5pit9zCXnulTRQHub1FhwZk=;
        b=d3tzwRkBHo/3FZtGaf5khXUILuFBsIyOp24OCcRTMDPe0xWGV209+cQKlvZB1QSXjM
         45/wHElCaqc7Mhcc1RuAdko2qeepYJB26Iu5Xel3sYPeNxig+ft5z3Qkjy4E2DZhuojM
         WY4XdC4GX5oXUd+JSnINwaSPie7dlWAu6dxg+QvwKSJpaR+ie5LJJ3wRFhSr/aMJ/1Om
         rRXZvdY7R2s14N+r7/lJmDmZEoiYnpIvm+nmfZNqif50uwmurqC4oO+ZuT0JnYGyFt5K
         2naqbSzhuYwzcqzdFU5Q+ZmscleCBgxHhq4UM8i5IfXM8qb5uTYGoDib/w7mFmu1BFFi
         IHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744582674; x=1745187474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVKdnB/kgPK4VPweYVqu5pit9zCXnulTRQHub1FhwZk=;
        b=kdeO2WtR+DxUjpx41SAWRFK+3S6B5TetI87qfXOt9xwSB8b6yMX5LgOHJFI2l8bbKn
         GUuzNDFbIEAF2Ri2phphaW/7j56nMrEfSehu50Sc7Itizl9fq7IobBpA2STXPHx6+T82
         MdxQKpnvAzR7Bf9smzTqRd7hlzxkANHMK6HWgeVCDaiQ4nVxZmHWsNLT9qgFnT0G70Ay
         XKiIz3nCY8qELru8GRAG0n1r3XrTaxBiQsBO3f9ExeD1K6s9uWwUjphrV4qJFbgQ/1ps
         GEh5nXMCCDlne/qg4PACPYesJLDR9NFfqDG6TReeijvbxImFoo6PNixPUWYuXBOpYz1j
         NeXg==
X-Gm-Message-State: AOJu0YwVPHutTWcUGSNutAU5ofCN/vf2DVM04/lCXT53Hjz13hndjj6I
	qLhRrU10am5JQRG6AgQK4QyAv/FdAHWuflGvA5PaRqLikniqDedp+EG1Niv9Z8G4npB/2cRYowe
	DnFBXuDvc3BIYdeglk+XLDadRDgI=
X-Gm-Gg: ASbGncuQPz46iFhQB12QS9m4neSzMpRebNL5KHBwmoHN+S+1I4vZ+EjiedN8GI69AGj
	CvC9r9rgqe/0EbweOE9W6q9ML2+Gmlc4XY/Gybc6tJJAF/SK4Bl3tq07E/VmFenC6iUhNKCpxXN
	lmKTD+K7XIvca8geAz0IOi
X-Google-Smtp-Source: AGHT+IFwXWWyrUfLhGPCA4n58g4VT0gQ7WF7hZ3c758VtVdRsfLpkAYJQ+nnxVYzZditIUBwVHwa8ACzheuYbnl6T2o=
X-Received: by 2002:a05:6808:22ab:b0:3f7:e1f6:20a6 with SMTP id
 5614622812f47-40084e395a3mr6130970b6e.0.1744582673697; Sun, 13 Apr 2025
 15:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250413160127.57261-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250413160127.57261-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Apr 2025 15:17:27 -0700
X-Gm-Features: ATxdqUEnylDk6kY5bVWC4Z1fEq3Bhn4k37KxZ90q03-KPQbwalq4AXIwNLH-biU
Message-ID: <CAMKF1srHK-t=yyWDMBN_kv2dbhu8+WgE4BGVQa9AZ30E+YkMEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] 1. libsimplelog: add recipe for lightweight
 high-performance logging library
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 22:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116837

On Sun, Apr 13, 2025 at 9:17=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> 2. libsimplelog is a portable, minimal, and extremely fast logging librar=
y written in ANSI C.
>
> 3. It supports multi-threading, high throughput (up to millions log recor=
ds/sec with PC 8 CPU - see report from README.md)
>
> 4. And works on embedded Linux platforms without external dependencies.
>
> 5. Follow KISS principle.
>
> 6. A Tribute to W. Richard Stevens (1951 - 1999).
>
> 7. This recipe adds libsimplelog to meta-openembedded under recipes-suppo=
rt.
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelo=
g_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> new file mode 100644
> index 000000000..7a27fd302
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,26 @@
> +# Recipe created by recipetool
> +# This is the basis of a recipe and may need further editing in order to=
 be fully functional.
> +# (Feel free to remove these comments when editing.)

Remove these comments, they are autogenerated for author to improve
upon what recipetool generated for recipe.

> +
> +# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best gu=
esses - it is
> +# your responsibility to verify that the values are complete and correct=
.

delete these comments

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
> +# Modify these as desired
> +PV =3D "1.0+git"
> +SRCREV =3D "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
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
> View/Reply Online (#116833): https://lists.openembedded.org/g/openembedde=
d-devel/message/116833
> Mute This Topic: https://lists.openembedded.org/mt/112243212/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

