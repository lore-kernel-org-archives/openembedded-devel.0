Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030ADC5B567
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 19:07:11 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37255.1786388823200950209
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 12:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ihXSsM31;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81dfdbd86d1so20501007b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786388822; cv=none;
        d=google.com; s=arc-20260327;
        b=GgKU/5foT/lI6KufTQ7C14whXD2GNrk9GwqfZtj851FRgyOC35NBGwMAOK1mc+nkm6
         njqOxbmP8NWE5Ne+SCPaGZXtEsaRBQULtZMoWDZC8sH184yOC6Lod7RzJlU8KrZqyGp7
         ugBMpE1SpT1G6QI6eAde1DzQgqncTsTrDYJ06TkuXGefEeEOcpXE4VgsyR7m3rsEK9W1
         JZiIEliRbZ6gjwVrx/kEBcZBzNkGdJFkD6Sjr4WUkaaoKwSLwtsBg84pjRJQ8DKOe6yC
         dpgX6Ckt9QGgAuD1YhR5JuRjSBNOpCbR/JiLk6EBLtVS59jryeT98OhFUs6zyt7HZ4Nb
         /F7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lC0hHsqZBY7lIdtyqVV7iFm5ot1FMbdAtfBsyRDhHyA=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=pFKUjDqE+5yPjvuJU06ZRpCkOIrhEwkfNZwb20yIu4SyVMFsMb6MyFNPcNNKOBeObJ
         rPrMGoM4LA4YmSHYxY4GZ0Uivl1a26InCXJKKRJwjheWLIIMgTYTzazvh7VyV4EjqSsi
         Ub4v0PMciAlrJtN+KGoWahab/ulOe5Pc/FSVp0QkYgXi2SYJK1sVTVh0ntRbZjn+gPJM
         BAUxRpCtHhapRgYSoRP2UcHa8rLp4VgyX8lY+gYqb7JpkCkvSxsLWWHuh6YNLQL77xh7
         kI5qkZ1yRM6ROhW/fdFzRjIETARhx78krW1pnIwsjEdo4Xbq+pg5p1N5neaepw4nIHoZ
         dQjA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786388822; x=1786993622; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC0hHsqZBY7lIdtyqVV7iFm5ot1FMbdAtfBsyRDhHyA=;
        b=ihXSsM312ieLQp2KL9nriZETwYMnj2Y2PnHwJC/WS7qhwgUch4LvTa6nR3qEEbRuu8
         6i8cOgjJAViLk+nq5c7IE/w3hDCVzEaQ40nn5xlZcN7zKOB9eo+70/MqwqoDAEjmB1PC
         M61gelML6AVfseg/pdP+7uPh5L8WTLC+zivCFbBeNXTJtkBdOWnfPPocau0Zz1q8GXdG
         CPauYJR1rJ6vmNKT/792C2/IHPN0TJbtxq1Z1gIJs8Rj8EivUAu6cf0pLZHn+Fh58Moj
         gSyICSyB23jo/GvbICPvgVpo97NPalsQxvEdeI9uhhcFBoHzM0dn+H2IkJaPx2DgpR8g
         31vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786388822; x=1786993622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lC0hHsqZBY7lIdtyqVV7iFm5ot1FMbdAtfBsyRDhHyA=;
        b=EZgR+DCAjgrU0yskI2TcSHsK6Aymyn6vhUvXLIUyfWxYqNcWKfj5hqlWSuDn2HpQwI
         FrwMetZZJ+mUW184VqNj6i4ijWwDA3iLFvLf2kicQEqxrSpD7kVxus8kIDOsBLZrtDZL
         InEyAL/eNYN3dnu1NckQhbq4Gy+ol74yCxmj2vy0AUag3zZ9xKz8TZ1hBafv9R5RChGT
         fAg5Cv23ahSFUGcacToBYLtwmReBl43I4+mxQ6Xt1oQmV4haOlVpCVTmpqFfQu7r81Yu
         WyisbVG96x3/6LT4/AM1n8z42URS3hjjMxXmin5Cy8qGo+FhjWmViMiQf8kFNi0pBAuT
         G5ow==
X-Gm-Message-State: AOJu0YykhWzIKhKAeR36cTbtGjyxZeU23mCNPlNWK1gcIaln9mKejUUM
	8tG4N1iixGrdpsz86B6P9KOp76jfQNnirkC/LB0j5w+b0wOObNI7FkSGoC05OpLKdPAmj/5xtGo
	T6MtzFoVuoaTqqRoBqJSCkwsZM8FTYrjnpVMn
X-Gm-Gg: AR+sD13ZC/nKP8Uc9roBEyaycZjbRDcUbiZ82K4BgMGYjSQ6+BYUr6dHYorLKvMu9Tm
	DcfaBmoAWVtuH0Kl7bkL+LnKed64RZP8rp/fAKcto8QzQGrxOXP/JP7K47vJTasfh4LMWv2iAFl
	0PKHRoQQYFVSSCWT3ZJRpWD+VyTRjQfH5mQ1DyCc8jGtR6GpRWw4EOBI1pGDKgzlhz4YMfS62+1
	DuUWDdw4FU7tYgxXavuXkEVkZjo5RFm01PmY7J3Me9IhaD1MBQm9fJX2t9ajHK3ogniyPSDUfVs
	FYvYkjopkWMmdig70jWv89n3m1dtoOoK3NP0aCAHpU5XMOr9WQPF5bK/6Knqmmeq1zniUsoS3fQ
	0mOE7aqO5eMHQv9eM2YiTyfB8BtPXlXwxlmbTplYhCtiGN9/xOpSb6uPYVxDhDOOPA5jqby2U1W
	bPKesh+dcUwaEOv3JZJpowudJxM/cpkw0a1yMS7t/Uj50l+DZgDQLIL4+qJY3UISpJDBe1IY+5
X-Received: by 2002:a05:690c:e3c7:b0:80c:cad:c4e5 with SMTP id
 00721157ae682-82446328202mr137109617b3.30.1786388821861; Mon, 10 Aug 2026
 12:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786352020.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1786352020.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Aug 2026 12:06:34 -0700
X-Gm-Features: AUfX_my5iaey2CGKQMrzZEhwb7HkPPP7YwyNMQmMxO89eqHrqKQXNLEz-V6xKlQ
Message-ID: <CAMKF1sp02bD+LN1_00E7d5ayDYg2UhgLnB+vA4Wida2OcdUowg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/48] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000286aeb0658b60f8c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 19:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128906

--000000000000286aeb0658b60f8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good, Applied now thanks Anuj

On Mon, Aug 10, 2026 at 3:20=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1711
>
> The following changes since commit
> af8b6d6b2f0b11595b0a0d5b82efa3129d52a628:
>
>   sysdig: Use LuaJIT headers to match the linked LuaJIT library
> (2026-07-24 06:15:59 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to c466d490dd85e1bdfa7bc2dd4aca1b279afdf83a:
>
>   sdbus-c++-libsystemd: add .git to github repository url (2026-08-10
> 07:33:03 +0530)
>
> ----------------------------------------------------------------
>
> Adarsh Jagadish Kamini (4):
>   thrift: fix CVE-2026-55971
>   thrift: fix CVE-2026-58023
>   thrift: fix CVE-2026-48144
>   thrift: fix CVE-2026-58389
>
> Ankur Tyagi (14):
>   valkey: upgrade 9.0.4 -> 9.0.5
>   bluealsa: upgrade 4.3.0 -> 4.3.1
>   strongswan: patch CVE-2026-47895
>   netplan: upgrade 1.2.1 -> 1.2.2
>   transmission: upgrade 4.1.1 -> 4.1.3
>   liboauth2: upgarde 2.2.0 -> 2.3.0
>   cryptsetup: upgrade 2.8.6 -> 2.8.7
>   xrdp: upgrade 0.10.6 -> 0.10.6.1
>   swagger-ui: upgrade 5.32.8 -> 5.32.11
>   cjose: upgrade 0.6.2.4 -> 0.6.2.7
>   usbredir: upgrade 0.14.0 -> 0.15.0
>   tcpreplay: upgrade 4.5.2 -> 4.5.5
>   python3-faker: upgrade 40.13.0 -> 40.14.1
>   python3-sh: upgrade 2.2.2 -> 2.2.4
>
> Devansh Patel (2):
>   hdf5: Fix CVE-2026-26199
>   hdf5: Fix CVE-2026-26197
>
> Hetvi Thakar (5):
>   libdbi-perl: Fix CVE-2026-9698
>   libdbi-perl: Fix CVE-2026-10879
>   libdbi-perl: Fix CVE-2026-14380
>   libdbi-perl: Fix CVE-2026-14739
>   libdbi-perl: Fix CVE-2026-14740
>
> Jason Schonberg (2):
>   nodejs: upgrade 22.23.1 -> 22.23.2
>   php: upgrade 8.5.8 -> 8.5.9
>
> Khem Raj (10):
>   libopus: upgrade 1.6 -> 1.6.1
>   mpv: propagate ffmpeg's commercial LICENSE_FLAGS
>   python3-mpv: propagate ffmpeg's commercial LICENSE_FLAGS
>   fluidsynth: upgrade 2.5.3 -> 2.5.7
>   libde265: upgrade 1.0.18 -> 1.0.19
>   libsrtp: upgrade 2.7.0 -> 2.8.0
>   gssdp: upgrade 1.6.4 -> 1.6.6
>   srt: upgrade 1.5.4 -> 1.5.6
>   gupnp: upgrade 1.6.9 -> 1.6.10
>   gupnp-tools: upgrade 0.12.2 -> 0.12.4
>
> Leon Anavi (1):
>   python3-rarfile: Upgrade 4.2 -> 4.3
>
> Markus Volk (2):
>   colord: set proper home-dir
>   fluidsynth: fix branch after recipe update
>
> Omkar Patil (1):
>   openvpn: fix CVE-2026-40215
>
> Peter Marko (1):
>   sdbus-c++-libsystemd: add .git to github repository url
>
> Tugrul Kukul (1):
>   jq: fix infinite loop in CVE-2026-47770 backport
>
> Wang Mingyu (5):
>   dovecot: upgrade 2.4.3 -> 2.4.4
>   smarty: upgrade 5.8.0 -> 5.8.3
>   smarty: upgrade 5.8.3 -> 5.8.4
>   libosip2: upgrade 5.3.1 -> 5.3.2
>   python3-rarfile: upgrade 4.3 -> 4.4
>
>  .../gupnp/{gssdp_1.6.4.bb =3D> gssdp_1.6.6.bb}  |   2 +-
>  ...-tools_0.12.2.bb =3D> gupnp-tools_0.12.4.bb} |   2 +-
>  .../gupnp/{gupnp_1.6.9.bb =3D> gupnp_1.6.10.bb} |   2 +-
>  ...asename-implementation-from-glib-2.0.patch |  88 ---
>  .../{bluealsa_4.3.0.bb =3D> bluealsa_4.3.1.bb}  |   5 +-
>  ...luidsynth_2.5.3.bb =3D> fluidsynth_2.5.7.bb} |   4 +-
>  ...{libde265_1.0.18.bb =3D> libde265_1.0.19.bb} |   3 +-
>  .../{libsrtp_2.7.0.bb =3D> libsrtp_2.8.0.bb}    |   2 +-
>  .../srt/0002-allow-build-with-cmake-4.patch   |  43 --
>  .../srt/{srt_1.5.4.bb =3D> srt_1.5.6.bb}        |   3 +-
>  .../{dovecot_2.4.3.bb =3D> dovecot_2.4.4.bb}    |   2 +-
>  .../{libosip2_5.3.1.bb =3D> libosip2_5.3.2.bb}  |   2 +-
>  .../openvpn/openvpn/CVE-2026-40215.patch      |  59 ++
>  .../recipes-support/openvpn/openvpn_2.7.0.bb  |   1 +
>  ...{usbredir_0.14.0.bb =3D> usbredir_0.15.0.bb} |   4 +-
>  .../strongswan/CVE-2026-47895.patch           |  92 +++
>  .../strongswan/strongswan_6.0.6.bb            |   4 +-
>  ...{tcpreplay_4.5.2.bb =3D> tcpreplay_4.5.5.bb} |   2 +-
>  .../{netplan_1.2.1.bb =3D> netplan_1.2.2.bb}    |   2 +-
>  .../thrift/thrift/CVE-2026-48144.patch        |  36 +
>  .../thrift/thrift/CVE-2026-55971.patch        |  92 +++
>  .../thrift/thrift/CVE-2026-58023.patch        | 231 ++++++
>  .../thrift/thrift/CVE-2026-58389.patch        |  93 +++
>  .../thrift/thrift_0.22.0.bb                   |   4 +
>  ...mission_4.1.1.bb =3D> transmission_4.1.3.bb} |   4 +-
>  .../sdbus-c++/sdbus-c++-libsystemd_259.5.bb   |   2 +-
>  ...ryptsetup_2.8.6.bb =3D> cryptsetup_2.8.7.bb} |   2 +-
>  .../jq/jq/CVE-2026-47770.patch                |   6 +-
>  .../{nodejs_22.23.1.bb =3D> nodejs_22.23.2.bb}  |   2 +-
>  .../perl/libdbi-perl/CVE-2026-10879.patch     |  41 ++
>  .../perl/libdbi-perl/CVE-2026-14380.patch     |  37 +
>  .../perl/libdbi-perl/CVE-2026-14739.patch     | 124 ++++
>  .../perl/libdbi-perl/CVE-2026-14740.patch     |  39 +
>  .../perl/libdbi-perl/CVE-2026-9698.patch      |  51 ++
>  .../perl/libdbi-perl_1.647.bb                 |   9 +-
>  .../php/{php_8.5.8.bb =3D> php_8.5.9.bb}        |   2 +-
>  .../{valkey_9.0.4.bb =3D> valkey_9.0.5.bb}      |   2 +-
>  .../{libopus_1.6.bb =3D> libopus_1.6.1.bb}      |   2 +-
>  .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |   7 +-
>  .../{cjose_0.6.2.4.bb =3D> cjose_0.6.2.7.bb}    |   2 +-
>  meta-oe/recipes-support/colord/colord.bb      |   7 +-
>  .../hdf5/files/CVE-2026-26197.patch           |  70 ++
>  .../hdf5/files/CVE-2026-26199.patch           | 678 ++++++++++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   2 +
>  ...rage-linker-flag-behind-CODE_COVERAG.patch |  33 -
>  ..._easy_setopt-takes-a-long-not-an-int.patch |  33 -
>  .../0002-Fix-use-of-strchr-with-new-GCC.patch |  33 -
>  ...{liboauth2_2.2.0.bb =3D> liboauth2_2.3.0.bb} |   8 +-
>  .../{smarty_5.8.0.bb =3D> smarty_5.8.4.bb}      |   2 +-
>  .../xrdp/{xrdp_0.10.6.bb =3D> xrdp_0.10.6.1.bb} |   2 +-
>  ...er_40.13.0.bb =3D> python3-faker_40.14.1.bb} |   2 +-
>  .../python/python3-mpv_1.0.8.bb               |   6 +-
>  ...-rarfile_4.2.bb =3D> python3-rarfile_4.4.bb} |   2 +-
>  ...ython3-sh_2.2.2.bb =3D> python3-sh_2.2.4.bb} |   2 +-
>  ...ger-ui_5.32.8.bb =3D> swagger-ui_5.32.11.bb} |   2 +-
>  55 files changed, 1715 insertions(+), 277 deletions(-)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.4.bb =3D>
> gssdp_1.6.6.bb} (92%)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.2.bb
> =3D> gupnp-tools_0.12.4.bb} (84%)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.9.bb =3D>
> gupnp_1.6.10.bb} (93%)
>  delete mode 100644
> meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-im=
plementation-from-glib-2.0.patch
>  rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_4.3.0.bb =
=3D>
> bluealsa_4.3.1.bb} (96%)
>  rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.5.3.b=
b
> =3D> fluidsynth_2.5.7.bb} (92%)
>  rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.18.bb
> =3D> libde265_1.0.19.bb} (93%)
>  rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.7.0.bb =3D>
> libsrtp_2.8.0.bb} (94%)
>  delete mode 100644
> meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.pat=
ch
>  rename meta-multimedia/recipes-support/srt/{srt_1.5.4.bb =3D> srt_1.5.6.=
bb}
> (90%)
>  rename meta-networking/recipes-support/dovecot/{dovecot_2.4.3.bb =3D>
> dovecot_2.4.4.bb} (97%)
>  rename meta-networking/recipes-support/libosip2/{libosip2_5.3.1.bb =3D>
> libosip2_5.3.2.bb} (88%)
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
>  rename meta-networking/recipes-support/spice/{usbredir_0.14.0.bb =3D>
> usbredir_0.15.0.bb} (82%)
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patc=
h
>  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.2.bb =3D=
>
> tcpreplay_4.5.5.bb} (89%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{
> netplan_1.2.1.bb =3D> netplan_1.2.2.bb} (97%)
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
>  rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.1.bb
> =3D> transmission_4.1.3.bb} (97%)
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.6.bb =3D>
> cryptsetup_2.8.7.bb} (98%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.1.bb =3D>
> nodejs_22.23.2.bb} (99%)
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.8.bb =3D> php_8.5.9.bb} (99=
%)
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb =3D>
> valkey_9.0.5.bb} (98%)
>  rename meta-oe/recipes-multimedia/libopus/{libopus_1.6.bb =3D>
> libopus_1.6.1.bb} (96%)
>  rename meta-oe/recipes-support/cjose/{cjose_0.6.2.4.bb =3D>
> cjose_0.6.2.7.bb} (88%)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.pat=
ch
>  delete mode 100644
> meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-lin=
ker-flag-behind-CODE_COVERAG.patch
>  delete mode 100644
> meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_seto=
pt-takes-a-long-not-an-int.patch
>  delete mode 100644
> meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-n=
ew-GCC.patch
>  rename meta-oe/recipes-support/liboauth2/{liboauth2_2.2.0.bb =3D>
> liboauth2_2.3.0.bb} (71%)
>  rename meta-oe/recipes-support/smarty/{smarty_5.8.0.bb =3D> smarty_5.8.4=
.bb}
> (95%)
>  rename meta-oe/recipes-support/xrdp/{xrdp_0.10.6.bb =3D> xrdp_0.10.6.1.b=
b}
> (98%)
>  rename meta-python/recipes-devtools/python/{python3-faker_40.13.0.bb =3D=
>
> python3-faker_40.14.1.bb} (93%)
>  rename meta-python/recipes-devtools/python/{python3-rarfile_4.2.bb =3D>
> python3-rarfile_4.4.bb} (82%)
>  rename meta-python/recipes-devtools/python/{python3-sh_2.2.2.bb =3D>
> python3-sh_2.2.4.bb} (84%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.8.bb
> =3D> swagger-ui_5.32.11.bb} (94%)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128877):
> https://lists.openembedded.org/g/openembedded-devel/message/128877
> Mute This Topic: https://lists.openembedded.org/mt/120682416/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000286aeb0658b60f8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This looks good, Applied now thanks Anuj</div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Aug 10, 2026 at 3:20=E2=80=AFAM Anuj Mittal via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a =
href=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Please merge these changes in wrynose. Tested locally a=
nd on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1711" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1711</a><br>
<br>
The following changes since commit af8b6d6b2f0b11595b0a0d5b82efa3129d52a628=
:<br>
<br>
=C2=A0 sysdig: Use LuaJIT headers to match the linked LuaJIT library (2026-=
07-24 06:15:59 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to c466d490dd85e1bdfa7bc2dd4aca1b279afdf83a:<br=
>
<br>
=C2=A0 sdbus-c++-libsystemd: add .git to github repository url (2026-08-10 =
07:33:03 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Adarsh Jagadish Kamini (4):<br>
=C2=A0 thrift: fix CVE-2026-55971<br>
=C2=A0 thrift: fix CVE-2026-58023<br>
=C2=A0 thrift: fix CVE-2026-48144<br>
=C2=A0 thrift: fix CVE-2026-58389<br>
<br>
Ankur Tyagi (14):<br>
=C2=A0 valkey: upgrade 9.0.4 -&gt; 9.0.5<br>
=C2=A0 bluealsa: upgrade 4.3.0 -&gt; 4.3.1<br>
=C2=A0 strongswan: patch CVE-2026-47895<br>
=C2=A0 netplan: upgrade 1.2.1 -&gt; 1.2.2<br>
=C2=A0 transmission: upgrade 4.1.1 -&gt; 4.1.3<br>
=C2=A0 liboauth2: upgarde 2.2.0 -&gt; 2.3.0<br>
=C2=A0 cryptsetup: upgrade 2.8.6 -&gt; 2.8.7<br>
=C2=A0 xrdp: upgrade 0.10.6 -&gt; 0.10.6.1<br>
=C2=A0 swagger-ui: upgrade 5.32.8 -&gt; 5.32.11<br>
=C2=A0 cjose: upgrade 0.6.2.4 -&gt; 0.6.2.7<br>
=C2=A0 usbredir: upgrade 0.14.0 -&gt; 0.15.0<br>
=C2=A0 tcpreplay: upgrade 4.5.2 -&gt; 4.5.5<br>
=C2=A0 python3-faker: upgrade 40.13.0 -&gt; 40.14.1<br>
=C2=A0 python3-sh: upgrade 2.2.2 -&gt; 2.2.4<br>
<br>
Devansh Patel (2):<br>
=C2=A0 hdf5: Fix CVE-2026-26199<br>
=C2=A0 hdf5: Fix CVE-2026-26197<br>
<br>
Hetvi Thakar (5):<br>
=C2=A0 libdbi-perl: Fix CVE-2026-9698<br>
=C2=A0 libdbi-perl: Fix CVE-2026-10879<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14380<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14739<br>
=C2=A0 libdbi-perl: Fix CVE-2026-14740<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 nodejs: upgrade 22.23.1 -&gt; 22.23.2<br>
=C2=A0 php: upgrade 8.5.8 -&gt; 8.5.9<br>
<br>
Khem Raj (10):<br>
=C2=A0 libopus: upgrade 1.6 -&gt; 1.6.1<br>
=C2=A0 mpv: propagate ffmpeg&#39;s commercial LICENSE_FLAGS<br>
=C2=A0 python3-mpv: propagate ffmpeg&#39;s commercial LICENSE_FLAGS<br>
=C2=A0 fluidsynth: upgrade 2.5.3 -&gt; 2.5.7<br>
=C2=A0 libde265: upgrade 1.0.18 -&gt; 1.0.19<br>
=C2=A0 libsrtp: upgrade 2.7.0 -&gt; 2.8.0<br>
=C2=A0 gssdp: upgrade 1.6.4 -&gt; 1.6.6<br>
=C2=A0 srt: upgrade 1.5.4 -&gt; 1.5.6<br>
=C2=A0 gupnp: upgrade 1.6.9 -&gt; 1.6.10<br>
=C2=A0 gupnp-tools: upgrade 0.12.2 -&gt; 0.12.4<br>
<br>
Leon Anavi (1):<br>
=C2=A0 python3-rarfile: Upgrade 4.2 -&gt; 4.3<br>
<br>
Markus Volk (2):<br>
=C2=A0 colord: set proper home-dir<br>
=C2=A0 fluidsynth: fix branch after recipe update<br>
<br>
Omkar Patil (1):<br>
=C2=A0 openvpn: fix CVE-2026-40215<br>
<br>
Peter Marko (1):<br>
=C2=A0 sdbus-c++-libsystemd: add .git to github repository url<br>
<br>
Tugrul Kukul (1):<br>
=C2=A0 jq: fix infinite loop in CVE-2026-47770 backport<br>
<br>
Wang Mingyu (5):<br>
=C2=A0 dovecot: upgrade 2.4.3 -&gt; 2.4.4<br>
=C2=A0 smarty: upgrade 5.8.0 -&gt; 5.8.3<br>
=C2=A0 smarty: upgrade 5.8.3 -&gt; 5.8.4<br>
=C2=A0 libosip2: upgrade 5.3.1 -&gt; 5.3.2<br>
=C2=A0 python3-rarfile: upgrade 4.3 -&gt; 4.4<br>
<br>
=C2=A0.../gupnp/{<a href=3D"http://gssdp_1.6.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gssdp_1.6.4.bb</a> =3D&gt; <a href=3D"http://gssdp_1.6.6.bb" r=
el=3D"noreferrer" target=3D"_blank">gssdp_1.6.6.bb</a>}=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0...-<a href=3D"http://tools_0.12.2.bb" rel=3D"noreferrer" target=3D"_=
blank">tools_0.12.2.bb</a> =3D&gt; <a href=3D"http://gupnp-tools_0.12.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">gupnp-tools_0.12.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../gupnp/{<a href=3D"http://gupnp_1.6.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gupnp_1.6.9.bb</a> =3D&gt; <a href=3D"http://gupnp_1.6.10.bb" =
rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.10.bb</a>} |=C2=A0 =C2=A02 +=
-<br>
=C2=A0...asename-implementation-from-glib-2.0.patch |=C2=A0 88 ---<br>
=C2=A0.../{<a href=3D"http://bluealsa_4.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">bluealsa_4.3.0.bb</a> =3D&gt; <a href=3D"http://bluealsa_4.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_4.3.1.bb</a>}=C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A0...<a href=3D"http://luidsynth_2.5.3.bb" rel=3D"noreferrer" target=3D=
"_blank">luidsynth_2.5.3.bb</a> =3D&gt; <a href=3D"http://fluidsynth_2.5.7.=
bb" rel=3D"noreferrer" target=3D"_blank">fluidsynth_2.5.7.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...{<a href=3D"http://libde265_1.0.18.bb" rel=3D"noreferrer" target=
=3D"_blank">libde265_1.0.18.bb</a> =3D&gt; <a href=3D"http://libde265_1.0.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://libsrtp_2.7.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libsrtp_2.7.0.bb</a> =3D&gt; <a href=3D"http://libsrtp_2.8.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libsrtp_2.8.0.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../srt/0002-allow-build-with-cmake-4.patch=C2=A0 =C2=A0|=C2=A0 43 --=
<br>
=C2=A0.../srt/{<a href=3D"http://srt_1.5.4.bb" rel=3D"noreferrer" target=3D=
"_blank">srt_1.5.4.bb</a> =3D&gt; <a href=3D"http://srt_1.5.6.bb" rel=3D"no=
referrer" target=3D"_blank">srt_1.5.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://dovecot_2.4.3.bb" rel=3D"noreferrer" target=3D=
"_blank">dovecot_2.4.3.bb</a> =3D&gt; <a href=3D"http://dovecot_2.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">dovecot_2.4.4.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libosip2_5.3.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libosip2_5.3.1.bb</a> =3D&gt; <a href=3D"http://libosip2_5.3.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libosip2_5.3.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../openvpn/openvpn/CVE-2026-40215.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
59 ++<br>
=C2=A0.../recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a>=C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0...{<a href=3D"http://usbredir_0.14.0.bb" rel=3D"noreferrer" target=
=3D"_blank">usbredir_0.14.0.bb</a> =3D&gt; <a href=3D"http://usbredir_0.15.=
0.bb" rel=3D"noreferrer" target=3D"_blank">usbredir_0.15.0.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../strongswan/CVE-2026-47895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 92 +++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_6.0.6.bb" rel=3D"noreferr=
er" target=3D"_blank">strongswan_6.0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...{<a href=3D"http://tcpreplay_4.5.2.bb" rel=3D"noreferrer" target=
=3D"_blank">tcpreplay_4.5.2.bb</a> =3D&gt; <a href=3D"http://tcpreplay_4.5.=
5.bb" rel=3D"noreferrer" target=3D"_blank">tcpreplay_4.5.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://netplan_1.2.1.bb" rel=3D"noreferrer" target=3D=
"_blank">netplan_1.2.1.bb</a> =3D&gt; <a href=3D"http://netplan_1.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">netplan_1.2.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../thrift/thrift/CVE-2026-48144.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 36 +<br>
=C2=A0.../thrift/thrift/CVE-2026-55971.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 92 +++<br>
=C2=A0.../thrift/thrift/CVE-2026-58023.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
31 ++++++<br>
=C2=A0.../thrift/thrift/CVE-2026-58389.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 93 +++<br>
=C2=A0.../thrift/<a href=3D"http://thrift_0.22.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">thrift_0.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0...<a href=3D"http://mission_4.1.1.bb" rel=3D"noreferrer" target=3D"_=
blank">mission_4.1.1.bb</a> =3D&gt; <a href=3D"http://transmission_4.1.3.bb=
" rel=3D"noreferrer" target=3D"_blank">transmission_4.1.3.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../sdbus-c++/sdbus-c++-<a href=3D"http://libsystemd_259.5.bb" rel=3D=
"noreferrer" target=3D"_blank">libsystemd_259.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ryptsetup_2.8.6.bb" rel=3D"noreferrer" target=3D=
"_blank">ryptsetup_2.8.6.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.8.7.=
bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.7.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../jq/jq/CVE-2026-47770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../{<a href=3D"http://nodejs_22.23.1.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_22.23.1.bb</a> =3D&gt; <a href=3D"http://nodejs_22.23.2.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-10879.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
41 ++<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14380.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
37 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14739.patch=C2=A0 =C2=A0 =C2=A0| 124 ++=
++<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-14740.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
39 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-9698.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
51 ++<br>
=C2=A0.../perl/<a href=3D"http://libdbi-perl_1.647.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libdbi-perl_1.647.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.8.bb" rel=3D"noreferrer" target=3D=
"_blank">php_8.5.8.bb</a> =3D&gt; <a href=3D"http://php_8.5.9.bb" rel=3D"no=
referrer" target=3D"_blank">php_8.5.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://valkey_9.0.4.bb" rel=3D"noreferrer" target=3D"=
_blank">valkey_9.0.4.bb</a> =3D&gt; <a href=3D"http://valkey_9.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">valkey_9.0.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libopus_1.6.bb" rel=3D"noreferrer" target=3D"_=
blank">libopus_1.6.bb</a> =3D&gt; <a href=3D"http://libopus_1.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libopus_1.6.1.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a>=C2=A0 |=C2=A0 =C2=A07 +=
-<br>
=C2=A0.../{<a href=3D"http://cjose_0.6.2.4.bb" rel=3D"noreferrer" target=3D=
"_blank">cjose_0.6.2.4.bb</a> =3D&gt; <a href=3D"http://cjose_0.6.2.7.bb" r=
el=3D"noreferrer" target=3D"_blank">cjose_0.6.2.7.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-support/colord/<a href=3D"http://colord.bb" rel=3D"no=
referrer" target=3D"_blank">colord.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0.../hdf5/files/CVE-2026-26197.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 70 ++<br>
=C2=A0.../hdf5/files/CVE-2026-26199.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 678 ++++++++++++++++++<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +<br>
=C2=A0...rage-linker-flag-behind-CODE_COVERAG.patch |=C2=A0 33 -<br>
=C2=A0..._easy_setopt-takes-a-long-not-an-int.patch |=C2=A0 33 -<br>
=C2=A0.../0002-Fix-use-of-strchr-with-new-GCC.patch |=C2=A0 33 -<br>
=C2=A0...{<a href=3D"http://liboauth2_2.2.0.bb" rel=3D"noreferrer" target=
=3D"_blank">liboauth2_2.2.0.bb</a> =3D&gt; <a href=3D"http://liboauth2_2.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.3.0.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0.../{<a href=3D"http://smarty_5.8.0.bb" rel=3D"noreferrer" target=3D"=
_blank">smarty_5.8.0.bb</a> =3D&gt; <a href=3D"http://smarty_5.8.4.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.8.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../xrdp/{<a href=3D"http://xrdp_0.10.6.bb" rel=3D"noreferrer" target=
=3D"_blank">xrdp_0.10.6.bb</a> =3D&gt; <a href=3D"http://xrdp_0.10.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xrdp_0.10.6.1.bb</a>} |=C2=A0 =C2=A02 =
+-<br>
=C2=A0...<a href=3D"http://er_40.13.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">er_40.13.0.bb</a> =3D&gt; <a href=3D"http://python3-faker_40.14.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-faker_40.14.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-mpv_1.0.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-mpv_1.0.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0...-<a href=3D"http://rarfile_4.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">rarfile_4.2.bb</a> =3D&gt; <a href=3D"http://python3-rarfile_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-rarfile_4.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ython3-sh_2.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">ython3-sh_2.2.2.bb</a> =3D&gt; <a href=3D"http://python3-sh_2.2.4.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-sh_2.2.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ger-ui_5.32.8.bb" rel=3D"noreferrer" target=3D"_=
blank">ger-ui_5.32.8.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.11.bb=
" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.11.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A055 files changed, 1715 insertions(+), 277 deletions(-)<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gssdp_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">gssdp_1.6.4.bb</a> =3D=
&gt; <a href=3D"http://gssdp_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>gssdp_1.6.6.bb</a>} (92%)<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gupnp-tools_0.12.2.bb" rel=3D"noreferrer" target=3D"_blank">gupnp-tools_0.1=
2.2.bb</a> =3D&gt; <a href=3D"http://gupnp-tools_0.12.4.bb" rel=3D"noreferr=
er" target=3D"_blank">gupnp-tools_0.12.4.bb</a>} (84%)<br>
=C2=A0rename meta-multimedia/recipes-connectivity/gupnp/{<a href=3D"http://=
gupnp_1.6.9.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.6.9.bb</a> =3D=
&gt; <a href=3D"http://gupnp_1.6.10.bb" rel=3D"noreferrer" target=3D"_blank=
">gupnp_1.6.10.bb</a>} (93%)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/bluealsa/blueal=
sa/0001-Use-basename-implementation-from-glib-2.0.patch<br>
=C2=A0rename meta-multimedia/recipes-multimedia/bluealsa/{<a href=3D"http:/=
/bluealsa_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_4.3.0.bb<=
/a> =3D&gt; <a href=3D"http://bluealsa_4.3.1.bb" rel=3D"noreferrer" target=
=3D"_blank">bluealsa_4.3.1.bb</a>} (96%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/fluidsynth/{<a href=3D"http=
://fluidsynth_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">fluidsynth_2.5=
.3.bb</a> =3D&gt; <a href=3D"http://fluidsynth_2.5.7.bb" rel=3D"noreferrer"=
 target=3D"_blank">fluidsynth_2.5.7.bb</a>} (92%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/libde265/{<a href=3D"http:/=
/libde265_1.0.18.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.18.b=
b</a> =3D&gt; <a href=3D"http://libde265_1.0.19.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libde265_1.0.19.bb</a>} (93%)<br>
=C2=A0rename meta-multimedia/recipes-support/libsrtp/{<a href=3D"http://lib=
srtp_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">libsrtp_2.7.0.bb</a> =
=3D&gt; <a href=3D"http://libsrtp_2.8.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">libsrtp_2.8.0.bb</a>} (94%)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-support/srt/srt/0002-allow=
-build-with-cmake-4.patch<br>
=C2=A0rename meta-multimedia/recipes-support/srt/{<a href=3D"http://srt_1.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">srt_1.5.4.bb</a> =3D&gt; <a hre=
f=3D"http://srt_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">srt_1.5.6.bb=
</a>} (90%)<br>
=C2=A0rename meta-networking/recipes-support/dovecot/{<a href=3D"http://dov=
ecot_2.4.3.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.4.3.bb</a> =
=3D&gt; <a href=3D"http://dovecot_2.4.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">dovecot_2.4.4.bb</a>} (97%)<br>
=C2=A0rename meta-networking/recipes-support/libosip2/{<a href=3D"http://li=
bosip2_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">libosip2_5.3.1.bb</a>=
 =3D&gt; <a href=3D"http://libosip2_5.3.2.bb" rel=3D"noreferrer" target=3D"=
_blank">libosip2_5.3.2.bb</a>} (88%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-40215.patch<br>
=C2=A0rename meta-networking/recipes-support/spice/{<a href=3D"http://usbre=
dir_0.14.0.bb" rel=3D"noreferrer" target=3D"_blank">usbredir_0.14.0.bb</a> =
=3D&gt; <a href=3D"http://usbredir_0.15.0.bb" rel=3D"noreferrer" target=3D"=
_blank">usbredir_0.15.0.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-47895.patch<br>
=C2=A0rename meta-networking/recipes-support/tcpreplay/{<a href=3D"http://t=
cpreplay_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">tcpreplay_4.5.2.bb<=
/a> =3D&gt; <a href=3D"http://tcpreplay_4.5.5.bb" rel=3D"noreferrer" target=
=3D"_blank">tcpreplay_4.5.5.bb</a>} (89%)<br>
=C2=A0rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netpla=
n/{<a href=3D"http://netplan_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>netplan_1.2.1.bb</a> =3D&gt; <a href=3D"http://netplan_1.2.2.bb" rel=3D"no=
referrer" target=3D"_blank">netplan_1.2.2.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-48144.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-55971.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-58023.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-58389.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/transmission/{<a href=3D"http://t=
ransmission_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">transmission_4.1=
.1.bb</a> =3D&gt; <a href=3D"http://transmission_4.1.3.bb" rel=3D"noreferre=
r" target=3D"_blank">transmission_4.1.3.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetu=
p_2.8.6.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.6.bb</a> =
=3D&gt; <a href=3D"http://cryptsetup_2.8.7.bb" rel=3D"noreferrer" target=3D=
"_blank">cryptsetup_2.8.7.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_22.2=
3.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.1.bb</a> =3D&gt; =
<a href=3D"http://nodejs_22.23.2.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_22.23.2.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-10879.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14380.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14739.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-14740.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-9698.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.8.bb" =
rel=3D"noreferrer" target=3D"_blank">php_8.5.8.bb</a> =3D&gt; <a href=3D"ht=
tp://php_8.5.9.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.9.bb</a>} (=
99%)<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_9.0.=
4.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.4.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.0.5.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.0.5.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-multimedia/libopus/{<a href=3D"http://libopus_=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">libopus_1.6.bb</a> =3D&gt; <a =
href=3D"http://libopus_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libop=
us_1.6.1.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-support/cjose/{<a href=3D"http://cjose_0.6.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">cjose_0.6.2.4.bb</a> =3D&gt; <a h=
ref=3D"http://cjose_0.6.2.7.bb" rel=3D"noreferrer" target=3D"_blank">cjose_=
0.6.2.7.bb</a>} (88%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.=
patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-b=
uild-guard-coverage-linker-flag-behind-CODE_COVERAG.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-f=
ix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0002-F=
ix-use-of-strchr-with-new-GCC.patch<br>
=C2=A0rename meta-oe/recipes-support/liboauth2/{<a href=3D"http://liboauth2=
_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">liboauth2_2.2.0.bb</a> =3D&=
gt; <a href=3D"http://liboauth2_2.3.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">liboauth2_2.3.0.bb</a>} (71%)<br>
=C2=A0rename meta-oe/recipes-support/smarty/{<a href=3D"http://smarty_5.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.8.0.bb</a> =3D&gt; <a hr=
ef=3D"http://smarty_5.8.4.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5=
.8.4.bb</a>} (95%)<br>
=C2=A0rename meta-oe/recipes-support/xrdp/{<a href=3D"http://xrdp_0.10.6.bb=
" rel=3D"noreferrer" target=3D"_blank">xrdp_0.10.6.bb</a> =3D&gt; <a href=
=3D"http://xrdp_0.10.6.1.bb" rel=3D"noreferrer" target=3D"_blank">xrdp_0.10=
.6.1.bb</a>} (98%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-faker_40.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-faker_40.13=
.0.bb</a> =3D&gt; <a href=3D"http://python3-faker_40.14.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-faker_40.14.1.bb</a>} (93%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-rarfile_4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-rarfile_4.2.b=
b</a> =3D&gt; <a href=3D"http://python3-rarfile_4.4.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-rarfile_4.4.bb</a>} (82%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-sh_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sh_2.2.2.bb</a> =
=3D&gt; <a href=3D"http://python3-sh_2.2.4.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-sh_2.2.4.bb</a>} (84%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.32.8.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.=
8.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.11.bb" rel=3D"noreferrer=
" target=3D"_blank">swagger-ui_5.32.11.bb</a>} (94%)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128877): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128877" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128877</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120682416/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120682416/1997914</a><br>
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

--000000000000286aeb0658b60f8c--

