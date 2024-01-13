Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5988FC4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 17:13:32 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.23214.1705166003022417080
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 09:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6b3ALxb;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-204301f2934so4921319fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 09:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705166002; x=1705770802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+HXAfHWzlmUD2jF3cOseN2QuWj86wCy/DNdda08S1M=;
        b=G6b3ALxb/RUDfTXNSXq7LJWhPrPExiyU7rqpciIdLZF7cCtOqS5E58M7fQpATjj9Ol
         R2PTT9yEpGpCPcc3UMp0uOuMjx8Gae6kL1aAkXzX/t14/Opg1oUVBb3y39DPdureFJly
         XGVCeSHAofKdXCk7nz8/eB2kM8eDp2Sq8PqaGVtDH1mJlUzDp8FtSInlhV8xuONewevr
         ObK4W3N4ezormVRnGZvIVRx60CfEIdDP7gOumcWgJbR/GQjumJQ7wPUzmDKgUv9ubbb+
         SLGmUTzma4BEZ7Qe535fyz+4P3pb3Nyj6JxOcBR4sMvcvP+mRhebO+d9BXq93pKs6qNl
         cIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705166002; x=1705770802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+HXAfHWzlmUD2jF3cOseN2QuWj86wCy/DNdda08S1M=;
        b=QgEB7DjUxl5FxXscQfIbPP6smP1/EDN5EFqJgkpqT66HgwoIxBSubYA0bsY4M05HDP
         Tmcw6eTp3Nng284+l/KQgykKpDpJB83g1yo0Jithhnb1sGqjlTce7VcHfsWYaxujFL1F
         gxjLhKoX6JfWA//vrzW0ghjOixC5+AvofWF85awJQU1FmC85k97hMhHKxWytlHVuGe0l
         tq2A7qI0xKb2El396jUodxXXZYg3tXV6dkNYN7XE37YxhF05z76xUiffbDjT3xjQvWy5
         YSBcWb5voL/K9Dho9AbtxaR88Kkif8aBBuxdxwVPEXQAyANC0h8SqQJY6Ux2ztiVLjJB
         yjsg==
X-Gm-Message-State: AOJu0Yxjp8t/dvZciUGVDXqJVTzLIy3D8uFS1z8vBxu1emhqpurZp8QP
	23fLFzeAoF9TpcLy5zJ34STUgiGQmwFWHf00DP8=
X-Google-Smtp-Source: AGHT+IEL8HgIataJb0LUSQtVfeNbmmONWdarB6kp3Br/2GMqpC4dBBzlbhftGV0RDPn4kImBUoBHLCqCPqIaarNlYt0=
X-Received: by 2002:a05:6871:e78b:b0:206:b8a2:dad8 with SMTP id
 qb11-20020a056871e78b00b00206b8a2dad8mr4185747oac.25.1705166002220; Sat, 13
 Jan 2024 09:13:22 -0800 (PST)
MIME-Version: 1.0
References: <3ee2cd79-f05e-46bb-a33a-51415450b7d3@gmail.com>
In-Reply-To: <3ee2cd79-f05e-46bb-a33a-51415450b7d3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Jan 2024 09:12:56 -0800
Message-ID: <CAMKF1sru3Sv1UjqkwgbaN6v07VX3eoWUdTG5_vQBb1=mp9JscQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Jan 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 17:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108267

Merged. thanks Armin.

On Sat, Jan 13, 2024 at 5:04=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 402affcc073db39f782c1ebfd718edd5f11eed=
4c:
>
>    squid: fix CVE-2023-46847 Denial of Service in HTTP Digest
> Authentication (2023-12-13 13:35:51 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 730e44900a0a86265bad93a16b5a5ff344a07266:
>
>    proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read (2024-01-12
> 07:14:16 -0500)
>
> ----------------------------------------------------------------
> Archana Polampalli (3):
>        strongswan: upgrade 5.9.6 -> 5.9.12
>        cjson: upgrade 1.7.15 -> 1.7.17
>        samba: fix CVE-2023-42669
>
> Hitendra Prajapati (1):
>        proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read
>
> Jeffrey Pautler (1):
>        apache2: add vendor to product name used for CVE checking
>
> Martin Jansa (1):
>        glmark2: inherit python3native to fix build with python-3.12 on
> build host
>
> Narpat Mali (4):
>        python3-django: Fix for CVE-2023-43665 and CVE-2023-46695
>        python3-django: upgrade 3.2.21 -> 3.2.23
>        python3-django: upgrade 4.2.5 -> 4.2.7
>        apache2: upgrade 2.4.57 -> 2.4.58
>
> Rob Woolley (2):
>        sip3: Add sipconfig.py
>        sip3: Add py_ssize_t_clean argument
>
> Soumya (1):
>        yasm: fix CVE-2023-37732
>
> Wentao Zhang (1):
>        libbytesize: update github branch to 'main'
>
> dnyandev (1):
>        python3-pillow: Fix CVE-2023-44271
>
> vkumbhar (2):
>        wireshark: fix CVE-2023-1992 RPCoRDMA dissector crash
>        wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka
> protocol) dissector infinite loops
>
>   .../recipes-connectivity/samba/samba/CVE-2023-42669.patch |    94 +
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb |     1 +
>   .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 277 +
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb |     1 +
>   .../strongswan/{strongswan_5.9.6.bb =3D> strongswan_5.9.12.bb} |    12 =
+-
>   .../recipes-support/wireshark/files/CVE-2022-4345.patch |    52 +
>   .../recipes-support/wireshark/files/CVE-2023-1992.patch |    61 +
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb |     2 +
>   meta-oe/recipes-benchmark/glmark2/glmark2_git.bb |     2 +-
>   .../recipes-devtools/cjson/{cjson_1.7.15.bb =3D> cjson_1.7.17.bb} |    =
 2 +-
>   ...-the-py_ssize_t_clean-argument-to-the-module-directive.patch |
> 17679 ++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/sip/sip3_4.19.23.bb |    21 +-
>   meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch |    41 +
>   meta-oe/recipes-devtools/yasm/yasm_git.bb |     1 +
>   meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb |     2 +-
>   .../recipes-devtools/python/python3-django/CVE-2023-43665.patch | 199 +
>   .../recipes-devtools/python/python3-django/CVE-2023-46695.patch |    90=
 +
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb |     2 +
>   .../{python3-django_3.2.21.bb =3D> python3-django_3.2.23.bb} |     4 +-
>   .../python/{python3-django_4.2.5.bb =3D> python3-django_4.2.7.bb} |    =
 4 +-
>   .../recipes-devtools/python/python3-pillow/CVE-2023-44271.patch | 156 +
>   meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb |     1 +
>   ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch |    31=
 -
>   .../apache2/{apache2_2.4.57.bb =3D> apache2_2.4.58.bb} |     5 +-
>   24 files changed, 18693 insertions(+), 47 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-42669.patch
>   create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb
> =3D> strongswan_5.9.12.bb} (96%)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
>   rename meta-oe/recipes-devtools/cjson/{cjson_1.7.15.bb =3D>
> cjson_1.7.17.bb} (91%)
>   create mode 100644
> meta-oe/recipes-devtools/sip/sip3/added-the-py_ssize_t_clean-argument-to-=
the-module-directive.patch
>   create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.pa=
tch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-43665.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-46695.patch
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.21.bb
> =3D> python3-django_3.2.23.bb} (61%)
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.5.bb =3D=
>
> python3-django_4.2.7.bb} (61%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch
>   delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb =3D>
> apache2_2.4.58.bb} (97%)
>

