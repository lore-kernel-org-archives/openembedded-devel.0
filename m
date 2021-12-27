Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C93C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 23:12:38 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.32337.1640646757840849544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 15:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YBND9/Vo;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id p19so14701509qtw.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 15:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=spKIio6DP+B0+HUij7HVER+QQU2G32VYpm751vJ9CDo=;
        b=YBND9/Voaj4+8BEctFCzVwDxlD5KWdmTnJQMgRJ9/07zmxPtKbDHiqigwlk0XQ1xYm
         EjKO+4AIZurL6SL3d13yXn3U5yEDqTsN7Vs6TEg9j8WLaA7xfx1qZ15uVxSTSeUG9r7Q
         p1ldhEQKA6K7xcd5W/F6mz0SHemVgTADXPwOWUi05YHNBFol+jo36EGGHLBG443IFl7X
         uG+JP7+r+PKDFx9OFPLX51zPTrOmoJgT3Uh08La4LVMBUmaxzqZCFJ314CVXBGKbQbxL
         K2+p9w/KJpiJUTZKMhkIbTYqA8E3aBytb9TTjX3CLGZqunbbSKlTF2l1xICuCfvekL1h
         Dzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=spKIio6DP+B0+HUij7HVER+QQU2G32VYpm751vJ9CDo=;
        b=d4twwJzdVxo0TMEhwihnXdormX5Zdio7aehViEOh0FmJwz8wzoHVbjX51qeVwZo4ND
         g0NEoy4LCiPudXT6pWiUEWKvHuoaurCbfr1D1rcDfe/VjVGTqLfWUx3h5fh7k51n7AuN
         VxkeA6KWySAZztfNWxn7NZOtbT9dhJqLHDIrEz9Wd/10F6ER4PfnXHpKUpUIhplpuANe
         QJmVbgnxsrWY5DNA8RSa8MfxKuboJ5JzRZsIKLRxQYCNSSeTuBbmjAAowj6KvjodxAiA
         9HUtYbY/eKFFxyXaHJKCYfnhErQ4q7R3tvTrjSLqA+k1YyMAVMIaYYlKi/teYaOaJZF5
         qMFg==
X-Gm-Message-State: AOAM532xhw8zRbi/w53lHEV23WzGpDM1nL2r2sHgyIZKtYBeA07Ig97U
	tmKCsBhy3hpIqWnIE41N1m5s+vHP6+kkyTnrh7aoKLG3Dc8=
X-Google-Smtp-Source: 
 ABdhPJwdFiWV3PfHf8L9/ilN89TIjYtdT0efPWs9EE3VEdlST9eJVgG//PDYZeopimlMSoBh8n2l+CJMsjOhjvG7IB4=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr16583875qtw.185.1640646756932;
 Mon, 27 Dec 2021 15:12:36 -0800 (PST)
MIME-Version: 1.0
References: <bb1d3ba0-8f41-b86c-5a15-2391d91bad2d@gmail.com>
In-Reply-To: <bb1d3ba0-8f41-b86c-5a15-2391d91bad2d@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Dec 2021 15:12:11 -0800
Message-ID: 
 <CAMKF1sqzzO9fB_d7ova9YGSiqRoYSvBg2yxi-oo_zULEgsCEpg@mail.gmail.com>
Subject: Re: dunfell merge request: Dec 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 23:12:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94526

merged thanks

On Mon, Dec 27, 2021 at 2:56 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 69f94af4d91215e7d4e225bab54bf3bcfee42f=
1c:
>
>   brotli: add patch to fix CVE-2020-8927 (2021-12-03 12:28:09 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 95969f0f5f4264644a5dbfb6d4fb66e2ac3a2cde:
>
>   dovecot: refresh patches (2021-12-27 13:23:37 -0800)
>
> ----------------------------------------------------------------
> Armin kuster (1):
>       dovecot: refresh patches
>
> Ernst Sj=C3=B6strand (1):
>       libmicrohttpd: Add patch to fix CVE-2021-3466
>
> Jeremy Puhlman (1):
>       c-ares: switch from master to main
>
> Robert Joslyn (1):
>       postgresql: Update to 12.9
>
> sana kazi (1):
>       nss: Fix CVE-2021-43527
>
>  ...1-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch |  19 +-
>  .../dovecot/dovecot/0001-doveadm-Fix-parallel-build.patch       |  13 +-
>  ...4-lib-mail-message-parser-Optimize-appending-new-part-.patch |   8 +-
>  .../postgresql/files/0001-Add-support-for-RISC-V.patch          |   6 +-
>  .../postgresql/{postgresql_12.7.bb =3D> postgresql_12.9.bb}       |   2 =
+-
>  meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb                 |   2 +-
>  .../libmicrohttpd/libmicrohttpd/CVE-2021-3466.patch             | 158
> ++++++++++++++++
>  meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb   |   3 +-
>  meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch            | 283
> ++++++++++++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb                       |   1 +
>  10 files changed, 467 insertions(+), 28 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_12.7.bb =3D>
> postgresql_12.9.bb} (73%)
>  create mode 100644
> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/CVE-2021-3466.patch
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2021-43527.patch
>

