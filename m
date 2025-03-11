Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0332C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 17:52:32 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.16874.1741715544097074802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 10:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tca4ebPr;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so2073380b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741715543; x=1742320343; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj0EfNEtdZML1DRmojhc8bJEvX/YyE1othzftSFrtvg=;
        b=Tca4ebPrS/NePcNSecGP/hukS/Ui7MpRFgELOF0YIn1n9uM4mKY43YOu3M2JAvnIzF
         spIVVxYPA19Mqm1OjKoY2pz7RNfa6URDkezJ13cxvIcGZ6O/wawINUUnFGkOkJk1kgbw
         dv/DCK1NP/i3dhk1VadgztYloJHxWPxObGlOtLEBpvv/YqxLgra4p480lnUAQFxWAsWl
         CpW1FDQ3DDONgoduif/hu1Y22zSZQI/kfsB2iYd5wSY16b5+tehIPt66jZfKl3UbmLuE
         CpL1DvQX0VOM7U/RK/oEz9Oi919Hz8VpxFp42addnDXJH+ZXUKKsDtYBLUhGhtTaNuzc
         MERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741715543; x=1742320343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj0EfNEtdZML1DRmojhc8bJEvX/YyE1othzftSFrtvg=;
        b=U+CB+uHA1oYhnksmlOuk6Z/cu/cy0imwbcFAkL4Klp/NVJOcxrXHKOkB9vUbQzhEM/
         Mhvd11ZlvB0Hspvqrx7HdPL4wTKb2VIaP4nmaIgA5R3AlQO8tcRbSgtyLcASYx6c4j64
         NMOcR34hVfbc1TSuBoO2l0JNXv4jkdzc1bOCXicdL1Jcd5Symbd/ouajmNtnG2yW6wcZ
         gCrTTpltZhhXISXIqd92gXYu/19MfQBKGm1R99/Fk6rabW+3V2E+rrXg1aL3XbeDPN8l
         /skV/viKLZKtSNT8+XaVsCmKKW+PdaJXwrL4JjsGkrQ3eflJjU/3PzFIJYMInrn3CgqB
         9SMg==
X-Gm-Message-State: AOJu0YzrmHHA39AsVFoZgtcH4xAJ9cr2xAw6unJO+vzjbMN0kc++VwBE
	iGLVqbJVUugSVmBcOA3CeEKwJO4HQxga2KN4EzVK5ew+vjlIY/t/gc8HoVE2I84U/2OOQzRQcOB
	kGRMVV+W1DYJ0AVotDfGg7EkgfVg=
X-Gm-Gg: ASbGncvuAtHvwespMpICSc+3Q/2M4+mSe9aLZFJotPvPXmYsiIie+W1Oi1T/9UVZ7ZI
	WbK2awu+TThLtwSX9slpnLxOqli4CMP2v1vzuBuFcSNsKjZG0ENlJrjm+EYw/7xrdZi/UepbAiW
	DpGwyoNiWKHomiZ2ZKCOO3rsXSAfibKHkFrDfEM03ePiQGgmiXGDF2V9E=
X-Google-Smtp-Source: AGHT+IFU3GZHHDbuxFDJHeDLvEWOibf3MefsdIq/8q27htPhY2KBmDII2nLpjVAkMqUINKw6RZ9PHMzrzbyAMlADi10=
X-Received: by 2002:a05:6808:2013:b0:3f8:c486:9b27 with SMTP id
 5614622812f47-3f8c4869e0emr5248747b6e.22.1741715543307; Tue, 11 Mar 2025
 10:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com> <1741683310-8681-36-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1741683310-8681-36-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Mar 2025 10:51:56 -0700
X-Gm-Features: AQ5f1Jo3eCyr5eLrDiUHMdRWNiz6ucKS7quJ95iIv11jpeJkAbDgxJzPq1IGCqw
Message-ID: <CAMKF1spe7GkQPmJ+WS-j50aAqbBrQQo=cwv5J=x+a4AP0TKD0g@mail.gmail.com>
Subject: Re: [oe] [PATCH 36/36] zabbix: upgrade 6.4.21 -> 7.0.9
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115895

On Tue, Mar 11, 2025 at 1:56=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> branch 6.4 is removed.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../zabbix/{zabbix_6.4.21.bb =3D> zabbix_7.0.9.bb}            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.4.21.bb =3D> zabbix=
_7.0.9.bb} (92%)
>
> diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb b/meta-=
oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
> rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
> index 4bfdecbf6d..b9c4fcb3b2 100644
> --- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
> +++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
> @@ -18,16 +18,16 @@ multitude of servers."
>  HOMEPAGE =3D "http://www.zabbix.com/"
>  SECTION =3D "Applications/Internet"
>  LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D300e938ad303147fede2294ed78fe=
02e"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb1e647870add0502f8f010b19de3=
2af"

What changed in the license here ?

>  DEPENDS  =3D "libevent libpcre openldap virtual/libiconv zlib"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> -SRC_URI =3D "https://cdn.zabbix.com/zabbix/sources/stable/6.4/${BPN}-${P=
V}.tar.gz \
> +SRC_URI =3D "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${P=
V}.tar.gz \
>      file://0001-Fix-configure.ac.patch \
>      file://zabbix-agent.service \
>  "
> -SRC_URI[sha256sum] =3D "527010dbd45cf204dcd3b38e82df696b908b74f38e8d1ab9=
bbbb1292e784f394"
> +SRC_URI[sha256sum] =3D "8d7755576f30b5d6099ff5e3574549fc248229c017f97538=
28565174125069f6"
>
>  inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115887): https://lists.openembedded.org/g/openembedde=
d-devel/message/115887
> Mute This Topic: https://lists.openembedded.org/mt/111636529/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

