Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BD9C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 20:42:22 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.5496.1678740140526957695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 13:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZEsfdj7s;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id bh20so10393557oib.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678740139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHJZBINUDb6AgjxDwVDxL27xNP7GmtbERzf2YkStTsc=;
        b=ZEsfdj7sXPnyjvDOpc0g/NxVPDfvLQqehmuwXSGfiqP7Ptck96XjbWxBe82+JFZqAs
         Zhd96kSZ9GWamRN9BEvQxJAdjjgX0TsWgw0zqoxDRMOICxgZl6XatYwH8cW0ibrm+gKw
         KwQo3qX49KeBEVcrRqG1JF1D2jJWnlBgkPStseDtjryLSrEFzZsyfbOV2K82in9rNIh4
         B6u1s2knk+r93ZPnyhXeGzC975pALZoD0C8pnxQwGf0hRxLwwEfYfq1asnGaIG9XXu/J
         IeOK0kQVp4xlXdN0mYqvcQDWKQwPuvK/4qjgFxwwjBDiNArJZHGV79u40e2+7CuQfj2g
         hdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678740139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHJZBINUDb6AgjxDwVDxL27xNP7GmtbERzf2YkStTsc=;
        b=KaaJ5zmUSWL19j4WdFE3Xi7BgUYW+zhub0u1WiT88sBc2uikS6gYkwXyRZt36iuFs2
         k9dbktSPAuuJCagih3Bzlod7tNmBYS4aDAiIgE6UirUUF5Eb5HYRgYVRWBbsSBXSaq3i
         ALyLD77F6gX0wQXtapGMtNXp/D9I8tAXeBQpqklWEToTvmwovKksd9Yx+2uWvwnFsggt
         TJWBogFklcRhmL9WHmgN/kSRLtRzAJbIQW4b3vyEWL/jsSq5VQDBUULkw5CwYqbsJXV3
         Df0v2LkyOnwmeQ7aXOQNFkBmD9MsIvJ/rm7aPU7EBWhjOM0FxRp9sSdVixoth71QmEwu
         M23Q==
X-Gm-Message-State: AO0yUKUfbwsBaBmkup3xWFtJQTuiPUkpkZJwrnVKr/1xNwFPuaXBpS+t
	P9cesMs+86pRPFSnqSdhQ2Sr4P67O9C3bcbwN3A=
X-Google-Smtp-Source: AK7set8pOwioHkR5OF1j3e8ELJisYRDw2cUjEJ7QwooWfNrZNgtZrOl38n3T6XLDqnJbr7MDUrtssH780lMoEWBhYVA=
X-Received: by 2002:a54:470a:0:b0:383:f5df:9e85 with SMTP id
 k10-20020a54470a000000b00383f5df9e85mr10420709oik.4.1678740139166; Mon, 13
 Mar 2023 13:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <51289d1e-8204-a989-15a7-ed0574152e7a@gmail.com>
In-Reply-To: <51289d1e-8204-a989-15a7-ed0574152e7a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Mar 2023 13:41:53 -0700
Message-ID: <CAMKF1sr+0gZZWwdzMJHWrq77eYhV4ESHyEwrC_mGf8PVFbk_yA@mail.gmail.com>
Subject: Re: langdale merge request: March 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 20:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101515

merged thank you Armin

On Mon, Mar 13, 2023 at 5:52=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit b5b732876da1885ecbab2aa45f80d7a3086c52=
62:
>
>    mpd: Upgrade to 0.23.12 release (2023-03-04 07:24:09 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to 613dc6e1076efcb8c0aadf7728433e5841e6a6aa:
>
>    nodejs: Upgrade 16.19.0 -> 16.19.1 (2023-03-12 11:51:57 -0400)
>
> ----------------------------------------------------------------
> Khem Raj (2):
>        redis: Upgrade 6.x recipe to 6.2.11
>        redis: Upgrade 7.x to 7.0.9
>
> Mingli Yu (1):
>        php: Upgrade to 8.1.16
>
> Polampalli, Archana (1):
>        nodejs: Upgrade 16.19.0 -> 16.19.1
>
> Tom Hochstein (1):
>        nlohmann-json: Allow empty main package for SDK
>
>   meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
>   meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb =3D>
> nodejs_16.19.1.bb} | 2 +-
>   meta-oe/recipes-devtools/php/{php_8.1.11.bb =3D>
> php_8.1.16.bb}            | 2 +-
>   meta-oe/recipes-extended/redis/{redis_6.2.9.bb =3D>
> redis_6.2.11.bb}       | 2 +-
>   meta-oe/recipes-extended/redis/{redis_7.0.8.bb =3D>
> redis_7.0.9.bb}        | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb =3D>
> nodejs_16.19.1.bb} (98%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.11.bb =3D> php_8.1.16.bb} =
(99%)
>   rename meta-oe/recipes-extended/redis/{redis_6.2.9.bb =3D>
> redis_6.2.11.bb} (96%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.8.bb =3D>
> redis_7.0.9.bb} (96%)
>

