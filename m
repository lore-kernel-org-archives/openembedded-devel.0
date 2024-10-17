Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30945D2F7F2
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 06:36:53 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.119])
 by mx.groups.io with SMTP id smtpd.web10.42637.1729147011438029936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 23:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=msaQi4j4;
 spf=pass (domain: os.amperecomputing.com, ip: 40.107.212.119, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/DxW+jMUEYmAvDdJjLFd7PRBESpr84z9jWb4C6nu0FKw5kZmJUUZzsHJNh7ySGYJLYbQs1CNemTXoMuikJQwKNCeOLvzNbznL3z06HNUnI8n8hrjuFqh/PKq+h8XxyC0eQB/Xfq/QASGv8FlasUkvGjHp1iWIJGJPy/HsuXBclL7CHp9JMC+QUWD6Vb9xM4pHBCpLE/Mac2C1351TqKwVDfpIilG3GmJGtzcpDlVyTzHxlLAMGYDno8BGV5kMpu95iZHRiicOSlY4WQFxH81cYO68bJhaCtsl3pLXsCtAX18pwJwhA9N+F/aE3J4RGGxyTqIFmEAnpdgsssG6iLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lhuak8zIiXVrLo9xhbZREzrEAMK+0JBAl8F4VC+XgM=;
 b=nkMtUvxq7sOFgrfcll/99p9p/Lywv1dI+dWRNaix0EY78eg8rlO3HzrQzpdmxE4W/3hpYyNxHldgisdY9edMSDbWD63yBKhmdnsDgRqGmwB4vxvec9M6sb6dbkAe8ejhLVeYOUtdaHm4RF9PMBLSrDOMmHXENyrfRxylXTmESGgTfvxfPxzjWEf2dcx1q3UO7TjplYDjb11GQcgLNqz9IO1GcX/To94HfHjNL3qlTJBdZV8KyVywbcsXnUDWviIOADrSz16iUzyuIFzaY2x1znRZw1+jtU3ch32XSKqd9q76m6fgceBJ+Dd/XumWZobt1dI3CL/kl7klQs1PrK83iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lhuak8zIiXVrLo9xhbZREzrEAMK+0JBAl8F4VC+XgM=;
 b=msaQi4j4dqQxchlk/rAn2CTWMwsn2vrgf1SSF4gQmOtrT9g4ngOAg6iyzW/FJXdnGtu+fZD8Kd25jpu+RZRmR06mstqAuynMu6WpSLbXAttjWo+ieVwh4W17JAcNYJdO6FFuiCYHFqQUvmbWLnqoHRbYj6mFNTwxv+1IljQK1/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL3PR01MB6852.prod.exchangelabs.com (2603:10b6:208:353::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Thu, 17 Oct 2024 06:36:47 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Thu, 17 Oct 2024
 06:36:46 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Khanh Pham <khpham@amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
Date: Thu, 17 Oct 2024 06:36:26 +0000
Message-ID: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL3PR01MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2b39f1-bde4-4d8b-d2a9-08dcee76126d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jgr8G9xPy17o6Qq1qStNZBUncG7uRuhNDtPuDKnrwoPe8qFxZfZI70p9spT0?=
 =?us-ascii?Q?TlEYnr7cKzNd0bfMS5Q/2DNH/5CJ0E1YiFzYDKuIBS+oaxbbPsDOW8QaIqRU?=
 =?us-ascii?Q?SvCH+cJWpS6veWM0Cf895JRkbC3zTPu0s8ZlVAS19BuQW068J82/tq5GOhjL?=
 =?us-ascii?Q?mGdy7e9qN6Y51LQoUG8LxPwZJnBz+CfjmuWKk3Gd/6bKR0mwtdpSC87oYEGt?=
 =?us-ascii?Q?SJ8CujnlTmoIGXQs/fBNhAn+9htwYKEmftjAsSYUYWBfVyIGVtgPje57rtEQ?=
 =?us-ascii?Q?UMoOW3xTmDbzCeAxvEohkQGqQylGe66bFrnTiTsZv/ej05gGOppov2KVwzhE?=
 =?us-ascii?Q?OygOHVsGt/WIAWhey67ZJ91gk9rN32zuR1dJIAd0NFNlkEmAZkAbld1I6fGE?=
 =?us-ascii?Q?euD6Vff2Z49WlF5gK0u5kDG6VOe20POXUIP//+JJHqgj5CllsK6b8f+cvnkt?=
 =?us-ascii?Q?yQXD0+/32895v/NuYDNZ44vTX1QULduqtuQ512r3m/wuAZ08aNSkFHkjbXbA?=
 =?us-ascii?Q?hjLiEs8zdRE1HpYAMCorcLrkKLW8t0LPCbVRZYr6mMONUpk5e1IM8XzPN9pW?=
 =?us-ascii?Q?n2CFQDYQe4pZUJCxeL6Dd12DKk35+vLj4Je5nbgJ0oLOoALd0no0Gm0591Cq?=
 =?us-ascii?Q?Tfghn8+Q31/pt/WpoUPJwN8V7YZDC72CLfqtxnO7D26woWYulQCf3OE2T7aM?=
 =?us-ascii?Q?/pXCJS2pZgRt76nMTNmg9B94pHr84U/MewW9IvBut784DpsFlYBQvnUyjWF+?=
 =?us-ascii?Q?KH+sFSgjxoeF1phLkWlKVP6Kqr/ZIABB9ffPLp4G6PScM1ByViYvgzo8Vi6Z?=
 =?us-ascii?Q?AEYxOFzCq02ZUYA8w930odWAeYQeLqANslkN8OX9tZ3CRZT43gVQuNgvrf6o?=
 =?us-ascii?Q?Oh9rZTect6I89KdHIMoOXpAutzdkv/GZTe+Ylt6aduy0GzFK6TgktziVRlbN?=
 =?us-ascii?Q?QCOz8SYAo7uvx01rJiv3OD7j39VF3vEScFPOwfWc4H77ukpvZ0XH15jpyFso?=
 =?us-ascii?Q?cXRJQVRDTPEn7iIwM7NDakSC9T3lc5G0qDT9mZaEVHkhOiUa/jF6poAOiO1e?=
 =?us-ascii?Q?enCdX/AldoNEpzDjur88O0c7LRN1s8MFoc9v2o/VUpRBeFrhlPG7X1k+R9bv?=
 =?us-ascii?Q?RzE8A5koAgNec4UQpPzKuCR/Z9VBP0RMsktvNYWVq/2jJ1qxxeSpJGHiNTAv?=
 =?us-ascii?Q?XgkkXyrmoGCuIwbn4dFThAbZh7Jnq9kKtJIWTQTXfjBArP0PNBxaU+i0bVZh?=
 =?us-ascii?Q?FwZhRixkLeQL2Gh3/2Otg3mMGOG1ZPdW1dGxxFS9czzd2+wVN9G3euDW0WOS?=
 =?us-ascii?Q?ofDbtSBvSx22rrnsZ4+ZK2c3TfmOIs1/Svqvt9g53nHC7P8/fz/He49isVO7?=
 =?us-ascii?Q?fYhx6I4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QmZRVs+PrmnpRSzqCs4+jlQiyw8BF+MS7oafIn3zht9nlHSR4oeiODsuxd+B?=
 =?us-ascii?Q?0Ajbiqcw/ZfiM/WPM+KcRK0IefuTQcqK0vBdAVjzY/XhogQMnpJ+5SksJ67J?=
 =?us-ascii?Q?75etYdgjZ5z8FTOvBDb7aqYePGn5eCWBLtVVpNp4BfMbyEoZao1VlwBwFKLp?=
 =?us-ascii?Q?98s0b0FjjJO4Dc3iCdWpkelK1PMiyQHJDWO3TXlb/S5FvmtWizn2FKHlAB90?=
 =?us-ascii?Q?Cb/Ks/o/lmNWvU9erCkFc2ihGfgq8qFjOrUxPTBLQDZ7tdYwZhYxxys88MYD?=
 =?us-ascii?Q?qg1zO7hpgBxel9zAB9AvHORA96g2kXu7OlS+PL7ACP89kactIGJhIPwJc5qJ?=
 =?us-ascii?Q?//Q9oBh6+Hxw/N+D8U67SgWGfsYFr7dmZsF46/gnr4SD4y5ON64INh60askn?=
 =?us-ascii?Q?26W/fEGJ4YENmo2MhM5gfjpo1SXJzAfFQPjcVT0++7TiyBpr6AwEcvbEYk+N?=
 =?us-ascii?Q?RyhRhIW8nlv+S5KDlKMhwjbfdfY6v/a8kLsKw/jq6KJQf+P8XaAZn1fXVqf4?=
 =?us-ascii?Q?JYE0xOiVVh7mzSwcu3xtXuQRaYimW6s8B1jRYv0A/JoEOG6oG52mKN7mpGJP?=
 =?us-ascii?Q?1AY42g1s1wXqulqkfubEfjU2yAnhE2a8CmstFabbME762leOqnercTmj66Eg?=
 =?us-ascii?Q?0Z2LKRJWZmgQHEMv7oX0TJRM6iy+IX9K57XNfqJJQeHw4KaC9mSSZ/COrl4l?=
 =?us-ascii?Q?ftdm+zKJTcQ3rU2tksp9Ad8UqNryeMNj/uneTj2nzI+Te5u54KZhAdofzxtz?=
 =?us-ascii?Q?y9RuJ93TCc2W8ALm9U7L4Alad1gO9JyPGwMGUNlbfO3HNazc1obQLZsfOlr5?=
 =?us-ascii?Q?iqyvmT612vD7JuWFbE9PASoh2LH6q9Am7k7CCp35nMrCBX9RTVil0wSLTih3?=
 =?us-ascii?Q?D4u7jJWrPMftPfkoEMnht+i5+QQRdnmVVCKtJnj5C0hVrfxvaNnIgWjCD6M2?=
 =?us-ascii?Q?MjorpNf52XJgNuQ4u/g6CBMorKW2R7vTEChoZihPBkQlLTGUk1U4pfQkk1zN?=
 =?us-ascii?Q?jl80WF8IHTDYgbzN/g99haxO0rKtrD2djE00b42l3EEDxg37cP/r5RIant2z?=
 =?us-ascii?Q?VeGWu8QkHviMu7zCixDUzQRlBzwB8eWYyxTo+IngySwRKaxZk5QmgsV5/BoU?=
 =?us-ascii?Q?o7VM8xG7Xm/LWo3w9GETcjeI91d0nr7CxLmrBcpVzrXIbKtKkHjpx/pyO9CO?=
 =?us-ascii?Q?Gq0Ql7e0nx+EdVuHJsIJlLSqaul7IbycbPRD9PN1D2qOOsdHnCckiCKuNT5i?=
 =?us-ascii?Q?Up2sNdu/Xqw+N69xAQbngxAg1S+SKj+XIj5uNc/RTECx217xCM5+dejG1+7p?=
 =?us-ascii?Q?HJgIOJpJPNZIw3RZxe9yulZtUfZm97canKGMCQQWoDpc0T2YLpX0RD1WUpiX?=
 =?us-ascii?Q?/m2S1hkzrAPfaE8Zl4dPWRmiMB6Syrxl0kG8BpS+WtF2HSkJmLKg2SJTzmED?=
 =?us-ascii?Q?GziK8CIB4NRSRhbOP7GnBvS1z9goYwO0p1lPMjzX8lz8pXgntKdKsOJflv4L?=
 =?us-ascii?Q?VQB2c2adnaxCJd+ljKyACu2wnaH8jaMTJ3Wti6ZlN98bjdfKr3seoiahwHnG?=
 =?us-ascii?Q?0Q5ly0u7ny7Niy98DWiczKOS2yMtDAu/rpZev0ZVuPl7MeZuMc9bivO8j1Z3?=
 =?us-ascii?Q?0VgLYyluWLzbq7g0aCroAQY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b39f1-bde4-4d8b-d2a9-08dcee76126d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 06:36:46.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKTbxR04oBc/TklQ667ypffrANzpFivh/xAw+4mWunbe4Vrl+CV6up8Anj0pbjrD9AHv5uhwKUKWxeJ41sSkGkisABcj+736l17y3o5m3T6TfrB1KQM2lgMqqEHBqm1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6852
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 06:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112959

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Change in v2:
  - Fix CI failed                              [Chanh]
---
 .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}=
 (93%)

diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
similarity index 93%
rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
index bf3961be4..62044e007 100644
--- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
+SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
@@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig systemd
=20
+EXTRA_OEMESON =3D " \
+    -Dtests=3Dfalse \
+"
+
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
--=20
2.43.0


