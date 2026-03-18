Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE011077610
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 19:38:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22875.1773862681854931530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 12:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FTOnYN/7;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-417c34b0509so254787fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 12:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773862681; cv=none;
        d=google.com; s=arc-20240605;
        b=iTlsse+wi78qYqT+RO9oE0LL2H6uaWUgJorTb9uVpx4TY7OtTWvTRAjaiNDj6TUwuX
         WqB9cy5l0QWUFicafSgTPlkvcunQWGkZlBb2Tg8Iw+CGXManRP1L+JO1QP86DreJwGgW
         GyuzCE4IEUeN0vC6bvIPyt/swlS7AdHhMOd9kKVzosw67rd4SO66JE63SQIkIdv3uht6
         Evbay0A2Oego7IDJMjJjGW89sbrzUIphuEKdQtY3TqYbtRA4IRqDaBHwnXJ/ZVRg2oKQ
         8WKFAkqdoZNmjb5HTzywpBKkNVXL9MLC4Y7Tp6R5WfEBam6HOh5EmHfXOkJ1n/7+Y8Ul
         IVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ay4/BmtCc/sUIoGf9SPhuwy1jWr7YvRibDYTCvHIZBk=;
        fh=lBLwfWRoc+R2+7ToVxrbMLl8vQztf6e8SRSWi6F5cfc=;
        b=fEz/zFG3nKnVMSiHONViTOWrKKnFeQmJftHqQ4y+59gOimfTfisU6PnTvjFn3YFkzK
         Xvc0gkufOEhXRvOg6u28yQwgQP7KI7E7pp1e00el0w8nJ/arMCRlIAc5yz/Av+GvgJXC
         GndFaUt9iS0QaEZz06vHuFsJ71ZwdGvoHto1k3KXPMj3JM3L7PHVW5cNuFy/awlgWQaC
         lcEEk8wwdOjpdmNRHyg/k0LncBFun3ZvHCoF3TN5+NcVo+X+jOmAqaoOSK4DtEevUXfg
         CMQEfqexHi+nEtiIP8mBYEntoEZASy7HXgxcNNM/7SXldDF796cWvwls+oifDJoogENc
         HEAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862681; x=1774467481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay4/BmtCc/sUIoGf9SPhuwy1jWr7YvRibDYTCvHIZBk=;
        b=FTOnYN/7Jzk5VkgQdUNjmky+75tXSsKNY/11zRrLdc7VuqieYGVrJ0kOS1Rtlpv56s
         nlMc6zNQH8anDHYzUiQFEGp315LWhEtMPRV0IT/PKM9LfQEVKQOyYtMJKJTU2IJwd8EY
         b9cMwrqrPrJna8pPQMX2ca2i4geMmvYxtEBOMGGAg7gAsL+mcKUZPLzd28hCfV3XvCia
         HEbMbf0DkL0mUcNTD+gTIc0FHUSw70WMwxd9iAGMoXCEamm10sp+kUCRoJ8rWbrRfpCU
         +3EdAN9gOt9tzGukx/2pYSUID2bgXVUZV2E9PWCQOQB5viCYeU9Cy53Q+zwj5I4MZKqE
         xKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862681; x=1774467481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ay4/BmtCc/sUIoGf9SPhuwy1jWr7YvRibDYTCvHIZBk=;
        b=De0aw2jLeQi9TT3ElFk9tKUAhb1tdfJiZTYd45j0MLM20KghD2mJJvQkLPoYFnFSHG
         vbNIM/MWCfnoshk/4WoJ/4NOw/UWwSum2l8i3LfMw4kApC7Jpu5PjUVXZkyV79RWSgYF
         C9F4maVERgyEW/EOvb6e02djs5PA9e2ta/Mz5caog9SOnckRESA1wejviW4jqXGgL+2K
         N2UPYNgFWL6pLjNKyhadWgxWS7lAADHXFbA8CxOHkb9i4+RHfoUyeSqaX2xTK7visBTL
         a0QjD5w+gBgFIy7GzK8egJOt6v+Yw0DJe6tyndrAf0Tnqj0GLBnjs9o945sGD8V5xCEm
         USCA==
X-Gm-Message-State: AOJu0YzgLYRM3He/fWa6JTd2LsoBhQCAmfL2yiRwoljeCGW9G5OqCxI2
	+cl/C5orVvjYZXKWIStA9GmCWmdi/LuiatLEjd5LVyq3/4gf1Pv1rm4w9PGzmKVNVuMkUdxo5ar
	JOTyxOOy4uKywqpcG7j1z92y6o/mvCWI=
X-Gm-Gg: ATEYQzy+3J6dhSz0QGQVz+4ySQOAgPCoZVsX2Ab/YyADEhJJiTfpzL3u1pOxJVUQF40
	sFnPza5YLb7GKBYF+Ds1L13w66nfhJja7AOJktwEM1U0evI+NKLiNyoX+hM9R7/VKEnm9hy1FG9
	g1c5sE0aW0vkuT6pDxWVAt1YgS5p39r+aJ3O6FUtPmZxIffh+OWz8v21JjrFgcAqHSiAmVP6kw0
	VAP5cOgt2kAwq/IjnZB2Pybl7+aRA8PV7VXGOVVHOIWW6concczlq5DCfov88Ip+/UM/i8qm1Jc
	UTUq6rI0
X-Received: by 2002:a05:6820:1606:b0:67b:bed4:b150 with SMTP id
 006d021491bc7-67c0daade78mr2815706eaf.30.1773862680848; Wed, 18 Mar 2026
 12:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260318190300.270982-1-jakubszczudlo40@gmail.com>
In-Reply-To: <20260318190300.270982-1-jakubszczudlo40@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 19 Mar 2026 08:37:49 +1300
X-Gm-Features: AaiRm504lTmjg-EVjtdt5bJNxao9xyHLwwNiGyMEGArltiMFktWqE-os9WhpyGY
Message-ID: <CADySD0E7DpkLgBU428-GmsT=Txjj2Lboq+W_EdsgeoAUPraddQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] libssh: Upgrade 0.11.3 -> 0.11.4
To: jakubszczudlo40@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125364

On Thu, Mar 19, 2026 at 8:03=E2=80=AFAM Jakub Szczudlo via
lists.openembedded.org
<jakubszczudlo40=3Dgmail.com@lists.openembedded.org> wrote:
>
> Release note:
> https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-relea=
ses/
>
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  .../libssh/{libssh_0.11.3.bb =3D> libssh_0.11.4.bb}          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb =3D> libssh_0.11=
.4.bb} (78%)
>
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.11.4.bb
> similarity index 78%
> rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> index 5928581312..c39b121be6 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://git.libssh.org/projects/libssh.git;p=
rotocol=3Dhttps;branch=3Dstable
>
>  SRC_URI:append:toolchain-clang =3D " file://0001-CompilerChecks.cmake-dr=
op-Wunused-variable-flag.patch"
>
> -SRCREV =3D "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
> +SRCREV =3D "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
>
>
>  inherit cmake ptest
> @@ -50,3 +50,8 @@ BBCLASSEXTEND =3D "native nativesdk"
>
>  CVE_STATUS[CVE-2025-5987] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.2"
>  CVE_STATUS[CVE-2025-5318] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.2"
> +CVE_STATUS[CVE-2026-0964] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.4"
> +CVE_STATUS[CVE-2026-0965] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.4"
> +CVE_STATUS[CVE-2026-0966] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.4"
> +CVE_STATUS[CVE-2026-0967] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.4"
> +CVE_STATUS[CVE-2026-0968] =3D "fixed-version: The vulnerability was fixe=
d in 0.11.4"

These CVEs are not yet available in the NVD, don't think we should be
adding them here.

> \ No newline at end of file
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125362): https://lists.openembedded.org/g/openembedde=
d-devel/message/125362
> Mute This Topic: https://lists.openembedded.org/mt/118388524/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

