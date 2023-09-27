Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15D9E82CC9
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:20:47 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.26331.1695842446009421555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hndkt3GD;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1dd54aca17cso3207705fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695842445; x=1696447245; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W7gpqTW1YKNir0nT1MQnz4rmJ2b16qqBkJbh9ZFzJs=;
        b=Hndkt3GDTUMhuugvlyXZpwWPXnMARu886G1hUbFyrBE8zFcpMDQMWuIhloJnnN9qZ2
         3Bc9+8K1S2aH62oC12T5PXt4KGsupzE910hmPTgcOQRVpg2ivkKAiMxOlCWELRcjvlim
         2Y7G2SSEn4+gIHU2vjDJKT/dzDDwzi/4Pb+iZGjBZ0Py34LJEc6uUAWifLoqaSsRFSN7
         tiun8u6QpZ7Jx4NcwomILwj0LvQBVuzL0jq0If24nxB3ehpoF23TtEYYvhj07vu8tDaq
         u1RlhZzq8jloFSdX14RNbW0hJT+PrAlma1RjTS2yjZWDQDWyYKNyRR73mAmTk3ppkEJi
         fKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695842445; x=1696447245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W7gpqTW1YKNir0nT1MQnz4rmJ2b16qqBkJbh9ZFzJs=;
        b=GGlmXiwPLMntW43X1U4jOBaFC2GlDszQTWlx+l8Mr3IHzaGY3tTMUorRCryBbCN7Dn
         Rcl99TaEFsHF2kAabIvre920fa6UXQQUSR6bckHmlj7n7MDnOFsmacLdCPhQcN/TZ37l
         pQ6qSF05zoVbQvf74KC0+ztkilkHIAL18JdqCqr9z7UwYelAel4AddsKBwdvaybUqrMe
         SJsMejM9DVK4k+gnIOkEOWNhuZbGX/M5956NYZLm8qJVvfVjK/xh0GoG0NWvzppNSfFr
         Cfzk7WjDiRDmXH4Qv1WQ4gQJ65JLsXuPG1qXrNiSaPq7dYOlyZ5qyEuUnPPkdYgsWMk2
         /T2w==
X-Gm-Message-State: AOJu0Ywdh+RgGp9Hv/r0MnH28C1surreEqAumUGQlVPep50J2mvSh3y+
	KeOeVmkBCchFq8tHwnlI1UdZoIw/ROcdhb6kkXw=
X-Google-Smtp-Source: AGHT+IGPCdgfwfazJu0HpmsSgJnBm69HeJ/u8g3jsaN98VgCEPUgPElrJ5pakBwdV8RvgZPs6NhaX83ufa3lL78n1fE=
X-Received: by 2002:a05:6870:b50d:b0:1d5:b0b9:f6f1 with SMTP id
 v13-20020a056870b50d00b001d5b0b9f6f1mr3509570oap.8.1695842445245; Wed, 27 Sep
 2023 12:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <106a5b7b-060d-4a20-e508-82e220c23e39@gmail.com>
In-Reply-To: <106a5b7b-060d-4a20-e508-82e220c23e39@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 12:20:19 -0700
Message-ID: <CAMKF1sp+FNkjPU1PYshw=YmDXa3cJvGK__+i_pF7AQ9f3nqs4Q@mail.gmail.com>
Subject: Re: mickledore merge request: Sept 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 19:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105198

merged thanks Armin

On Wed, Sep 27, 2023 at 4:43=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 32c529d435c45e60151c714936d451ed9e3414=
66:
>
>    poppler: fix CVE-2023-34872 (2023-09-19 07:22:00 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 922f41b39f364e5b6be596b4b51e0fb37ffe1971:
>
>    x11vnc: Fix CVE-2020-29074 (2023-09-27 07:40:56 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        openldap: update to 2.5.16.
>
> Lee Chee Yang (2):
>        opensc: fix CVE-2023-2977
>        x11vnc: Fix CVE-2020-29074
>
> Sanjay Chitroda (1):
>        netkit-telnet: Fix CVE-2022-39028
>
>   .../recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch     | 53
> ++++++++++++++++++++++++++++
>   .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb          | 1 +
>   meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch      | 27
> +++++++++++++++
>   meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                | 1 +
>   .../0001-configure-Pass-pthread_t-to-pthread_detach.patch       | 32
> -----------------
>   .../openldap/{openldap_2.5.13.bb =3D> openldap_2.5.16.bb} |  3 +-
>   meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch        | 54
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-support/opensc/opensc_0.23.0.bb                 | 1 +
>   8 files changed, 138 insertions(+), 34 deletions(-)
>   create mode 100644
> meta-networking/recipes-netkit/netkit-telnet/files/CVE-2022-39028.patch
>   create mode 100644
> meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-t=
o-pthread_detach.patch
>   rename meta-oe/recipes-support/openldap/{openldap_2.5.13.bb =3D>
> openldap_2.5.16.bb} (98%)
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
>

