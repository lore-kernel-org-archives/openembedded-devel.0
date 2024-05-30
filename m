Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2ADC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:58:47 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.13701.1717084725985787142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 08:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmFRNOKr;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f8f56a30a4so563050a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717084725; x=1717689525; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pK/mSzwOcIxesbRotgI/zJUbNt2QWqA1HOSkxszpBs=;
        b=BmFRNOKr+pufKMlA6/oVsrfzcih05oQIDwG8olERugvLQce56fF52+0rWuayRyT+57
         KMF+6NjNItSRuBe4bXGDb3iSPlGI96tHBDTKiT6vZQmfAeEyfG/YLxne2Y2wOnlYTMyP
         usw5CXKoBVvLCKL4xk/tvAvSqsxR3BDCmYMUx5Z3U+UjWTU4Gag0qZmF+eR5FDC8Yx+D
         5sD58Y5RU9WlJBaVIik5iOCgzfw6hRPdRhhtimHphqrM0pDx0TvNpO4zEc/FYskqPr82
         c1Kp5b4MZsuw+NVSm+2pGuFs57H2YH9sSFL3cHrM01QCJ2BaKqfNwfw5RpM2LUh39esm
         yxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084725; x=1717689525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pK/mSzwOcIxesbRotgI/zJUbNt2QWqA1HOSkxszpBs=;
        b=VqzhDAw1crS7B5dFkTYfO2XQ+0CnaWVz6rG4sf4uTKOdmXaM6mC8glTEB48C+07CCz
         I48ooFgyDa7QiGwJ5/IWwAoFlRBZ1IOerFS1IoLbjV2IER7SmYpXtDSJXdUBuYFaE7Dc
         aTB8FaIeQg0tu5C8nCvruOX+vI8wMA+YQEKZX7XK0rn+RNLoePUDoh/Fds4dt20TyYpO
         7pjYnovdmkVgB16h3H3kYglUeknYFgO0bescmm+98WAEXN4O5XNAlBXTknSpOSGD0hZz
         1Fq0lVTxZFv2cLiRKFaSoYItFheNL7aTCxUJ0p+xK7oTaw9c2jmX1/A0IAIQW0kE4SCC
         0fZg==
X-Forwarded-Encrypted: i=1; AJvYcCX32+xQiaEa46Vp2J28kYlb7vrcqjT7/6mrK02HnjPfTtJ0xqOTOk0F6tnkRDwS5wYIoRi3VLequpktF98d919xS9bIP6oVaBo2DFA9GAU77MO99x+PLYyGZQ==
X-Gm-Message-State: AOJu0YxHn0WCBEimIMc/cqzQbhAjtw9Qcddj4YJn9izOBKIQuZryFvaz
	/th3S9QJ24NyP+j7wgzE/EFj479Bgx7MsNbBqm6VrB5aLicLsv+qzomMxlzPcOjAGnVUJQVdoXz
	Q08O5itau4iaRokhigSuwKIkJNqDUCnrt
X-Google-Smtp-Source: AGHT+IH3eJETxz78NQtFmip9c9wiLHfKDSQ2iAZldyzLZp5Yc12iI/6L2+Cd2gNKF5JW+sLOc35TVgVObpxyrNf0qcU=
X-Received: by 2002:a05:6870:1492:b0:232:f9da:5cf3 with SMTP id
 586e51a60fabf-25060b6e708mr2964528fac.15.1717084725052; Thu, 30 May 2024
 08:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240530123501.2890879-1-akuster808@gmail.com>
 <CA+chaQdv7zN4uZ8=ROoyajZrUPnLa8avxrQnM9g5=RaCDMJ9sg@mail.gmail.com> <7b528b1c-15d9-413f-a101-b3af07f6d878@gmail.com>
In-Reply-To: <7b528b1c-15d9-413f-a101-b3af07f6d878@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 08:58:19 -0700
Message-ID: <CAMKF1sp9GGb2jhAnY9NTjSseJ8DN1vggixd014yY2eUaK5m3ag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] pcapplusplus: Fix build with gcc14
To: akuster808 <akuster808@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110631

On Thu, May 30, 2024 at 8:55=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
>
>
> On 5/30/24 8:40 AM, Martin Jansa wrote:
> > Why is this needed in scarthgap? GCC upgrade won't be backported there
> > I believe and it doesn't have native/nativesdk to be useful on hosts
> > with gcc-14.
>
> My scarthgap build fails with the same error:
>
>   /builds/stable/build/tmp/work/core2-32-poky-linux/pcapplusplus/23.09/gi=
t/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>=
' is used uninitialized [-Werror=3Duninitialized]
> |    23 |         timespec nsec_time;
> |       |                  ^~~~~~~~~
> | cc1plus: all warnings being treated as errors
>
> Pkg builds after patch is applied.  Should I add a note to this in the
> backport?

I think the preset for this fix was GCC-14 but this fix was general.
So backport is fine and perhaps adding context is ok too. Upto you.

>
> BR,
> Armin
>
> >
> > On Thu, May 30, 2024 at 2:35=E2=80=AFPM Armin Kuster via
> > lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> From: Khem Raj <raj.khem@gmail.com>
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>   .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++=
++
> >>   ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 +++++++++++++++++=
+
> >>   .../pcapplusplus/pcapplusplus_23.09.bb        |  5 ++-
> >>   3 files changed, 73 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplu=
splus/0001-initialize-timespec-variable.patch
> >>   create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplu=
splus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
> >>
> >> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/00=
01-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcappl=
usplus/pcapplusplus/0001-initialize-timespec-variable.patch
> >> new file mode 100644
> >> index 0000000000..f2e210fc67
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-init=
ialize-timespec-variable.patch
> >> @@ -0,0 +1,35 @@
> >> +From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 200=
1
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Mon, 6 May 2024 12:15:30 -0700
> >> +Subject: [PATCH] initialize timespec variable
> >> +
> >> +Fixes build warnings with GCC14
> >> +
> >> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.0=
9/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacke=
t(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
> >> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.0=
9/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonym=
ous>' is used uninitialized [-Werror=3Duninitialized]
> >> +   23 |         timespec nsec_time;
> >> +      |                  ^~~~~~~~~
> >> +cc1plus: all warnings being treated as errors
> >> +
> >> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pu=
ll/1389]
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + Packet++/src/RawPacket.cpp | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
> >> +index 8ad52d52..07dbbbe2 100644
> >> +--- a/Packet++/src/RawPacket.cpp
> >> ++++ b/Packet++/src/RawPacket.cpp
> >> +@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor=
)
> >> +
> >> + RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeva=
l timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
> >> + {
> >> +-      timespec nsec_time;
> >> ++      timespec nsec_time =3D {};
> >> +       TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
> >> +       init(deleteRawDataAtDestructor);
> >> +       setRawData(pRawData, rawDataLen, nsec_time, layerType);
> >> +--
> >> +2.45.0
> >> +
> >> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/00=
01-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/rec=
ipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_Extern=
alRawData-in-IDnsResource-.patch
> >> new file mode 100644
> >> index 0000000000..b6389e0e3f
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-pack=
et-Initialize-m_ExternalRawData-in-IDnsResource-.patch
> >> @@ -0,0 +1,34 @@
> >> +From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 200=
1
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Thu, 9 May 2024 17:02:09 -0700
> >> +Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResour=
ce
> >> + constructor
> >> +
> >> +Fixes following warning with GCC-14
> >> +
> >> +Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource:=
:m_ExternalRawData' may be used uninitialized [-Werror=3Dmaybe-uninitialize=
d]
> >> +   29 |                 return m_ExternalRawData;
> >> +      |                        ^~~~~~~~~~~~~~~~~
> >> +
> >> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pu=
ll/1391]
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + Packet++/src/DnsResource.cpp | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.=
cpp
> >> +index fec1bf05..c1f97041 100644
> >> +--- a/Packet++/src/DnsResource.cpp
> >> ++++ b/Packet++/src/DnsResource.cpp
> >> +@@ -10,7 +10,7 @@ namespace pcpp
> >> + {
> >> +
> >> + IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
> >> +-      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_Next=
Resource(nullptr)
> >> ++      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_Next=
Resource(nullptr), m_ExternalRawData(nullptr)
> >> + {
> >> +       char decodedName[4096];
> >> +       m_NameLength =3D decodeName((const char*)getRawData(), decoded=
Name);
> >> +--
> >> +2.45.0
> >> +
> >> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23=
.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> >> index 39c6942c83..9db0222172 100644
> >> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> >> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> >> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51a=
f322440237a253d695d19f"
> >>
> >>   DEPENDS =3D "libpcap"
> >>
> >> -SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttp=
s;branch=3Dmaster"
> >> +SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttp=
s;branch=3Dmaster \
> >> +           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsRes=
ource-.patch \
> >> +           file://0001-initialize-timespec-variable.patch"
> >> +
> >>   SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
> >>
> >>   S =3D "${WORKDIR}/git"
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#110626): https://lists.openembedded.org/g/openembe=
dded-devel/message/110626
> >> Mute This Topic: https://lists.openembedded.org/mt/106387290/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

