Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5976CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:21:27 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1275.1778174480697102191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 10:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WVD2XmwK;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c7a459105so1328278d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 10:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778174480; cv=none;
        d=google.com; s=arc-20240605;
        b=E+nglGfJIdr5dpAh2CjulN8ZechKxS46jXqgzoXudRINKtBQsf6SZDdOk3gmtFouYL
         YucihS9KiFeo2fDs/PxPXkR3D8AZMgGnzxATXNMz87TDJCcZVf6CSmPZMEzV4EgYMi4Z
         0I+mczOMOZaVdMSZpKOv/Dgsr7lRWTjosjre8dteGSwigyXflfiVXW7eD9Wi01P63AQi
         OmalQuBdIFb9Z5c7qznKxzlvQyz17WrM05JbdRsfSRyt7TS547pp3sB0GJOmw2W+vebe
         tB96iGDqW8dkn8WW4MaT3eMMxYpP9f8KjBr9pqzmdCRA2Fo3Ks6JU6gM6SsrM2+5MNB8
         Jd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zCVWh79CvB0bMk83WITNUH5EW3cEy+p5sd47xcVQfkU=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=hdPKcygaxxn0TwJKU2kKVlcGQ3K6l55dpExvLk2hVwD9f+ggEvROFxlG1rXS97CvIH
         jzzelMOrN57PSHp9mOdBL9UxKkB7SZgpVlGuRaVRHt3vjsZ0mvC/wH5YSP01GyW3z8/V
         /eSU67Dzj/4KLfqnKuvOZJaOKlxBKfSdMY++KsLuhzJH2WPl5bfqRYjKv/8yQdWtI7QH
         9eanwKT8CWd4yuuN0ABMvWBgvIgjISr8uAh6RISJZQ8ujI0JMm7SuybxBMCrbEebWV3b
         tVAI+zAoalQ/IuFGUHK1sfAm1I0SntQk7VZz+tmNJlZDz5bMNmthGha6kNaLGNOz3y7C
         46qg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778174480; x=1778779280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCVWh79CvB0bMk83WITNUH5EW3cEy+p5sd47xcVQfkU=;
        b=WVD2XmwKiqTGlJmfiTcktLuboLGEYBpDEbGwi/9PLxpbS5SQeUsJ3gNv3OAoUXhRhM
         FoLaKHN+HvTPDFXmCrEKTXOHLmvKbBGOltv+51uI2TyCjJERDFilF0BtwkyItNWzpY1I
         gwYiYiXhxAApp1PC0v0I7UmfrrAxFNQu/yKKCeYyOhO1rxttt3+AtSPIz/osWKRi4+31
         lpI8/OAk0nKUs9egM15U4KDY4n8XG9QSOP1fCgcux23JoYu+qp1HE9Ap42ZQ0NoGBR/P
         AbQItRRNWTQHn/Bv7ToBwz2SKc2uMcHNbQms2F1h5SsQPtwvDuP+hm14z3DnCIr87IHz
         6T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174480; x=1778779280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCVWh79CvB0bMk83WITNUH5EW3cEy+p5sd47xcVQfkU=;
        b=rQmwoZcPH/pSfJTtQxBPv5JXRcEFrJ7a0u1oyPRc/LY5ZX0pwR0fHblPTopKEz6Wle
         NjFCM0RjMHcOvdKjlCVKaZTJBMFoEl2JdvcSmeBseRXJZUyFjn7f+brYHQuvOwOXahbz
         a0kZ5Lie14pzXFVinsYVjqTThitnRX+HU0uO47Zfn266eV18gmIzHuxiXaomRSmG6x19
         ZcKmMa68tG2fVX80CjMOm3rf5ONxL90U5J1cL9RbkjUVAiOQhepxOXhRpzJMnl8yJFPE
         c6jn1ZDusa65/xkv4j3eGLLunqTu0zKjSHBfv0ukuUxkDB3pTOU6/6iiBuoyYCC1MAoU
         x6Yg==
X-Gm-Message-State: AOJu0YwqRCR4ZQ9+k6s6Hq3FeD2z6bVdZJaQLKlYG8p/P81jORnjxQsH
	PlCLKR16Sl81Byjfq7CA+02T1xX5wtzTvEvB5IOYTEZ6jPyEK7eyTbfCtN/hSMeQzHMjLiIhjNn
	y6a/GxjtFNkRwiepz+ApAByYappUPVeEHpkrVjqk=
X-Gm-Gg: Acq92OGRWGI+7ZapJNzNXsIC8BS5aJ04nqiV+c4rRmMSRQ+016mMMmm7JaOTqRE4eX4
	4B6JcldnUwG5ov9cAzThTKvSRKjoIsALIInKLEHLtZTTKxNsDiD3SQn3/kUYTKuNThsRRyGXSLk
	vcRuQq9OixRlAgUJWqjUNXYthHZQy/+pJMVJTnxQ7rCcAKz+rQBEWFxsNRR5fGn1DJofVrht0xj
	oDu8OZ4TFJkixanNr4Of2L3i95q7bgIjzFoLCZn4ew5wO0YFGci6NVIhFnRkSqoglnRxFMuxQzL
	RBQfgyyZm3oeH7pIy/EoWuXqR2VLyhhjMgksK2vFyUkSCpjpi+vO7ojO9w8mzj/BcIVLgfeVOLF
	flqBU1MydXPXfXqRGmkFCshmlPaFaYx/uByNU0B/qwWPH763FM/qaQhcTKZb7/TFLfo6tvZWO2e
	1+XsB7rKX1wjqN7CH/
X-Received: by 2002:a05:690e:1698:b0:654:fd9:2e88 with SMTP id
 956f58d0204a3-65d7e8a3c59mr3016645d50.31.1778174479434; Thu, 07 May 2026
 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <18A9813C1291FB70.1732988@lists.openembedded.org> <CA+s=J=wAwzXcQQvDfKeK8yY9DePq4cRF1aALjQFtcyUyW0eOgg@mail.gmail.com>
In-Reply-To: <CA+s=J=wAwzXcQQvDfKeK8yY9DePq4cRF1aALjQFtcyUyW0eOgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 May 2026 22:50:52 +0530
X-Gm-Features: AVHnY4KoZ5R6xF9bHt-5KF3XjVhOSgH5aYVNgdGHgu0tK1onthp3tpJv-ggFMtw
Message-ID: <CAMKF1spOHCHCszrR=VCDuiBjoF2RbVNKaSFk4BJidePpAvgOpA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/75] Whinlatter pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003207f106513d8266"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 17:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126815

--0000000000003207f106513d8266
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thanks Anuj

On Wed, Apr 29, 2026 at 6:57=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Gentle ping
>
>
> On Sat, Apr 25, 2026 at 1:07=E2=80=AFPM Anuj Mittal via lists.openembedde=
d.org
> <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Please merge these changes in whinlatter. Tested on autobuilder and
> locally.
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1503
> >
> > The following changes since commit
> 8bcdb0cc1dab116253b409e78fb868ced7d8397c:
> >
> >   bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
> >
> > for you to fetch changes up to bf300f9b6c90c130b2d0e84303153df7c0d68852=
:
> >
> >   lshw: Fix binmerge (2026-04-23 10:53:58 +0530)
> >
> > ----------------------------------------------------------------
> >
> > Ankur Tyagi (17):
> >   nginx: upgrade 1.29.1 -> 1.29.2
> >   python3-astroid: upgrade 4.0.2 -> 4.0.4
> >   python3-aiofiles: fix HOMEPAGE
> >   python3-alembic: add HOMEPAGE
> >   python3-apiflash: upgrade 3.0.0 -> 3.0.2
> >   gvfs: upgrade 1.58.2 -> 1.58.4
> >   libde265: patch CVE-2026-33165
> >   wolfssl: patch CVE-2026-0819
> >   wolfssl: patch CVE-2026-2646
> >   wolfssl: ptach CVE-2026-3229
> >   wolfssl: patch CVE-2026-3230
> >   wolfssl: patch CVE-2026-3547
> >   wolfssl: patch CVE-2026-4159
> >   wolfssl: patch CVE-2026-4395
> >   zabbix: ignore CVE-2026-23919
> >   tigervnc: patch CVE-2026-34352
> >   strongswan: patch CVE-2026-25075
> >
> > Deepak Rathore (3):
> >   libssh: Fix CVE-2026-0968
> >   libssh: Fix CVE-2026-0967
> >   libssh: Fix CVE-2026-0965
> >
> > Gyorgy Sarvari (32):
> >   nginx: upgrade 1.28.2 -> 1.28.3
> >   freeipmi: upgrade 1.6.16 -> 1.6.17
> >   botan: patch CVE-2026-32877
> >   botan: patch CVE-2026-32883
> >   botan: patch CVE-2026-32884
> >   dovecot: patch CVE-2025-59031
> >   dovecot: mark CVE-2026-0394 patched
> >   nodejs: ignore fixed CVEs
> >   opensc: patch CVE-2025-49010
> >   opensc: patch CVE-2025-66037
> >   opensc: patch CVE-2025-66038
> >   imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
> >   giflib: patch CVE-2025-31344
> >   botan: patch CVE-2026-34582
> >   corosync: patch CVE-2026-35091
> >   corosync: patch CVE-2026-35092
> >   hiawatha: upgrade 11.7 -> 11.8
> >   monkey: upgrade 1.8.4 -> 1.8.7
> >   monkey: patch CVEs
> >   openjpeg: patch CVE-2026-6192
> >   libgphoto2: patch CVE-2026-40333
> >   libgphoto2: patch CVE-2026-40334
> >   libgphoto2: patch CVE-2026-40335
> >   libgphoto2: patch CVE-2026-40336
> >   libgphoto2: patch CVE-2026-40338
> >   libgphoto2: patch CVE-2026-40339
> >   libgphoto2: patch CVE-2026-40340
> >   libgphoto2: patch CVE-2026-40341
> >   jq: patch CVE-2026-32316
> >   jq: patch CVE-2026-33947
> >   jq: patch CVE-2026-33948
> >   jq: patch CVE-2026-39979
> >
> > Jason Schonberg (4):
> >   Update README.md with branch name.
> >   nodejs: upgrade 22.22.0 -> 22.22.1
> >   nodejs: upgrade 22.22.1 -> 22.22.2
> >   php: upgrade 8.4.19 -> 8.4.20
> >
> > J=C3=B6rg Sommer (1):
> >   lshw: Fix binmerge
> >
> > Liu Yiding (1):
> >   gjs: upgrade 1.84.1 -> 1.84.2
> >
> > Markus Volk (5):
> >   iwd: update 3.10 -> 3.11
> >   nautilus: update 49.4 -> 49.5
> >   libdvdread: use https for fetching code
> >   libdvdcss: use https for fetching code
> >   libdvdnav: use https for fetching code
> >
> > Michal Sieron (1):
> >   gnome-bluetooth3: Fix RRECOMMENS typo
> >
> > Peter Kjellerstedt (1):
> >   jq: Use Git to fetch the code
> >
> > Vijay Anusuri (1):
> >   giflib: Fix CVE-2026-23868
> >
> > Wang Mingyu (7):
> >   iwd: upgrade 3.11 -> 3.12
> >   openldap: upgrade 2.6.10 -> 2.6.12
> >   openldap: upgrade 2.6.12 -> 2.6.13
> >   nautilus: upgrade 49.2 -> 49.3
> >   nautilus: upgrade 49.3 -> 49.4
> >   gvfs: upgrade 1.58.0 -> 1.58.1
> >   imagemagick: upgrade 7.1.2-18 -> 7.1.2-19
> >
> > Zhang Peng (2):
> >   gvfs: upgrade 1.58.1 -> 1.58.2
> >   libwnck3: upgrade 43.2 -> 43.3
> >
> >  .../gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb}      |   2 +-
> >  .../gnome-bluetooth3_3.34.5.bb                |   2 +-
> >  .../gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.bb}   |   2 +-
> >  ...40d59c32d7ebeb94d242436e3144cefc174a.patch |  40 --
> >  .../{libwnck3_43.2.bb =3D> libwnck3_43.3.bb}    |   5 +-
> >  .../{nautilus_49.2.bb =3D> nautilus_49.5.bb}    |   2 +-
> >  .../libde265/libde265/CVE-2026-33165.patch    |  45 +++
> >  .../libde265/libde265_1.0.16.bb               |   1 +
> >  .../libdvdnav/libdvdnav_6.1.1.bb              |   2 +-
> >  .../recipes-multimedia/vlc/libdvdcss_1.4.3.bb |   2 +-
> >  .../wolfssl/files/CVE-2026-0819.patch         |  31 ++
> >  .../wolfssl/files/CVE-2026-2646-1.patch       |  39 ++
> >  .../wolfssl/files/CVE-2026-2646-2.patch       |  51 +++
> >  .../wolfssl/files/CVE-2026-3229-1.patch       | 104 +++++
> >  .../wolfssl/files/CVE-2026-3229-2.patch       |  42 ++
> >  .../wolfssl/files/CVE-2026-3229-3.patch       |  28 ++
> >  .../wolfssl/files/CVE-2026-3230.patch         |  69 ++++
> >  .../wolfssl/files/CVE-2026-3547.patch         |  30 ++
> >  .../wolfssl/files/CVE-2026-4159.patch         |  32 ++
> >  .../wolfssl/files/CVE-2026-4395.patch         |  31 ++
> >  .../wolfssl/wolfssl_5.8.0.bb                  |  10 +
> >  .../corosync/corosync/CVE-2026-35091.patch    |  47 +++
> >  .../corosync/corosync/CVE-2026-35092.patch    |  57 +++
> >  .../corosync/corosync_3.1.10.bb               |   2 +
> >  .../dovecot/dovecot/CVE-2025-59031.patch      | 142 +++++++
> >  .../dovecot/dovecot_2.4.1-4.bb                |   2 +
> >  .../strongswan/CVE-2026-25075.patch           |  48 +++
> >  .../strongswan/strongswan_6.0.3.bb            |   4 +-
> >  .../iwd/{iwd_3.10.bb =3D> iwd_3.12.bb}          |   2 +-
> >  .../zabbix/zabbix_7.0.19.bb                   |   1 +
> >  .../botan/botan/CVE-2026-32877.patch          | 158 ++++++++
> >  .../botan/botan/CVE-2026-32883.patch          | 171 +++++++++
> >  .../botan/botan/CVE-2026-32884.patch          | 171 +++++++++
> >  .../botan/botan/CVE-2026-34582.patch          |  28 ++
> >  meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   7 +-
> >  .../giflib/giflib/CVE-2025-31344.patch        |  28 ++
> >  .../giflib/giflib/CVE-2026-23868.patch        |  34 ++
> >  .../recipes-devtools/giflib/giflib_5.2.2.bb   |   4 +-
> >  ...-with-disable-maintainer-mode-and-so.patch |  44 +++
> >  .../jq/jq/CVE-2026-32316.patch                |  53 +++
> >  .../jq/jq/CVE-2026-33947.patch                | 104 +++++
> >  .../jq/jq/CVE-2026-33948.patch                |  49 +++
> >  .../jq/jq/CVE-2026-39979.patch                |  31 ++
> >  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  19 +-
> >  meta-oe/recipes-devtools/lshw/lshw_02.20.bb   |   4 +-
> >  .../{nodejs_22.22.0.bb =3D> nodejs_22.22.2.bb}  |  13 +-
> >  .../php/{php_8.4.19.bb =3D> php_8.4.20.bb}      |   2 +-
> >  .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ++++++++
> >  .../gphoto2/libgphoto2/CVE-2026-40334.patch   |  37 ++
> >  .../gphoto2/libgphoto2/CVE-2026-40335.patch   |  43 +++
> >  .../gphoto2/libgphoto2/CVE-2026-40336.patch   |  44 +++
> >  .../gphoto2/libgphoto2/CVE-2026-40338.patch   |  34 ++
> >  .../gphoto2/libgphoto2/CVE-2026-40339.patch   |  41 ++
> >  .../gphoto2/libgphoto2/CVE-2026-40340.patch   |  40 ++
> >  .../gphoto2/libgphoto2/CVE-2026-40341.patch   |  69 ++++
> >  .../gphoto2/libgphoto2_2.5.33.bb              |  10 +-
> >  .../openjpeg/openjpeg/CVE-2026-6192.patch     |  35 ++
> >  .../openjpeg/openjpeg_2.5.4.bb                |   1 +
> >  .../tigervnc/files/CVE-2026-34352.patch       |  31 ++
> >  .../tigervnc/tigervnc_1.15.0.bb               |   1 +
> >  .../libdvdread/libdvdread_6.1.3.bb            |   2 +-
> >  ...{freeipmi_1.6.16.bb =3D> freeipmi_1.6.17.bb} |   2 +-
> >  ...ck_7.1.2-17.bb =3D> imagemagick_7.1.2-19.bb} |   2 +-
> >  .../libssh/libssh/CVE-2026-0965.patch         | 286 ++++++++++++++
> >  .../libssh/libssh/CVE-2026-0967.patch         | 362 ++++++++++++++++++
> >  .../libssh/libssh/CVE-2026-0968_p1.patch      |  64 ++++
> >  .../libssh/libssh/CVE-2026-0968_p2.patch      | 132 +++++++
> >  .../recipes-support/libssh/libssh_0.11.3.bb   |   4 +
> >  ...{openldap_2.6.10.bb =3D> openldap_2.6.13.bb} |   4 +-
> >  .../opensc/opensc/CVE-2025-49010.patch        |  71 ++++
> >  .../opensc/opensc/CVE-2025-66037.patch        |  34 ++
> >  .../opensc/opensc/CVE-2025-66038.patch        |  40 ++
> >  .../recipes-support/opensc/opensc_0.26.1.bb   |   6 +-
> >  .../python/python3-aiofiles_24.1.0.bb         |   2 +-
> >  .../python/python3-alembic_1.17.2.bb          |   1 +
> >  ...ask_3.0.0.bb =3D> python3-apiflask_3.0.2.bb} |   2 +-
> >  ...roid_4.0.2.bb =3D> python3-astroid_4.0.4.bb} |   2 +-
> >  ..._-nonstring-to-remove-unterminated-s.patch |  43 ---
> >  ...ute__-nonstring-with-macro-MBEDTLS_A.patch |  42 --
> >  ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch |  33 --
> >  .../{hiawatha_11.7.bb =3D> hiawatha_11.8.bb}    |   5 +-
> >  ...tp-fix-malformed-request-crash-paths.patch | 160 ++++++++
> >  ...eduler-guard-protocol-close-callback.patch |  51 +++
> >  ...server-parser-harden-boundary-checks.patch | 108 ++++++
> >  .../{monkey_1.8.4.bb =3D> monkey_1.8.7.bb}      |  14 +-
> >  .../{nginx_1.28.2.bb =3D> nginx_1.28.3.bb}      |   2 +-
> >  .../{nginx_1.29.1.bb =3D> nginx_1.29.2.bb}      |   2 +-
> >  meta-xfce/README.md                           |   2 +-
> >  88 files changed, 3605 insertions(+), 204 deletions(-)
> >  rename meta-gnome/recipes-gnome/gjs/{gjs_1.84.1.bb =3D> gjs_1.84.2.bb}
> (94%)
> >  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.58.0.bb =3D> gvfs_1.58.4.=
bb}
> (97%)
> >  delete mode 100644
> meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144ce=
fc174a.patch
> >  rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.2.bb =3D>
> libwnck3_43.3.bb} (78%)
> >  rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.2.bb =3D>
> nautilus_49.5.bb} (93%)
> >  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-33165.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-0819.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-1.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-2.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-1.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-2.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3229-3.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3230.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3547.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4159.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4395.patch
> >  create mode 100644
> meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
> >  create mode 100644
> meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
> >  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-59031.patch
> >  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patc=
h
> >  rename meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb =3D> iwd_3.12.bb}
> (95%)
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.patch
> >  create mode 100644
> meta-oe/recipes-crypto/botan/botan/CVE-2026-34582.patch
> >  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
> >  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
> >  create mode 100644
> meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-maintai=
ner-mode-and-so.patch
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948.patch
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.0.bb =3D>
> nodejs_22.22.2.bb} (93%)
> >  rename meta-oe/recipes-devtools/php/{php_8.4.19.bb =3D> php_8.4.20.bb}
> (99%)
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
> >  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
> >  create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
> >  create mode 100644
> meta-oe/recipes-graphics/tigervnc/files/CVE-2026-34352.patch
> >  rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.16.bb =3D>
> freeipmi_1.6.17.bb} (93%)
> >  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb =
=3D>
> imagemagick_7.1.2-19.bb} (99%)
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p1.patch
> >  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p2.patch
> >  rename meta-oe/recipes-support/openldap/{openldap_2.6.10.bb =3D>
> openldap_2.6.13.bb} (98%)
> >  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2025-49010.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2025-66037.patch
> >  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2025-66038.patch
> >  rename meta-python/recipes-devtools/python/{python3-apiflask_3.0.0.bb
> =3D> python3-apiflask_3.0.2.bb} (83%)
> >  rename meta-python/recipes-devtools/python/{python3-astroid_4.0.2.bb
> =3D> python3-astroid_4.0.4.bb} (90%)
> >  delete mode 100644
> meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstr=
ing-to-remove-unterminated-s.patch
> >  delete mode 100644
> meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-no=
nstring-with-macro-MBEDTLS_A.patch
> >  delete mode 100644
> meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTE=
RMINATED_STRING.patch
> >  rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.7.bb =3D>
> hiawatha_11.8.bb} (90%)
> >  create mode 100644
> meta-webserver/recipes-httpd/monkey/files/0001-server-http-fix-malformed-=
request-crash-paths.patch
> >  create mode 100644
> meta-webserver/recipes-httpd/monkey/files/0002-server-scheduler-guard-pro=
tocol-close-callback.patch
> >  create mode 100644
> meta-webserver/recipes-httpd/monkey/files/0003-server-parser-harden-bound=
ary-checks.patch
> >  rename meta-webserver/recipes-httpd/monkey/{monkey_1.8.4.bb =3D>
> monkey_1.8.7.bb} (86%)
> >  rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.2.bb =3D>
> nginx_1.28.3.bb} (66%)
> >  rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.1.bb =3D>
> nginx_1.29.2.bb} (77%)
> >
> > --
> > 2.53.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126611):
> https://lists.openembedded.org/g/openembedded-devel/message/126611
> > Mute This Topic: https://lists.openembedded.org/mt/118999495/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003207f106513d8266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now thanks Anuj</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29=
, 2026 at 6:57=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Gentle ping<br>
<br>
<br>
On Sat, Apr 25, 2026 at 1:07=E2=80=AFPM Anuj Mittal via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org=
" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Please merge these changes in whinlatter. Tested on autobuilder and lo=
cally.<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81=
/builds/1503" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/81/builds/1503</a><br>
&gt;<br>
&gt; The following changes since commit 8bcdb0cc1dab116253b409e78fb868ced7d=
8397c:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +053=
0)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
meta-openembedded-contrib</a> stable/whinlatter-next<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib/log/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blan=
k">https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/w=
hinlatter-next</a><br>
&gt;<br>
&gt; for you to fetch changes up to bf300f9b6c90c130b2d0e84303153df7c0d6885=
2:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0lshw: Fix binmerge (2026-04-23 10:53:58 +0530)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt;<br>
&gt; Ankur Tyagi (17):<br>
&gt;=C2=A0 =C2=A0nginx: upgrade 1.29.1 -&gt; 1.29.2<br>
&gt;=C2=A0 =C2=A0python3-astroid: upgrade 4.0.2 -&gt; 4.0.4<br>
&gt;=C2=A0 =C2=A0python3-aiofiles: fix HOMEPAGE<br>
&gt;=C2=A0 =C2=A0python3-alembic: add HOMEPAGE<br>
&gt;=C2=A0 =C2=A0python3-apiflash: upgrade 3.0.0 -&gt; 3.0.2<br>
&gt;=C2=A0 =C2=A0gvfs: upgrade 1.58.2 -&gt; 1.58.4<br>
&gt;=C2=A0 =C2=A0libde265: patch CVE-2026-33165<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-0819<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-2646<br>
&gt;=C2=A0 =C2=A0wolfssl: ptach CVE-2026-3229<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-3230<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-3547<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-4159<br>
&gt;=C2=A0 =C2=A0wolfssl: patch CVE-2026-4395<br>
&gt;=C2=A0 =C2=A0zabbix: ignore CVE-2026-23919<br>
&gt;=C2=A0 =C2=A0tigervnc: patch CVE-2026-34352<br>
&gt;=C2=A0 =C2=A0strongswan: patch CVE-2026-25075<br>
&gt;<br>
&gt; Deepak Rathore (3):<br>
&gt;=C2=A0 =C2=A0libssh: Fix CVE-2026-0968<br>
&gt;=C2=A0 =C2=A0libssh: Fix CVE-2026-0967<br>
&gt;=C2=A0 =C2=A0libssh: Fix CVE-2026-0965<br>
&gt;<br>
&gt; Gyorgy Sarvari (32):<br>
&gt;=C2=A0 =C2=A0nginx: upgrade 1.28.2 -&gt; 1.28.3<br>
&gt;=C2=A0 =C2=A0freeipmi: upgrade 1.6.16 -&gt; 1.6.17<br>
&gt;=C2=A0 =C2=A0botan: patch CVE-2026-32877<br>
&gt;=C2=A0 =C2=A0botan: patch CVE-2026-32883<br>
&gt;=C2=A0 =C2=A0botan: patch CVE-2026-32884<br>
&gt;=C2=A0 =C2=A0dovecot: patch CVE-2025-59031<br>
&gt;=C2=A0 =C2=A0dovecot: mark CVE-2026-0394 patched<br>
&gt;=C2=A0 =C2=A0nodejs: ignore fixed CVEs<br>
&gt;=C2=A0 =C2=A0opensc: patch CVE-2025-49010<br>
&gt;=C2=A0 =C2=A0opensc: patch CVE-2025-66037<br>
&gt;=C2=A0 =C2=A0opensc: patch CVE-2025-66038<br>
&gt;=C2=A0 =C2=A0imagemagick: upgrade 7.1.2-17 -&gt; 7.1.2-18<br>
&gt;=C2=A0 =C2=A0giflib: patch CVE-2025-31344<br>
&gt;=C2=A0 =C2=A0botan: patch CVE-2026-34582<br>
&gt;=C2=A0 =C2=A0corosync: patch CVE-2026-35091<br>
&gt;=C2=A0 =C2=A0corosync: patch CVE-2026-35092<br>
&gt;=C2=A0 =C2=A0hiawatha: upgrade 11.7 -&gt; 11.8<br>
&gt;=C2=A0 =C2=A0monkey: upgrade 1.8.4 -&gt; 1.8.7<br>
&gt;=C2=A0 =C2=A0monkey: patch CVEs<br>
&gt;=C2=A0 =C2=A0openjpeg: patch CVE-2026-6192<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40333<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40334<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40335<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40336<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40338<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40339<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40340<br>
&gt;=C2=A0 =C2=A0libgphoto2: patch CVE-2026-40341<br>
&gt;=C2=A0 =C2=A0jq: patch CVE-2026-32316<br>
&gt;=C2=A0 =C2=A0jq: patch CVE-2026-33947<br>
&gt;=C2=A0 =C2=A0jq: patch CVE-2026-33948<br>
&gt;=C2=A0 =C2=A0jq: patch CVE-2026-39979<br>
&gt;<br>
&gt; Jason Schonberg (4):<br>
&gt;=C2=A0 =C2=A0Update README.md with branch name.<br>
&gt;=C2=A0 =C2=A0nodejs: upgrade 22.22.0 -&gt; 22.22.1<br>
&gt;=C2=A0 =C2=A0nodejs: upgrade 22.22.1 -&gt; 22.22.2<br>
&gt;=C2=A0 =C2=A0php: upgrade 8.4.19 -&gt; 8.4.20<br>
&gt;<br>
&gt; J=C3=B6rg Sommer (1):<br>
&gt;=C2=A0 =C2=A0lshw: Fix binmerge<br>
&gt;<br>
&gt; Liu Yiding (1):<br>
&gt;=C2=A0 =C2=A0gjs: upgrade 1.84.1 -&gt; 1.84.2<br>
&gt;<br>
&gt; Markus Volk (5):<br>
&gt;=C2=A0 =C2=A0iwd: update 3.10 -&gt; 3.11<br>
&gt;=C2=A0 =C2=A0nautilus: update 49.4 -&gt; 49.5<br>
&gt;=C2=A0 =C2=A0libdvdread: use https for fetching code<br>
&gt;=C2=A0 =C2=A0libdvdcss: use https for fetching code<br>
&gt;=C2=A0 =C2=A0libdvdnav: use https for fetching code<br>
&gt;<br>
&gt; Michal Sieron (1):<br>
&gt;=C2=A0 =C2=A0gnome-bluetooth3: Fix RRECOMMENS typo<br>
&gt;<br>
&gt; Peter Kjellerstedt (1):<br>
&gt;=C2=A0 =C2=A0jq: Use Git to fetch the code<br>
&gt;<br>
&gt; Vijay Anusuri (1):<br>
&gt;=C2=A0 =C2=A0giflib: Fix CVE-2026-23868<br>
&gt;<br>
&gt; Wang Mingyu (7):<br>
&gt;=C2=A0 =C2=A0iwd: upgrade 3.11 -&gt; 3.12<br>
&gt;=C2=A0 =C2=A0openldap: upgrade 2.6.10 -&gt; 2.6.12<br>
&gt;=C2=A0 =C2=A0openldap: upgrade 2.6.12 -&gt; 2.6.13<br>
&gt;=C2=A0 =C2=A0nautilus: upgrade 49.2 -&gt; 49.3<br>
&gt;=C2=A0 =C2=A0nautilus: upgrade 49.3 -&gt; 49.4<br>
&gt;=C2=A0 =C2=A0gvfs: upgrade 1.58.0 -&gt; 1.58.1<br>
&gt;=C2=A0 =C2=A0imagemagick: upgrade 7.1.2-18 -&gt; 7.1.2-19<br>
&gt;<br>
&gt; Zhang Peng (2):<br>
&gt;=C2=A0 =C2=A0gvfs: upgrade 1.58.1 -&gt; 1.58.2<br>
&gt;=C2=A0 =C2=A0libwnck3: upgrade 43.2 -&gt; 43.3<br>
&gt;<br>
&gt;=C2=A0 .../gjs/{<a href=3D"http://gjs_1.84.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gjs_1.84.1.bb</a> =3D&gt; <a href=3D"http://gjs_1.84.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gjs_1.84.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://gnome-bluetooth3_3.34.5.bb" rel=3D"norefer=
rer" target=3D"_blank">gnome-bluetooth3_3.34.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../gvfs/{<a href=3D"http://gvfs_1.58.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gvfs_1.58.0.bb</a> =3D&gt; <a href=3D"http://gvfs_1.58.4.b=
b" rel=3D"noreferrer" target=3D"_blank">gvfs_1.58.4.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...40d59c32d7ebeb94d242436e3144cefc174a.patch |=C2=A0 40 --<br>
&gt;=C2=A0 .../{<a href=3D"http://libwnck3_43.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libwnck3_43.2.bb</a> =3D&gt; <a href=3D"http://libwnck3_43.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libwnck3_43.3.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://nautilus_49.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">nautilus_49.2.bb</a> =3D&gt; <a href=3D"http://nautilus_49.5.=
bb" rel=3D"noreferrer" target=3D"_blank">nautilus_49.5.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../libde265/libde265/CVE-2026-33165.patch=C2=A0 =C2=A0 |=C2=A0 =
45 +++<br>
&gt;=C2=A0 .../libde265/<a href=3D"http://libde265_1.0.16.bb" rel=3D"norefe=
rrer" target=3D"_blank">libde265_1.0.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../libdvdnav/<a href=3D"http://libdvdnav_6.1.1.bb" rel=3D"noref=
errer" target=3D"_blank">libdvdnav_6.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-multimedia/vlc/<a href=3D"http://libdvdcss_1.4.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libdvdcss_1.4.3.bb</a> |=C2=A0 =C2=A0=
2 +-<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-0819.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 31 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-2646-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 39 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-2646-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 51 +++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-3229-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 104 +++++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-3229-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 42 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-3229-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 28 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-3230.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 69 ++++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-3547.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 30 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-4159.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 32 ++<br>
&gt;=C2=A0 .../wolfssl/files/CVE-2026-4395.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 31 ++<br>
&gt;=C2=A0 .../wolfssl/<a href=3D"http://wolfssl_5.8.0.bb" rel=3D"noreferre=
r" target=3D"_blank">wolfssl_5.8.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
&gt;=C2=A0 .../corosync/corosync/CVE-2026-35091.patch=C2=A0 =C2=A0 |=C2=A0 =
47 +++<br>
&gt;=C2=A0 .../corosync/corosync/CVE-2026-35092.patch=C2=A0 =C2=A0 |=C2=A0 =
57 +++<br>
&gt;=C2=A0 .../corosync/<a href=3D"http://corosync_3.1.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">corosync_3.1.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../dovecot/dovecot/CVE-2025-59031.patch=C2=A0 =C2=A0 =C2=A0 | 1=
42 +++++++<br>
&gt;=C2=A0 .../dovecot/<a href=3D"http://dovecot_2.4.1-4.bb" rel=3D"norefer=
rer" target=3D"_blank">dovecot_2.4.1-4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../strongswan/CVE-2026-25075.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 48 +++<br>
&gt;=C2=A0 .../strongswan/<a href=3D"http://strongswan_6.0.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">strongswan_6.0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../iwd/{<a href=3D"http://iwd_3.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">iwd_3.10.bb</a> =3D&gt; <a href=3D"http://iwd_3.12.bb" rel=3D"=
noreferrer" target=3D"_blank">iwd_3.12.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../zabbix/<a href=3D"http://zabbix_7.0.19.bb" rel=3D"noreferrer=
" target=3D"_blank">zabbix_7.0.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../botan/botan/CVE-2026-32877.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 158 ++++++++<br>
&gt;=C2=A0 .../botan/botan/CVE-2026-32883.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 171 +++++++++<br>
&gt;=C2=A0 .../botan/botan/CVE-2026-32884.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 171 +++++++++<br>
&gt;=C2=A0 .../botan/botan/CVE-2026-34582.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 28 ++<br>
&gt;=C2=A0 meta-oe/recipes-crypto/botan/<a href=3D"http://botan_3.10.0.bb" =
rel=3D"noreferrer" target=3D"_blank">botan_3.10.0.bb</a>=C2=A0 |=C2=A0 =C2=
=A07 +-<br>
&gt;=C2=A0 .../giflib/giflib/CVE-2025-31344.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 28 ++<br>
&gt;=C2=A0 .../giflib/giflib/CVE-2026-23868.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 ++<br>
&gt;=C2=A0 .../recipes-devtools/giflib/<a href=3D"http://giflib_5.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">giflib_5.2.2.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
&gt;=C2=A0 ...-with-disable-maintainer-mode-and-so.patch |=C2=A0 44 +++<br>
&gt;=C2=A0 .../jq/jq/CVE-2026-32316.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 +++<br>
&gt;=C2=A0 .../jq/jq/CVE-2026-33947.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 104 +++++<br>
&gt;=C2=A0 .../jq/jq/CVE-2026-33948.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 49 +++<br>
&gt;=C2=A0 .../jq/jq/CVE-2026-39979.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 ++<br>
&gt;=C2=A0 meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 19 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/lshw/<a href=3D"http://lshw_02.20.bb" r=
el=3D"noreferrer" target=3D"_blank">lshw_02.20.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://nodejs_22.22.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">nodejs_22.22.0.bb</a> =3D&gt; <a href=3D"http://nodejs_22.22=
.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.2.bb</a>}=C2=A0 |=
=C2=A0 13 +-<br>
&gt;=C2=A0 .../php/{<a href=3D"http://php_8.4.19.bb" rel=3D"noreferrer" tar=
get=3D"_blank">php_8.4.19.bb</a> =3D&gt; <a href=3D"http://php_8.4.20.bb" r=
el=3D"noreferrer" target=3D"_blank">php_8.4.20.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40333.patch=C2=A0 =C2=A0| 150 ++=
++++++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40334.patch=C2=A0 =C2=A0|=C2=A0 =
37 ++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40335.patch=C2=A0 =C2=A0|=C2=A0 =
43 +++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40336.patch=C2=A0 =C2=A0|=C2=A0 =
44 +++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40338.patch=C2=A0 =C2=A0|=C2=A0 =
34 ++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40339.patch=C2=A0 =C2=A0|=C2=A0 =
41 ++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40340.patch=C2=A0 =C2=A0|=C2=A0 =
40 ++<br>
&gt;=C2=A0 .../gphoto2/libgphoto2/CVE-2026-40341.patch=C2=A0 =C2=A0|=C2=A0 =
69 ++++<br>
&gt;=C2=A0 .../gphoto2/<a href=3D"http://libgphoto2_2.5.33.bb" rel=3D"noref=
errer" target=3D"_blank">libgphoto2_2.5.33.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
&gt;=C2=A0 .../openjpeg/openjpeg/CVE-2026-6192.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 35 ++<br>
&gt;=C2=A0 .../openjpeg/<a href=3D"http://openjpeg_2.5.4.bb" rel=3D"norefer=
rer" target=3D"_blank">openjpeg_2.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../tigervnc/files/CVE-2026-34352.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 31 ++<br>
&gt;=C2=A0 .../tigervnc/<a href=3D"http://tigervnc_1.15.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">tigervnc_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../libdvdread/<a href=3D"http://libdvdread_6.1.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">libdvdread_6.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...{<a href=3D"http://freeipmi_1.6.16.bb" rel=3D"noreferrer" tar=
get=3D"_blank">freeipmi_1.6.16.bb</a> =3D&gt; <a href=3D"http://freeipmi_1.=
6.17.bb" rel=3D"noreferrer" target=3D"_blank">freeipmi_1.6.17.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...<a href=3D"http://ck_7.1.2-17.bb" rel=3D"noreferrer" target=
=3D"_blank">ck_7.1.2-17.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-=
19.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-19.bb</a>} |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2026-0965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 286 ++++++++++++++<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2026-0967.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 362 ++++++++++++++++++<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2026-0968_p1.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 64 ++++<br>
&gt;=C2=A0 .../libssh/libssh/CVE-2026-0968_p2.patch=C2=A0 =C2=A0 =C2=A0 | 1=
32 +++++++<br>
&gt;=C2=A0 .../recipes-support/libssh/<a href=3D"http://libssh_0.11.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libssh_0.11.3.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 ...{<a href=3D"http://openldap_2.6.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">openldap_2.6.10.bb</a> =3D&gt; <a href=3D"http://openldap_2.=
6.13.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.6.13.bb</a>} |=C2=
=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../opensc/opensc/CVE-2025-49010.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 71 ++++<br>
&gt;=C2=A0 .../opensc/opensc/CVE-2025-66037.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 ++<br>
&gt;=C2=A0 .../opensc/opensc/CVE-2025-66038.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 40 ++<br>
&gt;=C2=A0 .../recipes-support/opensc/<a href=3D"http://opensc_0.26.1.bb" r=
el=3D"noreferrer" target=3D"_blank">opensc_0.26.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-aiofiles_24.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-aiofiles_24.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-alembic_1.17.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-alembic_1.17.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 ...<a href=3D"http://ask_3.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">ask_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-apiflask_3.0.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-apiflask_3.0.2.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...<a href=3D"http://roid_4.0.2.bb" rel=3D"noreferrer" target=3D=
"_blank">roid_4.0.2.bb</a> =3D&gt; <a href=3D"http://python3-astroid_4.0.4.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-astroid_4.0.4.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 ..._-nonstring-to-remove-unterminated-s.patch |=C2=A0 43 ---<br>
&gt;=C2=A0 ...ute__-nonstring-with-macro-MBEDTLS_A.patch |=C2=A0 42 --<br>
&gt;=C2=A0 ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch |=C2=A0 33 --<br>
&gt;=C2=A0 .../{<a href=3D"http://hiawatha_11.7.bb" rel=3D"noreferrer" targ=
et=3D"_blank">hiawatha_11.7.bb</a> =3D&gt; <a href=3D"http://hiawatha_11.8.=
bb" rel=3D"noreferrer" target=3D"_blank">hiawatha_11.8.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 ...tp-fix-malformed-request-crash-paths.patch | 160 ++++++++<br>
&gt;=C2=A0 ...eduler-guard-protocol-close-callback.patch |=C2=A0 51 +++<br>
&gt;=C2=A0 ...server-parser-harden-boundary-checks.patch | 108 ++++++<br>
&gt;=C2=A0 .../{<a href=3D"http://monkey_1.8.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">monkey_1.8.4.bb</a> =3D&gt; <a href=3D"http://monkey_1.8.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">monkey_1.8.7.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://nginx_1.28.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">nginx_1.28.2.bb</a> =3D&gt; <a href=3D"http://nginx_1.28.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://nginx_1.29.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">nginx_1.29.1.bb</a> =3D&gt; <a href=3D"http://nginx_1.29.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">nginx_1.29.2.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 88 files changed, 3605 insertions(+), 204 deletions(-)<br>
&gt;=C2=A0 rename meta-gnome/recipes-gnome/gjs/{<a href=3D"http://gjs_1.84.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gjs_1.84.1.bb</a> =3D&gt; <a hre=
f=3D"http://gjs_1.84.2.bb" rel=3D"noreferrer" target=3D"_blank">gjs_1.84.2.=
bb</a>} (94%)<br>
&gt;=C2=A0 rename meta-gnome/recipes-gnome/gvfs/{<a href=3D"http://gvfs_1.5=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">gvfs_1.58.0.bb</a> =3D&gt; <a =
href=3D"http://gvfs_1.58.4.bb" rel=3D"noreferrer" target=3D"_blank">gvfs_1.=
58.4.bb</a>} (97%)<br>
&gt;=C2=A0 delete mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40=
d59c32d7ebeb94d242436e3144cefc174a.patch<br>
&gt;=C2=A0 rename meta-gnome/recipes-gnome/libwnck/{<a href=3D"http://libwn=
ck3_43.2.bb" rel=3D"noreferrer" target=3D"_blank">libwnck3_43.2.bb</a> =3D&=
gt; <a href=3D"http://libwnck3_43.3.bb" rel=3D"noreferrer" target=3D"_blank=
">libwnck3_43.3.bb</a>} (78%)<br>
&gt;=C2=A0 rename meta-gnome/recipes-gnome/nautilus/{<a href=3D"http://naut=
ilus_49.2.bb" rel=3D"noreferrer" target=3D"_blank">nautilus_49.2.bb</a> =3D=
&gt; <a href=3D"http://nautilus_49.5.bb" rel=3D"noreferrer" target=3D"_blan=
k">nautilus_49.5.bb</a>} (93%)<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-multimedia/libde265/l=
ibde265/CVE-2026-33165.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-0819.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-2646-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-2646-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-3229-1.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-3229-2.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-3229-3.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-3230.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-3547.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-4159.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/wolfssl/=
files/CVE-2026-4395.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-extended/corosync/cor=
osync/CVE-2026-35091.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-extended/corosync/cor=
osync/CVE-2026-35092.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/dovecot/dovec=
ot/CVE-2025-59031.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/strongswan/st=
rongswan/CVE-2026-25075.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-connectivity/iwd/{<a href=3D"http://iwd_3=
.10.bb" rel=3D"noreferrer" target=3D"_blank">iwd_3.10.bb</a> =3D&gt; <a hre=
f=3D"http://iwd_3.12.bb" rel=3D"noreferrer" target=3D"_blank">iwd_3.12.bb</=
a>} (95%)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-3=
2877.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-3=
2883.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-3=
2884.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-3=
4582.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-20=
25-31344.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-20=
26-23868.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-b=
uilding-with-disable-maintainer-mode-and-so.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316=
.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947=
.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33948=
.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979=
.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs=
_22.22.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a> =3D=
&gt; <a href=3D"http://nodejs_22.22.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nodejs_22.22.2.bb</a>} (93%)<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.19.bb</a> =3D&gt; <a hre=
f=3D"http://php_8.4.20.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.20.=
bb</a>} (99%)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40333.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40334.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40335.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40336.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40338.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40339.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40340.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/C=
VE-2026-40341.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CV=
E-2026-6192.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2=
026-34352.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/freeipmi/{<a href=3D"http://freei=
pmi_1.6.16.bb" rel=3D"noreferrer" target=3D"_blank">freeipmi_1.6.16.bb</a> =
=3D&gt; <a href=3D"http://freeipmi_1.6.17.bb" rel=3D"noreferrer" target=3D"=
_blank">freeipmi_1.6.17.bb</a>} (93%)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://im=
agemagick_7.1.2-17.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1=
.2-17.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-19.bb" rel=3D"nore=
ferrer" target=3D"_blank">imagemagick_7.1.2-19.bb</a>} (99%)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0965.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0967.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0968_p1.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
6-0968_p2.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/openldap/{<a href=3D"http://openl=
dap_2.6.10.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.6.10.bb</a> =
=3D&gt; <a href=3D"http://openldap_2.6.13.bb" rel=3D"noreferrer" target=3D"=
_blank">openldap_2.6.13.bb</a>} (98%)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-202=
5-49010.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-202=
5-66037.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-202=
5-66038.patch<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-apiflask_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-apifl=
ask_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-apiflask_3.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-apiflask_3.0.2.bb</a>} (83%)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-astroid_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-astroi=
d_4.0.2.bb</a> =3D&gt; <a href=3D"http://python3-astroid_4.0.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-astroid_4.0.4.bb</a>} (90%)<br>
&gt;=C2=A0 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0=
001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch<br>
&gt;=C2=A0 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0=
002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch<br>
&gt;=C2=A0 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/d=
efine-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch<br>
&gt;=C2=A0 rename meta-webserver/recipes-httpd/hiawatha/{<a href=3D"http://=
hiawatha_11.7.bb" rel=3D"noreferrer" target=3D"_blank">hiawatha_11.7.bb</a>=
 =3D&gt; <a href=3D"http://hiawatha_11.8.bb" rel=3D"noreferrer" target=3D"_=
blank">hiawatha_11.8.bb</a>} (90%)<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-httpd/monkey/files/000=
1-server-http-fix-malformed-request-crash-paths.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-httpd/monkey/files/000=
2-server-scheduler-guard-protocol-close-callback.patch<br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-httpd/monkey/files/000=
3-server-parser-harden-boundary-checks.patch<br>
&gt;=C2=A0 rename meta-webserver/recipes-httpd/monkey/{<a href=3D"http://mo=
nkey_1.8.4.bb" rel=3D"noreferrer" target=3D"_blank">monkey_1.8.4.bb</a> =3D=
&gt; <a href=3D"http://monkey_1.8.7.bb" rel=3D"noreferrer" target=3D"_blank=
">monkey_1.8.7.bb</a>} (86%)<br>
&gt;=C2=A0 rename meta-webserver/recipes-httpd/nginx/{<a href=3D"http://ngi=
nx_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.2.bb</a> =3D&=
gt; <a href=3D"http://nginx_1.28.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>nginx_1.28.3.bb</a>} (66%)<br>
&gt;=C2=A0 rename meta-webserver/recipes-httpd/nginx/{<a href=3D"http://ngi=
nx_1.29.1.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.1.bb</a> =3D&=
gt; <a href=3D"http://nginx_1.29.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>nginx_1.29.2.bb</a>} (77%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.53.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#126611): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/126611" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/126611</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11899949=
5/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118999495/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mittal@oss.qua=
lcomm.com" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000003207f106513d8266--

