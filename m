Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id C9F4C783B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EBBAA2E268;
	Thu, 14 Sep 2017 10:01:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DReUGZDATakA; Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 8D1772E2DD;
	Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CBB01E086;
	Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 616321E084;
	Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 5528AEA0;
	Thu, 14 Sep 2017 10:01:49 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 14 Sep 2017 10:01:49 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 14 Sep 2017 10:01:49 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 14 Sep 2017 10:01:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
Thread-Index: AQHTLMu+Hk2COh4p2EyIkksA2fQI0aK0BHQg
Date: Thu, 14 Sep 2017 08:01:49 +0000
Message-ID: <bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
In-Reply-To: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 08:01:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Fabien Lahoudere
> Sent: den 13 september 2017 22:06
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
>=20
> In order to build gerbera, we need to support libupnp >=3D 1.8.
> However mpd won't build with this version probably due to API break.

Wouldn't it be more appropriate to copy the current libupnp 1.6 recipe=20
to libupnp16 and then update the libupnp recipe to 1.8? Presumably we=20
want to get rid of the 1.6 version whenever mpd is updated to support=20
the new API.

> So we add a new recipe libupnp1.8 to be able to use both version.
> Both version can be run in parallel.
>=20
> ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> neon/libupnp_1.6.21-r0_armhf.deb
> drwxrwxrwx root/root         0 2017-09-13 17:26 ./
> drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
> drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
> -rwxr-xr-x root/root     31600 2017-09-13 17:26
> ./usr/lib/libixml.so.2.0.8
> -rwxr-xr-x root/root     17912 2017-09-13 17:26
> ./usr/lib/libthreadutil.so.6.0.4
> -rwxr-xr-x root/root    117676 2017-09-13 17:26
> ./usr/lib/libupnp.so.6.3.4
> lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2
> -> libixml.so.2.0.8
> lrwxrwxrwx root/root         0 2017-09-13 17:26
> ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
> lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6
> -> libupnp.so.6.3.4
> ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> neon/libupnp1.8_1.8.2-r0_armhf.deb
> drwxrwxrwx root/root         0 2017-09-13 17:43 ./
> drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
> drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
> -rwxr-xr-x root/root     35696 2017-09-13 17:43
> ./usr/lib/libixml.so.10.0.1
> -rwxr-xr-x root/root    155128 2017-09-13 17:43
> ./usr/lib/libupnp.so.10.1.1
> lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10
> -> libixml.so.10.0.1
> lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10
> -> libupnp.so.10.1.1
>=20
> mpd and gerbera have been built successfully with this fix.
>=20
> The patch also clean a bit gerbera recipe and fix dependency issue.
>=20
> Changes since v3:
> 	- Drop RDEPENDS from gerbera recipe.
> 	- use git fetcher instead of github archive for libupnp
>=20
> Fabien Lahoudere (2):
>   libupnp: Add recipe for version 1.8.2
>   gerbera: clean recipe
>=20
>  .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20
> ++++++++++++++++++++
>  .../recipes-multimedia/gerbera/gerbera_git.bb        | 12 ++++++------
>  2 files changed, 26 insertions(+), 6 deletions(-)
>  create mode 100644 meta-multimedia/recipes-
> connectivity/libupnp/libupnp1.8.bb
>=20
> --
> 2.11.0

//Peter


