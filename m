Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7552C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:59:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.55586.1699023570672662895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 07:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7OduJYe;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1214171f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699023569; x=1699628369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8lV00jFQzdnJI+aDSm/LWynvkmLdcsYoroAbsgYgh20=;
        b=C7OduJYenANZB5AKX/ZCW6sUmxPczfVkVsESpLvnheZx7WWyT8px0zo/sAwUerWZd2
         8jZT826jxA2KkOk2NugtKaVkRGWUkrFb/11BYvSjaKlA4dYKeyn471lHefzA5gydNx8e
         nx4Mon5WmrdCTzt5FJ9n3mTutHEaYliO6Np0BCJ0dyoAsYL26Clda4IbROnmK1JLbHlG
         AKMhQvKye3YdKP777Pxn8JJOlx1bYPUqkoxM/rLQ3vxgT6iR8T4kF/u+hb91Y3MCuByo
         0o5+p0jJBbOVBkDWs6YLgFYEXo8rROqqx7JLimULawqiT86r9ZO4VlXNqIHgspN5YkSP
         UUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699023569; x=1699628369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lV00jFQzdnJI+aDSm/LWynvkmLdcsYoroAbsgYgh20=;
        b=no5t/HFzeyv87olpR1FynjZDkIki9V0kNRYYq43iORy74rWKkzwQnXO0E6DmD3ci3v
         G7QtIalI9hx5CsuN5zJQQMfj5ZGmUfOwy5MCRld83SCLhSuOlRyPC3kaTw2MBdwyhPzb
         idbk6tFN7+NMwwjqTpA2nA4nx0f8ewCvnnrIlBDcL4jSRCqsI4HZWI1PEjHh5nTlSky+
         nEjPZjFyQb/Wch1D1bV/7jGZ+O1urd1vjiBJEY+4XD9Db51pa5R+ZKePplpD+alP14uF
         UWcBaRSiDqZ+4N/Op1A5RxBX79W8ZiRNPiHcSSoj7U5cqUb/LVFqR3IJKNtdpqxmJp/2
         eyXw==
X-Gm-Message-State: AOJu0Yy2izI7BypClIHzOKtVMmpBwuY6EtCr1+6Pd19Gh2GAvg+gBZJG
	T/S2kHl9KD6FCib1VdchWHKGRk2zVdJa6Y9g64Q=
X-Google-Smtp-Source: AGHT+IGVpGcwAjq1N4t3zeSs6gPpHYfHHcEhHdoQAfPYsFXWpbhPSgXDdH75RkaUf16ph9AL/aoZxt/iJ9v4vUrH1+k=
X-Received: by 2002:a05:6000:1c9:b0:32d:8185:9526 with SMTP id
 t9-20020a05600001c900b0032d81859526mr15279207wrx.55.1699023568833; Fri, 03
 Nov 2023 07:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <d2651b9b-d360-4aeb-947e-4f1a8a09d348@gmail.com>
In-Reply-To: <d2651b9b-d360-4aeb-947e-4f1a8a09d348@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Nov 2023 15:59:15 +0100
Message-ID: <CA+chaQcStT4hL36n3d7budYTLN+7zD43s1FKd=X5_+gwRppu8Q@mail.gmail.com>
Subject: Re: [oe] kirkstone merge request: Nov 3rd
To: Armin Kuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004912aa060940c0c6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 14:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105866

--0000000000004912aa060940c0c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please include:
https://patchwork.yoctoproject.org/project/oe/patch/20230929112628.3839203-=
1-martin.jansa@gmail.com/

this is 3rd kirkstone pull where it was missed.

On Fri, Nov 3, 2023 at 3:47=E2=80=AFPM Armin Kuster <akuster808@gmail.com> =
wrote:

> The following changes since commit
> 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:
>
>    python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:
>
>    mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)
>
> ----------------------------------------------------------------
> Denys Dmytriyenko (1):
>        mbedtls: set up /usr/bin/hello as alternative
>
> Gianfranco Costamagna (3):
>        mosquitto: do not automatically depend on dlt-daemon, it's a
> non-mandatory logging system
>        mosquitto: upgrade 2.0.15 -> 2.0.17
>        mosquitto: upgrade 2.0.17 -> 2.0.18
>
> Joe Slater (1):
>        nginx: add configure option
>
> Martin Jansa (1):
>        mosquitto: add missing Upstream-Status
>
> Meenali Gupta (1):
>        open-vm-tools: fix CVE-2023-20867
>
> Narpat Mali (1):
>        python3-gevent: fix CVE-2023-41419
>
> Polampalli, Archana (4):
>        samba: fix CVE-2023-34966
>        samba: fix CVE-2022-2127
>        samba:fix CVE-2023-34967
>        samba: fix CVE-2023-34968
>
> Wang Mingyu (1):
>        mosquitto: upgrade 2.0.14 -> 2.0.15
>
> Yi Zhao (1):
>        mbedtls: upgrade 2.28.2 -> 2.28.5
>
>   .../mbedtls/{mbedtls_2.28.2.bb =3D> mbedtls_2.28.5.bb} |   7 +-
>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 ++
>   meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27 ++
>   .../recipes-connectivity/mosquitto/files/mosquitto.init         | 20 +-
>   .../mosquitto/{mosquitto_2.0.14.bb =3D> mosquitto_2.0.18.bb} |   6 +-
>   .../recipes-connectivity/samba/samba/CVE-2022-2127.patch        | 44 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch  | 78 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch  | 140
> ++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch  | 178
> ++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch  | 125
> ++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch  | 104
> +++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch  | 39 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch  | 65 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch  | 85 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch  | 83 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch  | 57 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch  | 49 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch  | 62 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch  | 465
> +++++++++++++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch  | 484
> ++++++++++++++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch  | 295
> ++++++++++++
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 16 +
>   .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 158
> +++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>   .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 673
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb   | 2 +
>   .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 ++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
>   28 files changed, 3316 insertions(+), 14 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb
> =3D> mbedtls_2.28.5.bb} (91%)
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>   rename
> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb =3D>
> mosquitto_2.0.18.bb} (94%)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.patc=
h
>   create mode 100644
>
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2086=
7.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patc=
h
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105865):
> https://lists.openembedded.org/g/openembedded-devel/message/105865
> Mute This Topic: https://lists.openembedded.org/mt/102365349/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004912aa060940c0c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you please include:<div><a href=3D"https://patchwork.y=
octoproject.org/project/oe/patch/20230929112628.3839203-1-martin.jansa@gmai=
l.com/">https://patchwork.yoctoproject.org/project/oe/patch/20230929112628.=
3839203-1-martin.jansa@gmail.com/</a><br></div><div><br></div><div>this is =
3rd kirkstone pull where it was missed.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 3, 2023 at 3:47=E2=
=80=AFPM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster80=
8@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The following changes since commit 9c5541f7e18a1fac3b8dea71e1ebb=
8398d58e6ff:<br>
<br>
=C2=A0=C2=A0 python3-django: upgrade 4.2.3 -&gt; 4.2.5 (2023-09-27 10:23:28=
 -0400)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded</a> kirkstone-next<br>
<br>
for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:<br=
>
<br>
=C2=A0=C2=A0 mbedtls: upgrade 2.28.2 -&gt; 2.28.5 (2023-10-17 09:07:38 -040=
0)<br>
<br>
----------------------------------------------------------------<br>
Denys Dmytriyenko (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls: set up /usr/bin/hello as alte=
rnative<br>
<br>
Gianfranco Costamagna (3):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: do not automatically depend=
 on dlt-daemon, it&#39;s a <br>
non-mandatory logging system<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.15 -&gt; 2.0.17=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.17 -&gt; 2.0.18=
<br>
<br>
Joe Slater (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nginx: add configure option<br>
<br>
Martin Jansa (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: add missing Upstream-Status=
<br>
<br>
Meenali Gupta (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open-vm-tools: fix CVE-2023-20867<br>
<br>
Narpat Mali (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-gevent: fix CVE-2023-41419<br>
<br>
Polampalli, Archana (4):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2023-34966<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2022-2127<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba:fix CVE-2023-34967<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samba: fix CVE-2023-34968<br>
<br>
Wang Mingyu (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mosquitto: upgrade 2.0.14 -&gt; 2.0.15=
<br>
<br>
Yi Zhao (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbedtls: upgrade 2.28.2 -&gt; 2.28.5<b=
r>
<br>
=C2=A0=C2=A0.../mbedtls/{<a href=3D"http://mbedtls_2.28.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.2.bb</a> =3D&gt; <a href=3D"http://mbe=
dtls_2.28.5.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.5.bb</a>}=
 |=C2=A0=C2=A0 7 +-<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2894.patch=
 | 25 ++<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2895.patch=
 | 27 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/mosquitto/files/mosquitto.init=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +-<br>
=C2=A0=C2=A0.../mosquitto/{<a href=3D"http://mosquitto_2.0.14.bb" rel=3D"no=
referrer" target=3D"_blank">mosquitto_2.0.14.bb</a> =3D&gt; <a href=3D"http=
://mosquitto_2.0.18.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.=
18.bb</a>} |=C2=A0=C2=A0 6 +-<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2022-2127.patch=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch=
=C2=A0 | 78 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch=
=C2=A0 | 140 <br>
++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch=
=C2=A0 | 178 <br>
++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch=
=C2=A0 | 125 <br>
++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch=
=C2=A0 | 104 <br>
+++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch=
=C2=A0 | 39 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch=
=C2=A0 | 65 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch=
=C2=A0 | 85 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch=
=C2=A0 | 83 ++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch=
=C2=A0 | 57 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch=
=C2=A0 | 49 ++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch=
=C2=A0 | 62 +++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch=
=C2=A0 | 465 <br>
+++++++++++++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch=
=C2=A0 | 484 <br>
++++++++++++++++++++<br>
=C2=A0=C2=A0.../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch=
=C2=A0 | 295 <br>
++++++++++++<br>
=C2=A0=C2=A0meta-networking/recipes-connectivity/samba/<a href=3D"http://sa=
mba_4.14.14.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.14.14.bb</a>=
=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +<br>
=C2=A0=C2=A0.../open-vm-tools/open-vm-tools/CVE-2023-20867.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 158 <br>
+++++++<br>
=C2=A0=C2=A0.../recipes-support/open-vm-tools/<a href=3D"http://open-vm-too=
ls_11.3.5.bb" rel=3D"noreferrer" target=3D"_blank">open-vm-tools_11.3.5.bb<=
/a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>
=C2=A0=C2=A0.../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch=
 | 673 <br>
++++++++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-g=
event_21.12.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_21.12=
.0.bb</a>=C2=A0=C2=A0 | 2 +<br>
=C2=A0=C2=A0.../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch=
 | 39 ++<br>
=C2=A0=C2=A0meta-webserver/recipes-httpd/nginx/nginx.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 +<br>
=C2=A0=C2=A028 files changed, 3316 insertions(+), 14 deletions(-)<br>
=C2=A0=C2=A0rename meta-networking/recipes-connectivity/mbedtls/{<a href=3D=
"http://mbedtls_2.28.2.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.2=
8.2.bb</a> <br>
=3D&gt; <a href=3D"http://mbedtls_2.28.5.bb" rel=3D"noreferrer" target=3D"_=
blank">mbedtls_2.28.5.bb</a>} (91%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
=C2=A0=C2=A0rename <br>
meta-networking/recipes-connectivity/mosquitto/{<a href=3D"http://mosquitto=
_2.0.14.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.14.bb</a> =
=3D&gt; <br>
<a href=3D"http://mosquitto_2.0.18.bb" rel=3D"noreferrer" target=3D"_blank"=
>mosquitto_2.0.18.bb</a>} (94%)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch<=
br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.=
patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch<=
br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105865): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105865" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105865</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102365349/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102365349/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004912aa060940c0c6--

