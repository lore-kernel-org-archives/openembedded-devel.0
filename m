Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8D6C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:02:12 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.15230.1717682529746828299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjCDAo1h;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ba68cc920fso877323eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682529; x=1718287329; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZaLAo3KCk4tWAw78VJBPOP5J2hKfeiUkI0yEgS0oIo=;
        b=LjCDAo1h7Wvagi+Ws0PivFpHHI2xtCeqrZhQhJ4zDqEFz6+dkk2gKcPEfJjQYWJKfn
         ltydgdH3v90TpaZWGaDfbuLDVmKRuppeNAMgAx4cIooWhEdgm/yEoMUa+sbFkbiN7qpU
         SUA/t41mPy7zfjtsyeWKNGIPlsltv7wtIZxEnzuKYPcGvlNijt10E+OsZYIMncDA7wuO
         NQyNhtQC2GiXrXj7dOLdY1lru1NF4NK78unT26qmWXGgL81eqHA4KV3PGokBiBkSG1aF
         tWDlgOnqnukgCKNo7cVHl3I6wsOtXxu5dBOD/v3cVEyGn30+MAsWziPHsFp/cf4rbIUz
         B2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682529; x=1718287329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZaLAo3KCk4tWAw78VJBPOP5J2hKfeiUkI0yEgS0oIo=;
        b=kyQkYfw/sQTqN4Y6pls5G9A8u7nsJNazUTE9uTvjiuAU7TM/Rz1XX1htEPjnknenyP
         v401awrkki++689u//EhLK1kAYhp/4nnjpnqDfDBPZ7wohWNPAmyIYKP3MnJmu3xXJMP
         geZQeIP352pAWaqlAUh0TYIuvoITIIMi3J09W4sWJ+H6S0FFVqEqx2sdnMW5Us0WrBbi
         pPY6MlmgQKsdeFa/IsfZz+EcXn/Pk4YBl5e2e11DQ9x9kf7bm5fH7ev0xWuxjJpwlzy1
         2z0z4qONl2jy5AKd6K8S2C/GWD7gvqNOSir26t0AfcAXus9icZmuzPQf/tpCE+fGsCrC
         xOkA==
X-Gm-Message-State: AOJu0YxSohysDh5V3QqfGdPSEt1mDhTnMU10YUBhe0OdMb4Kc0bUWY6p
	kEYI8Zp1QdqQsLiRkiGlCK24wCOEbmcPZTnFNWjq/uHK5+RlbMJKilFyfysr1BsHpT9afTRzFoa
	sOZpCe11RmhdvEsWG3EQYNBA6nCg=
X-Google-Smtp-Source: AGHT+IEc9rSgUT7D3KHRk2qFq5jGSY07gG1Evx3UPr2/MiwD4LdRfvis/e7bZgKm8/zmWuUrJBPm1X6JR47H20ey/18=
X-Received: by 2002:a05:6871:294:b0:24c:8c13:7ad8 with SMTP id
 586e51a60fabf-25440957fbfmr1268203fac.28.1717682527556; Thu, 06 Jun 2024
 07:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com> <1717664795-13902-20-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1717664795-13902-20-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 07:01:41 -0700
Message-ID: <CAMKF1soo6qybw-=bm4x+rc0E64d1sWDLgH0md0iMw2SAsYXmxA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 20/36] libimobiledevice-glue: upgrade 1.0.0
 -> 1.2.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 14:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110748

On Thu, Jun 6, 2024 at 2:07=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * socket: Use poll() - when available - instead of select()
> * socket: Allow NULL as address for socket_create() and socket_connect()
> * win32: Remove windows.h from public headers
> * Add version function to interface
> * Add helper code to deal with NSKeyedArchiver plist data
> * opack: Fixed 32bit buffer overflow
> * opack: Fix parsing of 32 and 64 bit packed values
> * socket: Make sure errno is always set on error, and always return a mea=
ningful error code
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libimobiledevice-glue/libimobiledevice-glue_git.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobil=
edevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/li=
bimobiledevice-glue_git.bb
> index d37c547c9..a8826755f 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_git.bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_git.bb
> @@ -8,9 +8,9 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
>
>  DEPENDS =3D "libplist"
>
> -PV =3D "1.0.0+git"
> +PV =3D "1.2.0"

move PV into recipe name perhaps.

>
> -SRCREV =3D "114098d30e783fbb3def5c9b49427a86621cfcb1"
> +SRCREV =3D "fde8946a3988790fd5d3f01fc0a1fd43609ab1d1"
>  SRC_URI =3D "git://github.com/libimobiledevice/libimobiledevice-glue;pro=
tocol=3Dhttps;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110727): https://lists.openembedded.org/g/openembedde=
d-devel/message/110727
> Mute This Topic: https://lists.openembedded.org/mt/106519706/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

