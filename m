Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053CBC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 15:47:07 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.56440.1699026422421123833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 08:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0x2e/SW;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b3f938331fso1085388b6e.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699026421; x=1699631221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqOXe11Lv6Sits1c/5ZvxiclOMgfUtQMXo5Ei41RKD0=;
        b=j0x2e/SWSf9hhas72+UEw5CsI5dIfUuQuHZlPWIHK6j227m6+R90ja7eTUIrRm/ond
         jVgfik+4sFuGRt9SGqUdWSwCKvQbO0X/FwKxr8qAmcZTIa87DwK3zq6YK2hnWqcr9HFb
         xtAvV8TkVf6NMSvaoJGf/YIXxrS75I6piR8wjMA3ZUZe6YwaCTZ+TjvMfsJegS5lESKE
         XBN7FWVBDleDAMhIDVrVzgP8Lo9+bFdddkxI6BXJq2rrou4TdNFKIJlBrRgt+FnaLvvV
         6VIGFkFqMQYCMJxHjRaOthH3aoIv8+ij4qcivxDEMEMbQUZedPhxq2xhQklC5G7rd7Va
         cEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699026421; x=1699631221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqOXe11Lv6Sits1c/5ZvxiclOMgfUtQMXo5Ei41RKD0=;
        b=cMvDadgtlTMhNtEqE4N2SKqmB4QxqtSz1uaF0J9iQc9cyNCbFf4aE97TiodqsreVsx
         0bgN5+VWn4OGGCUroc73m65IGfU0KcAWgbhGG5UowHZnYgRtrn6LYcOJoJlV65kHKDe1
         6l6uUP6GmyU6YTaOqdEqMRpnL+2bPqlRQdzbtgSa4iS5YVVUKGQZqiovvRm3b5Brc/m7
         3KbAgM0bdsiWLcZHg0ztcDVc4XrkeaV0iklJtLBdtZF9MIMW+/zG6wl0+NP9OCJErTxx
         PtKGq3eVzmkPZ13h7MTlJhZT4S0tVj+57Vxba0nFNkIenP5NUDhVqZFsnwdPU2KqaMfa
         fh1w==
X-Gm-Message-State: AOJu0Yxo6bEBngTLb749Y20rSGzeo/xc+hFrB9K5AomJjQzMbwiS0Dmq
	Swg1wK+JUyaHiopY4J3KRlDzX4EZSMiO95oMzKk=
X-Google-Smtp-Source: AGHT+IFWP/eJNej4nRHnRRGpRCWskDJlY40dmoFiFMEH2VNS01SVWVUfHTXa8SAfrJAx6aKRKVueZF3/EeRpEZI6ou8=
X-Received: by 2002:a05:6808:2123:b0:3b2:e379:c11d with SMTP id
 r35-20020a056808212300b003b2e379c11dmr1637646oiw.22.1699026421567; Fri, 03
 Nov 2023 08:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <d2651b9b-d360-4aeb-947e-4f1a8a09d348@gmail.com>
 <179424EFA34EF667.30622@lists.openembedded.org> <CA+chaQcvgmbniLW9ttPhEu3OczCiELeBn9KQDjdCAgjmZLHRzQ@mail.gmail.com>
In-Reply-To: <CA+chaQcvgmbniLW9ttPhEu3OczCiELeBn9KQDjdCAgjmZLHRzQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Nov 2023 08:46:35 -0700
Message-ID: <CAMKF1soOmmrPUVPgrerFfx1jOq2rT9aXZJXMhxmbSNx5Un1D4g@mail.gmail.com>
Subject: Re: [oe] kirkstone merge request: Nov 3rd
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 15:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105869

right, I think the kirkstone-next branch is yet to be populated.

On Fri, Nov 3, 2023 at 8:13=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Or maybe you just forgot to push stable/kirkstone-nut into kirkstone-next=
 before generating this PR?
>
> As everything from this PR seems to be already in kirkstone branch, while=
 stable/kirkstone-nut has 7 new backports (including the projucer one I've =
pinged).
>
> On Fri, Nov 3, 2023 at 3:59=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Can you please include:
>> https://patchwork.yoctoproject.org/project/oe/patch/20230929112628.38392=
03-1-martin.jansa@gmail.com/
>>
>> this is 3rd kirkstone pull where it was missed.
>>
>> On Fri, Nov 3, 2023 at 3:47=E2=80=AFPM Armin Kuster <akuster808@gmail.co=
m> wrote:
>>>
>>> The following changes since commit 9c5541f7e18a1fac3b8dea71e1ebb8398d58=
e6ff:
>>>
>>>    python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.openembedded.org/meta-openembedded kirkstone-next
>>>
>>> for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482=
:
>>>
>>>    mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)
>>>
>>> ----------------------------------------------------------------
>>> Denys Dmytriyenko (1):
>>>        mbedtls: set up /usr/bin/hello as alternative
>>>
>>> Gianfranco Costamagna (3):
>>>        mosquitto: do not automatically depend on dlt-daemon, it's a
>>> non-mandatory logging system
>>>        mosquitto: upgrade 2.0.15 -> 2.0.17
>>>        mosquitto: upgrade 2.0.17 -> 2.0.18
>>>
>>> Joe Slater (1):
>>>        nginx: add configure option
>>>
>>> Martin Jansa (1):
>>>        mosquitto: add missing Upstream-Status
>>>
>>> Meenali Gupta (1):
>>>        open-vm-tools: fix CVE-2023-20867
>>>
>>> Narpat Mali (1):
>>>        python3-gevent: fix CVE-2023-41419
>>>
>>> Polampalli, Archana (4):
>>>        samba: fix CVE-2023-34966
>>>        samba: fix CVE-2022-2127
>>>        samba:fix CVE-2023-34967
>>>        samba: fix CVE-2023-34968
>>>
>>> Wang Mingyu (1):
>>>        mosquitto: upgrade 2.0.14 -> 2.0.15
>>>
>>> Yi Zhao (1):
>>>        mbedtls: upgrade 2.28.2 -> 2.28.5
>>>
>>>   .../mbedtls/{mbedtls_2.28.2.bb =3D> mbedtls_2.28.5.bb} |   7 +-
>>>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 =
++
>>>   meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27 =
++
>>>   .../recipes-connectivity/mosquitto/files/mosquitto.init         | 20 =
+-
>>>   .../mosquitto/{mosquitto_2.0.14.bb =3D> mosquitto_2.0.18.bb} |   6 +-
>>>   .../recipes-connectivity/samba/samba/CVE-2022-2127.patch        | 44 =
++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch  | 78 =
++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch  | 140
>>> ++++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch  | 178
>>> ++++++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch  | 125
>>> ++++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch  | 104
>>> +++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch  | 39 =
++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch  | 65 =
+++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch  | 85 =
++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch  | 83 =
++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch  | 57 =
+++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch  | 49 =
++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch  | 62 =
+++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch  | 465
>>> +++++++++++++++++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch  | 484
>>> ++++++++++++++++++++
>>>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch  | 295
>>> ++++++++++++
>>>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 16 =
+
>>>   .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 158
>>> +++++++
>>>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>>>   .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 673
>>> ++++++++++++++++++++++++++++
>>>   meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb   | 2 +
>>>   .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 =
++
>>>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
>>>   28 files changed, 3316 insertions(+), 14 deletions(-)
>>>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.b=
b
>>> =3D> mbedtls_2.28.5.bb} (91%)
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>>>   rename
>>> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb =3D=
>
>>> mosquitto_2.0.18.bb} (94%)
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.pa=
tch
>>>   create mode 100644
>>> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20=
867.patch
>>>   create mode 100644
>>> meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
>>>   create mode 100644
>>> meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.pa=
tch
>>>
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105866): https://lists.openembedded.org/g/openembedd=
ed-devel/message/105866
>> Mute This Topic: https://lists.openembedded.org/mt/102365349/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

