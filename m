Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAD7C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 03:30:10 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.23410.1739676608682430409
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 19:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFDn0YGJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2bc5212b2easo1248146fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 19:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739676608; x=1740281408; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmE4kKkOgoe09cSAmYqjQfn9ukv5FizAQDyWO0AfJ7k=;
        b=JFDn0YGJmfHmMhdqbbr6NTJZ2TMihUpqlK4FfR0gDolUB9mlHFZc6mowqjnHnuMNYG
         iLARnz02IMz4ZkWrbQwP92o/JUveo5fbR1PZ48NeD/l3zOFRSSEQOZqW0kRLudiIlBan
         Gx75/FtuYL0bkwgtX71gktYXBfyRQmVYdwX8JRwUmmx9J1/65Ti3XoufhUgU0bnkoJ0n
         9MQe1kVOld71oj+4BqWMUK4MlMNOkEuNf/VatJfQHB+Ci2vbvoEqHIUz0mRwEyujvvTc
         e19OJQbcBtdXoyLJrPKBYm0SwuoWotDJbcYBDW8kRcbh2bdNlZulMQhHjk+jdJMcsbl0
         zKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739676608; x=1740281408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmE4kKkOgoe09cSAmYqjQfn9ukv5FizAQDyWO0AfJ7k=;
        b=sgTY/yfiAAuy3Z5EswYVqYZd6/R1ZLx0n/VM8voGMKtkpP6AzqRL4qnczIvW1MBj4I
         W7i92soyXZE8ILy0KmVB5/vl1VBLw0cDkl/+o36n+wzZaFDCsYirOdOukx+uvEL9G4oB
         1B8JJYkg+NxA/h/sicwGbon3RJ1UURR+u4doZo2r23kTByCF/8z0eGYdz+dgxzpMri/i
         qeVMYLmr4ec3/NSIoO1pm52Ng3yR3OjFSsnpAMjE/Z0THsJ4rL0m51LZqIMxXIOZ92OR
         fmY0npL0ppBdksgdc/18buMeqQJrqPouKLxpaMmTq5ormvncbDhprOw6o4V1FooU4WJf
         esVg==
X-Gm-Message-State: AOJu0Ywmp28xkpJsfgQ97SN3vMveXtfBBtEjPPt6Wu7xqcmyUzCnb115
	fMsSEtVmiV03Gq2WOIHcQd+PSd3oqdBezBCc1CDZZGFaCcWN7/pVDQKV109gUKXrxPUlM+B+HfR
	Obwt1tJtyehnH+zDiT41Ug5L0TYs=
X-Gm-Gg: ASbGncsvJKvl4Twa7t8vTyiflLj97WJKg4WloxGeu84khUoxzgzfgS+9r68JI0xJfc4
	c20IihpVt5e8poawQjA4JOQoIqKwy7gbYpenGC4gz8xAagv/0eCUCgmRkypXl/vjQnH7IJQ87/Y
	Fp5lD5YEXI/x4=
X-Google-Smtp-Source: AGHT+IGeg/BD1rTsP8/Y41U/jSiObHX+49ub86XlxzzAkjNbThD/KpujEkA2W6sOoGogHXZBMV6sJiOsTtqrPOh12wQ=
X-Received: by 2002:a05:6870:9d0b:b0:29e:60c9:9dd8 with SMTP id
 586e51a60fabf-2bc99d8e36emr2738872fac.29.1739676607911; Sat, 15 Feb 2025
 19:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20250215154924.1410-1-alex.kiernan@gmail.com>
In-Reply-To: <20250215154924.1410-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Feb 2025 19:29:41 -0800
X-Gm-Features: AWEUYZlCOk4WwZF1KqqKXjmraeMv0Ld6j4_aja7R8FtZYRDmNJMgvkb6o8NEBeg
Message-ID: <CAMKF1sqOg=xvu5VdMxa0H3CQXbdr-o5CYaw9=OFrPeXryq8-ww@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] gpiod-sysfs-proxy: Fix deprecation warning
To: alex.kiernan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 03:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115498

I am seeing this install error

sed: -e expression #1, char 17: unknown option to `s'

see
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1502125/raw_inlin=
e

On Sat, Feb 15, 2025 at 7:49=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Replace `\/` sequences to fix:
>
>   gpiod-sysfs-proxy_0.1.2.bb: Var <MOUNTPOINT>:1: DeprecationWarning: inv=
alid escape sequence \/
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/=
gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-lay=
ers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.b=
b
> index fef2589106cd..13e4e680fb6d 100644
> --- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-s=
ysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> +++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-s=
ysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> @@ -24,7 +24,7 @@ SRC_URI[sha256sum] =3D "4bdd4b8a7042f63a40507ae0f16b360=
011e67cbb2f0276289636487a54
>  # non-standard behavior so make sure the user actually wants it.
>  PACKAGECONFIG[sys-class-mount] =3D ""
>
> -export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mo=
unt', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
> +export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mo=
unt', '/sys/class/gpio', '/run/gpio', d)}"
>
>  do_install:append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115495): https://lists.openembedded.org/g/openembedde=
d-devel/message/115495
> Mute This Topic: https://lists.openembedded.org/mt/111201199/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

