Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10803C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 15:27:14 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.8986.1665674826739821726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6mL5IBX;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id o64so2069150oib.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6ty1gZIW684jqeocLBEJeYmjjg9B+bLDAYgLLHnykk=;
        b=W6mL5IBXlf88tUIQxel5F7GpHSFf+bvFuZZd78TVIzwDrNEzOIcqXFl8WYRV5XLR57
         A8ZzEQxbu10sg9oIIhaEsMZAG42aJrGI0ndpPYOWuLO2ZdrjFwepflkcIuUdh7NE/10B
         qaQ4HNO7tdqL6rtHpflYnjS//zDQ+7EqS1Du1AqY1GZJKKJb0d2ViqWFx7El8pEN1TU5
         ir582zH2k0yLGTNtFiSUURs2mgeO1G1ruJvFsG93vtzbg2H4yijyZeRlVrKsHpkE4iLH
         0p59i0+GK+9xqBW6RIkkle2ZfRgp+Z8WMt9hxnWHksexBy9dz7jJI7PMsj1tx+R26fD1
         S3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6ty1gZIW684jqeocLBEJeYmjjg9B+bLDAYgLLHnykk=;
        b=dCG9FpKDSqxDD6+/HRlwXEjqe5tCYqprcVgTa1f6gh9lqUmhHN4gzQZ6PXr8GUUYnv
         5R74dJgBnU4qsLn0Buf4muczI78foS81lQiygELd55+o3ddEv8+5osmhQFJ/gv/6f021
         s+2cEY8sXe1YLFjq2HTLuJ+V2BJpdPOX4QFlexFdpeyT5EDFNGFqKP0iM01MFlWu9fxl
         gfHlO4BioXEqIUoIQtnqCRmP64XyNoa2sy3S0nLd/1Up+xmqcE3xVH/Ch5nBG+uken5s
         qX2Q+BOslauVh3v/efDPDsOA+KYiYGJeQSuTAU5Bu8tMDNu1d4gUr1LK/wwvoF/U796j
         xp7w==
X-Gm-Message-State: ACrzQf18o4m9BJfUI9DRdnbUUGHcKkEhPihA+QTO7AW3tt0oBF5hORGM
	Mehe/4mGcpBXgXSMeuETA7UlS31dq8h7gdvGHCE=
X-Google-Smtp-Source: AMsMyM4T+GlPvL81Xqb9ljn5sDNjpLKxNUVgGLNF/EOIK4mvo0AicAwg3MY6m5Dul3ekvIaAhQ2Ee8wz61v9XKJ+wtk=
X-Received: by 2002:a05:6808:1910:b0:354:c2b:67e4 with SMTP id
 bf16-20020a056808191000b003540c2b67e4mr4936919oib.55.1665674825782; Thu, 13
 Oct 2022 08:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <f4555291-0c06-53bf-b92c-ec0f71ba88b6@gmail.com>
In-Reply-To: <f4555291-0c06-53bf-b92c-ec0f71ba88b6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2022 08:26:39 -0700
Message-ID: <CAMKF1sqaCrUgbsJdk0kM6YnvyP81C_NXOgB-dYCtRhqBEb1L5g@mail.gmail.com>
Subject: Re: kirkstone merge request: Oct 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99160

merged thanks Armin.

On Thu, Oct 13, 2022 at 7:43 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 05dcac98473402d87e0af73bbc2c5a6a840abe93:
>
>    postgresql: make sure pam conf installed when pam enabled (2022-09-15
> 08:39:48 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to bd2d8fba766f912bd1bc5cde7d6f0e72152f1547:
>
>    minicoredumper: retry elf parsing as long as needed (2022-09-25
> 11:03:26 -0400)
>
> ----------------------------------------------------------------
> Khem Raj (1):
>        audit: Revert the tweak done in configure step in do_install
>
> Martin Jansa (1):
>        libcec: fix runtime dependencies for ${PN}-examples
>
> Richard Purdie (1):
>        lmdb: Don't inherit base
>
> Sakib Sajal (1):
>        minicoredumper: retry elf parsing as long as needed
>
> Steffen Olsen (1):
>        postgreql: Fix pg_config not working after buildpaths patch
>
> Wang Mingyu (1):
>        postgresql: upgrade 14.4 -> 14.5
>
> Yi Zhao (1):
>        frr: Security fix CVE-2022-37035
>
> wangmy (1):
>        php: upgrade 8.1.9 -> 8.1.10
>
>   meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch  | 151
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb                         | 2 +-
>   .../files/0001-config_info.c-not-expose-build-info.patch        | 11 +-
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   .../postgresql/{postgresql_14.4.bb => postgresql_14.5.bb} |   2 +-
>   meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} |   2 +-
>   meta-oe/recipes-extended/libcec/libcec_6.0.2.bb                 | 3 +
>   ...001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch | 128
> +++++++++++++++++++++++
>   meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb   | 1 +
>   meta-oe/recipes-security/audit/audit_3.0.8.bb                   | 2 +
>   11 files changed, 302 insertions(+), 7 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2022-37035.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.4.bb =>
> postgresql_14.5.bb} (83%)
>   rename meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} (99%)
>   create mode 100644
> meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
>

