Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5892AD41C00
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 03:42:46 +0000 (UTC)
Received: from CY4PR05CU001.outbound.protection.outlook.com (CY4PR05CU001.outbound.protection.outlook.com [40.93.198.105])
 by mx.groups.io with SMTP id smtpd.web10.30068.1731555763148967917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 19:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=Y9CTzSw2;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.198.105, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jqj7Rclj0f90shJY2jd4LB5g3pgokiuNF1qWGuCeoNo8iRNOVuTNuKoHac9wOD0VFkfFWQFZOaTzkMl8vcUUFDPgreVJWMIY3DJ9TG/yuVYIdWJD2F1cjR/eUqMckqvGX/dRZiAVYIC8eskQ411aHCwm5HpQxYfdJb7T5yrGXAQytJWriYILRLGHBk8t2q6Cmm0Z39oxiWtyLWHy9Ei8FONlgyxCHM1HG/x+ZDpQl4GQMaynoDNnxR83fhVhly5QLasQ2mtp11/spntVWpBIBm+Hawnr+dSHk4e8tVnc+8LKGe580PTI6FH92StWd/afqEd4stw0ttMYMR6DKLv46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1wAV3DeoDsiauoBWzla7GxSmHSrXT0aIUZVtQeqEMg=;
 b=jb+Jmu3+uKLQki/A+17kv9LLL/XWbG2sSv0CQG8HMSVEBNGVvCuv+a3UPrwl4rjpKnxMgxUaOUVBx11EGsQDa3brGl5gLl64GU1ZsueA1bRrtkBbvRPAoTrXD/nUyA8/j2VGHux3V3zefXLkAOeqjAgs043d6jFljcrbp+IG71+aa6uwc4cq9SOXiAa9XxIC8jrSSMz0ECHs2zakNxaoTrF7IBILPJ5FZAWFICfWv7ShAXsfNEjYrEUIGo/C2oyI1cfU3rJMQg1C75HDcV1wfI0FnAGW4eq5PFsP3u9oj7ZIsk4f/QNXs5HjwKRl46gSTYw2I3uzJcNGFo41WkBjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1wAV3DeoDsiauoBWzla7GxSmHSrXT0aIUZVtQeqEMg=;
 b=Y9CTzSw2psaglqMxzVfuA0Z1BZt5l258VsWHrEyb8sb6S5oW6uEQ7CgSJYnjQ4dWHBwfRGfWhl5KcHfvZq3IVXKTE1Jb4aW40lJdtKvV4nCfzh1UinUFy5fVQgxVhpdibfy3V2nEpTX2n8knkVC67ztKQfoKLIxU5ppFZEv+vTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH5PR01MB9053.prod.exchangelabs.com (2603:10b6:610:20f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Thu, 14 Nov 2024 03:42:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 03:42:39 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Thu Nguyen <tbnguyen@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking][PATCH] mctp: SRCREV bump 089dc53..5c3b15d
Date: Thu, 14 Nov 2024 03:42:06 +0000
Message-ID: <20241114034206.398654-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH5PR01MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bdd923-d02f-4d5e-e819-08dd045e62d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bHOGLqUCSsoZE5BBGn8U5g+aq8DwBySyRIMHn/UjGDNvUHyeZ/8L7+tYA/DV?=
 =?us-ascii?Q?XJooHe6QQCMIBfbCN8w14x4jYNwC2Rc/4VXQktLyubZbKvwNcckAWf0KlgKW?=
 =?us-ascii?Q?d4UM0K9U+AcepDQ84A0IyeHlemOMiQ8Hb306P80eW5xhh/JMB0jU8zdxoYou?=
 =?us-ascii?Q?+xSsix0wx8cpx1rzQTPvlXALTowMihPsf2EFj4/m4d8KevmX6nTOUNNKjX0K?=
 =?us-ascii?Q?6T6IqnhtaqEFnactWEDvhUIas5PnDpP0KbYXDmRVtuTfq49io9OjjshbwyZi?=
 =?us-ascii?Q?UI1jOuzbDJX/hE2zSv/4UYKHPQpI9JPxaVzDLOgnGk1YAOPVHQogwPw4qzBd?=
 =?us-ascii?Q?LZX3Lu+ThvCtpbeYblOqhVoR8JizXXNTrrUrfioYrAW0cGrTmMLoAeTE59zi?=
 =?us-ascii?Q?2v6rBDJiZeD+zV8gXxJ0kN0xssKA9A/16iPg2SVqJeg3VzzNDaTBeIsldwfD?=
 =?us-ascii?Q?GK7eQ4kqnynoqT2bqDwhD8KvWYe8Q0g5OoTgbQNjVQjQpxhdCSn5u5aaJpsB?=
 =?us-ascii?Q?5UdItDfbOYOD4drR6Y1HO2SmTdNqYdAnUpjOyxPQO1UVq/EXLqob74KvEEe8?=
 =?us-ascii?Q?FseXndUFE14ry9yryjvuCr4q7HbwtQPxxk981OXWgB0M69U3Zco0AMdIpEwm?=
 =?us-ascii?Q?ukjoiMrS9E7kghboKQ4w/i/OhDmcSwIocpCKaCDBj2fbpLuonYmwQ331IB38?=
 =?us-ascii?Q?Xn9adx/ZS9wgAp9WnQeEpCKTSYoum9FS8xCS98A4au10/9KZMcV/9BdyQoTn?=
 =?us-ascii?Q?OENGvFgv7xQCG4MPLNtxBQ7UPd9lBABy/ImSFnGWqcemqTdgvkjjbzi0KwA6?=
 =?us-ascii?Q?8OweuWf+FdyPDBmw6PaLT9K+IDAxHHz97E/58FU4g16psSgwfpOIzjq0MGOS?=
 =?us-ascii?Q?Pp+aRLiJ9o7WwcWsrcG3OjD/3DT/m+G8qrcEDTOg/40z7zK3MvjLy9ahLYl+?=
 =?us-ascii?Q?ZhtUjQz3d7My2lvi//W6LQOYosLtWlypl1bHJL65TsGxN/9x68Xs5hB8Oo0w?=
 =?us-ascii?Q?ciWULZcQ6c2WPSnLAtBeqlTUwHiZ9OqQs1ZnuHWvM5oZwMronFbSi/2TqUJh?=
 =?us-ascii?Q?ZB8wodwXfa8ADqVRkowOlcEoUIf23XF9mrD8EY9wCAzonkxdYGu88SZolhkB?=
 =?us-ascii?Q?iiuh+hjPWhlgBWW2eWDFS4/AXrCBCyQVWClJ67r7GTSzNIGI63WI62KnrDZD?=
 =?us-ascii?Q?cynp+gLG0G7qQZW3+WO/CTtYLoN45yOlftp5wsXUXdFxoyk0MWLnBF/BJqcQ?=
 =?us-ascii?Q?SQRfRmU7A64NuYtqVITHDlY4xsibBao0J29WljQ5wFk3ywkaG+iYKdGRXk/L?=
 =?us-ascii?Q?sS8YrhmoI9F8/LI4sX2LhPF0pZM0RGMM3EWR4dLMm8nA1x0+RyvFyQYFw3KU?=
 =?us-ascii?Q?RMV7/1c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lxKhbHFCRKyCnWp1ZruKdi5jFiscdfPFONOAwai+Qe+c88P7XP8vaxdnY724?=
 =?us-ascii?Q?o7UPpk2xFIavKQHsR80gyW+Kfa+4t8VozAPCb356msU5WOUk+Aqm14dEq0vj?=
 =?us-ascii?Q?GtmqbvQyONT0AqQFsLvoTJnjB80+OdtI7e6M7FrpbOjog5iSQvPDOX2zqCaZ?=
 =?us-ascii?Q?ibqMrwRGlZOAyQ7KXFpb3p53xlfjjV4bLlVgh7r5KXmHI6pWt4fUNWEJgHyA?=
 =?us-ascii?Q?eyX1cF0PNIeKl8tvTN7K8ZWi/JsdH1XGddnGbmc2hkYlgSrW6sWlhWI2yoKd?=
 =?us-ascii?Q?RKCtSouuF+E+/HdsPNUAhZc1Q8nk+d+3vn632b4L/Lr+GUhGyJgt713qeEXc?=
 =?us-ascii?Q?bISvH+vzUC0wqH+xWNIfGnGAUedEAKpLbcXCUrwx7HbfVjaS0AH+YXrslr+U?=
 =?us-ascii?Q?64ux8R98Xkj7Xo601PsGzFCd3swE5gVU4Vjn4Qu855AzES9myskaGVF7g0z8?=
 =?us-ascii?Q?lK8ZdpQ+3OawdJy8IZJmL5wO10mU6VU5hmuyDxgc+cKW8Hgw6Qhlw1+BDYJg?=
 =?us-ascii?Q?poln9rCQYyFbGOLzyFeV5QJSe5oAgQDzkhspfGwecOD5XaCYJz7w5DFPJozo?=
 =?us-ascii?Q?cQgffSHPM6Sy3hVCLsr11PbnS9aR1mosFT+e3xPG0OKHQiYtv+/pbI4pRADq?=
 =?us-ascii?Q?CIgcRNnQdyk1gRCiWKs9IubwJYO4BXL0HlbZVlwaXdkvKh10i9A6voMOvn7N?=
 =?us-ascii?Q?fzqCN7t+LgKU+2uvF1YlC5Mwoy5mjamXODjzPx73c/K0GV+EEbb3NtQ3Mso3?=
 =?us-ascii?Q?QDJqYh6ZMZZ8WiIFPkFBIPf4Z6AbSoJQq278eIeBMtlz3V0629dfdXrsoHv2?=
 =?us-ascii?Q?Wks432bAS8zvQoSVHL8jh5DxHaIcjYvWLHjrfdxTQY47hNHvFuNJxb0giIMb?=
 =?us-ascii?Q?JaoTyq2jBA4deWSgKTaGkZdxu+9yheH0Irxb4A43WvyYuruQx0NRd3AvJJC3?=
 =?us-ascii?Q?6BojNPeGG/fiIC49RaWa0Jo2OWcQwnf0j/8Jwg6PNHFvYrYG5+uxKbxB5EV0?=
 =?us-ascii?Q?rXu57dPPlfHdU+WjrCAQuRhD4sTF/F5pj6H5FwL6ai0SDWizJZd9MphHytg9?=
 =?us-ascii?Q?kE0EQsi46gEpMszJWT5E/hc+DmfWi+YZ3RnTv+09CWgOy8X0zn9u3AOVbG+N?=
 =?us-ascii?Q?IPAy79gS0aJDcXP8ZNEJbPM/UiV6qLe7cstFENHcTP5Dpiuj20IlxTB5yNiM?=
 =?us-ascii?Q?GhRjtwScw6Uu9B36/xGoMeAiLdPZy2ZRAm5kIZPulCNYGnXu5yGJt/0aDjLK?=
 =?us-ascii?Q?54CgjFnHZapqtR6ZzQRXetdCHjgUXT68+DJ+2x/g7brwVwUUECyndbntn6rP?=
 =?us-ascii?Q?NQmH9tS0nYcM/q6yVGPpxM0EuRT0oT9zVLxIpfTAsIuwjSl4NLIntF0bShlb?=
 =?us-ascii?Q?e21QTVqMGAG+lOE2Vz2umQonvCq1dNGjGGsobwrnkiSxI/r6KtiGGHa225AP?=
 =?us-ascii?Q?K0U3KvYSym+d76q+jz7k7u+2x8N/XWdxdNEdENXeAt18OnU6/asGV4X5cApE?=
 =?us-ascii?Q?AiMfnv1cUfC0gsMXMO8LbqGLcyEBeiX38WqUY1xRfNrJtWbewxhZaIBAhT2v?=
 =?us-ascii?Q?ckkmg0AsgrX1iNEkL8X/XO+iT13gmFINRED/74L2idR4DAuzVzmMxLRTSPLS?=
 =?us-ascii?Q?Co37avLSgT4bDgMwWN/VGvA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bdd923-d02f-4d5e-e819-08dd045e62d6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 03:42:39.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIN8CaTaghlGINPSVaJo7gdvSr69Nb7aiH5pUO0zgDe8Qo7pY/ucZleGzNAjKOysecOOJCzILF0847gwal1gs/X0n1N79h2o5eqnyM4omyQvoIFnd0zmzFqcrD4z99RI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB9053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 03:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113814

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 meta-networking/recipes-support/mctp/mctp_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
index 24f974774..759f83239 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
+SRCREV =3D "5c3b15de6cf84f02ef2b759c8762969fe21965b6"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
--=20
2.43.0


