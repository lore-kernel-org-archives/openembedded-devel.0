Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A608AC531D0
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 07:23:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6232.1785396199665173438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 00:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WKa0Yp96;
 spf=pass (domain: siemens.com, ip: 40.107.162.39, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJNJH4I9dZoZB03LOiyoyT3dKZR9a+sNGFr74lhZ1Ga7QE26qpsAgE4ALrBdXK/TnxviJE5xisC4bW1Ncy+guZCD1BZVUGUh8Zcka41WH9AaDpMp3kG01puJlKm+nWGbsBXQYZUvaZ+GyNuOx1yIo4mnuLioE8HUhe4rZlzx7PLFlV8ggYh4CxqCGb8ZO0RKXXtGPRFL/KnDj4cWL/1sVyBUPOO0IgCHscfstBvSHgtFjllWw9JN85GnDKHOl6952XdCqoK0fdZGvF5jUKmdCob489h4M7Ur8mTXRB7ivs+Y9W/N1fCUO4K3JdxWECBsK4LHOs3C7U8zMODlYoXH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81LnLQJYYdcUgrtFSL05wtusB1tnKSVHxliSEaXwNHQ=;
 b=ClPSWPpXe4lNNkoBsxfHzKnW7j1bvlmXbU9K6O3k6ri2vCnZ5nD0i2pkLdJLsWQ0hjGT6j1UvexUvRdQ7ouEn4hv8jytajlYxqwld3bia7mMRFnW51UG0qvz43yyAWon5jhMWThT+9RPFNfecicLMdhXzZoYF1trvmVvorDXU2X5GqXAyNYfhS2KzTmq5VljS5s20tzoJGxYKGvQAHNK8AkO7yUWyBzd9deY5SkkR9/KNursrFAqG5/Z09S3+CSFA8yEYyV7PsJnF5RBISwp2WqBuRRYibHKnpUgLSWD1DtJXQPoeUydUJ6llKKxCLMEUkW9qWi3XVNcOe1Rf2UzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81LnLQJYYdcUgrtFSL05wtusB1tnKSVHxliSEaXwNHQ=;
 b=WKa0Yp96xTkw7mUfTHJWE03NRFD07VrMGieUBDDyD1qJ4kzqzFPmJUKkhWIWNym58+gaTjti7otK99DI4tLfiFZp1R1qjSSNjfNF/URQ02MKDcA4HF8ncFbYklY7JoRXdYvvUx2MeBJ5r6o3Ip350CcnPLZ3Lpq0TtmGBkfqChpR7zd7eiHfl1UQ5B5/MPX6vR+ZYTzuQ0yS7Ee76xZOcs1JVVzN320ztwi0xMdHIUuTFmRcf9Xb6sqsgK9br0bA2J2HQU0PgU5B9Z1S6tKUSW6Bp1JFL0C3udnCFMrSCD+QsQusmMKxo8OXmX/Us4koiH/qDk+JAyXr5eVj3gqx3g==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB7262.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:449::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 07:23:14 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 07:23:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "costamagna.gianfranco@gmail.com" <costamagna.gianfranco@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Gianfranco Costamagna <locutusofborg@debian.org>, Gianfranco Costamagna
	<costamagnagianfranco@yahoo.it>
Subject: RE: [oe] [meta-oe][PATCH] boinc-client: update to 8.2.15
Thread-Topic: [oe] [meta-oe][PATCH] boinc-client: update to 8.2.15
Thread-Index: AQHdH/OfpBFbBscYFUe8B10KsYQKKbaFqGKA
Date: Thu, 30 Jul 2026 07:23:14 +0000
Message-ID: 
 <AS8PR10MB5073D74AC6A957BF2683DB9AFDC92@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260730071815.787912-1-locutusofborg@debian.org>
In-Reply-To: <20260730071815.787912-1-locutusofborg@debian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=92b0e292-9401-49be-ad3e-ef03f9228bd3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-30T07:22:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB7262:EE_
x-ms-office365-filtering-correlation-id: d1bd2be0-52d9-4a6c-4940-08deee0b6b3d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|55112099003|18002099003|38070700021|3023799007|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 Y5JKcvEM/66oxmjkc+gkv83Iht65J2skFxVSUp11o+rU8lqyT/WbJ5iSLAF52FTPP1L2tdXXgQFnHjvM6eXMBVaQixJ4cNelTSxQ+E8wzhM37NXw4Z6bKGps9KmQznfl2FZ4Z1sqeIW9r2YhXuyFNOza5gys/yWLN1/eT/AEbzbkv8OWZK7ULgJ86wurbaBbsTYHhjQmOmgTFIFsgqLjFRVoeapoS2Z9Gm08ZWEULny2SzO0EPUZeElWkGo/wREORuzDGyt2blURFHSuslBIQwXkYgr82TDyLv8HzdTVDLRIDp0ot0lnFSoxF/XCmEKmL8/LrJkuVxCsPv13qVLhTH20P2BSdbK1v+kFquB5/K1dXUEJRP8k0elYaF/7+Vr6OpGnqMFJzG6agx/1T+Rr5OaWv9aEIhe52QEpQ15nzi8CrKB3+BpzUWU5J6M+KGAzLTTrTLocARCRtyUyV3VDAXaeZOdOlI0s8mBhD7UEI2C9KIwnDn+qzSp+cN06qRFlKItLrznKAGyKxanQVkws9W47fPYOBxZqihN4qkUvD5flCiBORhx1nu6JvjD+0/m7PNhDqtBbrt7hinKxErFGtPzRjDMuqYC/VDvlwvKBChdUMQcVRFhuFXkFCNWn8uA54lJwPZiFweJGWLbrzNserHaXQ3X4z0Grq97MBvGpMLE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(55112099003)(18002099003)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Jd6vpYOYAcJTJunjBBAs6RJKuTHw7ppvAs5qgvrx9tiG/y3nffEtXRxGynI1?=
 =?us-ascii?Q?S7eBrV0MIcCfJ2Z/PcGJ/dwFliE6YQyZmwxvyr7CSLp0IKB/pequbNA6KH8r?=
 =?us-ascii?Q?WAEu+QRKADvvXJsejZlBA9HyrxPCUNfqgfVwSv26qJPdzoIQfw6JmqTlORFi?=
 =?us-ascii?Q?9n0UnSdIy9P9WoIMjEdF1xVuwB1WvFjBJUcrH2a9JuGwPYX4XzWF6zmRI6ra?=
 =?us-ascii?Q?8gEmR3A3pC5rFqMKBqp9+NrZqvQMfolCCuDzh3Xsb7SOe3N+lZcnPzU4qLSS?=
 =?us-ascii?Q?YqiH3eeWAMvD5loZC3ugNZpTl1sjQDoRk0KRQusmI+k2Ig87FB1nWACjN6Pk?=
 =?us-ascii?Q?rqrE21Egv0s1hG1hk0gUMp1vQ6PuB7q6fW3JZecdv79l0iSVdqJymP//vNhj?=
 =?us-ascii?Q?3h/yBXqsShyuXit7JIxhKHuBDA72sLlwChJoTmKadKH7D7SwuY6xxtGtJuJA?=
 =?us-ascii?Q?vJ08uGmFpNgx7zkC09eq4Ma6yk3w6cWCe6y1DAkKfjtwv2ajW5W2KDHERQ2S?=
 =?us-ascii?Q?AAE+D8cUlFIfBG+xfH772kjlw+1fhXjpfxVvfjp64qcC/a9PoPBeB8xEEUOC?=
 =?us-ascii?Q?hhAMP9W4EDKJrowebn4n0WnBsOTS9zTusGZDlz8LrnWlwnAoehTyJAeTCq8I?=
 =?us-ascii?Q?s0yU56EHziBpgQxMFnXpt3ATZMaTIfZuD/dFCHiqHj9t1MfeOt0p2C6GEyfZ?=
 =?us-ascii?Q?i1O9lQVSIHzwpWD1Kyl5ZM/0/Ry6ci/wbk/9J9uqitmnaccIsA92x5acrMRd?=
 =?us-ascii?Q?FALNObNxFc5gWroba3EBzGCblqr+HXLHFSzkgzhP14uhwaj3K2Lds5wRW1I6?=
 =?us-ascii?Q?CAuSXUDxb4+uLdnHMczihH9g9hdBoHQtKE30rs9XrNTt23oBfLn4ktmulpEW?=
 =?us-ascii?Q?0YzKCF7V9pelb3++BMA8Lm5ZT+gK0RxGkyXL8NEP6qgquuoN3tMd56yjg+fZ?=
 =?us-ascii?Q?VyeYU02x6QbWtJTw9pid5OxSd0b3HZQC1n9A83ZNkQtjsRAz0OgWmsGNXuaz?=
 =?us-ascii?Q?WLUXHXMQanXVwUVc98m3CNN8PDUi7GN5o/DlSkFZpZ3tW47Ja0fOZcCsiOrj?=
 =?us-ascii?Q?scg2WTtk3iris2Abuq6LuGz69fM9IRFTDmOqq2AKfiuWB1ITiCxJeDRLfGvK?=
 =?us-ascii?Q?WoqC7ep0EFhuVPEPCMB10tYF+9qINTn8nR+QkhUNOpZf2+nIOHRDydoSxWyb?=
 =?us-ascii?Q?aqnO+8OB/diqvk/XVxj5Kkzz186o/uJGXk5nTPXlFWITn+Q4uF4ozd0AddC6?=
 =?us-ascii?Q?BrPvd1/HYP/yGJzhWaAPoBTWzwbfHpmHhKSfhJvUIgWkG0ws+2Xvfz+ToV99?=
 =?us-ascii?Q?qh4iOnK33R/vTBGmKTzvSBlwVQyhUqCGcBZvDx+rfYRhD9PEQ7ERLLNEberI?=
 =?us-ascii?Q?PTDAisQHoM3M2fB3kgPTy0mRcIu3Stxkvnyaw5VRl3ptXQQPo3uZooRqSPxL?=
 =?us-ascii?Q?r7REt6aelNiNQVmdnQbe3XIxE6EEQdtZc0kVrZ8stUg9/+7yrMJ4A/QPflpE?=
 =?us-ascii?Q?xb0X5h90IePwGUG5Z6Bbwj2Y7L7AJlDvk4MBV01Q98YhO9nqIy3sOgx94hQ3?=
 =?us-ascii?Q?+EgPS/5+OdT5WFjJ7q1wkevMUyAOBBylZsp8tAAww4ojKA2KyR/fbW1sifiH?=
 =?us-ascii?Q?d9PjwarXnkq9fWB4p1oK31LkdSnGf1+tZ0Bit5NjedTpJI51JZuBgAnvYov6?=
 =?us-ascii?Q?ZXXuagYXVub6XsXB/SXRP35NwCEpyaWXnMns/bnAyttRePn0xUh5Y8sM191c?=
 =?us-ascii?Q?uV5A/hQ1Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bd2be0-52d9-4a6c-4940-08deee0b6b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 07:23:14.3825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QIPDryPQH6Nut2vfioDwRJgBeoK5++iYjkkUFgskYTW0kpQ6Z7unyRZdsNPHE0nXr6PJful4krOAqdL4yCYsjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7262
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 07:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128565



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Gianfranco via
> lists.openembedded.org
> Sent: Thursday, July 30, 2026 9:18 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Gianfranco Costamagna <locutusofborg@debian.org>; Gianfranco
> Costamagna <costamagna.gianfranco@gmail.com>; Gianfranco Costamagna
> <costamagnagianfranco@yahoo.it>
> Subject: [oe] [meta-oe][PATCH] boinc-client: update to 8.2.15
>=20
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> ---
>  ...01-Do-not-undefine-_FILE_OFFSET_BITS.patch | 59 -------------------
>  ...lient_7.20.5.bb =3D> boinc-client_8.2.15.bb} |  9 ++-
>  2 files changed, 4 insertions(+), 64 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-Do-n=
ot-
> undefine-_FILE_OFFSET_BITS.patch
>  rename meta-oe/recipes-extended/boinc/{boinc-client_7.20.5.bb =3D> boinc=
-
> client_8.2.15.bb} (92%)
>=20
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-unde=
fine-
> _FILE_OFFSET_BITS.patch b/meta-oe/recipes-extended/boinc/boinc-client/000=
1-
> Do-not-undefine-_FILE_OFFSET_BITS.patch
> deleted file mode 100644
> index 846fb099dc..0000000000
> --- a/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-
> _FILE_OFFSET_BITS.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 4e5c5a245f248976ea55fe1f805badb0cb1bb072 Mon Sep 17 00:00:00
> 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 30 Dec 2022 23:41:36 -0800
> -Subject: [PATCH] Do not undefine _FILE_OFFSET_BITS
> -
> -This does not work when we want to use 64bit time_t in glibc
> -therefore let system decide on defining these macros
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - client/client_types.cpp  | 9 ---------
> - client/hostinfo_unix.cpp | 9 ---------
> - 2 files changed, 18 deletions(-)
> -
> -diff --git a/client/client_types.cpp b/client/client_types.cpp
> -index 2977ef7863..7653517302 100644
> ---- a/client/client_types.cpp
> -+++ b/client/client_types.cpp
> -@@ -22,15 +22,6 @@
> - #include "zlib.h"
> - #else
> - #include "config.h"
> --// Somehow having config.h define _FILE_OFFSET_BITS or _LARGE_FILES is
> --// causing open to be redefined to open64 which somehow, in some versio=
ns
> --// of zlib.h causes gzopen to be redefined as gzopen64 which subsequent=
ly gets
> --// reported as a linker error.  So for this file, we compile in small f=
iles
> --// mode, regardless of these settings
> --#undef _FILE_OFFSET_BITS
> --#undef _LARGE_FILES
> --#undef _LARGEFILE_SOURCE
> --#undef _LARGEFILE64_SOURCE
> - #include <sys/stat.h>
> - #include <sys/types.h>
> - #include <zlib.h>
> -diff --git a/client/hostinfo_unix.cpp b/client/hostinfo_unix.cpp
> -index ff0b596221..0ad6841b39 100644
> ---- a/client/hostinfo_unix.cpp
> -+++ b/client/hostinfo_unix.cpp
> -@@ -26,15 +26,6 @@
> -
> - #if !defined(_WIN32) || defined(__CYGWIN32__)
> -
> --// Access to binary files in /proc filesystem doesn't work in the 64bit
> --// files environment on some systems.
> --// None of the functions here need 64bit file functions,
> --// so undefine _FILE_OFFSET_BITS and _LARGE_FILES.
> --//
> --#undef _FILE_OFFSET_BITS
> --#undef _LARGE_FILES
> --#undef _LARGEFILE_SOURCE
> --#undef _LARGEFILE64_SOURCE
> - #include <iostream>
> - #include <vector>
> - #include <string>
> ---
> -2.39.0
> -
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta=
-
> oe/recipes-extended/boinc/boinc-client_8.2.15.bb
> similarity index 92%
> rename from meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> rename to meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
> index af4bf3a9a9..27e3202de2 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
> @@ -16,9 +16,9 @@ global warming, discover sources of gravitational waves=
,
> and many other types \
>  of scientific and mathematical research."
>=20
>  HOMEPAGE =3D "http://boinc.berkeley.edu/"
> -LICENSE =3D "GPL-3.0-only AND LGPL-2.0-or-later"
> +LICENSE =3D "GPL-3.0-only AND LGPL-3.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -
> file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b19c1d46df6"
> +
> file://COPYING.LESSER;md5=3Db52f2d57d10c4f7ee67a7eb9615d5d24"
>  SECTION =3D "applications"
>  DEPENDS =3D "curl \
>             jpeg \
> @@ -33,12 +33,11 @@ DEPENDS =3D "curl \
>  CVE_PRODUCT =3D "boinc_client"
>  CVE_STATUS[CVE-2013-2018] =3D "fixed-version: fixed in version 7.0.45 an=
d later"
>=20
> -SRCREV =3D "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
> -BRANCH =3D "client_release/7/7.20"
> +SRCREV =3D "3422898505b74c637a4b530a94b63be90bdf025b"
> +BRANCH =3D "client_release/8/8.2"
>  SRC_URI =3D "git://github.com/BOINC/boinc;protocol=3Dhttps;branch=3D${BR=
ANCH} \

Please add ";tag=3D..." to SRC URI to verify that the hash belongs to the t=
ag.

Peter

>             file://boinc-AM_CONDITIONAL.patch \
>             file://0001-scripts-Do-not-check-for-files-on-build-host.patc=
h \
> -           file://0001-Do-not-undefine-_FILE_OFFSET_BITS.patch \
>  "
>=20
>  inherit gettext autotools pkgconfig features_check systemd
> --
> 2.43.0


