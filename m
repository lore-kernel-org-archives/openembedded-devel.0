Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FAEFC616A
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 17:47:02 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.79695.1726249612728090568
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 10:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iEIHWnRM;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5daa93677e1so1242839eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726249612; x=1726854412; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lq4de63ma74tm+GaBPKLB7Io9lAxKFNl+O1OWzlNgI=;
        b=iEIHWnRMfdjpkRxe5zl15YgtkTdtbEfRfLns9JHnxuQGXEOebQcniJBNYUacI/ktNA
         LU7swr4lJ1oF/iJusWNAn77ZWvZSdgThqy+wVA5ey3WBPlqCW/engribsMddP5QafnQ5
         kPao+meWidJu2mXfyn1Mul7eyxeeMQD3wx1f2qEkhqVAqrJNmZQRI4d2hGZJyPnkMIav
         6y2S3RIV1T+spbuuUTH/UmWlXChpfpeMBBLAJqjOdsalbs+sSPMOjueh6nPSwHWgarUw
         KmkGIGDF3VChbGOkBI/gwaLsf4V2u2ToJ7Rz4HXTZt2Sd2uEGUXT+Qan4wVKx3MdfhOA
         RRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249612; x=1726854412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lq4de63ma74tm+GaBPKLB7Io9lAxKFNl+O1OWzlNgI=;
        b=EAkn2yk+x3xDQYmiOg8Z9/NM242qQ0i7q/9cbWiN17Ri4lYHRkE/tkNtyXtpvl1f7P
         eThYHtfcxWzG1RpxST0X8PhQN5pMcMgZBxIekuGHWYjrOvVIndeHsei72hh+dNdulIPs
         YN/Bja7+CFUKm8K5EvCYxy0gQlSJtJyjD13AHuNu7npfOO8ZHlRS29INGPSwax1MRphb
         ShjmmSssR73h57q+YG7Afm8QeoFb53tqJanf40uuNOXqjA7O6QUb27AggILWFS72dYD2
         WuOi8naYpFgPKhWiwFDkcVkw2CsGsvsrQ5U2R49jTbAysuOE4YrFMinHHAq4Z2LENKlE
         gsdw==
X-Gm-Message-State: AOJu0YxhIYQTitFEX7xmHQsmU0Jwc9C0cLCmRq++qbuJjGsvSyxAaXSE
	CYyrAR/edJIxACqT2Grf2aRdo5edVX5+T0VrU6ih9E+PU/7u0KuC+zz2Nki4wzUYYFfaQdofUjk
	OpRw2SzObH87m6PI99dZwUPh2zZE=
X-Google-Smtp-Source: AGHT+IEyvNczCVTEvBQNzgJ/ZaIMEhAXLqDtIbWEhNRcFDATqE5yMRzZnYQuT31oMdzXwacZjrhXE9/tLWoAQjT4MWg=
X-Received: by 2002:a05:6820:1c85:b0:5e1:e65d:5146 with SMTP id
 006d021491bc7-5e2014359c7mr4217245eaf.5.1726249611860; Fri, 13 Sep 2024
 10:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240910145244.1238276-1-martin.jansa@gmail.com>
In-Reply-To: <20240910145244.1238276-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2024 10:46:25 -0700
Message-ID: <CAMKF1sqVpzj6ufAsozTcE1LFry4S0bAvZohkqGBdMnPA658P7g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nmap: depend on libpcre2 not libpcre
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 17:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112275

this exposes an issue, when linking with lld linker ends up with

riscv64-yoe-linux-ld.lld: error: unable to find library -lpcre2-8

On Tue, Sep 10, 2024 at 7:52=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * switched to libpcre2 in:
>   https://github.com/nmap/nmap/commit/828ab48764b82d0226e860c73c5dac5b11f=
77385
>
> * in builds hwere libpcre2 isn't pulled by some other dependency it was f=
ailing with:
> | service_scan.h:74:10: fatal error: pcre2.h: No such file or directory  =
                                                                           =
                                                                           =
               |    74 | #include <pcre2.h>                                =
                                                                           =
                                                                           =
                            |       |          ^~~~~~~~~|
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-security/nmap/nmap_7.95.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes=
-security/nmap/nmap_7.95.bb
> index d3273dc4e9..79c28e71f0 100644
> --- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
> +++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
> @@ -17,7 +17,7 @@ inherit autotools-brokensep pkgconfig python3native
>  PACKAGECONFIG ?=3D "pcre ncat nping pcap"
>
>  PACKAGECONFIG[pcap] =3D "--with-pcap=3Dlinux, --without-pcap, libpcap, l=
ibpcap"
> -PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --with-l=
ibpcre=3Dincluded, libpcre"
> +PACKAGECONFIG[pcre] =3D "--with-libpcre=3D${STAGING_LIBDIR}/.., --with-l=
ibpcre=3Dincluded, libpcre2"
>  PACKAGECONFIG[ssl] =3D "--with-openssl=3D${STAGING_LIBDIR}/.., --without=
-openssl, openssl, openssl"
>  PACKAGECONFIG[ssh2] =3D "--with-openssh2=3D${STAGING_LIBDIR}/.., --witho=
ut-openssh2, libssh2, libssh2"
>  PACKAGECONFIG[libz] =3D "--with-libz=3D${STAGING_LIBDIR}/.., --without-l=
ibz, zlib, zlib"
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112233): https://lists.openembedded.org/g/openembedde=
d-devel/message/112233
> Mute This Topic: https://lists.openembedded.org/mt/108376191/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

