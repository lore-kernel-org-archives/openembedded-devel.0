Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.52])
 by mx.groups.io with SMTP id smtpd.web12.12148.1618403224746267561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 05:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Up/P9xF8;
 spf=pass (domain: arm.com, ip: 40.107.20.52, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0OWvL/Y9npEi+8E12femTuonVby4TY5O8NA/lUAs5k=;
 b=Up/P9xF8HGmrxssZyQ3BfdVGrVOwZl2byz7fo8cw0F9UwSDV/1FaKvQk7FBGTnBcKwZ9tajeT1eEFG2nkKdfGLQ1v/EP0sXyu7Hh+GHq/NTt+RcVzo3oJXd6JQMYYLWoIWRORoJqLjlKUBAs1vmylFic/bvTlORphjZRXVDxLUM=
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by PR3PR08MB5865.eurprd08.prod.outlook.com (2603:10a6:102:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 12:27:01 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::d5) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 12:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 12:27:01 +0000
Received: ("Tessian outbound 47ca92dabae7:v90"); Wed, 14 Apr 2021 12:27:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5da133598e9e80e2
X-CR-MTA-TID: 64aa7808
Received: from 7d1af357fa15.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C882AD4-C093-4845-A98B-A4B740069F54.1;
	Wed, 14 Apr 2021 12:26:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d1af357fa15.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Apr 2021 12:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT8ox4BM3Xy/XiE3/kmzwxMtuiL4IojG6ZIG4MrxmS3ZtI94B72GzZ/lAK0YSV7KUlS5BCXajWdj3rc+nxUm/GIO70DKm9iI4C6fc2Ul5jzlM+NIPcWVYfRedx/iEZhT6MiDIqOXXOUIVUEd3GiGuWYiZzXHqzgkVgm53Qd7ryfPO5HaYpWB9xXDySP78yAVcUWuDx+x8jnYgplHcC396yTAHgMdcuPZst3ymdSbBsS31VZRA1wKu0bPCDsc1YvMZ1QaC65f+ttGvhUY1JA0n2mqa8aK4sZ2KTUFTZr90sUsVtYtBkSkO5iD10Fob3wehPYrRlpGyNcctO4mW1tBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0OWvL/Y9npEi+8E12femTuonVby4TY5O8NA/lUAs5k=;
 b=Ahm8vrHRSxpV2LP+9IzAdjDbYobm8ZrCW81lf3G+9MxYZT637sylMAPOcTMY/1Rq1dVAqsbA87Pc+eLPi6dR3rVfz8vB2Ve55seYY0aG34AmWmDeACjJIxG2CaSGhpEy0zMb6VGFovFiKvwft2bqq/FyQ6JgMl4Zkajx7GmHCj6Jnj4ATILqMiDNGiEhJ+qjzzs4MAjK7g4rLRi91TlRsj8B3pX0oUYCcCWNJTr1CQrDcVEYo8xNX6LMPuDWYODXj4JLsA0LC0GjZhCEJV+eggLINCmpRJnHlH9JdPos6T1d+bh0L5g358APg1eObFjdwrzo7eMZK1xp4Q06VUM6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0OWvL/Y9npEi+8E12femTuonVby4TY5O8NA/lUAs5k=;
 b=Up/P9xF8HGmrxssZyQ3BfdVGrVOwZl2byz7fo8cw0F9UwSDV/1FaKvQk7FBGTnBcKwZ9tajeT1eEFG2nkKdfGLQ1v/EP0sXyu7Hh+GHq/NTt+RcVzo3oJXd6JQMYYLWoIWRORoJqLjlKUBAs1vmylFic/bvTlORphjZRXVDxLUM=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB6187.eurprd08.prod.outlook.com (2603:10a6:10:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 12:26:49 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e475:df86:4244:955f]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e475:df86:4244:955f%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 12:26:49 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [meta-oe][PATCH] bats: upgrade 1.1.0 -> 1.3.0
Date: Wed, 14 Apr 2021 14:26:15 +0200
Message-Id: <20210414122615.11014-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SN4PR0501CA0076.namprd05.prod.outlook.com
 (2603:10b6:803:22::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by SN4PR0501CA0076.namprd05.prod.outlook.com (2603:10b6:803:22::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.6 via Frontend Transport; Wed, 14 Apr 2021 12:26:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ba8a1f-ad0d-4f48-12fa-08d8ff409b0a
X-MS-TrafficTypeDiagnostic: DBBPR08MB6187:|PR3PR08MB5865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5865E8CE455F44AF6423B11FFD4E9@PR3PR08MB5865.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:497;OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eCPD5ZOJjgahyw17cX+8iWaYyJITPg2QNrpz+Nh59QEkk7GchcdHcvRn/WzklnpqeJxrmXP0xA5OSKWhlC63DCAVHcOIuBAQnBLlTi6UC7BlIyfO7aJ8lrjsf18HkhaTbQy2C6/Map2XKkXfa9LegkmcXapXHjS5usdRP/Kn1WHEykAL6bjnxXpQCVIsnTemr4OqO5ihm6HfWK5SBS12QqPCOza4exJQKY+Zc0anjR1A1QhJCATjXf3Pa/Ao7CAQSCPo4vaOUh15AO6bYbbnvb9Y+R+VUWvDpmQy0ibxlnOrzlYZzvhz2cyjP4y9hYVoslmPDhAILgEZM+FwvOmn6mT9lpzqqbtBPH5tQzIfFM4sxNUGkYrFdllko1BrNLH23qx3aIUMqpTYO3y7OPA3pVXLWtI1YlazOLlTKBiUhvHLHtbsl0ulPci0c4Z7JsEArLQhD/gcVBXn0MNiVwzIFII9a7TA9pKQEX/+oU3B8ARaoiF+WUaKwVM/mTbxCzuEOexj93P94/ZCbZvGLmQXTAhCaV1N69Te+s8ryCMawJBmj31mx5M1ymjqysrSdXsYqmoRfRoyWJIUbYgzTn/hc00czH5FRjnlhx5l2tRy1IdAgw6vgLIDbk+jbJKGiHbZR/GOHZGLGkIvJkEzoc6fvnfaiq8JSHCBr8NC4SzvFUI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6666004)(478600001)(5660300002)(8936002)(6486002)(44832011)(38100700002)(86362001)(38350700002)(4326008)(66556008)(52116002)(7696005)(6916009)(66476007)(186003)(1076003)(36756003)(66946007)(2616005)(8676002)(2906002)(316002)(26005)(956004)(16526019)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?eAxXna7nZUS+S6AjwhvpF0S1vatRdd2vSQly01Wjz8wx7Z2/FfAExAW5rVI2?=
 =?us-ascii?Q?bhyUvFiVN00htdEy4He4CCZOj/6Vo7OuF3Ejsm2YU/x7tXnonMKo/7UMc7AU?=
 =?us-ascii?Q?XVwnXwPb3KrSh41VoGcBNZSNP5TRpY9kI7cRSOF6mDfoN+J4SmpGIj1jnAJH?=
 =?us-ascii?Q?OEB92XrjRoFa9DbdTfurf38leMP2fLIpZwZ1TBRzbVqNT7BuNTaGkYXXpRoa?=
 =?us-ascii?Q?18ScptpoX/FVJjutQrKaesaCpUpuqCXtM9A980SHa3b+OBZKTvMg8t1OfIrf?=
 =?us-ascii?Q?u4T10JGGCr0DCNoBEliNW0AYtTzW3dF/lqOvgGqO+rmUa2TGe7eBR9R0720z?=
 =?us-ascii?Q?tvXoiQzJxAukj3f0s1WVEJVFbcl/yj22uouZA/naFJnog8RgQovm7lgsr9bZ?=
 =?us-ascii?Q?33FpINxOJ8nRyaM1k4UnGvwuJ9CxsDPZzn8qfBZqdTJUIhd1qf/Vn7qlPVqA?=
 =?us-ascii?Q?QDBQes3M9+/sKw9mFApSKsl9g/LdkslEsLRU1xOqamJ0iWIj+tcAs0i4EhKX?=
 =?us-ascii?Q?dVzWRx9EpNd8Xy+VLE4+7a5ukJ9bbe+HZ3X9O9hrAWafLC6fL40tk2PdUm1j?=
 =?us-ascii?Q?/z04pmuH7NPtitty4Ke9+rpkRZLOfLRj0JdpTDuXAgvg91IzaINH3P6zoggs?=
 =?us-ascii?Q?X1MNd69v5QbdrPLNivrcesQu+2i9WzSyZCIY8NFS/tpFcdCDwfgXR6mc7RCO?=
 =?us-ascii?Q?AmN6rFKY7xbllkVKAlS2JIQz5ae2e7WQXRDX5oCyu6vJ6jJf1QeSK7IxckHE?=
 =?us-ascii?Q?psztE7lHqsozaeD8AjfUBkQppiy2TVujMvlZrfiHToM/wSFtQ0zVVYvpUQW3?=
 =?us-ascii?Q?7oCuI+pzWcL+BELJ4Lagg+bJkmEO/BAc3QigIM1JKP1/Mm6Ai/QBV7BG3j/e?=
 =?us-ascii?Q?1sMqKkyfNP/wkgeIrSGR9R2e7sqcPl2BaDtXVEv47wWtICZQCvQIG2xa1eO5?=
 =?us-ascii?Q?O99ju0SQ+Gw0zmkuHsAIACDJaFU/9IDNhL6gJFD7EAnKCoXMZipAKQ1VT2bU?=
 =?us-ascii?Q?L6enMNPO0irtrAflIQ9aCf8Qk6sFl2CLSCANzCW4Pc1RaSaAeeioNtRP6uLL?=
 =?us-ascii?Q?vHWFlSZOHmFSCx1bWfcgYviBNWl0koUsrKlcmUmqbj6Al8wkr3gQt5C2l3V9?=
 =?us-ascii?Q?FKEZhu2r6Tyn7NDrExjjqpFNAFeeGHRJuztTXPrdIk1nplRoAsQka3VIXmfG?=
 =?us-ascii?Q?Od7yA6Q9hJeDK0plszlQwdQohRUyKNQn6sgskBC507GfYRlNREae8sN3H1JC?=
 =?us-ascii?Q?ZIu9bbeHjqE4PRhDWhOOxlutMmhrOIWZ9Z+VKYTCV3Kza9NY/9+aryAyseYk?=
 =?us-ascii?Q?C2bJJPxxCW8pde1IgNVM74Rs?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6187
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd1d25be-6934-4586-08fe-08d8ff4092dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RARNjqEouHsZ5+x9/OTIx5DJLo2GVKJU5KtGewrxUxvgzmUTRz5QkQt7MV+CttCoKhSHW0juD5bMCsaI9dw8RNVE2x8+Zyr3BnsqFkRzXSKe/MoX0351l0Kjge9ZifNFntI033SwdALODAOv045Rz3OIZen3vc8KvtR5pFS+5vZ1gi+Wlo0V5GyBIVpZ3VlBYI/f9PTphLPCSr30eiMKvLfwQ/BjdGqjKdbz1ZmxXONJ3p2ZxiUDj2uHPtIB20KpKtm7ICmC9tmGObuonAoA+j60HGd2XkM0HouU0RMX5KfhP1p/U5W0W3S58yyTCcKbUKV3k5p8rzOWRKa7IbMDo8SJxW2BgexJ/YUGq4wWnCWW6/8DjysagF0ttzPuU3X4I1soMzgWSG2ZBv465QnErA/NzLnzZuGk/pk2F0vnzvJUoCinWNOs0MqNA9RAwtIHYwPwVLphcMzQJRoQ1tvmV0PH1DmdzSiXaQ+IEmqhiPeskkZbdhomNkH1xW1QnmIRbooScP+SnXJdtZnniqfEAQTAOfDDANEYvrAL1pCtrG9Sa8QJt2xKSiwf+iD4UurUnoEpwCHVcSGMtccCn9Dwke25oDN4n2pIN+FR3XTmuhvVp5dyXSKh6s8hT8kUseq9Ub91m6lSznweN19DuyPuAAvEcMYnATGQvMWflj3UaP0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(356005)(316002)(1076003)(16526019)(186003)(83380400001)(478600001)(70586007)(26005)(82740400003)(70206006)(81166007)(2906002)(44832011)(336012)(47076005)(6916009)(5660300002)(2616005)(7696005)(6666004)(36756003)(8676002)(6486002)(86362001)(82310400003)(8936002)(956004)(36860700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 12:27:01.6963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ba8a1f-ad0d-4f48-12fa-08d8ff409b0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5865
Content-Type: text/plain

Add 'pretty' PACKAGECONFIG option with ncurses runtime dependency.
This option allows to display test results with '--formatter pretty|-p'
bats command line option.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../recipes-test/bats/{bats_1.1.0.bb => bats_1.3.0.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.1.0.bb => bats_1.3.0.bb} (75%)

diff --git a/meta-oe/recipes-test/bats/bats_1.1.0.bb b/meta-oe/recipes-test/bats/bats_1.3.0.bb
similarity index 75%
rename from meta-oe/recipes-test/bats/bats_1.1.0.bb
rename to meta-oe/recipes-test/bats/bats_1.3.0.bb
index a8179744a..8190a5e3a 100644
--- a/meta-oe/recipes-test/bats/bats_1.1.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.3.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "git://github.com/bats-core/bats-core.git \
           "
-# v1.1.0
-SRCREV = "c706d1470dd1376687776bbe985ac22d09780327"
+# v1.3.0
+SRCREV = "9086c47854652f2731861b40385689c85f12103f"
 
 S = "${WORKDIR}/git"
 
@@ -18,4 +18,8 @@ do_install() {
 	${S}/install.sh ${D}${prefix}
 }
 
-RDEPENDS_bats = "bash"
+RDEPENDS_${PN} = "bash"
+FILES_${PN} += "${libdir}/bats-core/*"
+
+PACKAGECONFIG ??= "pretty"
+PACKAGECONFIG[pretty] = ",,,ncurses"
-- 
2.17.1

