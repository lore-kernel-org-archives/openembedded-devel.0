Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A49CF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 00:30:32 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.6971.1726965025479553747
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 17:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OW8fngs3;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e03974b6a5so1657471b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726965025; x=1727569825; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCbqFPPzVGqa0CBz97Bejd3IzCwFUBXBMxIfdk84C7U=;
        b=OW8fngs3vLkSb5uODQH+dvgqotgLiJ75q6XFIjd4JuhbNNPYkuDzh0HEpppeqOt9Bg
         ZZUpsTpBZpcEh1ovj6XMxsmIZtKo+7vbgxAggX5EUgmxEDbxtQEKh8idZf1jRCO+M4OQ
         V6rAVh0IIki2XYeFiE7SAS4VQgxeSgnGvdhDlSU21TT/FdUS+40OxLmveKsQMDw8LX95
         8b4pmsZ2FUmo7uOrJoUFtEijC9Gk5FKOLoNQa2/xz2PVgMHHmqXM5HUySbeChzFu+gkf
         d2+Hd5w1zZTVheXgRrx6nvIqGDdinojw6AXTCEoHQslub/aye7+ywzCVz4WpsdDHhwzm
         qv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726965025; x=1727569825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCbqFPPzVGqa0CBz97Bejd3IzCwFUBXBMxIfdk84C7U=;
        b=L7S2A97ZjhLF8XovtR5b6XQeaTuueIsHTr86mxo5XONnGxdYVWMLvbZUxDnlfd1m2W
         UDiJ5QitExngRMGD8IS9qDOdcWik9t7LLtiVceb3LouHrntknRKX3DghP3MSMyzPVr5Z
         bF7Yc3rpt5TWK2k53SdvKxOBc0fkOHgLFcyPpLwSNlXNwTfzi/1njQI8aGVxpF6jirKA
         frnRaita5sB/G+ES666n7bFCkjqIhE6Zb1Um1wAsmPEKpXKtHi4HVkIvdLI+NriT1SFG
         pbrVmZMVR7YM64mYKKTpFZbuKCVsAkXoDc9w5Ql/3jApAwQsY/lbOupNo2YY+R9RSibD
         c6hw==
X-Gm-Message-State: AOJu0YwiPHWbOZ4KwuT0DBxSrk6x9VKSSYLreLSFJ/WfbtUakWLATYPh
	gK5Csd5Mvl2LrXY2zF0M29FkB6/hIwG+sQbukdBGSeHDUW9A9yxmii6R1jFdkspk/eUQasroxPT
	Ewt88uEqfTr+iD4saP5dOZ/93fkE=
X-Google-Smtp-Source: AGHT+IH5N0eJ6U2hbHU0s8SQbzOgaAa4fCJs97cIp0pAvsIEATMJ4a+oamCdtBIGoof0FbqRGqYSgV46y/7bWNKAcgk=
X-Received: by 2002:a05:6808:2393:b0:3e0:5141:66b5 with SMTP id
 5614622812f47-3e2729a2d9fmr4755719b6e.38.1726965024582; Sat, 21 Sep 2024
 17:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240921160020.5364-1-f_l_k@t-online.de> <20240921160020.5364-2-f_l_k@t-online.de>
In-Reply-To: <20240921160020.5364-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Sep 2024 20:29:58 -0400
Message-ID: <CAMKF1sqp4sfGfdXVb37fefZwA3ZwXPtj9MzO6FO+XKF06M84ag@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] grilo-plugins: switch from tracker
 to tinysparql
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112439

here is next problem - https://errors.yoctoproject.org/Errors/Details/80605=
7/

On Sat, Sep 21, 2024 at 11:58=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> index 40603993f..05df108e9 100644
> --- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> +++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> @@ -18,6 +18,6 @@ SRC_URI +=3D "file://0001-Avoid-running-trackertestutil=
s.patch"
>  SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a=
96eb3a54f32f6a21d084cdcb"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)}"
> -PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tracker"
> +PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tinysparql"
>
>  FILES:${PN} +=3D "${libdir}/grilo-0.3"
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112432): https://lists.openembedded.org/g/openembedde=
d-devel/message/112432
> Mute This Topic: https://lists.openembedded.org/mt/108577601/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

