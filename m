Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEECAC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.17862.1708447556219979591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 08:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZcgY4gku;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e2e6b405aaso2355859a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708447555; x=1709052355; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCEO29lWGJaQ9Cr/i/1VQI17IY6HHEQjtwf8eKM4Jgk=;
        b=ZcgY4gkuwI/FyUZeuznZJZWqYWSPPE/mJDNMoeLP6flP7Nc7PllKh44jCkxTbko9wV
         wW5TwzENZyjsQ3uYOxo6jYKF56aHgwA9Aiw9YOcvtwqaA3bzazoKeUsWszK173p5Zu1l
         FUTUUjLKMp69g7I/RkeRoEzcMlsYYhEzTw4bwZRct2svqSVKw8+BZPfq0c6DulogfQ5r
         RTt+0saws5JBaJOE7L2hsUNOYZCZfvZGATUoBmy/DLqrU2pwGR2kRmGs7lKo5vR76moM
         gr1uCiBr4LKpcETFHH/4byGl79cr6N1FCYuoawuc7J7db1e2/I8w6iKT1VAqH1NkW7Bb
         uKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447555; x=1709052355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCEO29lWGJaQ9Cr/i/1VQI17IY6HHEQjtwf8eKM4Jgk=;
        b=Jt3lVvNCligvQwVYMfjPwEAOMjLN9zBpKcoYU6Yf/9yekreVo9nQPOruZdFNlSI41t
         r+vO2sWJmOTKXudcnoEM12kK7+g22hthrryQ9HHgUWnHdT0so/u9aLAZXqlRFFSOP4Du
         hpxKIohf09bnoH684ki9SAkaf9Ika9XZ2/Lke9qfGaX3uZURYd+Tj1om88Wwl5mZxoOm
         dzE305M6+7GuRZkgkKb/JhR1W7xKJwq+xGLeHENh1dDdi7bbOe1GiwbteI0kLhTz0v91
         PlW08nYKlcitf+voXJmbegPwSanWMbATUJqQb+SC9LVPVU9Bd/HSbdHSdTA5UJzP4qjF
         4ANg==
X-Gm-Message-State: AOJu0YwuLWD6UyVluOv/9rONWvlierlBflK8lWm4mQgb1ldQ0QfHK3v3
	uEEaY3j11gkWnn285dt/Oi5/mA6pNh0bx9+bqlsGNV2BpB7BMX/Yr4YctZ299wD6mETbCBqg4qh
	H5mCbkFQUZyrl31QPoLgj6eQsuLzoJ4GR+SBVsQ==
X-Google-Smtp-Source: AGHT+IGORfZwFpZKNeqtSeOHkkJx09sUdCxYKR3aCzF3TWGNnZQ002hJQ8hd3iwXGpIXg2j4kzuwEVFNPPSphS2S3Eo=
X-Received: by 2002:a05:6870:e311:b0:21e:70fe:9bf9 with SMTP id
 z17-20020a056870e31100b0021e70fe9bf9mr10042130oad.51.1708447555409; Tue, 20
 Feb 2024 08:45:55 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-8-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-8-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 08:45:29 -0800
Message-ID: <CAMKF1soXTt4f0WFdRBbVuk6wF2fw0W6sgQoYpWQXmB1b9Fo1NQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 08/26] python3-google-auth: upgrade
 2.27.0 -> 2.28.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108952

please rebase this patch on current master-next branch and resend.

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Adding universe domain support for downscroped credentials
> -Change log level to debug for return_none_for_not_found_error
> -Make requests import conditional for gce universe domain
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-google-auth_2.27.0.bb =3D> python3-google-auth_2.28.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-google-auth_2.27.0.b=
b =3D> python3-google-auth_2.28.0.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.27=
.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-google-auth_2.27.=
0.bb
> rename to meta-python/recipes-devtools/python/python3-google-auth_2.28.0.=
bb
> index 45098e662..468cae5bf 100644
> --- a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c=
9479bd8986968f4327"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D "e863a56ccc2d8efa83df7a80272601e43487fa9a728a3762=
05c86c26aaefa821"
> +SRC_URI[sha256sum] =3D "3cfc1b6e4e64797584fb53fc9bd0b7afa9b7c0dba2004fa7=
dcc9349e58cc3195"
>
>  RDEPENDS:${PN} +=3D "\
>      ${PYTHON_PN}-asyncio \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108928): https://lists.openembedded.org/g/openembedde=
d-devel/message/108928
> Mute This Topic: https://lists.openembedded.org/mt/104464216/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

