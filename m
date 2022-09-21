Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D63ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 13:04:52 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.6101.1663765485189175865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzISvLfh;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so8862612fac.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ekfI1Pz1Q6LMXHUTN2Qu9u6J6B6AnX8VwJQVgkW+7NU=;
        b=WzISvLfhZN4MC9pYUdyqQyP05AeX4zn7rSYPdti69caz2od9uYdLmn5ZLGUHNqkspl
         SsHIzKcQmY04xlmqOBH8a+s3PEXueKnXKJ9sDQVGed7dxNHTt+MaRzxtlkCIidNZBZfl
         B9ewEVm2nn/UwoiT8D/CcIkY9aup2CgBERyNYavr5XbnFKlVrz0x7z2tRpqW3JuJ4UAT
         6Zr+Xn+kL/Hwt50qNixM7LtZfc8T2CGamZ+Aihh/ho7FFRLrCdgLrO5fFlkMWA/ldF7c
         agsRKjKqMEsEA/Y9kuNFb6BqAkZJlmWGXM8aD3E9DMqT7X+QahElh9WLypZ2AkLUIv1W
         UitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ekfI1Pz1Q6LMXHUTN2Qu9u6J6B6AnX8VwJQVgkW+7NU=;
        b=n1CkY/yXAqapdGzZnPabYHX7omcUhQP9A8cSRfu2nLY+r6SpnKbmQ4TKDv2oeTrqRk
         sAoVTQzUKOZbzMisoSUY8495RDWSrEcm1p9pGZKylpOOmnhnBt1WkwQ01e1knPzAxmy2
         j0Hry6Iu3nroxSeK58cj7vAN6ACgrSUwkywPm34Wx0kxc/6MYPMHb2XVNf7ooCmobK1b
         KcnKv2evPABFauBVwFrx4/rfhyJg3Y8mYRgD2PbsWUUipr5iMbZ/X3rjWqzvQHQtTJOf
         jP91a5saJD5EmVOi/iSCtvmDRGxUiUvc376n96K6ksnfILUjghkSamC6do8Cra5i/MVL
         7HUw==
X-Gm-Message-State: ACrzQf3X0PMFSNN4yR2um4yUtqoYc9OvpZgVyuuYtqIv0JhtqGveb88S
	MzVw2kuJ1MHN5HzM9JCrldT6lmJP9set6oVbejg=
X-Google-Smtp-Source: 
 AMsMyM6h6fsLTwwN5YwOKkq7QWzwETQkGQrt514nfkfSp48yMLqwiBPRBeU/ccXFtPCKTvL5iJuCXHA4cnLCRdlWSfk=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr4871047oae.262.1663765484318; Wed, 21
 Sep 2022 06:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <dfb587f1-2ce8-0a53-07f8-98a23d84e919@gmail.com>
In-Reply-To: <dfb587f1-2ce8-0a53-07f8-98a23d84e919@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2022 09:04:17 -0400
Message-ID: 
 <CAMKF1sr8qadc2AmaEOPDEUk74RGOtAhturYXDK9FpKLDyOe2qw@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 21st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Sep 2022 13:04:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98915

merged thanks Armin.

On Wed, Sep 21, 2022 at 8:41 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 8f96c05f6d82fde052f2cb1652c13922814accb0:
>
>    lmdb: only set SONAME on the shared library (2022-09-04 07:52:16 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 05dcac98473402d87e0af73bbc2c5a6a840abe93:
>
>    postgresql: make sure pam conf installed when pam enabled (2022-09-15
> 08:39:48 -0400)
>
> ----------------------------------------------------------------
> Enrico Scholz (1):
>        nodejs-oe-cache-native: initial checkin
>
> Jose Quaresma (2):
>        wireguard-module: 1.0.20210219 -> 1.0.20220627
>        wireguard-tools: Add a new package for wg-quick
>
> Khem Raj (3):
>        ntpsec: Add -D_GNU_SOURCE and fix building with devtool
>        gd: Fix build with clang-15
>        safec: Remove unused variable 'len'
>
> Mingli Yu (1):
>        postgresql: make sure pam conf installed when pam enabled
>
> Wang Mingyu (1):
>        php: upgrade 8.1.8 -> 8.1.9
>
> Yi Zhao (3):
>        libldb: upgrade 2.3.3 -> 2.3.4
>        samba: upgrade 4.14.13 -> 4.14.14
>        samba: fix buildpaths issue
>
>   .../samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch   | 38
> +++++++++
>   .../samba/{samba_4.14.13.bb => samba_4.14.14.bb} |   3 +-
>   ...-module_1.0.20210219.bb => wireguard-module_1.0.20220627.bb} |   4 +-
>   .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 14 +++-
>   .../recipes-support/libldb/{libldb_2.3.3.bb => libldb_2.3.4.bb} |   4 +-
>   .../ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch  | 29
> +++++++
>   meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb          | 6 +-
>   .../safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch | 42
> ++++++++++
>   meta-oe/recipes-core/safec/safec_3.7.1.bb                       | 3 +-
>   meta-oe/recipes-dbs/postgresql/postgresql.inc                   | 2 +-
>   .../recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache  | 77
> +++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb | 21 +++++
>   meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} |   2 +-
>   .../gd/gd/0001-Fix-deprecared-function-prototypes.patch         | 115
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-support/gd/gd_2.3.3.bb                          | 1 +
>   15 files changed, 348 insertions(+), 13 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
>   rename meta-networking/recipes-connectivity/samba/{samba_4.14.13.bb =>
> samba_4.14.14.bb} (98%)
>   rename
> meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20210219.bb
> => wireguard-module_1.0.20220627.bb} (85%)
>   rename meta-networking/recipes-support/libldb/{libldb_2.3.3.bb =>
> libldb_2.3.4.bb} (95%)
>   create mode 100644
> meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
>   create mode 100644
> meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
>   create mode 100755
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
>   rename meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} (99%)
>   create mode 100644
> meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch

