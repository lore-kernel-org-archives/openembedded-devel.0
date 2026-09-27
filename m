Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B65C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 20:47:03 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44654.1790542020395445507
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 13:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=quQpId3A;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad9so1719217fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 13:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790542019; cv=none;
        d=google.com; s=arc-20260327;
        b=s8+e1+dMEcilL7vL7P6rfZikPWAKY8QxsXaM5NA88TEYieO1BNlHZEz+6eZF0G+vRy
         xtcEf1ws2Jcx3qnATbxbXAPPgzSCxs0U5dHKijwmJfrXTN1AggrMTBt5c3k8B1sojc/V
         7PxoacXQrxXJ01m8TonYws8lyCpjdPZXnnoo3EQcDzqE+ZTUEpxgbmMSUWFY8/WBDJKv
         a8FchkvPM31M+thEnQzdMEaI0PONP7FGjFPus0my1NJA7oYJYyxcLxuD0tBjvM3E34nE
         mXYh2rGNqS27+f8znhtFdG8yrhH0DsAOjD+GusQybEZY8rL2yZfkvy1DWZ0LapCwChKe
         Tpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fntsIeQ/Us8updyjidTrQPWm/w62MxgTXZJXla8at5o=;
        fh=zABElKLQhBo6sajsySJxqEgPo2ywlapBDtJvPbj7xuw=;
        b=iuAfmfpmg3XvGEf1lDSl0USo4VzTy46zb6Cr8BVKV3obnTjsXQW3Y55rKw1MENpffi
         vcqwxumda69vSb5LqVgmLuStY2+fcvyvVKUY9vDPKoYB5kcfUiac8Ja9YxljakqTDYBY
         ln6YBg8yZT0dphnMoJGieFad6AL/Kz2xgqeeAbkau5A5xMn+lxf0KgSwdBuUgzA8uycG
         MCW0ADqHBA6sDIg/sNhNORtOVbYciWf8COm3BXZ5LW71cEhvwpNvKY6a+GWemc9JJrEt
         vzaaDPJKGKd8zF9GbwKXeBb+yU+EdGn23qXDBU28ROn7gQPP362e8N0zjL7AkggdzK3e
         vMtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542019; x=1791146819; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fntsIeQ/Us8updyjidTrQPWm/w62MxgTXZJXla8at5o=;
        b=quQpId3ACmeNv6FWbof/4zsldm9GXOxWhRKtnieM2VYHTq2w+FUPRCVwJfACpvCI/A
         Gy+ceK3YLJ8W2cpYvTgC5ylVGSG7TfZyN5N0K3wTzB0N09uS89RHJN3RAXtaRYsUqkwN
         8P3FkkTkJRDVVOoxTQzCk0x/T93OgE/5d+xXDarNJSE270vkABnjeIBmkKDRCQOGn9H3
         s+Tpjfp7R3j7KetGgGNd3skb3uj/6JuBd9qwHAl+BCt4EXxDmxjQ4dvo6t99dLYAijoX
         I5ZhJhFsVhCv5CAF/Hca79MLDEIrRuoKhSWDFodsTFIwWjQbgbgnoMo3bO2blORqAvU2
         0K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542019; x=1791146819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fntsIeQ/Us8updyjidTrQPWm/w62MxgTXZJXla8at5o=;
        b=qbyfHtCYugaf0P8fKorKhk8I/BuVFVqbz3Z/6gzIcNxH/iQP2xuidq5nK/bTeZmZSI
         bLfoIQzsKU2uYgyppiVQ6Bv+pzDUl/RPo5Kqo9+Xb33XRoY70iE5fsxIPBQaRx1aTy3D
         0MysUP6+5yjHOGk1+CU6KUpSuvw9dxcVFakM+756UWxGeiFRFgOkJ5ZrVQ00VQZPC2v0
         qgJ47pwYrrY19B5W/s6HiAtrugWQPIhJetEnukO7yQsAQhFj/oMAEpqhwouCSMVHb7hc
         NTCD2cJIUltI4bHoi2X6nP5h1UGR61+okKYIzckCYbf357Y38X5uc2XV+KzRovNSzqYC
         t00w==
X-Gm-Message-State: AFq9FYIhpFvtbtu4Gy8536SvUslNBeEU91/nWByJMmHUOgeCtLVltyai
	6lBPJT9wCbt8VWc5NS+LXjcQFbwzJ7PPtI0n9L75L0h0mpu4ONMWZaDtTgwL4l1niFdKBQtC8Ne
	eQnD0UXUZohypayeOq3SNEniKFwRoUDWC4g==
X-Gm-Gg: AYBFou2QaoaqUcoTaND9SHOJy9GgoYHqrRJn+rJmIt26fkaXu+ERk2waO005bzAMnVP
	pVWTpHaGSTvXN6YUk+vz0+OhvlqxWd0c3ar+dtw+xPJH0fCpY04G/4oTy/sChuNH7ccdpUccKlB
	Esrn65oexsrTP68cGPTUgXU4IvFUxMEXcJQbLAhTdvtvlXJxZY8HJJVLU6BQcSlx8w64pYpRTph
	iEotDKYF72hXgjtPoTrSE5kEdoSqWRbMTkGnGsAOb9bnIR+POpgsgP5ddp//Hax1FanWy6wxXJ7
	0bL/yl1KtqhzTCDeNmgRKwp6MEHJDYJPLL5juEhO5d4QYcfPiPPNpioKyTNDp/DUpVzFH4vWa/7
	BqeP8
X-Received: by 2002:a05:6870:ff43:b0:48f:e107:318c with SMTP id
 586e51a60fabf-491e6de4cd0mr10612091fac.44.1790542019564; Sun, 27 Sep 2026
 13:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com> <20260927155132.1277867-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260927155132.1277867-2-khem.raj@oss.qualcomm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 28 Sep 2026 09:46:47 +1300
X-Gm-Features: AclHuK9tP8TVn24oRVK9kaiya2e6t2kBMBrcgPXkNlgqzaSnct1kb_7LwkWAin0
Message-ID: <CADySD0HxUjVOhMcz1OVMGqidxqoZqK38+MaSJg+7SZZz=1+OQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] v4l2rtspserver: new recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Patrick Areny <patrick.areny@notiloplus.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 20:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130381

On Mon, Sep 28, 2026 at 4:51=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Patrick Areny <patrick.areny@notiloplus.com>
>
>     v4l2rtspserver is an streamer feed from :
>       - Video4Linux devices that support H264, HEVC, JPEG, VP8 or VP9 cap=
ture.
>       - ALSA devices that support PCM S16_BE, S16_LE, S32_BE or S32_LE
>
> Signed-off-by: Patrick Areny <patrick.areny@notiloplus.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  .../v4l2apps/v4l2rtspserver_0.3.8.bb                 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.=
3.8.bb
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb =
b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
> new file mode 100644
> index 0000000000..1a15a0cd0b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "V4L2rtsp streaming server"
> +LICENSE =3D "Unlicense"
> +LIC_FILES_CHKSUM =3D "file://UNLICENSE;md5=3D911690f51af322440237a253d69=
5d19f"
> +
> +SRC_URI =3D "gitsm://github.com/mpromonet/v4l2rtspserver.git;branch=3Dma=
ster;protocol=3Dhttps"

can please also include tag=3Dv${PV} in the SRC_URI

> +SRCREV =3D "b12cf350dc573ab0ff9d1b51a21daf3c218b614e"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake
> +
> +DEPENDS +=3D "live555 log4cpp"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130373): https://lists.openembedded.org/g/openembedde=
d-devel/message/130373
> Mute This Topic: https://lists.openembedded.org/mt/121457183/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

