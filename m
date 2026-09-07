Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173ABC79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 15:57:31 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38460.1788796649621301870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 08:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qkkfkoqC;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-855c26cf490so24191497b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 08:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788796648; cv=none;
        d=google.com; s=arc-20260327;
        b=g2EUnzRK8bu27CH8aHZrra0KlJMrR9VULJkrrywtFy5AyNTSRh6+uh2uOzK71Hkr+H
         zr5zAdQ8Dkf/g1AZ3ayg3yeV/ozQU47WESiY7U+PI7goTWKoXcjnx3IpMmqm+B3sgDEV
         WX/AK1YY1hO/c0EMYy9axTcPP3bzbX4l2oCxs6+3F9BpW9PaZzQqlfX4YHsENc8A3IT4
         KLb6PWKQIrCuvxAt+QtEkX4wmRVDR38Ka5K55TKqmCoOjawj5w89SS7MEBgPn+DPD+3m
         KXNSuOF/LEutnyNx4H7KlCbKJeJQg/5cQrhl/eE7RhKRX/mRW72itaVcyJW/ih/lCZp+
         mWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ScAHu+TGKn3gVU6xzV3kNyBi5Fs5ZjH/Be8W6/i9Ll8=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=rtJRnDRZxpTgaehfEvwPPy9Xd1hjI6OZDPw7L1cP0AiW5gkyEL5Drn5sM+SJa9TGXq
         /5U283Rcq6CXO67q4zMg4AnqQLI2PnSgez3smRYoj0WLE5/xpk/YnDkzKbXbErUoLTzm
         xCgbARVZn94jsMVkx/A3Ww+WFxdmaW/82CAu9uAYKX2rIDy7ZlU9EtW+XHbO4w8R1V6e
         whcriUawSTnS9UgoWO3j83EfwbTdouem6+VStgGf3XD2Rb0CbUw2BYLcHp5DmNYx7GpD
         WhDzZAJlE15Zi1DrHMiSwZkvYKApV46j434LacORz12mO/IqCWKOjNSBfUG2Khb2sZJF
         Js4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796648; x=1789401448; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScAHu+TGKn3gVU6xzV3kNyBi5Fs5ZjH/Be8W6/i9Ll8=;
        b=qkkfkoqCPJkNlKq+fL87O7cqU8u7ciKfydO3Hehfg9Lm5LZRhTWSdQTO8CcYWwES8B
         O8T6+/dprQ4IFllWEXqqiBV57fCOnk8Wk1rxNIFqsoL7H+8nQnDEZKHkf9BjA25qsMRX
         fwuYB3QfryQTFObT6ShOMgTINbmbBX6CKARfGjcEUssTitrKVUAMKZOp+90FmezhFscW
         Kjz/0eOuz10Z+UlXEat58aoqdqGrCBSghSY2FSaREpB1pcW56c3r5cHZT+ge3ConBYIF
         N00SmyQ+7F+XCq3iVXMYebBFbLb0iDFvhqAnspZlXgIfozyXijk6CbVZGsLlQ8qYaskq
         HkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796648; x=1789401448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScAHu+TGKn3gVU6xzV3kNyBi5Fs5ZjH/Be8W6/i9Ll8=;
        b=MKR6cw4w3jjsjlBuWOMMuw1jeIofKP2gzVge3WNdVW+84tbLK9r6CktcvsKlqBVsHk
         bhZ53LWlYFprwKc5W/1RoNB/YJ0zaXgCIORMQM/mlgJQpAEYt2mtCnYelh8/QNZqf64w
         lPD8sP5N3yVmFwuhcfEANIeyh3w1fULXpVJr7Yso8j7WBkxnRNyskCp3x/PxDy8FXsV4
         kbVMwglBLCxTwVBIZeN+Lj6Vlltt0d9tL/Ft/z8u0iqPiCkAqN04t4oj3Lp7AfPd+JWG
         vy5bdTWjg30/VE6e+9ayu2esizzrJqHriZ6wskGh9HU9Oz58ikxsNmtHVr3HH7Ydl+Lm
         AdxQ==
X-Gm-Message-State: AFuF++n4NCGIPgrFwMJWV8cIHyOh3ZmnW0SHVVugt0cQFVoCYrlDpE8B
	ZGWx9+WUWmoQ4jLxn4nnk/4SU5AzDRWfeIFTImN3qIo2arxrDLRW/Gu6SDAlmZvFRFgcDZvl6T1
	sqSMfDcV0nH7eE/UPuj6lQTJWqL0S74I=
X-Gm-Gg: AYBFou0WdtWnkaWSwNKxmN0NDPv5jCdQDsTFcpcKJOh5R6GdWRLjAXRweJX+UcGzcT6
	APwJrB7GpKpJ6yUpoMOdwgB+/y93D6QLFUbJCXD1nKk9auulw6pbvOMDZhh79x8//Efzph4F5z5
	Z+YGFAWkmLY7k3NWMNqTRo/fl5VAWudNE3GmGn+575jvVvtCFKWOt8Mmmlqw9TlpgdMTWC6XmeC
	2NfxfMvLJk7R+KnZEbq8DgNCln7Jcfy+wWAFWkOlsQueIG8p/iklQ8G/bSfvJI1xJnRcjUwGIHa
	x0d2yBwApcmBLmnDqg0T/q3xX3K9Z9maUeDEAT7K/+oBLAcv1GgJ1qj4yDR1Kem7K/csj9uVLiV
	YwjCSxo4SHvGVwoi0rVW9H4nuoHYVL3h0ICPRr6CVD1RBKIYLTB+CEb2OiuKGMfynRCuFs4/UPw
	5qkwr25LKX39qGa3F3ttBezRjJlzIJifJe+RtNenHsU/2ky0LupOrgLTJMJnHASDSoKPKZ70XiV
	sdGgugwZQoDnSnMqYQfAOHO
X-Received: by 2002:a05:690e:169b:b0:66f:d150:1795 with SMTP id
 956f58d0204a3-66fd1501abcmr2546110d50.89.1788796648373; Mon, 07 Sep 2026
 08:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788779254.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1788779254.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Sep 2026 08:57:01 -0700
X-Gm-Features: AcwNN1UfrykjuefUkv7ofThBaJqDJnBLRLfPU5Asugdy32m_D7eChqhyIqlKL6U
Message-ID: <CAMKF1src1XAXxf5h2ruMiBPY2qxUZM41CGPTwpoq8YUg7y_JTg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/44] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd4216065ae6acec"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 15:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129848

--000000000000cd4216065ae6acec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM. merged now thanks Anuj.

On Mon, Sep 7, 2026 at 4:12=E2=80=AFAM Anuj Mittal via lists.openembedded.o=
rg
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1763
>
>
> The following changes since commit
> bec755063a8b5da65df626f5749496aadaa4f4bb:
>
>   thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to b5874ea07d69919d9b40d59f2c2f0bbd24bc3259:
>
>   libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (1):
>   jsoncpp: upgrade 1.9.5 -> 1.9.7
>
> Benjamin Bouvier (2):
>   net-snmp: add CVE_PRODUCT
>   rsyslog: add CVE_PRODUCT
>
> Darsh Kelaiya (16):
>   python3-filelock: fix CVE-2025-68146
>   python3-filelock: fix CVE-2026-22701
>   python3-httplib2: fix CVE-2026-59939
>   python3-django: fix CVE-2026-15307
>   python3-django: fix CVE-2026-15337
>   python3-django: fix CVE-2026-15830
>   python3-aiohttp: ignore CVE-2026-34515
>   python3-aiohttp: fix CVE-2025-69224
>   python3-aiohttp: fix CVE-2025-69227
>   python3-aiohttp: fix CVE-2025-69229
>   python3-aiohttp: fix CVE-2025-69223
>   python3-aiohttp: fix CVE-2026-22815
>   python3-aiohttp: fix CVE-2026-34514
>   python3-aiohttp: fix CVE-2026-34513
>   python3-aiohttp: fix CVE-2026-34993
>   python3-aiohttp: fix CVE-2026-34518
>
> Devansh Patel (6):
>   hdf5: Fix CVE-2026-26199
>   hdf5: Fix CVE-2026-26197
>   python3-cbor2: Fix CVE-2026-26209
>   python3-httplib2: correct CVE_PRODUCT mapping
>   python3-cbor2: use exact CVE_PRODUCT mapping
>   python3-web3: add CVE_PRODUCT mapping
>
> Gyorgy Sarvari (3):
>   python3-httpx: set CVE_PRODUCT
>   python3-twisted: set CVE_PRODUCT
>   smarty: extend CVE_PRODUCT
>
> Hetvi Thakar (11):
>   python3-ujson: Fix CVE-2026-32875
>   python3-ujson: Fix CVE-2026-32874
>   python3-ujson: Fix CVE-2026-44660
>   python3-ujson: Fix CVE-2026-54911
>   python3-simpleeval: Fix CVE-2026-32640
>   python3-web3: Fix CVE-2026-40072
>   libssh: Fix CVE-2026-59843
>   libssh: Fix CVE-2026-59844
>   libssh: Fix CVE-2026-59846
>   libssh: Fix CVE-2026-59848
>   libssh: Fix CVE-2026-59850
>
> Hitendra Prajapati (4):
>   libssh: set status for CVE-2026-15370
>   libssh: set status for CVE-2026-59842
>   libssh: fix for CVE-2026-59845, CVE-2026-59847
>   opensc: fix for CVE-2026-40528
>
> Vijay Anusuri (1):
>   giflib: Fix CVE-2026-26740
>
>  .../net-snmp/net-snmp_5.9.4.bb                |    2 +
>  .../giflib/giflib/CVE-2026-26740.patch        |   40 +
>  .../recipes-devtools/giflib/giflib_5.2.2.bb   |    1 +
>  ...akage-when-compiled-with-C-17-1668-1.patch |  525 ++++++++
>  .../{jsoncpp_1.9.5.bb =3D> jsoncpp_1.9.7.bb}    |    6 +-
>  .../rsyslog/rsyslog_8.2402.0.bb               |    2 +
>  .../hdf5/files/CVE-2026-26197.patch           |   69 +
>  .../hdf5/files/CVE-2026-26199.patch           |  675 ++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    2 +
>  .../libssh/libssh/CVE-2026-59843.patch        |   84 ++
>  .../libssh/libssh/CVE-2026-59844.patch        |   52 +
>  .../libssh/libssh/CVE-2026-59845.patch        |   68 +
>  .../libssh/libssh/CVE-2026-59846.patch        |   87 ++
>  .../libssh/libssh/CVE-2026-59847-01.patch     |   39 +
>  .../libssh/libssh/CVE-2026-59847-02.patch     |   35 +
>  .../libssh/CVE-2026-59848-regression.patch    |   45 +
>  .../libssh/libssh/CVE-2026-59848.patch        |  684 ++++++++++
>  .../libssh/libssh/CVE-2026-59850.patch        |   40 +
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   12 +
>  .../opensc/files/CVE-2026-40528.patch         |   44 +
>  .../recipes-support/opensc/opensc_0.25.1.bb   |    1 +
>  .../recipes-support/smarty/smarty_4.4.1.bb    |    2 +-
>  .../python3-aiohttp/CVE-2025-69223.patch      |  848 ++++++++++++
>  .../python3-aiohttp/CVE-2025-69224.patch      |  161 +++
>  .../python3-aiohttp/CVE-2025-69227.patch      |  163 +++
>  .../python3-aiohttp/CVE-2025-69229_p1.patch   |  113 ++
>  .../python3-aiohttp/CVE-2025-69229_p2.patch   |  256 ++++
>  .../python3-aiohttp/CVE-2026-22815.patch      | 1020 +++++++++++++++
>  .../python3-aiohttp/CVE-2026-34513.patch      |  211 +++
>  .../python3-aiohttp/CVE-2026-34514.patch      |   65 +
>  .../python3-aiohttp/CVE-2026-34518.patch      |   64 +
>  .../python3-aiohttp/CVE-2026-34993.patch      |  364 ++++++
>  .../python/python3-aiohttp_3.9.5.bb           |   21 +
>  .../CVE-2026-26209-dependent.patch            |   27 +
>  .../python3-cbor2/CVE-2026-26209_p1.patch     |  173 +++
>  .../python3-cbor2/CVE-2026-26209_p2.patch     |  435 +++++++
>  .../python3-cbor2/CVE-2026-26209_p3.patch     |   81 ++
>  .../python3-cbor2/CVE-2026-26209_p4.patch     |   28 +
>  .../python/python3-cbor2_5.6.4.bb             |    7 +
>  .../CVE-2026-15307.patch                      |  563 ++++++++
>  .../CVE-2026-15337.patch                      |  163 +++
>  .../CVE-2026-15830.patch                      | 1144 +++++++++++++++++
>  .../python/python3-django_5.0.14.bb           |    3 +
>  .../python3-filelock/CVE-2025-68146.patch     |   88 ++
>  .../python3-filelock/CVE-2026-22701.patch     |   44 +
>  .../python/python3-filelock_3.13.4.bb         |    4 +
>  .../python3-httplib2/CVE-2026-59939.patch     |  745 +++++++++++
>  .../python/python3-httplib2_0.22.0.bb         |    4 +
>  .../python/python3-httpx_0.27.0.bb            |    2 +
>  .../CVE-2026-32640_p1.patch                   |   55 +
>  .../CVE-2026-32640_p2.patch                   |  187 +++
>  .../CVE-2026-32640_p3.patch                   |  485 +++++++
>  .../CVE-2026-32640_p4.patch                   |   90 ++
>  .../python/python3-simpleeval_0.9.13.bb       |    8 +-
>  .../python/python3-twisted_24.3.0.bb          |    2 +
>  .../python/python3-ujson/CVE-2026-32874.patch |   61 +
>  .../python/python3-ujson/CVE-2026-32875.patch |  199 +++
>  .../python/python3-ujson/CVE-2026-44660.patch |  112 ++
>  .../python/python3-ujson/CVE-2026-54911.patch |  267 ++++
>  .../python/python3-ujson_5.9.0.bb             |    4 +
>  .../python/python3-web3/CVE-2026-40072.patch  |  434 +++++++
>  .../python/python3-web3_6.17.0.bb             |    3 +
>  62 files changed, 11215 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
>  create mode 100644
> meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-=
compiled-with-C-17-1668-1.patch
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb =3D>
> jsoncpp_1.9.7.bb} (82%)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.pat=
ch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59843.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59844.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59846.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59848-regression.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59848.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-59850.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2026-40528.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-22815.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-dependen=
t.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p1.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p2.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p3.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209_p4.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15337.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15830.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-filelock/CVE-2025-68146.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-httplib2/CVE-2026-59939.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p1.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p2.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p3.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-simpleeval/CVE-2026-32640_p4.=
patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32874.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ujson/CVE-2026-44660.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-web3/CVE-2026-40072.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129846):
> https://lists.openembedded.org/g/openembedded-devel/message/129846
> Mute This Topic: https://lists.openembedded.org/mt/121126721/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cd4216065ae6acec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM. merged now thanks Anuj.</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Sep 7, 2026 at 4:12=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mail=
to:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Please merge these changes in scarthgap. Tested locally and on auto=
builder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1763" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1763</a><br>
<br>
<br>
The following changes since commit bec755063a8b5da65df626f5749496aadaa4f4bb=
:<br>
<br>
=C2=A0 thrift: fix CVE-2026-58389 (2026-08-13 10:01:51 +0530)<br>
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
for you to fetch changes up to b5874ea07d69919d9b40d59f2c2f0bbd24bc3259:<br=
>
<br>
=C2=A0 libssh: Fix CVE-2026-59850 (2026-09-02 10:39:59 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 jsoncpp: upgrade 1.9.5 -&gt; 1.9.7<br>
<br>
Benjamin Bouvier (2):<br>
=C2=A0 net-snmp: add CVE_PRODUCT<br>
=C2=A0 rsyslog: add CVE_PRODUCT<br>
<br>
Darsh Kelaiya (16):<br>
=C2=A0 python3-filelock: fix CVE-2025-68146<br>
=C2=A0 python3-filelock: fix CVE-2026-22701<br>
=C2=A0 python3-httplib2: fix CVE-2026-59939<br>
=C2=A0 python3-django: fix CVE-2026-15307<br>
=C2=A0 python3-django: fix CVE-2026-15337<br>
=C2=A0 python3-django: fix CVE-2026-15830<br>
=C2=A0 python3-aiohttp: ignore CVE-2026-34515<br>
=C2=A0 python3-aiohttp: fix CVE-2025-69224<br>
=C2=A0 python3-aiohttp: fix CVE-2025-69227<br>
=C2=A0 python3-aiohttp: fix CVE-2025-69229<br>
=C2=A0 python3-aiohttp: fix CVE-2025-69223<br>
=C2=A0 python3-aiohttp: fix CVE-2026-22815<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34514<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34513<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34993<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34518<br>
<br>
Devansh Patel (6):<br>
=C2=A0 hdf5: Fix CVE-2026-26199<br>
=C2=A0 hdf5: Fix CVE-2026-26197<br>
=C2=A0 python3-cbor2: Fix CVE-2026-26209<br>
=C2=A0 python3-httplib2: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-cbor2: use exact CVE_PRODUCT mapping<br>
=C2=A0 python3-web3: add CVE_PRODUCT mapping<br>
<br>
Gyorgy Sarvari (3):<br>
=C2=A0 python3-httpx: set CVE_PRODUCT<br>
=C2=A0 python3-twisted: set CVE_PRODUCT<br>
=C2=A0 smarty: extend CVE_PRODUCT<br>
<br>
Hetvi Thakar (11):<br>
=C2=A0 python3-ujson: Fix CVE-2026-32875<br>
=C2=A0 python3-ujson: Fix CVE-2026-32874<br>
=C2=A0 python3-ujson: Fix CVE-2026-44660<br>
=C2=A0 python3-ujson: Fix CVE-2026-54911<br>
=C2=A0 python3-simpleeval: Fix CVE-2026-32640<br>
=C2=A0 python3-web3: Fix CVE-2026-40072<br>
=C2=A0 libssh: Fix CVE-2026-59843<br>
=C2=A0 libssh: Fix CVE-2026-59844<br>
=C2=A0 libssh: Fix CVE-2026-59846<br>
=C2=A0 libssh: Fix CVE-2026-59848<br>
=C2=A0 libssh: Fix CVE-2026-59850<br>
<br>
Hitendra Prajapati (4):<br>
=C2=A0 libssh: set status for CVE-2026-15370<br>
=C2=A0 libssh: set status for CVE-2026-59842<br>
=C2=A0 libssh: fix for CVE-2026-59845, CVE-2026-59847<br>
=C2=A0 opensc: fix for CVE-2026-40528<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 giflib: Fix CVE-2026-26740<br>
<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.4.bb" rel=3D"noreferrer" =
target=3D"_blank">net-snmp_5.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../giflib/giflib/CVE-2026-26740.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A040 +<br>
=C2=A0.../recipes-devtools/giflib/<a href=3D"http://giflib_5.2.2.bb" rel=3D=
"noreferrer" target=3D"_blank">giflib_5.2.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0...akage-when-compiled-with-C-17-1668-1.patch |=C2=A0 525 ++++++++<br=
>
=C2=A0.../{<a href=3D"http://jsoncpp_1.9.5.bb" rel=3D"noreferrer" target=3D=
"_blank">jsoncpp_1.9.5.bb</a> =3D&gt; <a href=3D"http://jsoncpp_1.9.7.bb" r=
el=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 6 +-<br>
=C2=A0.../rsyslog/<a href=3D"http://rsyslog_8.2402.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">rsyslog_8.2402.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../hdf5/files/CVE-2026-26197.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A069 +<br>
=C2=A0.../hdf5/files/CVE-2026-26199.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 675 ++++++++++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A0 2 +<b=
r>
=C2=A0.../libssh/libssh/CVE-2026-59843.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A084 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-59844.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A052 +<br>
=C2=A0.../libssh/libssh/CVE-2026-59845.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A068 +<br>
=C2=A0.../libssh/libssh/CVE-2026-59846.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A087 ++<br>
=C2=A0.../libssh/libssh/CVE-2026-59847-01.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A039 +<br>
=C2=A0.../libssh/libssh/CVE-2026-59847-02.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A035 +<br>
=C2=A0.../libssh/CVE-2026-59848-regression.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A045 +<br>
=C2=A0.../libssh/libssh/CVE-2026-59848.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 684 ++++++++++<br>
=C2=A0.../libssh/libssh/CVE-2026-59850.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A040 +<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.10.6.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.10.6.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A012 +<br>
=C2=A0.../opensc/files/CVE-2026-40528.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A044 +<br>
=C2=A0.../recipes-support/opensc/<a href=3D"http://opensc_0.25.1.bb" rel=3D=
"noreferrer" target=3D"_blank">opensc_0.25.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../recipes-support/smarty/<a href=3D"http://smarty_4.4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">smarty_4.4.1.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0.../python3-aiohttp/CVE-2025-69223.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
848 ++++++++++++<br>
=C2=A0.../python3-aiohttp/CVE-2025-69224.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
161 +++<br>
=C2=A0.../python3-aiohttp/CVE-2025-69227.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
163 +++<br>
=C2=A0.../python3-aiohttp/CVE-2025-69229_p1.patch=C2=A0 =C2=A0|=C2=A0 113 +=
+<br>
=C2=A0.../python3-aiohttp/CVE-2025-69229_p2.patch=C2=A0 =C2=A0|=C2=A0 256 +=
+++<br>
=C2=A0.../python3-aiohttp/CVE-2026-22815.patch=C2=A0 =C2=A0 =C2=A0 | 1020 +=
++++++++++++++<br>
=C2=A0.../python3-aiohttp/CVE-2026-34513.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
211 +++<br>
=C2=A0.../python3-aiohttp/CVE-2026-34514.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A065 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34518.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A064 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34993.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
364 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.9.5.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A021 +<br>
=C2=A0.../CVE-2026-26209-dependent.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A027 +<br>
=C2=A0.../python3-cbor2/CVE-2026-26209_p1.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
173 +++<br>
=C2=A0.../python3-cbor2/CVE-2026-26209_p2.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
435 +++++++<br>
=C2=A0.../python3-cbor2/CVE-2026-26209_p3.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A081 ++<br>
=C2=A0.../python3-cbor2/CVE-2026-26209_p4.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../python/<a href=3D"http://python3-cbor2_5.6.4.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-cbor2_5.6.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
=C2=A0.../CVE-2026-15307.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 563 ++++++++<br>
=C2=A0.../CVE-2026-15337.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 163 +++<br>
=C2=A0.../CVE-2026-15830.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1144 +++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-django_5.0.14.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_5.0.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A0.../python3-filelock/CVE-2025-68146.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A088 ++<br>
=C2=A0.../python3-filelock/CVE-2026-22701.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A044 +<br>
=C2=A0.../python/<a href=3D"http://python3-filelock_3.13.4.bb" rel=3D"noref=
errer" target=3D"_blank">python3-filelock_3.13.4.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0.../python3-httplib2/CVE-2026-59939.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
745 +++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-httplib2_0.22.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-httplib2_0.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0.../python/<a href=3D"http://python3-httpx_0.27.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-httpx_0.27.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../CVE-2026-32640_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A055 +<br>
=C2=A0.../CVE-2026-32640_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 187 +++<br>
=C2=A0.../CVE-2026-32640_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 485 +++++++<br>
=C2=A0.../CVE-2026-32640_p4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A090 ++<br>
=C2=A0.../python/<a href=3D"http://python3-simpleeval_0.9.13.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-simpleeval_0.9.13.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
=C2=A0.../python/<a href=3D"http://python3-twisted_24.3.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twisted_24.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/python3-ujson/CVE-2026-32874.patch |=C2=A0 =C2=A061 +<br>
=C2=A0.../python/python3-ujson/CVE-2026-32875.patch |=C2=A0 199 +++<br>
=C2=A0.../python/python3-ujson/CVE-2026-44660.patch |=C2=A0 112 ++<br>
=C2=A0.../python/python3-ujson/CVE-2026-54911.patch |=C2=A0 267 ++++<br>
=C2=A0.../python/<a href=3D"http://python3-ujson_5.9.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-ujson_5.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0.../python/python3-web3/CVE-2026-40072.patch=C2=A0 |=C2=A0 434 ++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-web3_6.17.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-web3_6.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A062 files changed, 11215 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26=
740.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-=
C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch<br>
=C2=A0rename meta-oe/recipes-devtools/jsoncpp/{<a href=3D"http://jsoncpp_1.=
9.5.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.5.bb</a> =3D&gt; <=
a href=3D"http://jsoncpp_1.9.7.bb" rel=3D"noreferrer" target=3D"_blank">jso=
ncpp_1.9.7.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
43.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
44.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
45.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
46.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
47-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
47-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
48-regression.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
48.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-598=
50.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2026-4052=
8.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69223.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69224.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69227.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69229_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2025-69229_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-22815.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34513.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34514.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34518.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34993.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209-dependent.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2026-26209_p4.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2026-15307.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2026-15337.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-5.0.14/CVE-2026-15830.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-filelo=
ck/CVE-2025-68146.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-filelo=
ck/CVE-2026-22701.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-httpli=
b2/CVE-2026-59939.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-simple=
eval/CVE-2026-32640_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-simple=
eval/CVE-2026-32640_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-simple=
eval/CVE-2026-32640_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-simple=
eval/CVE-2026-32640_p4.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ujson/=
CVE-2026-32874.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ujson/=
CVE-2026-32875.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ujson/=
CVE-2026-44660.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ujson/=
CVE-2026-54911.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-web3/C=
VE-2026-40072.patch<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129846): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129846" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129846</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121126721/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121126721/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cd4216065ae6acec--

