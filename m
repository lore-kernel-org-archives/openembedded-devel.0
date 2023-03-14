Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCD2C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 19:46:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4798.1678823162091771679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 12:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OgekkW97;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2437f4244a=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EAlPD7028833
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 19:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=LIhUw8zFOCt2BhMU32heF9HHJBSrkEJk3tyneWY53Ig=;
 b=OgekkW97awwN1MYkO/c1NNIIS0JXQO+cRSOe/dZxJ7ot2zB8/TL8hkMkFzBUFIVeSsFx
 oWeHFlzXcgENFbRK34a1nL7lpekixEw0DnhnPWTf2PetsRoDJCqeS/JGWWkRR+XfLtlj
 RXSxix3urLvGr33JPCzoTn6yvB/hLN4Uf6VLp4Grm/729f/75A4gZ2hcUf7MzeW73xOM
 9G4hDVrrEmlKiLnTOc5Hf2K2IWRlFaIUo/RxR7aibo5/I6USKd3nUUeGbviW+Xrsx/Z8
 hBcEv8qdcLWVUauRtVb2ckjGgajNzv79OFpcoBHmGqN1cYTo5tnhVknY1SdIuNWTrNnQ jA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma37sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 19:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afECKaeOInB8U4BC3M9jTTeen1rVMS8QrC0cgS/HpkBie+oRtTVeCmtMSp79HPY83gNJQWepY+HgTLaGcMGRVNfQurN4mZHiN0+5KKOGzmj6VNzcsGm3HrP7qFSqyFiRfYBH5I4I/y8GBo3TH1piK82xvpnLdgInXZ/hFeqo+/jMA5zVWlE5peT6WLg+kpy2+KZwkneNz4ye715vKVpb6F66Q0yKaWA/zPFmICPahZJJaNNzF+rAR7h/ZdqqCMyTc5ahxK3dsyNKo6uEMYqNha6i1nKFccK6UmFtjLPD1Nkqq80pl08v5YslF0XBMitS5FcyBkSFnqNJf4rmA5DKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIhUw8zFOCt2BhMU32heF9HHJBSrkEJk3tyneWY53Ig=;
 b=g+UtKNiKKhlNodDX1o3Mqhw/MNxhOuRlcJ07wMj/dO7jtRf+72sghiDvW5cZcUUO/QYtsbuE7P9NLuoxXvefxrZ3ahjABXI1GDsLecW9z3XpcDDazx+lLaAFLnGUT5VfvIhYgMzQq5WuZ3VxyOrseDfgkve2V1N/mYCUwc0he1Yi9IlNLwgQhEuosNSiO64k+iYytOlECRAToqrXXjAs86UOvroNI1MGkdUa3kfHxxNxzzGpbJn/rM7gHPsjnHINI6T6eZ2X1rqrCRH6yNoCquhJ4LMGzjqgJCkySSX/reDnS8SM39cGMRSs6GGh7mkcCGsytZhBbXr9IHSGiXXpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 19:45:57 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d7a7:d1b2:da63:9f06]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d7a7:d1b2:da63:9f06%5]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 19:45:57 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
Thread-Topic: [oe] [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
Thread-Index: AQHZVpAxercVUrwPsEKjovP9n0TLY676rfUQ
Date: Tue, 14 Mar 2023 19:45:57 +0000
Message-ID: 
 <BY5PR11MB399225D453E45AC06715280488BE9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <174C5542A1B6DFDC.13335@lists.openembedded.org>
In-Reply-To: <174C5542A1B6DFDC.13335@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|SA1PR11MB7700:EE_
x-ms-office365-filtering-correlation-id: e3910845-c9c9-44a7-51d8-08db24c4bb18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5KB8UpxtUhZmCveE6UHrX/ct9fa3DASYSJqYJfyVj1ZATewn5aAnzeKG6g3dJsQ3/jJnXCjm2MGItwachPpmHK3t9/XTZ7rfTH3prEyLD6ES1bxjTSQxy5UfQjnwpCiRTjPxbRyjrSfwMoz4Ffp5xd+hZ+tE7nCnvukhWwBnLtxeYWCrzsiFPtFqMW8e0EN8LKrEbrqqYu2fAi2QE7LgVEjQFLEevEKFVFKxgNgXxbm2wLv1GE/6a7QGt2K/wpeCa0BwyHg3Kxuib2ws1c9Kd0jkUNTlts103lahpTJ0QlpwtQkAVqmzmoFcz0yDUDFL/hOu9Xs1jLi2nvTlgFCwqgrcVc5dQhiiKcs0WJ2nEtVdxQJn0SJBkcNCD05xMDTh0l8VIXRI4ynv+5lSreg/HvWYgzuwx2YaM5OE5o5nGoJ8NNGEUZA1VKKS1pQoVFC8zqwesWgaom7sqMV/cxSe3DuYpU5XpSQBUUUfh+XGlru/LE8BHFXkV32jtMucmAXvxp9NFpU9Aa7uad97UYB7tu5VzkNqL2FUHb8e1khP/dIVYVNkW3Ju+Hn8syRfAgKgALWOE/biYHkmZW6SKy3+mSfXJ00i93tI71A78rG3nbyaOiQIrs3z8ukzQqO1Vdy4npOZWQWtk+7FRbEicASJSxun1HaujIjfzL/1rrob+U612H4VeCAbsnCua+cIvM6H72URRyyRvHOwvIRyigMmHQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199018)(2906002)(5660300002)(52536014)(8936002)(41300700001)(15650500001)(122000001)(38100700002)(38070700005)(86362001)(33656002)(7696005)(71200400001)(478600001)(66946007)(76116006)(66476007)(66446008)(66556008)(8676002)(107886003)(64756008)(55016003)(4326008)(83380400001)(110136005)(316002)(186003)(6506007)(9686003)(53546011)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KD2xlCSh7vf36w0zwNHj7XNFjR97TxJxibIPbebpUlb9s19C585g+xEe/l/J?=
 =?us-ascii?Q?8Znq+lz6YXUD226KWA/s3OPunV37JMpewMlu04fGbGl9kiURbzlG1am7brCS?=
 =?us-ascii?Q?FDdQPowHSwcWFHP40ZQPC2czcRS/Eo4+I3Iiw4J/F8z9QKnCIRlEMXS3LZnV?=
 =?us-ascii?Q?QmrtGojyNqTx7rbo3DGHZUFQH+O3r16M43O8CrwkBchU3pqiaYmzmF8qx9Hb?=
 =?us-ascii?Q?2brrIxg7jbQ7/051Q8W6z42U638tuGnC/NZ337dKlMCldw7RoCoDbkLcbtfA?=
 =?us-ascii?Q?IZJQYjGmXBQ3Yt34KXyZsvXJq8A2i/wRLS3+Ks12Ru/U2ZgeU2xpRo87Yr+G?=
 =?us-ascii?Q?x/96wZArMLRk8Mk8ABBJ/O+QslBtblvFzaMTYgB7rqLz8FSyeik9tWxZh74l?=
 =?us-ascii?Q?KiYFD500khYpsMHyGNc9qfspJg6CgdqW8AIa9n+j7jOE/vpQh2dl3na3rlU+?=
 =?us-ascii?Q?1+MU2E4VsWAg2vplnbvges2WAgzwds8SSBZxs3wdbIOgwoxbGu2FPeDjRxRa?=
 =?us-ascii?Q?OJfAiGOHk9b4iimURJcy4+rhoYn3OulVA3GyqOqjfLaFDUmerLQ1qU6rLxUu?=
 =?us-ascii?Q?i98SUScpajNKg63JuQzAhnvStmCdqUGN9ZF/LDqXrzp5AqK6ENKD8bMJjwxR?=
 =?us-ascii?Q?usoDBtEpbCSLrBkuAlYN9a+kHsFLLh1HvuzBY7hgO+aKcGrdLCOMh0sJJwFk?=
 =?us-ascii?Q?Kl4fyQdmNGvG0D4cnHP+aMphY+P8Kbk0GNeAcNf5N06EXPnbIUOQtUwpHarM?=
 =?us-ascii?Q?I4ezpbHE91ucmYb2aUg3/angXS5Nx7UI1iJWU3s8ATd6V+sfs/CkBHmBXOQf?=
 =?us-ascii?Q?+gEzYxkDPmyAzZnwAS03pIv5+QSgNiXrkLp+veDywZHRSC+YiAptGsVXxDbH?=
 =?us-ascii?Q?4VYxcJw0JExIaJ3fkdNcTii8xmgfPLcPhidg/MYF+9U29yCIn19/POx0IQGm?=
 =?us-ascii?Q?dY+8CvtPn1G+I6e9kClpJRI4i+X21vVk81VIagsKORipdfaDKoJPV3dCMASZ?=
 =?us-ascii?Q?ONwRJKR9k6ELk4HEM8SmiUqNkXpGSpgD2DKeyz32u7AGk+WAzC6j+9YEdMWy?=
 =?us-ascii?Q?HG+42f3jSmh+z24LqBqdlKiF42J5hFtg0CstsWlnLx6vuOPS03scymEwZPbf?=
 =?us-ascii?Q?uz4m67q65flDzTIrTj4RaIUeJM9WPbT2K8QveCG4GWtpUxPzj9Mh9k+b8j60?=
 =?us-ascii?Q?M5LWcCCbbdnxrxR4V7YXSTkExfcvCdZWJgVGZKzCyrGvJNKG/NAeXOHw48Hi?=
 =?us-ascii?Q?zA4PQmAcHWODku8XUxfTG2Qavhpdie6A6a92CdtZofoEh0rW+NrjxyKqYHlQ?=
 =?us-ascii?Q?uSs+d8QXDkdPZ8QlIARfP9jYKbHzAffKutyT+kVqBeRVvz81QgnvFmzYIBml?=
 =?us-ascii?Q?BBHK4B94zh96CMmLz8Wi+zuXDTVUN0bGPN+tgvmPjaSFcuRQlLdxdX/K43z4?=
 =?us-ascii?Q?r02N+q80ngot9ZgbIZ9S0F7+86XvHBI3G5D/sSX5oiyaVMe8ekOPXJ0DRpCJ?=
 =?us-ascii?Q?Lt3JDdwSOTgTNS1tNz/trxyjLJoOXoEO80hwnPj3UfYHZ1D4f11fBIg+Zt6t?=
 =?us-ascii?Q?hRZGmvvSCAqw0qyQHCXgwTSZmy5xbVSVCxHRm+FR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3910845-c9c9-44a7-51d8-08db24c4bb18
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 19:45:57.4024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ts5zqpVG6uwgAPUTmwMokvGT91ttK8aW5WF0Ad4f33WdjQcgoWsoxy7gY7Yu1sZ+/oaxoznfZv1PELsve1TlASeHV2WWRH3ceeTk1ebLefA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
X-Proofpoint-GUID: S6u8AobWPLHQC3V9eiFu32a2ZfXtgzFB
X-Proofpoint-ORIG-GUID: S6u8AobWPLHQC3V9eiFu32a2ZfXtgzFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_12,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140161
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 19:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101522

This patch is incomplete.  Ignore it.     Joe

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Joe Slater via
> lists.openembedded.org
> Sent: Tuesday, March 14, 2023 9:15 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: [oe] [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
>=20
> Modify patches to apply and remove unrecognized configure option --withou=
t-
> python2.  Retain --with-python3 even though it is the default.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...01-Makefile.am-remove-doc-and-apidoc.patch | 16 ++++++-----  ...move-
> prog-test-of-xmlto-and-asciidoc.patch | 16 ++++++-----
>  .../files/0003-without-build-plugins.patch    | 14 ++++++----
>  ...gure.ac-remove-prog-test-of-augparse.patch | 27 +++++++++++--------
>  .../libreport/libreport_2.17.8.bb             |  2 +-
>  5 files changed, 46 insertions(+), 29 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-
> remove-doc-and-apidoc.patch b/meta-oe/recipes-
> extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
> index 1ee0dd2f5..934dd1778 100644
> --- a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-do=
c-
> and-apidoc.patch
> +++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-d
> +++ oc-and-apidoc.patch
> @@ -1,28 +1,32 @@
> -From 1f7d106c7d982fe055addc8d883b161202233175 Mon Sep 17 00:00:00
> 2001
> +From 73dc0c2cd942e30f5f7cb40cb5828895b96f0fb1 Mon Sep 17 00:00:00
> 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Wed, 26 Apr 2017 03:47:58 -0400
> -Subject: [PATCH 1/4] Makefile.am: remove doc and apidoc
> +Subject: [PATCH] Makefile.am: remove doc and apidoc
>=20
>  There was a failure at do_install time, so remove doc to workaround.
>=20
>  Upstream-Status: Inappropriate [workaround]
>=20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Context modified to apply to v2.17.8.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>  ---
>   Makefile.am | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/Makefile.am b/Makefile.am
> -index 9ad827c..34364a8 100644
> +index 4ff2f5c5..d4e30bc2 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
>  @@ -1,5 +1,5 @@
>   ACLOCAL_AMFLAGS =3D -I m4
> --SUBDIRS =3D po src tests doc apidoc
> -+SUBDIRS =3D po src tests
> +-SUBDIRS =3D data po src tests doc apidoc
> ++SUBDIRS =3D data po src tests
>=20
>   EXTRA_DIST =3D \
>       libreport.pc.in \
>  --
> -2.7.4
> +2.25.1
>=20
> diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-
> remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-
> extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-
> asciidoc.patch
> index 2e691e95f..4fdf69c73 100644
> --- a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-
> prog-test-of-xmlto-and-asciidoc.patch
> +++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-
> +++ prog-test-of-xmlto-and-asciidoc.patch
> @@ -1,7 +1,7 @@
> -From 9beadcdfca9198548f06bf18f3f26e1d11542e53 Mon Sep 17 00:00:00
> 2001
> +From 276c45d0663124c9ccab0ddc8b97fb5cdc8b3867 Mon Sep 17 00:00:00
> 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 31 Jul 2018 16:53:04 +0800
> -Subject: [PATCH 2/4] configure.ac: remove prog test of xmlto and asciido=
c
> +Subject: [PATCH] configure.ac: remove prog test of xmlto and asciidoc
>=20
>  The prog of xmlto and asciidoc were used to generate documents,  and sin=
ce
> the doc module has already been disabled, so we should @@ -10,15 +10,19 @=
@
> remove the prog test.
>  Upstream-Status: Inappropriate [workaround]
>=20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Modify to apply to v 2.17.8.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>  ---
>   configure.ac | 18 ------------------
>   1 file changed, 18 deletions(-)
>=20
>  diff --git a/configure.ac b/configure.ac -index feafc28..aceccf4 100644
> +index da8cf898..17ece200 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -56,24 +56,6 @@ IT_PROG_INTLTOOL([0.35.0])
> +@@ -57,24 +57,6 @@ IT_PROG_INTLTOOL([0.35.0])
>=20
>   dnl ****** END ****************************************
>=20
> @@ -42,7 +46,7 @@ index feafc28..aceccf4 100644
>  -
>   AC_ARG_WITH(bugzilla,
>   AS_HELP_STRING([--with-bugzilla],[use Bugzilla plugin (default is YES)]=
),
> - LIBREPORT_PARSE_WITH([bugzilla]))
> + LIBREPORT_PARSE_WITH([bugzilla]),
>  --
> -2.7.4
> +2.25.1
>=20
> diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-build-
> plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-bui=
ld-
> plugins.patch
> index c331677d8..f6ff86040 100644
> --- a/meta-oe/recipes-extended/libreport/files/0003-without-build-
> plugins.patch
> +++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugin
> +++ s.patch
> @@ -1,26 +1,30 @@
> -From 41bce1de2fd2a0f79c266f245ae3e3720ccaf46a Mon Sep 17 00:00:00
> 2001
> +From f46610901dbac56d9631df012374c600db08453e Mon Sep 17 00:00:00
> 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Wed, 26 Apr 2017 03:51:03 -0400
> -Subject: [PATCH 3/4] without build plugins
> +Subject: [PATCH] without build plugins
>=20
>  Upstream-Status: Inappropriate [workaround]
>=20
>  Rebase to 2.9.1
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Modify to apply to v2.17.8.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>  ---
>   src/Makefile.am | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/src/Makefile.am b/src/Makefile.am -index c15928c..bac02b1 1=
00644
> +index 410bfcb0..bac02b16 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
>  @@ -8,4 +8,4 @@ if BUILD_NEWT
>   sub_dirs +=3D report-newt
>   endif
>=20
> --SUBDIRS =3D include lib plugins report-python cli client-python workflo=
ws
> $(sub_dirs)
> +-SUBDIRS =3D include lib report-python cli client-python plugins
> +workflows $(sub_dirs)
>  +SUBDIRS =3D include lib report-python cli client-python workflows $(sub=
_dirs)
>  --
> -2.7.4
> +2.25.1
>=20
> diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-
> remove-prog-test-of-augparse.patch b/meta-oe/recipes-
> extended/libreport/files/0004-configure.ac-remove-prog-test-of-
> augparse.patch
> index 986e7ec41..998ae6b50 100644
> --- a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-
> prog-test-of-augparse.patch
> +++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-
> +++ prog-test-of-augparse.patch
> @@ -1,25 +1,29 @@
> -From c1c301502a8f69b9889197744b301a136082f09d Mon Sep 17 00:00:00
> 2001
> +From 62c922f43b54585d25ba89be36c10612b479270b Mon Sep 17 00:00:00
> 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Thu, 27 Apr 2017 02:15:02 -0400
> -Subject: [PATCH 4/4] configure.ac: remove prog test of augparse
> +Subject: [PATCH] configure.ac: remove prog test of augparse
>=20
>  The build time does not require it.
>=20
>  Upstream-Status: Inappropriate [workaround]
>=20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Modify to apply to v2.17.8.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
>  ---
> - configure.ac | 8 --------
> - 1 file changed, 8 deletions(-)
> + configure.ac | 9 ---------
> + 1 file changed, 9 deletions(-)
>=20
>  diff --git a/configure.ac b/configure.ac -index aceccf4..83c101b 100644
> +index 17ece200..89b463a4 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -350,14 +350,6 @@ AC_ARG_WITH(augeaslenslibdir,
> -                            [Directory for librepor lens (default:
> /usr/share/augeas/lenses)])],
> -             [], [with_augeaslenslibdir=3D"/usr/share/augeas/lenses"])
> - AC_SUBST([AUGEAS_LENS_LIB_DIR], [$with_augeaslenslibdir])
> +@@ -287,15 +287,6 @@ AC_ARG_WITH(largedatatmpdir,
> +             [], [with_largedatatmpdir=3D"/var/tmp"])
> + AC_SUBST([LARGE_DATA_TMP_DIR], [$with_largedatatmpdir])
> +
>  -AC_PATH_PROG(AUGPARSE, augparse, no)
>  -[if test "$AUGPARSE" =3D "no"]
>  -[then]
> @@ -28,9 +32,10 @@ index aceccf4..83c101b 100644
>  -    [echo "Then run configure again before attempting to build librepor=
t."]
>  -    [exit 1]
>  -[fi]
> -
> +-
>   AC_ARG_WITH([defaultdumpdirmode],
>               AS_HELP_STRING([--with-defaultdumpdirmode=3DOCTAL-MODE],
> +                            [Default dump dir mode (default: 0x1A0
> + (0640))]),
>  --
> -2.7.4
> +2.25.1
>=20
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/met=
a-
> oe/recipes-extended/libreport/libreport_2.17.8.bb
> index e21161943..a8d1db65b 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
> @@ -33,7 +33,7 @@ inherit gettext autotools python3native
> python3targetconfig pkgconfig  PACKAGECONFIG ??=3D
> "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
>  PACKAGECONFIG[gtk] =3D "--with-gtk, --without-gtk, gtk+3,"
>=20
> -EXTRA_OECONF +=3D "--without-python2 --with-python3"
> +EXTRA_OECONF +=3D "--with-python3"
>=20
>  RDEPENDS:python3-libreport +=3D "${PN}"
>=20
> --
> 2.25.1


