Return-Path: <gary@missionsecure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DB2C636D4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 19:23:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.65])
 by mx.groups.io with SMTP id smtpd.web11.226.1675797818902891056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 11:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@missionsecure.com header.s=selector2 header.b=cm4PBwJj;
 spf=pass (domain: missionsecure.com, ip: 40.107.94.65, mailfrom: gary@missionsecure.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbT6tNwxlYVblXg8SvkJxK7X3m8je00K1sk0z6zQWPvOPgG0zpEGe2Otahzid6nmPdoETx0faqUmVMhTBKCOwTIuq6M/IYzXQ0Qgf27DFOU2YZW0hJMavHwMob5ErUSrfYErUlAmG0uwes/+iHGNBRom9ecRf3aHkF5I7oMJVa1cqop80T+EtTYXsBwqdB5QrGmirv6YhdEN0ssvK/9aaNMBnhvV8b9wOflUk9/A1G8aXimmR/+E8x0O1Y4J0kc79rG5MsjZMYN55FN9CM0Wr7xQMiCSd6bmQAUF8cSnk8nVTwrdusWuBjC30iFcYGV2Kj8NA1yKZabfnjqCU3eWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhp4Od+9UaXaW/tmhuuAKbe4D6rmWjj8bSP0n6wUP6o=;
 b=WK4MU6bv/Z/DJ0lroTsRdg4jwQQdIR/VooTV7e9u4CUjpW65c3XklH8WxLcB86SumIfrR7eFerD4DEUG3JlfKo6hxQAAI6QkuqU28+oR5RQIx9Ny/5aWndPyZtac0ZEzAXRGp2LBjTsxIsVLzV/91u2yY9AaQVUSUQLuQj9doXNW75tIHJAdnO9qNfiaKq1WAmzox1AdMIgJeXQSs8lLQmzU+tRhi5L6/VfWmj52wiCDKc2Dh1AKNNaqNbTHPEZ8TlR96ZDVv8FE7PwJNfj1MV+8L4PgwVz4lflIbpjBD2VnzUNttvwlfb50woCPhDPqMwNZyKpb/tMf6ZEC1VCulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=missionsecure.com; dmarc=pass action=none
 header.from=missionsecure.com; dkim=pass header.d=missionsecure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=MissionSecure.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhp4Od+9UaXaW/tmhuuAKbe4D6rmWjj8bSP0n6wUP6o=;
 b=cm4PBwJj18tYHAhYzZeaVBmDzlNw27EgGost4en7pMti63iYgyOraPTzWDgiekbycAC48uB5os5wlfU7d7c/fB2m5k0Q98QhueCD1eX6x5qN4Z0Dm+I9bxVQ1mMBBVgeIyj3Tmz20UnjBjcLimZ87QGMBEqq04l2bBYz1hacT6U=
Received: from MN2PR17MB3903.namprd17.prod.outlook.com (2603:10b6:208:20f::14)
 by SJ0PR17MB4776.namprd17.prod.outlook.com (2603:10b6:a03:37d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 19:23:35 +0000
Received: from MN2PR17MB3903.namprd17.prod.outlook.com
 ([fe80::6acd:77fa:9f8c:4698]) by MN2PR17MB3903.namprd17.prod.outlook.com
 ([fe80::6acd:77fa:9f8c:4698%6]) with mapi id 15.20.6064.031; Tue, 7 Feb 2023
 19:23:35 +0000
From: Gary Huband <Gary@MissionSecure.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: [kirkstone][PATCH] chrony: add pkgconfig class as pkg-config is
  explicitly searched for
Thread-Topic: [kirkstone][PATCH] chrony: add pkgconfig class as pkg-config is
  explicitly searched for
Thread-Index: AQHZOykGo2nPeAqAIUyKflM6ORXe5Q==
Date: Tue, 7 Feb 2023 19:23:35 +0000
Message-ID: 
 <MN2PR17MB39038E721AF5C601A830D200C3DB9@MN2PR17MB3903.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=MissionSecure.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3903:EE_|SJ0PR17MB4776:EE_
x-ms-office365-filtering-correlation-id: 9c2adcb2-a0f3-4a8c-bfe8-08db0940ce84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qBa9LjRDFnNiQw/NHaAnrPQxHboZrqMrit/nxYTbYuESdvhA7cFgg2K+qxKIovVv5D/Hbb8QQN105a6VcPAEvzvnDCt8VZrqXH3l6umd6kdiGO3ExnlZvJBJaJ0T2r/6HPEYbzOIr7/GFM7xkFu0kHFiuzjpmU9cMjP/O/dnxouWK4XEZZgBfQiRrOa80r8d+O1w5mijDPY1gT5Ccm3BUSdslPufClqLlFjNhAdDIIEpS2u+XqFlPNC1rUP+5mTDG0NSbuEfvvI1rE+19cHCb/r+eJM/tQC+tqY+MKIfrs1qiYYsrhOuE3wioNmYw82bDOqWOOAtvG3zshWvXBfLZF/os6kyMTwUKC3+mP4Iq8De9Wny+xT+veYYuDNtT5gLMW7G5F5sy6BhaxqVX+QxlgkNRWDKI34TUt9cH9+7MNCdxqP2OtLKeDlZ7YQCQCCSAsl+I6xcR0U6mpureZY/07q4DeZcBre5gOPeVM9CZGqxESKtM/IGTFpsN3+GmmBHCFu6rcoEDtZv6usljiAkIcneZgH4/qvKaP4axOS5ZM1JXmL9BmFtPcW9evvBLeL3N3ZHjZAYAYLzmi3OzKAHPknUBBASWpVa1y8mVCevDF719l07m6TGiw4U6uLoEvp1uQgbOsA6jWgChU4bj4rHKy++62O4fMijN66FgC2dJZxcR+dn9Q7Epa6lxL3qEbUD9HsGmws6XeNKsXiivmR8At5PpXjQtVjQG/hJtqItmXM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR17MB3903.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39830400003)(346002)(136003)(396003)(376002)(366004)(1690799011)(451199018)(19627405001)(122000001)(478600001)(7696005)(71200400001)(45080400002)(316002)(38100700002)(38070700005)(55016003)(40140700001)(86362001)(33656002)(2906002)(166002)(53546011)(66946007)(66446008)(5660300002)(4326008)(64756008)(8676002)(6506007)(66476007)(8936002)(9686003)(52536014)(41300700001)(83380400001)(6916009)(76116006)(186003)(66556008)(26005)(85282002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?svKSLjVLEtVIaFqFGV27DwMYZmEwMuioM3Y25nRImMaJ8csDYE+9tXHKA2?=
 =?iso-8859-1?Q?tU4uh8lpBVR9bH9+atPIPyrcIzzOreB8qhREc+HVl+2tCLcSstxY5PUr5X?=
 =?iso-8859-1?Q?L2h8J20Gh8UBG/MPawCr/BtNRSg4Uf1EjzRaUCk5Y8KbofxlDbW8pE6eXc?=
 =?iso-8859-1?Q?BTP/lTn0a7rLl4Ko5PpFCHC0KxlmjXG1Mix5YWKbZtni9IQ+QFBundCPh3?=
 =?iso-8859-1?Q?jp37sr4WRsaqQRMInHlNbAh6APbA8mZZEIXc6oyMPnuzOMt3MNd8zIv0uq?=
 =?iso-8859-1?Q?eO8DwcPQQFjz0gv7NGKRdQzgu3+nlYhPBxH17cX8yFjsDhadUpbzHEI6TG?=
 =?iso-8859-1?Q?c9LQ5fClwL4tCVzuWE5akd/4FQ2tR/a7hoAcnJ9KpCLTLazy6OOGOjgwbe?=
 =?iso-8859-1?Q?7ZFHhsZfTCyVrC13vqeYpDpcWY752FGnB9rnBi6zHb4R6TuowQLdnugxxm?=
 =?iso-8859-1?Q?Pb+ixhSoJ4kN7KR7ENJdaMi+DmE1ojCOxM+0lzyHCpf/laACIFWVyxW3Xw?=
 =?iso-8859-1?Q?YmHTZQdVboSz67g+zmS7mK9azFdGtUe5izopxiO6/aCPcAfHgPfjxGgZJN?=
 =?iso-8859-1?Q?S3u2AUKVwCwURlfxoQsBqqoTAlQNc/r7t+KJtk8OI7yQYDXIfyQRp+X35Q?=
 =?iso-8859-1?Q?XMrw/7Kwep0GyybcxCXEzOEjeDpk1FoTxvL7PdLvUbnHTeVGDKxnOwuAxS?=
 =?iso-8859-1?Q?mWUu6tUNz05gaTmMPLdO/6LEmlxCccwNYkkjg/GrI2hkiuGHr0TOHIQyDb?=
 =?iso-8859-1?Q?maKdonGCKZHtmkt6/RT0/d5bMXwHJibtoqTLZBGqhrYMn9bJBrRhC4TfLd?=
 =?iso-8859-1?Q?mU6I2jawI9TXkqFQC0JlN41k65fKhsBdHtTAJe3DLleTlteyNVwZ2f4MbG?=
 =?iso-8859-1?Q?AD/EbvNN3Xa1cPlW6jA7WV+btJE0MLjsLSqMrkGJf2dqmr9ZeFHzVmt+/N?=
 =?iso-8859-1?Q?4691VLWS5W98dUeCbtqrvEYzAy20nd13MvCNcp2jx8tWkq0uvBlFItNC/I?=
 =?iso-8859-1?Q?2tbLD1wq7UTUz0UXxPzyjbkKBYVOGiXRYF09vIsNnd7a8JN4WoV1lShGlW?=
 =?iso-8859-1?Q?jCONYMByRqNYvag9m/+X75CSHjU03jG6FXkfe5PI3vg1bphPpvivy2/J59?=
 =?iso-8859-1?Q?edj3wFNEmyMQi2cn/4jPWqQ/JpaNjuZHF+5MbffHOJNk3yhwbCBF4cq6i7?=
 =?iso-8859-1?Q?BcUazrYvVz6Q5s6wEUjZkrxpL3nzrVh3RJsDMr9zA6hJO68Lj21nrpdCbU?=
 =?iso-8859-1?Q?INdcriRFxxlR7BOfmzDRPVLi5CsPNI75352Ap6nLygZZx5DFQ8Ffig1qVX?=
 =?iso-8859-1?Q?yO5X2mh8SQ9Gn6meWi2I88xG9TpKxg5M1cbVjJzt36/YJGi9R7MrusoFEc?=
 =?iso-8859-1?Q?d9W7gxmDVslDRhBfPpaA+Bh0l59zAErApCd4McMvZXd2PWvvNx9Fu2BuQI?=
 =?iso-8859-1?Q?ie+cyWiMOWVdFdk2eTsZlnHpLFwRMOqvExIMX2D++5aG2dX554Cn4f+PHr?=
 =?iso-8859-1?Q?QTh7/X5w07QLvItZupwNPvLafl/xmhVpb7GmbUxaP60k5HYLE0J0Cq4eHW?=
 =?iso-8859-1?Q?swSYXMOq2J4R0MGf0Nd+FiKXTgZAXjnwAwSEB0P682woVyd+R5EhTo8G7o?=
 =?iso-8859-1?Q?Cs+geq3PpnoEgnms0iUnvoAl4pnHauLBfV?=
Content-Type: multipart/alternative;
	boundary="_000_MN2PR17MB39038E721AF5C601A830D200C3DB9MN2PR17MB3903namp_"
MIME-Version: 1.0
X-OriginatorOrg: MissionSecure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3903.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2adcb2-a0f3-4a8c-bfe8-08db0940ce84
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 19:23:35.0264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0ca9611-f13f-4dc9-8e1b-119172b8ec5d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZEBUjVCIsyaMiW1FrfzxNJzYi2VeTL4EH21jblQ2nWDJkhR44X7QOG4gcC4SssZta2t3t2eW4HjcEw5RDVGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB4776
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 19:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100965

--_000_MN2PR17MB39038E721AF5C601A830D200C3DB9MN2PR17MB3903namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From ec97a83702704bb02b00358c0d26e78294ad3254 Mon Sep 17 00:00:00 2001
From: Federico Pellegrin <fede@evolware.org>
Date: Thu, 6 Oct 2022 14:17:21 +0200
Subject: [kirkstone][PATCH] chrony: add pkgconfig class as pkg-config is
 explicitly searched for

The configure script present in chrony will explicitly look for
pkg-config and without the pkgconfig class it will fail:

Checking for pkg-config : No

This then affects the possibility (via image features or bbappend)
to use features based on nettle/gnutls/nss which strictly require
pkgconfig to be present and working.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-ne=
tworking/recipes-support/chrony/chrony_4.2.bb
index 8d12cc75e..b7d21b7e9 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
@@ -45,7 +45,7 @@ DEPENDS =3D "pps-tools"

 # Note: Despite being built via './configure; make; make install',
 #       chrony does not use GNU Autotools.
-inherit update-rc.d systemd
+inherit update-rc.d systemd pkgconfig

 # Add chronyd user if privdrop packageconfig is selected
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d=
)}
--
2.25.1


Gary Huband
Sr. Software and Systems Engineer

Office: 434.284.8071 x720
Direct: 434.260.4995
Gary@MissionSecure.com

Follow Us!
LinkedIn<https://www.linkedin.com/company/mission-secure-inc->  |  Blog<htt=
ps://www.missionsecure.com/blog?utm_source=3Demail-signature&utm_medium=3De=
mail&utm_campaign=3Dblog-email-sig>  |  Website<https://www.missionsecure.c=
om/?utm_source=3Demail-signature&utm_medium=3Demail&utm_campaign=3Dweb-emai=
l-sig>

: : : : : : : : : : : : : : : : : : : : : : : : : : :

[MSi]

This email and any files transmitted with it are confidential and proprieta=
ry and intended solely for the use of the individual or entity to whom they=
 are addressed. Any dissemination, distribution or copying of this communic=
ation is strictly prohibited without our prior permission. If you received =
this in error, please contact the sender and delete the material from any c=
omputer.


--_000_MN2PR17MB39038E721AF5C601A830D200C3DB9MN2PR17MB3903namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
From ec97a83702704bb02b00358c0d26e78294ad3254 Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<div class=3D"ContentPasted0">From: Federico Pellegrin &lt;fede@evolware.or=
g&gt;</div>
<div class=3D"ContentPasted0">Date: Thu, 6 Oct 2022 14:17:21 +0200</div>
<div class=3D"ContentPasted0">Subject: [kirkstone][PATCH] chrony: add pkgco=
nfig class as pkg-config is</div>
<div class=3D"ContentPasted0">&nbsp;explicitly searched for</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">The configure script present in chrony will e=
xplicitly look for</div>
<div class=3D"ContentPasted0">pkg-config and without the pkgconfig class it=
 will fail:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Checking for pkg-config : No</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">This then affects the possibility (via image =
features or bbappend)</div>
<div class=3D"ContentPasted0">to use features based on nettle/gnutls/nss wh=
ich strictly require</div>
<div class=3D"ContentPasted0">pkgconfig to be present and working.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Signed-off-by: Federico Pellegrin &lt;fede@ev=
olware.org&gt;</div>
<div class=3D"ContentPasted0">Signed-off-by: Khem Raj &lt;raj.khem@gmail.co=
m&gt;</div>
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;meta-networking/recipes-support/chrony/=
chrony_4.2.bb | 2 +-</div>
<div class=3D"ContentPasted0">&nbsp;1 file changed, 1 insertion(+), 1 delet=
ion(-)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/meta-networking/recipes-support/=
chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb=
</div>
<div class=3D"ContentPasted0">index 8d12cc75e..b7d21b7e9 100644</div>
<div class=3D"ContentPasted0">--- a/meta-networking/recipes-support/chrony/=
chrony_4.2.bb</div>
<div class=3D"ContentPasted0">+++ b/meta-networking/recipes-support/chrony/=
chrony_4.2.bb</div>
<div class=3D"ContentPasted0">@@ -45,7 +45,7 @@ DEPENDS =3D &quot;pps-tools=
&quot;</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">&nbsp;# Note: Despite being built via './conf=
igure; make; make install',</div>
<div class=3D"ContentPasted0">&nbsp;# &nbsp; &nbsp; &nbsp; chrony does not =
use GNU Autotools.</div>
<div class=3D"ContentPasted0">-inherit update-rc.d systemd</div>
<div class=3D"ContentPasted0">+inherit update-rc.d systemd pkgconfig</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">&nbsp;# Add chronyd user if privdrop packagec=
onfig is selected</div>
<div class=3D"ContentPasted0">&nbsp;inherit ${@bb.utils.contains('PACKAGECO=
NFIG', 'privdrop', 'useradd', '', d)}</div>
<div class=3D"ContentPasted0">-- </div>
2.25.1</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<br>
</div>
<br>
<div style=3D"font-family: Arial; font-size: 12px; font-style: normal; text=
-transform: uppercase;">
<font color=3D"#595458"><b>Gary Huband</b></font></div>
<div style=3D"font-family: Arial; font-size: 11px; font-style: normal;"><fo=
nt color=3D"#595458"><i>Sr. Software and Systems Engineer</i><br>
<br>
Office: 434.284.8071 x720 <br>
Direct: 434.260.4995 <br>
Gary@MissionSecure.com<br>
</font></div>
<br>
<div style=3D"font-family: Arial; font-size: 12px; font-style: normal;"><fo=
nt color=3D"#595458"><b>Follow Us!</b>
<br>
<a href=3D"https://www.linkedin.com/company/mission-secure-inc-">LinkedIn</=
a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=3D"https://www.missionsecure.com/blog?ut=
m_source=3Demail-signature&amp;utm_medium=3Demail&amp;utm_campaign=3Dblog-e=
mail-sig">Blog</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=3D"https://www.missionse=
cure.com/?utm_source=3Demail-signature&amp;utm_medium=3Demail&amp;utm_campa=
ign=3Dweb-email-sig">Website</a>
</font></div>
<br>
<div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant: normal; font-weight: normal; letter-spac=
ing: normal; line-height: normal; orphans: auto; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; widows: auto; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
: : : : : : : : : : : : : : : : : : : : : : : : : : : <br>
</div>
<br>
<div><img height=3D"44" width=3D"115" alt=3D"MSi" src=3D"http://www.mission=
secure.com/images/MSi_Logo_email.png"></div>
<br>
<div style=3D"font-family: Arial; font-size: 11px; font-style: normal;"><fo=
nt color=3D"#595458">This email and any files transmitted with it are confi=
dential and proprietary and intended solely for the use of the individual o=
r entity to whom they are addressed.
 Any dissemination, distribution or copying of this communication is strict=
ly prohibited without our prior permission. If you received this in error, =
please contact the sender and delete the material from any computer.</font>=
</div>
<br>
</body>
</html>

--_000_MN2PR17MB39038E721AF5C601A830D200C3DB9MN2PR17MB3903namp_--

