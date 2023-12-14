Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902D0C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:45:50 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.29351.1702575948742903807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5a3vyOu;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b9e07690ccso5512112b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575948; x=1703180748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfQxeE5JXiSrWFdh++fBoLpNcC9Lm//3eIwPfEZDbA=;
        b=V5a3vyOuIo9w6WppTQjgdP8VvA3rS9vAga36qMAgZ8XEpPc6IpMnbVm15kz007+Aqr
         ECv232Sr2uzqiwZ/jbnQll8E4EJrNTBV9q2ZbCGm+ZcXo+5v7E14DB1is7Cw/fpOs8ok
         SaOWtj2AU1Kx7d4kf7mL+/xHQYosItj0IjwI9FITsBAE496yPCqaLjKwNaBEu3J72Qdw
         nNYPZUwujH8kDIBR0G+7ia5pVtm6TqjcG5GPyBBUv1LlHZMTl+zI5ip4+70xHYZlKAy5
         7YHpClCfjhSCHIGSlNjYWhJWQzGI6AOAYACI77ti1NvKIcUsbSqz0bxhquNk9gAgi3dE
         fcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575948; x=1703180748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QfQxeE5JXiSrWFdh++fBoLpNcC9Lm//3eIwPfEZDbA=;
        b=LJ53JO14CdP/ItRl8u49JBHUjVRQn+POZlqUAnccFXig6jcQcfTtbCreJm2KSI6N2z
         FuCWfFvz0FmDhLUUU87WzuyEEeVRSTlAquupRrbbsfQZH8wfq+1bMoOBJLqJ5u0WOj5Q
         a2jpPb45yChwJg9KlF3Tlkq+xwMRraGChRX/agsTEFY7qTioVNVRB69Q7eOjsQh7KhYu
         FsjJG0h6qMJV4NXEHx0c+ec3ejammCm9U6OlERlLvMfQhfWsDFNceg5Ve7ojhFl4E9EJ
         QJKfZdOJYbQ1oOcjy5ZP3ore+90dVGBDS1iIBKP/LDRUtyTWb+MZq6jKdXPKq+Z2s7Yl
         bBxg==
X-Gm-Message-State: AOJu0Yz+SlvqYeRa9pVAUG95o1maTYt7cpIq8VpQimIZu5Zzwr8elE6s
	MLECkFLWRHYptqjmxr0/tL5AV/crgqgCxG+IKDQKOH27PVg=
X-Google-Smtp-Source: AGHT+IGts4c9BWiT91Ph3jQwAnOya78pvbyY/qm0XbRJ5BhqYgVaI4tvaBV65Qu/GOfrq7SQzHYYCwyzBk5jDg3D62Y=
X-Received: by 2002:a05:6870:5149:b0:203:31f4:6962 with SMTP id
 z9-20020a056870514900b0020331f46962mr3007166oak.4.1702575947936; Thu, 14 Dec
 2023 09:45:47 -0800 (PST)
MIME-Version: 1.0
References: <1702543966-27805-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702543966-27805-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:45:22 -0800
Message-ID: <CAMKF1sqbjTkmcpXSEUpezvbienP1kUwOQJkT84dGaxp15hZoRg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-gmqtt: upgrade 0.6.12 -> 0.6.13
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107461

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
2140.1209348-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:53=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-gmqtt_0.6.12.bb =3D> python3-gmqtt_0.6.13.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.12.bb =3D>=
 python3-gmqtt_0.6.13.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb =
b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
> index c06e94e7a..101bfb9aa 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/wialon/gmqtt"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D903f1792621a3b35ee546da75d139=
177"
>
> -SRC_URI[sha256sum] =3D "7df03792343089ae62dc7cd6f8be356861c4fc68768cefa2=
2f3d8de5e7e5be48"
> +SRC_URI[sha256sum] =3D "b4623d3e32ba266e96c04b0871bb057d05414371c1d27955=
0648b390e6ba7577"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107432): https://lists.openembedded.org/g/openembedde=
d-devel/message/107432
> Mute This Topic: https://lists.openembedded.org/mt/103166812/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

