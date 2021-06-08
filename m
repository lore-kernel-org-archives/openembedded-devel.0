Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.72])
 by mx.groups.io with SMTP id smtpd.web10.8227.1623126395379507359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GXrDZF92;
 spf=pass (domain: kpit.com, ip: 40.107.139.72, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdCys995xH/VNRqZstpH3PNNnm5dRVdQdMJYfT65gERsuSzkhv+vDpgyxKwZvUmgiTLYxL9ZxeytqPNZ0qqfrXcVe04RYabrcGMSZldbdA4XKK/eefC2C+C03CaeibKATEops55gMUb+YT1OQJ447PflpjQVLc981x1N1PkbkSS6QQ4BAaAUknyRyx+619E1g+8ygkFL49NpC3vKkIGvHcw4w/Gikhsz6Rg5nNiL6GljKbXTGCUBURkXpFAFoBmBuyMj8r0nXB6kSQfx93QUyzgVJbFj2vSqTcRvlDIx9ap9lVeTSoSLfXP7oGveol+V+NRke2YDGyUkx/BMriO23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuf1m9oY3Y4dE7hZZHiTRQ2Ig+jPQ46l/VBEKauCLmU=;
 b=eBumQyghmf77wjMj0nhTxpRsGq1F5kncTlmal80BIGAS2EyvaVX0N+9GVIicSicQRONuQNBDQ2DXwO6RpSHN3xi8U9OMtKJS364k48QLMo/LLAOwYbtzIvTV7mRa2OxBPj5ACqSCNTYS3bAymo2Ag5HNMdtUHpp2Kcxo+/3OtnMLOrnRDxVpWXQ39gjkyDZqvCHh/x9S/cvgRQCZYwlWYPjfyN5UjdeSi1g4gXko/iuxbqeLDz+JzFHnl3EQAuc8TyQR7CqqihqbM/WLlGX7TYEgfX9vfJuuV23ZUMts2x43qj21vAoCHOxwtP6LHo7UmlYIWMYJY5qhtJojCUQHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuf1m9oY3Y4dE7hZZHiTRQ2Ig+jPQ46l/VBEKauCLmU=;
 b=GXrDZF92CnxpWBOFFD7qm1CXZ0ldKPi1lwzzvnd9XKZj8oQyPmB6vN9wvlsGIUUY7XYClsPG+G8efM5ooG8t3ileTQOITlsqRFD6ZsjJ+2b8P+kmdy3dA8NPvzwoUVMxPnL0whfZDLYQ9UIgLSoEJ6WJpvcnKUWbv9Evwf+9wqU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB4363.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 04:26:26 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:26:26 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][dunfell][PATCH] ostree: switch from BBFILE_COLLECTIONS to PTEST_ENABLED for ptest support
Date: Tue,  8 Jun 2021 09:55:49 +0530
Message-Id: <1623126349-9434-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: PN2PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::33) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by PN2PR01CA0058.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 04:26:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71358383-89e1-40aa-8493-08d92a35945e
X-MS-TrafficTypeDiagnostic: PN2PR01MB4363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4363E61CFC50DCACED3B778A8E379@PN2PR01MB4363.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lskqHDebiTjWQhr8UAD/Uv0nQT3bH6LEsH5v0cwMPd79eeXnFfSvqaviBNtRA00Rld3U+cYVpvEzl/8X5ZUzDlGxHGPLbPfdjKAh53FQJuDsPGtaEH33cMmFYReCJ6djYzF4VzwxFAu6s8c3tMsywGH4a1+2xDNxaoidrK04VeYI5V0/357ByA5Gko+KA0lls9SQ869V3B9aDYc10PU4+FLHdMp4C42rA5t5rOJTYU1gA7KzyI6zJZS+LsOlU8JkkH+p6rXRl1wLM2aojyC36DfpSzeEfOz7h2mIK1d4EKBeSf2v3JjQtdfg4RPBC5KXSbZ0RhhhEUNCNneoUP7MMFoQVLY3qVgb1RHNpFZ6bNWEHmoCysSFaXJ3rRy7LyPuk1ZQwKNjMjz11U9TJmVZiVc+HuxQ2hZODLYh8RqwuJM8hORcrHsCL9ELbb5ekAQuSeAAEuHB4Z12+YUcDleQ2bfzYK227H8mWbib94mok4wYTyET3+TkD3z0HKD+6Fni2+BDSSqVA+lbghAfehrOu768zlBCGNvbH1H2E8f9gfwI5lnws5JNWAiua2rw8iCKNy38eoY41NDkv+KK6qoK8Fdxfb9Kzr8TNaAU04VjELpvo3dioK3UH4+DxuHxwnr4e8pD4BOMz3SSvtZ/mb/xlQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(346002)(136003)(396003)(186003)(86362001)(36756003)(83380400001)(16526019)(6916009)(6506007)(316002)(2906002)(5660300002)(38100700002)(478600001)(8676002)(2616005)(8936002)(6666004)(4326008)(6486002)(6512007)(66476007)(66556008)(66946007)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xdj9iPSjZljwDYvPBLfKTksQ+0sW8IDUUtvD2dPmcY8q84dfT5CxU02AfAFf?=
 =?us-ascii?Q?+8J0xo+lFrwXd318/UHUrGRJ8eyNyf7smH37Bz/C3JwrZWIk5v+U/LzpncCk?=
 =?us-ascii?Q?lVKGKAm0bCwmie2CeXWXUQcwrjujSoNUpYkK2xtWFBm96koSwlU/+3z9ys59?=
 =?us-ascii?Q?heeWUNK5/dqqRkQwFmpw95Y9lWpg+dm1/0SOp316XJvYFF2qJH9rxqu7bNd3?=
 =?us-ascii?Q?JQjWKMNLEr7aVbmQhLJQjH0PYA/S29HAoJBE8CQB+M/D73S/P7ZNtPBt9XDq?=
 =?us-ascii?Q?FHXaMkZ8c6TfTxeep2YTHrwmnAxEEFy3RgFvA5kGzUp1zJLpQf2pu3XRoxEl?=
 =?us-ascii?Q?XPbUuUpyXOiVeNPwXWbmFEwN2ho/sIBXE1m8b8qaNQY5jFf4676/7C3ImuFn?=
 =?us-ascii?Q?I+vPMQOb+eKDYwOr2239Gk5XWGG2YGpMpvT84KjjfmQnrhos9YvYCqkVr6ne?=
 =?us-ascii?Q?ZOTxImv/V70zgXT02ZygbG+0r7KT4gIMZjVBpQNuIG1g1tTAfId845PohBv0?=
 =?us-ascii?Q?uDkylMkwC128qwe8Wp7MPW76N0u5SqTCx7uXU16r36l3LdRmyzc06R82J1EE?=
 =?us-ascii?Q?k7o7tDcDksdLnUhxA+4FaV1w/dZq8gSUs7b75HHOBqJ6c43XlsR/F39oMFTE?=
 =?us-ascii?Q?pzWRnWrrMZ6okhWlhhY+SGRDuln0joy1KrhzvUnEvQQ7Z+pH0Wm+/R40wiRZ?=
 =?us-ascii?Q?6vdAyOWzPp/WD6c1OyRLg2H8GutsdFmDzZQWqcd4CUzWv3eAzY+hmb0bj/2c?=
 =?us-ascii?Q?puwR1SM8Kerdz6ZAQBeLBCj6Y6IBfTokle03lRR3TBbEinfylz3bm2gKU/+A?=
 =?us-ascii?Q?MuW8rlbwmLNT9HWyRirj2NUbl/Kyn7JPrvsbKoiy5MBE1VuNesZgIoeDwKMJ?=
 =?us-ascii?Q?Tq3/CEnjJAEIpO6XISAKZMJUJQ8LOfJ0JUh1IHChmZ/ubz3Jhyn1IVecDQxg?=
 =?us-ascii?Q?jPWx+KcYecd+RlGPlGctEYhKCIqYNgDW4Xyg48hbK7zDEU0KpuGI5VuGcZBA?=
 =?us-ascii?Q?9Nsmus87nQhiaNBnsYpCQL9N4rs7862Vt9zM70j/BxVSQXpp1/t5k+Nb7DdD?=
 =?us-ascii?Q?K+zNRVfr6lk12VdoJ/FXVAUDvaWaw8JTRDTAr51YBqo/8EaqlPqRpYGPPY8k?=
 =?us-ascii?Q?c0Or7w89nLnv7GcoYyqZ/tymat+LTbYFaW8bvVL0aoFjwMC2irfsVY349W6U?=
 =?us-ascii?Q?gOecV/rczKlghdagGh1pXpVRoZtHrgRO03EaI8tVwJMGcbCKLpRB7eHxobFj?=
 =?us-ascii?Q?KmonuIxgCVdUPxLuy7WVUpEdyZzWb4CutllgRqvtEO5TNxxq2ik7OTOpQXnx?=
 =?us-ascii?Q?HrpVE5zY4SHfUEaYEgW1JUNNNtLR3JnA+iY8nKG0M11fV4S0SmmYJikUVvvT?=
 =?us-ascii?Q?yfHfU1MzLS377F3kqTxWPKOJtXdQ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71358383-89e1-40aa-8493-08d92a35945e
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:26:26.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCD4S+7BHkl+KYwTFmvuoU6VyY4GQ/swymQjBkqCz1K2NOrA5NW7iZR1o0Wbys93fJAf6TSOEs+O5JeEEONuvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4363
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Just including a layer, like meta-python, should not change the way the recipes
compile. Instead, if ptest support is enabled, then require the python dependency
for running ptests in ostree. Fixes yocto-check-layer error.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index 8640745..e13bb1f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest += " \
     util-linux \
     xz \
     ${PN}-trivial-httpd \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'python3-pyyaml', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
-- 
2.7.4

