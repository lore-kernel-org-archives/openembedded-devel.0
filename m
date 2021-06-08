Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.80])
 by mx.groups.io with SMTP id smtpd.web09.8308.1623126943685264505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fhHpmGXq;
 spf=pass (domain: kpit.com, ip: 40.107.139.80, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfT1yVdm2U2JnZcymNFAeVR77adV2eXwoGR3X/e8gyzsnU/6ClbMuVa3ebsVNJMqbG1dfxlQNaZP3x+IURwQu8oijEowp/0Li57S+l0Qpv/Onhr3A4q7etiJUAUE5FVMuyw4ccN9M/qq4u5/V9BTYdFHqYaNI0GZ26SwNt7Vu+nV96EY7WxUsQW1JyuPEJf04Y0Xd6vG3VFPnB/bT3NAZH7e2acyezT5KoXSFdJ923iNoNWQYkxsT2yes19MElDauCouxNSCYwm4go8YdVZRmuWNELa4Uc9dhNOaG5P1YfQ1gtSKs6a2vWjVqx4q/FN/5Qhsr7WtzxmOr5q6wef6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vExj78Vsxc3Xj1ilL7lkBilvAaiQFpuNge+YBj4We2I=;
 b=lDoZFXpSepIpiX5IDwKfdiByC1fJxmoMigl+2yjCcZ4WyUJhkGmCrMwp9wezw+AvxZrPCidhB3+ECHuSSEY6IDxTagEaI+UAWG6b08i3qWKyY+Pkzne1dmtdIxT992Ixc4ppv1WRkJzNbDhYZsmGxRsY9+5g7VHlwhIiuNQlQbILjdiA4JtsgCwmchClLUz/QDrCCUhSvebsn0Y4Y0AwKK5ErIll/PFJKDyx9nL7CpBrn7mV2WL5LEc7T9MbLQxg3qbNahrU/bhnai1R4/KHdkleOmxlxXFda4d3Ts5IQtWVXLIDM4yUqoPoNXT2TzqgImB85wRWRieK9YExcmueQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vExj78Vsxc3Xj1ilL7lkBilvAaiQFpuNge+YBj4We2I=;
 b=fhHpmGXqKEc2NT5D9wCBolb7NTUwLhawlrnJuA5w5iGX2Zz2PCtyqNKOhGBH3I/DTJjvSyVheLgf0Ozb8ZY4qlCsBHg3QBlFhNdAEZIOM2u5BHTCvkBVGrk+JLAgWcX/be0qZmfQV7ulKHioeHZ00m/AULj00pAz0xwE6rnyXrw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PNZPR01MB4670.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 04:35:38 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:35:38 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] libdevmapper,lvm2: Do not inherit license
Date: Tue,  8 Jun 2021 10:05:15 +0530
Message-Id: <1623126915-10271-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 04:35:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de94158-4d16-48f3-a768-08d92a36dd02
X-MS-TrafficTypeDiagnostic: PNZPR01MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB46702001A01B5B605DE3C9FF8E379@PNZPR01MB4670.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	timAQiR0wRhTnKohvCWcmt3IEyK+YPWn5HgV9KLjW8zDKeM2y3rPQeDIP/8hMRMiVV3ZqohgCmdnGLlEzjsIxWcU08qiv1qno45krERfFtMbA/MNJKqWl9xE48Nv4tsqHtn1nB8s6O52hL0i9P6Viscf34H48/vwtnhzkY1Ry9WVZj/gjP4JU4Kgmf+YGAFGJd6L+zHvKjgySyAgFbGMku30IkzLs1XkbU4c2OA35dMzCrQ3G1xUkSeLJvLhORmtRfupGiP47LCsx8dNJLuRaNEHySBjBY2J2fvrxGI+7Q7PmSvvQgWuEAe54nj+4B+bJ1FGIHJVTXFS7CGbVcCd2qRgB+RIv/OMjfFj2ZUuKfmpFt0KmKq8ejX4LgNFqSA4QLnvYWtjfw2+Q9N0nVeqgjlv825NgP9GUB9L1TP6fVXoxU7p5wKtLXm67Ppq/ZHjuTS7BdBpsIUXmNMTaSCywfMdUcsfj3OfsAX2M41mLcZluthaKx5ddC45vTw7seturQB9QIMcvV7d/oNERbLyeqN8G1h3h3JSxTIvIyYFDgdARb45UV/1/pOOT/195RKedBVR264Nf6w5HHlKm3NMpKwumsi4we853JzknEt7St0ZXJSiWZACxmDshhdTRKiF70kN7/EeuiLgJ5D0NufhTrN9we+n8oGyzOZeP8jjdrQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(2906002)(478600001)(6512007)(4326008)(16526019)(83380400001)(186003)(6666004)(52116002)(6506007)(316002)(38100700002)(86362001)(8936002)(66476007)(6486002)(66556008)(66946007)(8676002)(6916009)(2616005)(36756003)(5660300002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?BgXWkddAyFXzdXhRi/HkO2FG6lQcGoJInBNGhGQF/24pocchSTlEtSyPCapc?=
 =?us-ascii?Q?ESEWYb6bDyQovZGLLqNydr+k3DTr44EGSwxbifxY+Gi/5VMHHAYXgbNoa+Io?=
 =?us-ascii?Q?UdbDo9Jx9pXQ134hCz641Dos9U5xBgO61s30U62sPEfFkI/vpT93v71LB7Bm?=
 =?us-ascii?Q?ebbPNuyfdoVxSRpCuN8cCV1/6UC/qGQIIPE3Yx3EJO+lgf//EYdlfeg+p2HD?=
 =?us-ascii?Q?0W0s+/0j2m5eEn434FIdCSREGNUDOceR/Jh6PByEUaaZg0E4SsNlWc/CxEX4?=
 =?us-ascii?Q?P7PQZs3leG1P9+k4H8Qlj1SITrCQE0iwm1Dh2OAacvDyP/0FfPvj2hykSPkx?=
 =?us-ascii?Q?6GSngKq/w7j+Mq7dxmlYqads70MYF8sVLETH4ZBtNfCxQoef91GLu6qB4BwY?=
 =?us-ascii?Q?7I3ZFJ7UxC0E54/j9yZ7WqDGADd4BwJjFgpK5Z0hGJAs8lnOmAKdYXBvtKZY?=
 =?us-ascii?Q?KGuQ7sV1tHV8SvaCgelF0IVQjboyREQP4oE03WiEnirkjwdsSiKLCN85NX+N?=
 =?us-ascii?Q?W5/qISrkF58pmXk4+5Sev0+xK7guZw6xJtgQ3SQyRrNgcXKNySn+0ETircwv?=
 =?us-ascii?Q?BKVpdAvtW1sWODdeHjz4hyLraJ+AqLmVDdTsPP0dgPgz0HHFfEGJFRbFt70Q?=
 =?us-ascii?Q?HFkepU/qCiFs7+XPRP/gODXVLZ7ETBvS3obDz2I9jiBaOJbD86TXno8i2Lds?=
 =?us-ascii?Q?uFwkqWiDYhVAJaNknw2luPGu2ihucfubYyCiDCfjenQEjTqOV+g3X5Yjsame?=
 =?us-ascii?Q?gzJ6GzsDA9dkfC3mfl/HMP2hiqOHANJcw+zOR64IJLuhRWlNusC0UQlr3fBw?=
 =?us-ascii?Q?DK3vDB/QWUPoE8xg09C2nzl24k/7tN1Bt1IatxSBuJ69nginm/87nn2EiOpl?=
 =?us-ascii?Q?ExhLoa2Ez6TcBSNNGPD/kuzdvkXZKDdAhlafXYCKMzVGgpNSWge1vUpvVyWF?=
 =?us-ascii?Q?jjlohurvCg0ICJDAfFT2YLfKEG2Hniwn1uWWRdMCPsg0JvY9afKM8unK480x?=
 =?us-ascii?Q?ZMjbJK8yS2PRB56Ztx8RIyl6/YvbwXExosiXDPvyB0mcutAG7FscRM1/n67I?=
 =?us-ascii?Q?+Qb2WXbJIOiVCsCOmKc6HVbTjcBpUblICAwvYuSeQxhDkej+Zh153RsUkuW4?=
 =?us-ascii?Q?YWUeISDP44os4RqKSvPs/D2orfySYokxWmmxOD0qS1NaeCq3Vak8l09JYUzk?=
 =?us-ascii?Q?RmOulkW7xO0QhM+1fDz+NfBFPuvTZzcndW9tzBzr5H/6AIcLwwPqwgJMw0//?=
 =?us-ascii?Q?tCRzr/e15SAsDIkHCdFBq6ZUpWKCDZDAzDlHeKBAyye6xQWQS+4lMpLjiji9?=
 =?us-ascii?Q?jBJA4x1Cfy5vLwe5g9mg6ze4GIpi797p6C/sdQIi5uUbHuRHbM5kDWR41aS/?=
 =?us-ascii?Q?4uN1U5agWzYYHKSypocOzkrELCUd?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de94158-4d16-48f3-a768-08d92a36dd02
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:35:37.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7voaMXAUihgPTUBjxmQXSZf9s48kdUEYH65HkeN/Q7en/UtxaeO2OI3OnhFt7XbyirPpfBsPLfGmbgU5wFAzmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4670
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

inheriting license class which brings in
AVAILABLE_LICENSES into do_configure task checksums class since it wants to
enable thin-provisioning-tools if distro allows GPL-3 automatically, but this
brings issues when other layers which have additional licenses are
provided which ends up in signature mismatches so leave that setting to end-user and keep it disabled by
default with a comment in recipes stating that if needed then the user should enable it via
config metadata or bbappends.

This commit is cherry-picked from upstream/master to
fix the below yocto-check-layer error.

bitbake-diffsigs --task libdevmapper do_configure --signature
f6a95f0cfe6789254c94484dcd7d895e3a83c7d8e80f7a45e80328ed3d58e981
87aa98db4256768cf62c48703d9a857b878e257aaa6ee463ea17e5004215d5de
NOTE: Starting bitbake server...
basehash changed from
f4b6194b76e01b7dcb9e87f36156a9077b65f56e08f4841ad57321faec03a54c
to ba9681d39513fd8ed22438ac25811535401a56d9ec23a8553978cf421c268b88

Variable AVAILABLE_LICENSES value changed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 01c9df4..2fe97d5 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,12 +19,11 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
 SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig systemd license
+inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -37,6 +36,7 @@ PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+# NOTE: Add thin-provisioning-tools only if your distro policy allows GPL-3.0 license
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
@@ -53,4 +53,3 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
-
-- 
2.7.4

