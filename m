Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9AAC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 16:32:18 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.88508.1717432335368867360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 09:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kUncyPLW;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9cc681ee0so105821b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717432334; x=1718037134; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV9eENclgOetFERQbDACYcZ6iqtWtM0lYMPKSrvf1Rg=;
        b=kUncyPLWHOxyggHSjwu0g1K41CRPCIjb63oPIcaReiWiFeLeYWJYZ56qEanj3adZ0z
         vVq69gU1ypRmCIY3ITPnSMXkjXmZp6JzIP4HbUpSnST8tN7OJexYXmu5eBltCaTXcEKk
         KGcf6JIAwzMz3HyhO9dhNe4Jm3HHDFc2cjClzSIW1a8dR9j+r3Q9ERU8LNAbgRQqxm62
         OfEuVUSPTxboWW+STwFiqT57W++AU03kZOKPRH0xEjV38Sr3F5S+hrg90z/G8rgkp8kQ
         VN7QorXTm+DIJ7RV0/Dgp6ulNC6k89BY47LY7HeHJ0RgKqMoMtziotWUcRjUVMeNRWpX
         uLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717432334; x=1718037134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV9eENclgOetFERQbDACYcZ6iqtWtM0lYMPKSrvf1Rg=;
        b=OK5RYb7Ihmgqt7nQ+8xziVvLI0EMzj+E0eMWsVMtJh04CwdkJJwEMDQ7UqXLlglWM4
         3Q9qT0EaCMRUP6ZESZq2ESst9PY60Yq+UDPFZ2SG2XftTrcmGRrAuOU3gV7RZSeLH/i+
         kiSSsici9xjXZYHT39uXD3qLCFjiCsxkxFpWvZZqaXVa2DmceO2E87uLpRde3xCaDL9D
         EB/f9cRfSq8YMjsjVeHCq/R2lIiVodTb7i1agdoeQvLuonyM/G7yjMuSXV6uXxucZ5AD
         BJpJ8hklaAVeBfIIof9qch+js1AIk59gcBqxJmLB37vFJHy67n3sM7sFVqSdpRW60fki
         d+jg==
X-Gm-Message-State: AOJu0YzQBzPC/qRlSrUPnC2jrl0nwgg37+2vYwMvAxCs6Un1EyVtg2Ej
	Q7xM7xze5autz18dvGQ8cFjM75TiUkwh9BoUPafRh9PSr1ctHvBfr9FnnLFH6s56tV+Y/X7UIiD
	/wMvM4eaW3oFaHptCPsLwGhJTJak=
X-Google-Smtp-Source: AGHT+IHzfMNouc0lgKM4kKEZhy1mGXyCwOWExvTSaPxJEyVsaRl/kkHGvrkn2yFKXS3fzG4zmZceyxi8qyq3Rm0chYE=
X-Received: by 2002:a05:6808:cf:b0:3c9:c456:957f with SMTP id
 5614622812f47-3d1e349fc9bmr9962435b6e.28.1717432334485; Mon, 03 Jun 2024
 09:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240603084336.3732231-1-kai.kang@windriver.com>
In-Reply-To: <20240603084336.3732231-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jun 2024 09:31:47 -0700
Message-ID: <CAMKF1sogCTmV=Z9zt5qYYo=0Pu1XxaW075gjuKO7jELxLqB8Hg@mail.gmail.com>
Subject: Re: [oe] [PATCH] lvm2: rename to add version back
To: kai.kang@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 16:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110672

its now in lvm2.inc which is shared between libdevmapper.bb and lvm2.bb

On Mon, Jun 3, 2024 at 1:43=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> The version has been removed from recipe name by commit
>
> * cc4e9fbd82 lvm2: remove subitted patch
>
> it is not proper and rename to add the version back in recipe name.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb} (100%=
)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-suppo=
rt/lvm2/lvm2_2.03.22.bb
> similarity index 100%
> rename from meta-oe/recipes-support/lvm2/lvm2.bb
> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110670): https://lists.openembedded.org/g/openembedde=
d-devel/message/110670
> Mute This Topic: https://lists.openembedded.org/mt/106458240/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

