Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51EFC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:41:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9385.1677156065851690299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ghWt0M3W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NCWe0Q007352
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=rdUJEO7u/JFaJwCC6nQi54RpR/phoDFtjTIdhztSfkI=;
 b=ghWt0M3WZW/I3GCYMJJeX/ZqJLfhmogdR94LquxRNpLg2qXVPEvERO8Tof+zjK09r2cY
 965YTVOaVSKGjaPTudEiQdJ74xF3+jGyQadwfTCNRxP5zUyeO/u/Ru/jQ2NOFeyikYdV
 aAeqrJRzUA/JZD/ZBp/mTENyRaKK6/VUAfESsKeO7Q+5NOkX6n+i4ioJxUbUd+X1oTEf
 3BcdWjs5sDQnQ8iYGUuD6HF/zoEInHOuHOQl9LAiBAOo7eS94wdJ7KfVuyQq1EzLycv3
 h2BAqx4Tevk+WoiahQOkZFhkmQlSz+sbHDDEVpyvZPmJEg54jekPEgRRtDcfu7j6p7+2 jA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3vqxb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrVTffM1i9q9Ls1yg8tt14BbGJBeh+tLnA9LXUyHwMQg+aPeChh/5qutlQXb8E69BJqYJdec052pXdbQZVGgLYQey2aRS6wZxF8LD18+HiXzA4PCECqG+rYOzKGjxdSThx3wYNzxlg7L5uRwTd41YQl7e3jVrQdQ+9R7j0BZx6iOyctQHXi/jPmnUef8dCtFJmPadBViwXJpD/0kAvDdiXUVOSfTpXe6vh/oYHf/y4A58Jh2iT4Q6s9H/Ro+ZogNqc9WvuNFu+taJLiPm03TNuhuOhMBBSYwBzzFF43ZgvVhtUfUkhZ+J1/4LjbheRzTqihRlDaECXRbhc1ymN6OMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdUJEO7u/JFaJwCC6nQi54RpR/phoDFtjTIdhztSfkI=;
 b=ILHGNJaICgoMt0MSEeCJYr5DekhY6EkRLhz7mssXutkUqo0PoCjhmIkQszHHzx5SPFQw1GsQjHKJKxjV/6erBVZ8m9sT31n7tWU6eMWudn4Bjsh09AGHeOGJNU6YPrd3R9ZsFCbRblPLcCkgxoIxWl0y13N09SwEIMFZcwlylj8R+cEbngzUyOgI8VTqgA4PmkCJ+q+vVXRqDo9gE2V6+F6z5tJ8WddwF8GKfzwLSN4dRa8gryhaZFo6wIQ6056PXf6/HB7A8JE/jVMDyrOCDSnYb+l2y2hcuWBpzQkR2NugIAP//feJNMTOcPb/RLBMtrBU8ElktBpg+75ERKchfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 12:41:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 12:41:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: fix Upstream-Status format
Date: Thu, 23 Feb 2023 20:40:49 +0800
Message-Id: <20230223124050.2282580-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223124050.2282580-1-yi.zhao@windriver.com>
References: <20230223124050.2282580-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 6125b845-6d3b-4869-3031-08db159b3933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7u4HuEZ89zuDMpbkznxA5GgIuzjHWsw/snPI8Wo0t5IMs+7tTs9QSddX1p640e8GtFLAkM40nSUMCzE3JYguwQ89K0y5IBoP6ZXXcv4zVf/VAEW9raVqpoHqm31QijL19WCGIZGblgz5E8Vfrixai/LUgVdhnri2pEZjzLczE2IfplfnuZ2EICP95iuM9KNEB3SFQS2pzYO2miXvF9QSYKthjFLgGTg0v+Orbbfht913RA6APON996IvJ2ig2x4YWlzZYjCwCQ98afVvVMHrrFlLu9vL3qjfYQhNtmx0DWppPXXe3mr56rn1KTU1n58lgaMVhndAz3cZf77x+YegH3L7zH9nTadr4LFbDnc9Oo+QrVSrWHwB8Kb18U2jBftfmLrLNbrbI/LtqH0MiUGl8m0PwoYfn6h1i0+NJfWiUMwPspD5XOedIvXwsAx7zp0jh7xcVSOx+xwqKC3aWn6DBpenABf9f8VZtg2hRpsSiB+Dp7QkC0kB9HYUIl/ARHLVcVxq3CCjY7D36Ubd7+WMZP/c50uCJWAvg0t4D+Ga0nGDzi2UAioXomrpgRFcWyVNenZ292YavTYbQHmDFRmZWBFsgQFTnJWzPTjdzFPbbA6h490MNNYcjf1zqlb+ZtCfD1/Hq85VPLwydgQ3jBpAp5dRhH+Vsi9h5iTjMrbu+ClyD3PMZqXYRzGPaWl0evZQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199018)(38350700002)(36756003)(38100700002)(2616005)(66556008)(26005)(6506007)(52116002)(1076003)(316002)(6916009)(6486002)(6512007)(478600001)(2906002)(66946007)(6666004)(66476007)(8676002)(83380400001)(5660300002)(8936002)(186003)(86362001)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+nSDD5zBfBdblaPYFrrfA76/cOm5X3XO3mFLmUc85BCzPGG69rcwBEjzldKe?=
 =?us-ascii?Q?scfcfPZatpAGNGUmGF3fpU94cNA7cCRIvYIRsqCvcGVp0hmnwyErua+HEyXD?=
 =?us-ascii?Q?sNCXkNm3dht4MrOKrB+tbhkr2kPJlZbW6Uwmz6QeaxKvWBWgChbM0nV/tGRa?=
 =?us-ascii?Q?fIbDGueisoMsmxxJbjBVsD5AaWsV7abP9IIA0UpoOQis9SQeHwjncsw9f1zQ?=
 =?us-ascii?Q?4ReXi4JPgh+Zr3qWMgisAn72+NlW/Bx35kbsgisIFDGqESgcpXgdLqC8vnvn?=
 =?us-ascii?Q?FSaqvWUmiIC2qZAagaALdJeTRcqKD9gIcMUtvQgT3WiI1uZVaIHa4zbeGX5j?=
 =?us-ascii?Q?KJhTY/dch9w8NFu8mFpL2ZvVR6DzAls76wX4JIBcqvut/28czBdxE+M5+tUL?=
 =?us-ascii?Q?VxPLqylHwSsffDZVSinJziEDwqvJQrD6Gh//wCKL+F8B7E3+mIjWrw57ufJv?=
 =?us-ascii?Q?uS1xR/upQLG7c+AgORuC7R/38Nk6Jyl4N1J0/tJ1FqBUxkYxd5V+Lsoi31eZ?=
 =?us-ascii?Q?UJNbalYKAXxnjt41+OU4KnDdKdUMHwVYwi20TKm+wAN2sUn0C+gZFakzQamS?=
 =?us-ascii?Q?JhvsY34fiMu57yyvo24BMVuuv5KHkIa4AAeLMlHT9JsEDcDc0lQieLnZCfAw?=
 =?us-ascii?Q?9dYYXqAAFeEJm/Fp+eynyiN3NXrzF5e12rXbE5Ju3Vwb/VZRB8qx6ydR3fgS?=
 =?us-ascii?Q?/CYM0bkD7Deq8bi/hXTMilbxrw6RpPL38kfRYiW2hgYLrltxUY2ZqtcClg6n?=
 =?us-ascii?Q?CesOzdyHupwNscj4lnPevOoOueXgNo0CnC7cRyyHjfrklJap8Ci5azvOiEKV?=
 =?us-ascii?Q?Zdv6ARTsqlzEghgqu3lYBNg/qraqYMkPnDdjoU0slLqx8zwx7I5jPsT3zoVJ?=
 =?us-ascii?Q?y8liK2z+YYHjKYPlmML2AmmDVDMpyKY8MrcWJfwuSDoT7c1NOsJQeb7sgAR5?=
 =?us-ascii?Q?0yaEzbjc98qaxzdtiTDISCi2RA4quAEYdV2vRCussazRiJ9CTMiPnMxj3CAl?=
 =?us-ascii?Q?XIJHtsUAStQ98i9nGCBXEvvFWt0FhVsP8bumiTojLjTWxkuwLy+ABWEkcLAs?=
 =?us-ascii?Q?FVPlrXNbTmoNWTVhg6QbpqDIpVVIsblynPMLPC3t9wPtHyHbWGDLUui/q6eq?=
 =?us-ascii?Q?FxZmoC8inrqgkMoJBkJ81NzP9n6cDoqUMdp+VP/Jn+98Q2rx51eLR/5EjKhj?=
 =?us-ascii?Q?jos3E92k1IwKyRMSutN05lt3nC8KTkLCKh+5cjDJny9wG9KAXrRpj7nLWmha?=
 =?us-ascii?Q?+XSKaPhQa74GWqolyxfJbDqZEe45rEmq1ux/u8/8R0fs4XRmlx64o20kqXmi?=
 =?us-ascii?Q?/wdOcPIDIRwRtHz2UgelY7kvdv4wP4VIkMrVBvZLd2unoNtAYvfwlXtPG5hK?=
 =?us-ascii?Q?BKrsWftszOcex4gxPFBj6QiDNwt0ojM2frjYDiiBzY6IXjD+nWj5dGdWElO0?=
 =?us-ascii?Q?jEff1IXrospudqQ8w9lSLH6+duZ2BqLjMocPGAEHRBiPrymST7ebzQznYrUs?=
 =?us-ascii?Q?tngqjoMQliu3wTLSl1/qWdved2mE2+kzYGo1FGC6/YXGzyd566nJPUKxJNgJ?=
 =?us-ascii?Q?z2W6VHPZ5iDFtWL+HnCcrJ3TBQM3fdZ4Puf7wcSV/dOPN86cbgweGyGrNuOv?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6125b845-6d3b-4869-3031-08db159b3933
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:41:02.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vs61Oj9MjBbm0OYBTbu9xw3D+qn5VAVXFamg/o3M/geNW3kC6ZyamDLzzxQdqQdtOcP8FDip2KGmvEvuPqzqPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-Proofpoint-GUID: j_W5O2sSVaJvU2cwdA2cEtkedUsAbqTI
X-Proofpoint-ORIG-GUID: j_W5O2sSVaJvU2cwdA2cEtkedUsAbqTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101226

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../remove_duplicate_install.patch                     | 10 +++++-----
 .../0001-Support-asynchronous-calls-58.patch           |  2 +-
 ...-transformation-between-D-Bus-errors-and-exce.patch |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
index df95a4c13..7b1dc8c6b 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
@@ -2,14 +2,14 @@ commit f6c67662145de889055a86a6b3b12c70a45fc8d5
 Author: Dongxiao Xu <dongxiao.xu@intel.com>
 Date:   Wed Sep 7 16:02:20 2011 +0800
 
-    Avoid duplicated installation of errors.py
+Avoid duplicated installation of errors.py
     
-    newer version of autotools don't seem to like listing files to install
-    twice. Remove one errors.py from the installation list.
+newer version of autotools don't seem to like listing files to install
+twice. Remove one errors.py from the installation list.
     
-    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
     
-    Upstream-Status: Inappropirate [upstream inactive]
+Upstream-Status: Inappropirate [upstream inactive]
     
 diff --git a/src/Makefile.am b/src/Makefile.am
 index 5c27dfe..7536e43 100644
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch b/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
index c5cb9a878..eb97f0585 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
@@ -16,7 +16,7 @@ def func(x, y, returned=None, error=None):
 
 proxy.Method(a, b, callback=func, callback_args=(x, y))
 
-Upstream-Status: Cherry-pick [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+Upstream-Status: Backport [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
index f5c0390c5..9c9b9b779 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
+++ b/meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 2/2] Support transformation between D-Bus errors and
 Exceptions can be registered with decorators, raised in a remote
 method and recreated after return from the remote call.
 
-Upstream-Status: Cherry-pick [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
+Upstream-Status: Backport [https://src.fedoraproject.org/cgit/rpms/python-pydbus.git/]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
-- 
2.25.1


