Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F79EE57D4
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 06:01:38 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80874.1767160892075866387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 22:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpZDw/UX;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64661975669so10147073d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 22:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767160891; x=1767765691; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfyy8pL4liRy67nbPXfSj+dPGaJ2gxPOeF4KHN+SrS8=;
        b=YpZDw/UXQGtPNWatdi/sEwutmyip1whuB10MLOe+D+9j4d03WqfFuhzyJjxBq/tsTv
         g8dC6oooqUMnwXfvtWZ+greWix0MPmVa+gQd+PlYawKxal3yaAehJ9sFU6qYSkx9oEs+
         5nRVP7AkAlI1/wQI/tP/+daafBCXq0ZQ3WQSTgbOeCQ4S3ZIfpUBhi6dZLP+ygZxjLpr
         bA4Dv7KGPToAwBmAVG6DM7UxtRRSkGco+ZtpwKu5sguUiRwiB6lwBzQ2t9xkuIxbGV9C
         tMuh5U8KojWBnZzwTWr7FvHI5cDMhLXecFHJXjNmxpsLyA8U0lChDgEL4IciUFiDrX27
         Pirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767160891; x=1767765691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfyy8pL4liRy67nbPXfSj+dPGaJ2gxPOeF4KHN+SrS8=;
        b=nHzo68XXD5MJDMO+yv2siv1Rjh/EOf9bWPIbhrGObp808aH2EuQwgL1su1dRsQlJqU
         PBSx83IUUXflsmfwOj02Q0xGsSgoctAn/PBm7lwGCD5nWbxIEqOxtesVuBpw94V7Ip3u
         cpE40rhWS7RNwj2ZifBSFQEGbMD1IGik+XR4nlZW+VbRK14cdcraIRGG32Fs6DaxsWhR
         +zhiZlAULa2ULSkuFG/fsVEAzpyTk8Et8MWigNse1nJGNPoB1lO/+Joh4y52dfff+rxc
         yZ5yX8Eutg2abrVZnMqk7lm8bnj1KoeFiKMghoVkgj/G/hB9/FdtC30XRnrru8fNGs+O
         hsbw==
X-Gm-Message-State: AOJu0YxC9wHfCm2yLc/Kt+cf1229D75t7q2adYf5m3MC7VMYmKxsXKy7
	EdxMWw1jfvgELBQlwjgl2ZWk3KIW9979hyyZDcZm4xX1dDsp4y3CUYS3gsdJBNCSor0OGpMxkFs
	nc1la7myo0vbCRSAvXMFniEKb2D7HuDU=
X-Gm-Gg: AY/fxX7jjTihLKKJFbZOlwsCgnBNyU5sFNcJrGI6I40Cf+a52Ak/FUoQ4L7DiuLt21n
	0vmu1hyv1wlBR3M50l5/vz69IH0x5NOl7OkIORmcP+Eywo3wQBZI6qRrUI5bJlAPQRwV4Fc5rcR
	j9+dD7cEDrty7Q2u6UBMpO76bWrCAXPE1PomUA4DXPABIeMxu1cs4FhxpeF1gf3Gnyrh9fpdz81
	CA8K/AAn8n0+9qwCUepJBU+EHjx9CV/VKXr6P1mKJAHwq0VHBXg8+x26IyrBkhMHF/NS9kx6jVl
	FJPt6nGCV6mfV7y72jtUymB+1+7WZwnxI5SC2BlQElGkh+GXNclzFpx3w6AncnLgr1IUmnPyy6W
	RP4MESwxw/7Id
X-Google-Smtp-Source: AGHT+IEQO5suXbgyXnkPkrxVt1G0CkB+8JmFSLgsfHHI7Ot/c9+tqbdVP+lLF/bNZJgfem79Bdi6dNBrYIDsMcRyWQc=
X-Received: by 2002:a05:690e:1511:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-6466a8aa7c2mr26971170d50.41.1767160890912; Tue, 30 Dec 2025
 22:01:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767143616.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1767143616.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Dec 2025 22:01:04 -0800
X-Gm-Features: AQt7F2rkkiNaDOJxCFICGSuY4BAcXGZ-YM23mfV1lvqV8DhlIWJRUXSV8zBOqrA
Message-ID: <CAMKF1sqf-5+b6oK3dXuJhvrvUBFatxtvkzt+eR=jFrtRuHSLKQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/19] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029f12406473935af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 06:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123040

--00000000000029f12406473935af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now thanks Anuj

On Tue, Dec 30, 2025 at 5:19=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested on autobuilder and
> locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1211
>
> The following changes since commit
> e76bf51a92b41d4cb185fc164ae43a863910ccd1:
>
>   redis: Refine CVE-2022-0543 status description (2025-12-22 07:49:04
> +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> Ankur Tyagi (6):
>   cups-filters: patch CVE-2025-64524
>   freerdp3: patch CVE-2025-68118
>   dovecot: upgrade 2.3.21 -> 2.3.21.1
>   libiec61850: patch CVE-2024-45969
>   libcoap: ignore CVE-2023-51847
>   libcoap: patch CVE-2025-59391
>
> Gyorgy Sarvari (9):
>   accountservice: ignore CVE-2023-3297
>   minio: ignore irrelevant CVEs
>   fio: ignore CVE-2025-10824
>   postgresql: upgrade 16.10 -> 16.11
>   sngrep: upgrade 1.8.1 -> 1.8.2
>   libcoap: ignore CVE-2025-50518
>   wolfssl: patch CVE-2025-7395
>   zabbix: patch CVE-2025-49643
>   atop: patch CVE-2025-31160
>
> Hitendra Prajapati (1):
>   krb5: fix for CVE-2024-3596
>
> Jason Schonberg (1):
>   Add missing HOMEPAGEs to xfce recipes
>
> Peter Marko (1):
>   libmemcached: ignore CVE-2023-27478
>
> Vrushti Dabhi (1):
>   p7zip 16.02: Fix CVE-2022-47069
>
>  .../accountsservice_22.08.8.bb                |   2 +
>  .../libiec61850/files/CVE-2024-45969.patch    |  32 +
>  .../libiec61850/libiec61850_1.5.3.bb          |   1 +
>  .../wolfssl/files/CVE-2025-7395-1.patch       |  84 +++
>  .../wolfssl/files/CVE-2025-7395-2.patch       |  27 +
>  .../wolfssl/files/CVE-2025-7395-3.patch       |  25 +
>  .../wolfssl/wolfssl_5.7.2.bb                  |  10 +-
>  .../libcoap/libcoap/CVE-2025-59391.patch      |  88 +++
>  .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   4 +
>  ...{dovecot_2.3.21.bb =3D> dovecot_2.3.21.1.bb} |   2 +-
>  .../libmemcached/libmemcached_1.0.18.bb       |   2 +
>  .../{sngrep_1.8.1.bb =3D> sngrep_1.8.2.bb}      |   2 +-
>  meta-oe/recipes-benchmark/fio/fio_3.36.bb     |   2 +
>  .../krb5/krb5/CVE-2024-3596.patch             | 628 ++++++++++++++++++
>  .../recipes-connectivity/krb5/krb5_1.21.3.bb  |   1 +
>  .../zabbix/zabbix/CVE-2025-49643.patch        |  38 ++
>  .../zabbix/zabbix_6.2.9.bb                    |   1 +
>  ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
>  ...ostgresql_16.10.bb =3D> postgresql_16.11.bb} |   4 +-
>  meta-oe/recipes-extended/minio/minio_git.bb   |   6 +
>  .../p7zip/files/CVE-2022-47069.patch          |  63 ++
>  meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   1 +
>  .../cups/cups-filters/CVE-2025-64524.patch    |  81 +++
>  .../cups/cups-filters_2.0.0.bb                |   1 +
>  .../atop/atop/CVE-2025-31160.patch            | 607 +++++++++++++++++
>  meta-oe/recipes-support/atop/atop_2.4.0.bb    |   1 +
>  .../freerdp/freerdp3/CVE-2025-68118.patch     |  57 ++
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
>  meta-xfce/recipes-xfce/exo/exo_4.19.0.bb      |   1 +
>  .../recipes-xfce/garcon/garcon_4.19.0.bb      |   1 +
>  .../thunar-volman/thunar-volman_4.18.0.bb     |   1 +
>  .../recipes-xfce/tumbler/tumbler_4.18.0.bb    |   1 +
>  .../xfce4-appfinder/xfce4-appfinder_4.19.1.bb |   1 +
>  .../xfce4-panel/xfce4-panel_4.18.3.bb         |   1 +
>  .../xfce4-session/xfce4-session_4.18.2.bb     |   1 +
>  .../xfce4-settings/xfce4-settings_4.18.2.bb   |   1 +
>  .../recipes-xfce/xfconf/xfconf_4.18.0.bb      |   1 +
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |   1 +
>  38 files changed, 1774 insertions(+), 9 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2024-45969.pat=
ch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
>  create mode 100644
> meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch
>  rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.bb =3D>
> dovecot_2.3.21.1.bb} (97%)
>  rename meta-networking/recipes-support/sngrep/{sngrep_1.8.1.bb =3D>
> sngrep_1.8.2.bb} (95%)
>  create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-3596.patch
>  create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2025-49643.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.10.bb =3D>
> postgresql_16.11.bb} (66%)
>  create mode 100644
> meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
>  create mode 100644
> meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
>  create mode 100644 meta-oe/recipes-support/atop/atop/CVE-2025-31160.patc=
h
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-68118.patch
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123039):
> https://lists.openembedded.org/g/openembedded-devel/message/123039
> Mute This Topic: https://lists.openembedded.org/mt/117006582/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000029f12406473935af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now thanks Anuj</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 30=
, 2025 at 5:19=E2=80=AFPM Anuj Mittal via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss=
.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Please merge these changes in scarthgap. Tested on autobuilder and<br>
locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1211" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1211</a><br>
<br>
The following changes since commit e76bf51a92b41d4cb185fc164ae43a863910ccd1=
:<br>
<br>
=C2=A0 redis: Refine CVE-2022-0543 status description (2025-12-22 07:49:04 =
+0530)<br>
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
Ankur Tyagi (6):<br>
=C2=A0 cups-filters: patch CVE-2025-64524<br>
=C2=A0 freerdp3: patch CVE-2025-68118<br>
=C2=A0 dovecot: upgrade 2.3.21 -&gt; 2.3.21.1<br>
=C2=A0 libiec61850: patch CVE-2024-45969<br>
=C2=A0 libcoap: ignore CVE-2023-51847<br>
=C2=A0 libcoap: patch CVE-2025-59391<br>
<br>
Gyorgy Sarvari (9):<br>
=C2=A0 accountservice: ignore CVE-2023-3297<br>
=C2=A0 minio: ignore irrelevant CVEs<br>
=C2=A0 fio: ignore CVE-2025-10824<br>
=C2=A0 postgresql: upgrade 16.10 -&gt; 16.11<br>
=C2=A0 sngrep: upgrade 1.8.1 -&gt; 1.8.2<br>
=C2=A0 libcoap: ignore CVE-2025-50518<br>
=C2=A0 wolfssl: patch CVE-2025-7395<br>
=C2=A0 zabbix: patch CVE-2025-49643<br>
=C2=A0 atop: patch CVE-2025-31160<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0 krb5: fix for CVE-2024-3596<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 Add missing HOMEPAGEs to xfce recipes<br>
<br>
Peter Marko (1):<br>
=C2=A0 libmemcached: ignore CVE-2023-27478<br>
<br>
Vrushti Dabhi (1):<br>
=C2=A0 p7zip 16.02: Fix CVE-2022-47069<br>
<br>
=C2=A0.../<a href=3D"http://accountsservice_22.08.8.bb" rel=3D"noreferrer" =
target=3D"_blank">accountsservice_22.08.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../libiec61850/files/CVE-2024-45969.patch=C2=A0 =C2=A0 |=C2=A0 32 +<=
br>
=C2=A0.../libiec61850/<a href=3D"http://libiec61850_1.5.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">libiec61850_1.5.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 84 +++<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 27 +<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 25 +<br>
=C2=A0.../wolfssl/<a href=3D"http://wolfssl_5.7.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">wolfssl_5.7.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../libcoap/libcoap/CVE-2025-59391.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
88 +++<br>
=C2=A0.../recipes-devtools/libcoap/<a href=3D"http://libcoap_4.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libcoap_4.3.4.bb</a> |=C2=A0 =C2=A04 +<br=
>
=C2=A0...{<a href=3D"http://dovecot_2.3.21.bb" rel=3D"noreferrer" target=3D=
"_blank">dovecot_2.3.21.bb</a> =3D&gt; <a href=3D"http://dovecot_2.3.21.1.b=
b" rel=3D"noreferrer" target=3D"_blank">dovecot_2.3.21.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../libmemcached/<a href=3D"http://libmemcached_1.0.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">libmemcached_1.0.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../{<a href=3D"http://sngrep_1.8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">sngrep_1.8.1.bb</a> =3D&gt; <a href=3D"http://sngrep_1.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sngrep_1.8.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-benchmark/fio/<a href=3D"http://fio_3.36.bb" rel=3D"n=
oreferrer" target=3D"_blank">fio_3.36.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../krb5/krb5/CVE-2024-3596.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 628 ++++++++++++++++++<br>
=C2=A0.../recipes-connectivity/krb5/<a href=3D"http://krb5_1.21.3.bb" rel=
=3D"noreferrer" target=3D"_blank">krb5_1.21.3.bb</a>=C2=A0 |=C2=A0 =C2=A01 =
+<br>
=C2=A0.../zabbix/zabbix/CVE-2025-49643.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 38 ++<br>
=C2=A0.../zabbix/<a href=3D"http://zabbix_6.2.9.bb" rel=3D"noreferrer" targ=
et=3D"_blank">zabbix_6.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ostgresql_16.10.bb" rel=3D"noreferrer" target=3D=
"_blank">ostgresql_16.10.bb</a> =3D&gt; <a href=3D"http://postgresql_16.11.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.11.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0meta-oe/recipes-extended/minio/<a href=3D"http://minio_git.bb" rel=3D=
"noreferrer" target=3D"_blank">minio_git.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A06=
 +<br>
=C2=A0.../p7zip/files/CVE-2022-47069.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 63 ++<br>
=C2=A0meta-oe/recipes-extended/p7zip/<a href=3D"http://p7zip_16.02.bb" rel=
=3D"noreferrer" target=3D"_blank">p7zip_16.02.bb</a> |=C2=A0 =C2=A01 +<br>
=C2=A0.../cups/cups-filters/CVE-2025-64524.patch=C2=A0 =C2=A0 |=C2=A0 81 ++=
+<br>
=C2=A0.../cups/<a href=3D"http://cups-filters_2.0.0.bb" rel=3D"noreferrer" =
target=3D"_blank">cups-filters_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../atop/atop/CVE-2025-31160.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 607 +++++++++++++++++<br>
=C2=A0meta-oe/recipes-support/atop/<a href=3D"http://atop_2.4.0.bb" rel=3D"=
noreferrer" target=3D"_blank">atop_2.4.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2025-68118.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
57 ++<br>
=C2=A0.../recipes-support/freerdp/<a href=3D"http://freerdp3_3.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">freerdp3_3.4.0.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.19.0.bb" rel=3D"no=
referrer" target=3D"_blank">exo_4.19.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../recipes-xfce/garcon/<a href=3D"http://garcon_4.19.0.bb" rel=3D"no=
referrer" target=3D"_blank">garcon_4.19.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../thunar-volman/<a href=3D"http://thunar-volman_4.18.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">thunar-volman_4.18.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-xfce/tumbler/<a href=3D"http://tumbler_4.18.0.bb" rel=3D"=
noreferrer" target=3D"_blank">tumbler_4.18.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../xfce4-appfinder/<a href=3D"http://xfce4-appfinder_4.19.1.bb" rel=
=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.19.1.bb</a> |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../xfce4-panel/<a href=3D"http://xfce4-panel_4.18.3.bb" rel=3D"noref=
errer" target=3D"_blank">xfce4-panel_4.18.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../xfce4-session/<a href=3D"http://xfce4-session_4.18.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">xfce4-session_4.18.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../xfce4-settings/<a href=3D"http://xfce4-settings_4.18.2.bb" rel=3D=
"noreferrer" target=3D"_blank">xfce4-settings_4.18.2.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-xfce/xfconf/<a href=3D"http://xfconf_4.18.0.bb" rel=3D"no=
referrer" target=3D"_blank">xfconf_4.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xfwm4_4.18.0.bb</a>=C2=A0 |=C2=A0 =C2=A01=
 +<br>
=C2=A038 files changed, 1774 insertions(+), 9 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2024-45969.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/C=
VE-2025-59391.patch<br>
=C2=A0rename meta-networking/recipes-support/dovecot/{<a href=3D"http://dov=
ecot_2.3.21.bb" rel=3D"noreferrer" target=3D"_blank">dovecot_2.3.21.bb</a> =
=3D&gt; <a href=3D"http://dovecot_2.3.21.1.bb" rel=3D"noreferrer" target=3D=
"_blank">dovecot_2.3.21.1.bb</a>} (97%)<br>
=C2=A0rename meta-networking/recipes-support/sngrep/{<a href=3D"http://sngr=
ep_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">sngrep_1.8.1.bb</a> =3D&g=
t; <a href=3D"http://sngrep_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">=
sngrep_1.8.2.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-35=
96.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-202=
5-49643.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
6.10.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.10.bb</a> =3D&g=
t; <a href=3D"http://postgresql_16.11.bb" rel=3D"noreferrer" target=3D"_bla=
nk">postgresql_16.11.bb</a>} (66%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2022-4706=
9.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-202=
5-64524.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/atop/atop/CVE-2025-31160.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2025-=
68118.patch<br>
<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123039): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123039" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123039</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117006582/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117006582/1997914</a><br>
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

--00000000000029f12406473935af--

