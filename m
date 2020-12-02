Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web09.2245.1606899107026191876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 00:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=QPBip2wd;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=59846bbf3=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1606899107; x=1638435107;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6UV7bX6KQToXC1oFamy+VUb2OJpqQmPpPLgWzkhRAQg=;
  b=QPBip2wdjnb2mwJZ1yhe/C3oQMx/n9DlTP+BhaV3ELK/pMj/oQ01+Pn9
   sylbsYL3YbOqynMP6PmiO7obTGyWnN8uU5nuvJKy/1ONwl5ErQYC8jx5n
   YRh/HO/ATrAMrbHP1nE8Fa+AjesgijD+on6ZqeIoD1rj2hgpjVVUxwJ2G
   I=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Dec 2020 09:51:44 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw6.muc with ESMTP/TLS;
 02 Dec 2020 09:51:44 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb6.muc with ESMTP/TLS; 02 Dec 2020 09:51:30 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Wed, 2 Dec 2020 09:51:31 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.008; Wed,
 2 Dec 2020 09:51:30 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <costamagna.gianfranco@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>,
	<costamagnagianfranco@yahoo.it>, <locutusofborg@debian.org>
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: add upstream patch to fix CVE-2020-29394
Thread-Topic: [oe] [meta-oe][PATCH] dlt-daemon: add upstream patch to fix
 CVE-2020-29394
Thread-Index: AQHWyCUbJ4TDjkoqukWXjbHKcMzRVanjb5kA
Date: Wed, 2 Dec 2020 08:51:30 +0000
Message-ID: <X8dVkldi72RI01Ka@korppu>
References: <20201201210055.979056-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20201201210055.979056-1-costamagnagianfranco@yahoo.it>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <116D06003036F4468E893F0327665E3A@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 01, 2020 at 10:00:55PM +0100, Gianfranco wrote:
> More information on: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=
=3D976228
> | A buffer overflow in the dlt_filter_load function in dlt_common.c in
> | dlt-daemon 2.8.5 (GENIVI Diagnostic Log and Trace) allows arbitrary
> | code execution because fscanf is misused (no limit on the number of
> | characters to be read in a format argument).
>=20
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../dlt-daemon/dlt-daemon/275.patch           | 36 +++++++++++++++++++
>  .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.p=
atch
>=20
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
> new file mode 100644
> index 000000000..4edb62b30
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
> @@ -0,0 +1,36 @@
> +From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
> +From: GwanYeong Kim <gy741.kim@gmail.com>
> +Date: Sat, 28 Nov 2020 12:24:46 +0900
> +Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
> +
> +A buffer overflow in the dlt_filter_load function in dlt_common.c in dl=
t-daemon allows arbitrary code execution via an unsafe usage of fscanf, bec=
ause it does not limit the number of characters to be read in a format argu=
ment.
> +
> +Fixed: #274
> +
> +Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> +---
> + src/shared/dlt_common.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)

Please add patch metadata:

Upstream-status: Backport
CVE: CVE-2020-29394

https://wiki.yoctoproject.org/wiki/Security#Patch_name_convention_and_comm=
it_message
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_He=
ader_Recommendations:_Upstream-Status

Cheers,

-Mikko

> +
> +diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
> +index 254f4ce4..d15b1cec 100644
> +--- a/src/shared/dlt_common.c
> ++++ b/src/shared/dlt_common.c
> +@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, c=
onst char *filename, int verb
> +     while (!feof(handle)) {
> +         str1[0] =3D 0;
> +=20
> +-        if (fscanf(handle, "%s", str1) !=3D 1)
> ++        if (fscanf(handle, "%254s", str1) !=3D 1)
> +             break;
> +=20
> +         if (str1[0] =3D=3D 0)
> +@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, c=
onst char *filename, int verb
> +=20
> +         str1[0] =3D 0;
> +=20
> +-        if (fscanf(handle, "%s", str1) !=3D 1)
> ++        if (fscanf(handle, "%254s", str1) !=3D 1)
> +             break;
> +=20
> +         if (str1[0] =3D=3D 0)
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> index f3fcee4d2..5066e76d3 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protoc=
ol=3Dhttps \
>      file://0004-Modify-systemd-config-directory.patch \
>      file://241.patch \
>      file://245.patch \
> +    file://275.patch \
>  "
>  SRCREV =3D "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>  
> --=20
> 2.25.1
>=20

>=20
>=20
>=20
