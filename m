Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04CA177C29
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Apr 2017 03:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B8BFD182D7;
	Sat,  1 Apr 2017 05:50:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TIdt2aU8uxae; Sat,  1 Apr 2017 05:50:18 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0C07E1809C;
	Sat,  1 Apr 2017 05:50:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED3D61E080;
	Sat,  1 Apr 2017 05:50:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E20981E07F;
	Sat,  1 Apr 2017 05:50:17 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat,  1 Apr 2017 05:50:17 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id D5E82251A;
	Sat,  1 Apr 2017 05:50:17 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 1 Apr 2017 05:50:17 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Sat, 1 Apr 2017 05:50:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with
	musl
Thread-Index: AQHSqj4FK3H5Xa0l0Ui0pGM9sGxdrqGv32nw
Date: Sat, 1 Apr 2017 03:50:17 +0000
Message-ID: <7019a8d36ba240d7969035c877f3171e@XBOX02.axis.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-6-raj.khem@gmail.com>
In-Reply-To: <20170331164247.5052-6-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with musl
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
X-List-Received-Date: Sat, 01 Apr 2017 03:50:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 31 mars 2017 18:42
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with
> musl
>=20
> The patches had syntax errors which are only
> visible when using musl libs
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../lvm2/0001-implement-libc-specific-reopen_stream.patch  | 14 +++++++-=
------
>  .../lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch   | 14 +++++++-=
------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specif=
ic-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-l=
ibc-specific-reopen_stream.patch
> index f09fd76b3..b6a7f1a92 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reop=
en_stream.patch
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reop=
en_stream.patch
> @@ -1,7 +1,7 @@
> -From ede7976da9431573b0104dbcfe91a32c02dbea13 Mon Sep 17 00:00:00 2001
> +From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Tue, 25 Oct 2016 11:49:40 +0000
> -Subject: [PATCH 1/4] implement libc specific reopen_stream
> +Subject: [PATCH] implement libc specific reopen_stream
>=20
>  musl defines stdin/stdio/stderr as constant types which means
>  we can not assign to them as we are doing here but works ok with glibc
> @@ -13,15 +13,15 @@ http://git.alpinelinux.org/cgit/aports/tree/main/lvm2=
/fix-stdio-usage.patch
>=20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> -Upstream-Status: Pending
> +
> +%% original patch: 0001-implement-libc-specific-reopen_stream.patch

This chunk does not look as it was intended...

>  ---
>   lib/log/log.c      | 6 ++++++
>   tools/lvmcmdline.c | 6 +++---
>   2 files changed, 9 insertions(+), 3 deletions(-)
>=20
>  diff --git a/lib/log/log.c b/lib/log/log.c
> -index c933154..638839d 100644
> +index c933154..3581084 100644
>  --- a/lib/log/log.c
>  +++ b/lib/log/log.c
>  @@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(=
FILE *old_stream, FILE *new_
> @@ -38,7 +38,7 @@ index c933154..638839d 100644
>   }
>  +#else
>  +{
> -+	return (freopen(NULL, mode, *stream) !=3D NULL)
> ++	return (freopen(NULL, mode, *stream) !=3D NULL);
>  +}
>  +#endif
>=20
> @@ -76,5 +76,5 @@ index 9a4deb7..f1f18e6 100644
>   		       strerror(errno));
>   		return 0;
>  --
> -2.9.3
> +2.12.0
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo=
-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of=
-mallinfo-with-__GLIBC__.patch
> index 5baafab3e..ef385099f 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-_=
_GLIBC__.patch
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-_=
_GLIBC__.patch
> @@ -1,20 +1,20 @@
> -From 8706a6d33753d8b2cf5bb2a12bd6880b371ce337 Mon Sep 17 00:00:00 2001
> +From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Tue, 25 Oct 2016 11:52:44 +0000
> -Subject: [PATCH 2/4] Guard use of mallinfo() with __GLIBC__
> +Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
>=20
>  This API is glibc-only
>=20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> -Upstream-Status: Pending
> +
> +%% original patch: 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch

Same here.

>  ---
>   lib/mm/memlock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
> -index da90144..c1bf8fb 100644
> +index da90144..f34f890 100644
>  --- a/lib/mm/memlock.c
>  +++ b/lib/mm/memlock.c
>  @@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
> @@ -22,10 +22,10 @@ index da90144..c1bf8fb 100644
>   static void _allocate_memory(void)
>   {
>  -#ifndef VALGRIND_POOL
> -+#ifndef VALGRIND_POOL && defined(__GLIBC__)
> ++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
>   	void *stack_mem;
>   	struct rlimit limit;
>   	int i, area =3D 0, missing =3D _size_malloc_tmp, max_areas =3D 32, hbl=
ks;
>  --
> -2.9.3
> +2.12.0
>=20
> --
> 2.12.1

//Peter


