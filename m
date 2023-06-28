Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB71EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 13:26:47 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.16365.1687958801695499952
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 06:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bhTA0lsP;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a1a47b33d8so5061020b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687958801; x=1690550801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6xt/iFdG7b+JEyBC24aqIP/mEEUalLK7NPNtpeAq/8=;
        b=bhTA0lsPt+YDk/iC5qBe7+zhjlzRMD4LfzQbjlckn0YkQJwz05u/FdQf9dk82emZSg
         ztT6Em3Ptrb/aGMoFUZmqUKd8jXXkbsme3qNMNvNrQoSCuqDqOTnUOb/31wdyPkzoDwX
         utOIOE/b2edGA3vMv2QBePSFNU49XHjMHACYxxHW06WGbru128Gw+dPSqEHW0jHZ+nsA
         JDkeBbT4H1KAHO4+NCi7HPCfepndS9vhqP54dLzPOPsyvErJ9kwC6W+ifeJgkWe0PMkl
         er+qMgWFZgkqnpVSYG6Ws+C7cBQwxZpezjfJ5NjJRKOLgmfmeqpnZavokj5RJsvtDhhQ
         uo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687958801; x=1690550801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6xt/iFdG7b+JEyBC24aqIP/mEEUalLK7NPNtpeAq/8=;
        b=C5kxIVOHRKTMVlq4Dh876NAaovQVCyIVO0ccDH0rcczrM6jxtgLMZnrhJo1yVMLYcs
         lRxOI1NgaZRsdKNKZJjAKYQwcT8wdz0DI/lqH+WP4pob0nljM10yLGt9NQjxDwsXLBDG
         W2wOX+aPs8XLWUvNlKPWmF4JBa172oagYMczs5WCQGmczkAAMxZSyPKpTgbcFIr77LeC
         Ol5nUgtWk9mYHbovZErPgTz1g2X2Ytlq5F51gqyVGSqTEYJxUXP94n8fa4sVNz2Agk7l
         Kx43MZClbXCE8qxAgfNmRfRxaeEci+gf3+mHVeqHqzVFTdtQIRTeaYa6cXMmYE/EgGfj
         xwDg==
X-Gm-Message-State: AC+VfDw7K6rw/MpyKxwM5oqjnPr0REtw4pTU9bR+e68xGbu9x/i88Of1
	jY4sD8C8G51KvCQimpZWq2ojWi3PE6nMYzvTRPM=
X-Google-Smtp-Source: ACHHUZ4m8Y73mni6KmlIQ+z2sArLs3Wq5Bn1YDa3+GTUG+Em3dCQXOZEMAOfw4VhBv9fUw7VKHzbmsRnXxVyt+aqmcU=
X-Received: by 2002:aca:1919:0:b0:3a1:eb15:5ec4 with SMTP id
 l25-20020aca1919000000b003a1eb155ec4mr7635898oii.42.1687958800856; Wed, 28
 Jun 2023 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com> <1687849939-19941-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1687849939-19941-5-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jun 2023 15:26:14 +0200
Message-ID: <CAMKF1sqA3ok=A2Db-f4pJ18Q-4L0Ub1+XWOeFe9JEARM8LLjwA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.6.0 -> 3.8.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 13:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103629

seeing checksum mismatches

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2856

On Tue, Jun 27, 2023 at 9:14=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  Add missing user media directory docs
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...hon3-platformdirs_3.6.0.bb =3D> python3-platformdirs_3.8.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-platformdirs_3.6.0.b=
b =3D> python3-platformdirs_3.8.0.bb} (94%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.6=
.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-platformdirs_3.6.=
0.bb
> rename to meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.=
bb
> index 20b3299ac7..cda46ff754 100644
> --- a/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>  "
>
> -SRCREV ?=3D "85b0b67eb33a835b797c1d52dab4a06c5554b7ee"
> +SRCREV ?=3D "d5111a720733d2dcab9abdb94c0ab7377cdb6a9c"
>  SRC_URI[sha256sum] =3D "7954a68d0ba23558d753f73437c55f89027cf8f5108c1984=
4d4b82e5af396335"
>
>  inherit python_setuptools_build_meta ptest
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103601): https://lists.openembedded.org/g/openembedde=
d-devel/message/103601
> Mute This Topic: https://lists.openembedded.org/mt/99805066/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

