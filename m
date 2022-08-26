Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70FAECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 01:19:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.32082.1661476789559939586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 18:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DfXMR8l0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52378942be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27Q0ROjR006142
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Pu3XnYsUmM5zGZ2QXaXHxL4PObsXPYgyvfTD+aA2sB4=;
 b=DfXMR8l0J1MJVttcVR62xgN3nnsPzuY7LdDQhpF/FCrJkhbC/ywVF8+327q+AVRZwXFP
 wrFeMcq18yBOy0O/XWywIvogE1OUwFUxU8yIU9amWwPMgJcjhA0eQ03Yg6JotzolfWzC
 GzaPODbi2Rsw2dN8twfLxS9GzUuGfjk7NU3v8zashSn3aV0DQVsWLDTBMEjhiPTIaTrH
 2eMA4MvKI7EGj4vGAccWDh/5X+F8uCwuYB7l2/TRo2iFLu4F4WeTDHg6cMG5OoV083X3
 Jr9IhRJxQB99fUidXHL1vLhql4hHhFeQU0ZkAElt97TMKzv7IOInJKn1Z6Bz915e8pEW lA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53ryj90p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 01:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+4mhMnhbwuUlwAqEnWMP0a+W+QHJryxWW8O6iHIU2K01opYeIxnOQu6UCyF6vsPoj/j8zTWMtAoBtY96yEovuE61RNysGjAVIX4fJ/aQ+hpsFkyc4d0zqf90+xE3fkyN4jGjtms/86ClDr0V9/qbViayHhSIIx9fH5JSChwKMmc4Dkv8zo/cUWtE0sLA85PnQg9YAaMXQvCDoX8IpuX1/DhQe7uS2SjYlDyfVLMQeQ6g4SqLo57DTtshhprq/BVlW6BsSprQ9xvdU9a5VBlbsopXzN/KMDD/X3ZPh2hqrI/fAxoT5ptpMODE/YhIiykGyRwei7ou/QJfV5pQlbw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu3XnYsUmM5zGZ2QXaXHxL4PObsXPYgyvfTD+aA2sB4=;
 b=n5IAQ9ZLWlD8tgciWg0U4NAVy8kkgfbLtrRsHCRgIg5p6cRGpcnNbALyjCbf7LfpdQSAjAeIE+uy7BCu9F7ZslHyLtBNDFc5tqGFIlgj+zyQ/6IaR5Y+qfV5Ta5ghN4D4ZYuwSU5v9G2ycS91F2wQVER7FFDyxSHZk47UsAQOszUTlH/psJL3zStuXDFywAGhMeNGPs0pk0baPydkgF461Si+Yqf4Tpb56/Xrplmh7AYXhy8RDLoNL+cU7SpswjRiZbLI2GTc1FziBP+IOGlCz0ASUXjvrtpnIEwPXLraZkMldINSnkBXd5YIXwkJePmds4yfhSkC8NilQrrzjun3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL0PR11MB3332.namprd11.prod.outlook.com (2603:10b6:208:6b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 01:19:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 01:19:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] samba: fix buildpaths issue
Date: Fri, 26 Aug 2022 09:19:30 +0800
Message-Id: <20220826011930.2818670-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826011930.2818670-1-yi.zhao@windriver.com>
References: <20220826011930.2818670-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db46ef2b-128b-4fed-c812-08da8701104a
X-MS-TrafficTypeDiagnostic: BL0PR11MB3332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ds9dFoba2eqlyoGusRAAM5ilGTycTM31kGs/trj6oHxvvcwkBuzoSvKPM7/cG/WgxtP3bxNRiv6QZcEjFl0dF68kO7t7tq45VqTB9tolqtkfsoBRSWZ6F+LJtrs9FebLT7knTNCWSDRQzBCCDzf2MEKw2dMtTo7LiEUW7lm4JHrWPPHKm1BE8tIQrF2vOS+2I/viIl7owLQwr9lDFr6e7C21DZVlE53x+FEJe/e/UGLWqpCeS22bRN2WVgRucOUGFpp5x2K2QoK2ckQaJvy67Nr2xHz61nqJt8vadUR95d3oqbgPOyjYiGGxt1k2DaCeU1wOIoegE/zMUGIG8qjLaHxhYXRxMSfMSHdvpISB9Gr9ZhCX7bkslXKC43FuCaNmM69EOjF1ci3irto/W0zUZh+H78oJX09ZvzQCe037C6R2nmPHQeGRiQiZg/yO2vwL5OH79ofnKk1wz259andFa79XC2X6bPVTLwu03HyTwRruRHVox4DNZXmzcd5/uPC6m4oTGyrAOGIzzR55wywi0Ga+HoOTpZmgvHdIz8JIzQfuLJwPK+S0STonfsSo2e0N93hkJxfID+lWAtnyjJOjnodvcFVLtyY2lxXZ9yLj1ZEQCQD3u18ClQvK8qFt0Rnl10lz0bYN6X+wWE1ZODZ9cU3C3VNh7CgDlGjQtPWNC6q0Lw7gWX6duGlZM3V3sPfMpBuiUWzc6YgMVtKV38Nmec+yCI+vKR58dH934ex7B7vT/ZB/y4dZW/jnFPUFn2/tRf9AosGnGg6/RHiEnJYXbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(6506007)(83380400001)(186003)(2616005)(26005)(52116002)(1076003)(2906002)(6512007)(86362001)(38350700002)(38100700002)(8936002)(316002)(41300700001)(44832011)(5660300002)(66476007)(66556008)(8676002)(36756003)(66946007)(6486002)(6916009)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kTh+Y1jkc76TJzb0zUCO/nFw1ivST8zP8mNm4NwSEPSjUvtMgW9biTtRKsjb?=
 =?us-ascii?Q?IoDWSno1g2Lg0cFuYn6zFz8XghepxG659lIKyG0J0Rze5PMw32i3jLuYVB1e?=
 =?us-ascii?Q?Ug7w5mifcSBrR5ssZ4L7a2AOQAoja13znzQ6DJzrIhEU6iHUDe/ps8Qu7QRv?=
 =?us-ascii?Q?kbce37ofv9yHRPGcByKE+6phzizwN4HOdAW3fvnlSS2Fw5vmjzT+Y+l30U8K?=
 =?us-ascii?Q?SDb4D3K9omlXBK6qyGvTCzcxrFUmX3Hq1VLro/nuGld344sMlveH95A+idTp?=
 =?us-ascii?Q?F7xxdbeEiCfu64GXLK1oSRxF/qDJ936lTvcSiiaVRgs3k1/iVoV1SLnMOOOY?=
 =?us-ascii?Q?0fEQOakLYFdSdIVE30xtm1/Rk6/yXFJmz1VTTeUvbFFxWqhOf1rfetBIjeyL?=
 =?us-ascii?Q?grDAhWwjlvqDpz9bBzOlLH/KnkNhBSYFrSW1guNA+sP/3MwY7pZTQfgNGSmf?=
 =?us-ascii?Q?30NG2Y7lrqdJQ5Ubmhf9tbzwl9tixnumQCqgsR51elccBWKSFrDyJQxwPfDs?=
 =?us-ascii?Q?LcJT3B2YRjNZoOvTmuk7uFzqyMhkkkPW0SNWirTOtBNRT/bh1ZfqKCZ44/Mf?=
 =?us-ascii?Q?Xus2W/3V5NU28yA6SM3dEjErmbjPjW8b8QCaVJ5BPGz70Qm9+7ZFdzsLe1lp?=
 =?us-ascii?Q?M0BzG3IBuxmFMaX/ZjV7Is8p/MbYAAISd4cYSD2Ne3IO/NNkFbtSTwEFUT+R?=
 =?us-ascii?Q?gRDgB2DVfho53VqYLhhT/4kfhAxFgq7b6hMDp4+YjvM/jNAR39vYAmoKRq31?=
 =?us-ascii?Q?L3kUJ9SOMNgqn62pX5eJyQg1/hgFLzzmDE5QtyA4QIa7bduhXvhucYsUSq0j?=
 =?us-ascii?Q?rvcfLMTiJUfMFNBy1hRxIrDUcjq2YWjzDQj/QArND5TjvjfxUzaJCuTiPHcc?=
 =?us-ascii?Q?a9DzkQoVHSjcyzF1tGBVu7uPkNQ+DZHo7jv9bGqPih+4nLZu2rVa1E2mn6Py?=
 =?us-ascii?Q?NMG94pJBDwQXUfBIl20DDNMmt0TWtbo6doFSOw65qbfA7+A9mALhocQF2CHX?=
 =?us-ascii?Q?qZgCeHxvikiov9nMoAB6+n3ki2V45SK3BmYDKhv8Q0xx/IIazj/zSPZqa0rl?=
 =?us-ascii?Q?k3O6aqQiTnLCT7lvewwIo5enMsGP4fio1nJCAHakcKzb9BPSNNhcE1IkKvsC?=
 =?us-ascii?Q?Ba9+xnLuZTgek2meL3dEwe7SiJKUEw+2+0V23ZIHRrErfs6rBETifQnz1T24?=
 =?us-ascii?Q?QNOQv1iGtLVTxOGItpSCP9w5323ScZXJEWs1EZbD8rWK8QG8h5DGrNQHbZ5C?=
 =?us-ascii?Q?jxfx+b/T1wfggzzu3Cstb/97cBr3t2jQBF5T0wud6Gecw3PinADvMFj2OsTg?=
 =?us-ascii?Q?fun4zTtuih1H/mmIT7IuOmszgTd9HI2DnPkRdD4I1rMuopmoLCkMB2dCev9j?=
 =?us-ascii?Q?WAxd2LKa/CcQ9pa8UD4H6DeRuISTaK0Nhcej7bKKr4AEgAM/IVwKndPOA783?=
 =?us-ascii?Q?k4BZZ0xD+IbZC1WoWX2raC4qVZFgeUJoO/mi1EWlTC0IIbsOEcVlvgHKvcFc?=
 =?us-ascii?Q?+wpezNEheIxU/sWigcELgEMtEfixqnqh0ewBkZkIb/Ab0qpqgfU6XEo3vUjc?=
 =?us-ascii?Q?8zKhcsvrtWjjKu3az4jrC6HQXx7A8xPl3q0djvWy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db46ef2b-128b-4fed-c812-08da8701104a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 01:19:46.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0HFQYe/DdVhMc+auBkIUzaJNUKpsvA/H21cNyS+2tT0yxKUVW3m1d+g6kNGCPcBn2W8eaizLm8cG6f1B35MQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3332
X-Proofpoint-GUID: p6VjdpEW_o9ArtL95veIoqVvLI2yQobZ
X-Proofpoint-ORIG-GUID: p6VjdpEW_o9ArtL95veIoqVvLI2yQobZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_11,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208260003
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 01:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98439

The test case tfork_cmd_send in smbtorture fails on target as it
requries a script located in the source directory:

$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
test: tfork_cmd_send
/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
Failed to exec child - No such file or directory

This also triggers the buildpaths warning:
QA Issue: File /usr/bin/smbtorture in package samba-testsuite contains reference to TMPDIR [buildpaths]

Skip this test case in smbtorture to avoid the warning. And also disable
rpath build.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...orture-skip-test-case-tfork_cmd_send.patch | 38 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  2 +
 2 files changed, 40 insertions(+)
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
index cb3678d7b..8877b8e1a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
            "
 
 SRC_URI:append:libc-musl = " \
@@ -114,6 +115,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-modulesdir=${libdir}/samba \
                  --with-lockdir=${localstatedir}/lib/samba \
                  --with-cachedir=${localstatedir}/lib/samba \
+                 --disable-rpath \
                  --disable-rpath-install \
                  --with-shared-modules=${SAMBA4_MODULES} \
                  --bundled-libraries=${SAMBA4_LIBS} \
-- 
2.25.1


