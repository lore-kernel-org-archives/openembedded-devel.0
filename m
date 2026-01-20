Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C162CCA5FAB
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:33:17 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10537.1768926790959437698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 08:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eL5bjDhj;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fc3572431so58400207b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 08:33:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768926790; cv=none;
        d=google.com; s=arc-20240605;
        b=a7JvRBMSpDUageojyp1YiSWijB3kJB/lBw6hiRI15ol9BzVtF3vSmB5K5Dc4o6VELw
         MYBGv129N2ba3r+sGZ+KlKluF3i4Ty17Nh6dzFjGmjr6ZeImtaazOMzu9UreWHmCQTPZ
         xYTYsktCClLIoMtDGbj6x45dtzPy9Sc9kqYh8kn3pAd+zbVLNY25McivXpi/Vhgjncci
         h3bS/PMyYuladIaWt/GUZM660RUO2hU9i6k76sZpmcJpOj8rWs1dhz7DdTPDMwE0X+/g
         fdA+ClqrL2/ej1yjzsm4Hd6mSLZ5BQcZym9urJwPzqBWwZlcNJTR0IWcRuMEY+7ILaOl
         Hpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WyE3tcZfHNIZA6FfIO4xIcHtsr3M8UPCuR8WEWvL50A=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=PXQCVF0cp9Ej2ozFxrilB0pBSCwC6snGZoj78IKnk0UpEqg5zElBCqb8hvpni6Ovae
         31cR/5lwE51OIR3hyX9wHzlVyweWz+kLAFA5C6ZBBEetIUiKL8Qs4r2vM+oCAYKCwfvo
         47zArBNATl71hLMPqyx/E/8ha3j1p9699IB2xB2jMzSv2mQappiB16PL/x1K8xbZIcLC
         Pt2BzvSvsxiIM68Oc+ntw6yz9PciSRt7rZvz6MGiQQ4Y1CAtBEPiyp7ss8wexhhXbm51
         mNkwBxRaR1vFJX/+CFQTt+oGw+SzHBxGMqpZuG4BfIQfRgEfSFYnVIbA+fRvliKPlWvz
         541A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768926790; x=1769531590; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyE3tcZfHNIZA6FfIO4xIcHtsr3M8UPCuR8WEWvL50A=;
        b=eL5bjDhj+3c302AumWzxfnYV5ORqinKj+4pxRQShun7njuw3BJxh3sBYOD/dflxn4W
         VYdOpU/TClhxsiEbfg+UDncDYeHTChBjnaEuEgwutxdsOPeMwKPTK3S4+BTLW+IFV4C7
         S8DV4eJq2Qa7IMVyF52Mk63Ua482EFx9fVKUINzzqy3Yxe5cIv41fqWdLCM5n7OzvYYw
         JLGym5Ss3n3KjddssGDkqXBrL0nLmcSuS1ozlDMhEmuuTFSjK45qTQPT0AyBw4Nshz4p
         /61D3DA+T1ztQResvb5XZUnBTYwUIdz1oN13Y/hysel7TWsR40xwg1n+EVg0cJHw/LEl
         /TCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768926790; x=1769531590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyE3tcZfHNIZA6FfIO4xIcHtsr3M8UPCuR8WEWvL50A=;
        b=HJEqUi5IXaeodspGjMmt0eYiOaTYcYb4v/pzZ967qQYJOzvB8hvQewf793UgKikOh2
         x4+OAC/asmDfgrvv8hEuXDmLznqSsS42vZ2znX1NX9o702d8dQ7yzheN3aKQrYUtrzKL
         6DA2XBfQ14u6OQNaMOk+twTpLIMJoZmRjmlUt0C1SIGvLJXJp3qAx6hHYJvXqUEG5kBl
         fpYTv2oO5vihenLJ5tONPO8Mdo4UBA73UuXOdGuEG+Sz3JzRWGlBBkXJnswIEqtk37qG
         ESj/l8ZdwE0mSi7UtjvZXIdEhAZCDQm4q4PXB72OBBu/vVvcr1qj+D/1OdU2qwh1IVRK
         dwDg==
X-Gm-Message-State: AOJu0YxbZPxfzd4rq/dfWzQqtZDGJwDF3OzDtZLfR2LqBzEmC1l5cD51
	XSXeiiH0nZJ2ZnmjqH/P0Wfg5MzZWy50uyIfMk4VPzZvriNcksl8Rjvc3MF/N0FfrYXhtRxcaN0
	WM/jwioKATfEJc4smWtBDA5rqyazS5tf3ymUT
X-Gm-Gg: AZuq6aLzyNc6xqtLhrD+j0JIyKWxJ+9Km3hXl+CK4UPo2Ge1isy0iDZyIUmG/OkAmuj
	dif5OBtAU0Eivh5mIvl9jUMuIZfOAHTAkE37NLbYFmODFt/Yj8xfmMVnlIqURb/uz5Yld8ux8tP
	9Uo1KrAyYo8dogjYB9ZIQ19N2kl/KvPAGjRYxz9UnxNPgUiMsbPxvbbPyl2bn5z0WYly/jeMGUf
	up4alOotscgIK8HCA5UU1xsZ/S7TkSNQIXyGDBAefNudNrWyeAkuls3hjf1Wd2Qh/sokFw7EKJt
	XJpYl6BXTKSDLyOhJmIETiNa1ra+fjR6CyFd/3aQ/eZXI9qs7vmnnx/TRhbf5nm80k0bnMSwPdN
	np463nfu0PauXklPE/Tu4IfqbwhXdN1aqx4mCFpWQfn6+rA==
X-Received: by 2002:a05:690c:c508:b0:785:fe77:ccce with SMTP id
 00721157ae682-7940a24511dmr19435557b3.44.1768926789407; Tue, 20 Jan 2026
 08:33:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768880370.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1768880370.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jan 2026 08:32:42 -0800
X-Gm-Features: AZwV_QjkRgUCCjVBXM7w-BKYbA6mIoHKz5ug6bASlim4QpIwUf5UlRqyfW2QAAs
Message-ID: <CAMKF1spzD8sGDrKKT_kXm3yByZJ8RcDfsfaBUaxpYhQfVo+rXA@mail.gmail.com>
Subject: Re: [PATCH 00/32] Scarthgap pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea99650648d45c12"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 16:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123676

--000000000000ea99650648d45c12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now, thanks Anuj

On Mon, Jan 19, 2026 at 8:05=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Please merge these changes in scarthgap. Tested on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1257
>
> The following changes since commit
> 2df869df1c3fa74103098bba65c06e55d0d3664a:
>
>   freerdp3: drop CVE-2025-68118 patch (2026-01-13 06:53:10 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> Anil Dongare (1):
>   php 8.2.29: CVE-2025-14177
>
> Ankur Tyagi (22):
>   gimp: upgrade 2.10.36 -> 2.10.38
>   gimp: patch CVE-2025-14422
>   gimp: patch CVE-2025-14425
>   gimp: ignore CVE-2025-48796
>   gimp: patch CVE-2025-5473
>   python3-aiohttp: upgrade 3.9.4 -> 3.9.5
>   python3-aiohttp: patch CVE-2024-52304
>   python3-cob2: upgrade 5.6.3 -> 5.6.4
>   python3-configobj: patch CVE-2023-26112
>   python3-eventlet: patch CVE-2025-58068
>   python3-marshmallow: upgrade 3.21.1 -> 3.21.3
>   python3-pymongo: upgrade 4.6.1 -> 4.6.3
>   python3-tornado: patch CVE-2025-47287
>   python3-tornado: patch CVE-2025-67724
>   python3-tornado: patch CVE-2025-67726
>   python3-tqdm: upgrade 4.66.2 -> 4.66.3
>   python3-werkzeug: ignore CVE-2025-66221 and CVE-2026-21860
>   python3-virtualenv: upgrade 20.25.0 -> 20.25.3
>   gpsd: patch CVE-2025-67268
>   gpsd: patch CVE-2025-67269
>   frr: patch multiple CVEs
>   fluidsynth: patch CVE-2025-56225
>
> Gyorgy Sarvari (5):
>   python3-ldap: set CVE_PRODUCT
>   python3-ldap: upgrade 3.4.4 -> 3.4.5
>   boinc-client: set CVE_PRODUCT
>   boinc-client: mark CVE-2013-2018 patched
>   lmdb: patch CVE-2026-22185
>
> Jackson (1):
>   tcpreplay 4.4.4: Fix CVE-2025-9384
>
> Peter Marko (1):
>   gimp: ignore CVE-2007-3741
>
> Wang Mingyu (1):
>   openfortivpn: upgrade 1.22.0 -> 1.22.1
>
> Yoann Congal (1):
>   boinc-client: fix hostname reproducibility
>
>  .../gimp/gimp/CVE-2025-14422.patch            |  64 ++++
>  .../gimp/gimp/CVE-2025-14425.patch            |  70 +++++
>  .../gimp/gimp/CVE-2025-5473.patch             |  38 +++
>  .../gimp/{gimp_2.10.36.bb =3D> gimp_2.10.38.bb} |  11 +-
>  .../fluidsynth/CVE-2025-56225.patch           |  25 ++
>  .../fluidsynth/fluidsynth_2.3.4.bb            |   1 +
>  ...tivpn_1.22.0.bb =3D> openfortivpn_1.22.1.bb} |   2 +-
>  ...1102-61103-61104-61105-61106-61107_1.patch |  37 +++
>  ...1102-61103-61104-61105-61106-61107_2.patch | 273 ++++++++++++++++++
>  ...1102-61103-61104-61105-61106-61107_3.patch |  78 +++++
>  ...1102-61103-61104-61105-61106-61107_4.patch | 119 ++++++++
>  .../recipes-protocols/frr/frr_9.1.3.bb        |   4 +
>  .../tcpreplay/tcpreplay/CVE-2025-9384.patch   |  38 +++
>  .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
>  .../lmdb/files/CVE-2026-22185.patch           |  31 ++
>  meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |   1 +
>  .../php/php/CVE-2025-14177.patch              |  84 ++++++
>  meta-oe/recipes-devtools/php/php_8.2.29.bb    |   1 +
>  .../boinc/boinc-client_7.20.5.bb              |   9 +-
>  .../gpsd/gpsd/CVE-2025-67268.patch            | 214 ++++++++++++++
>  .../gpsd/gpsd/CVE-2025-67269.patch            | 150 ++++++++++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb  |   2 +
>  .../python3-aiohttp/CVE-2024-52304.patch      | 124 ++++++++
>  ...http_3.9.4.bb =3D> python3-aiohttp_3.9.5.bb} |   4 +-
>  ...-cbor2_5.6.3.bb =3D> python3-cbor2_5.6.4.bb} |   2 +-
>  .../python3-configobj/CVE-2023-26112.patch    |  25 ++
>  .../python/python3-configobj_5.0.8.bb         |   2 +
>  .../python3-eventlet/CVE-2025-58068.patch     |  42 +++
>  .../python/python3-eventlet_0.36.1.bb         |   2 +
>  ....21.1.bb =3D> python3-marshmallow_3.21.3.bb} |   2 +-
>  ...ongo_4.6.1.bb =3D> python3-pymongo_4.6.3.bb} |   2 +-
>  .../python3-tornado/CVE-2025-47287.patch      | 232 +++++++++++++++
>  .../python3-tornado/CVE-2025-67724.patch      | 118 ++++++++
>  .../python3-tornado/CVE-2025-67726.patch      |  99 +++++++
>  .../python/python3-tornado_6.4.2.bb           |   5 +
>  ...-tqdm_4.66.2.bb =3D> python3-tqdm_4.66.3.bb} |   2 +-
>  ....25.0.bb =3D> python3-virtualenv_20.25.3.bb} |   2 +-
>  .../python/python3-werkzeug_3.0.6.bb          |   3 +
>  ...n3-ldap_3.4.4.bb =3D> python3-ldap_3.4.5.bb} |  10 +-
>  39 files changed, 1915 insertions(+), 14 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch
>  rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.36.bb =3D> gimp_2.10.38.b=
b}
> (82%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.p=
atch
>  rename meta-networking/recipes-connectivity/openfortivpn/{
> openfortivpn_1.22.0.bb =3D> openfortivpn_1.22.1.bb} (93%)
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-6110=
2-61103-61104-61105-61106-61107_1.patch
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-6110=
2-61103-61104-61105-61106-61107_2.patch
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-6110=
2-61103-61104-61105-61106-61107_3.patch
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-6110=
2-61103-61104-61105-61106-61107_4.patch
>  create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
>  create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
>  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.4.bb =3D=
>
> python3-aiohttp_3.9.5.bb} (81%)
>  rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.3.bb =3D>
> python3-cbor2_5.6.4.bb} (89%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
>  rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.1.b=
b
> =3D> python3-marshmallow_3.21.3.bb} (92%)
>  rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.1.bb =3D=
>
> python3-pymongo_4.6.3.bb} (90%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
>  rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.2.bb =3D>
> python3-tqdm_4.66.3.bb} (81%)
>  rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.b=
b
> =3D> python3-virtualenv_20.25.3.bb} (85%)
>  rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb =3D>
> python3-ldap_3.4.5.bb} (74%)
>
> --
> 2.52.0
>
>

--000000000000ea99650648d45c12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now, thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 1=
9, 2026 at 8:05=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@os=
s.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Please merge these changes in s=
carthgap. Tested on AB and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1257" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1257</a><br>
<br>
The following changes since commit 2df869df1c3fa74103098bba65c06e55d0d3664a=
:<br>
<br>
=C2=A0 freerdp3: drop CVE-2025-68118 patch (2026-01-13 06:53:10 +0530)<br>
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
Anil Dongare (1):<br>
=C2=A0 php 8.2.29: CVE-2025-14177<br>
<br>
Ankur Tyagi (22):<br>
=C2=A0 gimp: upgrade 2.10.36 -&gt; 2.10.38<br>
=C2=A0 gimp: patch CVE-2025-14422<br>
=C2=A0 gimp: patch CVE-2025-14425<br>
=C2=A0 gimp: ignore CVE-2025-48796<br>
=C2=A0 gimp: patch CVE-2025-5473<br>
=C2=A0 python3-aiohttp: upgrade 3.9.4 -&gt; 3.9.5<br>
=C2=A0 python3-aiohttp: patch CVE-2024-52304<br>
=C2=A0 python3-cob2: upgrade 5.6.3 -&gt; 5.6.4<br>
=C2=A0 python3-configobj: patch CVE-2023-26112<br>
=C2=A0 python3-eventlet: patch CVE-2025-58068<br>
=C2=A0 python3-marshmallow: upgrade 3.21.1 -&gt; 3.21.3<br>
=C2=A0 python3-pymongo: upgrade 4.6.1 -&gt; 4.6.3<br>
=C2=A0 python3-tornado: patch CVE-2025-47287<br>
=C2=A0 python3-tornado: patch CVE-2025-67724<br>
=C2=A0 python3-tornado: patch CVE-2025-67726<br>
=C2=A0 python3-tqdm: upgrade 4.66.2 -&gt; 4.66.3<br>
=C2=A0 python3-werkzeug: ignore CVE-2025-66221 and CVE-2026-21860<br>
=C2=A0 python3-virtualenv: upgrade 20.25.0 -&gt; 20.25.3<br>
=C2=A0 gpsd: patch CVE-2025-67268<br>
=C2=A0 gpsd: patch CVE-2025-67269<br>
=C2=A0 frr: patch multiple CVEs<br>
=C2=A0 fluidsynth: patch CVE-2025-56225<br>
<br>
Gyorgy Sarvari (5):<br>
=C2=A0 python3-ldap: set CVE_PRODUCT<br>
=C2=A0 python3-ldap: upgrade 3.4.4 -&gt; 3.4.5<br>
=C2=A0 boinc-client: set CVE_PRODUCT<br>
=C2=A0 boinc-client: mark CVE-2013-2018 patched<br>
=C2=A0 lmdb: patch CVE-2026-22185<br>
<br>
Jackson (1):<br>
=C2=A0 tcpreplay 4.4.4: Fix CVE-2025-9384<br>
<br>
Peter Marko (1):<br>
=C2=A0 gimp: ignore CVE-2007-3741<br>
<br>
Wang Mingyu (1):<br>
=C2=A0 openfortivpn: upgrade 1.22.0 -&gt; 1.22.1<br>
<br>
Yoann Congal (1):<br>
=C2=A0 boinc-client: fix hostname reproducibility<br>
<br>
=C2=A0.../gimp/gimp/CVE-2025-14422.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 64 ++++<br>
=C2=A0.../gimp/gimp/CVE-2025-14425.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 70 +++++<br>
=C2=A0.../gimp/gimp/CVE-2025-5473.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 38 +++<br>
=C2=A0.../gimp/{<a href=3D"http://gimp_2.10.36.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gimp_2.10.36.bb</a> =3D&gt; <a href=3D"http://gimp_2.10.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a>} |=C2=A0 11 +-<br=
>
=C2=A0.../fluidsynth/CVE-2025-56225.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 25 ++<br>
=C2=A0.../fluidsynth/<a href=3D"http://fluidsynth_2.3.4.bb" rel=3D"noreferr=
er" target=3D"_blank">fluidsynth_2.3.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://tivpn_1.22.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">tivpn_1.22.0.bb</a> =3D&gt; <a href=3D"http://openfortivpn_1.22.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openfortivpn_1.22.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...1102-61103-61104-61105-61106-61107_1.patch |=C2=A0 37 +++<br>
=C2=A0...1102-61103-61104-61105-61106-61107_2.patch | 273 +++++++++++++++++=
+<br>
=C2=A0...1102-61103-61104-61105-61106-61107_3.patch |=C2=A0 78 +++++<br>
=C2=A0...1102-61103-61104-61105-61106-61107_4.patch | 119 ++++++++<br>
=C2=A0.../recipes-protocols/frr/<a href=3D"http://frr_9.1.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">frr_9.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +<br>
=C2=A0.../tcpreplay/tcpreplay/CVE-2025-9384.patch=C2=A0 =C2=A0|=C2=A0 38 ++=
+<br>
=C2=A0.../tcpreplay/<a href=3D"http://tcpreplay_4.4.4.bb" rel=3D"noreferrer=
" target=3D"_blank">tcpreplay_4.4.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../lmdb/files/CVE-2026-22185.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 31 ++<br>
=C2=A0meta-oe/recipes-dbs/lmdb/<a href=3D"http://lmdb_0.9.31.bb" rel=3D"nor=
eferrer" target=3D"_blank">lmdb_0.9.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../php/php/CVE-2025-14177.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 84 ++++++<br>
=C2=A0meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.29.bb" rel=3D"=
noreferrer" target=3D"_blank">php_8.2.29.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0.../boinc/<a href=3D"http://boinc-client_7.20.5.bb" rel=3D"noreferrer=
" target=3D"_blank">boinc-client_7.20.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0.../gpsd/gpsd/CVE-2025-67268.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 214 ++++++++++++++<br>
=C2=A0.../gpsd/gpsd/CVE-2025-67269.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 150 ++++++++++<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.24.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.24.bb</a>=C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0.../python3-aiohttp/CVE-2024-52304.patch=C2=A0 =C2=A0 =C2=A0 | 124 ++=
++++++<br>
=C2=A0...<a href=3D"http://http_3.9.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">http_3.9.4.bb</a> =3D&gt; <a href=3D"http://python3-aiohttp_3.9.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...-<a href=3D"http://cbor2_5.6.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">cbor2_5.6.3.bb</a> =3D&gt; <a href=3D"http://python3-cbor2_5.6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-cbor2_5.6.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python3-configobj/CVE-2023-26112.patch=C2=A0 =C2=A0 |=C2=A0 25 ++=
<br>
=C2=A0.../python/<a href=3D"http://python3-configobj_5.0.8.bb" rel=3D"noref=
errer" target=3D"_blank">python3-configobj_5.0.8.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python3-eventlet/CVE-2025-58068.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
42 +++<br>
=C2=A0.../python/<a href=3D"http://python3-eventlet_0.36.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-eventlet_0.36.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0....<a href=3D"http://21.1.bb" rel=3D"noreferrer" target=3D"_blank">2=
1.1.bb</a> =3D&gt; <a href=3D"http://python3-marshmallow_3.21.3.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-marshmallow_3.21.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ongo_4.6.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ongo_4.6.1.bb</a> =3D&gt; <a href=3D"http://python3-pymongo_4.6.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pymongo_4.6.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python3-tornado/CVE-2025-47287.patch=C2=A0 =C2=A0 =C2=A0 | 232 ++=
+++++++++++++<br>
=C2=A0.../python3-tornado/CVE-2025-67724.patch=C2=A0 =C2=A0 =C2=A0 | 118 ++=
++++++<br>
=C2=A0.../python3-tornado/CVE-2025-67726.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
99 +++++++<br>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.4.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0...-<a href=3D"http://tqdm_4.66.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">tqdm_4.66.2.bb</a> =3D&gt; <a href=3D"http://python3-tqdm_4.66.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-tqdm_4.66.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0....<a href=3D"http://25.0.bb" rel=3D"noreferrer" target=3D"_blank">2=
5.0.bb</a> =3D&gt; <a href=3D"http://python3-virtualenv_20.25.3.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-virtualenv_20.25.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-werkzeug_3.0.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-werkzeug_3.0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0...<a href=3D"http://n3-ldap_3.4.4.bb" rel=3D"noreferrer" target=3D"_=
blank">n3-ldap_3.4.4.bb</a> =3D&gt; <a href=3D"http://python3-ldap_3.4.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.bb</a>} |=C2=A0 1=
0 +-<br>
=C2=A039 files changed, 1915 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.pa=
tch<br>
=C2=A0rename meta-gnome/recipes-gimp/gimp/{<a href=3D"http://gimp_2.10.36.b=
b" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.36.bb</a> =3D&gt; <a href=
=3D"http://gimp_2.10.38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.=
38.bb</a>} (82%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/flui=
dsynth/CVE-2025-56225.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/openfortivpn/{<a href=3D"=
http://openfortivpn_1.22.0.bb" rel=3D"noreferrer" target=3D"_blank">openfor=
tivpn_1.22.0.bb</a> =3D&gt; <a href=3D"http://openfortivpn_1.22.1.bb" rel=
=3D"noreferrer" target=3D"_blank">openfortivpn_1.22.1.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025=
-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025=
-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025=
-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025=
-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-9384.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.pa=
tch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-6726=
8.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-6726=
9.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2024-52304.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-aiohttp_3.9.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-aiohttp_3.9=
.4.bb</a> =3D&gt; <a href=3D"http://python3-aiohttp_3.9.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>} (81%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cbor2_5.6.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-cbor2_5.6.3.b=
b</a> =3D&gt; <a href=3D"http://python3-cbor2_5.6.4.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-cbor2_5.6.4.bb</a>} (89%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-config=
obj/CVE-2023-26112.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-eventl=
et/CVE-2025-58068.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-marshmallow_3.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshm=
allow_3.21.1.bb</a> =3D&gt; <a href=3D"http://python3-marshmallow_3.21.3.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-marshmallow_3.21.3.bb</a>} (=
92%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pymongo_4.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pymongo_4.6=
.1.bb</a> =3D&gt; <a href=3D"http://python3-pymongo_4.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pymongo_4.6.3.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2025-47287.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2025-67724.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2025-67726.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tqdm_4.66.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-tqdm_4.66.2.b=
b</a> =3D&gt; <a href=3D"http://python3-tqdm_4.66.3.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-tqdm_4.66.3.bb</a>} (81%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-virtualenv_20.25.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-virtua=
lenv_20.25.0.bb</a> =3D&gt; <a href=3D"http://python3-virtualenv_20.25.3.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-virtualenv_20.25.3.bb</a>} (=
85%)<br>
=C2=A0rename meta-python/recipes-networking/python/{<a href=3D"http://pytho=
n3-ldap_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.4.b=
b</a> =3D&gt; <a href=3D"http://python3-ldap_3.4.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-ldap_3.4.5.bb</a>} (74%)<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--000000000000ea99650648d45c12--

