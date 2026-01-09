Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAB3D232EA
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 07:19:46 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5430.1767943184455412225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 23:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W7m8Of8w;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6467c5acb7dso3799238d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 23:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767943183; x=1768547983; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+/t+5HUSzZrPrn25CajgHBg8fRETLcqYhqah1mFDQ3Q=;
        b=W7m8Of8wN4BFlKCcCst2eJEl9ZuJceA7shYACIgvu4fN7t7a3oZnxE5DZnv1box1OH
         rhZsAtSo5Cpejzt72SByjtx05285eKoCXX55M1sdisOZ9BTmgnxB7W/lsF5ti9k/iAqz
         UYLjcwQpDU6/wsDnAfSuTUFX746+8NjA2omT4EZeXmsBr/3Gkr0vnZISQmn14lCltKzF
         uFW0gjvLX81Mp+xk1L4+jqkHyi2yfD/b8HOrjUgD/ZRGSDmKWUtUjKKJ74r6Cu5tt/gb
         PeC2fcCv/wqVs6QHK2qVLVeM/6ht72swus4Bs1CqOxHNiSboR4LCCLHZmpZQ7ADPNwDd
         XKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943183; x=1768547983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/t+5HUSzZrPrn25CajgHBg8fRETLcqYhqah1mFDQ3Q=;
        b=WTdADOpe+vqmFyDRy9nnRDj+amf89OT9GG9fjaMRVsXy9aqXJKHQiUWIGiOun59e8q
         f9Wh/ySGcBQb4vXPfBmuxi1wN4t9ycjBe2wdJinlLyQoxaHoPO2cO7OZVU/4G88H1KP9
         t8YgFtMiyu8q7xYzDTP3VnDu0FMHNgVwsjPwJIQxbV+FbS41UX5huHtVcxzKWlWm4+NM
         k52pJpLW6aZx5QRxVb9ZM4oov4LgZPqnadMYhfsVjGzni9QFka7b7uLRlmkliCW2BGWG
         c8PJ/aXcwM6WyPlUtgeDS4sP6pKZGoR8xBv5YXfZxy5BpjWN9vDy92vS7ml1WCxWLZ8S
         0g7A==
X-Gm-Message-State: AOJu0YwA4xmJ0hsVSS1+57FZb325czodLlyIOPKW0mmIVp3xm0C33K2G
	Yr9rupcuWgMKkrrGRsa/1lXh1oyG1cirYxFCvwAS+/K9VaTOqQbt6NxuEolSazv5RYSbtlHAtsy
	fDDN3YZ8Kd6cY70b1pEeDYUFriua2KP5kSQ==
X-Gm-Gg: AY/fxX4NfVJIbOx1nQqdzu3UnB9UWHRPHTSCZhf56qY2aY61tO+quaZ3foiVt40qRfM
	39vhNMlkKc2YMxz5lwO9t2qM9pblrsR/goBaQH5ghqtEurbUW70V8BFL98NDz2YgiXfUqIYT88b
	bCFG65OIHoij+/iJcEXp/laN8eIWmMmFv/EdOZjnC9lFiUiwHdie1/AfST5tpXc1Vmn7JDjNpXr
	6QXEU252v12md/G9HQnaC+dlzfKo8SVbM4Opun/vffIIvlitOMuzEP0JCUyV6qd7yJT8NWUJfKo
	lDJbFuCJNt796Gd0R3ExuTyQm8/DdCLdN47418l3o1ndsvNzKaytLVUbo8/4Z69NBOHodVLSO0U
	tTGT5TUTBCheaEa03CS26aGjtyWl+z4+o5hjauIru2XvWTQ==
X-Google-Smtp-Source: AGHT+IEJnNizWehwGeiTtrURvTQFpV28k5D8buGybi04UsP1Pvcf7Fm5iKZqi86GvvOI9gAv4ajc0WdG0qq3EmQLFAo=
X-Received: by 2002:a05:690e:4106:b0:644:7479:4af9 with SMTP id
 956f58d0204a3-64716c58b13mr7217429d50.62.1767943183501; Thu, 08 Jan 2026
 23:19:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767765802.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1767765802.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jan 2026 23:19:17 -0800
X-Gm-Features: AQt7F2qSNYDa5IeJ_VIwk_XCuaSUqjCL_SCF0R5qrqhdypfmPs_jgxW0Zg1b_Qk
Message-ID: <CAMKF1spBMrhRuBanPsZC8EBiRX_jRUUCMUerFOsDJ=SjYsEmqw@mail.gmail.com>
Subject: Re: [PATCH 00/30] Whinlatter pull request
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006f8e480647ef5903"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123277

--0000000000006f8e480647ef5903
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good. Merged now, thanks Anuj

On Wed, Jan 7, 2026 at 6:11=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com>
wrote:

> Please merge these changes in whinlatter. Tested on AB and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1225
>
> The following changes since commit
> a4e768dcfae181dd99e39c4286fa0729ca7f4e47:
>
>   bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA (2025-12-17 16:54:28 +0530=
)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> Ankur Tyagi (1):
>   fetchmail: patch CVE-2025-61962
>
> Gyorgy Sarvari (26):
>   fex: ignore unrelated CVEs
>   accountsservice: ignore CVE-2023-3297
>   minio: ignore irrelevant CVEs
>   cifs-utils: patch CVE-2025-2312
>   cups-filters: patch CVE-2025-64524
>   dovecot: patch CVE-2025-30189
>   fio: ignore CVE-2025-10824
>   tigervnc: fix typo in CVE_STATUS
>   tigervnc: sync xserver code with oe-core
>   tigervnc: ignore CVE-2023-6377
>   tigervnc: ignore CVE-2023-6478
>   tigervnc: ignore CVE-2025-26594...26601
>   civetweb: ignore CVE-2025-9648
>   freerdp3: ignore CVE-2025-68118
>   gimp: patch CVE-2025-14422
>   gimp: patch CVE-2025-14423
>   gimp: patch CVE-2025-14424
>   gimp: patch CVE-2025-14425
>   imagemagick: upgrade 7.1.2-8 -> 7.1.2-12
>   libcoap: ignore CVE-2025-50518
>   openvpn: upgrade 2.6.16 -> 2.6.17
>   php: upgrade 8.4.15 -> 8.4.16
>   postgresql: upgrade 17.6 -> 17.7
>   python3-configobj: ignore CVE-2023-26112
>   python3-django: upgrade 4.2.26 -> 4.2.27
>   python3-django: upgrade 5.2.8 -> 5.2.9
>
> Hugo SIMELIERE (2):
>   libwebsockets: fix CVE-2025-11677
>   libwebsockets: fix CVE-2025-11678
>
> Jason Schonberg (1):
>   c-ares: upgrade 1.34.5 -> 1.34.6
>
>  .../gimp/gimp/CVE-2025-14422.patch            |  66 +++++++
>  .../gimp/gimp/CVE-2025-14423.patch            | 106 ++++++++++++
>  .../gimp/gimp/CVE-2025-14424.patch            |  34 ++++
>  .../gimp/gimp/CVE-2025-14425.patch            |  79 +++++++++
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |  15 +-
>  .../accountsservice_23.13.9.bb                |   2 +
>  .../civetweb/civetweb_1.16.bb                 |   3 +-
>  .../libcoap/libcoap_4.3.5a.bb                 |   2 +
>  .../cifs/cifs-utils/CVE-2025-2312.patch       | 135 +++++++++++++++
>  .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
>  .../dovecot/dovecot/CVE-2025-30189-1.patch    | 128 ++++++++++++++
>  .../dovecot/dovecot/CVE-2025-30189-2.patch    |  51 ++++++
>  .../dovecot/dovecot/CVE-2025-30189-3.patch    |  36 ++++
>  .../dovecot/dovecot/CVE-2025-30189-4.patch    |  72 ++++++++
>  .../dovecot/dovecot/CVE-2025-30189-5.patch    |  31 ++++
>  .../dovecot/dovecot/CVE-2025-30189-6.patch    |  88 ++++++++++
>  .../dovecot/dovecot/CVE-2025-30189-7.patch    |  76 +++++++++
>  .../dovecot/dovecot_2.4.1-4.bb                |   7 +
>  .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++++
>  .../fetchmail/fetchmail_6.5.2.bb              |   1 +
>  .../{openvpn_2.6.16.bb =3D> openvpn_2.6.17.bb}  |   2 +-
>  meta-oe/recipes-benchmark/fio/fio_3.39.bb     |   2 +
>  .../libwebsockets/CVE-2025-11677.patch        | 161 ++++++++++++++++++
>  .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++
>  .../libwebsockets/libwebsockets_4.3.5.bb      |   2 +
>  ...c-bypass-autoconf-2.69-version-check.patch |   2 +-
>  ...{postgresql_17.6.bb =3D> postgresql_17.7.bb} |   4 +-
>  meta-oe/recipes-devtools/fex/fex_2511.bb      |   6 +
>  .../php/{php_8.4.15.bb =3D> php_8.4.16.bb}      |   2 +-
>  meta-oe/recipes-extended/minio/minio_git.bb   |   6 +
>  .../tigervnc/tigervnc_1.15.0.bb               |  16 +-
>  .../cups/cups-filters/CVE-2025-64524.patch    |  82 +++++++++
>  .../cups/cups-filters_2.0.1.bb                |  10 +-
>  .../c-ares/0001-ares_uri-memory-leak.patch    |  21 ---
>  .../{c-ares_1.34.5.bb =3D> c-ares_1.34.6.bb}    |   3 +-
>  .../freerdp/freerdp3_3.18.0.bb                |   1 +
>  ...ick_7.1.2-8.bb =3D> imagemagick_7.1.2-12.bb} |   2 +-
>  .../python/python3-configobj_5.0.9.bb         |   2 +
>  ...ngo_4.2.26.bb =3D> python3-django_4.2.27.bb} |   2 +-
>  ...jango_5.2.8.bb =3D> python3-django_5.2.9.bb} |   2 +-
>  40 files changed, 1397 insertions(+), 46 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patc=
h
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patc=
h
>  create mode 100644
> meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-1.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-2.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-3.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-4.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-5.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-6.patch
>  create mode 100644
> meta-networking/recipes-support/dovecot/dovecot/CVE-2025-30189-7.patch
>  create mode 100644
> meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb =3D>
> openvpn_2.6.17.bb} (98%)
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.p=
atch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb =3D>
> postgresql_17.7.bb} (69%)
>  rename meta-oe/recipes-devtools/php/{php_8.4.15.bb =3D> php_8.4.16.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
>  delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
>  rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb =3D>
> c-ares_1.34.6.bb} (87%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb =3D>
> imagemagick_7.1.2-12.bb} (99%)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb =3D=
>
> python3-django_4.2.27.bb} (79%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.8.bb =3D>
> python3-django_5.2.9.bb} (60%)
>
> --
> 2.52.0
>
>

--0000000000006f8e480647ef5903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good. Merged now, thanks Anuj</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jan 7, 2026 at 6:11=E2=80=AFPM Anuj Mittal &lt;<a href=3D"mailto:anu=
j.mittal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Please merge these c=
hanges in whinlatter. Tested on AB and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1225" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1225</a><br>
<br>
The following changes since commit a4e768dcfae181dd99e39c4286fa0729ca7f4e47=
:<br>
<br>
=C2=A0 bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA (2025-12-17 16:54:28 +0=
530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 fetchmail: patch CVE-2025-61962<br>
<br>
Gyorgy Sarvari (26):<br>
=C2=A0 fex: ignore unrelated CVEs<br>
=C2=A0 accountsservice: ignore CVE-2023-3297<br>
=C2=A0 minio: ignore irrelevant CVEs<br>
=C2=A0 cifs-utils: patch CVE-2025-2312<br>
=C2=A0 cups-filters: patch CVE-2025-64524<br>
=C2=A0 dovecot: patch CVE-2025-30189<br>
=C2=A0 fio: ignore CVE-2025-10824<br>
=C2=A0 tigervnc: fix typo in CVE_STATUS<br>
=C2=A0 tigervnc: sync xserver code with oe-core<br>
=C2=A0 tigervnc: ignore CVE-2023-6377<br>
=C2=A0 tigervnc: ignore CVE-2023-6478<br>
=C2=A0 tigervnc: ignore CVE-2025-26594...26601<br>
=C2=A0 civetweb: ignore CVE-2025-9648<br>
=C2=A0 freerdp3: ignore CVE-2025-68118<br>
=C2=A0 gimp: patch CVE-2025-14422<br>
=C2=A0 gimp: patch CVE-2025-14423<br>
=C2=A0 gimp: patch CVE-2025-14424<br>
=C2=A0 gimp: patch CVE-2025-14425<br>
=C2=A0 imagemagick: upgrade 7.1.2-8 -&gt; 7.1.2-12<br>
=C2=A0 libcoap: ignore CVE-2025-50518<br>
=C2=A0 openvpn: upgrade 2.6.16 -&gt; 2.6.17<br>
=C2=A0 php: upgrade 8.4.15 -&gt; 8.4.16<br>
=C2=A0 postgresql: upgrade 17.6 -&gt; 17.7<br>
=C2=A0 python3-configobj: ignore CVE-2023-26112<br>
=C2=A0 python3-django: upgrade 4.2.26 -&gt; 4.2.27<br>
=C2=A0 python3-django: upgrade 5.2.8 -&gt; 5.2.9<br>
<br>
Hugo SIMELIERE (2):<br>
=C2=A0 libwebsockets: fix CVE-2025-11677<br>
=C2=A0 libwebsockets: fix CVE-2025-11678<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 c-ares: upgrade 1.34.5 -&gt; 1.34.6<br>
<br>
=C2=A0.../gimp/gimp/CVE-2025-14422.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 66 +++++++<br>
=C2=A0.../gimp/gimp/CVE-2025-14423.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 106 ++++++++++++<br>
=C2=A0.../gimp/gimp/CVE-2025-14424.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 34 ++++<br>
=C2=A0.../gimp/gimp/CVE-2025-14425.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 79 +++++++++<br>
=C2=A0meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_3.0.6.bb" rel=3D"=
noreferrer" target=3D"_blank">gimp_3.0.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 15 +-<=
br>
=C2=A0.../<a href=3D"http://accountsservice_23.13.9.bb" rel=3D"noreferrer" =
target=3D"_blank">accountsservice_23.13.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../civetweb/<a href=3D"http://civetweb_1.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">civetweb_1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../libcoap/<a href=3D"http://libcoap_4.3.5a.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libcoap_4.3.5a.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../cifs/cifs-utils/CVE-2025-2312.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
35 +++++++++++++++<br>
=C2=A0.../recipes-support/cifs/<a href=3D"http://cifs-utils_7.0.bb" rel=3D"=
noreferrer" target=3D"_blank">cifs-utils_7.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-1.patch=C2=A0 =C2=A0 | 128 +++++++=
+++++++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-2.patch=C2=A0 =C2=A0 |=C2=A0 51 ++=
++++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-3.patch=C2=A0 =C2=A0 |=C2=A0 36 ++=
++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-4.patch=C2=A0 =C2=A0 |=C2=A0 72 ++=
++++++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-5.patch=C2=A0 =C2=A0 |=C2=A0 31 ++=
++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-6.patch=C2=A0 =C2=A0 |=C2=A0 88 ++=
++++++++<br>
=C2=A0.../dovecot/dovecot/CVE-2025-30189-7.patch=C2=A0 =C2=A0 |=C2=A0 76 ++=
+++++++<br>
=C2=A0.../dovecot/<a href=3D"http://dovecot_2.4.1-4.bb" rel=3D"noreferrer" =
target=3D"_blank">dovecot_2.4.1-4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../fetchmail/fetchmail/CVE-2025-61962.patch=C2=A0 |=C2=A0 51 ++++++<=
br>
=C2=A0.../fetchmail/<a href=3D"http://fetchmail_6.5.2.bb" rel=3D"noreferrer=
" target=3D"_blank">fetchmail_6.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://openvpn_2.6.16.bb" rel=3D"noreferrer" target=
=3D"_blank">openvpn_2.6.16.bb</a> =3D&gt; <a href=3D"http://openvpn_2.6.17.=
bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.17.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-benchmark/fio/<a href=3D"http://fio_3.39.bb" rel=3D"n=
oreferrer" target=3D"_blank">fio_3.39.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../libwebsockets/CVE-2025-11677.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
61 ++++++++++++++++++<br>
=C2=A0.../libwebsockets/CVE-2025-11678.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
28 ++++++++++++++<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.3.5.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.3.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +<br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0...{<a href=3D"http://postgresql_17.6.bb" rel=3D"noreferrer" target=
=3D"_blank">postgresql_17.6.bb</a> =3D&gt; <a href=3D"http://postgresql_17.=
7.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.7.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" rel=3D"no=
referrer" target=3D"_blank">fex_2511.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.4.15.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.15.bb</a> =3D&gt; <a href=3D"http://php_8.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.16.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-extended/minio/<a href=3D"http://minio_git.bb" rel=3D=
"noreferrer" target=3D"_blank">minio_git.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A06=
 +<br>
=C2=A0.../tigervnc/<a href=3D"http://tigervnc_1.15.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">tigervnc_1.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0.../cups/cups-filters/CVE-2025-64524.patch=C2=A0 =C2=A0 |=C2=A0 82 ++=
+++++++<br>
=C2=A0.../cups/<a href=3D"http://cups-filters_2.0.1.bb" rel=3D"noreferrer" =
target=3D"_blank">cups-filters_2.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../c-ares/0001-ares_uri-memory-leak.patch=C2=A0 =C2=A0 |=C2=A0 21 --=
-<br>
=C2=A0.../{<a href=3D"http://c-ares_1.34.5.bb" rel=3D"noreferrer" target=3D=
"_blank">c-ares_1.34.5.bb</a> =3D&gt; <a href=3D"http://c-ares_1.34.6.bb" r=
el=3D"noreferrer" target=3D"_blank">c-ares_1.34.6.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.18.0.bb" rel=3D"noreferrer" =
target=3D"_blank">freerdp3_3.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://ick_7.1.2-8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ick_7.1.2-8.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-12.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-12.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-configobj_5.0.9.bb" rel=3D"noref=
errer" target=3D"_blank">python3-configobj_5.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://ngo_4.2.26.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.26.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.27.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.27.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://jango_5.2.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_5.2.8.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.9.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A040 files changed, 1397 insertions(+), 46 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.p=
atch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.p=
atch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CV=
E-2025-2312.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-5.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-6.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CV=
E-2025-30189-7.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/fetchmail/fetchmai=
l/CVE-2025-61962.patch<br>
=C2=A0rename meta-networking/recipes-support/openvpn/{<a href=3D"http://ope=
nvpn_2.6.16.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.6.16.bb</a> =
=3D&gt; <a href=3D"http://openvpn_2.6.17.bb" rel=3D"noreferrer" target=3D"_=
blank">openvpn_2.6.17.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11677.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2025-11678.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
7.6.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.6.bb</a> =3D&gt;=
 <a href=3D"http://postgresql_17.7.bb" rel=3D"noreferrer" target=3D"_blank"=
>postgresql_17.7.bb</a>} (69%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.15.bb</a> =3D&gt; <a href=3D"=
http://php_8.4.16.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.16.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-202=
5-64524.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_ur=
i-memory-leak.patch<br>
=C2=A0rename meta-oe/recipes-support/c-ares/{<a href=3D"http://c-ares_1.34.=
5.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.5.bb</a> =3D&gt; <a =
href=3D"http://c-ares_1.34.6.bb" rel=3D"noreferrer" target=3D"_blank">c-are=
s_1.34.6.bb</a>} (87%)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-8.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-8.b=
b</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-12.bb" rel=3D"noreferrer"=
 target=3D"_blank">imagemagick_7.1.2-12.bb</a>} (99%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.26.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
26.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.27.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.27.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.8=
.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.9.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_5.2.9.bb</a>} (60%)<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--0000000000006f8e480647ef5903--

