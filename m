Return-Path: <ml@embed.me.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7867FC77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 07:45:31 +0000 (UTC)
Received: from dane.soverin.net (dane.soverin.net [185.233.34.150])
 by mx.groups.io with SMTP id smtpd.web11.18642.1683877526900571578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 May 2023 00:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 185.233.34.150, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4QHgm44YqFzpy;
	Fri, 12 May 2023 07:45:24 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net (Postfix) with ESMTPSA id 4QHgm36YkDzFk;
	Fri, 12 May 2023 07:45:23 +0000 (UTC)
Message-ID: <d4056549-3ff4-3b6c-99a1-f9c6a944afd5@embed.me.uk>
Date: Fri, 12 May 2023 08:45:23 +0100
MIME-Version: 1.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH 2/2] nss: backport fix for native
 build failure due to dangling pointer with gcc13
Content-Language: en-US-large
To: openembedded-devel@lists.openembedded.org
References: <20230510090648.2762735-1-ml@embed.me.uk>
 <20230510090648.2762735-2-ml@embed.me.uk>
 <3302978f-fc4e-5d1c-8a82-4a9d40e78a43@gmail.com>
Cc: akuster808@gmail.com
X-Soverin-Authenticated: true
From: Jack Mitchell <ml@embed.me.uk>
In-Reply-To: <3302978f-fc4e-5d1c-8a82-4a9d40e78a43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 07:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102556

Hi Armin,

On 11/05/2023 18:36, Armin Kuster wrote:
>=20
>=20
> On 5/10/23 5:06 AM, Jack Mitchell wrote:
>> Upstream-Status: Backport
>> Link:
>> https://github.com/nss-dev/nss/commit/cbf5a2bce75ca2c2fd3e247796b9892f=
5298584e
>>
>> Signed-off-by: Jack Mitchell <ml@embed.me.uk>
>=20
> What is the difference between the patch #1 and #2, they look the same
> to me.

They're two different patches fixing different problems when compiling
under gcc13. I'm happy to squash into a single commit if that would be
preferable.

>> ---
>> =C2=A0 ...ecperf-fix-dangling-pointer-warning-.patch | 75 ++++++++++++=
+++++++
>> =C2=A0 meta-oe/recipes-support/nss/nss_3.51.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 2 files changed, 76 insertions(+)
>> =C2=A0 create mode 100644
>> meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangli=
ng-pointer-warning-.patch
>>
>> diff --git
>> a/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dang=
ling-pointer-warning-.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-18=
26650-cmd-ecperf-fix-dangling-pointer-warning-.patch
>> new file mode 100644
>> index 000000000..dc7e172aa
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dang=
ling-pointer-warning-.patch
>> @@ -0,0 +1,75 @@
>> +From cbf5a2bce75ca2c2fd3e247796b9892f5298584e Mon Sep 17 00:00:00 200=
1
>> +From: "John M. Schanck" <jschanck@mozilla.com>
>> +Date: Thu, 13 Apr 2023 17:43:46 +0000
>> +Subject: [PATCH] Bug 1826650 - cmd/ecperf: fix dangling pointer
>> warning on gcc
>> + 13. r=3Ddjackson
>> +
>> +Differential Revision: https://phabricator.services.mozilla.com/D1748=
22
>=20
> This patch should contain:
>=20
> Upstream-Status: Backport
> Link:
> https://github.com/nss-dev/nss/commit/cbf5a2bce75ca2c2fd3e247796b9892f5=
298584e
>=20
> and your sign-off-by.

Will fix.

>> +
>> +--HG--
>> +extra : moz-landing-system : lando
>> +---
>> + cmd/ecperf/ecperf.c | 12 ++++++++++++
>> + 1 file changed, 12 insertions(+)
>> +
>> +diff --git a/cmd/ecperf/ecperf.c b/cmd/ecperf/ecperf.c
>> +index 705d68f35..a07004d8e 100644
>> +--- a/cmd/ecperf/ecperf.c
>> ++++ b/cmd/ecperf/ecperf.c
>> +@@ -53,6 +53,7 @@ PKCS11Thread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 SECItem sig;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 CK_SESSION_HANDLE session;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 CK_RV crv;
>> ++=C2=A0=C2=A0=C2=A0 void *tmp =3D NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 threadData->status =3D SECSuccess;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 threadData->count =3D 0;
>> +@@ -68,6 +69,7 @@ PKCS11Thread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (threadData->isSign) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig.data =3D sigData=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig.len =3D sizeof(s=
igData);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D threadData->p2;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->p2 =3D (=
void *)&sig;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +@@ -79,6 +81,10 @@ PKCS11Thread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->count++;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++
>> ++=C2=A0=C2=A0=C2=A0 if (threadData->isSign) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->p2 =3D tmp;
>> ++=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> + }
>> +
>> +@@ -89,6 +95,7 @@ genericThread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 int iters =3D threadData->iters;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char sigData[256];
>> +=C2=A0=C2=A0=C2=A0=C2=A0 SECItem sig;
>> ++=C2=A0=C2=A0=C2=A0 void *tmp =3D NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0 threadData->status =3D SECSuccess;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 threadData->count =3D 0;
>> +@@ -96,6 +103,7 @@ genericThread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (threadData->isSign) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig.data =3D sigData=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig.len =3D sizeof(s=
igData);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D threadData->p2;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->p2 =3D (=
void *)&sig;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +@@ -107,6 +115,10 @@ genericThread(void *data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->count++;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++
>> ++=C2=A0=C2=A0=C2=A0 if (threadData->isSign) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 threadData->p2 =3D tmp;
>> ++=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> + }
>> +
>> +--
>> +2.40.1
>> +
>> diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb
>> b/meta-oe/recipes-support/nss/nss_3.51.1.bb
>> index 721b38ddb..af842ee67 100644
>> --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
>> +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
>> @@ -44,6 +44,7 @@ SRC_URI =3D
>> "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://CVE-2022-22747.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://CVE-2023-0767.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0001-Bug-1812671-build-failure-while-implicitly-casting-S.patch=
;patchdir=3Dnss \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch=
;patchdir=3Dnss \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 SRC_URI[md5sum] =3D "6acaf1ddff69306ae30a908881c6f233"
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102551): https://lists.openembedded.org/g/openembed=
ded-devel/message/102551
> Mute This Topic: https://lists.openembedded.org/mt/98802000/3618454
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ml@embed.me.uk]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Jack Mitchell, Consultant
https://www.tuxable.co.uk

