Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6498C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 10:51:52 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.21739.1634467910971054758
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 03:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Lf4/YOBw;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634467911;
  x=1666003911;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CSxUIVM87+eT6vtyyJGsACCkarbqDPjS70ibjqaGPKs=;
  b=Lf4/YOBwM0UukRkkBtaHg/2sPhwZJZYRx4YLseOekYWGuR+ir/+QXBH7
   CJUy6GCXJx613pSiLti7lekEyN9CB7SdDaymvjg1n6ZA7KdOeioDGSmdc
   Ua0r9PRhqVrVIC/QIlWVAI4j9ac7Si1UAt/Ia4sQID0lcyx/EIJeJfarK
   IETfB9azA6srZ2UA9tJBJyayBvJOG2hhBPgcJkipEv4So6Bj/whbmvp3G
   TcQo9HTxUqOP3Zc5QO//4V9cCDAgw4hTT6fMBqLv1uMULB0ytdZRFx/T6
   3eHi5yyQwVwHktFBDL+B+/zmdevZATtchhJMJ4f5//pW9oUmtrZl4zvZk
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
Thread-Topic: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
Thread-Index: AQHXwq5IIlpd1bf050aaVaOAX5n2yavXBFVA
Date: Sun, 17 Oct 2021 10:51:47 +0000
Message-ID: <1ea36ba81f0d4fe0b43d36b415ee6255@axis.com>
References: <20211016165223.1271496-1-raj.khem@gmail.com>
In-Reply-To: <20211016165223.1271496-1-raj.khem@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 10:51:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93406

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 16 oktober 2021 18:52
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker

Add a motivation as to why this is needed.

//Peter

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/meta=
-
> oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> index cc037d3934..b5ab0a171c 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> @@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
>=20
>  inherit autotools pkgconfig
>=20
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -
> fuse-ld=3Dbfd ', '', d)}"
> +
>  # After several fix attempts there is still a race between generating
>  # t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
>  # BUILT_SOURCES and explicit dependencies.
> --
> 2.33.1


