Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFD0C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:32:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2345.1642210351381864300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E6vVPlWq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80145bf932=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F1W6gT025495
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 01:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=yBLiAzzY1Z1hkH4ZHIJq2KstRaJOKQnaROqjb/9Td8M=;
 b=E6vVPlWqSiOQguvWrbYsJ/Oq4yzTGAp2fycW1xsXwdWN4jsiqnyTTjjOEn5rcXD2psHU
 9Wd5R1nykV6EhDtSZmkmqWc2I9ecniYN5fBUxB7oN97uj2ZMvUZB5dFHiKlPzjeHTpU7
 Ve20GQhR8EviSPuTg9pRPorrJXk6zeFwsp3I63rpDN2MEu1I85gwIEFrm7opVGXmOQ39
 uO2bGwBDMu8ToDX+fJwMW09RIIw5r3VyjHI6RdWDlVMoCmVSVSwq6RVH/xiWtuViS3xW
 Qv/+w2nUxIf+34kdB5dxkQXYEnP2ldeZqbY9jicZLcJ0dWaFdHX1cDDJLQenqhR5WoZ+ 9w==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dka9jgey9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 01:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjfim+Ml7ghnwyXInd8tPpF45xphlQr4ijvboTtPDN7/HR1GBqXTgxXkakDpj7DLQJzl57gJsgE2TtvWle58JWUdkvQNDhfyLTxYO+PQlN6UIaMfvOceZIKBYmZu/HJkwNSOlLlrC9V1DD5t1T0gXPfjMwPns1WFEHG5z5moO1daEQudwr0RFeCK5RbNUpTr+Hp2X2A0/M9pF5kP5qzd0s52zovz358+ZO6O3WaOj82FWS2p4J+T8oZcGmfW18foOtTDOGiw4x9ODXFB569dbKRw9r2+5BqWIJ9mgMxE/CtO2df6o/S94xgR+nmC74bY6ZJVHhBQ62iMXJb2Q5IKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBLiAzzY1Z1hkH4ZHIJq2KstRaJOKQnaROqjb/9Td8M=;
 b=cbp6TQVMQg/z+MpIfDk0jj9vQxl0t2QJgwg3th/OnFlrpJfyN8XjWJ/Q5EB9+22Q65jJXvb4OmZiu2WVJEtHbIoyj4IQvWUSZQtUa7fsXx+vm/Q5lZ6aljoBh1pfR53vh8yK+y7qwUH7LKF5081AQHdiyLhZZNrTKjECkZb+ufCuX0y9KhpWfOxbxCIRsBr0X5Lk+fbralbc6zLhA75czGpV8IJmt5mJULvYbXlyePDCQNK3eX7SyRm/BjBF5j99dSmA0OF9W/bdXc2rjLZf9mEJlvSngkDvKlmkt79vgkCBbF7Musv2XTYc64aOFcu+MuR4eu8e6Vtpdf8RzbUPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN2PR11MB4270.namprd11.prod.outlook.com (2603:10b6:208:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sat, 15 Jan
 2022 01:32:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%5]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 01:32:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tree: upgrade 2.0.0 -> 2.0.1
Date: Sat, 15 Jan 2022 09:32:15 +0800
Message-Id: <20220115013215.332593-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220115013215.332593-1-yi.zhao@windriver.com>
References: <20220115013215.332593-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47a7959a-8f36-4fcf-b2f6-08d9d7c6e37a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4270:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4270DA93959E524C97073170F9559@MN2PR11MB4270.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KaSMMMNsV9Ja2c45byKqDZKCwn6DpCfsS2EhBILr+6L2QwGfmiagFbkZXjgrFOwB2x66feQh2/Dzvos1eoSIf6qzRZNj2Paxl/VkXZP5ue+FHOR/0i9Rn1fpDdCcky6ykg87xHgXBANgjHNyFScOZCC9FXxkVF+HhN0Hj8fVDf9DAxDnadTsmo0OHLTRs36JHx9ZJ2WVix1eS3qhiPM6JNlJJeZwerBIc6yklLKbm/mrCvCC8j7+9dSCiZ4A1DFr6OUmDWPnP90ZykYKuAezKZYzbJIMLwKnDh7/IFeAAonwQKu96YJq/yK0pnQ9zHnR5hFPtcKxz2qCzpAK7gNys9ueqWx3+HEC87h5KuUXtXnx0xYcp649/YYr1pL0vs4zaqyk8s9nmpv8TP9tooS/siX51dOYKCTMYGU4f+8tSlDEckMnVfjAR163WGMHcCOE29ySz9x3OATDQLMGRt+MYsrG8Y/nqHKXWfSF2YZxRV7+VwQmDGzNpKMU2XrJkBTYaTKm7gTng1YSQqC6vrDxlymP8Cj2coB/b0fj5z2WBV9w2BKuYFRmOzxcszOwolA2Q+LSo7whsOFzCE+iVJ+bsHT1IykUC0hgiSsc+1UvwecXWgYu5ORrshAdbResyaK/+Rq2jzBayTEVnAqEnKCc8dqz4nf3as2kzOgNcLIXZeOI1DtCqC8Y3wLG7rbQEnsu93/k2XgRe4oR7YNGlwvdyj7X4OvRotLWceXyPkh++EBpjccbrAXZxCWdHEgDpyc1NX/S14EuqYnvEIY1ICpG6gyA1KmExjIYayCSGbHZkjg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(5660300002)(36756003)(83380400001)(8936002)(508600001)(1076003)(8676002)(66946007)(6916009)(26005)(6506007)(316002)(6486002)(2906002)(44832011)(86362001)(6666004)(186003)(66556008)(6512007)(52116002)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jIxQ+7D5CU6RyjikQh/jLQf1Li2jQ9xrO6xfGJrTNhF+l3tEQYmyl11NfylN?=
 =?us-ascii?Q?l9LicDGnAWtyyWWtZ0vl11t2U8MT9KQ7xcv3tZuz32RLcXlI3HKVM7Fd/s4E?=
 =?us-ascii?Q?Tm2GNWnzWYQh+ooo1M4aIj+tILUyLa2kniptvMQgbq4wZ4psgNqnOSw0Ze2m?=
 =?us-ascii?Q?axs7f9dbuz8Jj3uzXFKPpZdC5/p8sc8vo2tLw+Z2yntijRY59LSVZAExpuV9?=
 =?us-ascii?Q?qA2DR/9mJeej+b0cSjSW5BTI18grVhc+L1c7PKEapx6XTRDT7bjwFT2dRYGH?=
 =?us-ascii?Q?h31DMhEJd4VEyG07W5InFWil0TTsoLk3rx1euypRAua6WTcU0ujZ4BQZYi9b?=
 =?us-ascii?Q?cJ4GLq2O4C8E67E0NyhJI2fVT0jQjVqO8I1Jnflm6bZIx7qShpqD0aJEgeLu?=
 =?us-ascii?Q?sKjkF+bnxJiR91o5KHSfZ9SFjGdlmZkcHBqENyxnLcWp9hfgYz8FgQHhey4z?=
 =?us-ascii?Q?fjGo0hYJnAE83VQTPyQzppoVMXw7j6RBuOZDMa/FcrBSO2XKdODeJ1jPVljq?=
 =?us-ascii?Q?wdboZwTRoXAKCm2nfyQWdKLXz3EKMgD8PqEWcDdXfG+V9vyHZFEQ9GpG9zhg?=
 =?us-ascii?Q?ocd1PfMG5EMrXttau9Jdtdt+Fj4yq63dwTLxrrr60f5rMhlafXNDeZ9tMOya?=
 =?us-ascii?Q?jpm2k3eyEsXSOCIBb3GYxLfzqvK5OiSAVCl7Yfn/ZvDz7Epi+w2XkRplL7hL?=
 =?us-ascii?Q?j3rOJGtDEoqI7aQS0mp8oRcOsJy8g2k+c4t9S5CbUh2MPaYFX4N636LKF/wO?=
 =?us-ascii?Q?vdLZmYwgqAf8MFE0Ku+WoBuXXY9WqSB/vxCXRWBByJyEQdNh01A3mvOUxLRK?=
 =?us-ascii?Q?s7Z9q0kA2jqQPtNT6PTexYQD1RSlDw98yWUkO6vHvC1TAuTvIo28vocU/UhK?=
 =?us-ascii?Q?MuvMQxsrXgcUqhEIM+kJkhaDBuzqydtAvzcPTOBOeNOirka/pcnrWytRGPIa?=
 =?us-ascii?Q?COqCDw02ZywOle2b9/tHwwOa+r51BCOCzekaf4jI5pfWKKlSxfLwovByTHUg?=
 =?us-ascii?Q?JFxwsL0f5Q8Kdwu5/35HjjKdejx4aYwzx9I9f8caSb2Cx1g81gIizEL2TOy/?=
 =?us-ascii?Q?PNyVdrQvovaAz1NGzk6maF2FKiUjMQRakdj+Q+qK0q4PVkm873R1ZldvSNcL?=
 =?us-ascii?Q?Xn2aaG31UIzm5Wbkc0b/gk6w7oudSYRMS4Yo7AvvloyQ1aWQ/9SiJjHZrPzV?=
 =?us-ascii?Q?vJcCdODh4L5imME3v/gKzuh3xt7MisPW65d7SpUzCwQ5CTUwwwBrB8q1vIS7?=
 =?us-ascii?Q?5X8Wp+jAOmRJHRvnEvlYAHou22E11wrngqkmR6QA0IiEvRc0E6xpwv4W32Zb?=
 =?us-ascii?Q?BE/kcC82jisk3FppeVWLiqZbABVwE54sgXFfsiyUZ86C44+JWA9S62GfR5vb?=
 =?us-ascii?Q?GrYgFzUsvOYD01vEGxtXWHd/xrHKN+BEoKE1kfyQxJ15IiLfb3vxNgodwXLF?=
 =?us-ascii?Q?DesHdQC415McIiiQaDWK+tN+ct1I+tHMbXQhf9b3oksfPS/e4FFwMJ/eMY7L?=
 =?us-ascii?Q?eXv9Hye8czbyBeDx1rZSBdJVdJep+5mbRbrtmEQPvHpJG2wDKejsuFcE8MtZ?=
 =?us-ascii?Q?oCsN1pBYzwCZQBwQRY1kgV39c9/GoUTIkxXkOC25UeR9a+eMJMZYIXveANwd?=
 =?us-ascii?Q?lefgC8v6LkxhcjPY4ewp+s4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 47a7959a-8f36-4fcf-b2f6-08d9d7c6e37a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 01:32:27.0695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IFhLdjySvlZ+6y9G5c85SGv2SkQUTbRNWP3p7GZ+RC8+KHey0PODWkw1i5wkqtvIv+gBGyxBYBKjyoKgP+mFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4270
X-Proofpoint-ORIG-GUID: qBe0VpjUtRIedH0KyBT92dfeG0YaOpcj
X-Proofpoint-GUID: qBe0VpjUtRIedH0KyBT92dfeG0YaOpcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=16 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201150004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 01:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94850

Version 2.0.1 (01/03/2022)
  - Simplify Makefile and the following changes: prefix -> PREFIX,
    BINDIR -> DESTDIR, -O4 -> -O3, mode 644 for man page installation
    (Michal Vasilek)
  - Make patterns ending in '/' match directories (but not files) for -I / -P
    (Michiel Beijen) should also fix issues with --gitignore as well
    (Taylor Faubion)
  - Fix --gitignore not matching files relative to the path of the .gitignore
    (Taylor Faubion)  I did say it was hacked together.
  - Refactored color.c a bit to simplify the code as a prelude to meta coloring.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.0.bb => tree_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.0.bb => tree_2.0.1.bb} (86%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.0.bb b/meta-oe/recipes-support/tree/tree_2.0.1.bb
similarity index 86%
rename from meta-oe/recipes-support/tree/tree_2.0.0.bb
rename to meta-oe/recipes-support/tree/tree_2.0.1.bb
index 257adfb42..9e1e787f1 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.0.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "782cd73179f65cfca7f29326f1511306e49e9b11d5b861daa57e13fd7262889f"
+SRC_URI[sha256sum] = "e3339c5a194cf6b4080f15ec59faa3679f02d5a793b2147912fbfcfb4cdf2239"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


