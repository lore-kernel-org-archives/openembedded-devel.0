Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF3C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 02:22:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.127151.1712629355533627044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 19:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4829c615fb=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4392MYa3018845;
	Tue, 9 Apr 2024 02:22:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6j6vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 02:22:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZK5CwxYqtTy0ttSHDcW/LxUQVY3cBPFW8ZlAnM0xLkwYYYIE7Qzs3+soVw9hzgBU52lartLpfoIyblYR3GquvYB5MuYJK95W/Vf4o5Togqlbn9MHro7l7BhG6feumBWK4r7DRIfaul2fa1j88N98KzwieG2X5jlpOP8IBiquzR18WqtfjvQvnlYGwgKD4GrHDHCXWoxjq17jsHX666Lp1on05jYuW6N3VTybAlVCABhMf0U4nVDA7O5obA8dAV3+13Hf7eFD6f11o5+8LH9M6au/jvb7HmTVZdbaJYjOePxy0CDyrYzMtOhpYWKu/0Bu2/1yYL+UsswXiY97JIebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9QQScFG0rlcoIn+PSJ/CQ+wNg+fW9LuuVRMGHgl6k0=;
 b=Jxtl+cRpjOeWq62WFjQ7TKXUh9u2hh1QScaTuWfmzVNXaVoAYAmKP1IqOfwraMS3qbF+H8SSuMFnlc0xsXnwvSdEby9yVivLNolMQO4yyL6dFDoQY4uR9HSin6RSqr4FyxgqWEA/oPY4J45/nJclHAEMOFeWyq975oKqJ0MPnHwOcaRArLFT+qyHNpeyW1qeb455DcezrbP8kjQXjcLUP3x3BQKdTKWEPXXKZ5Mb10yP+6wS1ICkZnaflyd/n9vrM/xmHIApORSyj+x0FKMySJGMJR1dqVg4ToUqCou4i2rPFL75A0lxBg6z4ObUvbJ8Y2PqY3IACimGA1kfh2R82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 02:22:32 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 02:22:32 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2] libgpiod: fix QA error in ptest RDEPENDS
Date: Tue,  9 Apr 2024 11:02:27 +0800
Message-Id: <20240409030227.4015444-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB4949:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yxQlFRBv5y5rc6x87y81/rDHpeRKfn79vg/R9WRcp1GT6YiIIijHqUAe+NFZtVkZa7Pxy06LWZoQkU3edTPSQAWKw/TqtCYcQhXs6u8yzvcNIrB7PSqZhBa5iEsev66VYjJNF9TeQaPPkV9wHaUy0Y3afG36KrGlV2QPnzjdmLnz5WLc9IgtcEIKM0qRLsRTnlZSwJkYo6Eo7R8/zKhvezHEmLRG9whz1yTYmzrBbQO+d5nlhyy1iGc5LgZCIyAUrmJstOj84/raAfjslQ6QCfo/XAJIxwIMcibZdpO7EPYHPGkNnlgM7inSzZ73/OxoVUH+r7UpwHmWNOI5hobJUrzlq7XxL/w4/aCmCHx4Rujm2rbAjcTrULFdy64UveB4VIa3woqoqzE1HrMeP3DXykHsDNzAJD5kYJHHTWdUWJwc3vfmeIj0jXSXjh2q97usw/qMxyhx5wQpycUzajeVRfyStZ5pCKtN8wEsR5lx3mOk6Sa8ZujL0CYr/fbi5evZN43KYxLygABS4fuOwcJaplS5DaBDh8uTsRC2ZOip+g514NlLFX6vobbPSXXk26ooYtqiZmSb1ORr1gsNVqXJQzLpXKhwNQevS/SLkJ5qkZdQoAbv1kCl1WlcYliEnkzY/IvpIqbcuWtMPQgHwcFC8gixg3PZJ0G1IRhAn6ECgIuusT1jmTNVQip8enXJ6ILRMzCG2k4kxFKR0vZvhPE5deRjr9qa1sTgjiSQ4/0eAfY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2xX17bDUhJrGIr0BIzWMShkChaZJ2c/u1I55NbVrz+rEJLDSx48MGEKxludj?=
 =?us-ascii?Q?+RQB4GNE0myk3XaUpNK75WOUoXqJxk0jbwl5msxHCLagkicgonKuQ0ptXseo?=
 =?us-ascii?Q?FSHh9JWjN987viHFZ4afiRBxn5VPlPIyOSR0VUTRHzHZpigsfCPUOnl89KkX?=
 =?us-ascii?Q?knCuoD5EjOqaZEIRG85Bh7t6bcrmXvxRElXJYTHf6bYWd9SYxHHtMOi0zw/F?=
 =?us-ascii?Q?rhDwFkQ0GjmvEI/Ifc7zbtaYKggvVLxZt0qFVbpMlcqf6JJrdsw9I54wpBqL?=
 =?us-ascii?Q?fk/bmsz07VB8GsCTT52KrQJGoYEMaf6mEjJj6ruyLxeLejH7NOv7gJwevEnA?=
 =?us-ascii?Q?6RPW9t8gYOvRoQCeViJK9RIotykaOPyvpfrD/oB+mWBePHjo9d3HsQYzk1cl?=
 =?us-ascii?Q?sZ+4RIiNj1HG3PpUuaaE1/SZQAGou7wjL0QdFLctknX4h1rvIzGyTzcq1hcw?=
 =?us-ascii?Q?dTLfPtDsQIW7/b09zEIBNt/d9Tu3qBI4hXM7TgAdunBhJnjczPg9dudANYbI?=
 =?us-ascii?Q?s9zy3tO7G1PdiBFA1famAw7npZE2pxEQ7tiCXfVR8YCBfghhs4hkQZRTkhFJ?=
 =?us-ascii?Q?VIMkvNDJoJLVrja9gpIJpfmKyan8Kk9wYzJKmTtbIxT2o82N8DonMNZeOr1C?=
 =?us-ascii?Q?VBONUAgp1jI05cAKxvsUwm0XOT3Li6lOWYupFucmSP4XwCyjPcminB5K7KEr?=
 =?us-ascii?Q?PoOoMdOM8r5OGXLv/98T0pu720XQKYjpOcUJhDFqn/NbsMX8xk72NhFYIlgN?=
 =?us-ascii?Q?0P2dvkg1hjm6I6RZAa9QM9gw838xCqsf2wZLN9Fea3q6Zy2jLudrPiDhRPJj?=
 =?us-ascii?Q?xjyqLGgtvZnP+EysBcdryDEwaRMvECUXE7DE7C55t2Yx4FKE+UMByLg+JXoV?=
 =?us-ascii?Q?grvkZT/c+573EFba2jMM4hxKPbd5dkH7VP9Sa8nbUJ9y9Xg3TWCLeD5Mr+d6?=
 =?us-ascii?Q?sr0cZbCIGaZDed8EFS090zKkpJh7Gx46ApV42aYsyyDReoDdr22KNaTxYVfB?=
 =?us-ascii?Q?f7yWVbxkry46HL3Nkrr9jxLhQwyI3x22GMSZsC8vTUQy8otVthjL/YGNi4zN?=
 =?us-ascii?Q?qtN80V/WJzj77S1X7popPbAg8N4UPmcipYUv+Y17gpLL984pAniE4L4Nk8C5?=
 =?us-ascii?Q?T2NYap+ko1H/ljW2RchHRnUIDG/5y3hxS77ymSeHqQmTFRLx+RpOqrn+WDbu?=
 =?us-ascii?Q?S8M6EsQpBUMX7vwJ5c0MkyTh5GkM+V+EhCTfRNfGmWvCvA1XdZ23PVTsG7un?=
 =?us-ascii?Q?JML89LleLbmtWhFkQtN9ctQuwam2Tsvq2aM9vF7WkZLZNHMEr6A4HYdJP1nH?=
 =?us-ascii?Q?peg2pM/sQ1qJsPH8cWdcyVAhnwmG+ufTQwhWrTzpIu1Ko9yvzWtnnhWJdaoX?=
 =?us-ascii?Q?X9G9fSz4N5wwWSyV5wmhFc/3lNMPmhVeWqp5ZQFrCNRfAiLNmBDpZqr4hA6r?=
 =?us-ascii?Q?6R6GgPQyPJMp5kv567uR2Uq07G1hLftyFMn6KrfxiVmwt5gOlOjAb6swp8M+?=
 =?us-ascii?Q?dQ+6Z8ZXMfOSwbtG+xfz3k1YrHh/td0Jk9Onq66TPzbVt+EXn2aEld0VIcpB?=
 =?us-ascii?Q?hX3qMs9D5x0cvUZF9zX9LL14CF2BkBlPfbr4H1bPS+cSltrEGf9gXj+MOXJM?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3bae89-c041-4172-3748-08dc583be920
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 02:22:32.0547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAdyzfOCGB2oueocADmV75LxwevPCTnNvpTObWgXcHMv4l7Q5AU72IvC8KfY1zptsYK0BnQeYRIokYwGUxKlUVlQlqvXAtA+saVcvDlyb4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
X-Proofpoint-GUID: IRT8JByocUXrAesQgoWLaPG_45GL9wlu
X-Proofpoint-ORIG-GUID: IRT8JByocUXrAesQgoWLaPG_45GL9wlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=773 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 02:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109874

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The bash in ptest RDEPENDS would cause following QA error:

   ERROR: QA Issue: lib32-libgpiod package lib32-libgpiod-ptest-dev -
   suspicious values 'bash-dev' in RRECOMMENDS [multilib]

Add a ptest enable dependency to avoid this QA error happens.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes:
v1->v2: merge bash and shunit2 checking into 1 line
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
index c62c9a3567..4c13d67eba 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.1.bb
@@ -21,8 +21,7 @@ FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
 FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
 
 RDEPENDS:${PN}-ptest += " \
-    bash \
-    ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2 bash', '', d)} \
 "
 RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
 
-- 
2.25.1


