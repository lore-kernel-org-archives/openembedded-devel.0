Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA56C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:53:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33948.1769075626285683849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gQYu7x+U;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7bced39cfso7850975ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 01:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769075626; cv=none;
        d=google.com; s=arc-20240605;
        b=dudZdIKnJHEzWKKEPktbyZ5tdzSc+GGV6F2ZM++Tf0g96SNx1jFS3zckQ5CZYFRXdQ
         ZkZug86ChLX66s+JWqeJfYvOtHNUcu40f8jn9tONsd4Ssecn6eIgF2m0dtmH7gZ2KGzH
         g8wE+IALwcj7Btzn/5aGXS82rxfSN1YrgKx9l/JQnrlacumBktFfqowSanT907SHNawR
         QRKjH5DaoZVvPZtfYRYLjHIjFq+PQuLOt71qE+zEYZbP6lCMGZbOJbXeMc8oST1t8EQM
         0sZAGenWyGE1zxHskOELVENfrFRg1FHdHMFfTgdDIWlq+DGKtCfjX9ucQHn3MGwy/nQQ
         aHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q54e3fhQemiWcSHAcCjGyU/8ygcvUlGs4KbpzUMhTxg=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=XMquubRfX7qtH04TkYMc5Djdjzy6a9SuAMrSboHbKIGSgM07qe7EPH6MGiSEaTlmEl
         ftDB0cXA3Kv2guxnUTxOtX6RZS1SpIhMWoso+S/RyVjDPhrzDKf28vRwzN4kfQfuEYK1
         vglN0n4Iw9AzRgZeyKEA577KbAQW1RJ/Re+JK9nxdbTg7Gdp1CEst9Q5/mIq+4OmAdZ6
         z/WZ3ZkJYB4c3Q8iKTE4EXxGofHak9dcoYH8PZ8ZTzWSGBFOIzOIIR/gyVqz7nTCAt/m
         9CwaJdQyQihVJ1BtrSC9BP43p4nRrwKIuKqxmNFXHPF/qW3AqHYNpw5sTm/8WytsMzq7
         +nJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769075626; x=1769680426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q54e3fhQemiWcSHAcCjGyU/8ygcvUlGs4KbpzUMhTxg=;
        b=gQYu7x+U2BnG/1eNvh9C8DI+jRUaNXqbMB06kWcl46nrq9Dvaud+OdSxNA2yixg522
         JnjhaYeCSlLLisAw1UuWkbSR0HvS6Sa37tHEIDd05VW+s54+VVbJ1ZTMgpUXM7IGSgfN
         J80EG/OabzxN5qTrJ1RPqcMyweGSH/r8SoMu4aCIYpizNBPZOhwt5AeSL9Eb723zLKAF
         11+uccUHoAJqVGhkp87rl+39gl2kGDjgQpC0/a8RvFsvy2+jmt8S+21YtsdAcTWkrQrI
         Q2tPVsFkKRMYPdyrOZkxPG+ayOKF+w2pGfOx3S4JaaxCAULGFiqq4EvKsQ6J18aCPimp
         Ceyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769075626; x=1769680426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q54e3fhQemiWcSHAcCjGyU/8ygcvUlGs4KbpzUMhTxg=;
        b=PEheQNfGEQmdyNldrAKARVXlUrTxn2Qq7TKqjn748/NXwDFBcbQgawp2nRjTJ8CFM1
         5mSqexazRb7pk5iCakK6KnJWIDpkX/u5SanU2+5cG/tz6fhFU82KlkCd7xYUEqHtz9YF
         rKCULR+PyzJQB8VUw3PSruvw/vbpzdK82PmejCSGZhf3Qt43vwl6+E+ic+QqTc3BmIdF
         dz3liu3fLm1x+iujVH173F8HBFuPwjHhbKCQ89GwyCIy031ufZF9q20q0ryJ1Sg+e0wA
         oGaT62t7+PWKqri1IZJMqJnsYQ9WSS2+UUdVg0Id0tVGptTIyCyj90vpx95r3qam9YH1
         E/cQ==
X-Gm-Message-State: AOJu0YzG8aXCwoIZWVpubqvHTwwt1+VbYGknQdn7PeVKYBNfOcwhjuOe
	3n/f3QqNgceazhgfYZsfg1cHP7gEhrYAT1/uuhomRum2xPMpY2giUn8e6/jlaC1bZxDx8Pgma9m
	5+grnHGg3bDT+PWtxjxUDOT/pSzTrJBo=
X-Gm-Gg: AZuq6aIQUnYm9q2//shlNjKvLGbq5IHxpRACCQ5+TBxmluXFZbHPNOITAM1pcUACy/E
	tNdmz3WHjmFtUi9WUgbYTSnA675V17jk1Q1rdb178gRHWSBvEV93wkLokZK0K4WkrCc6nn4nXQZ
	Y4TV51UCUyIKBvOsVWPsp0sdP8Tyoyrg3gI16Ub15B3z/HiL9wrn66m++UtqxDYaJIqLVmmEXl/
	6HJ65kt6Tg6kljeRkoMHKnrerUpz0GtBZ6zkHqoipJAeUJ5kL3tbPTS27r6ah9UZH1IR4MQuQ==
X-Received: by 2002:a17:903:17c8:b0:294:d953:6ff9 with SMTP id
 d9443c01a7336-2a76b05d8d3mr68861435ad.47.1769075625595; Thu, 22 Jan 2026
 01:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20260121112921.857-1-wangmy@fujitsu.com> <20260121112921.857-2-wangmy@fujitsu.com>
In-Reply-To: <20260121112921.857-2-wangmy@fujitsu.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 22 Jan 2026 22:53:33 +1300
X-Gm-Features: AZwV_QgR7soqsxxrRFVc46r0AVGkfdcMIXFszMN8pQz219r7ik5lpvE0q79VCqI
Message-ID: <CADySD0HLHCw55OcVacLkcz5B8K8tKvbMLnsqVwd=8iVu4Fkrsw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 02/30] mcelog: upgrade 208 -> 210
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 09:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123734

On Thu, Jan 22, 2026 at 12:29=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/mcelog/{mcelog_208.bb =3D> mcelog_210.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/mcelog/{mcelog_208.bb =3D> mcelog_210.bb}=
 (96%)
>
> diff --git a/meta-oe/recipes-support/mcelog/mcelog_208.bb b/meta-oe/recip=
es-support/mcelog/mcelog_210.bb
> similarity index 96%
> rename from meta-oe/recipes-support/mcelog/mcelog_208.bb
> rename to meta-oe/recipes-support/mcelog/mcelog_210.bb
> index 4a72cd4d66..c0ddf323e6 100644
> --- a/meta-oe/recipes-support/mcelog/mcelog_208.bb
> +++ b/meta-oe/recipes-support/mcelog/mcelog_210.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/cpu/mce=
/mcelog.git;protocol=3Dhttp;;

can please also include tag=3Dv${PV} in the SRC_URI

>             file://run-ptest \
>             "
>
> -SRCREV =3D "2965a540ac2fbf1e0a992afd17c01747d6fd66aa"
> +SRCREV =3D "357b136f95be23be1dda2c5e220e0430e9b20765"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123693): https://lists.openembedded.org/g/openembedde=
d-devel/message/123693
> Mute This Topic: https://lists.openembedded.org/mt/117379496/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

