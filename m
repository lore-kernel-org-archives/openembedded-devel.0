Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13306C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:03:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43828.1679493832213911324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=clg2/pgC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=244517f328=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MD9TeV000955
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 07:03:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=fZ7hfJG5c3WTbeXALWKb1UAuC+QPkU21OtdbaZW93WU=;
 b=clg2/pgCrzKRnfP5IyxtPV2BxBQLXv7FmsjoQtoJ5cvjZITEnrxsxyipJ7rhARAcvrSA
 n/Gon2ktH9MiSIySYHko6KxbD/waZLEtnl5mVLc2iPWvQWTOzHUQYaXaiciJ3CDyAOqh
 kxIberqH5c9Gt1f/7NEs0pRNY6AsAdme4LjYQAJczKnrr45VnYmyBzWDTk+j3W2tcEv9
 kGhGAEHuVkmNhmZoWkwrvAxvtymkrVIawPyO/j5/VI3lJmdiJm8zlX5uUkifX983yDJP
 jQZsRXJXLhbIM9vtljkfIl9hRvM+dlnV213vPfNZ+59KW6PSyW1TtgflRJFLb5Rtojwq EA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb8jpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 07:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhHZTQ5DqXutFCLi13D0IrffYnhybHlnbi/VGSrAAuTVZyWUKXYgndj4EWWKVY6k5dDBvbDovl7Ybc5DJ6kjag6VzL4jUSAS9INuSR8UiJgnpUGhY3y1/cHzpyYkwm6Pto/1ZZOR/RwKnz2VTu+Gc6E+g8sa6Iy/b8n8q2VUcbRUVZN0v1UFtsMu87AvI8iqbMEzjfsRkzKz/WqfsakJ4NzWBWNmWELpjcyEGLj5j4tQmOCPX3pc2hawFr6p9dkbK8uTM55ZkOPiI2fvhFkau1yy9LqGt4WIpD5uLJcCeBESwEUwF7xfUNxpjgDP9MY8a/P/gwqZnKIIvdfYPZcH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ7hfJG5c3WTbeXALWKb1UAuC+QPkU21OtdbaZW93WU=;
 b=JS/N6BTIKolQzvLeU79xhKXkXBFcao594RdYJ5AXNv3c8O5JZsx++dsxS15B266QIt3VamhR/565NBxkJYjVxaAnqh6tXy5MGefkcoa0sMo9mkucjXbxs2mJ6HqTL0VgAlANBftGLI4daCK7FWK+lJ+R9xjum6MFQ8WXrB/KsX0aRIONYAc0HwH2YiXyHmfuc5LMGoCvN6iTCqe+NUzamNw2CQGgaDbyrNigJKYozLFrpCTC62X43WVyLfpJ/DVSts1Uy/Sqxp2jAB+AtuzTiv/EZL+9tZIf0okHImWiFiXyUAH0D6Lq0WvXkohoNzgwGAHqMHYzmANKIArHpuVrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:03:48 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:03:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libyang: upgrade 2.1.30 -> 2.1.55
Date: Wed, 22 Mar 2023 22:03:37 +0800
Message-Id: <20230322140337.4103357-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d4533f-de26-4741-61cf-08db2ade4217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Eof0x65i/48g5iNKlGXEsfABvdYbp1llbUc0PLmOQ/Yi5Llqz+9Yaiy6AJo0ZEyQzGUmL/AKTHFb0k1UcN/mZ+tkRxwaBecdvDVQbFYrbtUkI2nMK29bP/rvX5Ox2KkSLf5NUKQ5c0tawbRzcJ/Uf6mQ77h+z5yoqu1KMd4Xvi6X2Uad+Jg6vevksHU/4BVvQcMP3eFgZ8vFLPvA/S/BQiF5l2xIWihXYHQNS3+Ao4bXSZgYuXOQay+e0Zup0WebpjVQS4uaEddg2ZzMZKbCtz0xb6zGKbKVGkMiNS4xGon6FQ4zMp/2O3mxfxYVODxHTZtHy3db1tc426buspkJMQiZjRDKpOwUfQQLOb2qJDVuwT9U9pqz/omIIewkhI2sXvUASyrFCiAj6eAqrXrGqSxniO++x8Z1yR7vsBKXhoha6dze8fbHKGBaWs0QwOwTTpCSL+OoWIsNpjlHG9akvgQy5SAZnZ6LmWrY73kkE6j08gQE14W0OygUhxwnzsn8jjw+OgpjM8F4xZI5Lex0/SYph5cf9+PvkW7C7nKIe5AlHcx98YejPQqC94ADUnYjuNnUCo5TRf2BmTUS2KPWu4gw1Hy16rDPi1lKXXP0qduncN4D+6C0yUP2069k75OLAgxV11m0zENWTCtiKX8Ywhds9FFSYZddYnmXhXCy1Onb7dW1GhXfXiQrE7dN98VO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199018)(38350700002)(86362001)(36756003)(52116002)(83380400001)(186003)(66476007)(8676002)(316002)(6916009)(66946007)(478600001)(2616005)(1076003)(6506007)(26005)(6512007)(6486002)(966005)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ipVtuHgF0HGGBfeqCRXepCbWwFJQzou/a7Y8W9FeyOUGJC6tOCgNzRU5GHRR?=
 =?us-ascii?Q?iabQMWqhPoMJvVPjHU+u8tOE2yx6yRtp/KbAwPfB5DwWpBtj29czpungcLfk?=
 =?us-ascii?Q?Lltw7Qyv5JYiirarSGpaHP64G5/zsOYXxIGnNo3guQCuEonQxyC9cjwASqxP?=
 =?us-ascii?Q?WuXWSdDo9J2V9yd2VhOkqYviDfkPpndiV8DSfUJj8omJz1jCrBkqmR4b7PBc?=
 =?us-ascii?Q?O6aliLvgrmWhi9Zc5XjhwU5YLTuR9dxL5KjMigfmYr5h8e2AEIxnyEG6zsLl?=
 =?us-ascii?Q?1GDlyCCX3MHmAieiTd7B55QfxetwkVIPXty4ayd2mu3I7v4qlHyJFkXObfUu?=
 =?us-ascii?Q?Q+S/2xff0C0gdvv3b0VQu/LjgwkJ0gfuJaB0tQelAZmkBUKymfNOkdFVx36o?=
 =?us-ascii?Q?q/oLNDnNpAD6Yq6VDkEAo37nGpsObIVx9S61M401d4OS2DPDWfQ43n3mHpnL?=
 =?us-ascii?Q?iXp8WP9kIv2f8RnEmPAeB48vzz5K3W2Taa4AQ6BPHiMk+IRFqgOYWoDUeuzg?=
 =?us-ascii?Q?8XMA6fedEiGtLpiIY2zccua0MUtxDkzN8jjUKLE4ocWnoQX2WKvIVAdkUKii?=
 =?us-ascii?Q?4IJwurGmHa7un13EoiOo6sxuK1RB8pQfw/GxeIKV1PPSp7Jox+cPAhWg1Llm?=
 =?us-ascii?Q?kBycAdDGVmgd6GAX45eYhKalVsye/ArD833hOdcGswqrw4tRHOfUMArrqOd1?=
 =?us-ascii?Q?4hkhuiVK1M1bqiBchq2xnw6VCFb4IvgYX96GD9+NwsH5i07MMjeU/BMbZkw6?=
 =?us-ascii?Q?VpFkzMa3eWuwhfPxwec7079LzVtTRutKLQCtBJFLV+OMd0Q6J/HP995Vh0F6?=
 =?us-ascii?Q?ozF2qUaeHceh2KWQoccrOaM+WXcGxVBa8U4SL+8iXl+Miuj0c6zyGngVMZZ/?=
 =?us-ascii?Q?qgkrm4jZbm29d6vzoJ66owiPKtq3+nmlgCcaLOqDypH2F2JVLc99dCWZL8AC?=
 =?us-ascii?Q?X/+96HahG4dCuxwUgtaV8KscsNCTYlT74N7xPa1Jm/mmppuf4SitDei4U8uN?=
 =?us-ascii?Q?zPQf+vC+q502+MaYR28RHjey+WVv1JywoN5WCq0BFYvZwjWs9d654l+bMjKm?=
 =?us-ascii?Q?bGHRh6qUcDTiE3h+KymrrPk9lQcO6bOCugPE0DgjkPIxnvdOBS9RxwWDVD6R?=
 =?us-ascii?Q?QKTgejiDtVJnkoDmw746Po6KlcB/u83tHaOSQFQvbKyEviojoIkY9AKtter6?=
 =?us-ascii?Q?Owg0JfM1tTf0GwKuZNUHTcBhYR/m1WMUvx/eRUnthulnIjqtqi5mU2sxuKLK?=
 =?us-ascii?Q?wi6BOEhMSAfw6y8duz79bpjWPYMWmO3r3VLNbFJeYUaEkX3DHJjI+N9OmmIW?=
 =?us-ascii?Q?AFjvTr7GqOXoodXYO0PaR7QUEMZrhfy1g5+u8rTaQ5acbXlsUudYXCukRbMh?=
 =?us-ascii?Q?+mrcJ99zyAAqDEdWHjQC8d77GH01gGfiqKyQCWVM16qu8CmHkISYYcEQPm0i?=
 =?us-ascii?Q?ptHvlCAmlFSwtFTMZbWV9X2Nkr9BQGatAqEPVxmQ1508NgCbgExf17aIEHfE?=
 =?us-ascii?Q?xKVkFf2onNEHpN3UOafgeGCBGu26WsAQ2TDBB58NVGjNythEDF/o4gO9dKUX?=
 =?us-ascii?Q?vgnFpeicO6DvpYzQ1wgMOQqLd1Jx1TCZciZw3bCi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d4533f-de26-4741-61cf-08db2ade4217
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:03:48.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6OUn+1iK5n114pq2mg18LkwO7L8Nlz1NvJyesp+BbnC7RWLGPTNcZKdmIYVjBtnA9LN84MKk9j10txyRZejLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-Proofpoint-ORIG-GUID: 6YfBkdwq6gVt2RetyW-saE53WDH7TbZb
X-Proofpoint-GUID: 6YfBkdwq6gVt2RetyW-saE53WDH7TbZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=928 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303220103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 14:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101637

ChangeLog:
https://github.com/CESNET/libyang/releases/tag/v2.1.55

* Generate cases list dynamically in run-ptest.
* Add a patch to fix ptest.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ntext-skip-test-case-test_searchdirs.patch | 29 +++++++++
 .../libyang/libyang/run-ptest                 | 61 +------------------
 .../{libyang_2.1.30.bb => libyang_2.1.55.bb}  |  3 +-
 3 files changed, 34 insertions(+), 59 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.30.bb => libyang_2.1.55.bb} (91%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
new file mode 100644
index 000000000..3c6aee924
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
@@ -0,0 +1,29 @@
+From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 22 Mar 2023 16:03:56 +0800
+Subject: [PATCH] test_context: skip test case test_searchdirs
+
+Skip test case test_searchdirs as it searchs the source code directory.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tests/utests/basic/test_context.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
+index cfba1d30f..8c3bb7ad6 100644
+--- a/tests/utests/basic/test_context.c
++++ b/tests/utests/basic/test_context.c
+@@ -1061,7 +1061,6 @@ int
+ main(void)
+ {
+     const struct CMUnitTest tests[] = {
+-        UTEST(test_searchdirs),
+         UTEST(test_options),
+         UTEST(test_models),
+         UTEST(test_imports),
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
index 9682540e2..c507afb2f 100644
--- a/meta-oe/recipes-extended/libyang/libyang/run-ptest
+++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
@@ -1,73 +1,18 @@
 #!/bin/sh
-# Valid tests to run
-tests="utest_binary \
-       utest_bits \
-       utest_boolean \
-       utest_common \
-       utest_decimal64 \
-       utest_diff \
-       utest_empty \
-       utest_enumeration \
-       utest_hash_table \
-       utest_identityref \
-       utest_inet_types \
-       utest_inout \
-       utest_instanceid \
-       utest_instanceid_keys \
-       utest_int16 \
-       utest_int32 \
-       utest_int64 \
-       utest_int8 \
-       utest_json \
-       utest_leafref \
-       utest_list \
-       utest_lyb \
-       utest_merge \
-       utest_metadata \
-       utest_nacm \
-       utest_new \
-       utest_parser_json \
-       utest_parser_xml \
-       utest_pattern \
-       utest_printer_tree \
-       utest_printer_xml \
-       utest_plugins \
-       utest_range \
-       utest_schema \
-       utest_schema_mount \
-       utest_set \
-       utest_string \
-       utest_structure \
-       utest_tree_data \
-       utest_tree_schema_compile \
-       utest_uint16 \
-       utest_uint32 \
-       utest_uint64 \
-       utest_uint8 \
-       utest_union \
-       utest_validation \
-       utest_xml \
-       utest_xpath \
-       utest_yang \
-       utest_yangdata \
-       utest_yang_types \
-       utest_yanglib \
-       utest_yin"
 
 # cd into right directory
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd "$ptestdir"/tests || exit
 
-# Run specified tests
+tests=$(find * -type f -name 'utest_*')
+
 for f in $tests
 do
-    if test -e ./"$f"; then
+    if test -x ./"$f"; then
         if ./"$f" > ./"$f".out 2> ./"$f".err; then
             echo "PASS: $f"
         else
             echo "FAIL: $f"
         fi
-    else
-        echo "SKIP: $f"
     fi
 done
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
similarity index 91%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
index 5adfc1d80..b1438c3b2 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.30.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.55.bb
@@ -6,9 +6,10 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "35131b9396a965e01f899127763fb4e0871b845a"
+SRCREV = "9a4e5b2ce30b9696116d6e654ee55caab5aafed8"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
+           file://0001-test_context-skip-test-case-test_searchdirs.patch \
            file://run-ptest \
            "
 
-- 
2.25.1


