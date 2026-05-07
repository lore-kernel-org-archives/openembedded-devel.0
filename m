Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A00CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:23:07 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1335.1778174581333599489
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 10:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BtOEDULN;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65d071aac6eso1016589d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 10:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778174580; cv=none;
        d=google.com; s=arc-20240605;
        b=boPC/eRPqz+gU+EyDBe0h6Ht3TFJZ1P9YXLnhHPcqlpuxUdwZ89m0XA7779o3AT+zh
         2ZINajMwiMWuSSVXNukbYt6NYKKmoe3+uHxx9seMU3At6zmaH63N4h1uQtbd/OaSovxR
         xFGggReX3vlvkWHnAHf7oBAySm1BQ/fYP7xSkmf1UP5E9YxK08lZ8bOoqSpblxm+lSce
         ocLLx6NBCXEVx+rbbAmWLWr8mMheBOu7f2Amu0fj14GayRqEnH0vzFzq9RjOX1u9uIcz
         Lf6P+aHS9ucJNtqtAu3wOb2muOZVfXU3OegS0zXHttkHiXJdaNDDGTDbYnZvcdQJakja
         tI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bZ9J3uXKdm9IHhvi5jpXJFpEY9gfHYoYPzHCaiUh6Pc=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=FZttWKtVDTk4saWykoCibz5XEII/XxozbkY5u5rjD9Hr60Nw2dnd7XqpFuTZNsnPBN
         uPW4FH2p/1oFJ4/T62nDRcoD4t3oSopFL8pGgm6HUIE9fT1FNkcxmaD3K2W2W3L9i5CD
         pV/dea0DiWqY2XV0OTFZ1PnR5WWvy5wl/HvaVSUzXj57JK/NSN6hc3jZe+7epRe692Pz
         GZqlR/1NZ5M8Tpzist4iM0NXfq/HYZ7W24vVVaG66Lk7DLIZreOd/3iGokqnblCjvJvX
         gRFUSEtr4EP6NsTbktDZaamTY8uIZJeUoth22tsYb0sqSG050cgfEVhl5MdUPyN9444W
         XbSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778174580; x=1778779380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ9J3uXKdm9IHhvi5jpXJFpEY9gfHYoYPzHCaiUh6Pc=;
        b=BtOEDULNRbDMJLBrhJ8SbWw/tq657nFROClEmacSbqnyBQtoOGUQX2QQTJVVFlKfYB
         zVpBLNzhQAkdc/S6dCnCCF0Vw7FZ5oEiIilHb5cts24V+euNhPFIUVNzNcu2SquU+Ucc
         gNLiX8LNh6DojY0DTxjh4aOp1QAo8WjrmL4l45zdo79t6KMbyQ4KGt8ECsfOTopdigf3
         8hMR2ByVN6E6zJTzf5NQlNeIYC5x+gSetVMCF6sB+3StSVwUsioCkPZpN8irdZCs+uxe
         EKtRXMrM1iXwwKXB1GmSI4oG/0OLfhPGp2KzwWpJ/+bqSU3TYh79rvTB1YmeXDy/M/nC
         SPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174580; x=1778779380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ9J3uXKdm9IHhvi5jpXJFpEY9gfHYoYPzHCaiUh6Pc=;
        b=Wf9OAv3+1M5LJXL1WmSH3olAmQQHe/wOEZDnA2u3ZxxWojZdZCQGQJRAtiPkIEFxh2
         ZP1ts1HbbBz98w4IXURbZlwzKlVgmrmAOtqYwPZelI8+G0DM7NdhYNeq+l/YZhFrySDq
         X1/3frM3jfcrKZNQA+6st5ySLh54ieEgA8aYMvh7kz/S+DnTOiJndPp39XRhUkZKMaT8
         F+JHSMnrZZ5CieCM4mDOOKWf1W15ySF9CcHbaKKToiZQ/Oq5WVAhZeG17QLRiF7enhMd
         b5zdzbp54nG2yioqXVB2dz/HPJK7M+dRBgleVwBvAlgeJkX5s7X1rkzc0gGmCalyq2bK
         xKwQ==
X-Gm-Message-State: AOJu0YymIOicSWHHJL2Miy7J2U9+eM3WROwBcGpEiGgQRT7OGynAN5vX
	hGlCi1GGxw5a9Cb8O8sLaJ9iRMkYAcl3fHDv0bSUc4mAWZ8J0HSiih/jkWYV1PGCDbst024mwS3
	/pFzq2HWPRzk+iwCZRDo07ebDUIZLLYBLD/EMCag=
X-Gm-Gg: Acq92OFswGpHwaitHabLiKZP1WyppLMg5wJC9P4jvY4/E7GJdO4GP2IpR0Px60in3RM
	li9y2WKM5x/OdGkvxKRWb0aJsFC5l7rXw3fm/1vo5/kKPJm62jG/n6vAbcRBd5dkVdw76PiMq83
	MDk7rDFRCQXrw/aFhyTMl1s7GNvBgBvzNaCiWMp7Jz1g2tGpVqniKuAexJLl9h2lZRG0ZdFVL72
	NJOEwvbypNPg/aYOeLzygM6Po2a/fJAnCeJOB4tCUZ8mXcMbcdt3LdPQTVQ/a32oSwaAnexgInI
	xVTTUYrJWADSW4wvmcC1pJrLZ9BAxZPHU7hcMl65EQHtAPGhJE6PKgIpAIGzVi10szwbylDgc5A
	irI2PI4hyDVIsBaVdh6GYgGslzXZr6pGkwKAC8SrC2aD3a4wpi44umYFoPWLB4KdecKVLwKslJG
	fFXkyu+37/f9YanaBq
X-Received: by 2002:a53:b4d1:0:b0:65c:b99:607a with SMTP id
 956f58d0204a3-65c79ccd5a8mr6562664d50.38.1778174580024; Thu, 07 May 2026
 10:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778123390.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1778123390.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 May 2026 22:52:33 +0530
X-Gm-Features: AVHnY4LhAbF0BZH7dGe3fUDzFFuBz-TLDi15yKS3S7wnZl4yBdktc4p9kLY5S9E
Message-ID: <CAMKF1spQnC24F-MuLKexNUkEnWXL8jWgBqqRys_AzuBE9dvAeA@mail.gmail.com>
Subject: Re: [PATCH 00/27] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000030ec3706513d880c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 17:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126816

--00000000000030ec3706513d880c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now, thanks Anuj

On Thu, May 7, 2026 at 8:42=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com>
wrote:

> Please merge these changes in scarthgap. Tested on autobuilder and locall=
y.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1510
>
> The following changes since commit
> 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e:
>
>   nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to ae7dfb12245c7f9b9a353499e2688015bd4e6413:
>
>   jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (11):
>   opensc: patch CVE-2025-49010
>   opensc: patch CVE-2025-66037
>   opensc: patch CVE-2025-66038
>   opensc: patch CVE-2025-66215
>   libssh: patch CVE-2026-0968
>   libssh: patch CVE-2026-0967
>   libssh: Fix CVE-2026-0965
>   jq: patch CVE-2026-32316
>   jq: patch CVE-2026-33947
>   jq: patch CVE-2026-33948
>   jq: patch CVE-2026-39979
>
> Daniel Turull (1):
>   jq: fix CVE-2026-40164
>
> Gyorgy Sarvari (5):
>   nginx: set CVE_PRODUCT
>   python3-tornado: set CVE_PRODUCT
>   openjpeg: patch CVE-2026-6192
>   corosync: patch CVE-2026-35091
>   corosync: patch CVE-2026-35092
>
> Hitendra Prajapati (2):
>   nginx: fix CVE-2026-32647
>   python3-pillow: fix CVE-2026-40192
>
> Khem Raj (2):
>   krb5: Backport additional fixes to build on clang
>   jq: Stick to C17 until next release
>
> Libo Chen (2):
>   hdf5: fix CVE-2025-2308
>   hdf5: fix CVE-2025-6857
>
> Michael Opdenacker (1):
>   kernel-hardening-checker: update 0.6.10.2 -> 0.6.17.1
>
> Mikko Rapeli (1):
>   onig: fix gcc 15 build
>
> Naman Jain (1):
>   imagemagick: Fix CVEs
>
> Zahir Hussain (1):
>   rocksdb: packageconfig knob for set static library option
>
>  .../corosync/corosync/CVE-2026-35091.patch    |  47 +
>  .../corosync/corosync/CVE-2026-35092.patch    |  57 ++
>  .../corosync/corosync_3.1.10.bb               |   2 +
>  ...001-Fix-more-non-prototype-functions.patch | 862 ++++++++++++++++++
>  ...oid-strict-prototype-compiler-errors.patch | 379 ++++++++
>  .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   2 +
>  meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |   2 +-
>  .../jq/jq/CVE-2026-32316.patch                |  55 ++
>  .../jq/jq/CVE-2026-33947.patch                | 107 +++
>  .../jq/jq/CVE-2026-33948.patch                |  51 ++
>  .../jq/jq/CVE-2026-39979.patch                |  32 +
>  .../jq/jq/CVE-2026-40164.patch                |  92 ++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   8 +
>  .../openjpeg/openjpeg/CVE-2026-6192.patch     |  35 +
>  .../openjpeg/openjpeg_2.5.4.bb                |   1 +
>  ...b =3D> kernel-hardening-checker_0.6.17.1.bb} |   2 +-
>  .../hdf5/files/CVE-2025-2308.patch            | 333 +++++++
>  .../hdf5/files/CVE-2025-6857.patch            | 255 ++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +
>  .../imagemagick/CVE-2026-24481.patch          |  30 +
>  .../imagemagick/CVE-2026-25638.patch          |  29 +
>  .../imagemagick/CVE-2026-25794.patch          |  60 ++
>  .../imagemagick/CVE-2026-25795.patch          |  32 +
>  .../imagemagick/CVE-2026-25796.patch          |  46 +
>  .../imagemagick/CVE-2026-25797_1.patch        | 344 +++++++
>  .../imagemagick/CVE-2026-25797_2.patch        | 143 +++
>  .../imagemagick/CVE-2026-25798.patch          | 109 +++
>  .../imagemagick/CVE-2026-25799.patch          |  42 +
>  .../imagemagick/CVE-2026-25897.patch          |  34 +
>  .../imagemagick/CVE-2026-25898_1.patch        |  39 +
>  .../imagemagick/CVE-2026-25898_2.patch        |  37 +
>  .../imagemagick/CVE-2026-25965.patch          | 322 +++++++
>  .../imagemagick/CVE-2026-25966.patch          |  56 ++
>  .../imagemagick/CVE-2026-25967.patch          |  38 +
>  .../imagemagick/CVE-2026-25968.patch          |  39 +
>  .../imagemagick/CVE-2026-25969.patch          |  63 ++
>  .../imagemagick/CVE-2026-25970.patch          | 139 +++
>  .../imagemagick/CVE-2026-25970_pre1.patch     |  57 ++
>  .../imagemagick/CVE-2026-25982.patch          |  77 ++
>  .../imagemagick/CVE-2026-25985.patch          |  67 ++
>  .../imagemagick/CVE-2026-25986.patch          |  42 +
>  .../imagemagick/CVE-2026-25987.patch          |  44 +
>  .../imagemagick/CVE-2026-25988.patch          |  50 +
>  .../imagemagick/CVE-2026-26066.patch          |  49 +
>  .../imagemagick/CVE-2026-26283.patch          |  33 +
>  .../imagemagick/CVE-2026-26284.patch          |  31 +
>  .../imagemagick/CVE-2026-26983.patch          |  41 +
>  .../imagemagick/imagemagick_7.1.1.bb          |  28 +
>  .../libssh/libssh/CVE-2026-0965.patch         | 284 ++++++
>  .../libssh/libssh/CVE-2026-0967.patch         | 360 ++++++++
>  .../libssh/libssh/CVE-2026-0968-1.patch       |  64 ++
>  .../libssh/libssh/CVE-2026-0968-2.patch       | 136 +++
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
>  ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 +++
>  meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
>  .../opensc/files/CVE-2025-49010.patch         |  72 ++
>  .../opensc/files/CVE-2025-66037.patch         |  35 +
>  .../opensc/files/CVE-2025-66038.patch         |  41 +
>  .../opensc/files/CVE-2025-66215-1.patch       |  29 +
>  .../opensc/files/CVE-2025-66215-2.patch       |  37 +
>  .../opensc/files/CVE-2025-66215-3.patch       |  45 +
>  .../opensc/files/CVE-2025-66215-4.patch       |  62 ++
>  .../recipes-support/opensc/opensc_0.25.1.bb   |   7 +
>  .../python3-pillow/CVE-2026-40192.patch       |  50 +
>  .../python/python3-pillow_10.3.0.bb           |   1 +
>  .../python/python3-tornado_6.4.2.bb           |   2 +
>  .../nginx/nginx-1.24.0/CVE-2026-32647.patch   |  78 ++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   2 +
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
>  69 files changed, 5892 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
>  create mode 100644
> meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-more-non-prototype-functi=
ons.patch
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-strict-prototype-compil=
er-errors.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patch
>  create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
>  rename meta-oe/recipes-security/kernel-hardening-checker/{
> kernel-hardening-checker_0.6.10.2.bb =3D>
> kernel-hardening-checker_0.6.17.1.bb} (96%)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patc=
h
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patc=
h
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0968-2.patch
>  create mode 100644
> meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a=
5.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-49010.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66037.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66038.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66215-1.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66215-2.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66215-3.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2025-66215-4.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-40192.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch
>
> --
> 2.53.0
>
>

--00000000000030ec3706513d880c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now, thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 7=
, 2026 at 8:42=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Please merge these changes in sc=
arthgap. Tested on autobuilder and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1510" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1510</a><br>
<br>
The following changes since commit 5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e=
:<br>
<br>
=C2=A0 nginx: fix CVE-2026-28753 (2026-04-15 14:12:18 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to ae7dfb12245c7f9b9a353499e2688015bd4e6413:<br=
>
<br>
=C2=A0 jq: Stick to C17 until next release (2026-05-05 06:57:17 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (11):<br>
=C2=A0 opensc: patch CVE-2025-49010<br>
=C2=A0 opensc: patch CVE-2025-66037<br>
=C2=A0 opensc: patch CVE-2025-66038<br>
=C2=A0 opensc: patch CVE-2025-66215<br>
=C2=A0 libssh: patch CVE-2026-0968<br>
=C2=A0 libssh: patch CVE-2026-0967<br>
=C2=A0 libssh: Fix CVE-2026-0965<br>
=C2=A0 jq: patch CVE-2026-32316<br>
=C2=A0 jq: patch CVE-2026-33947<br>
=C2=A0 jq: patch CVE-2026-33948<br>
=C2=A0 jq: patch CVE-2026-39979<br>
<br>
Daniel Turull (1):<br>
=C2=A0 jq: fix CVE-2026-40164<br>
<br>
Gyorgy Sarvari (5):<br>
=C2=A0 nginx: set CVE_PRODUCT<br>
=C2=A0 python3-tornado: set CVE_PRODUCT<br>
=C2=A0 openjpeg: patch CVE-2026-6192<br>
=C2=A0 corosync: patch CVE-2026-35091<br>
=C2=A0 corosync: patch CVE-2026-35092<br>
<br>
Hitendra Prajapati (2):<br>
=C2=A0 nginx: fix CVE-2026-32647<br>
=C2=A0 python3-pillow: fix CVE-2026-40192<br>
<br>
Khem Raj (2):<br>
=C2=A0 krb5: Backport additional fixes to build on clang<br>
=C2=A0 jq: Stick to C17 until next release<br>
<br>
Libo Chen (2):<br>
=C2=A0 hdf5: fix CVE-2025-2308<br>
=C2=A0 hdf5: fix CVE-2025-6857<br>
<br>
Michael Opdenacker (1):<br>
=C2=A0 kernel-hardening-checker: update 0.6.10.2 -&gt; 0.6.17.1<br>
<br>
Mikko Rapeli (1):<br>
=C2=A0 onig: fix gcc 15 build<br>
<br>
Naman Jain (1):<br>
=C2=A0 imagemagick: Fix CVEs<br>
<br>
Zahir Hussain (1):<br>
=C2=A0 rocksdb: packageconfig knob for set static library option<br>
<br>
=C2=A0.../corosync/corosync/CVE-2026-35091.patch=C2=A0 =C2=A0 |=C2=A0 47 +<=
br>
=C2=A0.../corosync/corosync/CVE-2026-35092.patch=C2=A0 =C2=A0 |=C2=A0 57 ++=
<br>
=C2=A0.../corosync/<a href=3D"http://corosync_3.1.10.bb" rel=3D"noreferrer"=
 target=3D"_blank">corosync_3.1.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...001-Fix-more-non-prototype-functions.patch | 862 +++++++++++++++++=
+<br>
=C2=A0...oid-strict-prototype-compiler-errors.patch | 379 ++++++++<br>
=C2=A0.../recipes-connectivity/krb5/<a href=3D"http://krb5_1.21.3.bb" rel=
=3D"noreferrer" target=3D"_blank">krb5_1.21.3.bb</a>=C2=A0 |=C2=A0 =C2=A02 =
+<br>
=C2=A0meta-oe/recipes-dbs/rocksdb/<a href=3D"http://rocksdb_9.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rocksdb_9.0.0.bb</a>=C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
=C2=A0.../jq/jq/CVE-2026-32316.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++<br>
=C2=A0.../jq/jq/CVE-2026-33947.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 107 +++<br>
=C2=A0.../jq/jq/CVE-2026-33948.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 51 ++<br>
=C2=A0.../jq/jq/CVE-2026-39979.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 32 +<br>
=C2=A0.../jq/jq/CVE-2026-40164.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 92 ++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A08 +<br>
=C2=A0.../openjpeg/openjpeg/CVE-2026-6192.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
35 +<br>
=C2=A0.../openjpeg/<a href=3D"http://openjpeg_2.5.4.bb" rel=3D"noreferrer" =
target=3D"_blank">openjpeg_2.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...b =3D&gt; <a href=3D"http://kernel-hardening-checker_0.6.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-hardening-checker_0.6.17.1.bb</=
a>} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../hdf5/files/CVE-2025-2308.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 333 +++++++<br>
=C2=A0.../hdf5/files/CVE-2025-6857.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 255 ++++++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A02 +<br=
>
=C2=A0.../imagemagick/CVE-2026-24481.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 30 +<br>
=C2=A0.../imagemagick/CVE-2026-25638.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 29 +<br>
=C2=A0.../imagemagick/CVE-2026-25794.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 60 ++<br>
=C2=A0.../imagemagick/CVE-2026-25795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 32 +<br>
=C2=A0.../imagemagick/CVE-2026-25796.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 46 +<br>
=C2=A0.../imagemagick/CVE-2026-25797_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
44 +++++++<br>
=C2=A0.../imagemagick/CVE-2026-25797_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
43 +++<br>
=C2=A0.../imagemagick/CVE-2026-25798.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 109 +++<br>
=C2=A0.../imagemagick/CVE-2026-25799.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 42 +<br>
=C2=A0.../imagemagick/CVE-2026-25897.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 +<br>
=C2=A0.../imagemagick/CVE-2026-25898_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 39 +<br>
=C2=A0.../imagemagick/CVE-2026-25898_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 37 +<br>
=C2=A0.../imagemagick/CVE-2026-25965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 322 +++++++<br>
=C2=A0.../imagemagick/CVE-2026-25966.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 56 ++<br>
=C2=A0.../imagemagick/CVE-2026-25967.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 38 +<br>
=C2=A0.../imagemagick/CVE-2026-25968.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 39 +<br>
=C2=A0.../imagemagick/CVE-2026-25969.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 63 ++<br>
=C2=A0.../imagemagick/CVE-2026-25970.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 139 +++<br>
=C2=A0.../imagemagick/CVE-2026-25970_pre1.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
57 ++<br>
=C2=A0.../imagemagick/CVE-2026-25982.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 77 ++<br>
=C2=A0.../imagemagick/CVE-2026-25985.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 67 ++<br>
=C2=A0.../imagemagick/CVE-2026-25986.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 42 +<br>
=C2=A0.../imagemagick/CVE-2026-25987.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 44 +<br>
=C2=A0.../imagemagick/CVE-2026-25988.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 50 +<br>
=C2=A0.../imagemagick/CVE-2026-26066.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 49 +<br>
=C2=A0.../imagemagick/CVE-2026-26283.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 33 +<br>
=C2=A0.../imagemagick/CVE-2026-26284.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 31 +<br>
=C2=A0.../imagemagick/CVE-2026-26983.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 41 +<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.1.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">imagemagick_7.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 28 +<br>
=C2=A0.../libssh/libssh/CVE-2026-0965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 284 ++++++<br>
=C2=A0.../libssh/libssh/CVE-2026-0967.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 360 ++++++++<br>
=C2=A0.../libssh/libssh/CVE-2026-0968-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 64 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-0968-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
36 +++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 +++<br>
=C2=A0meta-oe/recipes-support/onig/<a href=3D"http://onig_6.9.9.bb" rel=3D"=
noreferrer" target=3D"_blank">onig_6.9.9.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0.../opensc/files/CVE-2025-49010.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 72 ++<br>
=C2=A0.../opensc/files/CVE-2025-66037.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 35 +<br>
=C2=A0.../opensc/files/CVE-2025-66038.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 41 +<br>
=C2=A0.../opensc/files/CVE-2025-66215-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 29 +<br>
=C2=A0.../opensc/files/CVE-2025-66215-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 +<br>
=C2=A0.../opensc/files/CVE-2025-66215-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 45 +<br>
=C2=A0.../opensc/files/CVE-2025-66215-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 62 ++<br>
=C2=A0.../recipes-support/opensc/<a href=3D"http://opensc_0.25.1.bb" rel=3D=
"noreferrer" target=3D"_blank">opensc_0.25.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A07 +<br>
=C2=A0.../python3-pillow/CVE-2026-40192.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 50 +<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_10.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_10.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.4.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-32647.patch=C2=A0 =C2=A0|=C2=A0 78 ++=
<br>
=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A069 files changed, 5892 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-extended/corosync/corosync=
/CVE-2026-35091.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-extended/corosync/corosync=
/CVE-2026-35092.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-mo=
re-non-prototype-functions.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0002-Avoid-=
strict-prototype-compiler-errors.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40164.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-202=
6-6192.patch<br>
=C2=A0rename meta-oe/recipes-security/kernel-hardening-checker/{<a href=3D"=
http://kernel-hardening-checker_0.6.10.2.bb" rel=3D"noreferrer" target=3D"_=
blank">kernel-hardening-checker_0.6.10.2.bb</a> =3D&gt; <a href=3D"http://k=
ernel-hardening-checker_0.6.17.1.bb" rel=3D"noreferrer" target=3D"_blank">k=
ernel-hardening-checker_0.6.17.1.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-24481.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25638.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25794.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25795.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25796.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25797_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25797_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25798.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25799.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25897.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25898_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25898_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25965.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25966.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25967.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25968.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25969.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25970.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25970_pre1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25982.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25985.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25986.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25987.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25988.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26066.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26283.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26284.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26983.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
5.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
7.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
8-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-096=
8-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee=
60c4cd67f2e2e46484ef50a5.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-4901=
0.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6603=
7.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6603=
8.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6621=
5-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6621=
5-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6621=
5-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2025-6621=
5-4.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-40192.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-32647.patch<br>
<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div>

--00000000000030ec3706513d880c--

