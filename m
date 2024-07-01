Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C793C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:56:06 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.22206.1719845758383182303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jEq7kQIp;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-24c9f892aeaso1487333fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845757; x=1720450557; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX8QlJO4src0d8Npp/FkySb0Ji0Mz0jGXxOviwqeyzw=;
        b=jEq7kQIpNW66lrhrAKULmwckN+TZ8fKxhqJkzG1qEe9f84BPlJco49xx3ln5GW/WvP
         2pDv7Za1XVC/NhcqO8XcazsgdM0hBs/HsIqJMDI2U3LEkytFCZDzVdgW8qVjkNhr5gzJ
         22ywUxCBUPVwcUEdnXylZMcPxLnCCgA8QOCl0tvNlRAVc3BAAekZo+mcf28oe0cI0bHD
         tAgqFl+5ATZH4V6fe9SRTnaSQqMDDaWVxUP7OSduffP6TioIFwWHX4fJO+lWX+SDQmt4
         z/tZKicvygVQZdYLUtakhYXVBrNMTWxie7GfozTQnqRTMp8d6c/oht0OYlYxVP6SHd7+
         KEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845757; x=1720450557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX8QlJO4src0d8Npp/FkySb0Ji0Mz0jGXxOviwqeyzw=;
        b=u/erFZNmOk72vSyA2O0rm+Uk0tEpm4qzsj9YjLh6WoqzVssS88Ve+UlJTcXkK3Fm55
         43gMeaHsXYvI3mL7QiT9HaCaehILzjWbf7vYCzLpYTR3BT1z+9ORo6Ry67YGaupa2SPz
         q5VmTEPnvAe7ACXFqiHkey6IjOCVefgAB1It6FbYXpTp4VqoDD+FyDNyNpw4NUkjw6lu
         MuzjETQ13TijMX7M0OmyD6xpdcWPOuq0cij8c5XASfVRQg4E6IrQxzD8Y1h0XAAZ1QVB
         vnbz2dSfCWrhN3h0+G2D0kqpqmNnXyx2DuF+p5ogg7tMhsbiX+V355RD2tntLmnwTQN0
         l5eg==
X-Gm-Message-State: AOJu0Yx1l4vvhbCTKb5d00ETuLYyNgKXNtZoZqKF8BX6Pslf72zlvfgc
	BbAztokOqu1EQwJahTChfbNxXT/S97EvxUNLScrND1vnaTvbqUjF+cbX2UjeEB7Y4302L8HqO54
	HCx7kYgys5wffPoXQ9N3oFlujWBg=
X-Google-Smtp-Source: AGHT+IEhGJPWRFVVHHAl+IwZux+5hMDznoOVex4FSfPzKxbHVkMXb4NyWcC01KsHPhdlVHWW7wbvq4gKPDPWJLn87ko=
X-Received: by 2002:a05:6871:68b:b0:259:8321:243b with SMTP id
 586e51a60fabf-25db34441e7mr5776348fac.24.1719845757495; Mon, 01 Jul 2024
 07:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <3aa77b79-b7e9-4cc0-9e7b-592d48720614@gmail.com>
In-Reply-To: <3aa77b79-b7e9-4cc0-9e7b-592d48720614@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2024 07:55:31 -0700
Message-ID: <CAMKF1srvV_Y04Qa3toZX23uADe9GYian0+ym4osuRO2-Xh_kXQ@mail.gmail.com>
Subject: Re: kirkstone merge request: July 1st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 14:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111200

merged. Thanks Armin.

On Mon, Jul 1, 2024 at 4:00=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 8e297cdc841c6cad34097f00a6903ba25edfc1=
53:
>
>    nginx: Remove obsolete patch (2024-06-02 15:16:32 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 6ff0748a4741517519a281985fc3cd95dadb633e:
>
>    php: Upgrade to 8.1.29 (2024-06-27 11:32:38 -0400)
>
> ----------------------------------------------------------------
> Jiaqing Zhao (1):
>        rdfind: fix build with gcc-13
>
> Meenali Gupta (1):
>        openvpn: fix multiple CVEs
>
> Niko Mauno (1):
>        nginx-1.21.1: Drop reference to removed patch
>
> Peter Marko (1):
>        gnome-shell: correct regression with glib-2.0 fix for CVE-2024-343=
97
>
> Randy MacLeod (1):
>        python3-pyyaml-include: support native and nativesdk build
>
> Rob Woolley (1):
>        sip3: Fix segmentation fault
>
> Siddharth Doshi (1):
>        nano: Security fix for CVE-2024-5742
>
> Soumya Sambu (1):
>        php: Upgrade to 8.1.29
>
> Vijay Anusuri (1):
>        yajl: backport Debian patch for CVE-2022-24795
>
> nikhil (1):
>        giflib: upgrade to version 5.2.2
>
>   .../0002-screencast-Correct-expected-bus-name-for-streams.patch |    38=
 +
>   meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb |     1 +
>   .../recipes-support/openvpn/openvpn/CVE-2024-24974.patch |    49 +
>   .../recipes-support/openvpn/openvpn/CVE-2024-27459.patch |    99 +
>   .../recipes-support/openvpn/openvpn/CVE-2024-27903.patch        | 119 +
>   meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb |     6 +-
>   meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch |    40 -
>   .../files/add_suffix_to_convert_binary_used_in_Makefile.patch |    42 +
>   .../giflib/{giflib_5.2.1.bb =3D> giflib_5.2.2.bb} |     7 +-
>   meta-oe/recipes-devtools/php/{php_8.1.28.bb =3D> php_8.1.29.bb} |     2=
 +-
>   ...-the-py_ssize_t_clean-argument-to-the-module-directive.patch |
> 17433 +-------------------------
>   meta-oe/recipes-devtools/sip/sip3_4.19.23.bb |     7 +-
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch |    61 +
>   meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb |     1 +
>   meta-oe/recipes-support/nano/files/CVE-2024-5742.patch          | 100 +
>   meta-oe/recipes-support/nano/nano_6.2.bb |     4 +-
>   .../rdfind/rdfind/0001-include-standard-header-cstdint.patch |    41 +
>   meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb |     1 +
>   .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb |     2 +-
>   meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb |     2 -
>   20 files changed, 594 insertions(+), 17461 deletions(-)
>   create mode 100644
> meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-=
expected-bus-name-for-streams.patch
>   create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
>   create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
>   create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
>   delete mode 100644
> meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
>   create mode 100644
> meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_i=
n_Makefile.patch
>   rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb =3D>
> giflib_5.2.2.bb} (72%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.28.bb =3D> php_8.1.29.bb} =
(99%)
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.pa=
tch
>   create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.pat=
ch
>   create mode 100644
> meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-header-cstdin=
t.patch
>

