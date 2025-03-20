Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F97C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 21:10:15 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.web10.6176.1742505012530020274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 14:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FNPU9agQ;
 spf=pass (domain: siemens.com, ip: 52.101.72.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWAqNar343ZpjyxpBzwhvhZJ/LJghAfsO0M2wUzGyEZ6gC9DV5FX1KSUg5XIzanjdP9uFS5UfEMxF8u7NVM0RrllE30Keds8Znoay7wooGin+5fTaKtn1KJhDMxHLr4lSfiPNAghtb23usm7VUassnt5+ieqYyorWirrad0tfcEiGblBWHrfTbMbS/m9ovW7cU4Mt7LZHur5IMPNXQja6D1QxURFkdfgEB+NH4QrhYZCz7j/BGIXUsee4zZwiZizBcy00O/cU2zatuka9emC9UGKqgLCFmlm5n4mtSGufk5Gjda5tEfunE0ZNAAwVBi0BqN5ZJ1Uhes5EDCqidnzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOD2yxZCCVFqBvasZturhxdCckX1RU9afk8eGH7KNuo=;
 b=IU2Qt01r1vJus29obDWoEZoDo5HHwfflLsYxnz3hOyuD/0UJT0xBt4ExF5xJ3ESvDMcOLd+gfAYgKTzB6+YBGz0PY4H9AXXmdDRO9N1Cp9ajnD2pm+op4iYVTeB79pAC3n8CpXkxT6xPIblHtXNCxv3BDpmjGU2UauvMA+gHxWMzPOVCueQqoopB5QIunqfJfvxzdlF4bF+Z1u2EzcTkqgd/1jcBWsH2jcGX0G1CExBnXKWe/BAek10alerZuHnL7cjDh76MVc2WNPeptom8zI9FUt9/ScyKHjBhHz7CocmW/r6NeGZE1z8HByCUTRpiUTzrweHU5UzVPMVyJFQaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOD2yxZCCVFqBvasZturhxdCckX1RU9afk8eGH7KNuo=;
 b=FNPU9agQqo7JCJt26NFTBgb5QcMhc5xar3k/CM00NAPUl8fj/sB1BkdhsFZb/SCFY+7aDR2MJkwIi4NGvtBqFDk5NMyI58VdBcamPd4Kz+GiTRvrSEMa+RdYzmdnB8DGCf5bOtjhFyjOfDQOKAwl24GHoC5igNRdamBUtkCrMSw4VsRvcXorJ8GnMkkpMMFwQ6uf09vQCrSuBz2PK/PQ+QgABJZYujFZvswLt4b4g+OUDfAXaRLsjQrthW6EUzIaJEQM8Y+XPPoq/mMtfRR5azwRRec+Rjx2d2t6s6q+WivS7Oc6aoyfRr4M8KGtjADNiGX6r37dBoqgaRO4Ar0mUg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 21:10:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 21:10:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "omri.sarig13@gmail.com" <omri.sarig13@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
Thread-Topic: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
Thread-Index: AQHbmYwRw/JvxTEG0U6gdppHoYUNnrN8hWxQ
Date: Thu, 20 Mar 2025 21:10:08 +0000
Message-ID: 
 <AS1PR10MB5697938634FFEB1D1A4B31D6FDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250320113010.1428716-1-omri.sarig13@gmail.com>
In-Reply-To: <20250320113010.1428716-1-omri.sarig13@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=61b27a5c-3b8a-497f-9423-5de60b1b4063;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-20T21:08:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5882:EE_
x-ms-office365-filtering-correlation-id: af5f99bd-3c50-46cb-cf50-08dd67f3981d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cS0uPwr11MZNZaLevjTEnDl8Uo55ROOzH+TatCDrGo9Ma40zNVWrd8VbJ+Nv?=
 =?us-ascii?Q?zJWQq2t3NcK6MWqSA4nc2yVQzzNIcaYBnHCPwMaIg0fuOzSBTEVN666E18NG?=
 =?us-ascii?Q?mAt9k0kLnlcCoraHle2g1GilVItcpkilg/znAGdTb+jzEsoGE08bh7LFR1Sy?=
 =?us-ascii?Q?6ISy5AAFY9jrMIbXY4/gok3T4hWgdeNdhMB24DSsZR0sIImnY22bWaVdeAx3?=
 =?us-ascii?Q?r8KeRGtccyPO3I1KlXCjY8jiPHCuhiEoaZfZra0DGuUsllin9N1zk7UYW3LD?=
 =?us-ascii?Q?T8UgKDWZx5Sj2t8PJmTW9vq5G2ZbioVmQX9o6htBnalUH75dvi7rognEJD3P?=
 =?us-ascii?Q?cUbx6MR1GlX+ZIbnU7o8+lKhKJtYaiyWKzL+hIqMWHOrrL1LAY8zoMDi5khP?=
 =?us-ascii?Q?CXL4xXrRb38iCMdpx3EU0LWog/kgrf81dFO1k2grBqTj70Fm6BfAfqKSEwwP?=
 =?us-ascii?Q?Z2GrvDIUUC44INBTcxH19D1X3ySBZTmLYKRS8l25i6smaJqKGJakUyKYfeOb?=
 =?us-ascii?Q?Xultvp7q6i/OtteBF84OYMUh6tm7c8MAn0VxyyIEYaWpsjhhNW3oDcVlrXHy?=
 =?us-ascii?Q?NbcoReRBaDpgv7Z+IFt+yVhVsqluGufPSCVkDl2VxRF6ZK3Cq5FSCTR9gD3+?=
 =?us-ascii?Q?ONRPwVZGesqQ8aSqSYTf5tV9ttLHq4xBwtzv7e2zogRSy/DmRTJi1WGHnkiK?=
 =?us-ascii?Q?6wMj919JnoNdJXE4TzKzx51JyzFA2gwnOm74WPBO1R6rchaDiHANA8gHnfas?=
 =?us-ascii?Q?Qx+SgCqXiYcQU7MQF+TZdsmrABIBozuXyZLAMYgsTN/DxNItIonTfECOr0L1?=
 =?us-ascii?Q?IaLSS7ZqrC3GUXjlPabeVdi/Ds8Syt8vas9VGjkUv8xduqUwlj2Yh3pXRspk?=
 =?us-ascii?Q?4Ue3g//FSaIxH2nl7xbmFAieOSyQiObK4TpNWbaVe8b2+zwwjdRhUNzoqm3H?=
 =?us-ascii?Q?C7uWRYwx4lbrJEXLIjC0SKPSGk+R2euEGnRA8ZADGTtv+xx/h3ovNEQJwFWc?=
 =?us-ascii?Q?M2cZsZZjSQxgUwGZqB9D+kXcp6gvXT74r7+WKUxYakJ1twZsrXgHMvPL3ZEg?=
 =?us-ascii?Q?MiSVofapZ5LzykOj9NOeWOU6nEEeq3WzUsSTavyvLs1sPOSiVC+BT6piE2XT?=
 =?us-ascii?Q?KZoxjTUmYIcpbyOGDAQW2qxEuptvYGV9OJgJrwUxW+67bCFt/UjTUFxHJlT1?=
 =?us-ascii?Q?MKMZl56gYIlUxRd5FyaSGajRDcOWduwZT1/oINcsov9dkbkovj3PuxCyHAs8?=
 =?us-ascii?Q?P+diyrKunrr41rT++3cfOU4nEa31l9XOSYHqBHHA0wb5ztYJSrCWiB1x/XKc?=
 =?us-ascii?Q?mAHHpd1Y1AnQmK4encKTGP34zJmYtPx7P8rfTli+mCln7vjn4jcDF5XOPn4l?=
 =?us-ascii?Q?YtKXO1RicIF+POtgPwcSzJuqmJ4L?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hWhOO4i385c8x3gUAORy7T4n5Bbq3L8LDijT8Y+HgkndSuyG818b2bTDILMQ?=
 =?us-ascii?Q?tyXMhZQx4DsFrPdNw+oGUjPRGQP1lWfR2sMptaCdk/us4QV+AP+KtuRiBBY6?=
 =?us-ascii?Q?6Pxg+1wosxcaT3WSDdH9tgnCrya+Zb+TWEOrFhWAo2ed6KWw60S9cPmJF67d?=
 =?us-ascii?Q?MJCXsMaUyFpmXoghWyMmKUt7oZ6RlGZi8JMU2I8wueKyr/TggC+miiDYD5ao?=
 =?us-ascii?Q?ApbRIG+E/lXG9Xa1grdtCeOJ3qJZXjVgihf2lbsv+2RdA8ArdKP9xuFpplf9?=
 =?us-ascii?Q?QtKTBuOTLcWkdbQTab/vKhynS0VQbxQmf2SvAxvZEMIwnQgWIE50Lrk111e5?=
 =?us-ascii?Q?N79I7kBs8fymiTQynQ0HCk19DPoyJ+ZX4AH26PnrX0TKKsPMLWnmmki8bDoM?=
 =?us-ascii?Q?jp7WnE6BfmVg3o3RgPPwlKzQk8Pg+o3BfZfEzWFmVgpPj0EwTXMUwoxKOU0H?=
 =?us-ascii?Q?Uzmm3hxvd/EOMChuDxL1LlJrBE4ddJszBCj9x0kDAzp+fvRJq+LvM67wKGaj?=
 =?us-ascii?Q?cq0SSfuTCAwk49psJuSK2Aefe6AJJSVGjTgCIawk0uvuSLfBEBBmGHuQ5o0X?=
 =?us-ascii?Q?VxOmJB3a0dpnqE5b7aUrM1eoDSHOWeQYaZ+j8xwiwDonoE2ZTgAvuxf1Sk6z?=
 =?us-ascii?Q?a1OwqemVB+MIAl8rN6F/7ZRrzSK9yQDZGmAf4rC/H9U3xPWXuiFnkmEYIzEc?=
 =?us-ascii?Q?zi/ibZ10DRgbcHG2ATiBz69tRyoO2C7RM8BiKoBYpa6XG+8pzeiYs9jFyLRw?=
 =?us-ascii?Q?Octg/J0h9sgC0KfvfTtwp9E6xhWw+woVJ4LsBiBi9Y1NOr9rxAG2XIX8V42S?=
 =?us-ascii?Q?6umzPO6ubrWN9eJOnuvzjadc15MeRKpCPBTW76IhE0RHaeit12CgeUpx/8Oq?=
 =?us-ascii?Q?jP/wNF1PmXsFThWEUO6vMa6s3ZC0Qqf933vxUsaBFzv64WGL18vVpx9efYU8?=
 =?us-ascii?Q?6Oq3aWb9R03K0vaTN6dRe9BC+7H4W9jhO2eLmnCky4fWvKXVKoDuSGsud5sP?=
 =?us-ascii?Q?rlrAxeb0LswVdeKed+HnP41fH/uW77dJ1ZKhpMkoJcb0LxIHojMMn/up3KHV?=
 =?us-ascii?Q?AfQs/fpBvIztCTAl2vv4hoUaQBkfr3vVEIbDGQYwQxixJToaVT7HaNHiT6pL?=
 =?us-ascii?Q?BsnoVMKj8hJZ7ehbO3P7Pv9Q7kpKNf/ZdjICZmHJg5qoiRJREBaB8obml1FR?=
 =?us-ascii?Q?tusBPiGp3bRXQY8h+Wy7rHKoDwqqzmmwwitHr7NzYhd8jcT4O8hCZEyZ7ZqC?=
 =?us-ascii?Q?LhbqnvnMd1+HgC8Hbnd+mB6VEwP81XFM0AiMUogxQ3O5M9Mz7YwpilXLIoZB?=
 =?us-ascii?Q?GIRUCxB8vfMvl8J5XV2spqMDOkfW5cIVC9IK6tRoiH1+/VqygTs+lK5tMrTV?=
 =?us-ascii?Q?Q2RUAPZbuF9Tk3YfVcqq/Ok/EX9DMxcPFD3cIuFNhc7FKvdBApZ8RLG4MFjA?=
 =?us-ascii?Q?CDL4hmdlo37D6/nrlAuRfttdxdc8Riq0ncIrtRnawYYH2S+zaYdKS7Mwguy8?=
 =?us-ascii?Q?QnOurwYWaC0jjlP6PR7dJF6La+0yOocu2PncHqJTRqtCdvaJOLQTVvclZwJM?=
 =?us-ascii?Q?T0aFlVSvuqaDJB2xPR/G4RvJldzEck6GkzRvpMoc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af5f99bd-3c50-46cb-cf50-08dd67f3981d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 21:10:08.3235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zry429DaTJ35aULxOPt7Mu0yvDNuxb8pms+BJnBZDB/4K0KLUCIIFlHfzd5VYoqE0ui4H1WrWYLuIAD/TjyD2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5882
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 21:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116147

This recipe is missing version (e.g. 31.0.0+git).
Also the runtime dependencies should be split.
I think that at least unittests should go to ptest package, not main.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Omri Sarig via
> lists.openembedded.org
> Sent: Thursday, March 20, 2025 12:30
> To: openembedded-devel@lists.openembedded.org
> Cc: Omri Sarig <omri.sarig13@gmail.com>
> Subject: [oe] [meta-python][PATCH v2] python3-varlink: Add recipe
>=20
> Add a python recipe to install the python implementation for the varlink
> interface.
>=20
> The recipe is using the current master head, instead of the version from
> pypi. This is done as the pypi version is 4 years old, while the master
> is continuously maintained in GitHub.
>=20
> The runtime dependencies were created by looking at all the import
> statement in the installed files of the repository and looking at the
> relevant packages from the python3 manifest file in meta-poky.
>=20
> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-varlink_git.bb             | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-varlink_g=
it.bb
>=20
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-
> python/conf/include/ptest-packagelists-meta-python.inc
> index 3a1fb13ba7..40df4f08f3 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-unidiff \
>      python3-uritemplate \
>      python3-validators \
> +    python3-varlink \
>      python3-wrapt \
>      python3-wsproto \
>      python3-xlrd \
> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b=
/meta-
> python/recipes-devtools/python/python3-varlink_git.bb
> new file mode 100644
> index 0000000000..8b5e01cf44
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D " Python implementation of the Varlink protocol"
> +HOMEPAGE =3D "https://varlink.org/python/"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e"
> +
> +SRC_URI =3D "git://github.com/varlink/python.git;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python_setuptools_build_meta ptest-python-pytest
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-core \
> +    python3-datetime \
> +    python3-io \
> +    python3-json \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-shell \
> +    python3-stringold \
> +    python3-unittest \
> +"
> +
> +PTEST_PYTEST_DIR =3D "varlink/tests"

