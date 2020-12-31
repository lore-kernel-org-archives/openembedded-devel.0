Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.83])
 by mx.groups.io with SMTP id smtpd.web10.19312.1609412672437825264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Dec 2020 03:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SeEBdk/s;
 spf=pass (domain: windriver.com, ip: 40.107.244.83, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzzJJ1f1rGPLp0Yqohv8P5ibxTBUV60y+Y6dTVVsaLmfbSqbPM5+EulbyseXqIC9P71+LSIdKLTWdPqKmxAm6S5sbf8S2xXiFpQ5KjIXcZGikYcvYtBFobiUNYsaQvkZmPUJJhVnKWmdx6jrj2ySDP0DBvFTcWdvoiwyiuqNYEQ85YlYjI4P1WLQ+5D+5ZzVKADlF/H8pgv+j7qthd7Du6s3UTKNH4x2u0wFrg9k2+dPZzZJ1NMXX1kAk/q/hxUJNxsiAJsuoxLLy2VveXVSKRafmLJTcsKYn8JCPUegBOq/RRtI/I5xKNZG/Ch0ud3k2F+IgCF4rxF52RfsyfddLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap5VZKvB3LnDqYerDYIUnnwlmBNTs9rigZgt7SoVBeo=;
 b=WSDkvxqTpYCYaJETfcitcQ0j0UWAu4xDpDHjW8pQwWd3WzL+mAFFqVyaETYMXMu5uk+zAFyT8vZEobL4Wji7mTEmnCKrSalXdkV2eSnuPfZ3WTfd70e4hCxjq0YEmaveQaBaqJfj6xd7NgYbSNwTopQJgt3LjEInuAi5lQn2am/2IVT+TbMAIt6wY9/RnvYJUFQK/00K1yGVaDEDttxB8BmyxBmOuJHzeO3m3E2qNmBFOI3kPFIPX8aJL07ttaS9K4MT7+TxBeSMa+fSvGrmrVEQcpTea7sXOmrnTdYsHgxmpg/0TPHr3s0oBHI/f2J3ueh6OaG+QGrpxCcDq+Ebqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap5VZKvB3LnDqYerDYIUnnwlmBNTs9rigZgt7SoVBeo=;
 b=SeEBdk/sBgze3SChwW83LB2k2kOUwBPI4qFoNqdJVGnpO0C/D+955oin/Btzu6TFTgVwnalquR8yTDYJqmKoATKvYWWeMHMhq6Bg6vm8vwt7acqHbSlVxuy25dinPQEUUddMfr5OB44GpRPGrArf+txFJVhu8ra/7wttP0vcSMA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB3037.namprd11.prod.outlook.com (2603:10b6:805:d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 31 Dec
 2020 11:04:30 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c%7]) with mapi id 15.20.3721.021; Thu, 31 Dec 2020
 11:04:30 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: He Zhe <zhe.he@windriver.com>
Subject: [PATCH] ebtables: Add symbol link /sbin/ebtables
Date: Thu, 31 Dec 2020 19:03:57 +0800
Message-Id: <20201231110357.23437-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0062.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::26) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR01CA0062.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Thu, 31 Dec 2020 11:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c561ef5c-02fa-4dba-6b59-08d8ad7bd8bf
X-MS-TrafficTypeDiagnostic: SN6PR11MB3037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30373FB31D96AF73080F19CE8FD60@SN6PR11MB3037.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lJhHTScwxDC5Tu3y9m5KhCgSw+0rnaPYVfti4hzgIYbDZ7eRsPg73P0AtlNEXbduCQHEr2vraL+oG6k2tWcgbSiF56sgQVoCHFc0E+XJWIjXKYzt+57otulKGUGn37oAJ0Hm/RrgOzW3eBzPt9o11Z/phAxzw81K0g8x0/xDMaNLSjXG7EGU2/s8h0FE6yZxzwLBOS7JUA5/AN1bMmP5iP5utAxetaavWR8DSCiDHm/ITc8KI2WUWQMQRA2Xvzb8LZk7Fhtvlxxzmnm5at4eCpWNkQkV2KFOCqfg+sfOsHYS7DJWNOAT7RqQnn70v5DqhaYRa8AoBEZQmiVsVSPdeQR1y8ZbIVBJu848Mieu/M5jUj4/uICo5dl8T9KylLpX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(136003)(396003)(346002)(316002)(956004)(8936002)(6486002)(83380400001)(2906002)(5660300002)(478600001)(86362001)(26005)(2616005)(36756003)(6916009)(1076003)(107886003)(16526019)(66946007)(52116002)(8676002)(66476007)(66556008)(6666004)(4326008)(6506007)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?quRgXz5fOBOtnt3hELPJGMXnfekH5TB9IxOSOtSQ0U0ZRTosQqZG9iOPxje1?=
 =?us-ascii?Q?DEqAE/DosS7v13/aGJKMMEUZAYf0x+jP3p9dwMjLWP2Q2Z3tN6dxpgJruC27?=
 =?us-ascii?Q?OcV6VZdMtpoPGscIjssBrK7C2v+iV0ypIamqWE3+uxNc7nHhyjpviA1k8LbI?=
 =?us-ascii?Q?3KP0Rkg7NCXLvU/v6RDD+4PV6uReqVJfIyIZ6r06jspnF7HbWYJPEi+pPga1?=
 =?us-ascii?Q?1MSFceNgzf9ajSkcs5vCWf9fwFrKEPyUuUvYOCHxwDnLK38AlEiyhvWT0F1m?=
 =?us-ascii?Q?TxUZSPHrBflonWArPwc6U4ce19Jse92tRGPblMTG4qvs3A3NcuIlGQpj0p4J?=
 =?us-ascii?Q?b9V037hpHwYecfWOzq2APS/fxAt08sbheyqgbV1MTzCPnJqTxQloItkM48Eq?=
 =?us-ascii?Q?g40VmiFKFX0VaTSqEUiF1TZR3stnKl5FQxkPTc+ze1kpfqalchq6D1K2FRg5?=
 =?us-ascii?Q?3GdhVO6Uf5U8liXpzX4H2PquW/F8MNxKCefSOx1ukDxMfal6jF3C4+TCntbQ?=
 =?us-ascii?Q?OAJ+Yd299ZOZTRz+axq8ermlOGbeAGEZk3j8B/5iHgw+aomslQ/gBpooiFvK?=
 =?us-ascii?Q?za+24N3aZlXLBl7QSe+xpNp8tVYfIjEoOi696Gf4DZWJf63VYZE5fY6ZKgy5?=
 =?us-ascii?Q?LzRNDVGSUV4F6TO4u1sdSPy2vrvhH4Xb21AU0GEEOH23jzLRYSY8M1FPozNT?=
 =?us-ascii?Q?qzS6xzemnUmQ0Pzy9SxY7T4B5kIGzhhmkz+PhYnfI9LgULmhq/4Jk94wFQIE?=
 =?us-ascii?Q?vhBtVbdYSkSEIQ8yZ1HHcT2tDGAM+7w9CviAR+xhQe5tL89L55BZyT7G5ZAG?=
 =?us-ascii?Q?rMbbDH5PVpZ0SDCNXoKl5wOejCJsSPT88ELf6U6YOzQNN6ukMCcLAX3XYUkW?=
 =?us-ascii?Q?QZ6IYvPe8y0pp7zzZPHWanlnjvr+Sa2aP9SEdsc+ES+6keZmIaFmrVBypeGr?=
 =?us-ascii?Q?hO7PjMbQMOBLahcJe+22Sz8SY28rGxpX2Ic61HvTz1U7rzAAhjONLYAl2Wqi?=
 =?us-ascii?Q?R73I?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 11:04:30.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c561ef5c-02fa-4dba-6b59-08d8ad7bd8bf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzFACaTtQrK+1cL4W3D0XTRZxz8FpPp9eCgNxKZtb1R91D/oMCZKLtGaQ4TC9031rPsZuVt0X/WGoXbSkLiwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3037
Content-Type: text/plain

The original /sbin/ebtables has been moved to /usr/sbin/ebtables-legacy.
But the old path is still used by some other software libvirt.

libvirtd[809]: direct firewall backend requested,
but /sbin/ebtables is not available: No such file or directory

As stated in the related change in ebtable git repo:
The new -legacy binary has no problem if called via a symlink with the
'ebtables' name, so users can still name this binary with whatever name.

So we add a symbol link from /usr/sbin/ebtables-legacy to /sbin/ebtables.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 08d4d661d..e13479a5f 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -40,6 +40,8 @@ do_install_append () {
 		sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
 		install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
 	fi
+
+	ln -sf ${sbindir}/ebtables-legacy ${D}${base_sbindir}/ebtables
 }
 
 do_configure_prepend () {
-- 
2.17.1

