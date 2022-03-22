Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEE8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:47:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6121.1647924454817585618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o0YEegQG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00800cfd2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22M4jN2m006470
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/WVNTokbHsnFNfJjgqLr3yA29qEDQzjpPCm2EZDDs+o=;
 b=o0YEegQGyFt10Xa6xo6YSxzYPZ5MBcdOn/7jPdxJLC3poXVYss7G6ffGHnfTeMHvySKv
 F79xrlksnoewTuEsQXZVI3ORS9K4QZ/aaELri3GvyBFfai8ct4qzqyrWCsID17cpxt3R
 TXlvWj38L6rE7Modi1ItcNWcsGXwqNUTrUd62by19wRSqz4I9jk7S3Z3fEOXz+YXvnsI
 oNvNesTjhHtkVMwB1ybrEhVWtcoPnBtlqsM+NyxDz5N1qygljrOsO8L1P9PqD3pUm8q4
 ffq1wmaGyhDmSC93QUgMpDMuXTr9lF1OGKYBnoDyqmcF5OQ03+HWuYkDgEY0+d1ZXgLx Og==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657a51n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtkgJDzjFQ6QaCL9gR0MQlYySPOePXBNOs8b2D+h4LVXY13Fmc7GmwYlePoVl6jBDPZa2+lkxFGxFhhMFuJTD4flWRTEjHch+Mdv++6U7+GPb2IVI32zC8+I6XU1QF/QnbTiRB2CeHthJzg8YlhRLBok2jSqF12nz1GkjQ4aXXKubZuLci6BRrszZ7yTjKVjmjymy9R0vfLvZxoHyW0Dw6paGN+mEAe8ifuUebyosvDm3pLHWCxTgmZjY8GWdbnTS2Yx+GPIEEs/V60hbKO9Yhb7lYqeFAMS0L6xU+xljukrKL5Zj8Ab92z0Gtt3UrPWUs49pgnZJxNHRfu6P21IPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WVNTokbHsnFNfJjgqLr3yA29qEDQzjpPCm2EZDDs+o=;
 b=VzjOIJEdZvQgD7FwZrbDIoBZqMXXkiuBpePYyKrRGHTdGS6uJVB2iK2NJtcYFpd8sQsiEbB0QnOZTI6WfbsEp24C7B0TUNf5hyN2MIpEFYRoIPSEQ4VouWHHgEMwJjXfmQpQrgGT7Mxr6q48QovPGw9FgTw550e+YOf4cFtcZAbEKQHpesZmhIeG+xRT83uCUwoh2quY9miDdRZHcbIbBsERSzdD4kgfAVFjPJCyz+qiysZMU17+hFrLyk1hlaFCDZIcecTQRCQKndujF4hKLIYdFxX3h/ISo56I1T3v1fjr9yHtz5pccH+oOckBqo/8P4J5t596akpnxRMYslLZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 04:47:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 04:47:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] nftables: upgrade 1.0.1 -> 1.0.2
Date: Tue, 22 Mar 2022 12:46:13 +0800
Message-Id: <20220322044616.867009-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e67bef4-9175-4950-c04e-08da0bbf1374
X-MS-TrafficTypeDiagnostic: SA2PR11MB5098:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5098EEE43F5B7DE8C812079EF9179@SA2PR11MB5098.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9PvlmjndExuHHquF/PtJAF9XRCr7n3g72lYEA0aHkmwZSs26mhngiqa42r/1d2lQhqc/jHR3khN5vp6IRMl+vQz2ckj8WcMoyDb/8ZF6lHgiGDPfFGahQYFV9m9MjIeqGZxckGyYGzKx04wIpf6QmrwL+R/sZTipQ1N5V/DeLvERANDfCPBnbfTyDXblZ0l8sr7kfYs58NDO0Aw7ZlX+9AqskVrBYyIxo/oa1D8Qp+tjmNDYSm1DaXZEJfp518jWc/J+0kUXYFfd+zve7G4EDTYm6ZHDGM36goiMHfiLZZGHg922PnckOKFSqoDcIqQ24EuYsM45rH9Nt+yWLrc4FLetzfrAtx2lfKxnwXKGN8ZKGIuTfhi1HCuX+9759WKPdu/ObDyBYEzms1/pySeVU0IgI7Iajg1rrKidD5nykIutsYIKIFRlg9DW0AEdTmuDrUgOs0vaRUBCAJdW/GLcvQTOROHCm9TJZq7FHoqywyrIPY5vmI3FZQoHENhr9p97A+0bK4xib/XOgGh4D8arLk6pi6T7bp8ED7DXyoq7v4lIkacsYWvI33BDh4Tay1HQaeNrnSlK3f2OrSuIFq0uQMOFyF5+0xHwm+n39aB07MhYkEsmjeJUUhiVzCZKH0dgA79VSOpOon5axrOCcd0Xjfm2Qp3NdmAUQ9D1zj6BzGbODMAbnhScJFgbIpbURXWYZgdlvujB/5ruHff23kPdSGoXrFcrSbv93KF0jS4OZEsXN7R8aytlN+CuRrckMTKjNNtEOA+cAgNNBjrYY/CAXVTzn53q65B3z0PrFbIgzMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8936002)(5660300002)(1076003)(26005)(186003)(6512007)(52116002)(2906002)(6506007)(44832011)(6666004)(38100700002)(83380400001)(86362001)(66946007)(66476007)(66556008)(36756003)(8676002)(316002)(6486002)(508600001)(6916009)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Du4cFKgyPh2UUaVwmLhUYUHaOWZ524H8fTicUcAgb6U6rMhPTPRbAYzqYgbP?=
 =?us-ascii?Q?X/hMUk0NF1jwNbOab/MwtldE7vKCi1Q8c3POuEnwzYuz4CgMn3vQeGlbolY+?=
 =?us-ascii?Q?CTDyUQz8PJICdlMTFv2YV2Il/llyHxg8AYlVaOMFUiwRZz+JeM2IjPnYomfS?=
 =?us-ascii?Q?zOQCiWYctI5CkHA4x7QvPRS/bUScTxweXsBNJs1fNYAHRX2S30DZi7r0f9Hl?=
 =?us-ascii?Q?xZ/vpZ1c1PUAnkzGIlBjlN1r85Jvjcw+cf5fFyPiM2lQkGKS+vTZTMK/3Ybk?=
 =?us-ascii?Q?aHBa1TElskoO+vEJqUf/eiKNSx0TY+6ioSdCzqJbdeYtaeEcwH1ehP72mXsr?=
 =?us-ascii?Q?65yRC91IHarS6rE/9GJJUTvixl+nb9GnJfRKqxzrcQ7ODBsAreK9Naq5Elle?=
 =?us-ascii?Q?YSbqBo+LEK89hoDs05JSdlZIU6K5vlV5WLmzjVhsrQFVPmvva6+koTjBHtYn?=
 =?us-ascii?Q?vc1tJT8htyoI3Of9pzfX52e3svk0XujJFMYHCCjfry2DjXDqrj7aFMKWJ9Cd?=
 =?us-ascii?Q?Lj4vYLmyRTipFyKLFztYyRyKUBoGmQbvNabwuJUgg6+rNlMsLOmPe/nIJnJF?=
 =?us-ascii?Q?kQyDefX5NV/yMZBWMxFxGxhCjnDCOtlKRT8NNcX2CgPu4aL7kzGfEi+Fa/uO?=
 =?us-ascii?Q?n+hlVd3+tRBU7KN3WwKxs+65KfcMZhJ5cW7/uHsYneIf7vMghdktJaxyvPtY?=
 =?us-ascii?Q?GYmki3YXlA97tM4yvG75dxJWiiIdZYu2OPLaTwYn10uVAPi1/iw5Mm6L2Msy?=
 =?us-ascii?Q?15Y2SRNtWmZ2fpXq7/veHCU4Vb/guAd3mctJgIhyXPwPy9cEhRYIj1Rm1F8C?=
 =?us-ascii?Q?EquShYr5fTSi22Q6RVKsIkWg2Qu+ab0TBzFh5SM6x54BMD7n6tg4SJC9FFkh?=
 =?us-ascii?Q?M8S1h+n3mLE33kWPGx4xp39q7pEjufD7+sncLrIEWQUgCC/OnidUK+QINGak?=
 =?us-ascii?Q?dP7MJwjJpJlTUgVwT9YzsE6ZBcgnmXm1xs0rbgAABCqZu9s3dS5UsUNkkpYM?=
 =?us-ascii?Q?FgycLYafNKFRlALPtSXrfJZgqW+sfQhirGWAopL+6lWHYS06DH+wMTeQ90QZ?=
 =?us-ascii?Q?JajV0sMKmKwQWstwL51YwZKjhe8gcxJeeOc8RYa+n+bmvhLPEGgKXEdvGT5/?=
 =?us-ascii?Q?s4vj3O+89NA7tsUeSNAcjxN0d4s5ShNn5LWEsIu8In0LtDMCX649qIX7OLlU?=
 =?us-ascii?Q?JR09Jq9CfcVtN86sDAFR/7zuy9OXFqSX4L3ZVzIepF6ghQeZNoYNU6FCaov+?=
 =?us-ascii?Q?I5fghOgEno92pPecJqFJOjFTRi3UfAmRnMmJv848J9/O+Hiu0FzGdYLjSRv1?=
 =?us-ascii?Q?yxGjcXtIaPQ/TVAU+WSuEN558ikKZ1PpgUVvV7wY/FNfkbUtI7AifhR9ZO8W?=
 =?us-ascii?Q?TXcmNCAPnyoYZ+Eq3u7UwR3b4zQ1p3J9pETTBOvoY53ePN2v5RmdCc0fcX7Y?=
 =?us-ascii?Q?iZ7roVklSdTYBGceKSC/Z6+rrh1tDkA5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e67bef4-9175-4950-c04e-08da0bbf1374
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 04:47:32.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Lh7vAIarl0qXTBcWMHNWPb51FW5/XwBA0TKtmTMwWcPHwwilKbcTcyVZnaN4YDsUEhMWdBcXiJ3oXZIR3Lxr5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-GUID: 5LcwWccQxc1-T6tKTfwzpO4eIVk03ql2
X-Proofpoint-ORIG-GUID: 5LcwWccQxc1-T6tKTfwzpO4eIVk03ql2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=920
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:47:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96126

Backport a patch to fix build error:
../../nftables-1.0.2/examples/nft-buffer.c:3:10: fatal error: nftables/libnftables.h: No such file or directory
    3 | #include <nftables/libnftables.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 +++++++++++++++++++
 .../{nftables_1.0.1.bb => nftables_1.0.2.bb}  |  7 +++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.1.bb => nftables_1.0.2.bb} (86%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
new file mode 100644
index 000000000..65ab2dfd8
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
@@ -0,0 +1,39 @@
+From 18a08fb7f0443f8bde83393bd6f69e23a04246b3 Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Tue, 22 Feb 2022 00:56:36 +0100
+Subject: [PATCH] examples: compile with `make check' and add AM_CPPFLAGS
+
+Compile examples via `make check' like libnftnl does. Use AM_CPPFLAGS to
+specify local headers via -I.
+
+Unfortunately, `make distcheck' did not catch this compile time error in
+my system, since it was using the nftables/libnftables.h file of the
+previous nftables release.
+
+Fixes: 5b364657a35f ("build: missing SUBIRS update")
+Fixes: caf2a6ad2d22 ("examples: add libnftables example program")
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+Upstream-Status: Backport
+[http://git.netfilter.org/nftables/commit/?id=18a08fb7f0443f8bde83393bd6f69e23a04246b3]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ examples/Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index c972170d..3b8b0b67 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,4 +1,6 @@
+-noinst_PROGRAMS	= nft-buffer		\
++check_PROGRAMS	= nft-buffer		\
+ 		  nft-json-file
+ 
++AM_CPPFLAGS = -I$(top_srcdir)/include
++
+ LDADD = $(top_builddir)/src/libnftables.la
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
similarity index 86%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index 2c378e8fd..fd8e26ed1 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -9,8 +9,11 @@ DEPENDS = "libmnl libnftnl bison-native \
 # Ensure we reject the 0.099 version by matching at least two dots
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423"
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
+           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
+          "
+
+SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
 
 inherit autotools manpages pkgconfig
 
-- 
2.25.1


