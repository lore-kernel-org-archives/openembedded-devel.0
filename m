Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDD4CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:03:09 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web10.14064.1759424581924411233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8ImtIX9;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-635c9db8a16so1381769d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759424581; x=1760029381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo6fDStaqVvKvJMOlDlQWxcoM7rF02FBWFxITTU26dw=;
        b=i8ImtIX9gzqvHQpZ4OXMpR8UsVEPejDc4Y87JkhFliy2f4FxthHMasaYqLJPCkGStr
         nH9iflwN2hEELAUnq+Ly2KSLhb2mofHnFJtYXtkWCLrheDImvuOWPrcSbYhXi+Ec0G2E
         tkfv/dUJCuxhSLLnjDOMFsewxuNnsAp5k/nYhNmDro6F+z4IcoRIyvDFd/z30SZreIPE
         Rmkoatt/8m0SKhF5T+MKHRCUMdyrmEujXOqYhxS22J4PEXAl/7zrX/XHSLkxPmv2H5s2
         GRbuJTvASXFMSb7moe+p+KZcXTLJ0jTlt2ZNfTXSvbqKhmviFq6rhgeuGJOGEKytUEIf
         q7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759424581; x=1760029381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo6fDStaqVvKvJMOlDlQWxcoM7rF02FBWFxITTU26dw=;
        b=XvsRv3CsJZBP1I6V+25UkIcNyIsBP6G9HDO2uPrdPzqpEva6PZriL+mxN4mStmpujM
         UDEO7BK3pCqYRElcKK0tbeNw6ewRBtdTV1kxebmOdMfynHNfHwvnURDAriudD6j6+Z6G
         anvZBtdDsJE5WM/8rzC4NLSlZp3fK6r0+kxl/FMZ/rc9CSBi4DBsjHPilm4YZ6IcWC7L
         OVkgDLXBaVNcu5vGwTFFAIn+PDALIVJzBXIuOnpXTuWuBMtPqdiWOougzwV9/uHT/XCF
         2JHB7GGoDPZKDxqC+fzS+oIFl5u8f2nohAt/zt7DMPq10ecZg8oHnhQ3i/3wo0nNM30X
         Fv+A==
X-Gm-Message-State: AOJu0YwsvHzvCbp1aMUXA/orwigQrxSbjtcO3N9aetxfaC27eJwpvlF9
	5AYy7Gf6IN3PvpXJQnsQMc0DATC1Xt3nLLoOTKpN3nTzIiE1OOsXvKXnSKKisHeqJO9KK/UbDiC
	8OpalzqLItHJ0J8xRJ3Wa7zPE2wcFA5Y=
X-Gm-Gg: ASbGncvSLD9MA3U1rCgZUo7fW4zcKX6Ef0K9yXTrhWn11GGt/VIsbR/M0L1eMQAMr71
	3V4qCbxRk7D+r9SS5wKZaloml22m1iz9ef/dNrd9yi0FG9vo2P5+V0dGpCI+rmUL8NJh9woEntn
	PjJz5nlQz5gdtELX90fd56Lxc3761YKtY+tEMbAN+dH/w8tqq6qrIaXmBXX+dOwciLSDoQiTY99
	pmroSmQS6bw/FT5MQ5Lvrl4WZQp8wXMkLZpbZV4Wtgv9ihmDUQvCH1FNE9NEEandb91+USshfR0
	c9deVbj4KqKTQh+YYWibIZoI/OMMjuhN0bhqh8368dHLUpANV//qeRLIWpfw6IK0rWJTARNwfq2
	031nJ3Q==
X-Google-Smtp-Source: AGHT+IHnYpJssqnq7b9TLZRfCoX1tbmqcX/0RBdTwCJ8QfkNhSvj/1RE33OsKroj3voPIxT1QwMXGM7qk6zIq9NO4Qo=
X-Received: by 2002:a05:690e:2519:10b0:628:3ca9:93bc with SMTP id
 956f58d0204a3-63b6fea4ba1mr9518847d50.15.1759424578405; Thu, 02 Oct 2025
 10:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251002125926.2624522-1-skandigraun@gmail.com>
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 10:02:32 -0700
X-Gm-Features: AS18NWBYB8s2zSCVBhDoqSPLFQyKEyxLmq6T7UewtV9Wcpbsy02FQEhFtT1MI0s
Message-ID: <CAMKF1srdrEpKSpzL95r+ThS4OiRy51=napeHye0bnCsObJKcqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 00/26] Cherry-picks from Master
 Batch G
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 17:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120204

Overall this looks good to me.

On Thu, Oct 2, 2025 at 5:59=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This is the last batch I intend to pick for Kirkstone for the time being.
>
> This batch contains once again mostly CVE fixes and various recipe correc=
tions
> (SRC_URI, RDEPENDS...).
>
> A world build has succeeded with these patches for arm, aarch64, x86 and =
x86-64
> platforms.
>
> Please let me know any thoughts you have about this.
>
> ---
>
> Alex Yao (1):
>   lcov: Fix Perl Path
>
> Bartosz Golaszewski (6):
>   python3-gsocketpool: add missing run-time dependencies
>   python3-txws: add missing run-time dependencies
>   python3-hpack: add missing run-time dependencies
>   python3-thrift: add missing run-time dependencies
>   python3-pyparted: add missing run-time dependencies
>   python3-send2trash: add missing run-time dependencies
>
> Benjamin Sz=C5=91ke (1):
>   tree: fix broken links
>
> Dan McGregor (1):
>   dash: correct licence
>
> Fabio Estevam (1):
>   multipath-tools: Use https for github
>
> Gyorgy Sarvari (2):
>   liboop: set correct LICENSE
>   xfce4-sensors-plugin: correct netcat PACKAGECONFIG
>
> Julian Haller (1):
>   openct: Fix typo in SUMMARY variable
>
> Katariina Lounento (1):
>   libtar: patch CVEs
>
> Marcus Flyckt (1):
>   python3-pyconnman: Add 'future' runtime dependency
>
> Martin Jansa (1):
>   ne10: append +git instead of gitr+
>
> Ninette Adhikari (1):
>   procmail: Update status for CVE-1999-0475
>
> Peter Kjellerstedt (1):
>   libjs-jquery-icheck: Correct LIC_FILES_CHKSUM
>
> Peter Marko (5):
>   libtinyxml: patch CVE-2021-42260
>   libtinyxml: patch CVE-2023-34194
>   procmail: patch CVE-2014-3618
>   procmail: patch CVE-2017-16844.
>   synergy: patch CVE-2020-15117
>
> Tim Orling (1):
>   span-lite: do not inherit ptest
>
> Wang Mingyu (1):
>   smarty: upgrade 4.1.0 -> 4.1.1
>
> Yi Zhao (1):
>   libcrypt-openssl-guess-perl: fix syntax for PROVIDES
>
>  meta-oe/recipes-shells/dash/dash_0.5.11.5.bb  |   2 +-
>  meta-oe/recipes-support/lcov/lcov_1.14.bb     |   2 +-
>  .../libjs/libjs-jquery-icheck_1.0.3.bb        |   2 +-
>  .../recipes-support/liboop/liboop_1.0.1.bb    |   2 +-
>  ...-missing-prototype-compiler-warnings.patch |  53 ++++++
>  ...ix-invalid-memory-de-reference-issue.patch |  44 +++++
>  ...escriptor-leaks-reported-by-cppcheck.patch | 101 +++++++++++
>  ...0006-fix-memleak-on-tar_open-failure.patch |  26 +++
>  ...ix-memleaks-in-libtar-sample-program.patch | 119 +++++++++++++
>  ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 ++++++++++
>  ...-for-NULL-before-freeing-th_pathname.patch |  30 ++++
>  ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 +++
>  ...amming-mistakes-detected-by-static-a.patch | 100 +++++++++++
>  .../libtar/files/CVE-2013-4420.patch          | 160 ++++++++++++++++++
>  ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 +++++
>  .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 ++++++
>  .../recipes-support/libtar/libtar_1.2.20.bb   |  12 ++
>  .../libtinyxml/CVE-2021-42260.patch           |  27 +++
>  .../libtinyxml/CVE-2023-34194.patch           |  31 ++++
>  .../libtinyxml/libtinyxml_2.6.2.bb            |   5 +-
>  .../multipath-tools/multipath-tools_0.8.4.bb  |   2 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb    |   2 +-
>  .../recipes-support/openct/openct_0.6.20.bb   |   2 +-
>  .../procmail/procmail/CVE-2014-3618.patch     |  29 ++++
>  .../procmail/procmail/CVE-2017-16844.patch    |  20 +++
>  .../recipes-support/procmail/procmail_3.22.bb |   8 +-
>  .../{smarty_4.1.0.bb =3D> smarty_4.1.1.bb}      |   2 +-
>  .../span-lite/span-lite_0.10.3.bb             |   1 -
>  .../synergy/synergy/CVE-2020-15117.patch      |  48 ++++++
>  .../recipes-support/synergy/synergy_git.bb    |   1 +
>  meta-oe/recipes-support/tree/tree_2.0.2.bb    |   4 +-
>  .../libcrypt-openssl-guess-perl_0.15.bb       |   2 +-
>  .../python3-gsocketpool_0.1.6.bb              |   3 +-
>  .../python-hpack/python3-hpack_4.0.0.bb       |   2 +
>  .../python3-pyconnman_0.2.0.bb                |   2 +-
>  .../python-thrift/python3-thrift_0.16.0.bb    |   1 +
>  .../python-txws/python3-txws_0.9.1.bb         |   5 +
>  .../python3-pyparted_3.12.0.bb                |   5 +-
>  .../send2trash/python3-send2trash_1.8.0.bb    |   2 +
>  .../sensors/xfce4-sensors-plugin_1.4.3.bb     |   2 +-
>  40 files changed, 1050 insertions(+), 18 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing=
-prototype-compiler-warnings.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid=
-memory-de-reference-issue.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-de=
scriptor-leaks-reported-by-cppcheck.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak=
-on-tar_open-failure.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleak=
s-in-libtar-sample-program.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoi=
d-using-a-static-buffer-in-th_get_pathnam.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-N=
ULL-before-freeing-th_pathname.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdli=
b.h-for-malloc-in-lib-decode.c.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-=
programming-mistakes-detected-by-static-a.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.pa=
tch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-C=
VE-2021-33645-CVE-2021-33646.patch
>  create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-C=
VE-2021-33644.patch
>  create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-202=
1-42260.patch
>  create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-202=
3-34194.patch
>  create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-36=
18.patch
>  create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16=
844.patch
>  rename meta-oe/recipes-support/smarty/{smarty_4.1.0.bb =3D> smarty_4.1.1=
.bb} (94%)
>  create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-1511=
7.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120169): https://lists.openembedded.org/g/openembedde=
d-devel/message/120169
> Mute This Topic: https://lists.openembedded.org/mt/115551526/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

