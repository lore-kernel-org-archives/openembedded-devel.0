Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E281CFCD0AA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 04:57:06 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7227.1773809817056401783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 21:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icPGTg31;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-793fdbb8d3aso66001887b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 21:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773809816; cv=none;
        d=google.com; s=arc-20240605;
        b=PE9KBOIaOGgtP+SX48/mm91sdOxq330sxL/hce6LEb87otzKQ+i0rwoPapMn/b6/YH
         T0mzWSQ+hEXZxAmyntLNJh3N+0AlvJ2bLFvtkhz/YxUaOqvs6IwOQGYmdvnoNbOpfB7U
         IvkSxvVCH+GKuRqFsR3N/tCuOn23T3jp/fORipxH7+lj4af86/jEEljxwM2G23C5t6yI
         DtkQNyv2LPjyJzeZCfQmKK1TTsTn5XhAzwoDvgqI/9HZuWy2Zi44JKQC3Sq1zU3EvifN
         im66yEnW8/MDbyOsornWIPz0CNRVtAsRkh5ME0bF7Rgyz3fsDNa8yLHblkSLgSEnZyvT
         Lvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=veo96mTIcLSyh4KuetxaoBJdCx1uo/aOfuRP0oFRQ1g=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=gtC1UVzZAEHto/B0RFo7ExUC3i6dta7ydNiSHbHQZlGiVFZLaJ/BS4TzqsquP7U+tI
         a4fi6SLmhFYQs1ww3Ux3ynpvoqOmkHUQGHLu3YRjooBfVyt0saaLX20wK+A13fEONLnL
         vllCuArmc6FDj37By4mMzKAXezD4kbKRADJX1IlWxHMP4rQ6l9A82y4P0d9lph6qi3BI
         V2i0/PccMWEpGU4wN8lxfJPM8bAzOkg1uHjmj1hIMEzaXGE1O9UvxRH90WoabjQtIwp/
         e5G7ZSkXMW7Lz0AjTQSnLcfcZNk9pIRLQcLJNZKesmmlpNyr3EePbaybPMDZkLXrSrhq
         nkFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773809816; x=1774414616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=veo96mTIcLSyh4KuetxaoBJdCx1uo/aOfuRP0oFRQ1g=;
        b=icPGTg31E+f3kaABBlUNy+xCk5ajh9vBfb/9zDkBhyjNmL7n94yO1lAu44dO6j2Ov3
         CYJk6+34S3kxnRZhMyiry28VRDkUYDhNJJImDjCHUk2opFdWe8mfJU4q1ViNL7x+oiPr
         GgmHYTbPfTkv8Rhd+hzyuFx59jRqvFJyjZ4PAh9TJGD3Y5Vsve3kA99t0x9wirj+tXzX
         nmVW0WpGO8ruAy9elY8aiFrssHM/cG3Tq0Wbds2yhaCIJvWx1L49WgfbRDhMkkzj8tPY
         mpUtamOE2PSVhjdhfgB3dkwX2cPYSssQLooEfc+RXrsAZykV6Wn13knU4HN6q72xshR/
         dEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809816; x=1774414616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veo96mTIcLSyh4KuetxaoBJdCx1uo/aOfuRP0oFRQ1g=;
        b=Jew+AStLjvFWQGcHvzBurANL1e6OSJ/8sb24dxgjzGowPQxjH1Z7JdhzzsE48Oi3N+
         QLXljtaM7Q8wzg8NsiM/j87ptQopPVRfq1Wqi3TY9ytEptq060YOUk77RO0pLo/rrJM1
         qm5y+CwdIh2LEp0Ky+s1lj3NA0XYQpsFKa+vzeDDI1AOihzI9JxbFDHzKzbmVQHUWnX9
         QSASjEOl3F5rt/ZqV2QSVXAa2+Hqk/mhK96ON9FWDlP/j6gicKGDGWcHQxQ2vW/3K6C9
         zhVIRO+Y9yjae268JWvwJKJDv2NWD744A/ezzq/9GqUR7/gUz7bOUl7RHeMQBL5COjcf
         w2Nw==
X-Gm-Message-State: AOJu0Yy6pEEP8VWTj2sWP+vi2Vr2KEJ9FDoiNfd+NNFILhuHt7cJbb2p
	VAvEMv22D3Qmy6PMOtQ6V84wdseFy5akH3CsJXGQ1JP/0Pw8cqiJznKksvoLx6x9hYSJdFEL6VD
	sSbzb/dzUGm3ZQfEla0F0Baw6Ngv8Zi4=
X-Gm-Gg: ATEYQzzfgdr+rqxNPR4u2OgBkWDznsfYd9/NjU5BRtHwyJ78sd3u/J1kip68KWSu8Sk
	ugQw8FZ2kB7eI2cXMB9JICEzUQRG+VA26hwJ+RiNDArLR3o2oNSgUFoV7ffWRbOcHm6XOucd4UP
	M1kCxhEB4EmNUzY0fd+7ky18euRa/ImevtuCbRVjq6hw+ab3aI9pKaTPe8RKE+AUU8jR66SiPAz
	56I9f+DaAdYjPasUc+oc0syocp+YSG6Ku/9/gATiModBDQw9CONeHiFGp7qFVfrhNk540C0bL8Y
	ntG/GYQGz7VFrDlovJu2twROkgwy6W3NcrRjFU9v35UCLElE84d9MDoL4f7KrBjCx+6Zb8wYSIu
	oYcYmN5vtxkKH98hUmIRfMASt
X-Received: by 2002:a05:690c:2612:b0:79a:5466:bb6a with SMTP id
 00721157ae682-79a71dbadeemr17894467b3.48.1773809815908; Tue, 17 Mar 2026
 21:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 21:56:29 -0700
X-Gm-Features: AaiRm50aj1gAqKt0Lvk1hvPox8e-451J8A9ywEfcw5DctbWVuCYY_pCK9q0u6Ck
Message-ID: <CAMKF1srHeE-THnh=dn9i3+px0tVT1kZoFp9vSzcVEsEXfw8mYA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/6] mosquitto: upgrade 2.0.22 -> 2.1.2
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f9f6bf064d4547f7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 04:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125341

--000000000000f9f6bf064d4547f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails to build see -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_inlin=
e

On Thu, Mar 12, 2026 at 7:05=E2=80=AFAM Andrej Kozemcak via lists.openembed=
ded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:

> License-Update: Change license to EPL-2.0 OR BSD-3-Clause
>   Clarify license in LICENSE.txt:
> https://github.com/eclipse-mosquitto/mosquitto/commit/f466e454e016825220e=
8494bd6264a5736ed1112
>   Updated NOTICE.md:
> https://github.com/eclipse-mosquitto/mosquitto/commit/827c803cb8d63768915=
48b856a1faa3f0ab5
>
> Removed patch included in this release
>
> Update PACKAGECONFIG/cmake options:
>
> - manpages: -DDOCUMENTATION =E2=86=92 -DWITH_DOCS (the CMake option was r=
enamed in
> 2.1.x)
> - ssl: removed -DWITH_EC=3DON/-DWITH_EC=3DOFF; the WITH_EC option was dro=
pped
> in 2.1.x
>        since Elliptic Curve support is now always included with TLS
> - websockets =E2=80=94 adapt websockets to properly use with picohttppars=
er
>
> Disable `DWITH_ADNS` option because it required Argon2, which is not part
> of
> meta-oe layer
>
> Disable `DWITH_TESTS` option because mosquitto start using GoogleTest
> and we hit a common Yocto + CMake + GoogleTest problem
>
> Changelog:
> v2.1.2:
>   https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.2/ChangeLog.tx=
t
>
>   Broker:
>     - Forbid running with `persistence true` and with a persistence plugi=
n
> at the
>       same time.
>
>   Build:
>     - Build fixes for OpenBSD. Closes #3474.
>     - Add missing libedit to docker builds. Closes #3476.
>     - Fix static/shared linking of libwebsockets under cmake.
>
> v2.1.1:
>   https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.1/ChangeLog.tx=
t
>
> v2.1.0:
>   https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.0/ChangeLog.tx=
t
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../mosquitto/files/2895.patch                | 38 -------------------
>  ...mosquitto_2.0.22.bb =3D> mosquitto_2.1.2.bb} | 27 ++++++++-----
>  2 files changed, 17 insertions(+), 48 deletions(-)
>  delete mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>  rename meta-networking/recipes-connectivity/mosquitto/{
> mosquitto_2.0.22.bb =3D> mosquitto_2.1.2.bb} (70%)
>
> diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> deleted file mode 100644
> index d9432e749e..0000000000
> --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From: Joachim Zobel <jz-2017@heute-morgen.de>
> -Date: Wed, 13 Sep 2023 10:05:43 +0200
> -Subject: [PATCH] Mosquitto now waits for network-online when starting
> - (Closes: #1036450)
> -
> -See: https://github.com/eclipse/mosquitto/issues/2878
> ----
> -Upstream-Status: Submitted [
> https://github.com/eclipse-mosquitto/mosquitto/pull/2895]
> -
> - service/systemd/mosquitto.service.simple | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> ---- a/service/systemd/mosquitto.service.simple
> -+++ b/service/systemd/mosquitto.service.simple
> -@@ -1,8 +1,8 @@
> - [Unit]
> - Description=3DMosquitto MQTT Broker
> - Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)
> --After=3Dnetwork.target
> --Wants=3Dnetwork.target
> -+After=3Dnetwork-online.target
> -+Wants=3Dnetwork-online.target
> -
> - [Service]
> - ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
> ---- a/service/systemd/mosquitto.service.notify
> -+++ b/service/systemd/mosquitto.service.notify
> -@@ -1,8 +1,8 @@
> - [Unit]
> - Description=3DMosquitto MQTT Broker
> - Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)
> --After=3Dnetwork.target
> --Wants=3Dnetwork.target
> -+After=3Dnetwork-online.target
> -+Wants=3Dnetwork-online.target
> -
> - [Service]
> - Type=3Dnotify
> diff --git a/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.22.bb b/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.1.2.bb
> similarity index 70%
> rename from meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.22.bb
> rename to meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.1.2.bb
> index 1bdf54eea1..c533240010 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
> @@ -6,20 +6,19 @@ provides a lightweight method of carrying out messaging
> using a \
>  publish/subscribe model. "
>  HOMEPAGE =3D "http://mosquitto.org/"
>  SECTION =3D "console/network"
> -LICENSE =3D "EPL-2.0 | EDL-1.0"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Dca9a8f366c6babf593e374d0d7d58749 \
> +LICENSE =3D "EPL-2.0 | BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Df6d64fd27a4071b14ef656a0e8a4f4cf \
>                      file://edl-v10;md5=3D9f6accb1afcb570f8be65039e2fcd49=
e \
>                      file://epl-v20;md5=3D2dd765ca47a05140be15ebafddbeadf=
e \
> -                    file://NOTICE.md;md5=3Da7a91b4754c6f7995020d1b49bc82=
9c6
> \
> +                    file://NOTICE.md;md5=3D611234becddb76dca161d4ffce7ab=
420
> \
>  "
>  DEPENDS =3D "uthash cjson"
>
>  SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
>             file://mosquitto.init \
> -           file://2895.patch \
>  "
>
> -SRC_URI[sha256sum] =3D
> "2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68"
> +SRC_URI[sha256sum] =3D
> "fd905380691ac65ea5a93779e8214941829e3d6e038d5edff9eac5fd74cbed02"
>
>  inherit systemd update-rc.d useradd cmake pkgconfig
>
> @@ -27,16 +26,22 @@ PACKAGECONFIG ??=3D "ssl websockets \
>                    ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
>                    "
>
> -PACKAGECONFIG[manpages] =3D
> "-DDOCUMENTATION=3DON,-DDOCUMENTATION=3DOFF,libxslt-native
> docbook-xsl-stylesheets-native"
> +PACKAGECONFIG[manpages] =3D "-DWITH_DOCS=3DON,-DWITH_DOCS=3DOFF,libxslt-=
native
> docbook-xsl-stylesheets-native"
>  PACKAGECONFIG[dns-srv] =3D "-DWITH_SRV=3DON,-DWITH_SRV=3DOFF,c-ares"
> -PACKAGECONFIG[ssl] =3D "-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON
> -DWITH_EC=3DON,-DWITH_TLS=3DOFF -DWITH_TLS_PSK=3DOFF -DWITH_EC=3DOFF,open=
ssl"
> +PACKAGECONFIG[ssl] =3D "-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON,-DWITH_TLS=
=3DOFF
> -DWITH_TLS_PSK=3DOFF,openssl"
>  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,sys=
temd"
> -PACKAGECONFIG[websockets] =3D
> "-DWITH_WEBSOCKETS=3DON,-DWITH_WEBSOCKETS=3DOFF,libwebsockets"
> +PACKAGECONFIG[websockets] =3D "-DWITH_WEBSOCKETS=3DON
> -DWITH_WEBSOCKETS_BUILTIN=3DOFF,-DWITH_WEBSOCKETS=3DOFF,libwebsockets"
>  PACKAGECONFIG[dlt] =3D "-DWITH_DLT=3DON,-DWITH_DLT=3DOFF,dlt-daemon"
> +PACKAGECONFIG[http-api] =3D
> "-DWITH_HTTP_API=3DON,-DWITH_HTTP_API=3DOFF,libmicrohttpd"
>
> +# Disable building/running tests to avoid GoogleTest discovery executing
> target binaries
> +# during cross-compilation (Yocto). This prevents CMake from calling
> gtest_discover_tests().
> +# See: Yocto + GTest cross-compile issues and gtest_discover_tests
> execution failures.
> +# (Refs: SO example and googletest issue)
>  EXTRA_OECMAKE =3D " \
>      -DWITH_BUNDLED_DEPS=3DOFF \
> -    -DWITH_ADNS=3DON \
> +    -DWITH_ADNS=3DOFF \
> +    -DWITH_TESTS=3DOFF \
>  "
>
>  do_install:append() {
> @@ -59,7 +64,9 @@ PACKAGE_BEFORE_PN =3D "${PN}-examples"
>  FILES:${PN} =3D "${sbindir}/mosquitto \
>                 ${bindir}/mosquitto_passwd \
>                 ${bindir}/mosquitto_ctrl \
> -               ${libdir}/mosquitto_dynamic_security.so \
> +               ${bindir}/mosquitto_db_dump \
> +               ${bindir}/mosquitto_signal \
> +               ${libdir}/mosquitto_*.so \
>                 ${sysconfdir}/mosquitto \
>                 ${sysconfdir}/init.d \
>                 ${systemd_unitdir}/system/mosquitto.service \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125166):
> https://lists.openembedded.org/g/openembedded-devel/message/125166
> Mute This Topic: https://lists.openembedded.org/mt/118279354/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f9f6bf064d4547f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this fails to build see -=C2=A0<a href=3D"https://autobuil=
der.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_inline">https://autob=
uilder.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_inline</a></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 12, 2026 at 7:05=E2=80=AFAM Andrej Kozemcak via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;a=
ndrej.kozemcak=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siem=
ens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">License-Update: Change license to EPL-2.0 OR =
BSD-3-Clause<br>
=C2=A0 Clarify license in LICENSE.txt: <a href=3D"https://github.com/eclips=
e-mosquitto/mosquitto/commit/f466e454e016825220e8494bd6264a5736ed1112" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/eclipse-mosquitto/mosq=
uitto/commit/f466e454e016825220e8494bd6264a5736ed1112</a><br>
=C2=A0 Updated NOTICE.md: <a href=3D"https://github.com/eclipse-mosquitto/m=
osquitto/commit/827c803cb8d6376891548b856a1faa3f0ab5" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/eclipse-mosquitto/mosquitto/commit/827c8=
03cb8d6376891548b856a1faa3f0ab5</a><br>
<br>
Removed patch included in this release<br>
<br>
Update PACKAGECONFIG/cmake options:<br>
<br>
- manpages: -DDOCUMENTATION =E2=86=92 -DWITH_DOCS (the CMake option was ren=
amed in 2.1.x)<br>
- ssl: removed -DWITH_EC=3DON/-DWITH_EC=3DOFF; the WITH_EC option was dropp=
ed in 2.1.x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0since Elliptic Curve support is now always inclu=
ded with TLS<br>
- websockets =E2=80=94 adapt websockets to properly use with picohttpparser=
<br>
<br>
Disable `DWITH_ADNS` option because it required Argon2, which is not part o=
f<br>
meta-oe layer<br>
<br>
Disable `DWITH_TESTS` option because mosquitto start using GoogleTest<br>
and we hit a common Yocto + CMake + GoogleTest problem<br>
<br>
Changelog:<br>
v2.1.2:<br>
=C2=A0 <a href=3D"https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.=
2/ChangeLog.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/ec=
lipse-mosquitto/mosquitto/blob/v2.1.2/ChangeLog.txt</a><br>
<br>
=C2=A0 Broker:<br>
=C2=A0 =C2=A0 - Forbid running with `persistence true` and with a persisten=
ce plugin at the<br>
=C2=A0 =C2=A0 =C2=A0 same time.<br>
<br>
=C2=A0 Build:<br>
=C2=A0 =C2=A0 - Build fixes for OpenBSD. Closes #3474.<br>
=C2=A0 =C2=A0 - Add missing libedit to docker builds. Closes #3476.<br>
=C2=A0 =C2=A0 - Fix static/shared linking of libwebsockets under cmake.<br>
<br>
v2.1.1:<br>
=C2=A0 <a href=3D"https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.=
1/ChangeLog.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/ec=
lipse-mosquitto/mosquitto/blob/v2.1.1/ChangeLog.txt</a><br>
<br>
v2.1.0:<br>
=C2=A0 <a href=3D"https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.=
0/ChangeLog.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/ec=
lipse-mosquitto/mosquitto/blob/v2.1.0/ChangeLog.txt</a><br>
<br>
Signed-off-by: Andrej Kozemcak &lt;<a href=3D"mailto:andrej.kozemcak@siemen=
s.com" target=3D"_blank">andrej.kozemcak@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../mosquitto/files/2895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 38 -------------------<br>
=C2=A0...<a href=3D"http://mosquitto_2.0.22.bb" rel=3D"noreferrer" target=
=3D"_blank">mosquitto_2.0.22.bb</a> =3D&gt; <a href=3D"http://mosquitto_2.1=
.2.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.1.2.bb</a>} | 27 ++=
++++++-----<br>
=C2=A02 files changed, 17 insertions(+), 48 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/mosquitto/fil=
es/2895.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/mosquitto/{<a href=3D"htt=
p://mosquitto_2.0.22.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0=
.22.bb</a> =3D&gt; <a href=3D"http://mosquitto_2.1.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">mosquitto_2.1.2.bb</a>} (70%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patc=
h b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
deleted file mode 100644<br>
index d9432e749e..0000000000<br>
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From: Joachim Zobel &lt;<a href=3D"mailto:jz-2017@heute-morgen.de" target=
=3D"_blank">jz-2017@heute-morgen.de</a>&gt;<br>
-Date: Wed, 13 Sep 2023 10:05:43 +0200<br>
-Subject: [PATCH] Mosquitto now waits for network-online when starting<br>
- (Closes: #1036450)<br>
-<br>
-See: <a href=3D"https://github.com/eclipse/mosquitto/issues/2878" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/eclipse/mosquitto/issues/28=
78</a><br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/eclipse-mosquitt=
o/mosquitto/pull/2895" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/eclipse-mosquitto/mosquitto/pull/2895</a>]<br>
-<br>
- service/systemd/mosquitto.service.simple | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
---- a/service/systemd/mosquitto.service.simple<br>
-+++ b/service/systemd/mosquitto.service.simple<br>
-@@ -1,8 +1,8 @@<br>
- [Unit]<br>
- Description=3DMosquitto MQTT Broker<br>
- Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)<br>
--After=3Dnetwork.target<br>
--Wants=3Dnetwork.target<br>
-+After=3Dnetwork-online.target<br>
-+Wants=3Dnetwork-online.target<br>
- <br>
- [Service]<br>
- ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf<br>
---- a/service/systemd/mosquitto.service.notify<br>
-+++ b/service/systemd/mosquitto.service.notify<br>
-@@ -1,8 +1,8 @@<br>
- [Unit]<br>
- Description=3DMosquitto MQTT Broker<br>
- Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)<br>
--After=3Dnetwork.target<br>
--Wants=3Dnetwork.target<br>
-+After=3Dnetwork-online.target<br>
-+Wants=3Dnetwork-online.target<br>
- <br>
- [Service]<br>
- Type=3Dnotify<br>
diff --git a/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http=
://mosquitto_2.0.22.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.=
22.bb</a> b/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http:=
//mosquitto_2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.1.2.=
bb</a><br>
similarity index 70%<br>
rename from meta-networking/recipes-connectivity/mosquitto/<a href=3D"http:=
//mosquitto_2.0.22.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.2=
2.bb</a><br>
rename to meta-networking/recipes-connectivity/mosquitto/<a href=3D"http://=
mosquitto_2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.1.2.bb=
</a><br>
index 1bdf54eea1..c533240010 100644<br>
--- a/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http://mosq=
uitto_2.0.22.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.22.bb</=
a><br>
+++ b/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http://mosq=
uitto_2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.1.2.bb</a>=
<br>
@@ -6,20 +6,19 @@ provides a lightweight method of carrying out messaging u=
sing a \<br>
=C2=A0publish/subscribe model. &quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://mosquitto.org/" rel=3D"noreferre=
r" target=3D"_blank">http://mosquitto.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
-LICENSE =3D &quot;EPL-2.0 | EDL-1.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dca9a8f366c6babf593e374=
d0d7d58749 \<br>
+LICENSE =3D &quot;EPL-2.0 | BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Df6d64fd27a4071b14ef656=
a0e8a4f4cf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://edl-v10;md5=3D9f6accb1afcb570f8be65039e2fcd49e \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://epl-v20;md5=3D2dd765ca47a05140be15ebafddbeadfe \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://NOTICE.md;md5=3Da7a91b4754c6f7995020d1b49bc829c6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://NOTICE.md;md5=3D611234becddb76dca161d4ffce7ab420 \<br>
=C2=A0&quot;<br>
=C2=A0DEPENDS =3D &quot;uthash cjson&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://mosquitto.org/files/source/mosqui=
tto-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://mosquitto=
.org/files/source/mosquitto-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mosquitto.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://2895.patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;2f752589ef7db40260b633fbdb536e9a04b446a315138=
d64a7ff3c14e2de6b68&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fd905380691ac65ea5a93779e8214941829e3d6e038d5=
edff9eac5fd74cbed02&quot;<br>
<br>
=C2=A0inherit systemd update-rc.d useradd cmake pkgconfig<br>
<br>
@@ -27,16 +26,22 @@ PACKAGECONFIG ??=3D &quot;ssl websockets \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.filter(&#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
-PACKAGECONFIG[manpages] =3D &quot;-DDOCUMENTATION=3DON,-DDOCUMENTATION=3DO=
FF,libxslt-native docbook-xsl-stylesheets-native&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;-DWITH_DOCS=3DON,-DWITH_DOCS=3DOFF,libxs=
lt-native docbook-xsl-stylesheets-native&quot;<br>
=C2=A0PACKAGECONFIG[dns-srv] =3D &quot;-DWITH_SRV=3DON,-DWITH_SRV=3DOFF,c-a=
res&quot;<br>
-PACKAGECONFIG[ssl] =3D &quot;-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON -DWITH_EC=
=3DON,-DWITH_TLS=3DOFF -DWITH_TLS_PSK=3DOFF -DWITH_EC=3DOFF,openssl&quot;<b=
r>
+PACKAGECONFIG[ssl] =3D &quot;-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON,-DWITH_TL=
S=3DOFF -DWITH_TLS_PSK=3DOFF,openssl&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=
=3DOFF,systemd&quot;<br>
-PACKAGECONFIG[websockets] =3D &quot;-DWITH_WEBSOCKETS=3DON,-DWITH_WEBSOCKE=
TS=3DOFF,libwebsockets&quot;<br>
+PACKAGECONFIG[websockets] =3D &quot;-DWITH_WEBSOCKETS=3DON -DWITH_WEBSOCKE=
TS_BUILTIN=3DOFF,-DWITH_WEBSOCKETS=3DOFF,libwebsockets&quot;<br>
=C2=A0PACKAGECONFIG[dlt] =3D &quot;-DWITH_DLT=3DON,-DWITH_DLT=3DOFF,dlt-dae=
mon&quot;<br>
+PACKAGECONFIG[http-api] =3D &quot;-DWITH_HTTP_API=3DON,-DWITH_HTTP_API=3DO=
FF,libmicrohttpd&quot;<br>
<br>
+# Disable building/running tests to avoid GoogleTest discovery executing t=
arget binaries<br>
+# during cross-compilation (Yocto). This prevents CMake from calling gtest=
_discover_tests().<br>
+# See: Yocto + GTest cross-compile issues and gtest_discover_tests executi=
on failures.<br>
+# (Refs: SO example and googletest issue)<br>
=C2=A0EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_BUNDLED_DEPS=3DOFF \<br>
-=C2=A0 =C2=A0 -DWITH_ADNS=3DON \<br>
+=C2=A0 =C2=A0 -DWITH_ADNS=3DOFF \<br>
+=C2=A0 =C2=A0 -DWITH_TESTS=3DOFF \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install:append() {<br>
@@ -59,7 +64,9 @@ PACKAGE_BEFORE_PN =3D &quot;${PN}-examples&quot;<br>
=C2=A0FILES:${PN} =3D &quot;${sbindir}/mosquitto \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/mosquitto=
_passwd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/mosquitto=
_ctrl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/mosquitto=
_dynamic_security.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/mosquitto=
_db_dump \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/mosquitto=
_signal \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/mosquitto=
_*.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/mosqu=
itto \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.=
d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/=
system/mosquitto.service \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125166): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125166" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125166</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118279354/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118279354/1997914</a><br>
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

--000000000000f9f6bf064d4547f7--

