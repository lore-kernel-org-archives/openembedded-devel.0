Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C31C3527B
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3247.1649310417398773789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 22:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rrmMxZtV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1096d98c70=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2375bd7c013329
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Apr 2022 05:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=t/fl5z5nLtYAcOxXo7Ug+ccdHKu9CWre0Bdl/s01XgU=;
 b=rrmMxZtVtkq0BLurMjW5ahdXtkzVtsPrQQDvsILMybYn6qc5WLsjs1GXV0jbHiFjirNG
 YyajzMedSqS/ewJp3jlEV6N8S/l5jhHvda8pC5t0edBmmzs+AVIO9ApdK1ZoLbAOmA+Y
 Ph8Feq00eOHOuj1Xh66ZFSrucBDStxHFtZECRP/vZRUuwGlg8ujDpd00HXK4oYErT+jA
 qS0Uszx1Sl82hPPRzoS8xfChlOcs8dnQc5FV0Sa3aXLX2ZYrWgzTvfKT9wqyQSmJYetQ
 jn/C5YKvzoXaspZZ46qYkYvWb/UaHxVRh9SIOSTwyMQbjB5TfwpJnj0gn2yIns5AbpoS HQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6df8uyt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 05:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeP7U38wSn2bHB23kZIl4e/yVBzONqbgjRLGyVjecgrDxp0VuTuDJmmUOw4dDc30uZXs0nPJ2e/w9qf/cV5ArL44BoKWpUxX2g+/ZVVIjBop4Vhpep2ywxM4zt0yR6yFF1HqUqJksp39TEb5agr0FlXvZDdI4uodwGTPfr5hxtvh09eZ8dGcUJqhbRKEZHR3eO9GFFcTJ6DG7iZ1KxEdaW5mUXJ65rHRaZUz2i0Ifqjqv9bnjnnEHYDl0qS6EOtD6isPPO2WE0jTWVd3xZjCtyXOHqhIC4mgrMPdwnP19h3G0QZBqG/8uIHf+vAmrSgdIOElI15dbTImEu07MNGC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/fl5z5nLtYAcOxXo7Ug+ccdHKu9CWre0Bdl/s01XgU=;
 b=Gic7y4koKODCm2VGnP5KF+4Ulr+tG0I6V49rZYnLTuHFRJ713/s3raaeQKXdAIDuOG9s8Zhh3UAEgOwM0zMVt9vuL2rs+1+3Ri+tYtB85J90jRb4N7Xrhl5MZQSRC5YTVmuicHpxiu5DAS6N6lRtO6TlWdboAX0nw7PwDSNMlMtZgYAw1rKIeEA8yzUTO6fu7TdsHWjqA3rHo9mmWHcXRMHHz1zon2fOor28sdh7KJvjJzmdvoe1A4/wnhVlO/ePpfMypAJ+NzTBrZeBFh1/rgenjWECd7uUrRSsO630RXkU2UQE3od5A37g0LkgCN+CmFdmKHwcq+lG1gRCu63ZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 05:46:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%9]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 05:46:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.3.2 -> 2.3.3
Date: Thu,  7 Apr 2022 13:46:39 +0800
Message-Id: <20220407054640.879122-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 888b5f1a-32ab-46a6-c62a-08da185a0409
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5816:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB581640EF14A5A14F4FF57BFCF9E69@SJ0PR11MB5816.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HCQBsEajAq6vPJ+Y+/OhqgYxbB3DTGPomTM2i7t06jkerXjj1/ZWid8LZQcigkv7oy9wgufuD2FnLd0wtXW03qFEyaEebxaaEFCCs6mDmlGGNOLDoHxzGqunfjGgHRNjTpKqIsUhwnBqBQeN0lJcsA4i/Cu3GXW38FGFhFXEzTnGBdH6gVcIihk48jG8427h3eAryzCzFd3kBybYMSi2d+mw5L5+v3xURZcBUsFZIRdOZo/89TF6Ho2qcXpZzKRjkpPMzuyM8PzrPErnBLTjTol23n7h7BXddScKhLChpmbDr82CMQI8XvdFZlH9QQTxrbMEMqhOM5vzRrbnb3zksgqy247Q9MPFYsX1bKZqmvavAzpPCdZEiopif08kltU75Zluj2lLz68DFVyZk3O/zggsjKyKUKPwstU+GgK2qqAnc9P8Eqd7ABI4KYNi4pFiVDj3lb1omV40vpubzgg3BWMkgDDxS81IYeO8344hGyUEIm18A6qFjmQurcB+294pfpuBsgIo31h/Bn5jXlvRai+WDMP2UcJH8jYE2iGW/rX8GovZCo+hbP8x1oYZLqYrQDpSYYfSNZDWl0BYI4WOLajW33gWK+mw8zNvNnGvogKWlS6zMX1p47ma6c1XdFgZFuGy0Q1GoLYqYtTd9YTUDN95vE0saocAEPaAurs4GK9jbFDE3yBB6v+rlToUZPHTgVs/yr8rAmDOK9w/AD6U2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(316002)(86362001)(2616005)(52116002)(6486002)(6666004)(508600001)(6916009)(2906002)(38100700002)(6512007)(38350700002)(36756003)(66556008)(83380400001)(186003)(8676002)(8936002)(1076003)(66476007)(26005)(5660300002)(66946007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FlwYMzd2y7EJFFXm3ozsKLbGxJS0SBJxZEwAIeWOqvhuLxQrVnsXHFtVEX5Y?=
 =?us-ascii?Q?+x8DNLm3i75P6UXcQbjN75ZVIsNV8qIX93Ygnt6/xO6qk3K0NnqN3VDw7nXX?=
 =?us-ascii?Q?FwLz7ripCePhCfhRt/H1OTcNYBiAIh73NbCMuzNLTS1Fk+shxz3NwDeJJU0i?=
 =?us-ascii?Q?l/fewg9qfSEwOSuiWcwhCVBCM9jzYZTwQeDpqQ2zIBsYBIFynmoByVcQppdN?=
 =?us-ascii?Q?5QfUhauyKxa48xfFwZs1YN5yT2Ey2MrFpgAZ6HSZ/Nlnu13yLfhs3bn39Lgb?=
 =?us-ascii?Q?+5UPeHfssC2Vp1QGxD7FaCKpxKTeI+TlDdMvzudnv+s2PbL3yzW6O4150sA3?=
 =?us-ascii?Q?zRLzYe8Cy9PJZFOoIE3E7OBK83CE83U0N8SY2tqy9uDKGPHGpsR2C/Hmv5aC?=
 =?us-ascii?Q?rgz6Sl1nKrho5ESoV1JU95S2pKYt14T7ZHhI5ZLcGi1qhpkIZcNQ92Jg25+n?=
 =?us-ascii?Q?g8EJiXdl24P+9ngq+zrnuC1eB4xymPm0O8P004gUwO54okAuCD/L1HbXSBA4?=
 =?us-ascii?Q?ssy94Gv3ZnfLH/AIAbbi6bf5Kw3/eihRpEcmVCVnCPJ28r8nDWY3n9XoTTDT?=
 =?us-ascii?Q?fWbx35EretthHlOg1ljEyya+GbJ8/O9df3VlUQc5nRB7g+ri1RUWCunjDW9z?=
 =?us-ascii?Q?CCN1CSO4BYlEnkAQQS/i+8pedqhlGXr0/sYXNLt0NLXJZ0oEiSTojM0gwdHm?=
 =?us-ascii?Q?2QI4Y21zak4MK3mNDema4ooLiR8NEXzioa6k+/aUoa0CMpXAu2ihcMJaFi6G?=
 =?us-ascii?Q?bHkXRNv5Kvv4ap5/YPkmI/LvNnMvM6K7o+wyjuSxSLhOt+sdU3qU0zA9hKEu?=
 =?us-ascii?Q?7aRCYxVrX+38f9whDWzRpJGyZKiXuY5krBpKYAKMoLi46lbd5b6KcpL4pcZb?=
 =?us-ascii?Q?j65vRPn41+yzzqMue43D+P6TTOSHjgBrOe9etCzFXdEplDgN+W+8RLdxG6SG?=
 =?us-ascii?Q?txdnMnF+mq/b/w5y9eKirkNPgyqTktxAq0hMZT1TIfb7eIXNVO2uOEycCNkO?=
 =?us-ascii?Q?FvJ1hSconP7E8s8CJSmVUknMEKejcYrallWvedzL1F2GgkUXI49vlvanurvy?=
 =?us-ascii?Q?B8IHiSls1ND8DW7oxRJdoStNQIZ8gq1I0HnpAqxSQA6iFXqDBN4WYhP7T02V?=
 =?us-ascii?Q?2a42/nX8QdL4g6JgMaWYjI5A4RbjPlfCzJWU5kaZhrnGwBxZ0dnPpJsUd4hv?=
 =?us-ascii?Q?GW6/h4CUh/Ym2YSdC189GRSVxDJmort8F8aFHHc+F09dttMwo62b5yLQGdVM?=
 =?us-ascii?Q?2w89fcnZ7UyMCtwgF3DB8i8RZo2mxwvF7A7p+Sg4+M5B4F79xwF1DhYVuuLA?=
 =?us-ascii?Q?90fhI361EJUZgbAQ0C6sZudAwqZmU3inv0Phvhb8bgd632oKS1mKtKDiEfqJ?=
 =?us-ascii?Q?J328qAYW2DSuZH7JgvXrJ05lBg7id+sEHMvHp7/Ps60szKYoUr7+9pMsYngn?=
 =?us-ascii?Q?fx1IM5YwsIw6XqWWxWkdZR2Uel5Zni70tK3LEGClz1VtR//AYS4hxGXcpWS+?=
 =?us-ascii?Q?bLAdbjHqvGCEJ6uTGEOBiosx2JseNpVzWJ2X31z7wDflq/fQQTiUQaNt611m?=
 =?us-ascii?Q?dbfvDOIYnKoHGqHEmaBL5Oi+3G+E2r5OoMuQzmTHEPtDz4I4vSICByOvyyZK?=
 =?us-ascii?Q?T3X6GtaXZu7TXhO4tYd0GQa0+WJbblnEUFBExWk7WTuGfjZqoUfQb0opbGk0?=
 =?us-ascii?Q?/bvWSd9fkn1hmavUA2nv9IjN0VDpeonUlrfWvS05Gc9QgNB480Tr84l5dJNw?=
 =?us-ascii?Q?gMPaHgrDoQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 888b5f1a-32ab-46a6-c62a-08da185a0409
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 05:46:52.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iNt0VvatGGdNgNFGNOV0lKp51kDNUnzpmh1uGAyhzqrv7PjU4YEh2C6PhHlmN2YI9YkPt8/abbEKVR0RWLoSeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-Proofpoint-GUID: s4jA7EEyDbcQwbVpqWq5-qZD3Js2b0Fq
X-Proofpoint-ORIG-GUID: s4jA7EEyDbcQwbVpqWq5-qZD3Js2b0Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=758 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204070030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96444

Required by samba 4.14.13.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.3.2.bb => libldb_2.3.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.2.bb => libldb_2.3.3.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.3.2.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.3.bb
index a9c6794bf..c46a9784e 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
@@ -32,8 +32,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "650a05f8a2b2e6455f590dc815a71879"
-SRC_URI[sha256sum] = "1416c949dc4326e41c0d8a5ecf8ef784f8c0b6e9d3dad8fa971e84ad56227603"
+SRC_URI[md5sum] = "6824f69ea3bb58cb8a3be4c179e7569a"
+SRC_URI[sha256sum] = "9ef39700ff05b3e8f5801d2a39fe1ba023218650f81c9d377caca22f49076807"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


