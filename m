Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C648DC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 09:57:54 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.18199.1707213474005253826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 01:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKEfqSma;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5114b1e8819so3214570e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 01:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707213472; x=1707818272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp7ffFYmzptae5ONw54iNxmscMIFJFBhBkRRig/HDvQ=;
        b=hKEfqSmaR8tHvqw5XtMbnB6Sti3kSeeH2gC/97AMtjWHIVvXKPBjZjW17xN4Q9kBQf
         yktVPtqnkWaXu36rc4v4Zj3lmcHxu2henM/q0qhrq3Na4ZFago44GjfkqF1q2uXaZLWm
         a7e7APvq4Qgr9rVccDJWX4cZuf1ZFVm0slp0RoIA3HJxw0fnOUqqZASlcUrfyFEljnNJ
         tpk2bc/qxhWIXf+Tpnt4ByAPacfhS15l+zY00CY38OJXnM9lzMKncd0OZtw/8Su1LcbP
         jnnbC8dnsti+6S6wE5+Nc0ZcR46m06Gzdg9vPMdIq3b6+kJP8PYWyU4HvPr06KNMVrg3
         EEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213472; x=1707818272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp7ffFYmzptae5ONw54iNxmscMIFJFBhBkRRig/HDvQ=;
        b=iPmJPPy5c7UlpwAc7RB9Do0C9yjqFcSCYwW6K3gQPJeYexX2qNHeottNWiLzlhiGfU
         j4UJTyEQbL1k/qPVu1bnPmGFCG6Fqkvau+cCCulchp4xICtmCw4v3B3nckyU0dhQhc7Z
         pTMVSUuX+uWqmJYg5Wo+bPcEJ+EdeMRof83Oy8KoczZj9Sp5UrvE5VboYN/+hvGE2o/v
         XDmbCEvFwgay+IUM97fAn59CK1DmnJlDOD5ppGDmGK5d3/cgcuwlqjw9DPORcksQXsEf
         Ulih0oO8Jg/G3YuzLPSSRBbkocXF9/TOOoQ3ZiF/NICiHjUK8N55lvNN0W/RFfeWGXaU
         cxYQ==
X-Gm-Message-State: AOJu0Yw7fsLdpnspB75HxYH3OgivC1WtTn04w8yAfuirQUomYiSpc5pD
	VBJ+AS6AY68SQDsRgIDvZu3pTwpPkhBOPIuTKQCxRAN6MY3p/0xwVDfo6mUi97s5mxZnPMjCslT
	lJBC3q+00YKcUPqeSPmWb3f9/4I6cNDsARvjI3g==
X-Google-Smtp-Source: AGHT+IHz+kmVgE0qEE1F2gWnza9PPxRSawqs8I64w4IUJqir3nSw6X9sxx1hZE6RTC8WlDoaEDfRG81uaLFqHXZs4as=
X-Received: by 2002:ac2:4e85:0:b0:511:3bd1:11d with SMTP id
 o5-20020ac24e85000000b005113bd1011dmr1058712lfr.36.1707213471694; Tue, 06 Feb
 2024 01:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20230615144650.613381-1-raj.khem@gmail.com> <CAJiuCccAgLYfGAhR18t7BC5QNy9zozZG9-TaTNjAiLMsO8pxng@mail.gmail.com>
 <CAMKF1spF=vkiNDmUmH3PdYY93uRfMX9_A-TKQjzCOfNfyQ0kzg@mail.gmail.com>
In-Reply-To: <CAMKF1spF=vkiNDmUmH3PdYY93uRfMX9_A-TKQjzCOfNfyQ0kzg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 6 Feb 2024 10:57:40 +0100
Message-ID: <CAJiuCcd1QoYUDDCbtAaYSjzLNe8NpT-_t9LtDoGNXDqYwFMwFQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Upgrade to 2.7.1 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 09:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108621

Hi,

On Mon, 5 Feb 2024 at 23:33, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Feb 5, 2024 at 2:11=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:
> >
> > Hi Khem,
> >
> > On Thu, 15 Jun 2023 at 16:49, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 ------------------=
-
> >>  ...e-for-mips-ispeed-ospeed-termios-abs.patch | 17 ++++----
> >>  .../{influxdb_1.8.10.bb =3D> influxdb_2.7.1.bb} |  7 ++--
> >>  3 files changed, 11 insertions(+), 52 deletions(-)
> >>  delete mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.=
1.2-xxhash-to-fix-build-with-go-1.17.patch
> >>  rename meta-oe/recipes-dbs/influxdb/{influxdb_1.8.10.bb =3D> influxdb=
_2.7.1.bb} (87%)
> >>
> >
> > Seems that this patch has never been upstreamed. Am I correct?
> >
> > Is there any reason?
>
> its already in master via 6e9faaa57889b16ff5b4b32a7c48fb8474c39c42

https://github.com/openembedded/meta-openembedded/commit/6e9faaa57889b16ff5=
b4b32a7c48fb8474c39c42

is =3D> influxdb: Upgrade to 1.8.10

not: "Upgrade to 2.7.1 release"

Thanks

>
> >
> > Thanks & Regards
> >
> >
> >>
> >> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxh=
ash-to-fix-build-with-go-1.17.patch b/meta-oe/recipes-dbs/influxdb/influxdb=
/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
> >> deleted file mode 100644
> >> index e31c7be1ec..0000000000
> >> --- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-=
fix-build-with-go-1.17.patch
> >> +++ /dev/null
> >> @@ -1,39 +0,0 @@
> >> -From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 200=
1
> >> -From: Khem Raj <raj.khem@gmail.com>
> >> -Date: Tue, 30 Nov 2021 15:14:39 -0800
> >> -Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17
> >> -
> >> -Fixes
> >> -| # github.com/cespare/xxhash
> >> -| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by =
a global variable access and is used here: 000
> >> -92 (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.=
10-r0/build/pkg/mod/github.com/cespare/xxhash@
> >> -v1.1.0/xxhash_amd64.s:120)        ADDQ    R15, AX
> >> -| asm: assembly failed
> >> -
> >> -Upstream-Status: Backport [https://github.com/cespare/xxhash/commit/e=
7a6b52374f7e2abfb8abb27249d53a1997b09a7]
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - go.mod | 3 ++-
> >> - go.sum | 2 ++
> >> - 2 files changed, 4 insertions(+), 1 deletion(-)
> >> -
> >> ---- a/go.mod
> >> -+++ b/go.mod
> >> -@@ -55,3 +55,5 @@ require (
> >> -       gonum.org/v1/gonum v0.6.0 // indirect
> >> -       google.golang.org/grpc v1.26.0
> >> - )
> >> -+
> >> -+replace github.com/cespare/xxhash =3D> github.com/kraj/xxhash v1.1.1=
-0.20211201014032-8254a11eab56
> >> ---- a/go.sum
> >> -+++ b/go.sum
> >> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
> >> - github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3c=
Yio2l3bCsQ=3D
> >> - github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaK=
STVE=3D
> >> - github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVh=
am/4vfdArNI=3D
> >> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0j=
TkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D
> >> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h=
1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D
> >> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2u=
s9A=3D
> >> - github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQ=
IvNi/34Woo=3D
> >> - github.com/mattn/go-colorable v0.0.9 h1:UVL0vNpWh04HeJXV0KLcaT7r06gO=
H2l4OW6ddYRUIY4=3D
> >> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-mod=
ule-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb=
/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
> >> index b05fd3666b..55382b4636 100644
> >> --- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for=
-mips-ispeed-ospeed-termios-abs.patch
> >> +++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for=
-mips-ispeed-ospeed-termios-abs.patch
> >> @@ -12,20 +12,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>
> >>  --- a/go.mod
> >>  +++ b/go.mod
> >> -@@ -56,4 +56,5 @@ require (
> >> -       google.golang.org/grpc v1.26.0
> >> +@@ -223,3 +223,4 @@ require (
> >>   )
> >>
> >> + replace github.com/nats-io/nats-streaming-server v0.11.2 =3D> github=
.com/influxdata/nats-streaming-server v0.11.3-0.20201112040610-c277f7560803
> >>  +replace github.com/pkg/term =3D> github.com/kraj/term v0.0.0-2021011=
1231523-7c42fcb0e627
> >> - replace github.com/cespare/xxhash =3D> github.com/kraj/xxhash v1.1.1=
-0.20211201014032-8254a11eab56
> >>  --- a/go.sum
> >>  +++ b/go.sum
> >> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
> >> - github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3c=
Yio2l3bCsQ=3D
> >> - github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaK=
STVE=3D
> >> +@@ -610,6 +610,8 @@ github.com/kr/pty v1.1.1/go.mod h1:pFQYn
> >>   github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVh=
am/4vfdArNI=3D
> >> + github.com/kr/text v0.2.0 h1:5Nx0Ya0ZqY2ygV366QzturHI13Jq95ApcVaJBhp=
S+AY=3D
> >> + github.com/kr/text v0.2.0/go.mod h1:eLer722TekiGuMkidMxC/pM04lWEeraH=
UUmBw8l2grE=3D
> >>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627 h1:3/XXm86Kq=
rOZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=3D
> >>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627/go.mod h1:BY=
R4E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=3D
> >> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0j=
TkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D
> >> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h=
1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D
> >> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2u=
s9A=3D
> >> + github.com/labstack/echo/v4 v4.2.1/go.mod h1:AA49e0DZ8kk5jTOOCKNuPR6=
oTnBS0dYiM4FW1e6jwpg=3D
> >> + github.com/labstack/gommon v0.3.0/go.mod h1:MULnywXg0yavhxWKc+lOruYd=
AhDwPK9wf0OL7NoOu+k=3D
> >> + github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 h1:SOEGU9=
fKiNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw=3D
> >> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe=
/recipes-dbs/influxdb/influxdb_2.7.1.bb
> >> similarity index 87%
> >> rename from meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> >> rename to meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
> >> index 50995c09b6..b29b9b8898 100644
> >> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> >> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
> >> @@ -2,7 +2,7 @@ DESCRIPTION =3D "InfluxDB is a time series database de=
signed to handle high write
> >>  HOMEPAGE =3D "https://www.influxdata.com/products/influxdb-overview/"
> >>
> >>  LICENSE =3D "MIT"
> >> -LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Df39a8d109=
30fb37bd59adabb3b9d0bd6"
> >> +LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3D86f933429=
18318318c795b9999bd8131"
> >>
> >>  RDEPENDS:${PN} =3D "bash"
> >>  RDEPENDS:${PN}-dev =3D "bash"
> >> @@ -15,15 +15,14 @@ GO_INSTALL =3D "\
> >>  "
> >>
> >>  SRC_URI =3D "\
> >> -    git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${B=
PN}-${PV}/src/${GO_IMPORT} \
> >> -    file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;pat=
chdir=3Dsrc/${GO_IMPORT} \
> >> +    git://${GO_IMPORT};protocol=3Dhttps;branch=3D2.7;destsuffix=3D${B=
PN}-${PV}/src/${GO_IMPORT} \
> >>      file://influxdb \
> >>      file://influxdb.conf \
> >>  "
> >>
> >>  SRC_URI:append:mipsarch =3D " file://0001-patch-term-module-for-mips-=
ispeed-ospeed-termios-abs.patch;patchdir=3Dsrc/${GO_IMPORT}"
> >>
> >> -SRCREV =3D "688e697c51fd5353725da078555adbeff0363d01"
> >> +SRCREV =3D "407fa622e9a0a48516dacc7564f7ba59c8307da9"
> >>
> >>  inherit go-mod pkgconfig systemd update-rc.d useradd
> >>
> >> --
> >> 2.41.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#103307): https://lists.openembedded.org/g/openembe=
dded-devel/message/103307
> >> Mute This Topic: https://lists.openembedded.org/mt/99550402/4240582
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [peron.clem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

