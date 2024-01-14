Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B059DC47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 14:17:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.39389.1705241875566427677
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jan 2024 06:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxipLAAh;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd5b467209so74890731fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 06:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705241873; x=1705846673; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SfBinZwS8jZAK83fvk6wcmvQYRbnUNErnT1qJDofFF0=;
        b=XxipLAAh9Wtzk5AJ3yERz6A7hRkMCnjhvE9v7MAreik5w+ih199X1CeKJLI8nQwWSA
         FkN+40vG6MhkYB92yVEmZEy0J/mGzI2sIV0wTDFW21vT2D7oN544VV1We0757XmIsJ71
         kOfQl9ASSi2uVVt5FZkSyhlDEzVCmogYrmcXb10cYY70YgxFp4kCiXolhsCeuZbQO8jf
         ALRSwC0SWLLo1mBDuP7wzTdtcC31fCwyfb2BtHibTgdt4WqJejO8HGnVkOAXwjyTkfTm
         B1VIp66X9U/Fs53btf5nBdS4mES9vRDD64bbNne7xPLspbqw+5qeqk6ibbFsWrLfc9pj
         7dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705241873; x=1705846673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfBinZwS8jZAK83fvk6wcmvQYRbnUNErnT1qJDofFF0=;
        b=pJP/NAnecv1GDwidekNWWs1FN2wIyvde2niQqNUOrkFyeaniUDoawkGMxYImy7VZ2u
         m5rUOGnfnzGwITkAJ7uUgX1fiZp1emCTu67v4R8PlByhRSw4OFjI5o2In8zYCROp7vky
         uUvYAdSuf9jyKk+l4fTfpEikwpwpep6oAZqW75Uk8v1qtKNCrc1CI7wAgVj4VAvSoioq
         dZyN4N645yWUigKeOYlPD38CgfOglf5VReCwBZA2aAsLaAGal/9fcK6bqAsoQdhiZ1SA
         80uZw49FOycHrFnGjafYsYfKHze/h9wa51cxaVGhMehuUxK6//NbgKGLe0spXUVA0GeR
         Gqfg==
X-Gm-Message-State: AOJu0Yw6FXb1lUn688v7XXWqSoI+6G1/wMzLQIvmu4vsWMkqAT6N8+z5
	nO5tKK/8POSbW1MsAzBVLsJf6I3UzOMehWUuKL8=
X-Google-Smtp-Source: AGHT+IHI7Ct8aVlBCLWbPNI3wSxp5lSwetLr+FI5UoSYNar2Yn0jwAHQmHskAiYQOTiLEu3y0yuD49PJtEYiNYnyqM0=
X-Received: by 2002:a2e:a801:0:b0:2cd:b2f9:291c with SMTP id
 l1-20020a2ea801000000b002cdb2f9291cmr893436ljq.38.1705241873130; Sun, 14 Jan
 2024 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20240103093943.959731-1-peter.marko@siemens.com>
In-Reply-To: <20240103093943.959731-1-peter.marko@siemens.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 14 Jan 2024 15:17:41 +0100
Message-ID: <CAJiuCcfVA6H=L3-3+PRnJKdpcU3YR2JGDx11W2vUQ+C9TN4T=w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf-c: upgrade 1.4.1 -> 1.5.0
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 14:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108274

Hi,

On Wed, 3 Jan 2024 at 10:40, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Current hash pointed to version with code already indentical
> to v1.5.0, it was just missing three formal release commits:
>     a15d80a Bump copyright years to 2023
>     6600fd5 Bump version to 1.5.0
>     8c201f6 CHANGELOG.md: 1.5.0
>
> License-Update: copyright years refreshed
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../protobuf/{protobuf-c_1.4.1.bb => protobuf-c_1.5.0.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.4.1.bb => protobuf-c_1.5.0.bb} (91%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> similarity index 91%
> rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> index 1d9ca9daae..545618a4ec 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
> @@ -8,14 +8,14 @@ has been split out into the protobuf-c-rpc project."
>  HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
>  SECTION = "console/tools"
>  LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d11077c6a2b5d2e64b9f32b61a9b78ba"
>
>  DEPENDS = "protobuf-native protobuf"
>
>  SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=next;protocol=https"

The branch=next should be updated here as well.

Regards,

>  SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
>
> -SRCREV = "ba4c55f0e686e0252c451f7163ab529e4b36831a"
> +SRCREV = "8c201f6e47a53feaab773922a743091eb6c8972a"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108029): https://lists.openembedded.org/g/openembedded-devel/message/108029
> Mute This Topic: https://lists.openembedded.org/mt/103499083/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

