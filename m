Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web10.2697.1627499877115834313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 12:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OwgBjA43;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: anastasios.kavoukis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=OwgBjA430O6io1Herjl0PpUjew7N6JieIevkhFpDijCSPZrnKVOkaPjPlnxn3D3bTy+4sL6g+6NTKh7Eth1KDcKB1uIQgJrcNpIseWEaihv8ahdpUGDu6Qh6CwabLWP1rXUwM+qxbyCFD9F0MgdrxJkfVDH2OHRKR9Ttkv2avKE=
Received: from AM5PR0601CA0075.eurprd06.prod.outlook.com (2603:10a6:206::40)
 by DB9PR08MB7068.eurprd08.prod.outlook.com (2603:10a6:10:2c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 19:17:54 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::b3) by AM5PR0601CA0075.outlook.office365.com
 (2603:10a6:206::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 19:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:17:53 +0000
Received: ("Tessian outbound 31e6e3649d31:v100"); Wed, 28 Jul 2021 19:17:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d74855d684db62e2
X-CR-MTA-TID: 64aa7808
Received: from 7444e9f1750c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0F96AFE3-1669-4309-994B-B9BC3CE872DC.1;
	Wed, 28 Jul 2021 19:17:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7444e9f1750c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Jul 2021 19:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR0v7A7SCw4eDTJmtaydXvqhORTizj/lSIQJjnGuGUnqsueAfJtyYD8EUVgxpuHqyLmpkKcl76n05ysORWZwKrFxwoNmzp55pRWVCKw2gwWj3vHv6U5vQFfmRHlkz7n1mRffk+TU7jOWoT40S+e2nrjKyUWYMFUgCJVfXXyEN8I9bhL272gHDc6fEzXnhqSttVx20IjygaF4KpvIGc/Q4wWJtugdCPwdDxyjS+dBwLdPqFVGrjsV4Oi+CMwNZI++5hHbQE/HsKKfHl0am/ojdXTgopcuVZLXDB4lX7y14qKzDJQTHT+dk7272Pow0EfS03Tz2D2q6W0RFrX16WuJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=PxDRi63YzIUEMS90vbBo9hmdGPkuKmmpotefkC5pKbKsV16o1p209M0XVO83dd8Nvk6o6snuVRsxYe1wHRhms9NThYhZKhmylS5mSfPgWs5QYONCIi74QICy0eQu+7AYHZ/09gifylqHaU1ZID8WIhFRqPeYEnFRylK6W1rrFTzB4AetYAT62eSRP+lNF53/qHS2yNiSiIm24BbjEO6fjgN0u8GaXCp7nbA4FHpMTpP8lBL6sggL/sa6ncHvU0iJLagmqSzngiGu7x5Co/XhmQkXyG6uvos5+PYaSJrPR+ex677YKOaQdhSoBOggCK1jny9qOjEDW8CbZUrtb1KuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=OwgBjA430O6io1Herjl0PpUjew7N6JieIevkhFpDijCSPZrnKVOkaPjPlnxn3D3bTy+4sL6g+6NTKh7Eth1KDcKB1uIQgJrcNpIseWEaihv8ahdpUGDu6Qh6CwabLWP1rXUwM+qxbyCFD9F0MgdrxJkfVDH2OHRKR9Ttkv2avKE=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) by
 DBAPR08MB5654.eurprd08.prod.outlook.com (2603:10a6:10:1a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 19:17:41 +0000
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9]) by DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 19:17:41 +0000
From: "Anastasios Kavoukis" <anastasios.kavoukis@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com,
	Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Subject: [PATCH] [meta-oe] pm-qa: fix paths for shell scripts
Date: Wed, 28 Jul 2021 20:17:33 +0100
Message-Id: <20210728191733.15049-1-anastasios.kavoukis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To DB7PR08MB3082.eurprd08.prod.outlook.com
 (2603:10a6:5:1d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e124468.arm.com (217.140.106.13) by LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 19:17:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d7fde78-3059-46eb-927a-08d951fc662a
X-MS-TrafficTypeDiagnostic: DBAPR08MB5654:|DB9PR08MB7068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB70683F8EF21570BAA247861BFCEA9@DB9PR08MB7068.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:167;OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JdIFd6ntZ1MATKADS1n2iEp7muxUhzc4dRDgnfzkvdWoBJazpMcw7wusQXJPiBQ0qWXxCaqMC6OSQUk0xbskbzyTJpiJvEAilRYv+d+9/4fmeHEfQ3RYt44AH6d2QU+NH05LOwUZtJkG77iGJvWlDG7NMHwIclg64n83uJeKTS5Dxh65U4X32i52LS8Um2srRADKDpByH6oBpwqHhAN9RPTGC2lXmpeMPrwVhyA+hj37qFvhUyCLw7QiWVi4ej260X10MbrD41UKSjnIYfcnCqC9dF3gLE4kuA1YtfCTl8RmAf2be2YgeCxMUNP9rDOYzttw46rN6sFxDU6LwiprlraPi+2etDfPE3HM3HLnjiCIWvr8EXh3L6gDlcV5nAWNuYP/TNYrjZuIvAPzkqPhgqpsNw8rcoQsHRH92lCoUX/PAN7FSfdYUUhOLNTRUbHxDHitLZdF3wcQTNCmZlH7bRpNrEp9/dGtLQbgRw74QvyaTHBY7z1PMaUNgUWFcWQmiSoboli1gD/XEi+IS5qRNyii16D5g2dFN9Mnl1qbPrEIiQN0zV06RmKHQEMvuFB/MUP10AfgYtmP65gtpSco01Cig7yCtccujE49yBrd1MtM72QO1ndcdhPADuovQIHqPWMf/C8yFy2VUxLlcyr/iMUcj2+Ty0yT/Ct7LYUucBbZFcIJyKDJRRku4JP02WSISmQKO0Rp+ENKiNn8CeKjKg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3082.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6666004)(66476007)(66946007)(186003)(8676002)(36756003)(83380400001)(5660300002)(6916009)(38350700002)(26005)(2616005)(52116002)(956004)(38100700002)(1076003)(7696005)(44832011)(86362001)(8936002)(66556008)(2906002)(508600001)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?c59izi44KVYiZ9fHT5vQwqzIiE9zBv/EYNf6zAmBW5ZKWw5IU7/qtdi166DD?=
 =?us-ascii?Q?zvUxml8PM/0FP4lJ28bKxRBkUOashEUZtPCQDxKKRAGe0RB2j8pj7LA6A+Fa?=
 =?us-ascii?Q?csWaC9xDE33Fj96Hg5NQLwDMmLNrO5F/tQ/CYI1nLN16ACL4Vf0eUrqHcEdh?=
 =?us-ascii?Q?0y0iDuSO0Po14hdYE+MaFS784AJfVvWSDWYWMBGRU1c1HaPVUv9+T7d67OZX?=
 =?us-ascii?Q?mupyA7SSABD6ubCCSqMWWONfm4e5ytvq8gsU3eJjBWj0/KUH2jkTOr1FUj2K?=
 =?us-ascii?Q?QcU4dF08CH4cnpQdG/PFTdmAFwEgm1NLNjyo5O9SX7yRR33aI3WYrlP0oRv/?=
 =?us-ascii?Q?/PMeXRrf6slaPQTwgZavxwFfimwKyhYwtyPF8kUWxl49Y/S/J1RL6S8W0+RK?=
 =?us-ascii?Q?5fEVZ0cVhr67AV7oafuDaDoOzsrle1fRS1ervQwQSiQoa4VAFYmictOs0kFl?=
 =?us-ascii?Q?XcaVtHIdTPkYHDD6OAKs5JdbxCEKhzKLtpHRcVIvCYH4GscV1wUGl0w1kXUa?=
 =?us-ascii?Q?glY8lQ0W55xVxyc4i58ElucWMKNF9p2HzsuNZivnCIVX2RzE95ehvjV4xbnq?=
 =?us-ascii?Q?hZocvtQcjkzVReupUwcb0DWjUqEp+RIoQoDexjGqw96NK0ycCOlavwBFaNmn?=
 =?us-ascii?Q?IT47Ohq30Q2DUjwTn/nZri8pC7WU7kYfKTA2UQAI9WiyKdU+PLs/Hho6kofm?=
 =?us-ascii?Q?0738VP2H1bD5fq1i0biEXybr1ExPoUyE9kq1KLrBdVdXEel7a/LHNr5LKbUQ?=
 =?us-ascii?Q?wYDoMXd3DEKij3wL8rS0g2eduoH8EnjvFKXGns/+OVjcrwakH8VgeIz59Rli?=
 =?us-ascii?Q?OYqSaT+t1QN4yjI9G9XUpFfIXeNeXz5eWdbGhhk3h6bf6E311avf1XgrGUZ7?=
 =?us-ascii?Q?P1tPAlKEZglW5EV9JvbzeOuAqLIk9lFIKNa43pWnn2eXP/XIa6UDrsZWLsAc?=
 =?us-ascii?Q?CJWBbOHcYRw1lboBv9u4rn3HASvU+RjI/jZiO7C8tHpyGCxxFSmEHZ/Ejgeu?=
 =?us-ascii?Q?AB4sES1hAoG3KWJfqaerXvClV+i7iYNqUNaXR+0QgWrbNCcLwv1Z4Smes8yI?=
 =?us-ascii?Q?n+Y3Q0vPHSRPliYKLHXpWsf6ia5B9l/FisTbLPSCQf5HgedXJOLyAGzevHRb?=
 =?us-ascii?Q?2k0m3TzH7gbaGYksZl5AyvanJJuus07vXDaHt6LORxUT5TLH6yD4gDQhh2Xy?=
 =?us-ascii?Q?MLPArNjttaEQ7SMGbWpFyqxfcMJc2HVlURe4+RFlY7bB3UQJTF1H2ZDf3EsF?=
 =?us-ascii?Q?0acG1yy1tvVAo/aVkrMA0GndNkg8ThWX5P9w8kVkEawECF8WWb0ytnrFannJ?=
 =?us-ascii?Q?mliC0v+gaAZY0KFJzJUXrY1D?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5654
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anastasios.Kavoukis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1fb9c1e-208b-450f-5d0f-08d951fc5e87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uCMza+Ir3KxTxpVqpH9vaPt81sEqXaapAnsKTEMY2F+Xz2Kx+YJIPU288AkgW1OHVxW4WgpHc3+yrgdmuTFvVlSkDsdhxeWCMe9IM417YvQNlJP2Xh++o4/EH2uIRpntDOnPNomWDd3i5FsgekOHCXpTbM4iFGjMkDfK29J6F0l48FQaEuDzIMtqZPejOTOpNluopCFcQcj0YbTFEuCv9oBImjPbNihcC8cf5lJnSBcPu/ETW3ClHKU9rBr3dbFI5HkwNKFRd19RFBPRoB9QPjwqPjPm8sBUiC0j/ItnDU2XUCpbZYJ/ps+E7rcuTvTAqt7G7sIv2mgxVZukb5flhzJXVqlGAepk5xcmORSOudF7Nk6YeLoLuV3cQdK1PPaDAR0dv3vi6vorlhUF/0dNzn5mqi4Ohq7fbP1jIrdMEL1U6Wd9/bf/YLyG7sjymEayAzkmWHCjC3amt2C2E0O8vFvvxujxkM3U7r1n20gN4qFNAJEbzP02rtsbnF7Pby+CzZ871DzKn344zedpCSpAZXA32FoEjtqv3hEaquUDAgfh/ArY5XUGTiT2zDKzxs7FmoS0wJKUDQRYon7BAKuTP8bYy6ndSz6STD6brzyMDrAzhbICE0Lbw8lJtS/kUMnfW1ic7fSnSEV4blZIhTaSXTGYGwSed08R47iQDrn3mEUlRbFqfupHo4Xq9uUzXF+n/sfDSVyQ8Opy/DJRiL4d0g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(508600001)(5660300002)(6916009)(81166007)(70586007)(70206006)(83380400001)(316002)(8936002)(6486002)(8676002)(2906002)(36756003)(86362001)(6666004)(956004)(44832011)(2616005)(1076003)(4326008)(82310400003)(7696005)(336012)(26005)(47076005)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:17:53.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7fde78-3059-46eb-927a-08d951fc662a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7068
Content-Type: text/plain

A commit in the repo of pm-qa:

"adf9df9 Fix path to library files and change shebang line"

Changed the text that sed was using to replace relative to
absolute paths.

As a result sed was not effectively finding the text
"source ../include" to replace it, as the sed should be now
searching for ". ../include".

Similarly for "../Switches"

Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 7e9971ea4..9a60caa6d 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -42,6 +42,7 @@ do_install () {
     do
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
+        sed -i -e 's#. ..\/Switches#${bindir}#g" ${script}
 
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
@@ -54,7 +55,7 @@ do_install () {
         # if the script includes any helper scripts from the $libdir
         # directory then change the source path to the absolute path
         # to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
+        sed -i -e "s#. ../include#. ${libdir}/${BPN}#g" ${script}
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
 
-- 
2.17.1

