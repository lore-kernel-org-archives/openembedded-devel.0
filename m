Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DD5E7E62E
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 12:08:02 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.17391.1695730077086344545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 05:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lEoqG/SM;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50336768615so14823296e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695730075; x=1696334875; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2hvm+FFVI2znxGmdEBEhsib6xD78SusRd9Hv3r2izE=;
        b=lEoqG/SMa9DTMaj0Ubydm+49srA5z/rXnN/upXi1hS1zir10jEz3lNLAnD8pvAQhmd
         vg7qP6fyvFvxDh5y16cZd8RPtEKnzU95uUVC4u0cjDav1NCzAA8rKynicnjRxpIPOikH
         n4+6Opw/jhBaXqa1XppcpgTxG/mYYfiNsRMGebOuzaSWrJIuSgX5b5KGdAsZUmZ9sx0f
         MpWpKzHBUNY8xi09Mv8uvJ5aEXrfVDdFt8HexMXFHxjqwoPIPG0MCCvSenaz524ki/A7
         RqkoNx6myU1sV5jHyx3/XMe1UneMdEnersL7gsmLdwISK81VKdcu7CA26ysu2FkWsYBE
         Zy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695730075; x=1696334875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2hvm+FFVI2znxGmdEBEhsib6xD78SusRd9Hv3r2izE=;
        b=sxHv4BbGzcG0JeSKflnC6EbgAase8U/DC4q6os/PPvqdOS5+wBI4vP6sP9/G3BT/6O
         DGJrpxakxjCh0kRpHmmqHXyNGhxbrAglwEV3rDk9qx5JluSWvSKjDWPhbjrc+FfuX/zT
         ZJkNzErO/rdM18cDNXAsmD4EuvIxMhXaAg1ubuBzpATRVao5Yvi19gxcdtPhoNaBnblx
         6C6b4++fdlLtA323xsb0ALVS6/4VBLld96Yo4TlVkGIE6OlVa84rwixdy0/zhrKUFGBd
         l/0POjPgyYRZUpipoYumD9Uy+Mia6q+3Wd7pukK9aDL37Tt7ol3boDIZiCf4Pd0I+U9g
         PzEw==
X-Gm-Message-State: AOJu0YzRzsJgPgxMHU8C0YpFQ8pexb4f/GLaFwphGdngKujKXdrSk2qL
	pkWLYVkY3dXjSnCV7ogx6kLq1aglxPgBNe8ftRU=
X-Google-Smtp-Source: AGHT+IEunQ+QtfY2h4A4uHKDNxNsnhnXRmuKm335Z9HxkxH0eWbko/3CS06VoKPddaqn62sXvamZNywUYpBtZFhkc0U=
X-Received: by 2002:a05:6512:308c:b0:500:94aa:739c with SMTP id
 z12-20020a056512308c00b0050094aa739cmr9281169lfd.61.1695730074855; Tue, 26
 Sep 2023 05:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230903160349.2052956-1-raj.khem@gmail.com> <20230903160349.2052956-2-raj.khem@gmail.com>
In-Reply-To: <20230903160349.2052956-2-raj.khem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 26 Sep 2023 14:07:39 +0200
Message-ID: <CAJiuCccneOO_KjHK_G8v8Ak1s4D6ZyytEPzWpZ99NxKQTmfsiQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] networkmanager-openvpn: Fix
 build with lld on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105142

Hi Khem,

On Sun, 3 Sept 2023 at 18:03, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-script-Do-not-export-_IO_stdin_used.patch | 30 +++++++++++++++++++
>  .../networkmanager-openvpn_1.10.2.bb          |  2 ++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch b/meta=
-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001=
-linker-script-Do-not-export-_IO_stdin_used.patch
> new file mode 100644
> index 0000000000..eafd497ae2
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
> @@ -0,0 +1,30 @@
> +From e09ba80e342b3b24bb2a46e11dae1c30cc61c75c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 3 Sep 2023 08:48:42 -0700
> +Subject: [PATCH] linker-script: Do not export _IO_stdin_used
> +
> +This is glibc specific toolhain issue, it should have been handled in
> +toolchain instead of exposing to applications. This was done to fix
> +
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D835550
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + linker-script-binary.ver | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/linker-script-binary.ver b/linker-script-binary.ver
> +index a2780c0..f030d35 100644
> +--- a/linker-script-binary.ver
> ++++ b/linker-script-binary.ver
> +@@ -1,6 +1,5 @@
> + {
> + global:
> +-      _IO_stdin_used;

This gives me the following error when building for qemuarm64 with musl

/test-meta-oe/build/tmp/work/cortexa57-poky-linux-musl/networkmanager/1.44.=
0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch=
64-poky-linux-musl/gcc/aarch64-poky-linux-musl/13.2.0/ld:/test-meta-oe/buil=
d/tmp/work/cortexa57-poky-linux-musl/networkmanager/1.44.0/NetworkManager-1=
.44.0/linker-script-binary.ver:3:
syntax error in VERSION script
collect2: error: ld returned 1 exit status

$> cat /test-meta-oe/build/tmp/work/cortexa57-poky-linux-musl/networkmanage=
r/1.44.0/NetworkManager-1.44.0/linker-script-binary.ver
{
global:
local:
*;
};

I am on top of master of Poky

Regards,
Clement

> + local:
> +       *;
> + };
> +--
> +2.42.0
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openvpn_1.10.2.bb b/meta-networking/recipes-connectivity/networkmana=
ger/networkmanager-openvpn_1.10.2.bb
> index 3114731f2a..024ef39361 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.10.2.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.10.2.bb
> @@ -10,6 +10,8 @@ inherit gnomebase useradd gettext systemd
>
>  SRC_URI =3D "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${P=
V}")}/NetworkManager-openvpn-${PV}.tar.xz"
>
> +SRC_URI:append:libc-musl =3D " file://0001-linker-script-Do-not-export-_=
IO_stdin_used.patch"
> +
>  SRC_URI[sha256sum] =3D "62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945d=
ad4adfb56d076d21"
>
>  S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104702): https://lists.openembedded.org/g/openembedde=
d-devel/message/104702
> Mute This Topic: https://lists.openembedded.org/mt/101132829/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

