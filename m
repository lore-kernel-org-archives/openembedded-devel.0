Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5070AC6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:49:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7316.1678283381042760524
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RQMb9cWF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24318e24f8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328AmgjW017287
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 05:49:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=NBQ0ofjLZsoitUT+nm+wbeVtV2iEQicIhQE0rlPiU2Q=;
 b=RQMb9cWFH/NOu/L1LuzBSue+EYanr3CmZcdBXLEUhnCkNl/0QqzvxlXKXQh8CdslZpvp
 pfDZaVc+ZjFYQWxExOTVyjdhHKuBK2RJHpYvjaqR3eI8ciuFl6D8bmM2zVj6n8cwyj8c
 8rFxhwiSn5IhV3ARcoKA+5NOww9qYEFw9uJHMdN997F7Nm3Pu3m6YjyQrnPBYRVyrVaz
 zP45T44o7zNx+eg8ewOb9wahlhIb/PsHBQ5DrRmcL9pFVtqrnYXVjUNGYAbX1d4G4AJa
 gwzY9VrXdOsqVDSNzd2RLChNIXwP6cHbKaACCWRsVO0rP4ggw5bRqcwtqtuvJt/yDuYG sw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd0h59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 05:49:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmQybejAn7NmZvhO2/35HiWXheJX8kKOOZWHYVDdpEZGodnu816fOAM3KIsfQGV2xOhl5eGfoksq5sm91bCC5ZsFBWumvr9U2aYVrB46c5MdYfS1bRBiu2cf9H4eXqt7mFJkT0ElxfdOXxk1EKdksnmOEGkASfcNstzN+4+xRAMyd4yA7pTmx0jmLglOlBumh26kvVGMPudhEzayJXUtbk9MO78HB0mTmiTscDIsmhiC1lPbka1KRYRzaETO5wXO6ZSHxt+ynBQT69s+Kyqtav3SBwUHGZ4yP27dsMaptGUkcHJAFoII0XZ0p4B8n55l26jg2L8Lsvs3idv1UL+dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBQ0ofjLZsoitUT+nm+wbeVtV2iEQicIhQE0rlPiU2Q=;
 b=hu5jwFR78HnUVEssxlcVcjVyT/pq7Jfeaj5iu7fsDKqTOh8czde1c3I7qyyjvR2eburvBioCIWlSmTMzPU2RFPCfSQUos/YNnsFALZZPlYoLxrcL1bc+s5xoM6mNyGFo37y3Ob3f8zmaAsiq/yREKS+aGTc1qrKQLLrtUPP1kqic2FNkkz1JLvbWo9krYO6k34U3Nf6NpdwqnTY7OoEOvupqG8quauHgb2bDuW2NmCmbepiwp6k6D+4mSyNdsHk4lBGTN1TxkX6dAzXStP5U+2ZAq6yHweXI/a5YWtsU2PrdYwsHzeDu9NjIbNe1jJ21jeR62zq+4eoOXNXZC4oy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:49:36 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 13:49:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] libyang: upgrade 2.0.194 -> 2.1.30
Date: Wed,  8 Mar 2023 21:49:22 +0800
Message-Id: <20230308134923.783985-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308134923.783985-1-yi.zhao@windriver.com>
References: <20230308134923.783985-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fbdd39-3dc2-4852-ed00-08db1fdbf4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LXNfMvKsnBBfOK1ASkQGjXVRUKft90xKH9NCMXAKQ80iQcBfmdybF/lSjgzlH+v+igzDN8ij2EcXPWdss44JWWNnOL33sMUEPGL8eVtxBTbpYmz28t9BGCja8QBRm0I+88k0V5mDeeNl5Nw94nt6mdqkakDuFeu8PjHDgflmt/RLVSk2oN1CBfKuYXU0tytLT88eHtgSlyxTCKWZqTfVIM/IIUBeYV6QFExzoIbK/d+gzRrEIbfmiESOyTr463ZpYMwGWzlvwp2J+70YrVeUqKEKbjztu82vrPFzimVNZSyfv2yaZ0DdnvfOz9peTmLqY1hxMiMro1O/ZelzhuN/0Vku0PsxweVb+fToVuhuW3d7BOTvtvaUkoLcdaNl1DUXAfLAPbeGDF3EgANEMWfy/UDFJnDDQaIKOjMwpMm9QWuurHA+n1SyuNtzeL0rSN8acaImwmVkvrnRIuudhGdh5/JhEcB5Jlab4GVcl9+WMeLRMs/Iy14r+rEeWkV0noFPHT9GpREELmpPyUCZfHB0Nq5DNIxi1e9tdOh3pjrMGT/EuNk7VTBUW2SYVMVsfP7hedkl4zfOUmsfOykrEP5BKMB1YeSuJxHE2hGVkx+nPC1w9A1tJR9YhXn3fcikpJ4Ll9tErQEHtWBQtDslGOnw/o5oNJfjOYo2PaXfyPRGVP+S/j8pKu4Db9TXp266xzAR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(39850400004)(346002)(136003)(451199018)(66476007)(66946007)(66556008)(8676002)(44832011)(6916009)(2616005)(6666004)(966005)(6486002)(36756003)(5660300002)(52116002)(83380400001)(316002)(86362001)(8936002)(38100700002)(478600001)(38350700002)(186003)(2906002)(41300700001)(26005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SHiTA5RaTK5QKW5Ek6y4cyHY8wMAhIPQtqeiWN9mtaTj8XH6ybo+mczZ6c9U?=
 =?us-ascii?Q?zh7k75rLYChSESgUWIn31Cl/mMl38LWPWvKmZ+A6sq3AA5hSs6Qq0XHXCK9h?=
 =?us-ascii?Q?azm8ej8w4dPbdh7tr6P+xD6cDiaBA0wIMFQ89DJVSvPHO/2QXKuSCp3Egybh?=
 =?us-ascii?Q?rDyWDvoLSh+KN5mdX26gv6UhQ4a+TX4jZrwLmt/sUvLi1yFqXQ2vQ0EvhJqg?=
 =?us-ascii?Q?PJmg/KewF7qpPQZXVyIrK6r5EN+AVvr0jiWZuQzSlMGFtAb5jFPoMnwWu5M+?=
 =?us-ascii?Q?gNNYeKxUTXWlbV4VPbjZgoG4E84e1NUir5AX2jsQCYNAcm24l4mM3Ewj2PF8?=
 =?us-ascii?Q?IHAlKmiQHBxsOW21xqB3S840JbKEmRj4YgFU8nQYaVSRNTl08RJi62pWIbrs?=
 =?us-ascii?Q?5te3WZOeS72ix/MuqrM2r2OQ6N6o8rL2UzMSsM73Kd3ObaiSVdu7v1OAxQYm?=
 =?us-ascii?Q?j/GSGQZj7sJkfsPrhoEOgJIxdg0DzktXHm3QD1Eko4bNuOH43C9tsDWkrp4F?=
 =?us-ascii?Q?ctRGCFfB/iFqITWguVGGWeklCJhmtfiTk1yZVK09FebxwWjv66jBzfGJ9Txp?=
 =?us-ascii?Q?dCXzesuYXwwrAtBiPobaYd075NIqXXGDNsUgrkb3zdisbv9BPCAl7+0XWdpa?=
 =?us-ascii?Q?JBlQhekUfGi2GmT/5453ervtiaub2cT0GFofzXrgWZRJHYQqay++E2kJZVV+?=
 =?us-ascii?Q?m0s53dbj5G0d4iNBBQ7pEVcR6FIG5NIxpkkCJGZSLRzkNl1vYrZ2lq2YdKcv?=
 =?us-ascii?Q?rSvi2xhzLfToQmiC8TS34Lkp4QYIVg04y2+zA0gEUscUh4hBNobhYly2v1US?=
 =?us-ascii?Q?4lbb5WGxrFrWayoiwl0r67FrcA8zS48YPTz5+TZ8Ny3crRCuz7NCR6DevDdU?=
 =?us-ascii?Q?bZKIDe+jGE6EZ0WLCVeG764mCP/qkBgMdrFfZCAUYOch4YPtL/0xKYbVccCl?=
 =?us-ascii?Q?vIYpe9B4KDpLhCGOObZ/QFSz9+DyVEGzaSJ1oLGhotgED4Qn0vl7XRKGUZqW?=
 =?us-ascii?Q?ao3x8mxBvGsd/SIWohkvqr2BpU9yj8TYi5n1e83PuSrOHjWav4fjYx9u+oUr?=
 =?us-ascii?Q?Bdw+OjZOT/wHiMn+vBEjV0BiiLZkQ1E8wBtqahEkfL31N+hcS39g7XrTeGwb?=
 =?us-ascii?Q?QhoCwjG2gcYMXmUqs+SfjK3y7f4lhsWmR2afNV+VHQD851k2iiONHFlJFjAZ?=
 =?us-ascii?Q?iGWFkDpCEJLTxNhShLtRVVhSAqunuiXM3mm/1Kh/jSzSstggkyiQi3/suvPH?=
 =?us-ascii?Q?TmZthVJIu7QeG/+M6rWXKhTGwhj5BzU4vPnNGHqL8ynNyXWCuZ1MCckdVvp1?=
 =?us-ascii?Q?ikSIrPS5wv0Gb8CEAUgSV8Mz6PZRA86DxCuS9xG9urba1qPvIqRb/QewkN4n?=
 =?us-ascii?Q?7llykGhZ7xls7FQ0zNe+Vo5kfHv9YDqMPKVSEuA83Ii9loDvHpi5hyz0sEcb?=
 =?us-ascii?Q?Apqdfh62UW7D9QiKTGAY/nGI/PDahYtMLo6WRTSVN9hnFpmlmlWZS7Bmygjy?=
 =?us-ascii?Q?NlTGS0y+LhOVzj3LpKpycoiY9XZJN68U/5leIgbdwcDpEkY3E+CsvGPNhJTO?=
 =?us-ascii?Q?Uw8B6DTJr6bBJFLoqoFvD8g/I4cv/RKmFHn+ERRXhK/me/6THadUBuVVff3I?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fbdd39-3dc2-4852-ed00-08db1fdbf4aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:49:36.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd7bI/X8DDvEWp2+hMSSlTmdfOlIzXLlXQyzwMCIaVCMxhfz9d6ebkompEvT0j/bNKfKId/ouYMxakdIuw1zdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-Proofpoint-GUID: aZX1moYlU_AorynalPycVz98KsMqBERN
X-Proofpoint-ORIG-GUID: aZX1moYlU_AorynalPycVz98KsMqBERN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=956
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101421

* Drop local patch that has been merged upstream.
* Update ptest cases list.

Ptest Result:
$ ptest-runner libyang
START: ptest-runner
2023-03-08T08:25
BEGIN: /usr/lib/libyang/ptest
PASS: utest_binary
PASS: utest_bits
PASS: utest_boolean
PASS: utest_common
PASS: utest_decimal64
PASS: utest_diff
PASS: utest_empty
PASS: utest_enumeration
PASS: utest_hash_table
PASS: utest_identityref
PASS: utest_inet_types
PASS: utest_inout
PASS: utest_instanceid
PASS: utest_instanceid_keys
PASS: utest_int16
PASS: utest_int32
PASS: utest_int64
PASS: utest_int8
PASS: utest_json
PASS: utest_leafref
PASS: utest_list
PASS: utest_lyb
PASS: utest_merge
PASS: utest_metadata
PASS: utest_nacm
PASS: utest_new
PASS: utest_parser_json
PASS: utest_parser_xml
PASS: utest_pattern
PASS: utest_printer_tree
PASS: utest_printer_xml
PASS: utest_plugins
PASS: utest_range
PASS: utest_schema
PASS: utest_schema_mount
PASS: utest_set
PASS: utest_string
PASS: utest_structure
PASS: utest_tree_data
PASS: utest_tree_schema_compile
PASS: utest_uint16
PASS: utest_uint32
PASS: utest_uint64
PASS: utest_uint8
PASS: utest_union
PASS: utest_validation
PASS: utest_xml
PASS: utest_xpath
PASS: utest_yang
PASS: utest_yangdata
PASS: utest_yang_types
PASS: utest_yanglib
PASS: utest_yin
DURATION: 11
END: /usr/lib/libyang/ptest
2023-03-08T08:26
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libyang/libyang-add-stdint-h.patch        | 35 -------------------
 .../libyang/libyang/run-ptest                 | 10 +++---
 .../{libyang_2.0.194.bb => libyang_2.1.30.bb} |  5 +--
 3 files changed, 8 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
 rename meta-oe/recipes-extended/libyang/{libyang_2.0.194.bb => libyang_2.1.30.bb} (92%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
deleted file mode 100644
index d35741114..000000000
--- a/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Mon, 21 Jun 2021 12:34:22 -0400
-Subject: [PATCH] libyang: fix initial build errors
-
-This patch addresses build errors seen when integrating libyang as a
-recipe.
-
-There is a missing include statement for stdint.h in utests.h which
-causes build problems. stdint.h is required to be imported by cmocka.h
-prior to the cmocka file. Adding the stdint allows it to build the
-tests correctly
-
-Upstream-Status: Submitted [ https://github.com/CESNET/libyang/pull/1819 ]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
----
- tests/utests/utests.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/utests/utests.h b/tests/utests/utests.h
-index 7e85a66e..8eee26ce 100644
---- a/tests/utests/utests.h
-+++ b/tests/utests/utests.h
-@@ -22,6 +22,7 @@
- #include <stdarg.h>
- #include <stddef.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- #include <cmocka.h>
- 
--- 
-2.32.0
diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
index 4517725b4..9682540e2 100644
--- a/meta-oe/recipes-extended/libyang/libyang/run-ptest
+++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
@@ -13,6 +13,7 @@ tests="utest_binary \
        utest_inet_types \
        utest_inout \
        utest_instanceid \
+       utest_instanceid_keys \
        utest_int16 \
        utest_int32 \
        utest_int64 \
@@ -27,19 +28,16 @@ tests="utest_binary \
        utest_new \
        utest_parser_json \
        utest_parser_xml \
-       utest_parser_yang \
-       utest_parser_yin \
        utest_pattern \
        utest_printer_tree \
        utest_printer_xml \
-       utest_printer_yang \
-       utest_printer_yin \
        utest_plugins \
        utest_range \
        utest_schema \
        utest_schema_mount \
        utest_set \
        utest_string \
+       utest_structure \
        utest_tree_data \
        utest_tree_schema_compile \
        utest_uint16 \
@@ -50,9 +48,11 @@ tests="utest_binary \
        utest_validation \
        utest_xml \
        utest_xpath \
+       utest_yang \
        utest_yangdata \
        utest_yang_types \
-       utest_yanglib"
+       utest_yanglib \
+       utest_yin"
 
 # cd into right directory
 ptestdir=$(dirname "$(readlink -f "$0")")
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
similarity index 92%
rename from meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
index 16630a715..5adfc1d80 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.194.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
@@ -6,10 +6,9 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "87375f15159545a87a1e0de200f5d9d67e9091d7"
+SRCREV = "35131b9396a965e01f899127763fb4e0871b845a"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
-           file://libyang-add-stdint-h.patch \
            file://run-ptest \
            "
 
@@ -37,3 +36,5 @@ do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests/plugins
     cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
 }
+
+FILES:${PN} += "${datadir}/yang/*"
-- 
2.25.1


