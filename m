Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0E3ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 12:58:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.48765.1661605094413802064
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ooF+I1x3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5238d37d9e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27RCwErj028350
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:58:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=c/kleth4E/5+og+d3PBxpsPlyylBu3WUYDnjXczpLYw=;
 b=ooF+I1x3+wIWNDJ3Yi4QlsLgeBTnpomAo8wY5veiiT6OfxxD4VTonRCnd8xdcwpDXut9
 P5ZIcRfLvyjsEYHtm7H23SDCsDI8lc/ovdTSC70FimTBFTOtH81ahhMWPbYUzm5HUqhB
 9C+Zlb/NDlRRHrS9fRo5/hkyW5zzrPTvXAQInZ57uHC7+jqMS/bd9Gzw/29E5ZnYCHcT
 LTSXQ4rXlFLrLt/K6XQP4cfbDwwcXC7znDTARSBLyu0uWiXevALLWoQpuTbW+wtbBZlU
 MeDnbI5gpjZW+3wxu2t61ExgIv7DKijMhhTJzJ7ywMag88q6gvFPhzaS3HZCAGyMFyqY JA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7ej6057q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqmQanlH5j+HD1KZU5cN4gQyv81CbrZQx8VBatdZnM9EMYlcSUcl/DVicFJ1iQl5o3nUcA9aKNkoyFu+Jt9OwrWZEya+giN1KQB9/VP1jaBA/gJlFJMXxFmazqNdqhdTeF3JDGk8tNngGxf9sVxgskWmu+fVrJNngB96FpyV/CMZx3FKMXY1NQgGCyVUDPdcNqSy9ye1UZ80q5c+0mVor2GQgVQGYEZwOtI8ahZUQeXEVu89DfGFWhjaqMc1osVTY/ovmXhUtHsFtaMInfXQyp85G64uEyRRB8k2cBQjrcJeN6MkAlyps6Pfrg3yC2t2UFeJXgMnUf5gZfHTDsUYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/kleth4E/5+og+d3PBxpsPlyylBu3WUYDnjXczpLYw=;
 b=LTi4Cucq/yVRk+CsWDUQKjy2HekjwXHTzYfZbu61XeGRzaBJ45lcgT0Umt6q5zuGuvmkpO8lbdD4begeATJUqp0FZUwao5z09DmxD292a6qi9lBzYeeAnk2PGts0/Ph/PSq2ut3fSd4dLENuUK2kYU44xaRlhZl61NUND1oUZ0GxIIw6GWvjyOQjXp0JTYzUb/Z5T//lbAHxwXLLNyazHUNntfaqRC7Avwx0cIbDJUID1NHukPCgYXMoyuO412xvYSKUWjus0JuiWFKMPdcpyx+Jj9ECueS3zX2zNZtkwKfhmSU9OSUfcDGqGzwVF+JLUAFc8NCiJ8jlDnWXq+tyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN6PR11MB3038.namprd11.prod.outlook.com (2603:10b6:805:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Sat, 27 Aug
 2022 12:58:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 12:58:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] samba: fix buildpaths issue
Date: Sat, 27 Aug 2022 20:57:58 +0800
Message-Id: <20220827125758.3855132-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0170.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db2ab40b-b666-454f-0e73-08da882bcb7b
X-MS-TrafficTypeDiagnostic: SN6PR11MB3038:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0nCGTXHxwqSAi2qS4KJc3+Mqb/AZZXpplWDyH1kbBfXM/JPNTq9aMj8Z5P5lTEQbICfLTrbHlB0rxkr+z/+XSxqSXhBr2xlTaeEq9IsjusXH1rep0QM4kGKzHx7qzcoXhEnRlFfRM9mdtt0yHoguTX/s0DaO2ozJmuMxYjjlyyA8z3EPmrq0Y6/5Tojg/WxcF9L0o563/kc2GB6oR+IV3rGpOVCDjV5JTZIADtW+HkiOiWAFFPv8WH/gfVUtAtd9GP2xpe/8UQD+ws44FjxNhasY7h1pMBIJdG00cee7Tu6qT0ywCe29maW3P6l83dgIZ4+YOFGRGx31+N3LvVDTk9sVxFjlUgV9PCvFCiaD6fS1mweNQMQuM/YUjVITWULqX8BEnfea6ZR0rPnXzdtA6hYhf3li9ohGfTiS1fNabGkNvOK3Fo8ma4KuBzToFs8AOodNOKONIOkyKvtLmepZtM0e3avlPTZfWYVnT5ZpN7tRjMvK/iuqkTDi+BPQ4QuYorfjj1sDgs6LQzf6r1q9kLTZIHtVkRov6HtETyqy8LH2bucHJV/IQJv98ghP6BsCsSPEx1Fn3Vc9xYcAkrp+gDR/wQozT0PcJLXuRx1yDgXSN14OQ8VXpZ7vLaK+TnLT9mIsjqqaRv73zI0JIbdNDUmm/ciwJhGfOAFE1bsJSG00pP9caQ8POVVUDwynuVQzzFwAasSccbDVeQrJh+Lt/wXtO0SX+B+Ts0PjkR8r4nAtR//7JitwxjsrEpCwwli4vHgKcZZmQYmPT32Ek96d5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(6486002)(6512007)(26005)(52116002)(478600001)(6666004)(41300700001)(83380400001)(6506007)(2616005)(186003)(5660300002)(8676002)(8936002)(1076003)(2906002)(66556008)(44832011)(36756003)(6916009)(316002)(66946007)(66476007)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SFKsQxE/0rYFVjFUmXSo2cbFl4l/547jG6/TwuMOXVowppCk8HLx7UQDKOva?=
 =?us-ascii?Q?bnBTeRsmaeVru1/ZBeEEeM4Xny4qyxNcNJp4FZC5iAj2iNQCyr7MXckKxPm7?=
 =?us-ascii?Q?LPXxcSIKzcfASAKsMqu2tRA0Rjd5NGESBNPmx+1RJKZbrq/FQ8RUj6nAerst?=
 =?us-ascii?Q?08nZQXwqTRafjF7SfmtgjFSN3GmwzNWQpupxjJdaVWkW37ivQhgjSxtm3dxp?=
 =?us-ascii?Q?MDnyJ6v1OJGDWJ/u5bF4w5W8mMOKohdNGRC4qRC2PVbR2BFWobP2SDIcX6Vd?=
 =?us-ascii?Q?6m3Q2exk2/NtYrbFRd9PRl0XyUY0MS4NQJ89ADuCyU6DwOogdcczKlnKX2Kf?=
 =?us-ascii?Q?Gw9GqTngB1u27c4ImPDuVCeiz8zuoFkaCA5Ktp4RPkuh04fAwDJe8abrA7D5?=
 =?us-ascii?Q?YJSDMS5HEGcSzwqvHdAGDpKJMThKba0/me5Dr4me4XNzgHILsHAo9aupH5UR?=
 =?us-ascii?Q?feRtAJcZebqL+4T2llKXtJBYSdHzNzmplW4pf5B8XRZ+UGc4aNNBLkKwjEUu?=
 =?us-ascii?Q?iCiaY4TJpVIOMekHC5SRKOccFmoUs10feG+F6OZj05ly1yweUoc/go2W+ajX?=
 =?us-ascii?Q?q6FCAu2t5gO8mVelcWmsuW6J1GXj0A06u3HMZbovXFtMUgyaAtyBAKxCT5Nc?=
 =?us-ascii?Q?VrBV0CfP+SrI3UN9Nn8lQHu7GUZyAn/2AevzGGbiwsa7P12+e694jkSOXCMR?=
 =?us-ascii?Q?8k/JPWGCGDG9n8RWxhyq188EcRSxWgM+NqCAiMQ8G0bWLfB1e8cqeerYU5m6?=
 =?us-ascii?Q?15ieWJhiQxnty11vOLu0gX3ecAgB17GgsIO7Du0Vg6jxKsyj4Wh6/az9qgv2?=
 =?us-ascii?Q?GmNOAxHYjul1M8ZsxT1BcuCQ83R8740gumrJLB/pqEwDlY3YqAL9zuNze3ed?=
 =?us-ascii?Q?Z5x6swWAhna4NyZ+PHU4CZU/kPMMu8IALQenZdptkWKXEmcr7bqsxytQny6F?=
 =?us-ascii?Q?BoRlcubpEOem94QxXZzqmJpmq8507dLEmLQalBkntuUBcbABB/EpaugA81nT?=
 =?us-ascii?Q?G6V+ZTFw6I1I0ArASi8k4HIGWVEWTjvybOs1/vhIdIPewBOMowfFtBLSoIpM?=
 =?us-ascii?Q?It85zKYU0NGCzjTvUyaMMDbT2UI8Bz+SNcFDVYnj7G/xlk3aTV7SnDoyBGNn?=
 =?us-ascii?Q?tTFJRF7dRF7RNbVT+zdI/qrGtFG1Ixda46DgkilssYp0yxrippuSPtGjBSM8?=
 =?us-ascii?Q?BQ0Irw4KSyneZDKyWHZL11j+oxPXYxQrmLRKzq5tL1f4GWRJbH3JsYk+oBp6?=
 =?us-ascii?Q?EAFehJD/clPRFyp8OV/YQBW8SIh+DzMYTl8RVpSx0UIm4te9oAPoAfWYpOLC?=
 =?us-ascii?Q?bm3QHCm4fjoN/WBj11tD5ofAZidGdy6skpUEuyqn/a0Uxw98Mei6aQr38TIz?=
 =?us-ascii?Q?jp+qUWNRPSwZnwPOpPfFqaJDhqvDrsqmipy6yPPfaEdSMaqQYdU5pzzovHOc?=
 =?us-ascii?Q?eyl8UwEW1KfZ5uUkS6KjSsK/vX8j6pQZMqJph+NjABZvV9/Gzu+gvXyNtDcp?=
 =?us-ascii?Q?Wb7JA68JX8v7Gt8cNwq38c+SwduO7GID/pUPwzJzkA6DitsF/CUeAONScx2y?=
 =?us-ascii?Q?gzfNX3GeDCF7t7h7SOHkYah+LMjz0cyct/86QUlN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db2ab40b-b666-454f-0e73-08da882bcb7b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 12:58:10.7199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TS0hFaz1DQWEhdl+WrgNGtGbNiPkSwSyI+W9Zjo7tBjVpWPpjOEAe1ZpefZw4pak+v93urG5pxPcZ8FUXhs9+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3038
X-Proofpoint-ORIG-GUID: FJumHlvc5mAH1bf1ke2OfCUbDQFcGn1v
X-Proofpoint-GUID: FJumHlvc5mAH1bf1ke2OfCUbDQFcGn1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208270052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 12:58:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98491

The test case tfork_cmd_send in smbtorture fails on target as it
requries a script located in the source directory:

$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
test: tfork_cmd_send
/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
Failed to exec child - No such file or directory

This also triggers the buildpaths warning:
QA Issue: File /usr/bin/smbtorture in package samba-testsuite contains reference to TMPDIR [buildpaths]

Skip this test case in smbtorture to avoid the warning.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...orture-skip-test-case-tfork_cmd_send.patch | 38 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
new file mode 100644
index 000000000..90ee31786
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
@@ -0,0 +1,38 @@
+From 059b517f9ef6cbdc696e0983ce255b1728042827 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 25 Aug 2022 16:46:04 +0800
+Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
+
+The test case tfork_cmd_send fails on target as it requires a script
+located in the source directory:
+
+$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
+test: tfork_cmd_send
+/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
+Failed to exec child - No such file or directory
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/util/tests/tfork.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/lib/util/tests/tfork.c b/lib/util/tests/tfork.c
+index 70ae975..4826ce6 100644
+--- a/lib/util/tests/tfork.c
++++ b/lib/util/tests/tfork.c
+@@ -839,10 +839,6 @@ struct torture_suite *torture_local_tfork(TALLOC_CTX *mem_ctx)
+ 				      "tfork_threads",
+ 				      test_tfork_threads);
+ 
+-	torture_suite_add_simple_test(suite,
+-				      "tfork_cmd_send",
+-				      test_tfork_cmd_send);
+-
+ 	torture_suite_add_simple_test(suite,
+ 				      "tfork_event_file_handle",
+ 				      test_tfork_event_file_handle);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index cb3678d7b..53526a26b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.25.1


