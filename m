Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB9E677E1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 15:04:12 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81604.1766415852367763885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 07:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P3HQFxXS;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64455a2a096so3147494d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 07:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766415851; x=1767020651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D+CobioisDnnwr9AEOLa3yqs7v5LuxWWlyRTt8lQSRc=;
        b=P3HQFxXSrtiAu4amZ7MDmjVdTRp/M8OyRVtCe6Uc4etqP0GxzM/fWajyI+QiL7St56
         68lemH9+COhYBUew7a2bA93p+SWaEe14RFU0uMvPEAOWRGDlOs6ruhUadkLAMuWGvF8O
         zp1vtXY1AY/S/oe21ePXnnn1KLbCKgfHoXhmgu31/fyuBi7qFHimqawLuFfGxpvmfruB
         x0BXeV4SEvsMc5z2QyPto46rvCKeX45MTRipTwO0paCtXJl2D4Mv8KJepq7929tnZotU
         mx0YGN/46ZpBvd0ejQ5zJOlXkQFewkbrauX8LHYyMNryiXCFNPp8uSqurpgcYwfbrWkn
         XBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415851; x=1767020651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+CobioisDnnwr9AEOLa3yqs7v5LuxWWlyRTt8lQSRc=;
        b=K1UOCxPP9Ep18/yjYst2rUhAloMhyE1CYsZVckFIedLB+Slg9d0hlXof/phU+x2tSF
         Fc4J4QHxi3TaAEsN3yzRtWT1Mu667ZsU0oRF+2iLGm+naD7Qj8jaFbilzoDaFkcDO1gZ
         tlnylpkDWN2P6o1Enmg6OgucTLzpb16faY54KQoShHBiZT7kGjwNnKhQA/t6h6cn7YLw
         0MP5gEM1L2rLICdNCNg8aRHAwuIgzkHfaxJ/rDBodCxiNPgAmaLdf7QTXAKM06+t5fqo
         ApSGdG6UZtzHV8PxbaNCa+rVUNlyvuuwbH6N1OW88AaY5Qv0VBHCOui6XZEW6Vxl0Nq6
         rbBg==
X-Gm-Message-State: AOJu0Yx83179KvzJi5/9YpEaQ1SvQiNht0VkRHwzQfK8H+q7iLsDX00l
	fXqg2UQc1xb3rx5LJ87zC/IF9UbqZgihemm00kYPDL7KQ4713ZKVC3wnkXiWw/5yFV+y0sa/Tdv
	tJABfQ1sGqZ8AUWuHsBh2gB4uqrVBYByIJidY
X-Gm-Gg: AY/fxX5peDhjMQajsYEIkqMJbp0CTYKNbzVZ7jV8UaaJVxXoHrgFPLq4vn9KK5q0XEd
	bM/uQ1q9zTL2l6N7VqolijBelYmxLcpRU1oIWBjZoUe1QtAYHVZa4n3xAbQ6vcr4Ov31qJI12Wh
	0SwXRBxPnqjbYWxYK8axzFeFu30S5NxEBfZk0qKTuAdSbTCBxMe+dM1VIayKt3xgrfV02zTZAEQ
	olEVDWTqcUJjKmxz5mbFh7t1Adl1XNeEPSjpehNnRLTp2zIF5vDGK7FsH/ZZfi7TVi2tXd+Qqmo
	da6/Q416ZPyu5va0gVyMWj2dSjUG9XqECBTyFicr3KTF3++3vGQ74YBVrsiuboYvoDaIQ8ehbhb
	Uf++4oY8WPzI=
X-Google-Smtp-Source: AGHT+IEkH1y02qzsJmGKL+sdfnFrE0wK55BYjbJYnWt8b3ESFD+u323C24yQbUx2q1oacm5VSd68VB01YkAx145qABY=
X-Received: by 2002:a05:690c:46c7:b0:788:e74:b267 with SMTP id
 00721157ae682-78fb40cb48cmr194440577b3.65.1766415851086; Mon, 22 Dec 2025
 07:04:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766372942.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1766372942.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Dec 2025 07:03:44 -0800
X-Gm-Features: AQt7F2ojLU3ecL_lEXpfyevO-l6ortVrbMYY_yV13TS9oWS3biaqAWVKyAKKr1k
Message-ID: <CAMKF1spcC0KDtsbP2NAoJ698Q+bZvxo=urnAPueKZHn58JzR9g@mail.gmail.com>
Subject: Re: [PATCH 00/13] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005465d306468bbd4d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 15:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122790

--0000000000005465d306468bbd4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good, Merged now
Thanks Anuj

On Sun, Dec 21, 2025 at 10:53=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualc=
omm.com>
wrote:

> Please merge these changes in scarthgap. Tested on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1196
>
> The following changes since commit
> b4812b18eec77e9f0286bd6b81a5c3032ac0d3be:
>
>   proftpd: Fix CVE-2023-48795 (2025-12-11 08:02:03 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> Ankur Tyagi (10):
>   jasper: patch CVE-2024-31744
>   libcupsfilters: patch CVE-2025-57812
>   flatpak: patch CVE-2024-42472
>   editorconfig-core-c: patch CVE-2024-53849
>   civetweb: patch CVE-2025-9648
>   fetchmail: patch CVE-2025-61962
>   unbound: patch CVE-2024-43167
>   unbound: patch CVE-2024-43168
>   openvpn: patch CVE-2025-13086
>   openh264: patch CVE-2025-27091
>
> Archana Polampalli (1):
>   tcpreplay: fix CVE-2025-9157
>
> Deepak Rathore (1):
>   redis: Refine CVE-2022-0543 status description
>
> Kai Kang (1):
>   mbedtls: fix CVE-2025-47917
>
>  .../openh264/openh264/CVE-2025-27091.patch    |  28 ++
>  .../openh264/openh264_2.3.1.bb                |   1 +
>  .../civetweb/civetweb/CVE-2025-9648.patch     | 254 ++++++++++++++++++
>  .../civetweb/civetweb_1.16.bb                 |   1 +
>  .../mbedtls/mbedtls/CVE-2025-47917.patch      |  52 ++++
>  .../mbedtls/mbedtls_2.28.10.bb                |   1 +
>  .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++
>  .../fetchmail/fetchmail_6.4.38.bb             |   1 +
>  .../openvpn/openvpn/CVE-2025-13086.patch      | 157 +++++++++++
>  .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
>  .../tcpreplay/tcpreplay/CVE-2025-9157.patch   |  44 +++
>  .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
>  .../unbound/unbound/CVE-2024-43167.patch      |  46 ++++
>  .../unbound/unbound/CVE-2024-43168_1.patch    |  29 ++
>  .../unbound/unbound/CVE-2024-43168_2.patch    |  57 ++++
>  .../recipes-support/unbound/unbound_1.19.3.bb |   3 +
>  .../editorconfig-core-c_0.12.6.bb             |   5 +-
>  .../editorconfig/files/CVE-2024-53849_1.patch |  54 ++++
>  .../editorconfig/files/CVE-2024-53849_2.patch |  48 ++++
>  .../flatpak/flatpak/CVE-2024-42472_1.patch    | 169 ++++++++++++
>  .../flatpak/flatpak/CVE-2024-42472_2.patch    |  44 +++
>  .../flatpak/flatpak_1.15.8.bb                 |   2 +
>  .../recipes-extended/redis/redis_6.2.21.bb    |   7 +-
>  .../recipes-extended/redis/redis_7.2.12.bb    |   7 +-
>  .../jasper/jasper/0001-Fixes-381.patch        |  30 +++
>  .../recipes-graphics/jasper/jasper_4.1.2.bb   |   1 +
>  .../cups/libcupsfilters/CVE-2025-57812.patch  | 129 +++++++++
>  .../cups/libcupsfilters_2.0.0.bb              |   1 +
>  28 files changed, 1221 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
>  create mode 100644
> meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patc=
h
>  create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2025-47917.patch
>  create mode 100644
> meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch
>  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch
>  create mode 100644
> meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch
>  create mode 100644
> meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch
>  create mode 100644
> meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch
>  create mode 100644
> meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch
>  create mode 100644
> meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch
>  create mode 100644
> meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch
>
> --
> 2.52.0
>
>

--0000000000005465d306468bbd4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good, Merged now<div>Thanks Anuj</div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Dec 21, 2025 at 10:53=E2=80=AFPM Anuj Mittal &lt;<a href=3D=
"mailto:anuj.mittal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please me=
rge these changes in scarthgap. Tested on AB and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1196" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1196</a><br>
<br>
The following changes since commit b4812b18eec77e9f0286bd6b81a5c3032ac0d3be=
:<br>
<br>
=C2=A0 proftpd: Fix CVE-2023-48795 (2025-12-11 08:02:03 +0530)<br>
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
Ankur Tyagi (10):<br>
=C2=A0 jasper: patch CVE-2024-31744<br>
=C2=A0 libcupsfilters: patch CVE-2025-57812<br>
=C2=A0 flatpak: patch CVE-2024-42472<br>
=C2=A0 editorconfig-core-c: patch CVE-2024-53849<br>
=C2=A0 civetweb: patch CVE-2025-9648<br>
=C2=A0 fetchmail: patch CVE-2025-61962<br>
=C2=A0 unbound: patch CVE-2024-43167<br>
=C2=A0 unbound: patch CVE-2024-43168<br>
=C2=A0 openvpn: patch CVE-2025-13086<br>
=C2=A0 openh264: patch CVE-2025-27091<br>
<br>
Archana Polampalli (1):<br>
=C2=A0 tcpreplay: fix CVE-2025-9157<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 redis: Refine CVE-2022-0543 status description<br>
<br>
Kai Kang (1):<br>
=C2=A0 mbedtls: fix CVE-2025-47917<br>
<br>
=C2=A0.../openh264/openh264/CVE-2025-27091.patch=C2=A0 =C2=A0 |=C2=A0 28 ++=
<br>
=C2=A0.../openh264/<a href=3D"http://openh264_2.3.1.bb" rel=3D"noreferrer" =
target=3D"_blank">openh264_2.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../civetweb/civetweb/CVE-2025-9648.patch=C2=A0 =C2=A0 =C2=A0| 254 ++=
++++++++++++++++<br>
=C2=A0.../civetweb/<a href=3D"http://civetweb_1.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">civetweb_1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../mbedtls/mbedtls/CVE-2025-47917.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
52 ++++<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" =
target=3D"_blank">mbedtls_2.28.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../fetchmail/fetchmail/CVE-2025-61962.patch=C2=A0 |=C2=A0 51 ++++<br=
>
=C2=A0.../fetchmail/<a href=3D"http://fetchmail_6.4.38.bb" rel=3D"noreferre=
r" target=3D"_blank">fetchmail_6.4.38.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../openvpn/openvpn/CVE-2025-13086.patch=C2=A0 =C2=A0 =C2=A0 | 157 ++=
+++++++++<br>
=C2=A0.../recipes-support/openvpn/<a href=3D"http://openvpn_2.6.14.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.6.14.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../tcpreplay/tcpreplay/CVE-2025-9157.patch=C2=A0 =C2=A0|=C2=A0 44 ++=
+<br>
=C2=A0.../tcpreplay/<a href=3D"http://tcpreplay_4.4.4.bb" rel=3D"noreferrer=
" target=3D"_blank">tcpreplay_4.4.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../unbound/unbound/CVE-2024-43167.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 ++++<br>
=C2=A0.../unbound/unbound/CVE-2024-43168_1.patch=C2=A0 =C2=A0 |=C2=A0 29 ++=
<br>
=C2=A0.../unbound/unbound/CVE-2024-43168_2.patch=C2=A0 =C2=A0 |=C2=A0 57 ++=
++<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.19.3.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.19.3.bb</a> |=C2=A0 =C2=A03 +<b=
r>
=C2=A0.../<a href=3D"http://editorconfig-core-c_0.12.6.bb" rel=3D"noreferre=
r" target=3D"_blank">editorconfig-core-c_0.12.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0.../editorconfig/files/CVE-2024-53849_1.patch |=C2=A0 54 ++++<br>
=C2=A0.../editorconfig/files/CVE-2024-53849_2.patch |=C2=A0 48 ++++<br>
=C2=A0.../flatpak/flatpak/CVE-2024-42472_1.patch=C2=A0 =C2=A0 | 169 +++++++=
+++++<br>
=C2=A0.../flatpak/flatpak/CVE-2024-42472_2.patch=C2=A0 =C2=A0 |=C2=A0 44 ++=
+<br>
=C2=A0.../flatpak/<a href=3D"http://flatpak_1.15.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">flatpak_1.15.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-extended/redis/<a href=3D"http://redis_6.2.21.bb" rel=3D"=
noreferrer" target=3D"_blank">redis_6.2.21.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0.../recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=3D"=
noreferrer" target=3D"_blank">redis_7.2.12.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A07 +-<br>
=C2=A0.../jasper/jasper/0001-Fixes-381.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 30 +++<br>
=C2=A0.../recipes-graphics/jasper/<a href=3D"http://jasper_4.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">jasper_4.1.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../cups/libcupsfilters/CVE-2025-57812.patch=C2=A0 | 129 +++++++++<br=
>
=C2=A0.../cups/<a href=3D"http://libcupsfilters_2.0.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libcupsfilters_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A028 files changed, 1221 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh2=
64/CVE-2025-27091.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/civetweb/cive=
tweb/CVE-2025-9648.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedt=
ls/CVE-2025-47917.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/fetchmail/fetchmai=
l/CVE-2025-61962.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2025-13086.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-9157.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2024-43167.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2024-43168_1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2024-43168_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-20=
24-53849_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-20=
24-53849_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-=
42472_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-=
42472_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-=
381.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2=
025-57812.patch<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000005465d306468bbd4d--

