Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE57F3ED66
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 20:35:35 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.103])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.210157.1775939734799860068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 13:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=nWbXCqTp;
 spf=pass (domain: navimatix.de, ip: 52.101.65.103, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCAUUFRIJicvv2Y/kSWPJAViJ/iikljawy9T5UXnhMzThZTIBGkx8FqZUYbElWDUKt3VpHUmnPlUEKvlBXi53Lcw1+mWgRvPT9YGv53mjqWwSJEoYpSuzpj6YIJ85gWFN+CdBpwZAiQQ5MV4R0X80jY0IJvdTf688isdipPkO/c3qotbo1ltqKCa/WPxb+c6rFUxnZzklZHE3SornmNQTSah2X6ffFsYIB87+vP03910ecfJ9HcorAg6Eeg2bW+Bt0Arg5b3wryRZpyMJdBgaAfehF476SDOvqMTVMYxJBCxJSBh694r+AF5qqWn3OnOx3W5SArCtKhdRCIu0Og6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15HKHhcjHwk8qqBjudWRjSJExi/ePrVheHvDjmAQZmI=;
 b=ux+HdypDVWVhIWAH+hlncywA0CbmHEbtVWFJWsOQVGM+zhHhPP630Z5s/e5dln8Eh9PDZ6LAWZzdZWe62r9gBacBOeBXXMHPh6+wvEN5nMx7nUe2DEnfnVCvZgU1l+rjroW9aPG1dJx9LWIFjRsnsoMaajntV2WKwj4Sjs5v/7p0lA2MsK6dqxDyhGFme3u1uLYwQ3g555Q2bq/qEuMzkaileKTjYN5LggbqhsXyT0ENxymvWYXgHsV/RS2BbPWMdfTLQ9DXffKWJxDUfWACU2roJPeleMj9ClcIzfRn82qI+LxLk2i+LEpfTVNBGfdiH61k0mbHzZa1gvd/2Jdtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15HKHhcjHwk8qqBjudWRjSJExi/ePrVheHvDjmAQZmI=;
 b=nWbXCqTpQFNQ6waEJaE5yNxxpSRAtLXWmSMHBgzNqNJl1iSOv0eopSgCtfoGZyr+yHi+GKmPGcDcOrAlbe12CDJYGC0vpfRQKrk5G6IAZK2D390TU8QmR8bdyNbKgxX9vSYg7KYHFkNd+VioOeb8i+n02godAF/TfMrQFf1aqcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DBAPR01MB7159.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:199::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 20:35:31 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.046; Sat, 11 Apr 2026 20:35:31 +0000
Date: Sat, 11 Apr 2026 22:35:30 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, rs@ti.com, 
	joerg.sommer@navimatix.de
CC: rs@ti.com, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] atop: Fix binmerge
Message-ID: <0cfa4d49021a742fdf06215e9f1734908e3f6375.1775939729.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <20260410182747.1646597-2-rs@ti.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260410182747.1646597-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DBAPR01MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d401247-fc8d-444d-de8e-08de9809e020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oyZdP3V4IHF644jKXs/wHPkkghkVK1KDuuOvFDBJ5DRogg8902AYAT4OU0UF5D3khEXwFgBAsJi6oMtSLHWb37jSr6iaLY3rc9H4hWujrke3DeO7chptSjXnn2Vngos7l3+ibbMF3QVVdinf/RoFoM7qJAFOptGgfN/qoiHaHVw1DhMOBGc5vWmvES4jWjIItzZj89gYYFsSRGF1L8dsqrag8uDbdIgdMZY1ZPjhgauVvBh7qhMZuQRJ/cSHjhp3DS/uoq3vsMZ9R0BypDdb9KBmJ+TgSfEqLUM20Z+oISFn7czBDFOyhM5OrVzbtN0PaKpkCAAqaYmI39w0V+6BAhPvIiokrWgGa5XqxyxR9XURRKuRo3s6hOhNC/ZuzStAMEzc+8Wr0RHt6mEgFKE44X4Bs2KXQB6xZiD9uo2GQtjvnTBEp2lBhKOR+u5EMP6JtbC/fekH2fhov5/Rcl7pNZUKuW08zT0UYHrw4AcGTS2y1etv0BQ6UlaRedxK2d4DwJ8cdxn4V7g/wn0l+lr1HGJMGaInQ5OWaFDUNcN1qHWA3hUL26baTrQse4XLt4J10Q1Fc73epyL3vc/jV7cV5nhxpAoX2zrUoNqgMwoMCUCPgF1KkjzAFnxHj3f+y0phhjmQjGeGg8Nb11oM4POSGuztPDVydLuZ877s0zqxIn3b21IIkjFgZttpNx8mb66vZCByQ0q2SpOpjZt0mANsysstaG0MCK4zoZe/8u1Ne1g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m+ZH3jxlvomcJuPr0kd5NhCUmsd64xKtNalmE1zrIJK1hL9ORVYzIM3ZUMcZ?=
 =?us-ascii?Q?9fBBiVKXo23NF7abMlF2kn5Ni9cbMRB52u3JxOc5KZ92KdsREouPWLtc2P1r?=
 =?us-ascii?Q?yo2+5IFaLcXQcTqQiviJCW3iG1TB2XURWIsAMem0ahjTEon0azcdIQ5/3HY/?=
 =?us-ascii?Q?zR5oUC1FCQxDViQqFODY+0ZQZw/WcJNevHJNKHGQRWDfaFFP0hNR7QAWcI+T?=
 =?us-ascii?Q?VIyCE2x1P1I0t1QmyDtdYNiz3HWiGSoPl3J0oXqJiYcf2Ki+D7anNGlP4nUj?=
 =?us-ascii?Q?JUkn32MiD9bGaAG6D2bYuI9WJ5n8G9MdPr017KQTP+Cgqedl4hTpjW6asgDh?=
 =?us-ascii?Q?ZgOUP/4yLARISkL2wiU9vQuqUW7dr362STzcTIh8qt49OS4IDHvDe0JUQiZl?=
 =?us-ascii?Q?8HoAnkVAyAESo0A/eK3yAkz18jG5mtaHyyavxOlMsAPsAJWxt7U9d9GrdIsS?=
 =?us-ascii?Q?36ko31IL2rHJ6SrroB5LBr7JLhnlqtuyqagMd61zU6DLDeTWYZucwDoK/Kzh?=
 =?us-ascii?Q?Owckqmg3FwDkAEapJrUj83uMi8Yi1ru9vQxyzqOOTHIDeSO1VCnFFD9MXA5B?=
 =?us-ascii?Q?jl29ftKRNmK5EfKacm/yGe58uxzVfiKTebGTbC7IHXkbqs5z1P3YD/8mF1LT?=
 =?us-ascii?Q?lCRe47xpShRhTQDmhWmBoMYi5G7LwX7a0qtkq2fv0Vg4rphYR+smonbwJ9Aj?=
 =?us-ascii?Q?cceY7ensaicG2PgDfUvQyRWW/+H7SuNlQQeObVCtQEE1Q78mm2G/nh572BEV?=
 =?us-ascii?Q?29x3812qqtjICuWbKQQx0z9xwNBa8k8iJiqdqIvpu93mcNQ0Of93IyxNbL87?=
 =?us-ascii?Q?uzYqOVGpJ4tPf3Ou7uW244iRK3+SqN3ClGZUCI4lohX6KLoxs+ZhXuYl6lk1?=
 =?us-ascii?Q?44rCrXtLv38AZNn4YZAUMcl2Sa5g6rku/7cN0OaJJako14pgRI3kFOVsnU8P?=
 =?us-ascii?Q?z9clvZuSJ635h7UQZZcMNg2edwRFIEPutYEBH4FyWaJlyO6cYgO7cU7zpAnX?=
 =?us-ascii?Q?gsVmJlMBUnzB5EOJro6JmtArPCr4eV2R6ck3ZghHmzVFy2rlfZTFY4Pmvf+p?=
 =?us-ascii?Q?xlyN1stJkkjtDASrHQpf3lwuoa52Vb4iB4nC1F4Y//YFyKrqAIyskP/tI4TB?=
 =?us-ascii?Q?e0xjA/tZoQbpTTrWK235K1S/4N0eGs82qcheJKo4pOh2clDwxgKc5vrM43+u?=
 =?us-ascii?Q?//FiltI2mpT8z2dU+OMtjTXKcDhgufVljVN6JBgO5RxFQZCf4H7mcGUPSRq4?=
 =?us-ascii?Q?HDDdsL3n2gAQWlfbnN02AqUm0VMiwm4LCpIQEouwf7fQn3W0532b+/+VJw5R?=
 =?us-ascii?Q?QQQPd00ZCYRlqab/tFkb+KoSC+MWUaMALqb/nfuLiib/3GGXbTS5olmomi3L?=
 =?us-ascii?Q?xVvnGwRMLWhmo4MoWeChOr2ne+lArdrfuKi8SLTo1GMtDl9+v1sDZlulDCRu?=
 =?us-ascii?Q?z/XOeujvqhslWmL2ezi3sF7U2C6KlCDm6CJqLoWJQ4vQ723hYMHLMAPCGmfH?=
 =?us-ascii?Q?MBYZclpyMuinpW9ziTnqJBLzGlkCqo/qQYmZxH9rIrULWUkTlFXQrno86Ckv?=
 =?us-ascii?Q?Xo7QeM3pI7cGg+9wpCOtsa+YtDhE097Uld+c9hdNT5GsUXin5/5sWVmbZ/uY?=
 =?us-ascii?Q?VdQuuidMeAVNTff7pmaKsOeWtz6BAAkqOan1XJlH5RaPto3h6xJekrwG+mkH?=
 =?us-ascii?Q?Vd2oPjLaYxTEXVSovhO4Zyw+kjgpvjscZB+slNcX/XPkfgRPjYhNTUEsA6f6?=
 =?us-ascii?Q?mBTP/R3vGIHb4eokEiKPKnDr4drlbYU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d401247-fc8d-444d-de8e-08de9809e020
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 20:35:31.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxrg2XXZBP7AD9Q+qmVrCmfg9iT63fPv1uyx7bTxovMj0rkEo0DJseHv41LPUsAr1/D4oWyA8r3xtabgv0f4b0j5xybb0CaT1dozayueRX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB7159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 20:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126259

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

In case $sbindir =3D $bindir we have to pass this setting to make install a=
nd
later on explicitly cleanup the unwanted daemons.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/atop/atop_2.12.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/atop/atop_2.12.1.bb b/meta-oe/recipes-=
support/atop/atop_2.12.1.bb
index 4ca74edbaf..6b462a4d8f 100644
--- a/meta-oe/recipes-support/atop/atop_2.12.1.bb
+++ b/meta-oe/recipes-support/atop/atop_2.12.1.bb
@@ -37,7 +37,7 @@ do_compile() {
 do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
         make DESTDIR=3D${D} VERS=3D${PV} SYSDPATH=3D${systemd_system_unitd=
ir} \
-            PMPATHD=3D${systemd_unitdir}/system-sleep install
+            PMPATHD=3D${systemd_unitdir}/system-sleep SBINPATH=3D${sbindir=
} install
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m 644 ${UNPACKDIR}/volatiles.atop.conf ${D}${sysconfdir}/=
tmpfiles.d/atop.conf
         rm -f ${D}${systemd_system_unitdir}/atopacct.service
@@ -53,7 +53,8 @@ do_install() {
     rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
=20
     # remove atopacct related files
-    rm -rf ${D}${sbindir} ${D}${mandir}/man8
+    rm -rf ${D}${sbindir}/atopacctd ${D}${mandir}/man8/atopacctd.8 \
+        ${D}${sbindir}/atopgpud ${D}${mandir}/man8/atopgpud.8
 }
=20
 inherit systemd
--=20
2.53.0


