Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E7FC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 00:10:06 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.38349.1684282198358689782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 17:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r//aLnP0;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-541fb831026so26545eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 17:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684282197; x=1686874197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkFv6fCt1rnIvzvuoPFojuOSnfEJF5Fjl9y/YVj4uF8=;
        b=r//aLnP0jRkoWx0msza52U9qoUHlMDgSrffjcUqG7BJcNazAjFOMCiTVL43F1wd1Ao
         zVyO8t453Fdi8fUlEIto98eP8P53dNX6sFtZCZXCg8dOQahR4TgoPVzTjXntGEhbuUBf
         U5KqUYtMEEraWC75dEXTDON8yt9vpfMrPRPEO07DjvsCJYGYq3kPeP+uT/hWzRpP1AA7
         r0Oa6tKeb8vdfjpgLfy1JHB8IIL+470y7CpJtVmPgh6n9i+2jFASbOOqnDSu7Q4TBTZ3
         7WxLWptg+A74fZIjgWFSvKsWpmRHIGMv1XLwPy8IDpWU4xskiPYBkE7X2egqC68lgVAo
         3+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684282197; x=1686874197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkFv6fCt1rnIvzvuoPFojuOSnfEJF5Fjl9y/YVj4uF8=;
        b=WjSTcpF7VaDN45aZ+6Q932jgXDv28Bs8HIHGaNdhkUB7YsmVFVkSN8BBx+pLsuAy/v
         XghDUbcQfodm/6nMZLU4WoItSR2IsAm/FaRYFK3PdHvCLMRHzTxx9uev6GkVgYMDT1AG
         k8Ic+yKa7iFw1z8zene2KCznmH3XknPQVGfuh1EExLo3x4Ka2u+aaCRZoOYiiGpr6pXO
         LQjjsEgA+cStiDygz5Cpoccc2rOQ+xPtqIuB6APCpkK+uU6owNPd7M0WCJGwUL3cO38G
         vMtQSiJdXIYDNVhvnCD9uABQUVsq/Gj5J73F27cZZ4ojf2B094t4osnuk8sTogEJh8qP
         8p3A==
X-Gm-Message-State: AC+VfDx5BMAUYQRHRmBpJ9wE4DfC/kX0KZMDzB1Ciw0j4lY4xXCkOiTp
	ssUQjgWHJQreUlqsA1oebSXU7VZINO54niwjzfsw+1WK
X-Google-Smtp-Source: ACHHUZ42WHLasfGQ6oTYbMGmXRc184vUf9jBWRMkxVDjEFXLXutAO1r9lUqMJM9UhE59yXxuNt88nup+7MLCZvjcBao=
X-Received: by 2002:a4a:3553:0:b0:54f:810a:160f with SMTP id
 w19-20020a4a3553000000b0054f810a160fmr12178983oog.2.1684282197429; Tue, 16
 May 2023 17:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <5b54473fcbef595450b61ce60d280bff@amelkin.msk.ru>
In-Reply-To: <5b54473fcbef595450b61ce60d280bff@amelkin.msk.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2023 17:09:31 -0700
Message-ID: <CAMKF1sqfE0Q5vwC+2sG5wGHeadoabqQHhSSy=y4aQVjPDOrfgA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ipmitool: Update links
To: Alexander Amelkin <alexander@amelkin.msk.ru>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 00:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102637

Can you send it inline using git format-patch and git send-email ?

On Tue, May 16, 2023 at 1:32=E2=80=AFPM Alexander Amelkin
<alexander@amelkin.msk.ru> wrote:
>
> The project has been moved to CodeBerg.org.
> Update the links in the recipe and also bump to the
> latest revision (1.8.19.13).
>
> Additionally fix the link to the IANA PEN registry as IANA
> has changed their URL scheme some time ago and the old link
> started pointing to the HTML page instead of the text file.
>
> Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
> ---
>   meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102635): https://lists.openembedded.org/g/openembedde=
d-devel/message/102635
> Mute This Topic: https://lists.openembedded.org/mt/98903374/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

