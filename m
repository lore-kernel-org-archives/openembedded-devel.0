Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A5ECCF9E5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 04:30:03 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.20552.1761798597661634469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhjWCkqm;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: raj.khem@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so688351e0c.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 21:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761798596; x=1762403396; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwtggtd5TKp8uCxQQLTMDn47bU97zoQK8dMZ7j+fshc=;
        b=FhjWCkqmHMZQ8lClYv0nmxZ+1uhS0lmdYXTAWsuwKuREP+0Sz8GPAhYlEa9scOjLhG
         mGQfCVgzoN9h9HyBRj+yyU01K7iGHMG12R5ghTlUzJ0N97h5FibCpK4xVzPWm/n1AMcd
         URea4XlYNTQToPBhhpXrRW4rkSKZWIURy5Z94CKN6MvE+tuldxcv4syqpk3nNeiY/OQ5
         8o6IGUhCAENbAAQaXfGcVrrmcoxDh0gYk02vH7Fbe0ZmgNEJH0BhDGVnrgnCYGy+sCzx
         YrtOxidFiKj7cqDT2+efhZykrdpZENPzypjtgjlQzOmunyDrFehExP0DRvsY5KcDM5l+
         tiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761798596; x=1762403396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwtggtd5TKp8uCxQQLTMDn47bU97zoQK8dMZ7j+fshc=;
        b=okvZDXbJDi//3xJ/vEJovQiF8gL0m1UHizp76Od5RS8ajeEmn1IOxBPNdBFFUeSDv0
         i4DW3093cl/ZWdxlaWoiv5semFs2grE57AyUtjU2tm3fiVwsqarv3V8Yn+1dZEi7+Dwy
         8uOANlRP58TDG8cMbFSmRv6yYdriqoBTmuOLfwCatF3JtQHBtVaugHnq0uvipgj/hux4
         oBnFOgmrRodB+m9bPABzk19FrB10mtiQQ6yg3nMppiAWa49dTGQkgB5wmPIHmWJX6P/z
         0diqnflk9YjaizjGBKVKCcs2Pjsfe1uv/elhL0xSahyYpdGUsYJjz3Q0vDhIEFOvOyig
         rxpg==
X-Gm-Message-State: AOJu0YwMntCBUriNJzXYlhjol0MY418q7XaDXY88f5kOv80NahaQa7To
	erqYP8yOJdI3wgiYW1rNzJU98+oLnHJ5iBzwD87M/aon4QQfj+ed/oQru+F3Q8DORLyaQNigmQe
	sIX/igynugHmaxbj9oMkhJ43mQq/JBf+lefn/Qek=
X-Gm-Gg: ASbGncvx4mPxHSvFqea0fLgU0W3YGsIh8MH4LuV4sRZR7t0WT1vmWr0gKW258onvSw4
	fi1raZysAb51iLwE/pJAs+cilRMTFgcPDEDu+kQhzMVcVqhakaMeZA9zbf32rKxOtQPbS1qkDJO
	jSCcSBOzO/46j2Qo4KzK8hCV7rYGh5LjCkBt96zMCzjXXvg3mVYJPsy51NaSbGzzz/KlBv/ijqb
	4Vt7oYFbWllO9GRKJlMHybMQFhR0EhW+7JsQdwPx1POxYXFYdPytjvhrVR1IxChZ4LS/65WsCBr
	vEWxQsUBEPoI8ItLfrbRugHP/eoBDr7XhnsIV+S40PHWEnilJTxLaTsnbeQr
X-Google-Smtp-Source: AGHT+IEt8J2v+5BI7FTtEz8R0cBu+6XQacv1Ysghb8fJO/wM2HOs4Nt1LZtc4Zdp1MJz9ON9+rcrLtWXbMv1iQ40wlk=
X-Received: by 2002:a05:690c:e4eb:b0:784:8f9a:52ab with SMTP id
 00721157ae682-78638e2f61bmr18761217b3.23.1761798084258; Wed, 29 Oct 2025
 21:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761786284.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1761786284.git.anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Oct 2025 21:20:57 -0700
X-Gm-Features: AWmQ_bnHJ7MDSq-QwqcX0_pJZrhqW8zXb5qZl4YnbMk9TCVSDLYt4RSHQOhIHkw
Message-ID: <CAMKF1srjv7LCCSt_ahPmFA7wx=fyOHEGEi5kyki5YYnp2H=D4g@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 00/24] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 04:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121185

merged now, thanks Anuj

On Wed, Oct 29, 2025 at 6:13=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.com>=
 wrote:
>
> This is an older set of changes that I wasn't able to send but
> had tested earlier:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1034
>
> This mostly includes CVE fixes sent to list and some SRC_URI and host gcc
> version relat changes.
>
> The following changes since commit e621da947048842109db1b4fd3917a02e0501a=
a2:
>
>   procmail: Add -Wno-implicit-int to fix error of do_compile (2025-09-24 =
10:04:48 +0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> Adrian Freihofer (1):
>   thrift: fix build with gcc 15
>
> Changqing Li (1):
>   mariadb: correct STACK_DIRECTION setting
>
> Grygorii Tertychnyi (1):
>   libusbgx: fix gadget-stop install
>
> Gyorgy Sarvari (6):
>   mosh: set working SRC_URI
>   psqlodbc: set valid SRC_URI
>   collectd: set working SRC_URI
>   apache2: ignore irrelevant CVEs
>   civetweb: patch CVE-2025-55763
>   dovecot: patch CVE-2022-30550
>
> Jeroen Hofstee (2):
>   php: ignore CVE-2024-3566
>   nodejs: ignore CVE-2024-3566
>
> Khem Raj (1):
>   uim: Stick to C17
>
> Peter Marko (6):
>   ace: ignore CVE-2009-1147
>   audiofile: fix multiple CVEs
>   audiofile: patch CVE-2017-6829
>   audiofile: fix multiple CVEs
>   audiofile: patch CVE-2017-6831
>   audiofile: patch CVE-2017-6839
>
> Praveen Kumar (1):
>   polkit: fix CVE-2025-7519
>
> Saravanan (1):
>   udisks2: upgrade 2.10.1 -> 2.10.2
>
> Sunil Dora (1):
>   layer.conf: add bpftrace to NON_MULTILIB_RECIPES
>
> Yogita Urade (1):
>   indent: fix CVE-2023-40305
>
> hongxu (1):
>   indent: fix CVE-2024-0911
>
> mark.yang (1):
>   srecord: fix build failure with gcc-15
>
>  ...w-in-directory-URI-slash-redirection.patch |   57 +
>  .../civetweb/civetweb_1.16.bb                 |    1 +
>  ...g-passdbs-with-identical-driver-args.patch |  137 +
>  .../recipes-support/dovecot/dovecot_2.3.21.bb |    1 +
>  meta-oe/conf/layer.conf                       |    2 +-
>  .../recipes-connectivity/ace/ace_6.5.19.bb    |    2 +
>  .../recipes-connectivity/mosh/mosh_1.4.0.bb   |    5 +-
>  ...missing-cstdint-include-for-int64_t-.patch |   51 +
>  .../thrift/thrift_0.20.0.bb                   |    3 +-
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |    1 -
>  .../psqlodbc/psqlodbc_16.00.0000.bb           |    2 +-
>  .../recipes-devtools/nodejs/nodejs_20.18.2.bb |    1 +
>  meta-oe/recipes-devtools/php/php_8.2.29.bb    |    1 +
>  .../collectd/collectd_5.12.0.bb               |    4 +-
>  ...ap-buffer-underread-in-set_buf_break.patch |  123 +
>  .../indent/indent/CVE-2023-40305_0001.patch   | 4196 ++++++++++++++++
>  .../indent/indent/CVE-2023-40305_0002.patch   | 4254 +++++++++++++++++
>  .../recipes-extended/indent/indent_2.2.12.bb  |    3 +
>  .../polkit/files/CVE-2025-7519.patch          |   34 +
>  meta-oe/recipes-extended/polkit/polkit_124.bb |    5 +-
>  .../audiofile/audiofile_0.3.6.bb              |    5 +
>  ...ays-check-the-number-of-coefficients.patch |   45 +
>  ...ues-to-fix-index-overflow-in-IMA.cpp.patch |   43 +
>  ...multiplication-overflow-in-sfconvert.patch |   79 +
>  ...ail-when-error-occurs-in-parseFormat.patch |   46 +
>  ...lication-overflow-in-MSADPCM-decodeS.patch |  126 +
>  .../recipes-support/libusbgx/libusbgx_git.bb  |    2 +-
>  ...e-with-gcc-15-by-adding-cstdint-head.patch |   36 +
>  .../recipes-support/srecord/srecord_1.65.0.bb |    4 +-
>  .../udisks/udisks2/CVE-2025-6019.patch        |   51 -
>  .../{udisks2_2.10.1.bb =3D> udisks2_2.10.2.bb}  |    3 +-
>  meta-oe/recipes-support/uim/uim_1.8.8.bb      |    2 +
>  .../recipes-httpd/apache2/apache2_2.4.65.bb   |   12 +
>  33 files changed, 9273 insertions(+), 64 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civetwe=
b/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
>  create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-=
auth-Fix-handling-passdbs-with-identical-driver-args.patch
>  create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-THRIF=
T-5842-Add-missing-cstdint-include-for-int64_t-.patch
>  create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-a-hea=
p-buffer-underread-in-set_buf_break.patch
>  create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305=
_0001.patch
>  create mode 100644 meta-oe/recipes-extended/indent/indent/CVE-2023-40305=
_0002.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2025-7519.p=
atch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Alway=
s-check-the-number-of-coefficients.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp=
-index-values-to-fix-index-overflow-in-IMA.cpp.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check=
-for-multiplication-overflow-in-sfconvert.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actua=
lly-fail-when-error-occurs-in-parseFormat.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check=
-for-multiplication-overflow-in-MSADPCM-decodeS.patch
>  create mode 100644 meta-oe/recipes-support/srecord/files/0001-fix-build-=
failure-with-gcc-15-by-adding-cstdint-head.patch
>  delete mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.=
patch
>  rename meta-oe/recipes-support/udisks/{udisks2_2.10.1.bb =3D> udisks2_2.=
10.2.bb} (95%)
>

