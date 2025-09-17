Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46213CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 04:39:00 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.14989.1758083937511123143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 21:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8zDg6QS;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e931c858dbbso4018808276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758083936; x=1758688736; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0yzQJMaZqlSZclc23nrpid9djfISGhjfTqzgHcVqqQ=;
        b=R8zDg6QSitkehfpKRuk7DiSbZBNYLpRs//pWYg3NoG29cdEIwTP1ASfBLYJgEYuAYY
         s4JaHHbqDQGo6ruzomdNuGR520je0TFWyXYIDXyKEMQ4nqywTnTpySOn/dusk6J4OUHr
         N49k6/kaGQU6Vap2p+bAoOKE1mFhf//kLipTJVlE5ZK1ViuzN2zwqcOuxDNnojea5S1+
         r8kUlSVDIoX523Bdbzchpy4YCGIphMXbTHXGCCb8ZyLawimGKL2KYZ79a3yyP3odc0cH
         6d8E+R5bhGu8taCiCU9asA9XsFaMs4KAj8G4iEh0HkXCqkHiGkj+zsvvzTHxJyk9DqDX
         SsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758083936; x=1758688736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0yzQJMaZqlSZclc23nrpid9djfISGhjfTqzgHcVqqQ=;
        b=wKI90IdlG7VGbcWCwNyNNo7IPapE9IM372+ZPIURr/cdw1qMtV29FqW+dTm1DVd0+R
         nkvnD2JLAIGdl4GvV5ph9kC67pucN1hDtvMbrQf555WfyFeObL7EvTh0Q/E7RO2Vdldb
         Opc2T5Wi2HuBAKDAOJYzRp7Imxb+S7LW6omjycqdEMl554ByD2itmuZJ0BFlkx9L/boM
         WjdTcuM1ibQw8uDLFTm0CMvLdp0erOtzm59MwPJpiedJNWLTFtkUhvtdcmBpCeuyVmve
         TheLKiuiOX03nZJcH+7+jk4v51hzVEgkghxE40XTcnUxRGSVe2sS7WHiB7rhHSEtp3EL
         kA3Q==
X-Gm-Message-State: AOJu0YzgMAzmSl7l2+Uy41ncGP7hu1w7oepogSXdoNEPbm9jodqi1cxp
	e2IgzT91gbj03Z+y8Z2eDlaRXMpzh0P1QnyWWrb3j3MBEkYr1Mht8sTMjqLMcI1ZzQ1lfHFLcab
	vtqpNdPxFZKofomVvYlSI3TuNLsdEnbo=
X-Gm-Gg: ASbGnctBYvmZ7WOJ5AGDcolCC/QITr4jgoG7gVyuAF0WXRtskpnpys7QlZ9WPwBKcQt
	fZW7eoXWAWunR4gfUik/CY+OjMKdNDnvsOEz3onZTm8RNcV7l7r2Lh9sz/3pSh7DOlb58D5SBlk
	2imkZ91UISIoJsYNhq3VpQDcFtv6RcFdgu5N3g+xiJ1R5sgGW7W4NT9OyrFLVbTfefw0CCx1Vks
	zzdyoXUz0ldBDUxv29YGUo2em54ob3tkf2o+TnTrVRVKBOalDBn/xccwVogZORue3XYj11E/RWw
	fKqq1NX6XQczO9ChPN7upRoL
X-Google-Smtp-Source: AGHT+IEzIRddEQwPmOfFRlnLZ1Ht6uTyz8s/VFO+rVfnvbix9YhtgNTnUO6kRipdIeMYP1YROS0CWYQBl02drzwzJ9E=
X-Received: by 2002:a53:b787:0:b0:627:856d:ddf4 with SMTP id
 956f58d0204a3-633b064ce90mr556885d50.12.1758083936390; Tue, 16 Sep 2025
 21:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250916071238.2263667-1-skandigraun@gmail.com>
In-Reply-To: <20250916071238.2263667-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Sep 2025 21:38:30 -0700
X-Gm-Features: AS18NWBlG5MbX7owVBO4SoKo6CQvjTSOoC89Zty2U0qQGuLp1gO8-aorrpo2bK8
Message-ID: <CAMKF1srA=m9FUihvMvdG9kseespdsG3fa5LwDL_1TB+TOGp9SQ@mail.gmail.com>
Subject: Re: [oe] Kirkstone pull request Sep 16th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 04:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119474

Thanks Gyorgy, looks good. Installed.

On Tue, Sep 16, 2025 at 12:12=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Please find below a summary of updates for the Kirkstone branch.
> The changes were tested with a full world build on x86, x86-64, arm and a=
arch platforms.
>
> The following changes since commit 06fc0278f10d630838d703dde707bbf0e29998=
73:
>
>   poco: Fix ptests (2025-07-13 14:41:35 -0400)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-n=
ut
>
> for you to fetch changes up to 5c138125018fef4b240e62b664a809d19f4b26a5:
>
>   readme: update maintainer (2025-09-16 09:04:49 +0200)
>
> ----------------------------------------------------------------
> Archana Polampalli (2):
>       apache2: upgrade 2.4.62 -> 2.4.65
>       tcpreplay: fix CVE-2023-43279
>
> Changqing Li (1):
>       luajit: fix several CVEs
>
> Chen Qi (1):
>       tcprelay: fix a minor cross compilation do_configure issue
>
> Guocai He (3):
>       mariadb: File conflicts for multilib
>       unixodbc: fix odbc.pc file generation
>       libnet: backport patch to remove configure time SOCK_PACKET check
>
> Gyorgy Sarvari (3):
>       hunspell-dictionaries: fix SRC_URI
>       geary: don't check iso codes xml at build time
>       readme: update maintainer
>
> Hitendra Prajapati (2):
>       krb5: fix CVE-2025-3576
>       libssh: fix CVE-2025-4877
>
> Jiaying Song (1):
>       python3-aiohttp: fix CVE-2025-53643 and drop CVE-2024-42367 patch
>
> Peter Marko (3):
>       python3-protobuf: patch CVE-2025-4565
>       fcgi: patch CVE-2025-23016
>       nginx: patch CVE-2025-53859 in stable
>
> Sana Kazi (2):
>       tcpdump: Fix patch-fuzz issue
>       imagemagick: Fix patch-fuzz for fix-cipher-leak.patch
>
> Vijay Anusuri (2):
>       postgresql: upgrade 14.18 -> 14.19
>       openjpeg: Fix CVE-2025-50952
>
> Vyacheslav Yurkov (1):
>       packagegroup-meta-filesystems: fix build issue
>
> Wang Mingyu (1):
>       unixodbc: Fix install conflict when enable multilib.
>
> Yogita Urade (2):
>       poppler: fix CVE-2025-50420
>       poppler: fix CVE-2025-52886
>
> Youngseok Jeong (1):
>       json-schema-validator: Remove absolute path in INSTALL_CMAKE_DIR
>
>  README                                             |    4 +-
>  meta-filesystems/README                            |    2 +-
>  .../packagegroup-meta-filesystems.bb               |    1 +
>  meta-gnome/README                                  |    2 +-
>  ...-not-check-for-iso-xml-files-during-build.patch |   31 +
>  .../recipes-connectivity/geary/geary_40.0.bb       |    5 +-
>  meta-initramfs/README                              |    2 +-
>  meta-multimedia/README                             |    2 +-
>  meta-networking/README                             |    2 +-
>  .../tcpdump/tcpdump/CVE-2024-2397.patch            |   25 +-
>  ...c-do-not-run-conftest-in-case-of-cross-co.patch |   50 +
>  .../tcpreplay/tcpreplay/CVE-2023-43279.patch       |   36 +
>  .../recipes-support/tcpreplay/tcpreplay_4.4.4.bb   |    2 +
>  meta-oe/README                                     |    2 +-
>  .../krb5/krb5/CVE-2025-3576-01.patch               |  257 ++
>  .../krb5/krb5/CVE-2025-3576-02.patch               |  188 +
>  .../krb5/krb5/CVE-2025-3576-pre.patch              |   58 +
>  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb   |    3 +
>  ...01-Remove-support-for-SOCK_PACKET-sockets.patch |  251 ++
>  .../recipes-connectivity/libnet/libnet_1.2-rc3.bb  |    1 +
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |    7 +-
>  ...ure.ac-bypass-autoconf-2.69-version-check.patch |    2 +-
>  .../{postgresql_14.18.bb =3D> postgresql_14.19.bb}   |    4 +-
>  .../0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch |   45 +
>  .../json-schema-validator_2.1.0.bb                 |    1 +
>  .../luajit/luajit/CVE-2024-25176.patch             |   32 +
>  .../luajit/luajit/CVE-2024-25177.patch             |   44 +
>  .../luajit/luajit/CVE-2024-25178-0001.patch        |   28 +
>  .../luajit/luajit/CVE-2024-25178-0002.patch        |   49 +
>  .../luajit/luajit/CVE-2024-25178-0003.patch        |  163 +
>  meta-oe/recipes-devtools/luajit/luajit_git.bb      |    5 +
>  .../openjpeg/openjpeg/CVE-2025-50952.patch         |   32 +
>  .../recipes-graphics/openjpeg/openjpeg_2.4.0.bb    |    1 +
>  .../hunspell/hunspell-dictionaries.bb              |    2 +-
>  .../imagemagick/files/fix-cipher-leak.patch        |   51 +-
>  .../libssh/libssh/CVE-2025-4877.patch              |   57 +
>  meta-oe/recipes-support/libssh/libssh_0.8.9.bb     |    1 +
>  .../poppler/poppler/CVE-2025-50420.patch           |   38 +
>  .../poppler/poppler/CVE-2025-52886-0001.patch      |  318 ++
>  .../poppler/poppler/CVE-2025-52886-0002.patch      |  108 +
>  .../poppler/poppler/CVE-2025-52886-0003.patch      | 4219 ++++++++++++++=
++++++
>  .../poppler/poppler/CVE-2025-52886-0004.patch      |   58 +
>  meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    5 +
>  ...e.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch |   54 +
>  meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb |   22 +-
>  meta-perl/README                                   |    2 +-
>  meta-python/README                                 |    2 +-
>  .../python/python3-aiohttp/CVE-2024-42367.patch    |   65 -
>  .../python/python3-aiohttp/CVE-2025-53643.patch    |  197 +
>  .../python/python3-aiohttp_3.8.6.bb                |    2 +-
>  .../python/python3-protobuf/CVE-2025-4565.patch    |  377 ++
>  .../python/python3-protobuf_3.20.3.bb              |    2 +
>  meta-webserver/README                              |    2 +-
>  .../{apache2_2.4.62.bb =3D> apache2_2.4.65.bb}       |    2 +-
>  .../recipes-httpd/nginx/files/CVE-2025-53859.patch |  131 +
>  meta-webserver/recipes-httpd/nginx/nginx.inc       |    1 +
>  .../recipes-support/fcgi/fcgi/CVE-2025-23016.patch |   40 +
>  meta-webserver/recipes-support/fcgi/fcgi_git.bb    |    1 +
>  meta-xfce/README                                   |    2 +-
>  59 files changed, 6974 insertions(+), 122 deletions(-)
>  create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meso=
n-Do-not-check-for-iso-xml-files-during-build.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0=
001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
>  create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/C=
VE-2023-43279.patch
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-=
01.patch
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-=
02.patch
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-=
pre.patch
>  create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Remov=
e-support-for-SOCK_PACKET-sockets.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.18.bb =3D> postgres=
ql_14.19.bb} (71%)
>  create mode 100644 meta-oe/recipes-devtools/json-schema-validator/json-s=
chema-validator/0002-Do-not-use-the-CMAKE_INSTALL_PREFIX.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176=
.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177=
.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178=
-0001.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178=
-0002.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178=
-0003.patch
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-5=
0952.patch
>  create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.p=
atch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5042=
0.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5288=
6-0001.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5288=
6-0002.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5288=
6-0003.patch
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-5288=
6-0004.patch
>  create mode 100644 meta-oe/recipes-support/unixodbc/files/0001-exe-Makef=
ile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2024-42367.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2025-53643.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/=
CVE-2025-4565.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb =3D> apac=
he2_2.4.65.bb} (99%)
>  create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-538=
59.patch
>  create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-230=
16.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119418): https://lists.openembedded.org/g/openembedde=
d-devel/message/119418
> Mute This Topic: https://lists.openembedded.org/mt/115269285/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

