Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB45C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:40:46 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7309.1717072833825252779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 05:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHOzMLDG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52961b77655so1030594e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 05:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717072832; x=1717677632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLmWugig4Uf7xyjcfZ/gU7GT1tdjHOwdWhNvWTgJzVk=;
        b=DHOzMLDGlMMRBfgDsKZYNDzKX0bNVwHjgllhZDoqVSOn4bKwB1bWQmXXiFn/iHx7tj
         CNBhM3LgSDUSM7sW5N2DarlExc+lAbsLlG9kjsCMWfx5d44JbSjmIRkO/Ay6U1FanM1z
         C6i3NkSaDqLFvmRmtWJD9OSp8FJ3MdZBBmSL8OnamrEuRaqh5PT8NNeQfkjjY4FIBY0/
         /x69AnJ+RoARxEkIRenTQbg3B8iEwS5nodlO+9Oc7Oq0vht4P94GanZwN4mArZaGnfo2
         eWGYKVNm5YQ5XOUKUiwRnd/a4/cRFaXKPB9M2OZmbKoBmCSbjtmnnQGRPFidSCbTeztW
         fEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072832; x=1717677632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLmWugig4Uf7xyjcfZ/gU7GT1tdjHOwdWhNvWTgJzVk=;
        b=sxT38s+D+LRLWtr/+uOU3/6fF7MmVqDhiGEMMKju+VDtwiiwcZ9biMEnr6f6GJfiLc
         7aWGyaT40Ql/HYLfOXjJ3gjOxqGpg2mkZX99rcm8FRT6P3b29zysTXeh1FKGTkGCHsdB
         uRvquCaiklIkHkH3BcDwJJ2MgYDzSg9Vu5Iys6G1sG58/bFhRUhPHZiaZpVbe6vn2JQk
         iC2v6SGJN1irHkMKlqaWAhieXN7YT3JKSnujgH7VlUG564sNH+8SofKhMto2Tblegqsi
         WIdLEz9UON2fdaDOY239tQQ4HHO46Po70Zp2NFz1CKCi4lOmYJmczsWT1ar/0nAaeJO/
         8Y5g==
X-Gm-Message-State: AOJu0Yw3f51zDeQ69Eb0UegFSoJLyinDUKvzW2ZFuAxG3MtFjTLkGeaC
	scT59oZ3UPbF1pzyOR1YH/isQWL8jZg3ZirHIBE786c2CGtyQsRypyjJhyI34t0nqmYOTvOHCN2
	MiqDLDMGLSIBUZieJXuawCWYKTcc=
X-Google-Smtp-Source: AGHT+IHQsmWLOkKIaiy7/WNXSJ2IU7W2Im/bKEh8wtB2UCNpgTYsY3PQYCPB/EZOwsSJBng/rz/n/wWu8iEzmvh5IV8=
X-Received: by 2002:ac2:5333:0:b0:51d:8d56:6b15 with SMTP id
 2adb3069b0e04-52b7d417fbbmr1304524e87.1.1717072831757; Thu, 30 May 2024
 05:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240530123501.2890879-1-akuster808@gmail.com>
In-Reply-To: <20240530123501.2890879-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 May 2024 14:40:08 +0200
Message-ID: <CA+chaQdv7zN4uZ8=ROoyajZrUPnLa8avxrQnM9g5=RaCDMJ9sg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] pcapplusplus: Fix build with gcc14
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110627

Why is this needed in scarthgap? GCC upgrade won't be backported there
I believe and it doesn't have native/nativesdk to be useful on hosts
with gcc-14.

On Thu, May 30, 2024 at 2:35=E2=80=AFPM Armin Kuster via
lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++++
>  ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 ++++++++++++++++++
>  .../pcapplusplus/pcapplusplus_23.09.bb        |  5 ++-
>  3 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplu=
s/0001-initialize-timespec-variable.patch
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplu=
s/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-=
initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusp=
lus/pcapplusplus/0001-initialize-timespec-variable.patch
> new file mode 100644
> index 0000000000..f2e210fc67
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initial=
ize-timespec-variable.patch
> @@ -0,0 +1,35 @@
> +From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 6 May 2024 12:15:30 -0700
> +Subject: [PATCH] initialize timespec variable
> +
> +Fixes build warnings with GCC14
> +
> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/g=
it/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(c=
onst uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/g=
it/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous=
>' is used uninitialized [-Werror=3Duninitialized]
> +   23 |         timespec nsec_time;
> +      |                  ^~~~~~~~~
> +cc1plus: all warnings being treated as errors
> +
> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/=
1389]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Packet++/src/RawPacket.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
> +index 8ad52d52..07dbbbe2 100644
> +--- a/Packet++/src/RawPacket.cpp
> ++++ b/Packet++/src/RawPacket.cpp
> +@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
> +
> + RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval t=
imestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
> + {
> +-      timespec nsec_time;
> ++      timespec nsec_time =3D {};
> +       TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
> +       init(deleteRawDataAtDestructor);
> +       setRawData(pRawData, rawDataLen, nsec_time, layerType);
> +--
> +2.45.0
> +
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-=
packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/recipe=
s-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalR=
awData-in-IDnsResource-.patch
> new file mode 100644
> index 0000000000..b6389e0e3f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-=
Initialize-m_ExternalRawData-in-IDnsResource-.patch
> @@ -0,0 +1,34 @@
> +From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 9 May 2024 17:02:09 -0700
> +Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResource
> + constructor
> +
> +Fixes following warning with GCC-14
> +
> +Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource::m_=
ExternalRawData' may be used uninitialized [-Werror=3Dmaybe-uninitialized]
> +   29 |                 return m_ExternalRawData;
> +      |                        ^~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/=
1391]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Packet++/src/DnsResource.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.cpp
> +index fec1bf05..c1f97041 100644
> +--- a/Packet++/src/DnsResource.cpp
> ++++ b/Packet++/src/DnsResource.cpp
> +@@ -10,7 +10,7 @@ namespace pcpp
> + {
> +
> + IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
> +-      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextRes=
ource(nullptr)
> ++      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextRes=
ource(nullptr), m_ExternalRawData(nullptr)
> + {
> +       char decodedName[4096];
> +       m_NameLength =3D decodeName((const char*)getRawData(), decodedNam=
e);
> +--
> +2.45.0
> +
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09=
.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> index 39c6942c83..9db0222172 100644
> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af32=
2440237a253d695d19f"
>
>  DEPENDS =3D "libpcap"
>
> -SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> +SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;b=
ranch=3Dmaster \
> +           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsResour=
ce-.patch \
> +           file://0001-initialize-timespec-variable.patch"
> +
>  SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110626): https://lists.openembedded.org/g/openembedde=
d-devel/message/110626
> Mute This Topic: https://lists.openembedded.org/mt/106387290/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

