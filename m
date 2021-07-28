Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web09.2695.1627464806786869238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 02:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hfTRoKZR;
 spf=pass (domain: arm.com, ip: 40.107.22.70, mailfrom: anastasios.kavoukis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=hfTRoKZRhEht8ivr+q+9kMvzhoG8J85aFUz3Y538090GOex2Xc2nGX62FabDPzZETTBBXyFUlxib7OzU6sqOJUUb+uVHN02ZoJEIL1nhmogf/eDwPNyIs5CI5GxqF5Vp34DCo6ttA5e6Y+2ihwhFMcOWZrOLkzBwOt9mFmzJvYI=
Received: from AS8PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:20b:127::18)
 by AM6PR08MB3654.eurprd08.prod.outlook.com (2603:10a6:20b:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 09:33:24 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::6f) by AS8PR04CA0133.outlook.office365.com
 (2603:10a6:20b:127::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 09:33:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 09:33:23 +0000
Received: ("Tessian outbound 5f693336bfca:v100"); Wed, 28 Jul 2021 09:33:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6784ff096880d5b
X-CR-MTA-TID: 64aa7808
Received: from 1a9973576855.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD713177-6AA1-431B-BB3E-28D0CC193075.1;
	Wed, 28 Jul 2021 09:33:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a9973576855.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Jul 2021 09:33:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYqxph9C4vQC9CllO9dZZIp/uAVK8R3O2cU+OAT5fBsdp876dv/egUK+WGwGADxuFWRSG758D9BBLevTyJiiuFSGo+pWwxVk/Cv0cD6dH6qBJCrk13BSET6nRNjtnUaVQvI1AF93CPTuYHGL6m9hGc29le6FAXCT2+tNv2UruDjjCVZPlyuC/9KF/SJ1QHnsOFg8p1sfeVz/SWR7puBvtvQ8RKe5dV2v+B5ZiYacbeBN/au/EWRK0pJgQCzAsWw3a8EO35G88EF5mb7LkXkw4woJLSiyhAyFM8+MFsGrqWs5eyPHUz7EajhCHCctWXZI9Wtq78GXjhyUD4WGTW3jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=B0RQCBbvbpRPlFtWkESprMFpIHAyTdeNuYL1tVr9FGX41AFn7siEMj17dnA/fIc/he8Zvo51SL30kF0Pmeh7Lp9B0xfuly3AHaRGnafIt6+/mQEsUl/p5klNduCa1FnzHBnx96pkDggJRImA8SUUSHe12GNyq0LL7yhLCbUfyBS8QZlvABkisoUbYN8rNv8ZOUhXR4h+PjA2P4g+1Vlwe3661zAV0KIg6XX24LHqy94ZPoNVaIKpEB7HFi1KXyWpIyP/HXtLLnHpzqUmRLUehxSlQjHTk27EVjFnA/JxxmUWfzfSXw9ndiu2uX9zPANcmR6zP2urBqop6TY9bSncww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lR/4pRwHYiInBLA2HVHFjCx2PPguddc3uwMMCoC0tA=;
 b=hfTRoKZRhEht8ivr+q+9kMvzhoG8J85aFUz3Y538090GOex2Xc2nGX62FabDPzZETTBBXyFUlxib7OzU6sqOJUUb+uVHN02ZoJEIL1nhmogf/eDwPNyIs5CI5GxqF5Vp34DCo6ttA5e6Y+2ihwhFMcOWZrOLkzBwOt9mFmzJvYI=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) by
 DB8PR08MB4122.eurprd08.prod.outlook.com (2603:10a6:10:ac::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 09:33:09 +0000
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9]) by DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 09:33:09 +0000
From: "Anastasios Kavoukis" <anastasios.kavoukis@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com,
	Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Subject: [PATCH] [meta-oe] pm-qa: fix paths for shell scripts
Date: Wed, 28 Jul 2021 10:33:00 +0100
Message-Id: <20210728093300.7665-1-anastasios.kavoukis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To DB7PR08MB3082.eurprd08.prod.outlook.com
 (2603:10a6:5:1d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e124468.arm.com (217.140.106.13) by LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Wed, 28 Jul 2021 09:33:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2caf3992-f54f-433a-5eec-08d951aabedb
X-MS-TrafficTypeDiagnostic: DB8PR08MB4122:|AM6PR08MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB36545FA2FCE3DB51286A093EFCEA9@AM6PR08MB3654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:167;OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6WzOZpi3RuDTNnUHXYo/xdoeWKauFxtf8nT2ofEwLyKEzMTuvxjAIovaXWGoGHFMIFzN2tF+2oD3HSM98l5ZTuZ6GcIDqII/otZNvVmUn2Dia8EHBtoxEH3luuvZV3AlIvI3QstRNJ5vX6N1bKFLCpIIQiyy2Pj3hAGetZcelZkQsfjRGcBYirRJD5Vdt5O3sKfSbYzt/qXYUkmc5cgJwNA68xXGZkSvDv6o6ZuVA7Ypjd1V+G+8HQs4Y6ZN/Oz4P4bT3VlWpHnUjk4g5Y5zlloUMVg0gIDxtBRWAZzc7V7PqYj5eLyZnwgh7macO7Q7lj782gDmwjEwTfB7/NreqRxbkdBwvRhRfYaSY+apkQfHorwENrrXKTal5DLqqpkjIUzjFmc+4DG4+W+Ip7FUFlovam50CUrMB5XDQA4hEi5uwZX4ZUuY28oMF9aIhyGMEaZDDaDMGkSoV+zauMsXjCsfhe3p4Zm0wYTuYyUy+SnpyD1vyZShT0raQFU8yi46MeAdUrVKb2BVNwCmMl2A+ACmywTt+4RIhPELF7nWSLqmZ6MGkbWBkYRvQBdgj68uc0NAUpRrbQI08mv+NwD0Q+CLAvJAQr1FZ+lFwYahaAfABktdaSidmJc4w1xruXRAnppFXwEkZkwlV+V7O144AnyFWqmgP8HwpXbKl30ZWri7uI5AXSngVDooUVmvgosE2GBpS91IOh86UxspRTQSkA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3082.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(4326008)(316002)(86362001)(186003)(26005)(66556008)(66476007)(5660300002)(52116002)(66946007)(7696005)(6486002)(2616005)(478600001)(6916009)(956004)(44832011)(6666004)(2906002)(83380400001)(8676002)(1076003)(8936002)(36756003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?DIgBe9Icy78r1U12IfBQy9c6RzHXUFeq8jAjj+D8qGiB0qcBoUzyBjba577R?=
 =?us-ascii?Q?BiD/SsA/Pp3t6a4LuqKLJPIxGg5d6ybKp4bh3Bj4tqfdIz69zg8T593xdyzY?=
 =?us-ascii?Q?FXGcA85uvKcPo4zNNNjLDpuxgPr/lfsd3SLYaUhkV2eI25sof5gjYLblI6sS?=
 =?us-ascii?Q?hTNWetDEiLDwJRkptid8fK3jsg9RT4S06m9eAaa/Objxmla44s7MgnfaWbCC?=
 =?us-ascii?Q?3CWM3CjZhTznmKb53n7rrpVCe6c9QGSBeo3zD18HiVBkakWBwV/+UAcHTKwv?=
 =?us-ascii?Q?4y0IVHMbJ2MV98sTeK/UBCWsSDSZj5qIP+howfO/V+ifTL1wdkhFMddrQGr0?=
 =?us-ascii?Q?MlPlMNAuspJEY3ZyTQuGGp2Qc8lHrVMCt9chzbi/ejA4YD4BNcSIJ3DNss6s?=
 =?us-ascii?Q?9c2AU0DATcfyJixPjUWjCKONaZ+f8icxlNxiwwZ4fWp3Sj4UuUSYTqf6BrG5?=
 =?us-ascii?Q?GFw/8BBx5CHiLVzsdyUHcEBzi/9EReBc/RNhjjKEJFELHWtMluoGCmHR4mGt?=
 =?us-ascii?Q?7aiN093B/b+Q6VcybN9v0gg9557CgOCtXbxGBPKw98dOPAPez0B4bhXzws2L?=
 =?us-ascii?Q?ZGJKvnDXlD/IRzs12yKU/MUmvyPoiW/mayicyQhnq6PbL6cFCBRZ/lgTNeLG?=
 =?us-ascii?Q?G/Op5BikVepC3jqLdZgpXsWBmrY3gghVef2f8CvQNiYiCWQBgq+3hmew1dji?=
 =?us-ascii?Q?dVbf2GANRYoiaklG+Rnyhee085r0iTp/HR0FNf1RzfgXB+cWvnY5tWoIr+4R?=
 =?us-ascii?Q?gH6cwDVmtWZ04IhYQbatAuG6zNnx90bnslW1/D2j1dk+MHGEgYgCfJVjrS9V?=
 =?us-ascii?Q?Y8x3OBwh+AWt/n+3zMnoUdx4AVAy2Sb3uTmbR1S33fnrUao5EGbl6O1n0w/3?=
 =?us-ascii?Q?YysxUpN9Hpq3YNVyNtrA4lL8QE/CCJ2njirOYbIe3qEFSWejQ1jrx1naGhU7?=
 =?us-ascii?Q?2sk86ztcVjjgWP4lXjhsWYX8wPYCykVkEe4QjNKF8iPwgIQ6Gacp1jN4LK4y?=
 =?us-ascii?Q?3uGCmjzHVDumcH38tIIVZHOPSnW+Mm2Hhxv88MhOv553svyMbdbxMEcksonC?=
 =?us-ascii?Q?HJxJcMRN+uBxowfHdV8MSWTHFjuVaRAacuuJz10dBl5T8O1zYzEMtSHN3+jT?=
 =?us-ascii?Q?WgFs1LkEVIgkB7VZe6BgkzDMUPArc+M1BpV+X/d+wVeRNgI4KLG5FLYZ1BT+?=
 =?us-ascii?Q?zy++84Vx73LRR1nMb4UGsT4ofB1DoqQ+tcc8AUP/7BYgL2COoubyANPKNZCZ?=
 =?us-ascii?Q?5+fMmukcMo5Ze7Yipy5M6tyuNbHNAUTIqcBxlpQO07vVh3Wek1iaV+h2440G?=
 =?us-ascii?Q?z4PAE9G60Z8OxyWc1MF5LWhX?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4122
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anastasios.Kavoukis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ce9122f-b3ca-41e4-6826-08d951aab5ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LJIoSFBD0+B5JLUOUhCdDDM1lt2LPoAy21FnnwBK7Bd3+WWlen7USUbWUjJeOYOTZbs7S/9WXBjfA1b6cI64aOWmWV8F3zMeTHdHgGuaNEDRfCzdAdcqMZiUJdGZMEyU4ORpAFQUGB254Xv16dwAJFRSKtRVMVxP8lLx79KHCfF9SmD9mvkE+Lr4potctj4VKYGh1iero2jP362PFj0kxvJzaha0vQRvXVbzJgezMMgmSzs7yERCixP/nmKeyvSlPgqn9MUPSCuAvomaOCQBndqurRY3hdbpSRqgsJydYlPhtIvKIlM73FOYHMNgMTV5kNoE44I7LcbmZY6JydaoXCjSWNzvQK7lYdwTBD1+0gQuDYsJXX9ei8XAaTvFhGNCiw1+pTZOfHYCWNscto9NlFB5jzgVoOx7JpKnhzAg2YpS5a6ZPEVRJ8qroE4fLXKhEfCgfzu7yHwjMLwlEqv7fogZMgtCE+rp1qLDp9yH3uZ21GJs0oajdYdLcePmvZe8zv3Nbwt39LBeQDgz52+3aK6/nCYt+8fVi1qSYQ8zT99Ejbvp1oYPGGEDbZPzu4MDBo8zLIFr7vXodDa3EFlhpZYRebSnp5S2juzVXNoJIqP/wqNNURMC7SQzq5B9ztPItkZRK8nujZ2cef1XGvK7RxeM8jQMFxh7DLGeOQ+sZEkv7ckAlUugyY5nHmwadf3anB+eegxThoTZS8eLQPMFAw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(83380400001)(8936002)(186003)(2906002)(478600001)(316002)(8676002)(70206006)(47076005)(6916009)(81166007)(26005)(6486002)(336012)(956004)(44832011)(70586007)(36860700001)(82740400003)(356005)(5660300002)(2616005)(6666004)(1076003)(7696005)(36756003)(82310400003)(4326008)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 09:33:23.6794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2caf3992-f54f-433a-5eec-08d951aabedb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
Content-Type: text/plain; charset=UTF-8

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
+        sed -i -e 's#. ..\/Switches#${bindir}#g' ${script}
 
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

