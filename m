Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28740C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 00:09:45 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.26870.1699834178517872532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 16:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYyU41M/;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b56b618217so2355223b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 16:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699834178; x=1700438978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51pwPX4Znr0uGjiGv2PXhZZg1IdzMuUf4HlNCWRYH1w=;
        b=MYyU41M/iaJ8V659NDHmw9MIet1yZAHaiL3PKcIAgbG9ulCEtkO6T4RkCs1TBnpHJK
         6g/mC2THoCuaRA3qxYc6jr8rtuD45gVBik50P4ksfKKmy/lrxsVf8DOl2baBy8AFeV2H
         XQOfNKoFIMZmCaQuDJZBp0jHQbJ/bcB3mSe8x3b1abYwfbipCfQeGiLCiuKJeEEQEnEV
         ZJx2TMOkEmJyrzFE8tCKWEGASu+XX0FnDYb7t2AAAj0fsW+dguydgV4P+BmLduEFrxsg
         Wi9kspW0UxWFyA0M1qXG9EtlF2cLIp4SyAZqj1QbJt4tXJnzkGDmkACRGD/s7ZG0ZevR
         2W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834178; x=1700438978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51pwPX4Znr0uGjiGv2PXhZZg1IdzMuUf4HlNCWRYH1w=;
        b=H9eePInMuiHTGiOo8CfM62AhxsCZ2QagyerF6V5TTm9P3sMT836h2Auv0r+BlLS/nS
         0Jz6ujJ+mI+tP4JVjPdPU7FboRTv1wVKT8xVnG/fqZvIFF3PY+VSkbAxOUOWNwEzrRvc
         hpfCpL3t67jD26iTE4rRjSAkc3oiKDY0F5H7hwxbjFdDUg2jg3ZbYQej/pDPdjxSMkq5
         UmyVrF1ED2YzL6/ErStcMpcYdmhtMxeXquNT589LDT6TD0Zvjbf14dM0XsvZ39YtsbT+
         2oYuEKFtTnD+32j6Vf49v6y5Gohe1yw1OaGr2/ck32sCJGqRedOwr531X9xd19fv7lFd
         0JJA==
X-Gm-Message-State: AOJu0YwWX6dkINxsOY3rgZCzA6sg74DqPsXdz4baeMsBUJkvwUYvNAAm
	tfycugujWkOfDqQ5bXvrJDDtVS6RyNSUoMg49udmVux4rRVdsw==
X-Google-Smtp-Source: AGHT+IHbIz9ynQu5v0mmn+1g4AVVx+lep5qsfdkCUxzLPKlPYFYgxmSMJNVAHCK3VJ+SSNDqxJJOjr0KFrLTwXzHvfw=
X-Received: by 2002:a05:6870:fb9e:b0:1bf:787c:411b with SMTP id
 kv30-20020a056870fb9e00b001bf787c411bmr7193793oab.10.1699834177751; Sun, 12
 Nov 2023 16:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20231112191146.595362-1-alperyasinak1@gmail.com>
In-Reply-To: <20231112191146.595362-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 16:09:11 -0800
Message-ID: <CAMKF1sr8WAv+H+4Ko6M+s9gw1_2CFrvkcOoAoQDKH7hpKrTXwg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] cannelloni: upgrade 1.0.0 -> 1.1.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 00:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106620

fails to build

http://sprunge.us/3yQKcq

On Sun, Nov 12, 2023 at 11:12=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
> Changelog:
>
> - Typo fix in cannelloni.h
> - workflows: add nix-test.yml
> - Add TCP mode
> - No peer checking
> - Add -Wall switch and fix all warnings
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../cannelloni/{cannelloni_1.0.0.bb =3D> cannelloni_1.1.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_1.0.0=
.bb =3D> cannelloni_1.1.0.bb} (89%)
>
> diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1=
.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.=
bb
> similarity index 89%
> rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_1.=
0.0.bb
> rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.=
0.bb
> index f34c73c17..fb457dc03 100644
> --- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
> +++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/mguentner/cannelloni"
>  LICENSE =3D "GPL-2.0-only"
>
>  SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttps;=
branch=3Dmaster"
> -SRCREV =3D "0bd7e27db35bdef361226882ae04205504f7b2f4"
> +SRCREV =3D "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
>
>  LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106602): https://lists.openembedded.org/g/openembedde=
d-devel/message/106602
> Mute This Topic: https://lists.openembedded.org/mt/102547840/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

