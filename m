Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A70CA0EDC
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 02:06:37 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.2824.1755223593934816407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 19:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECUsgeqW;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e931cc02fcdso1616178276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755223593; x=1755828393; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsxShgWwuz5QziiwmTiNFVc1mToArwmyCr0pE0Y0Lqo=;
        b=ECUsgeqWTX4GfRlKMMyaXnc85+3A/uD0OOcC+k6e7ZJjt5sPRCC+i+DurPMHxwFt4n
         32Z4+403y4o5uP281CJDv4Z1EnwjehRqCcA0ru8ibxwPNdB6GhWtr4CcgW+VjFrCG2GU
         NpHiuUdOb9ssiw7gxp7Ge9AyJO3el+783pNC6Z236aoRbnpu/JL39OVfLZMoIJnDv2nM
         Ul/nw1BmHghugmfNBGF+7FjHhDt3LjkfW/J1sSXut02/hmxUkN0iLzKnPtpsIvLNz5AY
         i/StziyLi0witUpr9uecIzxeUJ9w0hUklLaB29fWyGOU2SrWQr+P9odge8LFBQdHgFhX
         2igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755223593; x=1755828393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsxShgWwuz5QziiwmTiNFVc1mToArwmyCr0pE0Y0Lqo=;
        b=Fd75x43/rUeWXuO7hzxWNpPGs9G1q+ksfVSHylSPPb47e91q9RwU/p11sr3d+rD1X+
         50lyg5zFVavUO6C4Ne1jr90+gieCAvQIr6lmnIKH2km9mgbeTESdFDYDo8ozjMFLD815
         yHtUbEIab/oaXSL2Y7xXEXtiYL8fIubXl7YJzb8c2uRilxLMpjjBxR7Nk96xx2RXTW2H
         yh/ju7lNY3oBvFDhIXONaC14VKUMRBCYb52s9KgmMWCS8XDXgAb7TKk1/f7UjD45A7XP
         yh9l2RF4gINpV46+2u3RK0v0xULuvT9lqRqdANSxXAoW/S1IGB9sSufcKURgHiTHIRIQ
         hUvQ==
X-Gm-Message-State: AOJu0YwrOT7cuUcQIE2iMtSLKZ8HKZCKkrx4JcaDsSyGM29/GsCxk63n
	VRQQHtFbXEBcRT1Ve5GxFAqyWb95UdM4uNVrehW8CUyEhlPjZztP/h+eyn6oMyhUT6B52VUAMvk
	+UEiOqa3pI1XU5TdwCRF1GxRhpzmoV5iqeF+e
X-Gm-Gg: ASbGncu6qyYQJ8orJ6HNc8MgvTva7MyMdbBUAxdlXuG7NPaws6HzPuFDo6IO27EIRq6
	K37b/xojZKB8qFQv6Y/QWJhfyz+skEIcPmSvLw1xToF9eULpXKPRefDy7lgseJxn4iv5XAYa2ll
	QvsB9RaUXWRrQ+orpkaBnMEFJS2uTuPYmlLRllyE2zq/TTM3/6a8DJYMpiBUUBBNZiXcZRJcELm
	J3aqjGkfdwBsO+xDl0D2roUKO4stkT6
X-Google-Smtp-Source: AGHT+IGTMN0quQ8U2YB0N4tQbc8XU4ZO4Yt9WBtKj/xyF+wBq4r4dVDmJ3KgAaYgA79wsgsEWWnteZAw5Qffx2raxrA=
X-Received: by 2002:a05:6902:1142:b0:e8b:9ef1:f9ef with SMTP id
 3f1490d57ef6-e9332588d98mr458958276.45.1755223592873; Thu, 14 Aug 2025
 19:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250814225042.3310913-1-d.schultz@phytec.de>
In-Reply-To: <20250814225042.3310913-1-d.schultz@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2025 19:06:06 -0700
X-Gm-Features: Ac12FXxxzebZ--CtAprJ93ORpMxXM8OGOcDPnc-EfKG8IxPP9B9sOZw3rC5YF3E
Message-ID: <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
To: d.schultz@phytec.de
Cc: openembedded-devel@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118953

I wonder why it works on autobuilder. Can you try with bitbake -ccleanall ?
and see if fetching works. I can see the SRCREV is same as v3.6.4 tag.

On Thu, Aug 14, 2025 at 3:51=E2=80=AFPM Daniel Schultz via
lists.openembedded.org <d.schultz=3Dphytec.de@lists.openembedded.org>
wrote:
>
> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
> Only use SRCREV since this will generate an error.
>
> Fix following error:
>   [...] FetchError: Fetcher failure: Conflicting revisions
>   (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
>   from the url) found, please specify one valid value
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 88b50a406b..a0dc6a689a 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a=
6c2f1ef1630d341e026d"
>  SECTION =3D "libs"
>
>  S =3D "${WORKDIR}/git"
> -SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;br=
anch=3Dmbedtls-3.6;tag=3Dv${PV} \
> +SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;br=
anch=3Dmbedtls-3.6 \
>             file://run-ptest \
>             "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118951): https://lists.openembedded.org/g/openembedde=
d-devel/message/118951
> Mute This Topic: https://lists.openembedded.org/mt/114709547/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

