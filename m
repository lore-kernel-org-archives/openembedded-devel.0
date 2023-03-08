Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE298C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:12:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11981.1678237965569799680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2431cb6b16=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3280w16n011708
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Mar 2023 17:12:45 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd01gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 17:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMoCsZdAQkPB40wz5tAteXw+oPWgb+Kju79gteK4adR84o8qYGz5VfVIrqc+h519nnEjKuDpGE2ZpruompASL8vWbuFroPx26fl05am4G025XT8LO5jtQWoYQ4mka47xzO8KTmg6Rjloj5TdvFL3b7T/pmiBFFgbCCLMOP9cH0xrbT957jkJeKoyKrVO583Ro4Z5dHbvhX9GOXMjoE4fYqRpoN+xup/VpdUNxut+536w+V67unw1pubS4bJ9EIwBQo++OHx9TCgHf42lsIPtGzMzP+epdAOUCFxmgsgPE52D/0A7muQ9rLqj2gOh1NPqRvU7VvPYq+fd+8Ij0Ydp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nET1ZGg4JsJhmoS2aDowHUf7p+bmOjMYMv4ZuJIlHA8=;
 b=WZQXNog966tF4bSaEqaNArzh3GruR4G3cNSlGSbxtRqH1KOpE8EEkhhejaR1WGmk54nLOADNM4hvQ/jAM8MxYub7E6TAkHk5uI2j5zOqGTRCLISCDMIZi0OJSI10+vQPxPgAI5Gdy95INlfrqFSJK1EvZdIQLv4A/zmRnpmFRbjR4hrP46SQD4nRYzcxqRaOp2Ice0/UWjiIUdcOLhVmNGMhWeJmCevpGVh4h8MbvHhzMihZYjtx4f6fYr66e9GWSiVTTGEDFZC7Qyr/EsYf8VcRHXjRM9KM8wcHg2q7sA28Ut2kOAHLoLG76Mx6yRYEw0dKtkCcm8Ht9po4sM0mMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 01:12:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 01:12:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][PATCH] libbpf: upgrade 0.8.0 -> 1.1.0
Date: Wed,  8 Mar 2023 09:11:53 +0800
Message-Id: <20230308011153.57452-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:1::14) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: facf733e-f2ca-4704-d872-08db1f723723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OWt+B1Xuh266i/KGQnI6Jyb8GNLVjt44nOxXpFSgx2hpHt1YkOt2YAAyib5jBa5IWoUdJW971s08hQJLOKSWWrUhkbC5ac1C7CJM7U5FuOG4BZYFbygo8yxT1V7JeYnecrgb5nkM+Ye9aJNW7PsNXk7I7WumrJzuQHaqqvc3hW2oXAKon0Pg1+tGGn3ZKJxUq4QJj62fUZf7K7VLosa7wsgTLypKX+SbXfRjYMPOFuZ2hXIoA54SaTiGtXuLF/MB++VK9giUwq641+JfOKs2l08csZnI6FHgplBIjbw+Ykr15uFJt4aAHF5PfnJy9ilzFqOn5f5JKQpw87ehyHlzu/BFwCEWTGVziN1Ka19H4wl9gN0HQ34XBQvSRaWsYtIsZt6o/ErSTEkX0qlruOnZZ9ZwxC9X9Dioz4gNShX7NfAAiz2tPXzVvCi63+W24NDbHFqLsHE5PQvc7VmGv/SXil4hiZP90jGE0Drcb+yE6YARfyxm5PvkiGRxK8XiXxsiLHB3Bo3/zSZQU4uUc9fGQD5nSWv9tYnRmf+fHaD9dKemrWd3VtKHnQ4ctRGXu8pB29OV6RiACT2owGlj373tFWyovemRgJTDGpgJkhKmm963xx6IYjM3SClh7yr7+KGvjk42MfYgZFT75KKreB/2uu1MQiVIpVB6Nm7OX7nVjoQtKl2eeLRvWcb1PFDrGS5m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199018)(316002)(83380400001)(6506007)(966005)(6486002)(186003)(2906002)(66476007)(44832011)(6916009)(66946007)(41300700001)(8676002)(26005)(6512007)(66556008)(52116002)(2616005)(1076003)(478600001)(8936002)(6666004)(38350700002)(5660300002)(38100700002)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vs1TV2wiYuy8CDq0PXXTcf+x6P4KFjQT9MAW/3TAMSbBbn+Sv6tv8uWaZj+r?=
 =?us-ascii?Q?iGhjmCYIGlMol7pFOnC/xIKbDUBkVkv/DwEV+keLNLJL/Swo0GUCE69Gw1hs?=
 =?us-ascii?Q?bwuOyhdb2njASbOHKccjVHIw3obfwIjca8+aOepnoOcXEzFp/ty3fxNikYQL?=
 =?us-ascii?Q?TkCgY7wg5/+eo9/5bQvsOEK4Pej/PnZjl1xP7rRjh5wnWhQMcq2wIkahKm/m?=
 =?us-ascii?Q?TDPy+l2Sx1wUirFqRBq5bQBvsvpi5j+5umdePn+SMurar5htD3wLe7RN3HA5?=
 =?us-ascii?Q?nGBnASGYUDC/QBDBsVBl/H8ogoTbEpTsFVKawKhB/jRULOm6X2opBp8oVV2Z?=
 =?us-ascii?Q?1SS2Yq8COlxbXdv9mZS6GeuhUFDSKZRwbWG/9ze4nQX9fVNzMrZWsWhabst5?=
 =?us-ascii?Q?bUDiHr46CDAPz6u/TaK8GPvt9D1Xj8v2VASejxxvtJNCuCQnIWbrnOp8tOvr?=
 =?us-ascii?Q?1VzMHitnQp77VCTs6dNDj88eK9UNClLB7WcZz9/LdJv3BEorUGwmg+WohJri?=
 =?us-ascii?Q?BX/4jNfEsLvp2pHTMDjonoB4VHsE1UHZIBiEALXeaDLfZ4hEF0NPIYe3dK6p?=
 =?us-ascii?Q?vhf6JrasgkoBN4I6WxWNlQTr5ZkI/yLZqzLvUqOc7K22wOP4md6NkK45XHEc?=
 =?us-ascii?Q?jFJDA1gh+Ek8lv9f7004NwMmZ96LDnfh/Il94pBFDAiHWKWGG8e0fKfs7WA6?=
 =?us-ascii?Q?1rCGd4pboi4YQAWQY6baiBc++pn5fiQUnuiPfkS3Jxz2Wt9WSGkI8nYwPoav?=
 =?us-ascii?Q?07bBzhTW0CSWKW7fEn4f7+JahWczdd5YXtwauc6YD0c+Hz4aGcb956uoBoXS?=
 =?us-ascii?Q?an02JcBdJU3FWcmRai0JTi0hI+1bCXc3aWuIcz1fePTVvo7f3htsRtCJ1Foz?=
 =?us-ascii?Q?X92kcN8ZoMYUr4cHJBAm00QftYYjsAUaGk7o1008Si4Yq91Nana7OJL5x3BC?=
 =?us-ascii?Q?CDjaWlOIF3BYYo0pZBOLZlO5uIVIVpxXlKtvqtcqgLJc/Fd+OE9/mKURXSNy?=
 =?us-ascii?Q?x0m8Mp3kVaql6Wfd4jiK1Q43ttYFBhTG/YpHUFqgCzOU7qhMoTAqzH/GOSSr?=
 =?us-ascii?Q?dzLrsYEKZT5mUMCLcaDE9dZf6Bcj1X1zk79GUlA+dsnxmhWGwun0vYqPyVez?=
 =?us-ascii?Q?QNjVMTA3XsR7lvVxoyvEdldprJKKWVJbylC+Wr12zA4wxn8luO9enZ51dX84?=
 =?us-ascii?Q?7B8FoUpSKZoZCwFHQstol7X4GnKjS5HQ2DPNMxECBLc221Beo7qfaCGLWT8G?=
 =?us-ascii?Q?khNSJUWrG4hjcRS7r9c9dJFekSYs9VN4Y8G4TkakGIdnK6fZAseg41S6CWMF?=
 =?us-ascii?Q?xP1iDvMiE4wt+wPOiqAQM5s8UKCcsEwCuAFAo1sSBCHwQKaWmGPAWIkjMeCS?=
 =?us-ascii?Q?JAlvRKlPJCuwvKQ6qBJSeHOA9X133/3f19GptY6l5Hcu5uWlSv1o1OyfAckk?=
 =?us-ascii?Q?KHQCCfH7hhGS6EDuOVUtAOEQJ4koceIyhpL1ZSAsbCY1XyuhVOHLrX/ZNM32?=
 =?us-ascii?Q?zUkBEHLXQR4YlDvj8Bi+QL0dVbuNZ6dZrECnR3zUb+hFhU+fgLQusG76r+E4?=
 =?us-ascii?Q?q3bmg1Z9IXENOnxzME+0oVD5Duxll2NHkCVvNIQ9p1Ydj+47+rg97wHay446?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facf733e-f2ca-4704-d872-08db1f723723
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 01:12:41.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbJcQ61ekSg4sOwcwQWc/G6LTux9+ShnOM5b6gobQ4sUAcC4zd0k9KKBvSqjQv0Tw3kKM9KC8QJ8lcChMwthBr+QoWOqhqCtvcmJGnAxZno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
X-Proofpoint-GUID: GfXQZJXvyQzDMEyJJSI1HkehhbpnhroH
X-Proofpoint-ORIG-GUID: GfXQZJXvyQzDMEyJJSI1HkehhbpnhroH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_18,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=786
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 01:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101409

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v1.1.0

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.1.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
index 3aea7c079..1aee51f1e 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
+SRCREV = "6597330c45d185381900037f0130712cd326ae59"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.34.1


