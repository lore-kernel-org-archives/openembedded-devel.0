Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web12.8384.1623128361231752689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=EotVk23A;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/3+AdjwsOFAcFYsjbG8IVWV3+0mpi3l5ACHMCNktaJczfuyTyVTqzlXuVivc/sofgOjXYIky2K4gWBmUNjYwMT54gZwjqpR/1wbnbfakhGcOPR6mQw8+SenWUHu8JfPxGLEtZ8R0LaQyXblpLAfKNT7cRO14qDnJVk/Cz48/mm7oQHP9AuLsmowYTB3ttNVvMZWw63XV4Pzr/zvnP9PXspOwBsb19l3TFNceJCwYLIpj4ZtCgzFnvtAEUipI2gzenHuOsKx+2awxOK6xGEWDqoQFnlyfEiXcwT7m32h0AXySi6KiWaiNG561M99dDdmBaEuwNj13YiqWMw79tt7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjNWxz1GiqUq3DfM5PFWiIlEEM1ZxR38lxZMM5KD2/4=;
 b=Oc92YSsKiDQtuoOt9PvG0bi+ObuCNED+nwPfYGi/VkZp48trbrggHEPjGFLWX8k3syAmtiXNIZHJGCSg2yJsZLGwXDcqqtE3YGFfen/1hsXdvhttTtwYPLYEOLY20S6PNznp43URzigrXhppMaCJhQZMQH4VndUM3q0lVsOeHKKXhw0bj+EBqCPVRy+8nVtCH+Am9vPAQWQvswvB+XKb+a7OOfyssXjOWuBdtCVbDafjigmx065k/0w4H2X/W+T3gDimGceRuzFQTjxn16Dmy6CJYfxLi93197IBAAkqEDrXHn5vDEN4v82vIMNcUyLsO5PSauQXW8qzYVCKF14u1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjNWxz1GiqUq3DfM5PFWiIlEEM1ZxR38lxZMM5KD2/4=;
 b=EotVk23AcIflpPYafpnJ9XP7/A+Xh/xqdAkLEWXgtFe84sYNuiEGfl1eAuaMa4YXAz/+BPrswUEA1zMitXVKAIjOpwE14NnaLODLJcbVfsPzcK8jP8xGk0pDXUMb0yX+VbL4Qj16PYmZLF4c9qRTXl/YVRP0exH4SBfeErz6MlI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 04:59:09 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:59:09 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-gnome][dunfell][PATCH] sysprof: depend on polkit only if DISTRO_FEATURES has it
Date: Tue,  8 Jun 2021 10:28:56 +0530
Message-Id: <1623128336-11544-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BM1PR01CA0108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::24)
 To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BM1PR01CA0108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 04:59:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbff15e3-bcec-4dfe-4094-08d92a3a2693
X-MS-TrafficTypeDiagnostic: PNZPR01MB4158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4158691AFAC1E052B981D3D18E379@PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qhuTvNmZpJ+OEgO+NRLX8h6euiAmCwmBhR9IyjAgx4rx7++7ELpBmc5C8MSuIKBbSOmM4oVufDwNfLVIF+tutkY2tXwvw59x5XXAVva+8H8vXTCvp8yCZNPhDYS4SoEF6tb3j0uI6BpXY6TjfVd5moDHTN21EQQyzaF2Enq1ekSRQ3lmSwcwYpPawhIGpSIi7PUvjDHKOyF21j/USkGm0DCqjpdCC1ERaAd5NZR4qEdjm7jgsN0H7Vh4qCVjkudC7Btzz0Q735B0alN4otAWVe/loGoyJ1hhCkZl4Y9n+XFQy7WIR7oM5nzt50WFFG41M56aNbHdVAIOqnFfOLlpyhihoW4YU/KGVsVHO2ZeS2cGkqVJb579VhvceiB4J+1KBu4U2oD6WPNzjQHPfWR1tUwn1umJ4lwagwFXj+P8eQXkq3l71TrFOnZpvuM9ewusFJXNDFHggkeTE3y/BQaG9EaxUb/Jzs+MykAc70Ab9cSVb1tVIE/3kc2XTdl/b67VJnWImk1DKaQRusr9r4HT1yN4BVQ/z1UV8KKPaA3wMwwcVRJY1O6Mh0qZVR8O4dTRJo6NYG1XAo4/Rd63ZF6UY7qqZyUSxSxypws+xkxP4Zfw0bvWJCOfBPV3QYRwMtUTormhKjfAhPas4bG8TDoVidFcJycSFzx4bjERxgAQ8Tg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(6512007)(5660300002)(186003)(8676002)(16526019)(86362001)(6666004)(52116002)(8936002)(6506007)(2616005)(36756003)(6486002)(4326008)(478600001)(6916009)(66476007)(66946007)(316002)(66556008)(83380400001)(2906002)(38100700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lre1ac7XDyODC6lFl+rrQfpOfy6TLHfGF+5qaZlczK2RAKR92hujC3YUQMG9?=
 =?us-ascii?Q?B9os5SO/AsRWeSwgEIh9Y9h7jrXw7DuNsU6DVs72NxIsJu21plWoLjEwAXBJ?=
 =?us-ascii?Q?HirF8BL6Wu2ZP96hYPG5bZfs+MXEZtwsNaYEcNlZ3ii1lXJ5yxpMy2aU0FX3?=
 =?us-ascii?Q?7Bmv3vMdK1jys3p5G8BZigHVaHuW+zPclWZ0PxojNWEucm/XdC6rfZi5949i?=
 =?us-ascii?Q?35TOJB1eBA1kMeGfkNPU+0T6wIvA8MHHed8Zct715oOylSAW7HTyRGi+FMqU?=
 =?us-ascii?Q?wbfmwV7sPJsvae5/e2jIrLmtoIUJQ9qOzRsJya1YxHPvuO4iln2tPd2u0xW3?=
 =?us-ascii?Q?/45weXOs3k8ZAaCCcm6kK8CJiaOD22nvvuW0ZfryRp6Tae3652HB02tr4Vcj?=
 =?us-ascii?Q?+SCmX6WGEkKR7S+OmnGy1lMNhCDdDOmZk4XhteHuz+4A5qyG5hyS/2W706qv?=
 =?us-ascii?Q?aUvpxmz6v2SmUNTh1zgMl0uJTLF9iHAikmTA97hoDryv2Lp/pfcDGXGCUmbp?=
 =?us-ascii?Q?uohxlR8u4AKGw9vTV74pzy5xPrRHd5UaFjsp+6tL/w12TAq/IixLjP7gvxlG?=
 =?us-ascii?Q?ZASnAbJ9TdABepFf/9se91VsM+ffWRcvqREas2TT42EEQsA34Q1vvf1PvbRb?=
 =?us-ascii?Q?hClly/P+wlDIZzGV0CB/EsBt4DJHMG/SlLFfFiYt/g3EYgwHVItHMB8E493y?=
 =?us-ascii?Q?+JkqJjvk5uQBUmUlZPfMtnuiZHIKr6xUR4Z+VRvii5MNajhmzvtqvFXQQqv0?=
 =?us-ascii?Q?mvBXNIY92VSVX2uC3db81Ra0muXVWefBLszB5XnkIJyZFY5H1RsuNmmFNutr?=
 =?us-ascii?Q?SZ4A9w8KzBDhBSkKvdQqCCKXuiSnKsvOO4XB+dJXfCYh15mjr2IN2SoIUzvb?=
 =?us-ascii?Q?FwDJeC+5gW4wAFoJAqQNzYnWRteRqWSWroydQMD2z0yvnFJ55gCyo5xaa81d?=
 =?us-ascii?Q?Xw9WPIjVGNNfWva9nX/Jq90NJDuANUdNo0ZeQxfVYpxyug8fztakeUPkUsGY?=
 =?us-ascii?Q?TvXogXfURpwt0qHVQDICBAP9bmo2r64rC9w5EV2aaR114iq3uain4mPhRtud?=
 =?us-ascii?Q?kBGqLAbnzPqvumGKMI/31ZSPE3oXQ4mWJfciCBq8f8L96Zj2wd34XeRtNk+9?=
 =?us-ascii?Q?IRvNAzMAfWgdYANSYVXRFUbyK6sxyOY7pd+LqEQkMZu6x7LGppZg1zhIfDdP?=
 =?us-ascii?Q?obkO22QcUCV1UaEWMPeKRK+u1/BcNLScEIDOb73tTaZvH6l9+vaQX2Rs6wnz?=
 =?us-ascii?Q?r0BbpowzR+igKCk9x7V+VUDB1LoCaoF9QveRyZnu2+rt/WkBwiySc/3VtQ+e?=
 =?us-ascii?Q?GxKsNIetWM3Gy/Y5FwAjRpEK7TOl0BmMgk4LMvnGCR/va2Nt2/Oum7DdXDwY?=
 =?us-ascii?Q?2rlxZrVS3TEJ1GVpHzTh3hqriuOL?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbff15e3-bcec-4dfe-4094-08d92a3a2693
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:59:09.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9f2hLObWvMUjRbdBaXbqaXpTKMokhgC0/ZlByG5wl3O+uANYsT/mB46uP8gnPwOK42As+01eFWE5hj9aHvT2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4158
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes yocto-check-layer error:

ERROR: Nothing PROVIDES 'polkit' (but /home/builder/src/base/meta-openembedded/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb DEPENDS on or otherwise requires it)
polkit was skipped: missing required distro feature 'polkit' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index ad69ab6..87acb29 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -16,7 +16,10 @@ SRC_URI += "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
             file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch \
             "
 
-PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG ?= " \
+     ${@bb.utils.contains_any('DISTRO_FEATURES', 'polkit', 'sysprofd libsysprof', '', d)} \
+     ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
+"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
-- 
2.7.4

