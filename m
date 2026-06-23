Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1144FCD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 03:51:36 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13318.1782186686406270296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 20:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aPlHaXOe;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7ff0645d1d0so44069187b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 20:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782186685; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2KVvG5TBlEoMKraw9S/trndOVfxL912HkbM8hy0UAx+A2+QJBLLeDQSPLrN5e/uue
         fvDCDDvGt1dEklllwumT0mm3z4Q6MOosiS+gkNrvunEtnXaDOiAh6alRkeFkXP1/kgxt
         UY+tLLolJkXseGDjLl/TscTS4nirGAgx8aPfN4aZS8vBlCiOgPawwYkNNEMPKqgguNo3
         pEST8NL6uWDH2HnMxKqopw1/M/x0UXJyQA8qvg7/oq9L4tAvL2Vini3rf0uaaRFTyn6b
         x7K4/j5H0gfQctiGLkaJiEDxWiuWqTJu1umvP4GPRY8XUpMHqJIGy5sDCBrQx0KCqbIZ
         P8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TpFWQs8fbLi8Umc/gcFwQ5mYC/GgfCVlIqN5SG8Omv0=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=TPTqyb+JlxAA7eI7s/1afGt1JzyhjxOq2aVDqPbM0ZS2+E65gQO4U7fo25msLrearE
         gByTlkH4/2RZu8qZfEb/U+pMS6cFo7L3jUZcTtoftJ9qNA2hm876w0VTDsAJf9b7xKGP
         16zdaQKEX6WruA/AXFO+NcEMUIoVm/+ZpsGc02ZY0Engf/YULPhUtiLJWMA58XmEHoMc
         AknOX5MN6kIITPD1d4mz7kPrsqwBnpeh7WFzXFfZ+hcGL/YiZCGPGFgix12kXUQK2J90
         X+EY7hcCiVgz9xTy9NgCSHD13IaelXQTdiTvHpjt0GXrIdFYFpA1v8qBcAtMQSU4rP3r
         ZgUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782186685; x=1782791485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TpFWQs8fbLi8Umc/gcFwQ5mYC/GgfCVlIqN5SG8Omv0=;
        b=aPlHaXOeeUoT9YSkjLlmDAblGH9Oj4KrE9MaisQBDohY+K4KPTQzJ9raqhHTm7pKE+
         7m9cBFvEp8YCAre71gYzBg7ZzDak6/KLKkS0ycOl+YjNQbnB2uIKlxuZfumjLrLv98JU
         2NELBTvVh9PVEUAmUl4+AFvpDTZssNBG16qZ8K/k35LwUuFGb7UlPPu626xmWTETZ5Bs
         NmoAKZcCYVwF4Bi8+Um2jUXa8hDYFBP4DT7li/k8ErP+pw3uP07JvTT4n3DRh1w73kLE
         7u0QidV2BlkzAwko72tWT73At7c4IuaiY9GRHMWIlCoIeW6IHzkB+UniQpXPHLL0iE3Q
         YR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782186685; x=1782791485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpFWQs8fbLi8Umc/gcFwQ5mYC/GgfCVlIqN5SG8Omv0=;
        b=ZLZgih4OwfT/FaFpLv+Z+2WotoVAU+jz84P2XdFDwAEqccyXiTTKoVRsGxg9RAwE+d
         m+rRvrrTctPvJnOk52Z3tnqW4gNQkeWbu3zR8XcsxJ8P1WFEDt6mbcv6ezTp2YYxbR9U
         9Mtkkd1R5eNYo2B4JSZjVgPQtrU3yldIrbscvJEeoBunpFwblif2ChJBS42CcHsfYbFO
         Utdpbj/wd1DUvBKIeWNvMSFZln13P5cYC2YuV/yZQkOogBORfmpfPQz+u+eprURfrFaG
         mnB4MDdLraKqN+v6RoS1DkMK6EZNnCVm9BHI3Sdctin9A3MU3N5X0ZTXkBRHY6D0p/rx
         Kkcg==
X-Gm-Message-State: AOJu0Yy3UbSUyXwphwQXx0B85L5byBPz/BuX3WWBY33OIKq33kB/gUPG
	7u+iXVpxBNFZG8Kc27XUf4fj5WGgMYquDRbjiMyjDycMyMbEvZWJQ02WQqy3254dE99nkJvwBkl
	FSKwLcu/JyFOh1zR1k3cQ3iwiEk22WZk=
X-Gm-Gg: AfdE7cno94FLnLBP4fHNExh37/DxjOscYVX1RjqyHzSZaebP2DAqwc5hD0yFnrH8f0L
	zvjVkulM0EYu/P30Sb7ATUYVQsAGD7pj0UKPWUf3W7/krj8ANfK6aLlrdJSEPlMLE97t1CKTpyz
	eozAuevxszG3o4a62OKd7D4wzY5FEqm6UCphYOGvL8QWO30sWYCCSFrJds8+Gncq/5rTSY9G5do
	GsZdxFB7ELM5hmJyJS6iilxfjObVpwpbvT36yOeGNDaLsPlAdl9Y/qDQLQyjKSatAC1CELP7M4a
	tM00Fxrk9H9sAY5MC1oE5NLXKMBQReJYgaZ0U/Y+bLJHLcbz/L5+B06zn9AiBhv0L64RM03cOIV
	PUtQZIiB/NukYoMv1Y4dPpuHThpILjlYxVl62Cs8MLRCDerzpnUEL1lzOVAA2Mn2Lisf4bw==
X-Received: by 2002:a05:690c:67c5:b0:7ef:d493:7147 with SMTP id
 00721157ae682-806dc133c6bmr7474017b3.7.1782186685323; Mon, 22 Jun 2026
 20:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782121023.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1782121023.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jun 2026 20:50:58 -0700
X-Gm-Features: AVVi8CfVXNQvFVVbbKtXdBxSZexXU3JYqgeMR9EgzNOUgFPThUtaq0NSAhUux_o
Message-ID: <CAMKF1srz6yWE7qnkPToW0RBk5QqFeUAAvtYrqoiXnU2H7ZNsEA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/25] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d5f9e0654e3ac38"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127693

--0000000000004d5f9e0654e3ac38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, merged now, thanks Anuj

On Mon, Jun 22, 2026 at 2:43=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Changes tested on autobuilder and
> locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1561
>
> The following changes since commit
> a43f0d532c399458cae44ce66f3799a220fbb497:
>
>   README: update listed maintainer (2026-05-29 09:29:32 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to 100027977216601000cbefc42c2ff6cf667e7b5e:
>
>   hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20
> +0530)
>
> ----------------------------------------------------------------
>
> Abhishek Bachiphale (1):
>   dnsmasq: upgrade 2.92 -> 2.93
>
> Andrej Kozemcak (1):
>   poco: fix timezone and data time parser issue
>
> Ankur Tyagi (4):
>   libjs-jquery-cookie: patch CVE-2026-46625
>   postfix: upgrade 3.10.9 -> 3.10.10
>   python3-django: upgrade 5.2.14 -> 5.2.15
>   python3-django: upgrade 6.0.5 -> 6.0.6
>
> Anton Skorup (1):
>   jq: patch CVE-2026-47770
>
> Dmitry Baryshkov (1):
>   mariadb: fix building for the ARMv8.3-A and later systems
>
> Jason Schonberg (2):
>   php: upgrade 8.5.5 -> 8.5.6
>   php: upgrade 8.5.6 -> 8.5.7
>
> Li Zhou (1):
>   haveged: upgrade 1.9.19 -> 1.9.20
>
> Markus Volk (1):
>   pipewire: update 1.6.5 -> 1.6.6
>
> Max Krummenacher (1):
>   fio: fix build with musl
>
> Mingli Yu (1):
>   mariadb: Upgrade 11.4.10 -> 11.4.12
>
> Naman Jain (1):
>   nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
>
> Peter Kjellerstedt (2):
>   php: Correct the license to PHP-3.01
>   ttf-dejavu: Use "Bitstream-Vera" instead of "BitstreamVera" as license
>
> Wang Mingyu (7):
>   haveged: upgrade 1.9.20 -> 1.9.22
>   imagemagick: upgrade 7.1.2-23 -> 7.1.2-24
>   memcached: upgrade 1.6.41 -> 1.6.42
>   gdm: upgrade 50.0 -> 50.1
>   python3-vector: upgrade 1.8.0 -> 1.8.1
>   python3-soupsieve: upgrade 2.8.3 -> 2.8.4
>   proftpd: upgrade 1.3.9a -> 1.3.9b
>
> Wei Zhang (1):
>   hostapd: Fix clearing settings for color switch
>
>  .../gdm/{gdm_50.0.bb =3D> gdm_50.1.bb}          |   2 +-
>  .../{pipewire_1.6.5.bb =3D> pipewire_1.6.6.bb}  |   8 +-
>  .../files/0001-Fix-build-with-musl.patch      |  50 --
>  .../{postfix_3.10.9.bb =3D> postfix_3.10.10.bb} |   3 +-
>  .../{proftpd_1.3.9a.bb =3D> proftpd_1.3.9b.bb}  |   2 +-
>  .../recipes-filter/nftables/nftables_1.1.6.bb |   5 +-
>  .../{dnsmasq_2.92.bb =3D> dnsmasq_2.93.bb}      |   6 +-
>  .../dnsmasq/files/CVE-2026-4891.patch         |  40 --
>  .../dnsmasq/files/CVE-2026-4892.patch         |  36 --
>  .../dnsmasq/files/CVE-2026-4893.patch         |  34 --
>  .../dnsmasq/files/CVE-2026-5172.patch         |  34 --
>  ...emcached_1.6.41.bb =3D> memcached_1.6.42.bb} |   2 +-
>  ...inux-prctl.h-include-to-fix-musl-con.patch |  33 ++
>  meta-oe/recipes-benchmark/fio/fio_3.42.bb     |   1 +
>  ...learing-up-settings-for-color-switch.patch |  34 ++
>  .../hostapd/hostapd_2.11.bb                   |   1 +
>  ...e_11.4.10.bb =3D> mariadb-native_11.4.12.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
>  ...b11be28ae9b2432b2a661bf38a197cf9514d.patch |  52 ++
>  ...{mariadb_11.4.10.bb =3D> mariadb_11.4.12.bb} |   0
>  .../jq/jq/CVE-2026-47770.patch                | 484 ++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
>  .../php/{php_8.5.5.bb =3D> php_8.5.7.bb}        |   4 +-
>  .../{haveged_1.9.19.bb =3D> haveged_1.9.22.bb}  |   4 +-
>  .../ttf-fonts/ttf-dejavu_2.37.bb              |   2 +-
>  ...ck_7.1.2-23.bb =3D> imagemagick_7.1.2-24.bb} |   2 +-
>  .../libjs-jquery-cookie/CVE-2026-46625.patch  |  63 +++
>  .../libjs/libjs-jquery-cookie_3.0.5.bb        |   4 +-
>  ...er-trailing-timezone-designators-Tim.patch | 240 +++++++++
>  meta-oe/recipes-support/poco/poco_1.15.2.bb   |   1 +
>  ...ngo_5.2.14.bb =3D> python3-django_5.2.15.bb} |   2 +-
>  ...jango_6.0.5.bb =3D> python3-django_6.0.6.bb} |   2 +-
>  ...ve_2.8.3.bb =3D> python3-soupsieve_2.8.4.bb} |   2 +-
>  ...ector_1.8.0.bb =3D> python3-vector_1.8.1.bb} |   2 +-
>  34 files changed, 939 insertions(+), 220 deletions(-)
>  rename meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb =3D> gdm_50.1.bb} (96%)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.5.bb =
=3D>
> pipewire_1.6.6.bb} (99%)
>  delete mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.pa=
tch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb =3D>
> postfix_3.10.10.bb} (98%)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9a.bb =3D>
> proftpd_1.3.9b.bb} (99%)
>  rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.92.bb =3D>
> dnsmasq_2.93.bb} (95%)
>  delete mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
>  delete mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
>  delete mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
>  delete mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
>  rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb =
=3D>
> memcached_1.6.42.bb} (95%)
>  create mode 100644
> meta-oe/recipes-benchmark/fio/fio/0001-backend-remove-linux-prctl.h-inclu=
de-to-fix-musl-con.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up=
-settings-for-color-switch.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.10.bb =3D>
> mariadb-native_11.4.12.bb} (100%)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514=
d.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.10.bb =3D>
> mariadb_11.4.12.bb} (100%)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.5.bb =3D> php_8.5.7.bb} (99=
%)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb =3D>
> haveged_1.9.22.bb} (91%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-23.bb =3D>
> imagemagick_7.1.2-24.bb} (99%)
>  create mode 100644
> meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch
>  create mode 100644
> meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezo=
ne-designators-Tim.patch
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.14.bb =3D=
>
> python3-django_5.2.15.bb} (61%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.5.bb =3D>
> python3-django_6.0.6.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.3.bb
> =3D> python3-soupsieve_2.8.4.bb} (85%)
>  rename meta-python/recipes-devtools/python/{python3-vector_1.8.0.bb =3D>
> python3-vector_1.8.1.bb} (88%)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127689):
> https://lists.openembedded.org/g/openembedded-devel/message/127689
> Mute This Topic: https://lists.openembedded.org/mt/119921175/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004d5f9e0654e3ac38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, merged now, thanks Anuj</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 22, 2026 at 2:43=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mai=
lto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Please merge these changes in wrynose. Changes tested on autobui=
lder and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1561" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1561</a><br>
<br>
The following changes since commit a43f0d532c399458cae44ce66f3799a220fbb497=
:<br>
<br>
=C2=A0 README: update listed maintainer (2026-05-29 09:29:32 +0530)<br>
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
for you to fetch changes up to 100027977216601000cbefc42c2ff6cf667e7b5e:<br=
>
<br>
=C2=A0 hostapd: Fix clearing settings for color switch (2026-06-18 13:11:20=
 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Abhishek Bachiphale (1):<br>
=C2=A0 dnsmasq: upgrade 2.92 -&gt; 2.93<br>
<br>
Andrej Kozemcak (1):<br>
=C2=A0 poco: fix timezone and data time parser issue<br>
<br>
Ankur Tyagi (4):<br>
=C2=A0 libjs-jquery-cookie: patch CVE-2026-46625<br>
=C2=A0 postfix: upgrade 3.10.9 -&gt; 3.10.10<br>
=C2=A0 python3-django: upgrade 5.2.14 -&gt; 5.2.15<br>
=C2=A0 python3-django: upgrade 6.0.5 -&gt; 6.0.6<br>
<br>
Anton Skorup (1):<br>
=C2=A0 jq: patch CVE-2026-47770<br>
<br>
Dmitry Baryshkov (1):<br>
=C2=A0 mariadb: fix building for the ARMv8.3-A and later systems<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 php: upgrade 8.5.5 -&gt; 8.5.6<br>
=C2=A0 php: upgrade 8.5.6 -&gt; 8.5.7<br>
<br>
Li Zhou (1):<br>
=C2=A0 haveged: upgrade 1.9.19 -&gt; 1.9.20<br>
<br>
Markus Volk (1):<br>
=C2=A0 pipewire: update 1.6.5 -&gt; 1.6.6<br>
<br>
Max Krummenacher (1):<br>
=C2=A0 fio: fix build with musl<br>
<br>
Mingli Yu (1):<br>
=C2=A0 mariadb: Upgrade 11.4.10 -&gt; 11.4.12<br>
<br>
Naman Jain (1):<br>
=C2=A0 nftables: Conditionally add ${PN}-python as RDEPENDS for ptest<br>
<br>
Peter Kjellerstedt (2):<br>
=C2=A0 php: Correct the license to PHP-3.01<br>
=C2=A0 ttf-dejavu: Use &quot;Bitstream-Vera&quot; instead of &quot;Bitstrea=
mVera&quot; as license<br>
<br>
Wang Mingyu (7):<br>
=C2=A0 haveged: upgrade 1.9.20 -&gt; 1.9.22<br>
=C2=A0 imagemagick: upgrade 7.1.2-23 -&gt; 7.1.2-24<br>
=C2=A0 memcached: upgrade 1.6.41 -&gt; 1.6.42<br>
=C2=A0 gdm: upgrade 50.0 -&gt; 50.1<br>
=C2=A0 python3-vector: upgrade 1.8.0 -&gt; 1.8.1<br>
=C2=A0 python3-soupsieve: upgrade 2.8.3 -&gt; 2.8.4<br>
=C2=A0 proftpd: upgrade 1.3.9a -&gt; 1.3.9b<br>
<br>
Wei Zhang (1):<br>
=C2=A0 hostapd: Fix clearing settings for color switch<br>
<br>
=C2=A0.../gdm/{<a href=3D"http://gdm_50.0.bb" rel=3D"noreferrer" target=3D"=
_blank">gdm_50.0.bb</a> =3D&gt; <a href=3D"http://gdm_50.1.bb" rel=3D"noref=
errer" target=3D"_blank">gdm_50.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://pipewire_1.6.5.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.5.bb</a> =3D&gt; <a href=3D"http://pipewire_1.6.6.=
bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.6.bb</a>}=C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A0.../files/0001-Fix-build-with-musl.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
50 --<br>
=C2=A0.../{<a href=3D"http://postfix_3.10.9.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.9.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.10=
.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.10.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://proftpd_1.3.9a.bb" rel=3D"noreferrer" target=
=3D"_blank">proftpd_1.3.9a.bb</a> =3D&gt; <a href=3D"http://proftpd_1.3.9b.=
bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9b.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../recipes-filter/nftables/<a href=3D"http://nftables_1.1.6.bb" rel=
=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a> |=C2=A0 =C2=A05 +-<=
br>
=C2=A0.../{<a href=3D"http://dnsmasq_2.92.bb" rel=3D"noreferrer" target=3D"=
_blank">dnsmasq_2.92.bb</a> =3D&gt; <a href=3D"http://dnsmasq_2.93.bb" rel=
=3D"noreferrer" target=3D"_blank">dnsmasq_2.93.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A06 +-<br>
=C2=A0.../dnsmasq/files/CVE-2026-4891.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 40 --<br>
=C2=A0.../dnsmasq/files/CVE-2026-4892.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 36 --<br>
=C2=A0.../dnsmasq/files/CVE-2026-4893.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 --<br>
=C2=A0.../dnsmasq/files/CVE-2026-5172.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 --<br>
=C2=A0...<a href=3D"http://emcached_1.6.41.bb" rel=3D"noreferrer" target=3D=
"_blank">emcached_1.6.41.bb</a> =3D&gt; <a href=3D"http://memcached_1.6.42.=
bb" rel=3D"noreferrer" target=3D"_blank">memcached_1.6.42.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...inux-prctl.h-include-to-fix-musl-con.patch |=C2=A0 33 ++<br>
=C2=A0meta-oe/recipes-benchmark/fio/<a href=3D"http://fio_3.42.bb" rel=3D"n=
oreferrer" target=3D"_blank">fio_3.42.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0...learing-up-settings-for-color-switch.patch |=C2=A0 34 ++<br>
=C2=A0.../hostapd/<a href=3D"http://hostapd_2.11.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hostapd_2.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://e_11.4.10.bb" rel=3D"noreferrer" target=3D"_blan=
k">e_11.4.10.bb</a> =3D&gt; <a href=3D"http://mariadb-native_11.4.12.bb" re=
l=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.12.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0...b11be28ae9b2432b2a661bf38a197cf9514d.patch |=C2=A0 52 ++<br>
=C2=A0...{<a href=3D"http://mariadb_11.4.10.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_11.4.10.bb</a> =3D&gt; <a href=3D"http://mariadb_11.4.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.12.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0.../jq/jq/CVE-2026-47770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 484 ++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.5.bb" rel=3D"noreferrer" target=3D=
"_blank">php_8.5.5.bb</a> =3D&gt; <a href=3D"http://php_8.5.7.bb" rel=3D"no=
referrer" target=3D"_blank">php_8.5.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://haveged_1.9.19.bb" rel=3D"noreferrer" target=
=3D"_blank">haveged_1.9.19.bb</a> =3D&gt; <a href=3D"http://haveged_1.9.22.=
bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.22.bb</a>}=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-dejavu_2.37.bb" rel=3D"noreferrer=
" target=3D"_blank">ttf-dejavu_2.37.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ck_7.1.2-23.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ck_7.1.2-23.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-24.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-24.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../libjs-jquery-cookie/CVE-2026-46625.patch=C2=A0 |=C2=A0 63 +++<br>
=C2=A0.../libjs/<a href=3D"http://libjs-jquery-cookie_3.0.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">libjs-jquery-cookie_3.0.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...er-trailing-timezone-designators-Tim.patch | 240 +++++++++<br>
=C2=A0meta-oe/recipes-support/poco/<a href=3D"http://poco_1.15.2.bb" rel=3D=
"noreferrer" target=3D"_blank">poco_1.15.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0...<a href=3D"http://ngo_5.2.14.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.14.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.15.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.15.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://jango_6.0.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.5.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.6.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.6.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ve_2.8.3.bb" rel=3D"noreferrer" target=3D"_blank=
">ve_2.8.3.bb</a> =3D&gt; <a href=3D"http://python3-soupsieve_2.8.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-soupsieve_2.8.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ector_1.8.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ector_1.8.0.bb</a> =3D&gt; <a href=3D"http://python3-vector_1.8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-vector_1.8.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A034 files changed, 939 insertions(+), 220 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/gdm/{<a href=3D"http://gdm_50.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gdm_50.0.bb</a> =3D&gt; <a href=3D"http=
://gdm_50.1.bb" rel=3D"noreferrer" target=3D"_blank">gdm_50.1.bb</a>} (96%)=
<br>
=C2=A0rename meta-multimedia/recipes-multimedia/pipewire/{<a href=3D"http:/=
/pipewire_1.6.5.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.5.bb<=
/a> =3D&gt; <a href=3D"http://pipewire_1.6.6.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.6.bb</a>} (99%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001=
-Fix-build-with-musl.patch<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.9.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.9.bb</a> =
=3D&gt; <a href=3D"http://postfix_3.10.10.bb" rel=3D"noreferrer" target=3D"=
_blank">postfix_3.10.10.bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-daemons/proftpd/{<a href=3D"http://pro=
ftpd_1.3.9a.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9a.bb</a> =
=3D&gt; <a href=3D"http://proftpd_1.3.9b.bb" rel=3D"noreferrer" target=3D"_=
blank">proftpd_1.3.9b.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-support/dnsmasq/{<a href=3D"http://dns=
masq_2.92.bb" rel=3D"noreferrer" target=3D"_blank">dnsmasq_2.92.bb</a> =3D&=
gt; <a href=3D"http://dnsmasq_2.93.bb" rel=3D"noreferrer" target=3D"_blank"=
>dnsmasq_2.93.bb</a>} (95%)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4891.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4892.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-4893.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-5172.patch<br>
=C2=A0rename meta-networking/recipes-support/memcached/{<a href=3D"http://m=
emcached_1.6.41.bb" rel=3D"noreferrer" target=3D"_blank">memcached_1.6.41.b=
b</a> =3D&gt; <a href=3D"http://memcached_1.6.42.bb" rel=3D"noreferrer" tar=
get=3D"_blank">memcached_1.6.42.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-backend-rem=
ove-linux-prctl.h-include-to-fix-musl-con.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-=
hostapd-Fix-clearing-up-settings-for-color-switch.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_11=
.4.10.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.10.bb</a=
> =3D&gt; <a href=3D"http://mariadb-native_11.4.12.bb" rel=3D"noreferrer" t=
arget=3D"_blank">mariadb-native_11.4.12.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2=
432b2a661bf38a197cf9514d.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_11.4.10.b=
b" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.10.bb</a> =3D&gt; <a h=
ref=3D"http://mariadb_11.4.12.bb" rel=3D"noreferrer" target=3D"_blank">mari=
adb_11.4.12.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patc=
h<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.5.bb" =
rel=3D"noreferrer" target=3D"_blank">php_8.5.5.bb</a> =3D&gt; <a href=3D"ht=
tp://php_8.5.7.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.7.bb</a>} (=
99%)<br>
=C2=A0rename meta-oe/recipes-extended/haveged/{<a href=3D"http://haveged_1.=
9.19.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.19.bb</a> =3D&gt;=
 <a href=3D"http://haveged_1.9.22.bb" rel=3D"noreferrer" target=3D"_blank">=
haveged_1.9.22.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-23.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-23=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-24.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-24.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie/=
CVE-2026-46625.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poco/poco/0004-Fix-DateTim=
eParser-trailing-timezone-designators-Tim.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.14.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
14.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.15.bb</a>} (61%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.5=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.6.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.6.bb</a>} (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-soupsieve_2.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve=
_2.8.3.bb</a> =3D&gt; <a href=3D"http://python3-soupsieve_2.8.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-soupsieve_2.8.4.bb</a>} (85%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-vector_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-vector_1.8.0=
.bb</a> =3D&gt; <a href=3D"http://python3-vector_1.8.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-vector_1.8.1.bb</a>} (88%)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127689): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127689" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127689</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119921175/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119921175/1997914</a><br>
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

--0000000000004d5f9e0654e3ac38--

