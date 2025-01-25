Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE38C0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 17:32:37 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.14514.1737826354206622725
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 09:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AnIAJPM1;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29fc424237bso2153183fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 09:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737826353; x=1738431153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54pnYa/NcKrweV5X3gfUv3m7u8Tsy2nP51PbZ1PMp30=;
        b=AnIAJPM1DXNIS/lPnkkqzRwMNvIvRi3S1JP9pAw10eJxRO3La3NwtbJe/5XfX2s/MD
         IgMGikMuq0xe6r7PQuUqojJBVzn0hCjcs5CsKbYckdKubD+WbvzwoCIkN8OjR8ZqpI/d
         QYOnm1Dn6ivDbzXA3rtSNJ0Gn1ObC+WqhkkQ6pRycnTKVOOgKGVBR3ebV54YLPgtVMMo
         l5Pa3rEq74rDmdwvNbxA1luyJcnipa8xJXnic1LsZ3fQeyGr3lVJyAyWQ5Q8REiEh0GW
         xXvVR7Iddf/MsbwXCs8YpiPljzx5otPSBicBmrjmNWyNo83XMuQUfaHkzy3RxmGVxfh6
         JtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737826353; x=1738431153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54pnYa/NcKrweV5X3gfUv3m7u8Tsy2nP51PbZ1PMp30=;
        b=PPBnTHGw9EWBWhXAbtsSsxcx20qNM54nD7CFyiRx6bg/+I2hzGFq9Ec+jx/HX4am/V
         x2VaMteIxesRJp7W/rCB7LAkohFxAPfF+VsdJqYSsKIDNgaaB2Wt71A9cQhdG5YkqHO/
         NLRbm+L3LqNEYeYxFZwLgS5Rfcl6MUi/klwm2GLvJcHL//jTqNlOKbpkMPfJ2JdmGYYw
         xR4jr0ow62nY7Jd9fHbfWUIQOzG53SsyuMxmW7XARiRR8XrpEBPeqHN9TFCSinu+9RAd
         DrMtnBkIuNPuuPzg7auyasu4F6x8oSQFAx2mGOrgVXMRn0/N7pIHGbhCMYr3T4axhqvZ
         UwvA==
X-Gm-Message-State: AOJu0YwPBmGssJ84ZHpW4tCnJakwBiPUZLk3WK9uKdrYRdQjkxqsOm1P
	HvHJ1cdl5rhrIaTdEKeAXExFKAzb+/Rx25BEJJai7+Vj+wq7kd4TqUzcoYXN4/5krcrHWSksgeL
	M6JO1q3HiRVuM0G6EOTqoxDNmol3owuKAjL4=
X-Gm-Gg: ASbGncu8UQueABsrwHV42cihf60QrDmOIw6Fi7eV2PNfQwpMKWnF3lgVb8Sfu6ybcVS
	UmwdT6QvXvFqz3LvFw2xFlD65vyIDtCNNw+CTHOrJzJ1evvvdRbmVTZrh2DBpQUKg6ZZYwJA8wC
	AdzYAYvz3ozak=
X-Google-Smtp-Source: AGHT+IHWJbAAre+VQKlRU6Ke3rFiDdc6H8xyAVIbhWPr+JpSNbgzFHL40q3DaKEmEMoZV7PIcMYb36cMz1EoQgpEk2g=
X-Received: by 2002:a05:6871:53cb:b0:29e:2bbd:51ba with SMTP id
 586e51a60fabf-2b1c0a1c13fmr19780020fac.9.1737826353458; Sat, 25 Jan 2025
 09:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20250124143401.1635224-1-ross.burton@arm.com> <20250124143401.1635224-2-ross.burton@arm.com>
In-Reply-To: <20250124143401.1635224-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2025 09:32:07 -0800
X-Gm-Features: AWEUYZkTSpDgI18EtZmK7n0J1BRejW5TWKMIh7mq3hWN0-qKEpQOpmofEjIimQo
Message-ID: <CAMKF1sqAZvPjF-fS=4KX5B2j2UYHJxP+BxeFHQoD_wYu6yo1TQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/4] php: cleanup autoconf fettling
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 17:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115083

this fails to buld php-native

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1287806/raw

On Fri, Jan 24, 2025 at 6:34=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This autoconf manipulation is very old and appears to be obsolete now.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-devtools/php/php_8.2.26.bb | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes=
-devtools/php/php_8.2.26.bb
> index f5e57ab36a..f2363c8e54 100644
> --- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
> @@ -136,10 +136,7 @@ LDFLAGS:append:riscv64 =3D " -latomic"
>
>  EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
>
> -acpaths =3D ""
> -
>  do_configure:prepend () {
> -    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
>      find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=3D.*!APXS=
_HTTPD=3D${STAGING_SBINDIR_NATIVE}/httpd!'
>  }
>
> @@ -162,11 +159,6 @@ do_install:append:class-native() {
>      rm -rf ${D}/${PHP_LIBDIR}/php/.[a-z]*
>  }
>
> -do_install:prepend() {
> -    cat ${ACLOCALDIR}/libtool.m4 ${ACLOCALDIR}/lt~obsolete.m4 ${ACLOCALD=
IR}/ltoptions.m4 \
> -        ${ACLOCALDIR}/ltsugar.m4 ${ACLOCALDIR}/ltversion.m4 > ${S}/build=
/libtool.m4
> -}
> -
>  do_install:prepend:class-target() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false',=
 d)}; then
>          # Install dummy config file so apxs doesn't fail
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115063): https://lists.openembedded.org/g/openembedde=
d-devel/message/115063
> Mute This Topic: https://lists.openembedded.org/mt/110790897/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

