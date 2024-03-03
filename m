Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE79C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 21:55:35 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.84022.1709502927465605022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 13:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kg1VeIKa;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a0e5f083f1so2251027eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 13:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709502926; x=1710107726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK2KVd8wOWHltQ9O7R/8lz0GKJhAZnHRKRw5LUpXBZY=;
        b=kg1VeIKamvyrH9p9tIM7VbHxk94i0qHo6syf97M1+OgwpVCyOfbo4dfaioxUFKDjTC
         eMlimLQQiQjg4Lxc1OaTUa6LyfXZ1fDIHGAgpkEqM9Tz7ccz7QTXnYeRpnL/L2Wd/izN
         lxUkPKJ69jT4Ht4rSBiMJ1S7dFLv8N0o8p97hnWUlhDsQ5mECE3SOJsGVJzjLTerbj+n
         TP2hoY6uoXMY9BR1DyiLJkOxLYFWV4+A1j1/6shFkvoJMlQyOQybas/h4yr3tRA9BCkp
         I9oPzDifttW2Q9N3oahOq/cWyDhavPlzeKzq/1bIamyc/Jj2TR0kVUtAk7f/tqHg9l2L
         5EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709502926; x=1710107726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK2KVd8wOWHltQ9O7R/8lz0GKJhAZnHRKRw5LUpXBZY=;
        b=XRaF5tykbvd+hDMKhtKckJZKoKKJWrb629ti+V1GJU1lCcaT2WmuakuditqVxDp/fB
         OP70xdeWzARBMpP/74t3vQqS4zF6TfOAc4f1ZVJuRUjXLkNjD+BljZsTEQU83CLtd6d9
         bo0tRSNtPOKpRWTopuJ+/zey9y5ytTn0Oga1MSCC9a9cJ6iJCRHl2MexlTfQlUMMEFEe
         NU0DrmQlFoyt9CpMHYqxAbn0yU9tI6VfCbHKQuDey4GL4arfpRJwJMgq1MceQXSmgtf/
         L7wPpNu/Y76CRfdC/R4uwhmA2pphWRXEY0ZqfeNpVphiy6CyG50xkA5yx1MFmU1wQ66R
         Yfxg==
X-Gm-Message-State: AOJu0YxCGw5G1lJMvRvkoCnduY5qxmqXShUNgUnqiQ4g9H3QWBJOrm1d
	WAKQJNRADPO21sv0aGTKSZPT9u9Ty7j3KsWxfF7I07oOBrHhhVt/8ekhm8A1GiF8TgEPiy5l7s3
	LPXUw16Ch7N9vJw5yXqPcBtAQRD0=
X-Google-Smtp-Source: AGHT+IH8RUtl7/t+yOx9ITctg1cpSiFbQ4GHIumbCkY8FoWv+UIf/o7QMnPForaxnevmSS0h9Cd9DNpaOgJrQyt7zZw=
X-Received: by 2002:a05:6871:80e:b0:21e:6d93:7bca with SMTP id
 q14-20020a056871080e00b0021e6d937bcamr8893761oap.59.1709502926557; Sun, 03
 Mar 2024 13:55:26 -0800 (PST)
MIME-Version: 1.0
References: <6155dc8a-5054-4273-84b8-9ac7c5604e8b@gmail.com>
In-Reply-To: <6155dc8a-5054-4273-84b8-9ac7c5604e8b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Mar 2024 13:55:00 -0800
Message-ID: <CAMKF1srxe7W0ZOTLN57QR+6oJf9UCmjtXf2qfMg38CyCZT0-3Q@mail.gmail.com>
Subject: Re: dunfell merge request: March 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 21:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109093

merged. thanks Armin.

On Sun, Mar 3, 2024 at 1:41=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit daa4619fe3fbf8c28f342c4a7163a84a330f76=
53:
>
>    postgresql: Update to 12.17 (2024-01-16 07:31:14 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to c74ebbddfd9dbe02d3f7422016324451eb218e1e:
>
>    python3-pillow: Fix for CVE-2023-50447 (2024-03-03 16:38:27 -0500)
>
> ----------------------------------------------------------------
> Ashish Sharma (1):
>        wireshark: Backport fix for CVE-2023-1992
>
> Changqing Li (1):
>        linuxptp: fix do_compile error
>
> Hitendra Prajapati (2):
>        apache2: upgrade 2.4.57 -> 2.4.58
>        wireshark: fix CVE-2024-0208 GVCP dissector crash
>
> Hugo SIMELIERE (1):
>        libuv: fix CVE-2024-24806
>
> Khem Raj (1):
>        gdm: Add polkit to required distro features
>
> Vijay Anusuri (4):
>        squid: backport Debian patch for CVE-2023-46728 and CVE-2023-46846
>        squid: Fix for CVE-2023-49285 and CVE-2023-49286
>        squid: Backport fix for CVE-2023-50269
>        python3-pillow: Fix for CVE-2023-50447
>
> Wang Mingyu (1):
>        openwsman: Change download branch from master to main.
>
> virendra thakur (1):
>        nodejs: Set CVE_PRODUCT to "node.js"
>
>   meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb |    2 +-
>   meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch |
> 608 ++++++++++++++++++++
>   meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
> | 1154 ++++++++++++++++++++++++++++++++++++++
>   meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch |
> 169 ++++++
>   meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch |   35=
 ++
>   meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch |
> 87 +++
>   meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch |   62=
 ++
>   meta-networking/recipes-daemons/squid/squid_4.9.bb |    6 +
>   meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
> |   62 ++
>   meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
> |   42 ++
>   meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb |    2 +
>   meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch |   32 =
++
>   meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch |   30 =
+
>   meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb |    4 +-
>   .../linuxptp/0001-makefile-use-conditional-assignment-for-KBUILD_OUTPU.=
patch |   42 ++
>   meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb |    1 +
>   meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb |    2 +
>   meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb |    2 +
>   meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb |    2 +-
>   meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.pat=
ch |   31 +
>   meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.pat=
ch |   54 ++
>   meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.pat=
ch |   44 ++
>   meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb |    3 +
>   .../apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.p=
atch |   31 -
>   meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch |
> 141 -----
>   meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb =3D>
> apache2_2.4.58.bb}      |    4 +-
>   26 files changed, 2474 insertions(+), 178 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46728.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46846-pre1.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-46846.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-49285.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
>   create mode 100644
> meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
>   create mode 100644
> meta-oe/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
>   create mode 100644
> meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-conditio=
nal-assignment-for-KBUILD_OUTPU.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
>   delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch
>   delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/CVE-2023-45802.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb =3D>
> apache2_2.4.58.bb} (97%)

