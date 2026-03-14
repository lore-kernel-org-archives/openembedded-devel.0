Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05ED105F7B0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:19:23 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6466.1773479954082485059
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=WlCkyHEY;
 spf=pass (domain: navimatix.de, ip: 52.101.84.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCFSbK5pNZXnzyCQIAeQ4J27uaBSsgaA3sMLdB7scKFt9GleWe2KHbDpiH0ju8JNhGXeyAX5sZ02Nh+pUZJCrNGbZuUilWCAolt/fRpJcOAbNB9zODayJWnhxa335ZP+weyx9uyrtWE1jJiUp0EDq3A4qHwsgTRO++V0poYgIO8j5hG3vMupQvYnXpdaeQBLd7JLhLXn9CQSqPVpnsffKPebF5JMPi3dKEgTTVSPNlpSJFCAXhV/HhCQYaW+vKPDFyRybhLQWal0eFmjtW3nnIsErvRbVpj5JBLGBoY9MSNqYdPD+6xD0+JhFDHHBvlo4x5Z+GsSAA/ruJFqixc1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKOm7gLS7N3vlbY1p/xnNtWynEL1u1YJOM3utT+RWro=;
 b=MIRbBg5A3KXsuN4QThqOA3Lpp03GTf0x1OYL7hj2VpFcVZq6YVPhVoPYE+xtKsZbFXszNFQKLd2MxEQXGL3Ek9G7u6ijfN8zZrUR4lkI9vRkPz5rSz5bily1txpj2dz1VDD+p+J9zvlkiFDApgD3t2RXgZjIQ9D5to+xeYS1QK/3QSzEopp3OsFyM5DA2wVnt8BzC+Loi2Y2PUav6gkNMzPuy9ygcd2ZUcrOyX/Pcy9S0O/8zDpjhpr01jsn6HzxW61JOZ9iDK2WxVqTwpXrVdvUVONGsEjXFymXsf0HlnjCw1Lmr8FO+VMsKPlkcOaqXsbwELnsCEt5uf8v5ZavEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKOm7gLS7N3vlbY1p/xnNtWynEL1u1YJOM3utT+RWro=;
 b=WlCkyHEY1eCbJmQrMJjMAR+Lh5dCQi3VsyWHonJkjNk2R9Nc35qogbSZt7dW1zkxD8R5dOkkY1QT98j9whLJhSnFWZyM/fw2w8ruyvqMQWhqhL5PmRPbbU7jwyZ4TUwBETcYY9Xdnq5QaKN+CSHUxQz4u5MgRM4PkiOce9EoJv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB9101.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:36a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 09:19:09 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sat, 14 Mar 2026 09:19:06 +0000
Date: Sat, 14 Mar 2026 10:19:08 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] multimedia/spandsp: Update HOMEPAGE + remove obsolete comment
Message-ID: <e0fcba3a41a3be0286bcd4b5ec8016dc15ea2cb4.1773479946.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: 141dd44c-25f0-4a9e-00ad-08de81aabd97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Ndy0y3Nculur+Zphd6Ap5u1SXobjXKdXe8sSrkNPmpjsBi4Jwx7XLEdELvficfY5Hoy37vuymmx3sqaqwpJdUSQ1lpyVKmIe+y4O3W05XDtiV8MLD/z/2NBOnSJir3kMogW4US4QEd9dxy51tOcrY5n9HDmSAFqXR7sM3znAMsutZ9ZrPAxy1Vv2s0BoB/DdJGAhH8QWlBTbFh4E9cAupABdxx/InQc5PWjDXBpJvjkN7LN8i0SgKGCbJPOZXxOH2K4Tt2mK7nObExWHm6GqCYApRCeC8cBDyEM+Tx7ZNl8+zY/JwfvbjjTdK70eVDEbPzhASlBze8sGZhn0LUddmftCc/RMj5P11wIUizP+3XGQTYkZXpwVxvHWJG81nrwfDc+AornJwE5dfPPDidVXja9x9IG4smmXjxpgRqXldlk8Hd26GL2AB6+5aDT+vXeAOOTevKOqY5HG1pADUdVdEIg1Y7+bZXQAhF/UrPYOVquyLpI7zOkhfjNiYi3tcjaHlGmJ/vw1ILu8BveoI9BvKvCwkErySw2ayaz6zerxRUHvnis+G7MF8LFQujhIGOirQvuLbg+TyTrQR2KIg9Dy2V2HIBaIsY+yHwWHlwl14RUBTIdob3pQ1sV/VlsmvAzNbFwHLuoUW/bhZNsDSw19imTrfQ8nGTgJsh4NLLSkfeOoK3zIUX73sVgD1KvFmxzN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DoqWJDZSNDjkdoogGURYoYnr6xuUVI0aTzqXUKQpy1qq1Tz0DaWzNO1NWWGZ?=
 =?us-ascii?Q?XhTf4fH94AikHqvb2K2h/31UR8zBGKAy+jhcLznNcxt5IeFq0piQspJgCZgV?=
 =?us-ascii?Q?MkSi8l8IKY7CUL0FDqXTpI7Xm8L9Mio06LJHZs+gDe46ICoA+zmC/2fBjRO1?=
 =?us-ascii?Q?5t21yymcYu7rIWe4uiuxLhXL0wWFVX8PpRka14ExdYVAZumGnhL4x+soOTI3?=
 =?us-ascii?Q?04WYOUOW/Pmgb1emyL7mIlsOtgu/LPBEavwENpIpRouJE94SqqvCv2g+7SAu?=
 =?us-ascii?Q?HOWieaHnHPiWpSv0lW3QMlP/Oxd+chCz+kS29DFF8XWNiVDiMmVFEZP76V+o?=
 =?us-ascii?Q?PMswz0SOBCT0xONM3bDDh7OkRv+OrZug7NkG/St4aDlM19GQnps5Kf8kb0fk?=
 =?us-ascii?Q?xpFdnwjpJaVXlOomwloINrZ0OuaGlbBkWNakyCtlkgKShJhKJN1yUYX7qeM6?=
 =?us-ascii?Q?s1i4cDXIejYP/9pt8XSeOOIFggrbtDPS8SLfi0hZ0I3RYysG1dJgxKQbybBF?=
 =?us-ascii?Q?i96MTWnp5QkNYiQAX/7B+0VvCrU7AbaHUrkfUsXLv6yk1mba8LDuxNEqfKLn?=
 =?us-ascii?Q?ecjk4UxpITGPW7ces6MvhQCxLLv3pbUOw6vYz0q7qRh5wmfqi7qzteLxplQv?=
 =?us-ascii?Q?Bw4Dn5IovdXgdUwmqxyZgXBhMj160XPJBXeIOxyY219JDLWo+Q/BcIAo0kfq?=
 =?us-ascii?Q?IzXErpZ8XOA8YqKdmjkXwMrVPTEI4SPZ44/LecbERHGNW+Vu8uw+NIEMikg5?=
 =?us-ascii?Q?yY6HgL3P1kljEI/3qVyOs1AGsskUxt+r/GtzhXEteolwucPMqAmQ/hr2sT/+?=
 =?us-ascii?Q?8Q5OfE7gvmsKTbuAQvQwHZqXZpt3n//QscoqjqsRmIdqR8COf9f3wvfX0T3C?=
 =?us-ascii?Q?hTYM/uABM3hG7yZhBNFr0TOuoK3/kF5kEb7AtZrKQqCRegG55hSpmes+Sj+2?=
 =?us-ascii?Q?nsX4LDWr3wsjGVhN3P9dsVDM4Ez339/jqLwxM2K6IZRYzQdKXBaetwV1PST6?=
 =?us-ascii?Q?8qOo8m4MA+qES8S8S/jAR5Bapz1LfKW0fzw0v1VyVfk/DYeWllnA2Pnw/xJX?=
 =?us-ascii?Q?GxTxEGdr+cRkSiWw8VCzOCz9j+jFoV8yHmbr1PpXfGO21ZlyQkpL9a5z23xw?=
 =?us-ascii?Q?KlOXDbL/48ZusfglSh1hLS/9Mq7n8v3Hj6aBhysAE0QX6ylI8fD14qDcs/tR?=
 =?us-ascii?Q?+5qG57qBQ6YNzdrS2Go0asgip+w1ixx7z8/aNtzPSK4oUmBLJwzf8AJsWlsI?=
 =?us-ascii?Q?KDhtQetnKjdzgmyBE81VniG12T6wlIi1nIf6BUKEXSwfKLmFjjOOd9A5IxIe?=
 =?us-ascii?Q?YSddu4fMtxN+fhd2Aea9Jl6EXQfA6LGx0ewS2jjq8yeoTmSc5KIlJjsmCKzc?=
 =?us-ascii?Q?ztDfKewV9GhUl9xkrovtC6wBC8DBzdeG4JW27NSsSHc8Hyzp73y1d2+qjx6X?=
 =?us-ascii?Q?TlwTwd79yNblT8IFGOaaJeo9ZnPGOppnbfZthtaSau1tG/rzegiimQ5AXEoU?=
 =?us-ascii?Q?x3rmBfnejRDsKGCiT9iCQ1BYYOrtjaFYrIjgQgGsDdbHLvfBuFEV05ldmNmE?=
 =?us-ascii?Q?KVp8By4ItmdC4j3ybiKf8r5LnaU2rE3WK9PjJft83r+kRIZ0SDgq24SYdeGh?=
 =?us-ascii?Q?1WFZOdcru/h95ybNSE6N9oyyA2SxCFKfXpwaFMiyI3kDjKl+Tyh1jOvBZAA1?=
 =?us-ascii?Q?+5jbmLs5njRyswrr41GAE0THmtmNhBWCj0lCYbe5oGKs3IxpbPmPmngXGd8O?=
 =?us-ascii?Q?BgVjfwDWqKvNS066RhnHkuHH1PGt4qc=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 141dd44c-25f0-4a9e-00ad-08de81aabd97
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 09:19:06.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLdfPkr9arX9asSiZZMDBn78ItU/p2Q+hM35hDGkEJ/s5LWSQXF9G/s941r6VsXP3iSKgqIo1qS/WUqtRX50JujULJXOFhXrwcy1UpT8LiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 09:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125200

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The domain soft-switch.org is no longer registered. So, switch to the GitHu=
b
page.

It seams Clang had implemented the compile time functions, because the buil=
d
of the newer commit with Clang works. So, drop the comment.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/me=
ta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
index a176874bba..f90b252d40 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "\
     demodulates signals commonly used in telephony, such as the \"noise\" =
\
     generated by a fax modem or DTMF touchpad. \
 "
-HOMEPAGE =3D "https://www.soft-switch.org/"
+HOMEPAGE =3D "https://github.com/freeswitch/spandsp"
 BUGTRACKER =3D "https://github.com/freeswitch/spandsp/issues"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-only"
@@ -23,9 +23,6 @@ SRC_URI =3D "\
     file://0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch=
 \
     file://0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch=
 \
 "
-# Fails to build with Clang since 5394b2cae6c482ccb835335b769469977e6802ae
-# https://github.com/freeswitch/spandsp/issues/67
-# https://lists.openembedded.org/g/openembedded-devel/message/109325
 SRCREV =3D "797760168945c96e91af55bde9d4edaea2e654f9"
=20
 inherit autotools
--=20
2.53.0


