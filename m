Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810A6C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 06:49:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6783.1646894946292114803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 22:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YU0i8lcY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00681612ec=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22A6m7Ct020836
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Mar 2022 22:49:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=f+p7CFD0C+fhIK04V87z7CE9Lwj0h7y/hTOViGGwzX8=;
 b=YU0i8lcYNr0zVVvjxd9QsvxJxMiQYcRji88xW8G5cerfvsV2Z0asBPSYNQRewRh+JNpU
 mhtFnVHHHKJ77AGadgebF8OtfYyH8iagO+siQFC7iEqx/CV/7XIYUX8yOvYv2JyZHm4E
 oBRqacdFEY8SjKo4kNHaZlWwxonEfKfedlROyo/BQn9cHqagsfutZpm/VgWx2xinWKAW
 XkyNgDx4T4Yw1gsBI9Lz2pjUziD34Vv8L8ADl8zeNHDPepHFnqhPgndnJ7Zo1qjCoOkl
 t115n/r1eXLVBfsB7PV70uQO9ROwaoAUse2nncIOkZ8Y4UYCnRQF1nAdxxkt+YI5SGuH Rw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3enew6tsh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 22:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo8TSnzGRMGboOLwHywijbBQogj5KKB4kCfyXMPB2yNNLwCEl/C7qtdGbPg8/jaMUGHgIl3URwaWXLpYREcigkZuLJ+6HhSaf6rc/5IVKeXr36b+M77ld9Bd1kOmqofpszpXip3ZNT3DyVD5lzQfb+U4A1GnBusZCEtcqlD1LxJGFRh947aEf6sYdgs+hqhoXc34cQdVhroH2uUnXuAs1sBGVN70RmOee1wG0eph7DgtWi058cNvO3InJEJjSV97dTbzUGPGtVWRcQpCNGiX0/o2GoqP9nDUvkbWfstsiFnfu+IMUgJx11ZjWwEwvy/2D2DvGQv9SW+X6vNiRMzfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+p7CFD0C+fhIK04V87z7CE9Lwj0h7y/hTOViGGwzX8=;
 b=Hv1q9X/IgZlnLnBxmQ9aD2zST3oAzLWYVlylY+DE6+hLwhpCuFQ/DiRMIBe9HFwd47MRzvADerC7NTj8WVrfveWCK36uPbC/KQYk0xni36klArk1gWAeGg2YNzGQ6eLuftjddrSg2WCTKx44gmfcnU5uFO8UF/cOjXScr+yROOPZuTD0/ujvDJBiOitZ7MLS7pkU/q1+9bZK9fMijuOyPJNcmke70UeFmyU58Z56PELt8/WUBb8kvUHx4HA6SPQSVb6wcEXnxXDiXiyhZRtiDqNNR6etAxaK8jiBKpimpXdjHrGQeG4ii+FD7BYso6qLJSDOpLWkJqstSNDBn8zBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 06:49:02 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::802d:9136:49a2:27a]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::802d:9136:49a2:27a%4]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 06:49:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott][meta-oe][PATCH] cryptsetup: upgrade 2.3.6 -> 2.3.7
Date: Thu, 10 Mar 2022 14:48:49 +0800
Message-Id: <20220310064849.872598-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::23) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2bb8ff-59da-43f0-991e-08da02620f99
X-MS-TrafficTypeDiagnostic: MW5PR11MB5905:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB590543AD76896655943C7EABF90B9@MW5PR11MB5905.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hwHewGSacQkhYUW6W7zRYAfT7foqreNxfHZXzZicj2ByD2l1AOrBysbtNjYSOi/OVBDLZKev/j2j55+2amro+zJxSQCY3/u55A9xjF0xrfyJWKFacdTCKiR9opRmRyA4uJCWQ1BEK1hglM5UEOw+L/qFISDTglbiXvDWWGHYCV8PRgXya54VrTwKNLpJXA3QGSzXlQ0iQL/cgj++Aq96Ye8nHmKn0Lvt6c5j9bpLLqpJQOk4/F9Lfo2xCcDByYcUwvMeMlOCFlU3gOTf359+eNhRJx//eUJhm+R/D/9KyIVDKU13ZOFWKH0oc4B9IpDW9kxAATQblrVJCOMiDuuXZfisyh05V9n8yKzBb1b6/o9O9E2OkrJoQghNivHBkx+Q6sLJ8Hdy6G6I3KfpTxOHIXrFr0eIe/hyHYEow9kuvYdazziI4xeiPCZq27508dcpwM+timL1cKGGw1N92AYqk8f9YlCKisftdfmxXARc+/BU98em5YnF6UotepPquOjEOVDTilL5j3R70tMpe7yFRZXkoAlT6Xi8Xw7tDc96h1YFq/rsM94+Q8P1t8zUx0ai0GKkoMqNBatEvQc/huJFCthIabpJk13TH88iYHkC2+nQA0OgOvsXob/uSG6YOTTYnbZj9BJcq2vj8+Uz9c8gE3g50A7mPId7MZHD11QJAIJL/rHGoJj1xur4HqyahclYXik5S/HpC4tvmJ/C2OnGBz4pt+MSCn6hxwxQFtL+e3smy3A/Ubs/dL8yafUx5QzWN7PfKddH1ewHh+Yf9IFh8vcCVQbAds5/r0AUwm9QAnU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(508600001)(6512007)(186003)(38350700002)(38100700002)(6486002)(26005)(5660300002)(44832011)(2616005)(6506007)(86362001)(6916009)(316002)(8936002)(83380400001)(2906002)(6666004)(52116002)(66476007)(66556008)(1076003)(66946007)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dIGZB60QP0OgTAqkTR9MEdmsWSeSDjSFCo1Kzb1wuUZzJjWRxufs2ZZufISw?=
 =?us-ascii?Q?P4I+3sswbcKIC6+OYjBgoS4LpgOZXqk7bFVDQBR2dwCHsOcYvv6Ja2MoRay9?=
 =?us-ascii?Q?kGDH1yE+ob8PelH2flwxElrS8+sk3YZitL0BNVSuqrUT+VNtOxNs+tNxvRSM?=
 =?us-ascii?Q?M7KHcyhW+kbX6w1AUXqBH0pXtouymJ7lo3Gs6Fm7tQJumiveskpjVPBI+WKn?=
 =?us-ascii?Q?YNECyEnMMxe7RYgAimMcHyluwycXCX5IzoL7luBeYlMQfRPBc9glFl4CL0p9?=
 =?us-ascii?Q?+AY+EytQHMFeV+LS/pwITunpuS9rE8s2NV36wd3MTAEWIQu0RzUD5yhjbqbr?=
 =?us-ascii?Q?dZj3ZbeCnNsrPVvxhSgXaC17o8sFVXnSj65kpu15tufD5yo5h8DP6xKPKQdv?=
 =?us-ascii?Q?/Zl0EphQH/Rif5SQMH4zC5d4ApWRwuclUx5TM40MkZg5jLfJEH8VLiR3+VaV?=
 =?us-ascii?Q?cPVfFBX4zHtW2awbVLbF4QawmvHYHOKsZRnSrw9OSxCIgjjJ3qvMkSsvWLod?=
 =?us-ascii?Q?Vc23XnbmjkHdROn3+LLnN4fFt12NyM/eSY+sQX3ExLhufsf3W96d0iX4g1AA?=
 =?us-ascii?Q?vQiqyh4glxtQqzWrQm6tzmCw2Lt/7cYtPot8ZxjIyBD3AGutTsJ57ytiZEYm?=
 =?us-ascii?Q?84/Jp2bP8XoLJkUEf++6KzHJ0Fusm64L1ZUgsjy1OH/SFn6mMC+pINTMp2NK?=
 =?us-ascii?Q?G0riBUKb2zmAmJvIL76LwPucMepoOnM2bFbaktrAFysmoyNOqOkv0ejxkC1R?=
 =?us-ascii?Q?aF6fT55Mgrns05MwSWHyVH1R9Xm775IE4iz41B9zOehpA1frYuWtwo7pRS1S?=
 =?us-ascii?Q?cOqr0RDfZG1QotZogDsToM5hM1n2W/4N0EAKSN0JddAICKHYwkHUV2LwD5yU?=
 =?us-ascii?Q?2ceQsN5dRQZ8dJdZPeV8BnF5giI8sVumgTzYW4ajO8am+nxo/k0ZOZCsgfnE?=
 =?us-ascii?Q?RY83C3gvu6wEymWVxK5PgJ890Yf9U6kjOQv8l9KnpnKxipMr425JNBQp2QrC?=
 =?us-ascii?Q?3d6IoAzWSbUnXQbSZBkZ6F8s0DlJXZCLkgeMmUOrY3ozowWKMh4jZYzspBNK?=
 =?us-ascii?Q?fMRHq+xXkdf7JTVSi6YIvxsGc2dNo0gTI41JOFYBIj9NExMHRylJjywQEWnF?=
 =?us-ascii?Q?5JlYAt3YB0sEDxq8dGwLoz25YP01uvufHiUwgoKofyRkGbGUvIQd/cyrAdrZ?=
 =?us-ascii?Q?Aa9aPuNyCC1x54zNRglgywAz3YImzteRkMJv/FvC0xJMU345nC59GmhMc0So?=
 =?us-ascii?Q?MTEyu4k6+VGcvHY5vKJs2wkfp1C288QBiFMCbFqsHcdnhoJVbVc1Zu3OZEqz?=
 =?us-ascii?Q?bdQg4TBfWtPPsgVOAS6TQrY00/d8u09MX7bu+AYskwCvBSwqJXtlz/mDlYWV?=
 =?us-ascii?Q?U2ZrutoByaDvAslfUIHkmIUBarn+6xUkkRSRjVfFpTXmxsJcDoJ4P2xQZOyT?=
 =?us-ascii?Q?t0DFVBzMbvXBcieuRwE4p3lfXWXUiopX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb2bb8ff-59da-43f0-991e-08da02620f99
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 06:49:02.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dVRpChR/cyzvAobKrEgjBYrOhYDhBf6JNzm3mAzzafTK3AyrksYGY3v2hgEv5TNqof5SH1IFpC7MdlaKzVMXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
X-Proofpoint-ORIG-GUID: Im-_cDuHOK8dIvD4wt0vsJ7WtzAzIPrt
X-Proofpoint-GUID: Im-_cDuHOK8dIvD4wt0vsJ7WtzAzIPrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_02,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=806
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 06:49:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95919

Stable security bug-fix release that fixes CVE-2021-4122.

ReleaseNotes:
https://kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.7-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.3.6.bb => cryptsetup_2.3.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.6.bb => cryptsetup_2.3.7.bb} (96%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
similarity index 96%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
index 498f33381..700984010 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
 "
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
-SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
+SRC_URI[md5sum] = "9c5952cebb836ee783b0b76c5380a964"
+SRC_URI[sha256sum] = "61835132a5986217af17b8943013aa3fe6d47bdc1a07386343526765e2ce27a9"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


