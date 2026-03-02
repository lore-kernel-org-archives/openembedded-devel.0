Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A1DEA4E1F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162697.1772464437408533491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gD1413el;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65f9763e8d1so8752928a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772464436; cv=none;
        d=google.com; s=arc-20240605;
        b=Df2m8oA7pO9EqFaAScPP+pDVTVGAtst6KV/erVop7MDpT7u3BczIJ2MrdsTjOyrzmA
         yQinZJKcQHjzzugUenBPmXA57C84z3OjJurZz7C3PVYeUtXxMpW/gXiG1FF24VEHBOS9
         cjLZIqmpbFkcWR/GPNXzIrBdkD+OoAxMNjA2S+c7QSnTQpntUCUffrUQnw5koqBuA6Mc
         4wRzIi6PheKC/yqMbUPMj0bVB+DBRIWXp1MWPFZ2V7T/v/JNVMzec/lh+3QoBGO/cmA1
         iwsXo93LsNw1uYkN6cE45T3ITss1rR6CtBWhv3i60e0fOG9V4VV6cb4rXLq/7tsAVsKP
         u8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75u0cg0xF2731f8sEa8aZmcPm/dsLYurFg1Gjntc6qo=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=M6KbDxBS6KMaQwGpBrHmdL2mbh01zQJIr6cWYlcso5VkYhuOX+m4+XpynG7l7ZVZBm
         e/QSCy/I1/Tmd4qd9/G4I7Cik7csXFJSGcbrir+279PckAUSH1WjzyIs+KabFkRMcNBO
         EXAm8DklXdcBzFA9DueQFsCUzaWwua4BG/ZUePIqLjYERCLC1fQLgN7F2bLj7Vu9uA5A
         xraidyFJnDmXDa3mQifgD2IaIrs6sFWc6ucNnH3uaBtque1Kk4XMcrI4p9taMIDFRZha
         WfhydZotc/B8FolkLhTUhvVyvf4my+vYUGFQ06LFqQkbGH4DsTBCfHUNkBEKlBQjZVmA
         +Hng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464436; x=1773069236; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=75u0cg0xF2731f8sEa8aZmcPm/dsLYurFg1Gjntc6qo=;
        b=gD1413elEgjD7fXvD+/CRpqJqe+1R8F6Jg3o9dunCYX/SoRXnNViz/BGxXT1M5hWN0
         T2r3c9OnDe3dX32Ccqc142gCnroJfb34RM5xlSOkMx4h1kS1MJX0pNnSMlbk7FW9IdqX
         W37cvqWN1IV6uMz9L0+0s21JIEuQ2kwoikG3om3oN36nHNQtBW6J1stK75qTKnHzoJP/
         hGCznXIw2MZQ4CBcXaDwCzIxOYQLEpcXNAyDFru2iJ/ec9Db9RiPWR8EhgYfbu7urlce
         QlSl92lkKZb6stQNBMsFbfYc90zMo6TKsVudMkKkbyQ++kTwpWFVdvF1H77eS05EwTVj
         vZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464436; x=1773069236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75u0cg0xF2731f8sEa8aZmcPm/dsLYurFg1Gjntc6qo=;
        b=UVvjOoRW/Pv/fwFxpbLWHql7+Rfvvc2Bd6Sg3WcBY9Qer6lc/cU/tKreqFZmbSQMMY
         uOyHWn1GaQ0jaC6uQDWmJR4W45Il8Vutv0euvnuDd6mEcR1Ox3ikVWbBmKatbCrz4o3X
         kkG91dCDHId+jjD26yutBX3yODBnuTvZ1QVF+iitKvC6i5ceAj5zAhiTahKi78vEkJj3
         fSaSS8Y2mMu7CvPGtNMzx+/rcR/oCbOqKvfMnnTQr+RC+LB/IQuXIqQj2U6gM7xW74ij
         QstOGvzM7d5PZio/FUdXspNKRBCEsFx2rqmWzxItds8v23Tp/oJ2KnEB9ruWXxwicZtp
         9rxw==
X-Gm-Message-State: AOJu0YxyGL9OZqLbpzRtb3adCRBsOb+yUuv1zGo3Kz9/ANjh+HuIuLdr
	8Bfur96cknL/QK5ZvUJ/QmCXKQJ2aKNiLLb28+hGHIkps91Bo27VOvyndY8DjZKGG2FvKiC8AzY
	L8xc1cfMUxrnizbbkrJvvIybWsGQ+mXs=
X-Gm-Gg: ATEYQzzOjLbRenoYSvHYF2/MoOtAURl2iMpOFNT4iqbotsMVsJlfSnZlR2ezsdtQWLw
	/Gh05fGeSx5wq1bYRLYERMLNgxIv/IfjNj+yvE1A3bgYVwqIDj8Pz7VOif1nHQ+1w1ATOFqtMHz
	7A0MFHGJoRIHrckeSFjw9rUEuUxk36H0v3DR2CWZQCS2Q/MSHaowv9lyXqGmIkb4rgezN6HfUbG
	xr4XR1jxkD5fhc5e1+/5WLmNcyYbaRV3GM2NOQqWK7P5TjF6HvjHDOgsYOKmCVf+5B6ZIrytlWq
	NFn1OiOYV4xXvQKqpzrzHkD13Qu2dWeYmNoM9Ev4iK4yJM+Q9uzCpJZfXTA57vs3aVRbpXfFmv9
	0DFqgEZsfX7VmMI6V/k64hUEj
X-Received: by 2002:a17:907:3d51:b0:b93:5fc6:161a with SMTP id
 a640c23a62f3a-b93765922d6mr809923966b.52.1772464435260; Mon, 02 Mar 2026
 07:13:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771939291.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1771939291.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 07:13:26 -0800
X-Gm-Features: AaiRm51pw-8Q8xCta9yI3kIA_XDyb-jjDY8xRzcnhGG7a76jAlwrYp-mA6wlSUY
Message-ID: <CAMKF1soYXmj=MRqEHubULpD_kPmW8BEQ7zG9mBZSRJQBBiEo2A@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/36] Whinlatter pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000a718a064c0c0933"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 15:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124812

--0000000000000a718a064c0c0933
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Anuj, this has been installed


On Tue, Feb 24, 2026 at 6:19=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in whinlatter. Tested locally with
> qemux86/qemux86-64/qemuarm/qemuarm64 and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1319
>
> The following changes since commit
> d28d0a23615f4d91d125fdcd247a71245087dab3:
>
>   Use https when accessing archive.xfce.org (2026-02-05 06:59:42 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> Ankur Tyagi (1):
>   tomoyo-tools: update SRC_URI
>
> Gyorgy Sarvari (23):
>   python3-cbor2: patch CVE-2025-68131
>   python3-flask-cors: upgrade 4.0.0 -> 4.0.2
>   python3-ldap: upgrade 3.4.4 -> 3.4.5
>   python3-lief: upgrade 0.17.1 -> 0.17.2
>   python3-m2crypto: ignore CVE-2009-0127
>   python3-m2crypto: mark CVE-2020-25657 as patched
>   python3-orjson: upgrade 3.10.17 -> 3.10.18
>   python3-py: ignore CVE-2022-42969
>   python3-pyjwt: ignore CVE-2025-45768
>   python3-twitter: mark CVE-2012-5825 patched
>   python3-uvicorn: mark CVE-2020-7694 patched
>   python3-virtualenv: patch CVE-2026-22702
>   python3-werkzeug: upgrade 3.1.4 -> 3.1.5
>   raptor2: patch CVE-2024-57822 and CVE-2024-57823
>   redis: ignore CVE-2025-46686
>   python3-python-multipart: patch CVE-2026-24486
>   wireshark: patch CVE-2026-0962
>   gnome-desktop: upgrade 44.1 -> 44.4
>   python3-django: upgrade 5.2.9 -> 5.2.11
>   python3-django: upgrade 4.2.27 -> 4.2.28
>   libx86-1: upgrade 1.1 -> 1.1.1
>   paho-mqtt-c: upgrade 1.3.14 -> 1.3.15
>   nginx: upgrade 1.28.1 -> 1.28.2
>
> Jason Schonberg (2):
>   usbids: upgrade 2025.09.15 -> 2025.12.13
>   php: upgrade 8.4.17 -> 8.4.18
>
> Liu Yiding (1):
>   minizip-ng: 4.0.8 -> 4.0.10
>
> Markus Volk (1):
>   libsdl2-compat: update 2.32.58 -> 2.32.62
>
> Tero Kinnunen (1):
>   python3-watchdog: Remove obsolete dependencies
>
> Wang Mingyu (7):
>   python3-marshmallow: upgrade 4.1.0 -> 4.1.1
>   python3-marshmallow: upgrade 4.1.1 -> 4.1.2
>   python3-tornado: upgrade 6.5.2 -> 6.5.3
>   python3-tornado: upgrade 6.5.3 -> 6.5.4
>   python3-werkzeug: upgrade 3.1.3 -> 3.1.4
>   cryptsetup: upgrade 2.8.3 -> 2.8.4
>   libtracefs: upgrade 1.8.2 -> 1.8.3
>
>  ...-desktop_44.1.bb =3D> gnome-desktop_44.4.bb} |   2 +-
>  .../wireshark/files/CVE-2026-0962.patch       | 131 +++++
>  .../wireshark/wireshark_4.2.14.bb             |   1 +
>  ...rror-due-to-bool-keyword-with-gcc-15.patch |  37 --
>  ...mqtt-c_1.3.14.bb =3D> paho-mqtt-c_1.3.15.bb} |   5 +-
>  ...0001-crypt.h-Remove-register-keyword.patch |  35 --
>  ...nizip-ng_4.0.8.bb =3D> minizip-ng_4.0.10.bb} |   3 +-
>  ...ryptsetup_2.8.3.bb =3D> cryptsetup_2.8.4.bb} |   2 +-
>  .../php/{php_8.4.17.bb =3D> php_8.4.18.bb}      |   2 +-
>  ...efine-CARD32-as-uint-as-it-is-32-bit.patch |   0
>  .../0001-assume-zero-is-valid-address.patch   |   0
>  ...-type-of-the-void-pointer-assignment.patch |  33 --
>  .../libx86-1.1/libx86-mmap-offset.patch       | 192 -------
>  .../libx86-1.1/makefile-add-ldflags.patch     |  17 -
>  .../{libx86-1_1.1.bb =3D> libx86-1_1.1.1.bb}    |   9 +-
>  .../recipes-extended/redis/redis_6.2.21.bb    |   1 +
>  .../recipes-extended/redis/redis_7.2.12.bb    |   1 +
>  ...t_2.32.58.bb =3D> libsdl2-compat_2.32.62.bb} |   2 +-
>  ...ibtracefs_1.8.2.bb =3D> libtracefs_1.8.3.bb} |   2 +-
>  .../tomoyo-tools/tomoyo-tools_2.6.1.bb        |   3 +-
>  .../raptor2/raptor2/CVE-2024-57822.patch      |  44 ++
>  .../raptor2/raptor2/CVE-2024-57823.patch      |  31 ++
>  .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
>  ...ids_2025.09.15.bb =3D> usbids_2025.12.13.bb} |   4 +-
>  .../python/python3-cbor2/CVE-2025-68131.patch | 515 ++++++++++++++++++
>  .../python/python3-cbor2_5.7.1.bb             |   1 +
>  ...ngo_4.2.27.bb =3D> python3-django_4.2.28.bb} |   2 +-
>  ...ango_5.2.9.bb =3D> python3-django_5.2.11.bb} |   2 +-
>  .../python3-flask-cors/CVE-2024-6221.patch    | 110 ----
>  ...s_4.0.0.bb =3D> python3-flask-cors_4.0.2.bb} |   8 +-
>  ...-lief_0.17.1.bb =3D> python3-lief_0.17.2.bb} |   2 +-
>  .../python/python3-m2crypto_0.46.2.bb         |   3 +
>  ..._4.1.0.bb =3D> python3-marshmallow_4.1.2.bb} |   2 +-
>  ...n_3.10.17.bb =3D> python3-orjson_3.10.18.bb} |   2 +-
>  .../python/python3-py_1.11.0.bb               |   2 +
>  .../python/python3-pyjwt_2.10.1.bb            |   2 +
>  .../CVE-2026-24486.patch                      |  61 +++
>  .../python/python3-python-multipart_0.0.20.bb |   1 +
>  ...nado_6.5.2.bb =3D> python3-tornado_6.5.4.bb} |   2 +-
>  .../python/python3-twitter_4.16.0.bb          |   2 +
>  .../python/python3-uvicorn_0.38.0.bb          |   1 +
>  .../python3-virtualenv/CVE-2026-22702.patch   |  60 ++
>  .../python/python3-virtualenv_20.35.4.bb      |   1 +
>  .../python/python3-watchdog_6.0.0.bb          |   9 +-
>  ...eug_3.1.3.bb =3D> python3-werkzeug_3.1.5.bb} |   2 +-
>  ...n3-ldap_3.4.4.bb =3D> python3-ldap_3.4.5.bb} |   8 +-
>  .../{nginx_1.28.1.bb =3D> nginx_1.28.2.bb}      |   2 +-
>  47 files changed, 892 insertions(+), 467 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.1.bb =3D=
>
> gnome-desktop_44.4.bb} (93%)
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
>  delete mode 100644
> meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error=
-due-to-bool-keyword-with-gcc-15.patch
>  rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.14.bb
> =3D> paho-mqtt-c_1.3.15.bb} (88%)
>  delete mode 100644
> meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-k=
eyword.patch
>  rename meta-oe/recipes-core/minizip-ng/{minizip-ng_4.0.8.bb =3D>
> minizip-ng_4.0.10.bb} (91%)
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.3.bb =3D>
> cryptsetup_2.8.4.bb} (98%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.17.bb =3D> php_8.4.18.bb}
> (99%)
>  rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 =3D>
> libx86-1.1.1}/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch (100%)
>  rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 =3D>
> libx86-1.1.1}/0001-assume-zero-is-valid-address.patch (100%)
>  delete mode 100644
> meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-po=
inter-assignment.patch
>  delete mode 100644
> meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
>  delete mode 100644
> meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
>  rename meta-oe/recipes-extended/libx86-1/{libx86-1_1.1.bb =3D>
> libx86-1_1.1.1.bb} (74%)
>  rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.58.bb =3D>
> libsdl2-compat_2.32.62.bb} (91%)
>  rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.2.bb =3D>
> libtracefs_1.8.3.bb} (94%)
>  create mode 100644
> meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
>  create mode 100644
> meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
>  rename meta-oe/recipes-support/usbids/{usbids_2025.09.15.bb =3D>
> usbids_2025.12.13.bb} (83%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb =3D=
>
> python3-django_4.2.28.bb} (79%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.9.bb =3D>
> python3-django_5.2.11.bb} (60%)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patc=
h
>  rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb
> =3D> python3-flask-cors_4.0.2.bb} (73%)
>  rename meta-python/recipes-devtools/python/{python3-lief_0.17.1.bb =3D>
> python3-lief_0.17.2.bb} (95%)
>  rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.0.bb
> =3D> python3-marshmallow_4.1.2.bb} (91%)
>  rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb =
=3D>
> python3-orjson_3.10.18.bb} (84%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-244=
86.patch
>  rename meta-python/recipes-devtools/python/{python3-tornado_6.5.2.bb =3D=
>
> python3-tornado_6.5.4.bb} (93%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.pat=
ch
>  rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.3.bb =
=3D>
> python3-werkzeug_3.1.5.bb} (90%)
>  rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb =3D>
> python3-ldap_3.4.5.bb} (76%)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.1.bb =3D>
> nginx_1.28.2.bb} (66%)
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124582):
> https://lists.openembedded.org/g/openembedded-devel/message/124582
> Mute This Topic: https://lists.openembedded.org/mt/117976207/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000a718a064c0c0933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Anuj, this has been installed<div><br></div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 24, 2026 at 6:19=E2=80=AFAM Anuj Mittal via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;anuj.=
mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qua=
lcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Please merge these changes in whinlatter. =
Tested locally with<br>
qemux86/qemux86-64/qemuarm/qemuarm64 and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1319" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1319</a><br>
<br>
The following changes since commit d28d0a23615f4d91d125fdcd247a71245087dab3=
:<br>
<br>
=C2=A0 Use https when accessing <a href=3D"http://archive.xfce.org" rel=3D"=
noreferrer" target=3D"_blank">archive.xfce.org</a> (2026-02-05 06:59:42 +05=
30)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 tomoyo-tools: update SRC_URI<br>
<br>
Gyorgy Sarvari (23):<br>
=C2=A0 python3-cbor2: patch CVE-2025-68131<br>
=C2=A0 python3-flask-cors: upgrade 4.0.0 -&gt; 4.0.2<br>
=C2=A0 python3-ldap: upgrade 3.4.4 -&gt; 3.4.5<br>
=C2=A0 python3-lief: upgrade 0.17.1 -&gt; 0.17.2<br>
=C2=A0 python3-m2crypto: ignore CVE-2009-0127<br>
=C2=A0 python3-m2crypto: mark CVE-2020-25657 as patched<br>
=C2=A0 python3-orjson: upgrade 3.10.17 -&gt; 3.10.18<br>
=C2=A0 python3-py: ignore CVE-2022-42969<br>
=C2=A0 python3-pyjwt: ignore CVE-2025-45768<br>
=C2=A0 python3-twitter: mark CVE-2012-5825 patched<br>
=C2=A0 python3-uvicorn: mark CVE-2020-7694 patched<br>
=C2=A0 python3-virtualenv: patch CVE-2026-22702<br>
=C2=A0 python3-werkzeug: upgrade 3.1.4 -&gt; 3.1.5<br>
=C2=A0 raptor2: patch CVE-2024-57822 and CVE-2024-57823<br>
=C2=A0 redis: ignore CVE-2025-46686<br>
=C2=A0 python3-python-multipart: patch CVE-2026-24486<br>
=C2=A0 wireshark: patch CVE-2026-0962<br>
=C2=A0 gnome-desktop: upgrade 44.1 -&gt; 44.4<br>
=C2=A0 python3-django: upgrade 5.2.9 -&gt; 5.2.11<br>
=C2=A0 python3-django: upgrade 4.2.27 -&gt; 4.2.28<br>
=C2=A0 libx86-1: upgrade 1.1 -&gt; 1.1.1<br>
=C2=A0 paho-mqtt-c: upgrade 1.3.14 -&gt; 1.3.15<br>
=C2=A0 nginx: upgrade 1.28.1 -&gt; 1.28.2<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 usbids: upgrade 2025.09.15 -&gt; 2025.12.13<br>
=C2=A0 php: upgrade 8.4.17 -&gt; 8.4.18<br>
<br>
Liu Yiding (1):<br>
=C2=A0 minizip-ng: 4.0.8 -&gt; 4.0.10<br>
<br>
Markus Volk (1):<br>
=C2=A0 libsdl2-compat: update 2.32.58 -&gt; 2.32.62<br>
<br>
Tero Kinnunen (1):<br>
=C2=A0 python3-watchdog: Remove obsolete dependencies<br>
<br>
Wang Mingyu (7):<br>
=C2=A0 python3-marshmallow: upgrade 4.1.0 -&gt; 4.1.1<br>
=C2=A0 python3-marshmallow: upgrade 4.1.1 -&gt; 4.1.2<br>
=C2=A0 python3-tornado: upgrade 6.5.2 -&gt; 6.5.3<br>
=C2=A0 python3-tornado: upgrade 6.5.3 -&gt; 6.5.4<br>
=C2=A0 python3-werkzeug: upgrade 3.1.3 -&gt; 3.1.4<br>
=C2=A0 cryptsetup: upgrade 2.8.3 -&gt; 2.8.4<br>
=C2=A0 libtracefs: upgrade 1.8.2 -&gt; 1.8.3<br>
<br>
=C2=A0...-<a href=3D"http://desktop_44.1.bb" rel=3D"noreferrer" target=3D"_=
blank">desktop_44.1.bb</a> =3D&gt; <a href=3D"http://gnome-desktop_44.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnome-desktop_44.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../wireshark/files/CVE-2026-0962.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
31 +++++<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_4.2.14.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_4.2.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...rror-due-to-bool-keyword-with-gcc-15.patch |=C2=A0 37 --<br>
=C2=A0...<a href=3D"http://mqtt-c_1.3.14.bb" rel=3D"noreferrer" target=3D"_=
blank">mqtt-c_1.3.14.bb</a> =3D&gt; <a href=3D"http://paho-mqtt-c_1.3.15.bb=
" rel=3D"noreferrer" target=3D"_blank">paho-mqtt-c_1.3.15.bb</a>} |=C2=A0 =
=C2=A05 +-<br>
=C2=A0...0001-crypt.h-Remove-register-keyword.patch |=C2=A0 35 --<br>
=C2=A0...<a href=3D"http://nizip-ng_4.0.8.bb" rel=3D"noreferrer" target=3D"=
_blank">nizip-ng_4.0.8.bb</a> =3D&gt; <a href=3D"http://minizip-ng_4.0.10.b=
b" rel=3D"noreferrer" target=3D"_blank">minizip-ng_4.0.10.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0...<a href=3D"http://ryptsetup_2.8.3.bb" rel=3D"noreferrer" target=3D=
"_blank">ryptsetup_2.8.3.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.8.4.=
bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../php/{<a href=3D"http://php_8.4.17.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.17.bb</a> =3D&gt; <a href=3D"http://php_8.4.18.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.18.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...efine-CARD32-as-uint-as-it-is-32-bit.patch |=C2=A0 =C2=A00<br>
=C2=A0.../0001-assume-zero-is-valid-address.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
=C2=A0...-type-of-the-void-pointer-assignment.patch |=C2=A0 33 --<br>
=C2=A0.../libx86-1.1/libx86-mmap-offset.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
92 -------<br>
=C2=A0.../libx86-1.1/makefile-add-ldflags.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
17 -<br>
=C2=A0.../{<a href=3D"http://libx86-1_1.1.bb" rel=3D"noreferrer" target=3D"=
_blank">libx86-1_1.1.bb</a> =3D&gt; <a href=3D"http://libx86-1_1.1.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libx86-1_1.1.1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A09 +-<br>
=C2=A0.../recipes-extended/redis/<a href=3D"http://redis_6.2.21.bb" rel=3D"=
noreferrer" target=3D"_blank">redis_6.2.21.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=3D"=
noreferrer" target=3D"_blank">redis_7.2.12.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0...<a href=3D"http://t_2.32.58.bb" rel=3D"noreferrer" target=3D"_blan=
k">t_2.32.58.bb</a> =3D&gt; <a href=3D"http://libsdl2-compat_2.32.62.bb" re=
l=3D"noreferrer" target=3D"_blank">libsdl2-compat_2.32.62.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ibtracefs_1.8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">ibtracefs_1.8.2.bb</a> =3D&gt; <a href=3D"http://libtracefs_1.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../tomoyo-tools/<a href=3D"http://tomoyo-tools_2.6.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">tomoyo-tools_2.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../raptor2/raptor2/CVE-2024-57822.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
44 ++<br>
=C2=A0.../raptor2/raptor2/CVE-2024-57823.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
31 ++<br>
=C2=A0.../recipes-support/raptor2/<a href=3D"http://raptor2_2.0.16.bb" rel=
=3D"noreferrer" target=3D"_blank">raptor2_2.0.16.bb</a> |=C2=A0 =C2=A02 +<b=
r>
=C2=A0...<a href=3D"http://ids_2025.09.15.bb" rel=3D"noreferrer" target=3D"=
_blank">ids_2025.09.15.bb</a> =3D&gt; <a href=3D"http://usbids_2025.12.13.b=
b" rel=3D"noreferrer" target=3D"_blank">usbids_2025.12.13.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../python/python3-cbor2/CVE-2025-68131.patch | 515 +++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-cbor2_5.7.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-cbor2_5.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://ngo_4.2.27.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.27.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.28.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.28.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ango_5.2.9.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ango_5.2.9.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.11.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.11.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python3-flask-cors/CVE-2024-6221.patch=C2=A0 =C2=A0 | 110 ----<br=
>
=C2=A0...<a href=3D"http://s_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>s_4.0.0.bb</a> =3D&gt; <a href=3D"http://python3-flask-cors_4.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-flask-cors_4.0.2.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0...-<a href=3D"http://lief_0.17.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">lief_0.17.1.bb</a> =3D&gt; <a href=3D"http://python3-lief_0.17.2.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-lief_0.17.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-m2crypto_0.46.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-m2crypto_0.46.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0..._<a href=3D"http://4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">=
4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-marshmallow_4.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-marshmallow_4.1.2.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://n_3.10.17.bb" rel=3D"noreferrer" target=3D"_blan=
k">n_3.10.17.bb</a> =3D&gt; <a href=3D"http://python3-orjson_3.10.18.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-orjson_3.10.18.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-py_1.11.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-py_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.10.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyjwt_2.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../CVE-2026-24486.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 +++<br>
=C2=A0.../python/<a href=3D"http://python3-python-multipart_0.0.20.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-python-multipart_0.0.20.bb</a> |=
=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://nado_6.5.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nado_6.5.2.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tornado_6.5.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-twitter_4.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twitter_4.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-uvicorn_0.38.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-uvicorn_0.38.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../python3-virtualenv/CVE-2026-22702.patch=C2=A0 =C2=A0|=C2=A0 60 ++=
<br>
=C2=A0.../python/<a href=3D"http://python3-virtualenv_20.35.4.bb" rel=3D"no=
referrer" target=3D"_blank">python3-virtualenv_20.35.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../python/<a href=3D"http://python3-watchdog_6.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-watchdog_6.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0...<a href=3D"http://eug_3.1.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">eug_3.1.3.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-werkzeug_3.1.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://n3-ldap_3.4.4.bb" rel=3D"noreferrer" target=3D"_=
blank">n3-ldap_3.4.4.bb</a> =3D&gt; <a href=3D"http://python3-ldap_3.4.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0.../{<a href=3D"http://nginx_1.28.1.bb" rel=3D"noreferrer" target=3D"=
_blank">nginx_1.28.1.bb</a> =3D&gt; <a href=3D"http://nginx_1.28.2.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.28.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A047 files changed, 892 insertions(+), 467 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-desktop/{<a href=3D"http://gnom=
e-desktop_44.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop_44.1.=
bb</a> =3D&gt; <a href=3D"http://gnome-desktop_44.4.bb" rel=3D"noreferrer" =
target=3D"_blank">gnome-desktop_44.4.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2026-0962.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt=
-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/paho-mqtt-c/{<a href=3D"http://pa=
ho-mqtt-c_1.3.14.bb" rel=3D"noreferrer" target=3D"_blank">paho-mqtt-c_1.3.1=
4.bb</a> =3D&gt; <a href=3D"http://paho-mqtt-c_1.3.15.bb" rel=3D"noreferrer=
" target=3D"_blank">paho-mqtt-c_1.3.15.bb</a>} (88%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/0001-cr=
ypt.h-Remove-register-keyword.patch<br>
=C2=A0rename meta-oe/recipes-core/minizip-ng/{<a href=3D"http://minizip-ng_=
4.0.8.bb" rel=3D"noreferrer" target=3D"_blank">minizip-ng_4.0.8.bb</a> =3D&=
gt; <a href=3D"http://minizip-ng_4.0.10.bb" rel=3D"noreferrer" target=3D"_b=
lank">minizip-ng_4.0.10.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetu=
p_2.8.3.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.3.bb</a> =
=3D&gt; <a href=3D"http://cryptsetup_2.8.4.bb" rel=3D"noreferrer" target=3D=
"_blank">cryptsetup_2.8.4.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.17.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.17.bb</a> =3D&gt; <a href=3D"=
http://php_8.4.18.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.18.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 =3D&gt; libx86-1=
.1.1}/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 =3D&gt; libx86-1=
.1.1}/0001-assume-zero-is-valid-address.patch (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-=
Fix-type-of-the-void-pointer-assignment.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/libx8=
6-mmap-offset.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/makef=
ile-add-ldflags.patch<br>
=C2=A0rename meta-oe/recipes-extended/libx86-1/{<a href=3D"http://libx86-1_=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">libx86-1_1.1.bb</a> =3D&gt; <a=
 href=3D"http://libx86-1_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">lib=
x86-1_1.1.1.bb</a>} (74%)<br>
=C2=A0rename meta-oe/recipes-graphics/libsdl3/{<a href=3D"http://libsdl2-co=
mpat_2.32.58.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2-compat_2.32.5=
8.bb</a> =3D&gt; <a href=3D"http://libsdl2-compat_2.32.62.bb" rel=3D"norefe=
rrer" target=3D"_blank">libsdl2-compat_2.32.62.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-kernel/libtracefs/{<a href=3D"http://libtracef=
s_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.2.bb</a> =
=3D&gt; <a href=3D"http://libtracefs_1.8.3.bb" rel=3D"noreferrer" target=3D=
"_blank">libtracefs_1.8.3.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-5=
7822.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-5=
7823.patch<br>
=C2=A0rename meta-oe/recipes-support/usbids/{<a href=3D"http://usbids_2025.=
09.15.bb" rel=3D"noreferrer" target=3D"_blank">usbids_2025.09.15.bb</a> =3D=
&gt; <a href=3D"http://usbids_2025.12.13.bb" rel=3D"noreferrer" target=3D"_=
blank">usbids_2025.12.13.bb</a>} (83%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/=
CVE-2025-68131.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
27.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.28.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.28.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9=
.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.11.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-django_5.2.11.bb</a>} (60%)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-flask-=
cors/CVE-2024-6221.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-flask-cors_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-co=
rs_4.0.0.bb</a> =3D&gt; <a href=3D"http://python3-flask-cors_4.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-flask-cors_4.0.2.bb</a>} (73%)<br=
>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-lief_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-lief_0.17.1.b=
b</a> =3D&gt; <a href=3D"http://python3-lief_0.17.2.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-lief_0.17.2.bb</a>} (95%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-marshmallow_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshma=
llow_4.1.0.bb</a> =3D&gt; <a href=3D"http://python3-marshmallow_4.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-marshmallow_4.1.2.bb</a>} (91%)=
<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-orjson_3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-orjson_3.1=
0.17.bb</a> =3D&gt; <a href=3D"http://python3-orjson_3.10.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-orjson_3.10.18.bb</a>} (84%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-python=
-multipart/CVE-2026-24486.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tornado_6.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.5=
.2.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tornado_6.5.4.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-22702.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-werkzeug_3.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_3=
.1.3.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-werkzeug_3.1.5.bb</a>} (90%)<br>
=C2=A0rename meta-python/recipes-networking/python/{<a href=3D"http://pytho=
n3-ldap_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.4.b=
b</a> =3D&gt; <a href=3D"http://python3-ldap_3.4.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-ldap_3.4.5.bb</a>} (76%)<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{<a href=3D"http://nginx_1.=
28.1.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.1.bb</a> =3D&gt; <=
a href=3D"http://nginx_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">ngin=
x_1.28.2.bb</a>} (66%)<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124582): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124582" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124582</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117976207/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117976207/1997914</a><br>
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

--0000000000000a718a064c0c0933--

