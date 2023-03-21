Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D0CC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 06:47:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6901.1679381258782816129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 23:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=K50DTGkR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444130f12=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L5mlVw032583
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 23:47:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6TT7u9Q03DyYpi4gW9b44v+nRDwl7I4wWClpx07ga7k=;
 b=K50DTGkRhgu/JJR1L99TrINaMhqDOo26PajxqEh5W3ujvYQv2+KGBfuMGLp69TfFkwWt
 7NMFMqq2U9LD4PmdyfSP9nuSi0nSpty3TLpwpwjiwq+dGTEOBp/jsoWciDCZ7Snq+m/X
 KagCmYp0n1O8NQT0hSfTCvf4nA56mZBumYuHT6iWNzCt7Ar+Si1BIugaEWAlry9i68v7
 i4A8BiRasblTZ9oTweCK5gbk3CSNXPdqWNWd7B9zOqS/kxr98lyUwaktJaXt8Y2jqk0i
 4t6fr2n69UGOwFPuB+gQj9/PEjlYejTy9efEd/Mfu7XTOLHa5vICetGktakZfHMKEa5/ /w== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4tj27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 23:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULK+DjSQcPqattMgCeCPQWLt4FCrRYLjNf9cW++KYx7IJP/YFYBCHHVFVyQeH9zv3+4Hio8u1wCUqgQHDs+mXwq8J+4KHzCEJ0ZCY+yfmGxN/Wko0qkkA/sA6HNuv52Ow7kTCu1EZg0XguL0cNtlsvyvUBC92Ap6iAI+Jm1ujuw7COc9fDL4utNCS9CEK28d95NhSv56bMWYM40Iko/ZaqlZy6BgBa3683677o3MCOfz0NtR6wXbH+G7OAsQB15nlK3hWYoD6Ygat5vLGdPrNJk+0rpC9ffIdSwOLdxl+Kq3GHI5iq/0Oti6YQ13TI6vSapFz4njjQQPWWHxtkFbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TT7u9Q03DyYpi4gW9b44v+nRDwl7I4wWClpx07ga7k=;
 b=G80dahwOAeu9fkAHrFdbWbicd1gXDTcj9nNRZn2O+AWuE24z8i9XfCYgAP4NFQkuhEsj/eUqZyEMsN+l0WOBMFqqCT553A6HIxOG30TjwyNbrG8sY1d/TZYxLhixdEbNF+PJCzQ+LgLr77a+r0BPErOANKN3pZEWd40ComNSt7mf/pHGAiUJUT3CQbXZ4+52yCzeKZSDlLn0YvV9K1fsSuc6QfWomPBOcnlsKjWuT0kSySuS0YWZcWRwPVFOaET1YN9Vf6sJSEH+PA3s+Y7sv625wO6t12i19cbctvJWczcgoGXh7kNjlGraRtQMii+IvHQOfVTPs2z5QXL2gkw3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN9PR11MB5547.namprd11.prod.outlook.com (2603:10b6:408:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 06:47:36 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 06:47:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][meta-networking][PATCH] mbedtls: upgrade 2.28.0 -> 2.28.2
Date: Tue, 21 Mar 2023 14:47:22 +0800
Message-Id: <20230321064722.1994681-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BN9PR11MB5547:EE_
X-MS-Office365-Filtering-Correlation-Id: c772d038-f16c-468a-509f-08db29d827ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KSCH3SxgpHsTSGYi+RfWjneFa3ocRpRy3NNIqZE0Z64irfKaxud49Aonp0rpSv1gMK3unuFOVsXqtyDovcyGVfF7pbybJtJZ3U37WTs/7Rgz/LzroOnr9u7mjAGxLFxIkCwuNUftlhczHU8Mx9Vf2H7x4EvzvB2CBNU/acSGGC55LyY7t1ubWLZSfdDbdltzR3Tg6pv365Jxd9Vw33EubVfxG97VH5A1S4XMVKPO+Yq7e1OjVcrXRHL8AlVQJy0+jabGbYjkIcZ5ID96GCgDajMciuQO48WCHr5MRz/2cHFy6KEgf5zcSwBmjVH7Q4PxyICZQLAJ3QiOT9GTBgOoZukvHASGRJvBxI3RT+O0ad4+RiTJB8vA1VLlj4E79Z52nhse2jopxPtOASVXWEGuU6kgIc2AZ4R2S8w6YhMe/IwQaVjF9/gt2shvh5DgNnndxubpCM9UXknE1qhc0jjq5gDnBSWUbFgh4eUGEANvUjOo9HsRQrnj7J1jWismscrRCQMktGgB0iBKuWHQPBad3nArwLdVfgh+/YScdU0CUnCUW0yUtt7lk7MOM01SDevZNJScGXRiRy2smTLoNcJqALl5QRQ2Ytj50vY4dfi+pygVhynzNafScTupQm2QYPiaucwynUI7n4PkwQ22NYbCj136g0rxiRJYBAbTQ/gp2S1OBsqtv0dOqGQXjq+g8d8uZI6y5R5PjNnPR8qBOgjL789bmxrLwHT6DFL9dk18q1I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(8936002)(5660300002)(44832011)(41300700001)(36756003)(86362001)(38350700002)(38100700002)(2906002)(6486002)(966005)(186003)(83380400001)(6666004)(478600001)(2616005)(52116002)(6506007)(6512007)(1076003)(26005)(316002)(66946007)(8676002)(66476007)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RcQCYLBIZGoMTilaOFCC+HZlueY1vQbxcd6ynzFoIWWzQY5nXE2fi2nc3RZO?=
 =?us-ascii?Q?Xs+fbeDsdFQrFSNckpcsTfI2J3dl3coAKrM34KxkhKS7CinK5VHTeq205Ysq?=
 =?us-ascii?Q?qKDv/dU2vuSxs9d09qX1jlm6XoHSkB/3DoV8LFq6Bz1KyMfAyI1AcR1RVY7N?=
 =?us-ascii?Q?YZ9l1yJswRCL/ajArtNa3H2KcY16RIZlmwo1/jDk5+ekRPckVNtju9qypP3n?=
 =?us-ascii?Q?XyEg4mm/41LT3ecrVySErp2q9T8GnzNBxUMozyQilnt+Lyh+zhkNC07qC7TC?=
 =?us-ascii?Q?942zcwh48LBQxXTM8THKcBfpaKTEPc5YetorKfCQG+1o8rU/gq0K/z5UXMCw?=
 =?us-ascii?Q?G+thBwZMv1OWTeiaWmi9rBmQYxJyqzeDlYaUVIeYwKCDJEJqdBF4z7d2JobW?=
 =?us-ascii?Q?89LedrjPAfHb4BXugb38y1TJtdC07u/plf3Scy+ik8/RVBdr4+H8XflL1TPP?=
 =?us-ascii?Q?DoSiscU6iwSxJNXgdBK6HnkjLEs8ov9f+jLT2MdfwSnqjPwp4lxND+9JIgiS?=
 =?us-ascii?Q?Z8fSC7UdmI54/oGeCGqoHgghF2/Bzr0kD7Bh5KzcPcoBFTTaeRbghLgDg8tM?=
 =?us-ascii?Q?4R82RiA9T7seyll5T4uFlHjQwMvcORTrEJ6WRbmXDkW0bKjpeWYNIJvsP5ID?=
 =?us-ascii?Q?Y92wkpx4Q/6NlsrkQ0gToOEIRXrJf2adXHZg38Dx20il6CxqlDMyVEplHlfh?=
 =?us-ascii?Q?zBPyrcAkKriglz6JTmyQLNequt3TpH205oM3xwNZpiInuvAv3wr+bWsF8zR6?=
 =?us-ascii?Q?qWCdybZ9MNgywSc7imF+5gy/loMZpUtj7QJdWwT7wxA+8m5PnN0b+2aIkFyD?=
 =?us-ascii?Q?3NNpwR6YITnCBK/3T/68UCyps/Ok/YtwXlfVS+rgadA6Fu/JmeImGJEQAp9O?=
 =?us-ascii?Q?7aGQgkJ8eOwBpTi/Gv6cBosxESZ3Zllf/Ed+lcQP68t00JLrC9xtG3VAhk1n?=
 =?us-ascii?Q?TBJt9Anyicj9a/wigmCsyA3YlApy9ihWnWwgotnkFA5iSv6YLUAtVqWFDnZQ?=
 =?us-ascii?Q?TDbdKRyGvkFQ0FNgFLGPKfIBVIdPm1h4s9kyxF0n1g5Td5E+y9nWwnuLPDpD?=
 =?us-ascii?Q?0BtbvcSgHuagNPnAv2GN/mqBGtBRYCyihOCRgWRjBQisWKnWk0JLLs9EC2ri?=
 =?us-ascii?Q?y3xHPzfACVNp991nrzWZsjqA375lf7FNEc4PnQjGXrl6jmJVgtrCdpIrAqog?=
 =?us-ascii?Q?pJyf5O9AJhLbjyZbqBYcSlVUKXZTlQtt8rBK/6cgANSPFEqX3bHY6U4iDx63?=
 =?us-ascii?Q?hbx4UL8lT95744QDyp689IZAPTNY1pu/xrZpVF3GS/BeuvMBTeBNuvdp4i5I?=
 =?us-ascii?Q?8679jrC+tdw5FnDr8u2k87odyGxXkAIPMyafh4AEb9wBrPFenePNAqIvDzut?=
 =?us-ascii?Q?I+q/eeVipjpLoUGUI7kag+1cmGx+NViQDC8h0ZEBvbEw6mUDWfB9RlgkhLoJ?=
 =?us-ascii?Q?dG4jCJMUylyjAxgZvsDuP8qv93wMHNYl1aekzaK/+w/dUXR6I61850xfTQOY?=
 =?us-ascii?Q?kklQLN59g1kziDvB67DF1D2xJ3WT5D9yDeP0um9M8eG/wuY9PdiQszCAEjrV?=
 =?us-ascii?Q?lmwViUK1KdafKsPR8GsEcjRd/jwZuCUqZ699Yr2CApn/5T4sm7kyFG+QJZkU?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c772d038-f16c-468a-509f-08db29d827ad
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 06:47:36.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBd2V+xc1yKdFG5C5GSWJcuhCedIMwK3/fWZm7fa+rMza2/PqLa67MGYsbaHp2zz+BktBkLv0BxzOSHvG+vnlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5547
X-Proofpoint-ORIG-GUID: UtH6wD6uR8GeMtuTMg2dWR1nle1CujlV
X-Proofpoint-GUID: UtH6wD6uR8GeMtuTMg2dWR1nle1CujlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_03,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=992
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 06:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101616

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2

Security Fixes:
CVE-2022-46392:
https://nvd.nist.gov/vuln/detail/CVE-2022-46392
CVE-2022-46393:
https://nvd.nist.gov/vuln/detail/CVE-2022-46393

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.0.bb => mbedtls_2.28.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.0.bb => mbedtls_2.28.2.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index d4a9c7bf8..5696f94b0 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
+SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
-- 
2.25.1


