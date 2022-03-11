Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32781C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 18:31:37 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.8871.1647023485174397211
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 10:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=RT8p66iS;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647023485;
  x=1678559485;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6dG7KnmEZ9SueKRFwulDhNcsiXqQd1CdAGFWokZkPcI=;
  b=RT8p66iSPJrt9BggPz/k2s5ucqTIMSCE/N3m5ZeT17XQFQnMIbr53KIG
   E4w2djn1u0jgS7WXSQZAF0pZ7sqNnNI33FcYbV6rGUcnWBOhDEoaYD5Gz
   slAsUymSZhEMv/FnMophYea0l8EntKBePagCHKpR++3AQEuKphdH0j5Yv
   W7Zq5L11KAUa8L3D5boTajrocK6IRKbMWUozfX3vVRV+DfMnYyMYpp+lv
   efC7ZueDN3T03z/qZcWa5cgpOleXt6Mgn7mDSUjh/SEQL8rtUpQ8TisAd
   VinR6DoW6hlDDjgMK0juUGhSy49MR5mw8TtnMcSBhCTxIjTZoXaLm7RZf
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH] net-snmp: Avoid running `make
 clean` as it may fail
Thread-Topic: [oe] [meta-networking][PATCH] net-snmp: Avoid running `make
 clean` as it may fail
Thread-Index: AQHYNJI/qaCswIUYV0e895RWOmeQ5qy6gvGQ
Date: Fri, 11 Mar 2022 18:31:22 +0000
Message-ID: <1b42cccbf1e14b8fa4a6b73d9f6774c9@axis.com>
References: <16DB0E1486A87DC2.14380@lists.openembedded.org>
In-Reply-To: <16DB0E1486A87DC2.14380@lists.openembedded.org>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 18:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95956

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 10 mars 2022 16:19
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] net-snmp: Avoid running `make clea=
n` as it may fail
>=20
> Rebuilding net-snmp may cause autotools_preconfigure() to run `make
> clean`, which in turn can cause `configure`to be run. However, since
> CACHED_CONFIGUREVARS is not set under those circumstances, `configure`
> will run with an incorrect configuration and the build will fail with:
>=20
>   checking for /etc/printcap... configure: error: cannot check for
>   file existence when cross compiling
>=20
> Avoid the problem by setting CLEANBROKEN =3D "1".
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> index b0c5bbdac..5f887b886 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> @@ -40,6 +40,7 @@ EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D} OTHERLDFLAGS=3D=
'${LDFLAGS}' HOST_CPPFLAGS=3D'${B
>=20
>  PARALLEL_MAKE =3D ""
>  CCACHE =3D ""
> +CLEANBROKEN =3D "1"
>=20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>=20

Please cherry-pick this to Honister.

//Peter


