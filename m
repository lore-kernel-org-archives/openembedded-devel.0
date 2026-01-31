Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9372D79759
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 08:03:56 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5207.1769846626659670345
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 00:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtDP1v6v;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7948e902fadso26687617b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 00:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769846626; cv=none;
        d=google.com; s=arc-20240605;
        b=YfedDR3iGFq+g7sRcWkKEV5HPBcaX+Tb/sHa3Ba/6FaLLdlqlV6pmFeeF1rTIonlN4
         OP9TspMIyIiSxgrN3N6UcdrUVuPG+4c2R8nriVpVWMIVfhGjfdTzhlUHI9+Mkg+W4mJz
         lNkjRFS6i/dx4+OT14fbtS95glmkOQY0yoUnkfyo9bkds+s6mZwdEBvOWFHMHVfSIyHO
         VJaRJWcaEK/Iwrj++mkwlYCUNNNJfKqKhq7oKKe8eUvxstKVqjB+b6VTi8S8oVeab5mh
         dZgIqC4xXCut+ztH90jiTH34raVy4CpCAry+AvhTv9lxicFHXn3gTItgC/gqwKFb6BmI
         H4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vzLmEWHMJKijmK4Q/7StTN9XiE2JD+vbj/e9qdQyNjA=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=GHe2M7j3+YVKKydED8ZOqcvJbvpp1M5q3Bb2ZqcdjKlXbTuOibs9sQzPTUdIgsLD35
         cOmAr2kPbhp9pxsTMRzXVdAXZXbVkEzStCKu3EQcDk0HplbCBq+FOQrCtLRN8WPKgAMq
         +vy51EEaI4KVMCxhaa3DSjl7+bv29JTV22k/4AdwxMKOdBXVVQtphuG0MFh1lGwHOAHe
         HZxbRn7QBP8Hw8XEMmZpfODSXYe5HsK8Iv1/KftovIT/GuemZaQdrlCySJdFmkwameTU
         wanNNl1n6mpnYSP9xxE3Ah44T+mNcrw98FLIRetihtN+ZUp7dKDrdfpDE94CucxjYI0a
         C0tQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769846626; x=1770451426; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vzLmEWHMJKijmK4Q/7StTN9XiE2JD+vbj/e9qdQyNjA=;
        b=CtDP1v6vCDZB9RI3cE2zLEHsSbtv4ZchN7qrWAJGeSrS3PEJOez/ZXzshKTNCh3GFN
         EaUw9K7OoS0GoNiny9lf1PRXFt69TYDsKnF14f7+fzoMOXWyOad4S4pVc9ifdTCRexnL
         YN8/KaGcf/7ShVB4b/fLpzNvdmN8OGs68Eh9Zb0rjKF/4QD58XV+3YAnNZRo2T8aLQGy
         4oP6FKq/7iCPQxupTdW7NiLqRwdtTfPDIUOTmN2nQXgj6iWQg+zYrQv4dz4+cPlzdxiG
         GS60u6feWKP4EgfKp9qEPRtl0L6VmOJ7VkTqtzVF96zKFBZzOD9c9MwUmRtOUBzyXJxE
         nfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846626; x=1770451426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzLmEWHMJKijmK4Q/7StTN9XiE2JD+vbj/e9qdQyNjA=;
        b=xF+2DLMoShRgOeI5J/gc+EK4UsBD6BDp5447iO37oNw2kLKzcl7PnMzjVISpMJbQhi
         n0RQou9fzbR5goqSr2ubfub2qW+8/jj6S16VDazHIKmVm7qKt05RamyuwqkhGk5MgSXT
         9Txo4dwwiWt051RNGCiyFAfhm8l4SefBSoqcMCI8ixWLZs8IS/s1SoaNgoA6G1pjwfB4
         Lk3VjsaDQ0Kobn2YTxkotv2TlCugBICaHgpmzreG3x1B2C/KkAOPmFYvFKX2QFEk3HuY
         wVOQxKYcENAl4pj0ImYApqeJ4ultGx0CHccBUnRo7NL44btIXri3MUCVyXkcPKr8KuQ0
         y0pA==
X-Gm-Message-State: AOJu0YxHg1BW/5AcJa/NdfBHJ9cnMJ964tPWNDN8ReTxUCL4yZZ60ZTA
	1ps9gmIG+bwP4UChRntBrzcjwjSItaiiDntBtvCsZzi0Oc8SErJOdspU31jwHkWnqnXHO8w7och
	xVgU4HNofpb+Q/jP6q4oA8BQ42AfDaEw=
X-Gm-Gg: AZuq6aJ4m1rWEFXrZh14wVqatfMmud22d5VXsJU6Phb9J7ZWba29hDR6U3CE5npUr2U
	NBENrun8Ug0Y+QQ5rgX8VMjNqb8li/ZuoXo6YzA+VWmUQR8XEROx1mZ0diEGecrc0Q/LY6NIUo4
	83g/OHQP8xi8owHVu0kJXZMBNOYkKV/sHv0dZ+MDG5BzEpH8nxEPWl3xQ7wzP2vrQtynRgJxw70
	lfxyk1dvfB7ksCgTkIrt3qU7pWT+al9JQzqgZ9mtB2FpDeodHW3ageVzDzcc0ascZlvGyB/6vEB
	ZlvgCVP0+PstcvDt4q7UaOhBG4xnH8uKF3d6Du0wsDNO1oMHCtrMIXgr+BZJGlObY9Iwp6C+Ml3
	Yca4Zagh3BnRcqv825KwxmJgU7/k=
X-Received: by 2002:a05:690c:387:b0:789:2be7:aec3 with SMTP id
 00721157ae682-7949df9a499mr46350967b3.35.1769846625583; Sat, 31 Jan 2026
 00:03:45 -0800 (PST)
MIME-Version: 1.0
References: <188E348B7689C3BC.3837557@lists.openembedded.org> <CA+s=J=xZcs=m0hQQCx9zhu7VBOkp=t-ZCXL35nUyNvwCb-BKLw@mail.gmail.com>
In-Reply-To: <CA+s=J=xZcs=m0hQQCx9zhu7VBOkp=t-ZCXL35nUyNvwCb-BKLw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Jan 2026 00:03:19 -0800
X-Gm-Features: AZwV_QiCEdr6MegbyJ1IN48UOCNUuEYrSloooDmtfDi9TTHooCvz6ACqTvxAY48
Message-ID: <CAMKF1sqv0gTJcqzp0gVqJvVL4OMW797Ew5pJHvdmMZkz0YPHeQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/18] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006cc6750649aa87dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 08:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124018

--0000000000006cc6750649aa87dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks Anuj, it is merged now.

On Fri, Jan 30, 2026 at 11:59=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualc=
omm.com>
wrote:

> Hi Khem
>
> Can you please merge this pull request if it looks good?
>
> On Mon, Jan 26, 2026 at 2:37=E2=80=AFPM Anuj Mittal via lists.openembedde=
d.org
> <anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Please merge these changes in scarthgap. Tested locally and on
> > autobuilder.
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1269
> >
> > The following changes since commit
> 2759d8870ea387b76c902070bed8a6649ff47b56:
> >
> >   php 8.2.29: CVE-2025-14177 (2026-01-19 12:15:49 +0530)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthga=
p
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
> >
> > Ankur Tyagi (3):
> >   python3-aiohttp: patch CVE-2025-53643
> >   python3-cbor2: patch CVE-2025-68131
> >   python3-twisted: patch CVE-2024-41810
> >
> > Archana Polampalli (1):
> >   tcpreplay: fix CVE-2025-51006
> >
> > Gyorgy Sarvari (12):
> >   python3-django: upgrade 4.2.20 -> 4.2.27
> >   redis: ignore CVE-2025-46686
> >   strongswan: patch CVE-2025-62291
> >   python3-flask-cors: upgrade 4.0.0 -> 4.0.2
> >   python3-waitress: upgrade 3.0.0 -> 3.0.2
> >   python3-twitter: mark CVE-2012-5825 patched
> >   python3-m2crypto: ignore CVE-2009-0127
> >   python3-m2crypto: mark CVE-2020-25657 as patched
> >   openvpn: ignore CVE-2025-13751
> >   acpitool: update SRC_URI
> >   xerces-c: set CVE_PRODUCT
> >   gnome-keyring: set CVE_PRODUCT
> >
> > Joao Marcos Costa (1):
> >   linuxptp: add missing prefix to CVE ID
> >
> > Peter Marko (1):
> >   libmad: ignore CVE-2017-11552 and CVE-2018-7263
> >
> >  .../gnome-keyring/gnome-keyring_46.1.bb       |   2 +
> >  .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
> >  .../strongswan/CVE-2025-62291.patch           |  45 ++
> >  .../strongswan/strongswan_5.9.14.bb           |   3 +-
> >  .../tcpreplay/tcpreplay/CVE-2025-51006.patch  |  97 ++++
> >  .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
> >  .../recipes-bsp/acpitool/acpitool_0.5.1.bb    |   3 +-
> >  .../linuxptp/linuxptp_4.1.bb                  |   2 +-
> >  .../xerces-c/xerces-c_3.2.5.bb                |   2 +
> >  .../recipes-extended/redis/redis_6.2.21.bb    |   2 +
> >  .../recipes-extended/redis/redis_7.2.12.bb    |   2 +
> >  .../libmad/libmad_0.15.1b.bb                  |   3 +
> >  .../python3-aiohttp/CVE-2025-53643.patch      | 192 +++++++
> >  .../python/python3-aiohttp_3.9.5.bb           |   4 +-
> >  .../python/python3-cbor2/CVE-2025-68131.patch | 517 ++++++++++++++++++
> >  .../python/python3-cbor2_5.6.4.bb             |   1 +
> >  .../0001-lower-setuptools-requirements.patch  |  25 +
> >  ...ngo_4.2.20.bb =3D> python3-django_4.2.27.bb} |   9 +-
> >  .../python3-flask-cors/CVE-2024-6221.patch    | 110 ----
> >  ...s_4.0.0.bb =3D> python3-flask-cors_4.0.2.bb} |   8 +-
> >  .../python/python3-m2crypto_0.40.1.bb         |   3 +
> >  ...-41671-0002.patch =3D> CVE-2024-41671.patch} |   4 +
> >  ...-41671-0001.patch =3D> CVE-2024-41810.patch} |   6 +-
> >  .../python/python3-twisted_24.3.0.bb          |   4 +-
> >  .../python/python3-twitter_4.14.0.bb          |   2 +
> >  ...ess_3.0.0.bb =3D> python3-waitress_3.0.2.bb} |   2 +-
> >  26 files changed, 922 insertions(+), 128 deletions(-)
> >  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patc=
h
> >  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setu=
ptools-requirements.patch
> >  rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb
> =3D> python3-django_4.2.27.bb} (44%)
> >  delete mode 100644
> meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patc=
h
> >  rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.b=
b
> =3D> python3-flask-cors_4.0.2.bb} (71%)
> >  rename
> meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0002.=
patch
> =3D> CVE-2024-41671.patch} (98%)
> >  rename
> meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0001.=
patch
> =3D> CVE-2024-41810.patch} (95%)
> >  rename meta-python/recipes-devtools/python/{python3-waitress_3.0.0.bb
> =3D> python3-waitress_3.0.2.bb} (82%)
> >
> > --
> > 2.52.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123858):
> https://lists.openembedded.org/g/openembedded-devel/message/123858
> > Mute This Topic: https://lists.openembedded.org/mt/117464430/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000006cc6750649aa87dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thanks Anuj, it is merged now.</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Jan 30, 2026 at 11:59=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.m=
ittal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Khem<br>
<br>
Can you please merge this pull request if it looks good?<br>
<br>
On Mon, Jan 26, 2026 at 2:37=E2=80=AFPM Anuj Mittal via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org=
" target=3D"_blank">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Please merge these changes in scarthgap. Tested locally and on<br>
&gt; autobuilder.<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81=
/builds/1269" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/81/builds/1269</a><br>
&gt;<br>
&gt; The following changes since commit 2759d8870ea387b76c902070bed8a6649ff=
47b56:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0php 8.2.29: CVE-2025-14177 (2026-01-19 12:15:49 +0530)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
meta-openembedded-contrib</a> anujm/scarthgap<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded-=
contrib/log/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">http=
s://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap=
</a><br>
&gt;<br>
&gt; Ankur Tyagi (3):<br>
&gt;=C2=A0 =C2=A0python3-aiohttp: patch CVE-2025-53643<br>
&gt;=C2=A0 =C2=A0python3-cbor2: patch CVE-2025-68131<br>
&gt;=C2=A0 =C2=A0python3-twisted: patch CVE-2024-41810<br>
&gt;<br>
&gt; Archana Polampalli (1):<br>
&gt;=C2=A0 =C2=A0tcpreplay: fix CVE-2025-51006<br>
&gt;<br>
&gt; Gyorgy Sarvari (12):<br>
&gt;=C2=A0 =C2=A0python3-django: upgrade 4.2.20 -&gt; 4.2.27<br>
&gt;=C2=A0 =C2=A0redis: ignore CVE-2025-46686<br>
&gt;=C2=A0 =C2=A0strongswan: patch CVE-2025-62291<br>
&gt;=C2=A0 =C2=A0python3-flask-cors: upgrade 4.0.0 -&gt; 4.0.2<br>
&gt;=C2=A0 =C2=A0python3-waitress: upgrade 3.0.0 -&gt; 3.0.2<br>
&gt;=C2=A0 =C2=A0python3-twitter: mark CVE-2012-5825 patched<br>
&gt;=C2=A0 =C2=A0python3-m2crypto: ignore CVE-2009-0127<br>
&gt;=C2=A0 =C2=A0python3-m2crypto: mark CVE-2020-25657 as patched<br>
&gt;=C2=A0 =C2=A0openvpn: ignore CVE-2025-13751<br>
&gt;=C2=A0 =C2=A0acpitool: update SRC_URI<br>
&gt;=C2=A0 =C2=A0xerces-c: set CVE_PRODUCT<br>
&gt;=C2=A0 =C2=A0gnome-keyring: set CVE_PRODUCT<br>
&gt;<br>
&gt; Joao Marcos Costa (1):<br>
&gt;=C2=A0 =C2=A0linuxptp: add missing prefix to CVE ID<br>
&gt;<br>
&gt; Peter Marko (1):<br>
&gt;=C2=A0 =C2=A0libmad: ignore CVE-2017-11552 and CVE-2018-7263<br>
&gt;<br>
&gt;=C2=A0 .../gnome-keyring/<a href=3D"http://gnome-keyring_46.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gnome-keyring_46.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../recipes-support/openvpn/<a href=3D"http://openvpn_2.6.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.14.bb</a> |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 .../strongswan/CVE-2025-62291.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 45 ++<br>
&gt;=C2=A0 .../strongswan/<a href=3D"http://strongswan_5.9.14.bb" rel=3D"no=
referrer" target=3D"_blank">strongswan_5.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 .../tcpreplay/tcpreplay/CVE-2025-51006.patch=C2=A0 |=C2=A0 97 ++=
++<br>
&gt;=C2=A0 .../tcpreplay/<a href=3D"http://tcpreplay_4.4.4.bb" rel=3D"noref=
errer" target=3D"_blank">tcpreplay_4.4.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../recipes-bsp/acpitool/<a href=3D"http://acpitool_0.5.1.bb" re=
l=3D"noreferrer" target=3D"_blank">acpitool_0.5.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 .../linuxptp/<a href=3D"http://linuxptp_4.1.bb" rel=3D"noreferre=
r" target=3D"_blank">linuxptp_4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../xerces-c/<a href=3D"http://xerces-c_3.2.5.bb" rel=3D"norefer=
rer" target=3D"_blank">xerces-c_3.2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../recipes-extended/redis/<a href=3D"http://redis_6.2.21.bb" re=
l=3D"noreferrer" target=3D"_blank">redis_6.2.21.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 .../recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" re=
l=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
&gt;=C2=A0 .../libmad/<a href=3D"http://libmad_0.15.1b.bb" rel=3D"noreferre=
r" target=3D"_blank">libmad_0.15.1b.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 .../python3-aiohttp/CVE-2025-53643.patch=C2=A0 =C2=A0 =C2=A0 | 1=
92 +++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-aiohttp_3.9.5.bb" rel=3D"no=
referrer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../python/python3-cbor2/CVE-2025-68131.patch | 517 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cbor2_5.6.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-cbor2_5.6.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../0001-lower-setuptools-requirements.patch=C2=A0 |=C2=A0 25 +<=
br>
&gt;=C2=A0 ...<a href=3D"http://ngo_4.2.20.bb" rel=3D"noreferrer" target=3D=
"_blank">ngo_4.2.20.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.27.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.27.bb</a>} |=C2=
=A0 =C2=A09 +-<br>
&gt;=C2=A0 .../python3-flask-cors/CVE-2024-6221.patch=C2=A0 =C2=A0 | 110 --=
--<br>
&gt;=C2=A0 ...<a href=3D"http://s_4.0.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">s_4.0.0.bb</a> =3D&gt; <a href=3D"http://python3-flask-cors_4.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-flask-cors_4.0.2.bb</a>} |=C2=
=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-m2crypto_0.40.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-m2crypto_0.40.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 ...-41671-0002.patch =3D&gt; CVE-2024-41671.patch} |=C2=A0 =C2=
=A04 +<br>
&gt;=C2=A0 ...-41671-0001.patch =3D&gt; CVE-2024-41810.patch} |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-twisted_24.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-twisted_24.3.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-twitter_4.14.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-twitter_4.14.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 ...<a href=3D"http://ess_3.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">ess_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-waitress_3.0.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-waitress_3.0.2.bb</a>} |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 26 files changed, 922 insertions(+), 128 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/strongswan/st=
rongswan/CVE-2025-62291.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/tcpreplay/tcp=
replay/CVE-2025-51006.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-a=
iohttp/CVE-2025-53643.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-c=
bor2/CVE-2025-68131.patch<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-d=
jango-4.2.27/0001-lower-setuptools-requirements.patch<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-django_4.2.20.bb" rel=3D"noreferrer" target=3D"_blank">python3-django=
_4.2.20.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.27.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-django_4.2.27.bb</a>} (44%)<br>
&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/python3-f=
lask-cors/CVE-2024-6221.patch<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-flask-cors_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fla=
sk-cors_4.0.0.bb</a> =3D&gt; <a href=3D"http://python3-flask-cors_4.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-flask-cors_4.0.2.bb</a>} (71%=
)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-=
2024-41671-0002.patch =3D&gt; CVE-2024-41671.patch} (98%)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-=
2024-41671-0001.patch =3D&gt; CVE-2024-41810.patch} (95%)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-waitress_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-waitr=
ess_3.0.0.bb</a> =3D&gt; <a href=3D"http://python3-waitress_3.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-waitress_3.0.2.bb</a>} (82%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.52.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#123858): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/123858" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/123858</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11746443=
0/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117464430/3616702</a><br>
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

--0000000000006cc6750649aa87dc--

