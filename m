Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6A3C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 14:06:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7463.1643378767760412546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 06:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WNtSZvUC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9027cf57c8=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SCSPQ5018606
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=f9soqLSLqbBLUWovjip1mOc1pcNTSTbZTauAcU6+C70=;
 b=WNtSZvUCv0dbTgB3aVTVHrECwDSaXd2WA5o5UgXlEI7eGyYLIoOVt1pXIWrAg+3dn3Ir
 xOlot43cRVL6b/SCt0YaH8/VcpaosHqx4tQno+BBHWi90GawSfmRaw2ZOx8CxLrtQLmo
 GjJlKkrZ+2Mjo6jnrVZoBOEY1rDy/48z6MtyuQ3a3jHzd3Z25Z9tWNlpOSnSYUoNSR10
 nVLqvH/LweddCFsYVfw0POACDVRIMXa7uOSkcl+qxoh84XfaHQaOzuXs32sI7TT0NABj
 FR0LG3ckEr2CIR2iZO6XD0z1lc8ExQme85eGcO3c3R4uBvvJFFsAU+rezQBVGhZ/bWgr zw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du71d1qrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ+cde6GRkAmx1i+/klgJ1X7QlPHDSJ2AITsMqZM4KuLxiftvVVHWBv49YR0w12tFwH7ojZgxV/XJ4Q0eKrNSdCU5HDhjamO4fr7sR2UcNs2qFCgs9aeuw6oAS/1421wOo6tMbIOi2flRVP7Z6pziPmViTttPD474zJI49do8nHGQw2xRX2cXPcE42DhLGmZhQaCVFeMfQLjJrzG7rweRmwhwbz5zWB3CglOPOZ8NE9dBtwTFt6m7ZdFipWU9Yph/692Cw0wt9HRrnmj8c6YDLYfULULb7uGo30sJeHMFBtgFZGJYcAk+xHdvVoBlRVPILK0A8MH6AqvEzAancLsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9soqLSLqbBLUWovjip1mOc1pcNTSTbZTauAcU6+C70=;
 b=EqyBSv2K7Xa21g/OcESv/qE+c4M7LFPVjdUgEggLFdEu2Ctd5BeCnrDSt968GHE4WtkVRdlRMzQXTMp7MvEMtXnRWtNHHjrK2w5zQONFXazns0DBees06aZS0fVA6+0S8k5z51ERXeuOMsPl6tNV8MD3xGoZJHPErBU7n7tWX14O3zH91NKzpHkJPebt/JVQKVcx8A7S1cTO3CXAhZINkNs8OchFuxnkow1YxU4UrVBxhJ9RIkK2JVoVrAm36/wkeGwUQQYaqnCZXOwcYWbIFPCVKoWZqXd9kFYwrNuYS9AYmj8wBVxo1v49d2G04/v5A0Ts1oL5AsVYg1A3QH/mHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 14:06:03 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 14:06:03 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH] python3-pillow: fix CVE-2022-22815,
 22816, 22817
Date: Fri, 28 Jan 2022 09:05:37 -0500
Message-Id: <20220128140537.18882-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88b7c890-e32a-473f-17d1-08d9e26751d7
X-MS-TrafficTypeDiagnostic: BN0PR11MB5757:EE_
X-Microsoft-Antispam-PRVS: 
	<BN0PR11MB575754DEE2FF2D7403EAEE1F9F229@BN0PR11MB5757.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3cSJPnQ2DP95IG69sM2agkqJG1v0rdmJB9Pto9M6ddc3UV3L0hBbv/UjH8wRMtkFBRGM/OA+kLG3DU5bOKbWNm5mjNMwhSCCnYoKJsi6u6CpPctJgp1ioIfTuTqhhj4bS8cQ7RQKRE4MBtP8QjxtoDncZ0pzeHaabMUVLXqee35aWczBgTDqtqMrwVb34U1eR/A8bRiXSuNRql1UTzh3j8xMXcpHxnvOSlINPsyOc8XcTZygMKmvSPlAPNAIboUhHqsP5u4cgUOasLps9+reh7MkKuiMpRpqmtWVmzUCBHIDoRq2jst8OG3L2eMgI772i3LBbFHl0ywVre6zrShHguL7eNI+CK46w4AOmF1NFC/DRHLnomIw+Ys3bqSm0QmdEg+RW73RfE8BPEdA6vzPhC+DKxfy4hMteCt4XCfmq+U0c+tnuN1IrP56H8zCI38G4kDIq6APdtlbJiOTnMQpyAfC9riBwTP6eJkljxADWcttkspinIcpWbNcidFlxnRbkB86uIUeAVS6UPgL8et7j8JotcqrfRCNeK9ucjkhE6g+5mtoTcCZtzIQf+5VRBCyzfNcy21CyLaSt6Dzu+PXgTV1HncgMbe6j69U5Zd9fJIGWUapGHH74io7K9VET43zvEsxvEP0g78+kRrSrZUpL7ba3BIxLUvKaSvURkFcEoI41YKoWuQPncxSahNNJD3x049Qp5d5BXYftHQEUqGCK8RbUVrPcb7qLyklSehptL8gN9MXCgRgah7rIARiiLhtlq7s9g7qhZMcjQykcIWY4KVhI2x0pyuGKzJIJgT/8XkrbD8JLJu1E6IRBhXE+o9DVCr/6TQ/LeIIWG/DEvUe0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(66946007)(316002)(83380400001)(5660300002)(6916009)(2906002)(66556008)(66476007)(38100700002)(38350700002)(8936002)(6512007)(508600001)(86362001)(8676002)(186003)(36756003)(1076003)(6666004)(26005)(6506007)(44832011)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8WjSQUaIJYnz7+We0WTw4L18P9k65TvHY9oWb42goUZJ1Ng5QajbRPd8MJPG?=
 =?us-ascii?Q?6ZmOWpFuJaA59V5N3A3DfpQY7f20AqZ9OaeD6bnVwixSaNk9hPd9azSlt1wH?=
 =?us-ascii?Q?YBHyHjkDObl/bveF80CfE+iDR/o/X0Ab+TtD9whU2yi6wZmA1UdOvEoI+OVH?=
 =?us-ascii?Q?nvJU5hdfcOYhaAJK9TBKSiHTu0tVJGJIlRq47/m/7aCk54KXiTPw12FEcun+?=
 =?us-ascii?Q?yG/GhH6zvWnweexqh5tvncEmq8djaEXWrsAOrgVI+66NdFJVVWwlEZyk8nBq?=
 =?us-ascii?Q?mZZ49Bmh53U/4+2YSBNwBUFVBKuM2dNfRp4HTjC8YRl1Qekx6NbIf+gSj94b?=
 =?us-ascii?Q?eIj9iXBCjrjKJWGD5CYWyHged44CmGsXaVQp98xxKePIliqNoRNgDPESVlcG?=
 =?us-ascii?Q?EsWMDmHWBUV+jTIqYG79TsO4SWGjv3Tw2AoH5GMHoTPXt96OeuGVlcd0LpRo?=
 =?us-ascii?Q?2+nZqqfPLRBzNW4DBOMRxu7fegXQyJhbm352dan9CvGGtK7Vjq3Zak+9nBEc?=
 =?us-ascii?Q?Kwu3WfCCcmJbfy38fuqaPI4jgA5l7L/kkYZX2L7bMrjFlNph0FQQ/IZ3uFrA?=
 =?us-ascii?Q?OJ0hPR8FKUzO6AOdb3fjbOR/PXYZZnW+EKC8plCWPBuRnLmfTRF7JAyk5Ht4?=
 =?us-ascii?Q?btEB5GMSKYE9O8zkemNt7U2Vhz6KZnbsJg+OEYnNyVOvh2J/zBLVPh1dwyGs?=
 =?us-ascii?Q?QCvGHjxPXKxj5zyBpvEOE0d0feeFKuzwjcXOP/7LYaoxPOIDTGkWzfhoB359?=
 =?us-ascii?Q?Usj8FnLcG4QAbWhS41mz9J/ryMWqTW7bCNoctWTvsifGpgJr2zfTmHH+tOno?=
 =?us-ascii?Q?ovpTWHsjVU3FnGodegB7mhkcL6Tragthc9wp7ClNFxLwp1yw9JbOUcATyfBN?=
 =?us-ascii?Q?vpNexendXw8AZ53P+wZge10tSBKn6ssHa4/x0KI3wvAcRvNnbvqtRqRKletv?=
 =?us-ascii?Q?ffTwqlnW9qvblXh7pYa5k8KX9hoEG1Ye0UX74X+a0vjRlfbiNidTVUKe9Es6?=
 =?us-ascii?Q?UlJWzYIkNOC6kqAWrXmXVaWtxAUxoWWAF2fiJ3FbR12WY8k0KsmIlLlGkDDy?=
 =?us-ascii?Q?JuisLQmVTtQkPs7ro/k8c55nSFpXp0KbRi0UWbGk75vpu4EP22ZNniqqjbtv?=
 =?us-ascii?Q?ccoNJvtRgnPAVccSH5GAXge2rl6eGYKpzAHVk6qN6kAOlLXN6PWaK/hRtovx?=
 =?us-ascii?Q?pERa8KskIC30wT8aCdyOlKLZGbU1kdbP2arO58AX+lGB+5QoC6VNHfPvCMks?=
 =?us-ascii?Q?D13dqhHdz7mi+ic+9x0kxu7LQrVxJeLL3OIkD952COQV81DBbDcT52YG5C3R?=
 =?us-ascii?Q?se/+EDvDy4wxfCu0UJSQPLg7nVB+jLC65Q6haKu4yfbuOxUAi6WbbX5TUzkj?=
 =?us-ascii?Q?V0hcHKukR110+HGldTg4Ng0kQFjykxJEUcqT/iYnWQGt/XwWxs4CdC/L9Cci?=
 =?us-ascii?Q?wHFUfzfb7gETUfVqvWNVA8tPViBvf5Iz85hcSwiMfoKNCV1Mx9PTJy503qVI?=
 =?us-ascii?Q?xkkOO7e0rDPjo7z56R+4LXT6amgBL950w/2mFXsqqm5+dz/vvlFYFU1JFmr2?=
 =?us-ascii?Q?svZWuRFfVcMI8XE1ntZVfSaSxLkAzlClrhDPPG20wOtccj7c9/2s4tg8Kn3d?=
 =?us-ascii?Q?ONurTaS7/kSiKCtppNTARd/myU2WDdIHLRzdtBWyQ6VeKZDfmgzNjqvWrD7Q?=
 =?us-ascii?Q?HpZYtg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88b7c890-e32a-473f-17d1-08d9e26751d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 14:06:03.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z/MoixQaUBrZsQW0BfYgu7BC4UrBVjCecdJruotWFzGfvKHYOn7bgVVJ83sQGDNNZ2UKlwqCGbQ41UDi24yQ0cj6ZVn9I/hxbdY9I2sPrcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5757
X-Proofpoint-ORIG-GUID: dc0eU-ASlCjj1eREcB4X34qWlLKiIlFV
X-Proofpoint-GUID: dc0eU-ASlCjj1eREcB4X34qWlLKiIlFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_04,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 14:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95147

Backport three patches from 9.0.0 upstream to fix CVES.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...Handle-case-where-path-count-is-zero.patch | 75 +++++++++++++++++++
 .../0001-Initialize-coordinates-to-zero.patch | 45 +++++++++++
 ...Restrict-builtins-for-ImageMath.eval.patch | 60 +++++++++++++++
 .../python/python3-pillow_8.2.0.bb            |  3 +
 4 files changed, 183 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
new file mode 100644
index 000000000..26b741f9c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
@@ -0,0 +1,75 @@
+From c48271ab354db49cdbd740bc45e13be4f0f7993c Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Mon, 6 Dec 2021 22:25:14 +1100
+Subject: [PATCH] Handle case where path count is zero
+
+CVE: CVE-2022-22816
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5920/commits/c48271ab354db49cdbd740bc45e13be4f0f7993c)
+
+---
+ Tests/test_imagepath.py |  1 +
+ src/path.c              | 33 +++++++++++++++++++--------------
+ 2 files changed, 20 insertions(+), 14 deletions(-)
+
+diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
+index cd850bb1..b18271cc 100644
+--- a/Tests/test_imagepath.py
++++ b/Tests/test_imagepath.py
+@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
+     [
+         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
+         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
++        (0, (0.0, 0.0, 0.0, 0.0)),
+         (1, (0.0, 0.0, 0.0, 0.0)),
+     ],
+ )
+diff --git a/src/path.c b/src/path.c
+index 64c767cb..dea274ee 100644
+--- a/src/path.c
++++ b/src/path.c
+@@ -327,21 +327,26 @@ path_getbbox(PyPathObject *self, PyObject *args) {
+ 
+     xy = self->xy;
+ 
+-    x0 = x1 = xy[0];
+-    y0 = y1 = xy[1];
++    if (self->count == 0) {
++        x0 = x1 = 0;
++        y0 = y1 = 0;
++    } else {
++        x0 = x1 = xy[0];
++        y0 = y1 = xy[1];
+ 
+-    for (i = 1; i < self->count; i++) {
+-        if (xy[i + i] < x0) {
+-            x0 = xy[i + i];
+-        }
+-        if (xy[i + i] > x1) {
+-            x1 = xy[i + i];
+-        }
+-        if (xy[i + i + 1] < y0) {
+-            y0 = xy[i + i + 1];
+-        }
+-        if (xy[i + i + 1] > y1) {
+-            y1 = xy[i + i + 1];
++        for (i = 1; i < self->count; i++) {
++            if (xy[i + i] < x0) {
++                x0 = xy[i + i];
++            }
++            if (xy[i + i] > x1) {
++                x1 = xy[i + i];
++            }
++            if (xy[i + i + 1] < y0) {
++                y0 = xy[i + i + 1];
++            }
++            if (xy[i + i + 1] > y1) {
++                y1 = xy[i + i + 1];
++            }
+         }
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
new file mode 100644
index 000000000..758531f67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
@@ -0,0 +1,45 @@
+From 1e092419b6806495c683043ab3feb6ce264f3b9c Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Mon, 6 Dec 2021 22:24:19 +1100
+Subject: [PATCH] Initialize coordinates to zero
+
+CVE: CVE-2022-22815
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5920/commits/1e092419b6806495c683043ab3feb6ce264f3b9c)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ Tests/test_imagepath.py | 1 +
+ src/path.c              | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
+index 0835fdb4..cd850bb1 100644
+--- a/Tests/test_imagepath.py
++++ b/Tests/test_imagepath.py
+@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
+     [
+         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
+         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
++        (1, (0.0, 0.0, 0.0, 0.0)),
+     ],
+ )
+ def test_getbbox(coords, expected):
+diff --git a/src/path.c b/src/path.c
+index 4764c58a..64c767cb 100644
+--- a/src/path.c
++++ b/src/path.c
+@@ -57,7 +57,7 @@ alloc_array(Py_ssize_t count) {
+     if ((unsigned long long)count > (SIZE_MAX / (2 * sizeof(double))) - 1) {
+         return ImagingError_MemoryError();
+     }
+-    xy = malloc(2 * count * sizeof(double) + 1);
++    xy = calloc(2 * count * sizeof(double) + 1, sizeof(double));
+     if (!xy) {
+         ImagingError_MemoryError();
+     }
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
new file mode 100644
index 000000000..4c266cc41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
@@ -0,0 +1,60 @@
+From 8531b01d6cdf0b70f256f93092caa2a5d91afc11 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sun, 2 Jan 2022 17:23:49 +1100
+Subject: [PATCH] Restrict builtins for ImageMath.eval
+
+CVE: CVE-2022-22817
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5923/commits/8531b01d6cdf0b70f256f93092caa2a5d91afc11)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ Tests/test_imagemath.py     | 7 +++++++
+ src/PIL/ImageMath.py        | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index e7afd1ab..25811aa8 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -1,3 +1,5 @@
++import pytest
++
+ from PIL import Image, ImageMath
+ 
+ 
+@@ -50,6 +52,11 @@ def test_ops():
+     assert pixel(ImageMath.eval("float(B)**33", images)) == "F 8589934592.0"
+ 
+ 
++def test_prevent_exec():
++    with pytest.raises(ValueError):
++        ImageMath.eval("exec('pass')")
++
++
+ def test_logical():
+     assert pixel(ImageMath.eval("not A", images)) == 0
+     assert pixel(ImageMath.eval("A and B", images)) == "L 2"
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 7f9c88e1..06bea800 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -246,7 +246,12 @@ def eval(expression, _dict={}, **kw):
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+ 
+-    out = builtins.eval(expression, args)
++    code = compile(expression, "<string>", "eval")
++    for name in code.co_names:
++        if name not in args and name != "abs":
++            raise ValueError(f"'{name}' not allowed")
++
++    out = builtins.eval(expression, {"__builtins": {"abs": abs}}, args)
+     try:
+         return out.im
+     except AttributeError:
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index 8279544a8..4393d9356 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x;protocol=https
            file://0001-Limit-sprintf-modes-to-10-characters.patch \
            file://0001-Use-snprintf-instead-of-sprintf.patch \
            file://0001-Raise-ValueError-if-color-specifier-is-too-long.patch \
+           file://0001-Initialize-coordinates-to-zero.patch \
+           file://0001-Handle-case-where-path-count-is-zero.patch \
+           file://0001-Restrict-builtins-for-ImageMath.eval.patch \
 "
 SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
-- 
2.33.0


