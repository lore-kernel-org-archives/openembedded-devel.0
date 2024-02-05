Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33277C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 22:33:51 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.7858.1707172424077349189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 14:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1j+tDO1;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2196dd318feso1375784fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 14:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707172423; x=1707777223; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvbw6k7Pd1l23eH9l/2LZVPttEPEieymfQgehVM6+MA=;
        b=A1j+tDO1pgHBRaubxJHmkv5um1NkvTvqJdnEVVdhO8mROXhhNijR1mFAkFvbAt3Sfc
         4neUi/7apkM1I9BSA8cXr7J4pxgRYresnsI/ku3IAZYbg+8MYnhXZ2q+MFT2K7kW6MrX
         vPZSTs9q71JvAIcOBcalnJgrYfLbsHd8UbWhhCdiImdjohRIXEMIDA+Yz1N5DmP9gSJo
         JXefNeTc+di9UYrRiwWFrbkVJcgX+JVS+71wWJuOqycXU/fU/w5git+GrgOQdBZ3KwPE
         wdWleL2ydVQ2zOU3ORvdjZgY+1577XvDprnAzuulxRXvyIxm2mFgjhB/9QkoysRTkbBh
         CgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707172423; x=1707777223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvbw6k7Pd1l23eH9l/2LZVPttEPEieymfQgehVM6+MA=;
        b=Ch2rqGze3Pf2wrmGro0paSFPYDhO8XKifE4z+5rOEwiT1tpY2Ap/upDq0C2X7ZLv06
         ogja/vCa4lu95TUohqlwq1SXbz6CjrAl09ONI7ARmth+GVARK1tEgMXW4NJ5qxwCmnSS
         3TwajfDOVOMVdAqb5OiZfqoMd+BpPnv3Np1j+pNWA6D3DDBKx5kiID2s4aBL9tskVMcW
         yMq86lwhW7kXUb8F7wnR7GM595lJAIehpfVE1eZvf4+c438OtVx5nVot+alO5gBvG6Ey
         nwwtWiSLgzoRNnbBwgj4g3HzV1xxzyiZGkTiOvK476Lr+MKW3iCjBqQ9hciUFYRutXu5
         aTbg==
X-Gm-Message-State: AOJu0YyfHqagNWg2TqKwvTZo2RMf3VW/o8qDfNHskpz4H2NrftFH7s7m
	35dglNVemI5OxtAEDh4NGZif+d4uR6tfd3uf/A6HT72x6Wg4Sxxg+bSRXVA+o3LntfXRiAVV52q
	7NUwoO3KlX151v41+IyaaPsPPWcw=
X-Google-Smtp-Source: AGHT+IFnFcpyBHKLOn5KFNQ27DQlNKpjpzo0Nu8NrhvlWdDsEj61FHCOnDk3K07m+VNTgxdN5UQVLZoAgGLEMHhrBi4=
X-Received: by 2002:a05:6871:b2b:b0:219:86d6:e052 with SMTP id
 fq43-20020a0568710b2b00b0021986d6e052mr1165572oab.10.1707172423233; Mon, 05
 Feb 2024 14:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20230615144650.613381-1-raj.khem@gmail.com> <CAJiuCccAgLYfGAhR18t7BC5QNy9zozZG9-TaTNjAiLMsO8pxng@mail.gmail.com>
In-Reply-To: <CAJiuCccAgLYfGAhR18t7BC5QNy9zozZG9-TaTNjAiLMsO8pxng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Feb 2024 14:33:17 -0800
Message-ID: <CAMKF1spF=vkiNDmUmH3PdYY93uRfMX9_A-TKQjzCOfNfyQ0kzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Upgrade to 2.7.1 release
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 22:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108583

On Mon, Feb 5, 2024 at 2:11=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
>
> Hi Khem,
>
> On Thu, 15 Jun 2023 at 16:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 -------------------
>>  ...e-for-mips-ispeed-ospeed-termios-abs.patch | 17 ++++----
>>  .../{influxdb_1.8.10.bb =3D> influxdb_2.7.1.bb} |  7 ++--
>>  3 files changed, 11 insertions(+), 52 deletions(-)
>>  delete mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.=
2-xxhash-to-fix-build-with-go-1.17.patch
>>  rename meta-oe/recipes-dbs/influxdb/{influxdb_1.8.10.bb =3D> influxdb_2=
.7.1.bb} (87%)
>>
>
> Seems that this patch has never been upstreamed. Am I correct?
>
> Is there any reason?

its already in master via 6e9faaa57889b16ff5b4b32a7c48fb8474c39c42

>
> Thanks & Regards
>
>
>>
>> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhas=
h-to-fix-build-with-go-1.17.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0=
001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
>> deleted file mode 100644
>> index e31c7be1ec..0000000000
>> --- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fi=
x-build-with-go-1.17.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 30 Nov 2021 15:14:39 -0800
>> -Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17
>> -
>> -Fixes
>> -| # github.com/cespare/xxhash
>> -| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by a =
global variable access and is used here: 000
>> -92 (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.10=
-r0/build/pkg/mod/github.com/cespare/xxhash@
>> -v1.1.0/xxhash_amd64.s:120)        ADDQ    R15, AX
>> -| asm: assembly failed
>> -
>> -Upstream-Status: Backport [https://github.com/cespare/xxhash/commit/e7a=
6b52374f7e2abfb8abb27249d53a1997b09a7]
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - go.mod | 3 ++-
>> - go.sum | 2 ++
>> - 2 files changed, 4 insertions(+), 1 deletion(-)
>> -
>> ---- a/go.mod
>> -+++ b/go.mod
>> -@@ -55,3 +55,5 @@ require (
>> -       gonum.org/v1/gonum v0.6.0 // indirect
>> -       google.golang.org/grpc v1.26.0
>> - )
>> -+
>> -+replace github.com/cespare/xxhash =3D> github.com/kraj/xxhash v1.1.1-0=
.20211201014032-8254a11eab56
>> ---- a/go.sum
>> -+++ b/go.sum
>> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
>> - github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYi=
o2l3bCsQ=3D
>> - github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKST=
VE=3D
>> - github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham=
/4vfdArNI=3D
>> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0jTk=
NInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D
>> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h1:=
XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D
>> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9=
A=3D
>> - github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIv=
Ni/34Woo=3D
>> - github.com/mattn/go-colorable v0.0.9 h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2=
l4OW6ddYRUIY4=3D
>> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-modul=
e-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/i=
nfluxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
>> index b05fd3666b..55382b4636 100644
>> --- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-m=
ips-ispeed-ospeed-termios-abs.patch
>> +++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-m=
ips-ispeed-ospeed-termios-abs.patch
>> @@ -12,20 +12,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>>  --- a/go.mod
>>  +++ b/go.mod
>> -@@ -56,4 +56,5 @@ require (
>> -       google.golang.org/grpc v1.26.0
>> +@@ -223,3 +223,4 @@ require (
>>   )
>>
>> + replace github.com/nats-io/nats-streaming-server v0.11.2 =3D> github.c=
om/influxdata/nats-streaming-server v0.11.3-0.20201112040610-c277f7560803
>>  +replace github.com/pkg/term =3D> github.com/kraj/term v0.0.0-202101112=
31523-7c42fcb0e627
>> - replace github.com/cespare/xxhash =3D> github.com/kraj/xxhash v1.1.1-0=
.20211201014032-8254a11eab56
>>  --- a/go.sum
>>  +++ b/go.sum
>> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
>> - github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYi=
o2l3bCsQ=3D
>> - github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKST=
VE=3D
>> +@@ -610,6 +610,8 @@ github.com/kr/pty v1.1.1/go.mod h1:pFQYn
>>   github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham=
/4vfdArNI=3D
>> + github.com/kr/text v0.2.0 h1:5Nx0Ya0ZqY2ygV366QzturHI13Jq95ApcVaJBhpS+=
AY=3D
>> + github.com/kr/text v0.2.0/go.mod h1:eLer722TekiGuMkidMxC/pM04lWEeraHUU=
mBw8l2grE=3D
>>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627 h1:3/XXm86KqrO=
ZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=3D
>>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627/go.mod h1:BYR4=
E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=3D
>> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0jTk=
NInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D
>> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h1:=
XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D
>> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9=
A=3D
>> + github.com/labstack/echo/v4 v4.2.1/go.mod h1:AA49e0DZ8kk5jTOOCKNuPR6oT=
nBS0dYiM4FW1e6jwpg=3D
>> + github.com/labstack/gommon v0.3.0/go.mod h1:MULnywXg0yavhxWKc+lOruYdAh=
DwPK9wf0OL7NoOu+k=3D
>> + github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 h1:SOEGU9fK=
iNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw=3D
>> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/r=
ecipes-dbs/influxdb/influxdb_2.7.1.bb
>> similarity index 87%
>> rename from meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
>> rename to meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
>> index 50995c09b6..b29b9b8898 100644
>> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
>> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "InfluxDB is a time series database desi=
gned to handle high write
>>  HOMEPAGE =3D "https://www.influxdata.com/products/influxdb-overview/"
>>
>>  LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Df39a8d10930=
fb37bd59adabb3b9d0bd6"
>> +LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D86f93342918=
318318c795b9999bd8131"
>>
>>  RDEPENDS:${PN} =3D "bash"
>>  RDEPENDS:${PN}-dev =3D "bash"
>> @@ -15,15 +15,14 @@ GO_INSTALL =3D "\
>>  "
>>
>>  SRC_URI =3D "\
>> -    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${BPN=
}-${PV}/src/${GO_IMPORT} \
>> -    file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patch=
dir=3Dsrc/${GO_IMPORT} \
>> +    git://${GO_IMPORT};protocol=3Dhttps;branch=3D2.7;destsuffix=3D${BPN=
}-${PV}/src/${GO_IMPORT} \
>>      file://influxdb \
>>      file://influxdb.conf \
>>  "
>>
>>  SRC_URI:append:mipsarch =3D " file://0001-patch-term-module-for-mips-is=
peed-ospeed-termios-abs.patch;patchdir=3Dsrc/${GO_IMPORT}"
>>
>> -SRCREV =3D "688e697c51fd5353725da078555adbeff0363d01"
>> +SRCREV =3D "407fa622e9a0a48516dacc7564f7ba59c8307da9"
>>
>>  inherit go-mod pkgconfig systemd update-rc.d useradd
>>
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103307): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103307
>> Mute This Topic: https://lists.openembedded.org/mt/99550402/4240582
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
peron.clem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

