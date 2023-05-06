Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FBEC77B7D
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 00:29:42 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.13149.1683332972346039790
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 17:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g6VlQocf;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-38eda4ef362so1362986b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 17:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683332971; x=1685924971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goAn2x423FBxccNp5GiDjw777KU+IreWlJfGrEd6C5E=;
        b=g6VlQocfhCw2jckik6cL7k4wz1o8Yx+Hnd5QZpFwgszH0YXmad6LUePmJBgTyziNNg
         RMTlF1RlMYFxG9nNpqnzEMQzTHCO73gvMQFZPGeMmu7PQYhskC4kjf8XlffPMUjcqEwE
         q+61wt1HRoIsOXljLwlH7JAj2KN1v8AnBa8+lvaN96UI5h1VkAIWnlDdIbBHqwQ2fGpE
         x3XwnUOoTnJ7iLMYl/aJ3l5mu/oYYnMn+ZaxuEUFfxXpKmSH85/SGN17dsOALkKCBVBf
         0iyF9I+LT+VfpNGixW1KaqcxKOLkDSNQ8ALq0Wk2gcv91BgU2BeaQwM08aCDhWW+nVFf
         REvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683332971; x=1685924971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goAn2x423FBxccNp5GiDjw777KU+IreWlJfGrEd6C5E=;
        b=GTTAJXuQeuJH9SicuzjRp9TBRUsZozn6z1dQgX0+y7SBvHS6fhQV8gE3EcZXEU7RGJ
         lD2id9bMVF9iRMK2ZzF/T9wlooTVNuGxBNeLokAMt2tdSKuitesu2gieXW+8OOq3eToz
         msZvK47ocT8dHHy/Aa+HcBMKwPz+3QRIa1O5aWtf08PLYauKrF9YT5Ng3ljynYMSSr4l
         IHpzcjgEvjFE50gmMmRlpzgdINrJWQElGPS7Sc+u5r08nEDbSDQNOZSiXbjRd9rGafLJ
         JkYorSgiRIb7er46MDrPuoYqI3VNglyBG1pxolG48s3uitNAHr+SRCPM3AOVzeWjy/Ij
         d6dg==
X-Gm-Message-State: AC+VfDwYmGIRDOX67LRvCWHZpQqHuIfzexaJ3D+/NarfEb2UDW0iThGh
	ylxHx17wTi7ghYRyUFum/A+1vyH0xZznQ0q2mRY=
X-Google-Smtp-Source: ACHHUZ7Q1mPbb5X7uvUtSm/rrNG5tuK6y4UGWLaBGgXQXIbBpUuVqjv5S0oRp7BT+C60eFZ8lNzqUVgXH+o3T0edWRg=
X-Received: by 2002:aca:1210:0:b0:38e:4085:a36f with SMTP id
 16-20020aca1210000000b0038e4085a36fmr1482609ois.56.1683332971392; Fri, 05 May
 2023 17:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <5ff0489a-9a5b-6a89-e4fd-f73e7c883161@gmail.com>
In-Reply-To: <5ff0489a-9a5b-6a89-e4fd-f73e7c883161@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 May 2023 17:29:05 -0700
Message-ID: <CAMKF1so16UkaCD+6RONM0_C_vA_6iW38cAz5rDWdgpvDdZZRDA@mail.gmail.com>
Subject: Re: dunfell merge request: May 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 May 2023 00:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102321

merged now. thanks Armin

On Fri, May 5, 2023 at 3:58=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 7007d14c2558f86a49c2e2acb6154432c2ba40=
92:
>
>    mariadb: Update to latest lts 10.4.28 (2023-04-06 07:32:45 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to e39b002df9675776cc99dccdcac07607ce783b15:
>
>    multipath-tools: CVE-2022-41973 Symlink attack multipathd operates
> insecurely (2023-05-05 07:20:59 -0400)
>
> ----------------------------------------------------------------
> Alex Yao (1):
>        lcov: Fix Perl Path
>
> Hitendra Prajapati (1):
>        multipath-tools: CVE-2022-41973 Symlink attack multipathd
> operates insecurely
>
> Hugo SIMELIERE (3):
>        openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
>        openvpn: upgrade 2.4.9 -> 2.4.12
>        libmodbus: Fix CVE-2022-0367
>
> Viktor Rosendahl (1):
>        jsoncpp: Fix broken handling of escape characters
>
>   .../openvpn/{openvpn_2.4.9.bb =3D> openvpn_2.4.12.bb} |   7 +-
>   ...1-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch | 52
> ++++++++++
>   meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb               | 5 +-
>   .../recipes-extended/libmodbus/libmodbus/CVE-2022-0367.patch    | 38
> +++++++
>   meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb           | 5 +-
>   meta-oe/recipes-support/lcov/lcov_1.14.bb                       | 2 +-
>   .../recipes-support/multipath-tools/files/CVE-2022-41973.patch  | 154
> ++++++++++++++++++++++++++++
>   .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 4 +
>   8 files changed, 262 insertions(+), 5 deletions(-)
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb =3D>
> openvpn_2.4.12.bb} (91%)
>   create mode 100644
> meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-se=
nse-in-isAnyCharRequiredQ.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2022-0367.patch
>   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/CVE-2022-41973.patch
>

