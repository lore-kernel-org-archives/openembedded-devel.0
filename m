Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE4EC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 06:20:18 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.17413.1673418008911841950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 22:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ItdXUsm+;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id x25-20020a056830115900b00670932eff32so8291841otq.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 22:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5GhJ3F5+QksXJN2X5LdFKOt1tsCtBh4cgBMI54PVzk=;
        b=ItdXUsm+Dw2kxaYE4n5W/pCgxK0pdHIGU1qP62sXaVZCbO4SraDBGVMQqjKZNpAeEM
         C1jRIv9LevdOw+UXPzE/QXx1xXqTWe6gAndwI1jNdSEpKU/QSGvHlpoha8SH/H8WZV1d
         ElwzH61IlFNc59qQk/5+PpOB2giz85z/vy8+onM0zjfLOvzK5h742YPwjqkisDBV9E53
         VPpynIpZwH8q67WKRYNv19OKGAUb91avYObUGHdxEVOPHOa5Xj94hTYCq5lpXcBAK0v9
         KwZSjgzsW8bR+ZsOl7O9ZptREdMi5Eu+oy6UbfUWACniBt6w7OmAgIX9XizuHFhewjFk
         VANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5GhJ3F5+QksXJN2X5LdFKOt1tsCtBh4cgBMI54PVzk=;
        b=eV/igS/9Y/ZPA7gZnKRdEQ3SEqNbHz4R8Y3lyZ0L51Tal+rgUQVSppjsP1+miJilKJ
         CWWM01MQWejAiKbVoqzdWwgww6UeE3WRDLn3GR8qek1DY1hPbvYVsocvVbuaLqi4E/tl
         L+7kM4hnBJuWyCUFRcLqRzTwjdwaZ3n87uAhwOctDCiwUCU0HuT+NBbbkdPD495lCDvQ
         iRC2GDslALv/DxNQSTV9jq3TMyv87CxhI8Te01I8Xye5cmxcLcd0mcY/141lOIUZkcsx
         B4fkd7Jz+R9g62Cncy40mZbCrywecw3HHEIB+ao1dUXM0Zn0Yw4SRW8Z37GVIeNSMvA3
         vS7g==
X-Gm-Message-State: AFqh2kr1WfgDeaqxK2/cMsTtvX4mSdcaj63+SmQTZH6tw3mS1YMuFJHJ
	uYz2y12UNA7gwkGFdDJxtS4Fpy8ZgE3fUQU9I9Y=
X-Google-Smtp-Source: AMrXdXuQLPR0NChtw/TVuVhir5qnnmYEVF2wsCjfaCrVIaY76/vOUyKdGJyV3a9Q6n6VEoXUNfe2la17vwvfecI+UzU=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr4375949otk.111.1673418007967; Tue, 10
 Jan 2023 22:20:07 -0800 (PST)
MIME-Version: 1.0
References: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com> <1673414714-13796-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1673414714-13796-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2023 22:19:42 -0800
Message-ID: <CAMKF1srGEZWM4GUgfmj-vRobEKsKs=MJWECFiWkuKwLo24SKrA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-cantools: upgrade 38.0.0 -> 38.0.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 06:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100543

its already submitted earlier and I have staged it in  master-next [1]
so I will drop this

[1] https://patchwork.yoctoproject.org/project/oe/patch/20230110105609.56178-3-leon.anavi@konsulko.com/

On Tue, Jan 10, 2023 at 9:25 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> Changed relative links to absolute links
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
> index 96e193d4f..c11606351 100644
> --- a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>
> -SRC_URI[sha256sum] = "b7d5465aba357ce4c103a7d38c9e01a6f12d8265090b4147b3cc1fa4c3adb993"
> +SRC_URI[sha256sum] = "be391520a43c8041ba99839a00a0a61b7afa929387def6c6348a9626b99f24d7"
>
>  PYPI_PACKAGE = "cantools"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100529): https://lists.openembedded.org/g/openembedded-devel/message/100529
> Mute This Topic: https://lists.openembedded.org/mt/96194678/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

