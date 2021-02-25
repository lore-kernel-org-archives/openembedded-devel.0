Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web12.117.1614288075649251488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=sQ/Jonkr;
 spf=pass (domain: spinetix.com, ip: 40.107.7.58, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9+rfY5voJdEUnn1k3TwY+Ehv+aqfaC5IixMo1y3ydLa10RRWL8KbQGaB/enjZPxI7ZDyqkXRQIJ4IaB0IsPOPFfqk0Y2Olz7zwc/wIwixyLcxXTtcnbcF/iKM3ckmtX2PbjAqXoclnAV81XeDzry9wqcEaxX2Uix/AnVqngHCupijdrp5lGFPParUSSbBOIpzJbrCJWILqrESnBCTmi6gVEgsqEUL5+kE4C1AF7mWJqm452ubIInCnGeDPGvSIg1+p71Xw8HHkIj85D4sVl/43zcrj9k9+xO6zElvj49veeayrdpL/WMIHNtbw9/fAuuJmBCa36zkIqa+UOxVWoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8951fo5yWavKBmPApCvdCbzhTJ5xsGMcv/Dl29hMgZA=;
 b=e9tvmOEN1fc1EH/c8jV3pqXRmDZ1amVA/CDcDADAIzrh4o9Pkm1MXIg/qT24u/cicFdDO5hjBSW3ZyiP6+Qg8hQWsUq+P/BFfHujBVCmRyzOjjoJY71VsmU4Sub/Y+KEV7biK5hsE230vNU1QIMaCkVGpOdJOwBSVoTo5gRg0tUFiTYZlk4Xn8hWKNkDVoH4/nc9tg81/7Y34kUKue16J68EbJ95S4Sh8YspdTQVALilCPUlwZ/5hKTncYzs5VOxjnurfIBIkdWREjWjRpwHm4HR0iirxLpJ6hOycPa4ddi77CGIdUvu1rAnyyk1b4c8ACB5w6PWYKafzPy5Sr7sQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8951fo5yWavKBmPApCvdCbzhTJ5xsGMcv/Dl29hMgZA=;
 b=sQ/Jonkrp3KZL1cOYOBsXtYq17JBDxv0jt3RvUqnQ3ulwDY8P3zphBHLL9BeWRdluHp6NKCYSkVswGOmy+xbyEtt/2MyKG+zEI6D1jZss8y7avHIwy8eGOldymTsODRvDVC1/PRIleSHHAA4cqFVl4rMssdH/fok0KaziHU+qSQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB8PR01MB5676.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:10f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 21:20:51 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 21:20:51 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [meta-oe][PATCH] php: split out phpdbg into a separate package
Date: Thu, 25 Feb 2021 22:20:21 +0100
Message-Id: <20210225212021.15549-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::12) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 21:20:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ea60f61-9e54-41a2-96f2-08d8d9d33a62
X-MS-TrafficTypeDiagnostic: DB8PR01MB5676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR01MB5676CBE574FE5169688CC2BE889E9@DB8PR01MB5676.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OAdRyqL8rjLQc4ZJI6H8zP9ZLRL2bAYLlHJR6BVCzD9fJK9/uDiV2G8Jt4HSEU7Cn18cPuRF3nBkGTf5rbRyUsOZOkRKeMRkz+vOmrBTgT1laWvKh/8lFX/ZKnMwWUa6tyNIy30DgGPGeiNpZPJm0B4p120HXGPsTnrn6mc3cW0tJlb17DjMkLQOoZfvMz+1XF0utbW4WrOrOMqVJpMuNvhq0IUGt/RYuvjOT8191w6m679nuRoMrnFMABI7qCk5EmXjvy6jefMt6HGWqykZy+WGtD5WpY+NzthhOFluO+30MMVtVFeJi0fLRCWEVe0JFi8f2O8b/V6KslmYwWL4JD6YNapxX85O/RbSupVW6ItGxOsemxvqETYc2T6Ep14Yf1WVjz+sWGctxf3i4lXKQFSPkQc6CaMd0ZnYZvSeayzB3wIcMgjTXwM/fq2tUCzwID0SdBgtAMIXZSdcBz3m2bn7FEPi6qJ/voHf3q2/TlODCKRFB1Ull4D3b1uLlObmHjNUeqE0i+TkgJ5d/IyOMp7wLEKgmihQORm3yPqJ5NYwvjfPLMUNFR52EO1MtfWHLJLyS4F5/gKDdriLj1c65q+WAy1upAi6h/yes1uSUWNyS2fD1gvD7fFdWDC/O4gPNNNOrX0QfnSZq7a1bVSKtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39830400003)(396003)(16526019)(6512007)(2616005)(4326008)(956004)(52116002)(6506007)(5660300002)(478600001)(107886003)(6486002)(2906002)(6666004)(186003)(36756003)(66476007)(26005)(316002)(66556008)(1076003)(66946007)(83380400001)(86362001)(8936002)(6916009)(8676002)(40753002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qp1DNxdfliNEvxMgh//yF6g6E+tJ23JZ1BcxhoULVnp7/QMRe9wnjnXiCPsK?=
 =?us-ascii?Q?3/vqkqTqNykxI9nT9bx4kgcS+bciUIfOMSFLcAaHu3MnFWY1dky/dV61xZx9?=
 =?us-ascii?Q?OnI4kC98YHamrtnvvziQQY8t5t0ESVk2Dh+rD1MN6tO0gTZ0rHjclRZDnHsF?=
 =?us-ascii?Q?mILpFJ0yV8pq6fwNVRQ57jEtmULfFW/E4WyiWMcg7XftyJkeRU19VEiGNB55?=
 =?us-ascii?Q?xbPAXU/Sr0HYHxWzdvtOmYfZIvxgPO1jhU6A/Y+QyjcDl9j4fD6wr18ZK1hC?=
 =?us-ascii?Q?rIZfIWliZZBIaESijznS2QceWi7ZDJgU5aaPrzBxQfeBSv3gTVudF2GQhr8m?=
 =?us-ascii?Q?ivARwUZyZlnSD15H0+e/oMiD69YPhCBQj+XIzqY9RcwJpO+caZcxJiZjjnUU?=
 =?us-ascii?Q?/oF9htCqPmbjoSCAqEDuwViDUQis5bHo7+ugmtFEk4MELWKE+1Gt3WjaFGw5?=
 =?us-ascii?Q?XZ67ohQjrh8VNg/uxwYzei3KkGLN5fevZA3fBjv+RyeyqBbhKNIdp5mdSapF?=
 =?us-ascii?Q?F+6+T8zX+e2Hr2jd5fJkSWZLZWJv+Hbz2cFthUHMtRklbKTXWTB5lG+p4qm8?=
 =?us-ascii?Q?6uRi70LJ6tdgUSHS6tLLmnpLRj4kG+slbXphq0fIwNkVl1PDfayKD/irHd9W?=
 =?us-ascii?Q?0LTtG/l1BSdNrOkom5YwViS20k3/aSl2xyj3LwUDXeoNkQEYvn/5/i2UmhC+?=
 =?us-ascii?Q?+naSdfozW9t3a4G8V2nADCB1+jonVcPqp08v0SvgOMz/Gouu+qrs2xnkp7/S?=
 =?us-ascii?Q?Ug/K12pSiPaOqtVLvF2/sGv+Wi0b+Nx+pE9JZajeei4SwmjT43O7ql0CWxFm?=
 =?us-ascii?Q?RXGQRTrxtOYdHy3sghlVFDsBUoSvG7/Zgk4nwdASx7t/TnbpwPd5Uq4H7B0j?=
 =?us-ascii?Q?IxcZ3nT5IgJ9KgKFrWIYb6SM4LN3X6epk35TmH/xwhHH42lZC/P0jgifIY43?=
 =?us-ascii?Q?JG7/Jyze4uAHxjfNBGTpomLBBeQSWYQN4Mw04zohtwhO+lM+aLqmYzH0caX+?=
 =?us-ascii?Q?GueKBWOdXc4aDa55EfF2QbFJyQalPQrPA+A7ng+lVurPRm8H5fzNvt/QcRQ2?=
 =?us-ascii?Q?9JInDGWJlE7M1BVE993HNLbsAOl0yE4JFTWShYgw7zsE8cjKcXr+YR4bVT4X?=
 =?us-ascii?Q?3A4mm3YGr6zlzdECytFOiNTzeIuZzo6Zd2Pef5SHG9L1aldCV5CyXgh0mF5P?=
 =?us-ascii?Q?cdCFRrGuMGieTEzNn8tMhsdrpF1w9cFLROw1A8oTniu861sYq4KuuNXGlFTu?=
 =?us-ascii?Q?yHBf9SrRRBKgcNnqXRKAF9p3cVK33kE+4GtNfKuAA4yD4UC50KAD1XiloDS4?=
 =?us-ascii?Q?KBYLpht+NoaS/09NRa/VliK4?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea60f61-9e54-41a2-96f2-08d8d9d33a62
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 21:20:51.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0NlneL8CeVh5aW8Xa09B2cNMBp6p4scets8tYwFabs7S5qFXDtpxTadt8pFoK1SxE8b8mvA367gMUpPXEVs4SUC/VRtyv5Sgsx81HOdr7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB5676
Content-Type: text/plain

Since PHP 7.0 the phpdbg debugger is built by default and gets shipped
in the main php package, increasing its size by several MB; split it
out into a php-phpdbg package, following Debian naming.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index 25b813792..f8a8755b9 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -205,7 +205,7 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
 
 RDEPENDS_${PN} += "libgcc"
 RDEPENDS_${PN}-pear = "${PN}"
@@ -221,6 +221,7 @@ FILES_${PN}-dbg =+ "${bindir}/.debug \
                     ${libexecdir}/apache2/modules/.debug"
 FILES_${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES_${PN}-cli = "${bindir}/php"
+FILES_${PN}-phpdbg = "${bindir}/phpdbg"
 FILES_${PN}-phar = "${bindir}/phar*"
 FILES_${PN}-cgi = "${bindir}/php-cgi"
 FILES_${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${systemd_unitdir}/system/php-fpm.service ${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.18.4

