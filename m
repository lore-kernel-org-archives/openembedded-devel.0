Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web12.6046.1611230240352371275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 03:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Wbmx8Qaa;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=64801436a=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611230240; x=1642766240;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AZYtC3XBm97HZKQZ8xs6x+1iM4hRxexXv3uVPFnZHeA=;
  b=Wbmx8QaaTd0xnzUbV7mig03m35l0fIQAupxLMhKgtcYoHP6uE9Mpixyx
   Gr+QFH7Ls+6aHDW7ekINAa4/FJ69DslWnOfS86WRcEGR9BCAt2opPYcvT
   3Cu+eBHv4ngVr2B3/DxIoP3QPBp9NEyWJ+b+rTaDXxbOW3GlGq4jlMZcO
   Y=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 Jan 2021 12:57:18 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
 21 Jan 2021 12:57:17 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb5.muc with ESMTP/TLS; 21 Jan 2021 12:57:17 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Thu, 21 Jan 2021 12:57:16 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Thu,
 21 Jan 2021 12:57:17 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <Harpritkaur.Bhandari@kpit.com>
CC: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>,
	<nisha.parrakat@kpit.com>, <Aditya.Tayade@kpit.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Thread-Topic: [oe] [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to
 latest
Thread-Index: AQHW7+i5GATn7COC8Eu5jZ8terNEhqox6IoA
Date: Thu, 21 Jan 2021 11:57:17 +0000
Message-ID: <YAlsHMz2Unf8YfVb@korppu>
References: <1611122392-13465-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1611122392-13465-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4E1EB11BAAB49941A74BFB3DBA8ABEF0@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 20, 2021 at 11:29:52AM +0530, Harpritkaur Bhandari wrote:
> Upgrade SRCREV to latest as it fixes the below issue:
> Running UndefinedBehaviorSanitizer on projects that use
> rapidjson triggers 'applying non-zero offset <NN> to null
> pointer' findings in 'internal/stack.h' which are hard
> to suppress by library users.
> Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
> as the changes are already incorporated in the latest
> codebase.
> As per abi-compliance-checker report the source compatibility
> and binary compatibility between previous SRCREV
> 6a905f9311f82d306da77bd963ec5aa5da07da9c and current
> SRCREV 0ccdbf364c577803e2a751f5aededce935314313
> is 100% and this patch is already tested on 64bit
> ARM (aarch64) in a product with on target CI tests.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 04d9ea0ba7ece968244bf049893dd5636675b76f)
> Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> ---
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-=
oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index e3ed9c6..5b5c8b2 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,10 +4,9 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d=
746c2125"
>=20
> -SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
> -           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-p=
ath.patch"

Please also remove the patch file. Also from master branch if it's still t=
here
but no longer applied.

Cheers,

-Mikko

> +SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"
>=20
> -SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
> +SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
>=20
>  PV =3D "1.1.0+git${SRCPV}"
>=20
> --
> 2.7.4
>=20
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.

>=20
>=20
>=20
