Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176CEC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 15:22:22 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7837.1784388131733710674
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 08:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VuaQFlPB;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ee6b2da98so27932497b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 08:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784388131; cv=none;
        d=google.com; s=arc-20260327;
        b=PvSPvHv0Mu3dVtcELUt7vg0UZyXTqYN6ceJiDl0Iqnsg+r/Y46Vw3OxlyzeFp8k+Qo
         qC250MRA2q/ZoLIICz0MJciXA9IVOpFVICh2sYnv3ncDWn1lQMp+B2Zi6w5UkEbK8n9Y
         39You8h9tCUfwnfLfVWPyBS8FJqlhhO4dBeXmOpsznFLDHZpf5ulpw6H2qq2AFxYgS0E
         QKhu3K0yjg0MjPIStr/ZzVjlu3+jvozFJu/Q3e+Pue4fBsAmOEIWqo3FBuk4JCqLPxj8
         GgTtlcP/bIOYKxm3Y2eLlAUz4qkzIbkvHSA2LKmJ68JF4DZ5QFtKrFSCXO0SkXvuv4aH
         WJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vu+8gVqoaeUlIjK6F4e9y82jHBjO7yy8lyRa2cXeGj8=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=stpTK7CI8w+i7oLFgnOLxOcDvyzFMDR7Cw/QF+ae2TZ2gy6beUrNch2w3HaUV04hXG
         dS47I7fsOhGoimZ9KEnbFE6YLdeptIz965QHL9tp8GoDX5+lJRPpOveX6mmHeCivh5Ci
         /RmP0ucrSXThotJIVPgW3v8xd02O1aIFkamhBWgl3idnYon7k1fIcRJAFC3G1+4vUqaO
         wLEVOnS8NIDIlkX7cv4/mrnN3Vo4jKGDDXnQwqTeYuusYjyxRFGJ2LAo7QvgYyplohWB
         h5ena0kezH2XGGrFlOCkUqH5b06M+O8KhAEs6y7oyLyDDtnRmYkmRwpokf6YtS6d63z+
         aMjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784388131; x=1784992931; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu+8gVqoaeUlIjK6F4e9y82jHBjO7yy8lyRa2cXeGj8=;
        b=VuaQFlPB+UqMe0DSluS2k0R8HyM/6gk84RIKAcMsZW+ncEQ9ypP1UqrDWk3aAn2ed/
         qjqn6oQgvAqIzV0WbDjA3+dputGM5hWR6tPnxHv+1HnQYQ9D5PSFcGLWV+6e+4iKpAfa
         OgWAhN0zjg5XKWZe1KACvUBJvV7A3dv+dh7XTCTlvdiF7s6bC4gdtWVtU1qurb0w4Z9u
         cy6DBfIeK0UUuTeTHBwFvczUN9PmRpiYaTE5xRSJPrPc53d+xE+YbHih9MMTZNQbmqyL
         b44JI1fpMjqllnrMDxz7BE5Z0KX0oG7c9f4mo1nR9PC4VzTX7kFT+1z24xew6fc9JpJU
         407Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784388131; x=1784992931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vu+8gVqoaeUlIjK6F4e9y82jHBjO7yy8lyRa2cXeGj8=;
        b=k2xXfiq0mK8IHNWhKSIEbeSRt/luYU5JYofTI8LgPfZzJLtFLOn96PQu4trt9w1t1O
         4942u0YiFmwjyuDdNLM7vXjry3MkLM1wnl7pWIcpSOhs13qfHC/6M24xjnZ96hy/CeXx
         Z3RYFoXzAG/TqgN16owjRv3m8jOpDkUPvz9DGiyftNYnaYsOUCkkURE5saqya5uVrPZE
         WpL+FgPyb+IsBUAC9AyOKdnWlCu7liMHYoCUnntIeP1W5u9xwefejY+uEWb7mmWoPSff
         ZntXNoNuZZpRi44aqu4de0dEeLoyOiIVPbfbfxdg725ELR5kNOSGPYRiu0coibU2tmzp
         FHCg==
X-Gm-Message-State: AOJu0YyjcbalOrRhltdQgMjqhtp/cM6jGP7kgTsHbZhxzKN/DQyRBouI
	Mhbor5ARGQeiTRrYuXH8g3oT+VSnfAnVmfkHPSivXaHsjmTEMJy6Hnzrfc6RxosGiE7Pr2Nq3Mj
	7kT3D+7so5SPalzeln/CBXoLbNozWF6I=
X-Gm-Gg: AfdE7cmzNiZv8Ij28+14Z5Rsm01KF08jUaeP2p6tjq1o66JJW/Zz8jsnWx2ugUaILB5
	a3uAkvaXv510Yz5vgGllV8k2GJI2OujrGa9kaSX8V3fPWnxRl2vb5N1CwEtYffAlRqxNexYgX66
	MzLnIrSlztn0TBevDJj26JZVERff8Bt2NxX+Qh4nCdaovAjsiBs+sNz+dPEd80cVqBaRWLoj6s+
	47wZdOPAHmNsyH9LAHViOBH7dGW7b92t6wcbuiOvhuLddhmiaQe1BTp1kib2ghRZG2e1rmhNjKH
	nncUwU2W0bFclt5g2GoGb/3uNBiqvfwogsrKkAsFKceKQJf6GIVG9OzrRQyfSPIJ5O0exDY3C91
	QD8hOaIV3XR8eIz/UtJoCw7GetNa8Kh7Hob0Ik/OIUzTgYzk0GtnrNOhMedQ=
X-Received: by 2002:a05:690c:650e:b0:80a:ed07:9c1a with SMTP id
 00721157ae682-81ef22e4812mr28076497b3.6.1784388130458; Sat, 18 Jul 2026
 08:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784290740.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1784290740.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jul 2026 08:21:44 -0700
X-Gm-Features: AUfX_mygNofagzQRPWs9Wlnq2-DJvr4S1Djp4mQJ8BQ9KnIFaGSbhitrdY-0KBk
Message-ID: <CAMKF1sp-8oeS5yz4Ah7Xmu73Zh8vWHdi+gNNPFm54=OTOOwCaw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/14] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a8529c0656e43c03"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 15:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128253

--000000000000a8529c0656e43c03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

looks good. Applied now, Thanks Anuj

On Fri, Jul 17, 2026 at 4:26=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1637
>
> The following changes since commit
> 29a044218285fdc7fcdd63d5f0929cb3a27b6fed:
>
>   python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 7eb94107580092f79ff1b639a87762fe6f96aa12:
>
>   nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)
>
> ----------------------------------------------------------------
>
> Ashishkumar Parmar (2):
>   samba: Fix CVE-2026-3012
>   samba: Fix CVE-2026-4408
>
> Benjamin Robin (Schneider Electric) (2):
>   dnsmasq: fix CVE-2026-2291
>   nginx: fix CVE-2026-42055
>
> Deepak Rathore (4):
>   lldpd: Fix CVE-2026-46433
>   mbedtls: set CVE_STATUS for CVE-2025-66442
>   nmap: fix CVE-2026-58058
>   libidn: fix CVE-2026-57053
>
> Esa Jaaskela (1):
>   uutils-coreutils: fix buildpaths QA warning
>
> Etienne Cordonnier (1):
>   uutils-coreutils: disable stdbuf compilation
>
> Jason Schonberg (1):
>   php: upgrade 8.2.31 -> 8.2.32
>
> Roland Kovacs (1):
>   radvd: fix CVE-2026-48715
>
> Sudhir Dumbhare (1):
>   mariadb: upgrade 10.11.16 -> 10.11.18
>
> Yunseong Kim (1):
>   libyang: Fix CVE-2026-41401 and CVE-2026-44673
>
>  .../mbedtls/mbedtls_3.6.6.bb                  |   17 +
>  .../samba/samba/CVE-2026-3012_p1.patch        |  131 ++
>  .../samba/samba/CVE-2026-3012_p2.patch        |   51 +
>  .../samba/samba/CVE-2026-4408_p1.patch        |   75 ++
>  .../samba/samba/CVE-2026-4408_p10.patch       |  339 +++++
>  .../samba/samba/CVE-2026-4408_p11.patch       |   94 ++
>  .../samba/samba/CVE-2026-4408_p12.patch       |   47 +
>  .../samba/samba/CVE-2026-4408_p13.patch       |  174 +++
>  .../samba/samba/CVE-2026-4408_p14.patch       |   59 +
>  .../samba/samba/CVE-2026-4408_p15.patch       | 1108 +++++++++++++++++
>  .../samba/samba/CVE-2026-4408_p16.patch       |  422 +++++++
>  .../samba/samba/CVE-2026-4408_p17.patch       |   55 +
>  .../samba/samba/CVE-2026-4408_p18.patch       |   52 +
>  .../samba/samba/CVE-2026-4408_p2.patch        |  133 ++
>  .../samba/samba/CVE-2026-4408_p3.patch        |  208 ++++
>  .../samba/samba/CVE-2026-4408_p4.patch        |  179 +++
>  .../samba/samba/CVE-2026-4408_p5.patch        |   46 +
>  .../samba/samba/CVE-2026-4408_p6.patch        |  131 ++
>  .../samba/samba/CVE-2026-4408_p7.patch        |   84 ++
>  .../samba/samba/CVE-2026-4408_p8.patch        |   39 +
>  .../samba/samba/CVE-2026-4408_p9.patch        |   61 +
>  .../samba/samba_4.19.9.bb                     |   20 +
>  .../lldpd/files/CVE-2026-46433.patch          |   36 +
>  .../recipes-daemons/lldpd/lldpd_1.0.18.bb     |    1 +
>  .../radvd/files/CVE-2026-48715.patch          |  213 ++++
>  .../radvd/files/CVE-2026-48715_dep.patch      |  106 ++
>  .../recipes-daemons/radvd/radvd_2.19.bb       |    2 +
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |    1 +
>  .../dnsmasq/files/CVE-2026-2291.patch         |   40 +
>  .../files/0002-do-not-compile-stdbuf.patch    |   39 +
>  .../uutils-coreutils_0.0.28.bb                |    5 +-
>  ...10.11.16.bb =3D> mariadb-native_10.11.18.bb} |    0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |    2 +-
>  ...ariadb_10.11.16.bb =3D> mariadb_10.11.18.bb} |    0
>  .../php/{php_8.2.31.bb =3D> php_8.2.32.bb}      |    2 +-
>  .../libidn/libidn/CVE-2026-57053.patch        |   28 +
>  .../recipes-extended/libidn/libidn_1.41.bb    |    1 +
>  .../libyang/libyang/CVE-2026-41401.patch      |   49 +
>  .../libyang/libyang/CVE-2026-44673.patch      |   66 +
>  .../libyang/libyang_2.1.148.bb                |    2 +
>  .../nmap/files/CVE-2026-58058.patch           |   33 +
>  meta-oe/recipes-security/nmap/nmap_7.80.bb    |    1 +
>  .../nginx/files/CVE-2026-42055.patch          |  102 ++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |    1 +
>  44 files changed, 4252 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-3012_p2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p10.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p11.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p12.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p13.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p14.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p15.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p16.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p17.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p18.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p3.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p4.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p5.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p6.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p7.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p8.patch
>  create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2026-4408_p9.patch
>  create mode 100644
> meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch
>  create mode 100644
> meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
>  create mode 100644
> meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
>  create mode 100644
> meta-oe/recipes-core/uutils-coreutils/files/0002-do-not-compile-stdbuf.pa=
tch
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.16.bb =3D>
> mariadb-native_10.11.18.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.16.bb =3D>
> mariadb_10.11.18.bb} (100%)
>  rename meta-oe/recipes-devtools/php/{php_8.2.31.bb =3D> php_8.2.32.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
>  create mode 100644
> meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
>  create mode 100644
> meta-oe/recipes-extended/libyang/libyang/CVE-2026-44673.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42055.patch
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128251):
> https://lists.openembedded.org/g/openembedded-devel/message/128251
> Mute This Topic: https://lists.openembedded.org/mt/120324852/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a8529c0656e43c03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">looks good. Applied now, Thanks Anuj</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jul 17, 2026 at 4:26=E2=80=AFPM Anuj Mittal via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a hr=
ef=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Please merge these changes in scarthgap. Tested locally a=
nd on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1637" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1637</a><br>
<br>
The following changes since commit 29a044218285fdc7fcdd63d5f0929cb3a27b6fed=
:<br>
<br>
=C2=A0 python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)<br>
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
for you to fetch changes up to 7eb94107580092f79ff1b639a87762fe6f96aa12:<br=
>
<br>
=C2=A0 nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ashishkumar Parmar (2):<br>
=C2=A0 samba: Fix CVE-2026-3012<br>
=C2=A0 samba: Fix CVE-2026-4408<br>
<br>
Benjamin Robin (Schneider Electric) (2):<br>
=C2=A0 dnsmasq: fix CVE-2026-2291<br>
=C2=A0 nginx: fix CVE-2026-42055<br>
<br>
Deepak Rathore (4):<br>
=C2=A0 lldpd: Fix CVE-2026-46433<br>
=C2=A0 mbedtls: set CVE_STATUS for CVE-2025-66442<br>
=C2=A0 nmap: fix CVE-2026-58058<br>
=C2=A0 libidn: fix CVE-2026-57053<br>
<br>
Esa Jaaskela (1):<br>
=C2=A0 uutils-coreutils: fix buildpaths QA warning<br>
<br>
Etienne Cordonnier (1):<br>
=C2=A0 uutils-coreutils: disable stdbuf compilation<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.2.31 -&gt; 8.2.32<br>
<br>
Roland Kovacs (1):<br>
=C2=A0 radvd: fix CVE-2026-48715<br>
<br>
Sudhir Dumbhare (1):<br>
=C2=A0 mariadb: upgrade 10.11.16 -&gt; 10.11.18<br>
<br>
Yunseong Kim (1):<br>
=C2=A0 libyang: Fix CVE-2026-41401 and CVE-2026-44673<br>
<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_3.6.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_3.6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
=C2=A0.../samba/samba/CVE-2026-3012_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 131 ++<br>
=C2=A0.../samba/samba/CVE-2026-3012_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A051 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A075 ++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p10.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 339 +++++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p11.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A094 ++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p12.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A047 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p13.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 174 +++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p14.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A059 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p15.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
108 +++++++++++++++++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p16.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 422 +++++++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p17.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A055 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p18.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A052 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 133 ++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 208 ++++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 179 +++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A046 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p6.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 131 ++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p7.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A084 ++<br>
=C2=A0.../samba/samba/CVE-2026-4408_p8.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A039 +<br>
=C2=A0.../samba/samba/CVE-2026-4408_p9.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A061 +<br>
=C2=A0.../samba/<a href=3D"http://samba_4.19.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">samba_4.19.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +<br>
=C2=A0.../lldpd/files/CVE-2026-46433.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A036 +<br>
=C2=A0.../recipes-daemons/lldpd/<a href=3D"http://lldpd_1.0.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lldpd_1.0.18.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A0 1 +<br>
=C2=A0.../radvd/files/CVE-2026-48715.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 213 ++++<br>
=C2=A0.../radvd/files/CVE-2026-48715_dep.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
106 ++<br>
=C2=A0.../recipes-daemons/radvd/<a href=3D"http://radvd_2.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">radvd_2.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.90.bb" rel=3D=
"noreferrer" target=3D"_blank">dnsmasq_2.90.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../dnsmasq/files/CVE-2026-2291.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A040 +<br>
=C2=A0.../files/0002-do-not-compile-stdbuf.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A039 +<br>
=C2=A0.../<a href=3D"http://uutils-coreutils_0.0.28.bb" rel=3D"noreferrer" =
target=3D"_blank">uutils-coreutils_0.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +-<br>
=C2=A0...<a href=3D"http://10.11.16.bb" rel=3D"noreferrer" target=3D"_blank=
">10.11.16.bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.11.18.bb" rel=
=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.18.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://ariadb_10.11.16.bb" rel=3D"noreferrer" target=3D=
"_blank">ariadb_10.11.16.bb</a> =3D&gt; <a href=3D"http://mariadb_10.11.18.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.18.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.31.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.31.bb</a> =3D&gt; <a href=3D"http://php_8.2.32.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.32.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../libidn/libidn/CVE-2026-57053.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A028 +<br>
=C2=A0.../recipes-extended/libidn/<a href=3D"http://libidn_1.41.bb" rel=3D"=
noreferrer" target=3D"_blank">libidn_1.41.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../libyang/libyang/CVE-2026-41401.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A049 +<br>
=C2=A0.../libyang/libyang/CVE-2026-44673.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A066 +<br>
=C2=A0.../libyang/<a href=3D"http://libyang_2.1.148.bb" rel=3D"noreferrer" =
target=3D"_blank">libyang_2.1.148.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../nmap/files/CVE-2026-58058.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A033 +<br>
=C2=A0meta-oe/recipes-security/nmap/<a href=3D"http://nmap_7.80.bb" rel=3D"=
noreferrer" target=3D"_blank">nmap_7.80.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
1 +<br>
=C2=A0.../nginx/files/CVE-2026-42055.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 102 ++<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 1 +<br>
=C2=A044 files changed, 4252 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-3012_p1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-3012_p2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p10.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p11.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p12.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p13.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p14.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p15.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p16.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p17.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p18.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p5.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p6.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p7.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p8.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2026-4408_p9.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-20=
26-46433.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-20=
26-48715.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-20=
26-48715_dep.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2026-2291.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-core/uutils-coreutils/files/0002-d=
o-not-compile-stdbuf.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_10=
.11.16.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.16.bb<=
/a> =3D&gt; <a href=3D"http://mariadb-native_10.11.18.bb" rel=3D"noreferrer=
" target=3D"_blank">mariadb-native_10.11.18.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.11.16.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.16.bb</a> =3D&gt; <a=
 href=3D"http://mariadb_10.11.18.bb" rel=3D"noreferrer" target=3D"_blank">m=
ariadb_10.11.18.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.31.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.31.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.32.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.32.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libidn/libidn/CVE-2026-57=
053.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
41401.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
44673.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058=
.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42055.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128251): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128251" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128251</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120324852/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120324852/1997914</a><br>
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

--000000000000a8529c0656e43c03--

