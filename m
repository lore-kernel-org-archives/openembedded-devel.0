Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E68CD54BF
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 19:07:11 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.559.1695668823494641311
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 12:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Esy1K4xJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6bf038b8f87so4239012a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695668823; x=1696273623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+AAIG1ogs2Bl9AOLHv9odcg5oPA3GNCKWJNz4p9Bvk=;
        b=Esy1K4xJhSuqn7RfSVDmEQYo7Q1/n/fH+RKVAV8u07vgaUcbTnIzUkI7+yt/Yb14cD
         lgn92INmsgM68Z2kpOTL9mZPEeacL4ZfBQTnW/sC2DnGye5yo+5wh0vk1F1XjD3SADD+
         Ezsd4QRySO7uo+5kxnxY4niDsvCTfnFvtyvvuakqvwpvR08MMxzl9830HeOoShw/OGLh
         80XMQP3W1y8a7iWW+50mAbzV/2glXF7fveAs1ud1Zt6efcmeddxkzAGXJd2q6mk2pHhf
         orizQjoGVKsB4UB4UO1nr5/Q9tXPlOc1GNvAt/wKevF5W824ionikwTlSLUaAv9/Ri23
         Iacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695668823; x=1696273623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+AAIG1ogs2Bl9AOLHv9odcg5oPA3GNCKWJNz4p9Bvk=;
        b=SnzbwHdbHd5udN7RX3O8JgS2WRxGXsHUW0XekfLVhDhvf6JE5IjZGdobyMcUKK6FhX
         abR9NwJbL0jO7wDjSK9jgc3h8k3x14Hsfqd8/8jNKM9n2RWx/7LVigyB5HFQZnTveJL2
         csi7TNcoRj2LapnIThA1QPY15qADl81kbSVuFHSiBUmeC7yjC5yFU+3vhZx3R9gWwXCu
         ZgLRMeSt2ibZdqTfs9NyN8knY3rJ2sjaiDUxeNHuJdHNCR+psJjdJMjgLv1lAX5+G+FY
         NUpQw2p1Ye25FwT0WYml740HVdhX6Al/tZnW53DV2S3XGr++owQam6Aau7yCfifDxfFd
         O0+w==
X-Gm-Message-State: AOJu0YxQn7bc6VPx/G+sAJ2WeAubiKongYt06bJpJJvI94Y/KLJbhQ4x
	UrUvn5/lF6JSbA3dTQG3DDzQeeeCZYEEA1UosII=
X-Google-Smtp-Source: AGHT+IHcvbPS8C8c9IPueTQv+XRw0OUTuy6bT43mEkcMZ1cSPYVn9AT+7c0acrYXLu0oMzdu+8Sfw0LSYgawrcgFSoQ=
X-Received: by 2002:a05:6870:b153:b0:1d4:eefb:3ae5 with SMTP id
 a19-20020a056870b15300b001d4eefb3ae5mr365263oal.15.1695668822723; Mon, 25 Sep
 2023 12:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230925131349.12941-1-costamagnagianfranco@yahoo.it>
 <CAMKF1soBhLJudUsZ0MLcC2Xhg4nkm7Li12Akz0KBRy8dD6fKwg@mail.gmail.com> <CAATN8PVgOT9EGiDrUnWiWtvjvOhydyog2Y-zme1r-GEjs3hFgg@mail.gmail.com>
In-Reply-To: <CAATN8PVgOT9EGiDrUnWiWtvjvOhydyog2Y-zme1r-GEjs3hFgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 12:06:36 -0700
Message-ID: <CAMKF1sqErN1+G_3LHt=YOUsquYBiuJo4JXRpo-XMeg_DKHJVvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto: upgrade 2.0.17 -> 2.0.18
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 19:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105133

On Mon, Sep 25, 2023 at 11:59=E2=80=AFAM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> Hello, since I maintain the same patch set for both Debian, Ubuntu and me=
ta-oe, I would prefer to use cp to keep them in sync between releases... (w=
henever possible, specially for upstream proposed PRs)
>

I like the maintenance part so keep up good job !

> If you want me to add it anyway, please let me know!

If it does not hinder your workflow, it would be good to document it
the OE/Yocto way but if it does, then leave it as is.

>
> G.
>
> On Mon, Sep 25, 2023, 19:58 Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Sep 25, 2023 at 6:15=E2=80=AFAM Gianfranco
>> <costamagna.gianfranco@gmail.com> wrote:
>> >
>> > Add two patches from Debian, pull requests proposed upstream as 2894 a=
nd 2895
>> > to make it start only when board is online, and to fix dynamic websock=
ets link failure
>> > ---
>> >  .../mosquitto/files/2894.patch                | 23 +++++++++++++++++
>> >  .../mosquitto/files/2895.patch                | 25 ++++++++++++++++++=
+
>> >  ...osquitto_2.0.17.bb =3D> mosquitto_2.0.18.bb} |  4 ++-
>> >  3 files changed, 51 insertions(+), 1 deletion(-)
>> >  create mode 100644 meta-networking/recipes-connectivity/mosquitto/fil=
es/2894.patch
>> >  create mode 100644 meta-networking/recipes-connectivity/mosquitto/fil=
es/2895.patch
>> >  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.=
17.bb =3D> mosquitto_2.0.18.bb} (95%)
>> >
>> > diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> > new file mode 100644
>> > index 000000000..3275e57e3
>> > --- /dev/null
>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> > @@ -0,0 +1,23 @@
>> > +From: Joachim Zobel <jz-2017@heute-morgen.de>
>> > +Date: Wed, 13 Sep 2023 09:55:34 +0200
>> > +Subject: [PATCH] Link correctly with shared websockets library if nee=
ded see:
>> > + https://github.com/eclipse/mosquitto/pull/2751
>> > +
>> > +Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Dan=
iel Engberg <daniel.engberg.lists@pyret.net>
>>
>> It will be good to annotate the patch with Signed-off-by and Upstream-St=
atus:
>>
>> https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.h=
tml?highlight=3Dupstream+status#patch-upstream-status
>>
>> > +---
>> > + src/CMakeLists.txt | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>> > +index 9380a04..dce8313 100644
>> > +--- a/src/CMakeLists.txt
>> > ++++ b/src/CMakeLists.txt
>> > +@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
>> > +                       link_directories(${mosquitto_SOURCE_DIR})
>> > +               endif (WIN32)
>> > +       else (STATIC_WEBSOCKETS)
>> > +-              set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
>> > ++              set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
>> > +       endif (STATIC_WEBSOCKETS)
>> > + endif (WITH_WEBSOCKETS)
>> > +
>> > diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> > new file mode 100644
>> > index 000000000..a9e9c97b8
>> > --- /dev/null
>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> > @@ -0,0 +1,25 @@
>> > +From: Joachim Zobel <jz-2017@heute-morgen.de>
>> > +Date: Wed, 13 Sep 2023 10:05:43 +0200
>> > +Subject: [PATCH] Mosquitto now waits for network-online when starting
>> > + (Closes: #1036450)
>> > +
>> > +See: https://github.com/eclipse/mosquitto/issues/2878
>> > +---
>> > + service/systemd/mosquitto.service.simple | 4 ++--
>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>> > +
>> > +diff --git a/service/systemd/mosquitto.service.simple b/service/syste=
md/mosquitto.service.simple
>> > +index 15ee0d6..c2a330b 100644
>> > +--- a/service/systemd/mosquitto.service.simple
>> > ++++ b/service/systemd/mosquitto.service.simple
>> > +@@ -1,8 +1,8 @@
>> > + [Unit]
>> > + Description=3DMosquitto MQTT Broker
>> > + Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)
>> > +-After=3Dnetwork.target
>> > +-Wants=3Dnetwork.target
>> > ++After=3Dnetwork-online.target
>> > ++Wants=3Dnetwork-online.target
>> > +
>> > + [Service]
>> > + ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
>> > diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_=
2.0.17.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18=
.bb
>> > similarity index 95%
>> > rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2=
.0.17.bb
>> > rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0=
.18.bb
>> > index 690b6bc12..0c9ccc810 100644
>> > --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.=
bb
>> > +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.=
bb
>> > @@ -17,9 +17,11 @@ DEPENDS =3D "uthash cjson"
>> >  SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz=
 \
>> >             file://mosquitto.init \
>> >             file://1571.patch \
>> > +           file://2894.patch \
>> > +           file://2895.patch \
>> >  "
>> >
>> > -SRC_URI[sha256sum] =3D "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a=
448ef1f7fc077dba52f"
>> > +SRC_URI[sha256sum] =3D "d665fe7d0032881b1371a47f34169ee4edab67903b2cd=
2b4c083822823f4448a"
>> >
>> >  inherit systemd update-rc.d useradd cmake pkgconfig
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#105128): https://lists.openembedded.org/g/openembe=
dded-devel/message/105128
>> > Mute This Topic: https://lists.openembedded.org/mt/101573484/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

