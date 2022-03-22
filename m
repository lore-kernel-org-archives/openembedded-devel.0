Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB09C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:39:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.14028.1647974370157536313
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=obX0MxDL;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0080b8e7e1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22MCHQD7000881
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Vv0CxjrBtzQHw26f2v0V9K9bbXm0DxGAMZhLGNh60WU=;
 b=obX0MxDLD+kO5FLiRGq6Pk3vN4ImEQh3AMdFMpDmHEmqOAyhKcP3XVb3f6n2SIGjnvDP
 l+XTDzzs7wvRfg2kJ71Q6KB9S+fmCqCCi6kj64xvpUAodtSm7kwGBXnKT9W3JVAGxBOt
 Rtf5RZPOX3qda79S4R3ugKB3iH+8CxMRv6DWxBV1LHUg+W4viXKmdFbdHgeHE+xlHU8L
 cF0XrGti00+IRKIHOytvXI5wtXIUMAyCC5+XpM7Y8WAT0thv6RMgNmA5PgTR8PweTpz/
 PJwL5auSsbDyPbgqQQ9JP84QL+uJZxS3Cx7fHgRcPf/48Wcv2FBVWDwfJMUJm1vU9ga9 3A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewepj2gwp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv3fpOSwngVSjdkwbO48uGgxrjAfEY3XxYTBkG9zebDVGXtI8qraXdmgUweJg4T2BAb26sWp18YVGg2Jid4wT8yN2QUIlJqOzLo/7NQ697NlVax9iCfu/N7fYKwgY/cjQXCAo7c08rjzgNXSJ7f7LKAc/A6w7hPtnHVXG3hANikSW28JJZ8KP2I72ueUYoguim1kOx01muynDV5CKGK2hO2dnal4LoLVLtdLgVLbI6IVSEhMtwJsP1ax0MsdT8RRjxtjLxQKBPf5U/cJj7654ROdoVsZzUZvcXfQqgmS2JrEu87hZ5m+3PyHdamlGu4f07xLpAK1MGE3vuzZbt0fQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vv0CxjrBtzQHw26f2v0V9K9bbXm0DxGAMZhLGNh60WU=;
 b=cBw3Is6d8SSsrQfQCmeLKDmC6K6SRYgJcPcEbtmc6ZSWK4cYHeU1lT/7JCrYEv2v02PkbwBUfFerXmg/zq8v5hkR55SICGWDld5Pb4+i1gCLcUYu5XrJbE4OnmP7Ci2tMT9AH7bN+yhEr1W5oeUnjT8roKv7bI+ucD846F/FGT40MaWdchDpM11DawbjQf1+D00sjKqqbuEOjC4g4IZSDI67pjEHhzFjL3yRW2N0IMUPMyzhvJCaOa6VXu7D+o7kfkAgh2T8QklT5FiJH1Mxs3KOryXTyIkYWKp+OYJeRhy5SN8frvOTsYqglnVh3MwNYoGjWvYAcTnD4ikPl4OGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN8PR11MB3841.namprd11.prod.outlook.com (2603:10b6:408:85::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 18:39:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 18:39:26 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-pytest-lazy-fixture: add recipe
Date: Tue, 22 Mar 2022 14:39:11 -0400
Message-Id: <20220322183912.21448-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 827ff3a4-1244-4dbd-9cec-08da0c334a60
X-MS-TrafficTypeDiagnostic: BN8PR11MB3841:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3841247692F648971FA564F09F179@BN8PR11MB3841.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dQclzmwy4W+gCov6sHxKy6vSyfPWO7oyxDrL1xsCVMrlpgqkbt1FGVdl/I0W5qXOW8qeX+KqifwmvtUYPm2bk/Wks6JemRINfZjrX3PswCpJg/hZyZvpfnGXxSBba1D8hz5Qbk3NlJKpql9qlgHUWx6FtwTEgBQi9LpCBCsUy6Rb21R+yHQBlJXbZJNttAmG3gnqMXit4qpfQ7V5Kc/kD97FsmskG+gZ2r/4c5zV8yeLK0KDkAzNtCGQKKRlyoWbZIFJqd++CG4tAyhcQGloU5RRr5h1x5tzP0t6ufXItSQlAdqzE7mZ5UdCrH81YAJti+TsE76gHjw4Nz+RlD7ABn5rd4bv64lisxfrKF5oFLrnQuN1UdOdFGLx8YLQcpQzGSKBPEGdiNZk0mQobpYUXHJpmuWOR1BCrj3YT32gK++87Hj8nBO4ogSDEmOwxIqsN7jZUKQ4eB9YmUG8KsBUNSQqA9M+PEb1CMf2KACI/dyDNMZD1Yd/BAmwkc6XKRLHTsLIkLeLT+nU8vtYykLhZx5ihZUORAX5jn0oSXn94Dr0T+dtR8qejMBwYtUn3uJqnFp64MGKZ0EDIeNG1dEZj4eq+L4dIvLe4BYkv1deMFXRVzPur/axSrXcguyxrQ6TXEt6Vabif9Y2JtQzJIADJ/sI4okUQrbL4nP9/58tVkCGF+0rbt+RAyY/09CcXdaLj1XyOUqFHgma8O6qxEaY3bU2d9ICddAHQrgDt/PPZltch2zjso/enATx97hFEQsN7OfiQipFwC2AMpUeDCkA7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(83380400001)(8936002)(66476007)(66556008)(2906002)(44832011)(66946007)(5660300002)(8676002)(6486002)(52116002)(508600001)(316002)(186003)(2616005)(26005)(1076003)(86362001)(38100700002)(38350700002)(6506007)(6666004)(6916009)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VbbGvZ74c8qwoglUmxcOAnF8q6aTcg02LVBMYbhZ5JYQ0wzERXiUO8APNHI8?=
 =?us-ascii?Q?kP1s2sdIkCogX7XLfSoEIzDL558uMCs73VEfXGOEr4GkkzQ3ZUBksCbjDs5x?=
 =?us-ascii?Q?AnBemZa3U2epg0+di/laOI9BdrmIYqNR+96MObRukSiUKxoNomlhul9L2zfh?=
 =?us-ascii?Q?ambNQxmt1yocR2PRNqfPCxoFFYV/51kk0TZsWx/sHlO1i21rrZWK4UTb1Ik4?=
 =?us-ascii?Q?j6UGDsKPFezr2FF27qFM79OOyaFW6ID5EWrdhlbY+yQXg4oZ+jYsuXpxjVz7?=
 =?us-ascii?Q?ik5j0b+RcMMeJZQ+9iE4DkJLNyipnXZiOpi9OnhBnvj13PooPbJuNkmMIVu2?=
 =?us-ascii?Q?/gd81Gvqdp1ubtaM1wlLa4z+kIDiISy8UC2DZaw1T4npZt6W7ebLCb0BkjCu?=
 =?us-ascii?Q?pDEcXeEFpbbtGHc43ippv/jMNq0tD2GBOYkKV9vdWDtgEVKIz46fQ9rz9vkB?=
 =?us-ascii?Q?6octEdjTUmI61qGicDhVPMVgO4Ct5ZzLbT3obn1jcULfba7Kl2qR3B3waxVs?=
 =?us-ascii?Q?KrX/ZH3P7Lk2i453XYM6XSs5Je+RB57WKXAOPwPqRHtRzLdtjV/aRmWs49eL?=
 =?us-ascii?Q?cFsbF/pflnkTjnDF7PiSq4UOlmUML3v4xogBBasNwAwHR74E9cfkcPZhMeMJ?=
 =?us-ascii?Q?rxOpIWukEvZkm+RNFXqA1+HAx2n3MpzxYKP3zNeFGZVyuRBn34LdXshyw6e5?=
 =?us-ascii?Q?l51FKdu4YUtMIKBXAo44kaS7tdxsWKMS0p3qJ4MFXdHEBQH1WK8nyKT82ZmX?=
 =?us-ascii?Q?My6HRxbfV8yrSfwJx03OLvTcZtoCNDDJRXGKsHaO3nw4ojBHX7KnSp/5JKN2?=
 =?us-ascii?Q?72+RPnEBRG26Nsvu61qjTBewnf73qP2+9Ta8lBcUUZ8AvFa8jXGDnpbxT/tT?=
 =?us-ascii?Q?u7YH2e6ACzuNZo3ze4KI8lretlgRBsu9KG0n+qQ00urrjIK/c7yXEHwLMlRt?=
 =?us-ascii?Q?ScYq6cdzqGrVodFU4TzAMWupoE8zQU2RimIejB1ehZQalV+33tkz5YSMCL2O?=
 =?us-ascii?Q?bpv6MzI1LDmqjmUkD6SjMQERNPjEGUOSuLvZe0liwnyna+i9tFYJ3k3m9yiM?=
 =?us-ascii?Q?QvBR2CpG6f6VxkolCpbEASsJczJGJxt6OiEBmlYaOVzzBKLor/xezzvFCQPy?=
 =?us-ascii?Q?Z9EA1S4BI6KjPkhefRLvlqAp7sYE/8FT8/kBfAjrUxxL33SNyK44ctjWZYkz?=
 =?us-ascii?Q?PhT56VTnN/2iPVNepNx8xYvy5uwcXStPjv0T/g8PgJ1jtDR9PHLU0Kb8vB1+?=
 =?us-ascii?Q?M6MKkt2x/rDumREAlD17PAXkXed+1Ud7n2Y5KHLv6R0VpZD/4goBN2wdTr05?=
 =?us-ascii?Q?qsqOxag8574oxIdbQsmU/gJ8xXqLRmVvbmaHSgprfian0p3IXjhg5hv4x/Fx?=
 =?us-ascii?Q?MTOfZiXVU4/IS2OBiSN4e9upBJ9nc/Zk5GEUXW/4y4bQLYIYifBXR54gF+PA?=
 =?us-ascii?Q?dH7OGIuNJq0loMV6mZNVuvnXQBdoo12GgXdFN9jMAoLPbYvLKBb1UQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 827ff3a4-1244-4dbd-9cec-08da0c334a60
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 18:39:26.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ECj1jHqZvu/aF3HXQiudkGdpWgi23rOtRxutiL/9miFnY4Oh3qsZJpu6Rq03QNJnLDnSMM2STocHo76HM2XSoKeDEZdtUowgxbf4HJnfhyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3841
X-Proofpoint-GUID: mICAD-FVVJcY9r0kqn0uhpyTXVlRtrEM
X-Proofpoint-ORIG-GUID: mICAD-FVVJcY9r0kqn0uhpyTXVlRtrEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 18:39:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96151

This is a minor extension of pytest that is used by some ptests, such as
python3-prettytable. There is a set of ptests included (run-ptest script
is based on the one from python3-aspectlib).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python3-pytest-lazy-fixture/run-ptest     |  3 +++
 .../python3-pytest-lazy-fixture_0.6.3.bb      | 23 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
new file mode 100644
index 000000000..32b5677f1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
@@ -0,0 +1,23 @@
+# Copyright (C) 2022 Wind River Systems
+
+SUMMARY = "Use your fixtures in @pytest.mark.parametrize."
+HOMEPAGE = "https://github.com/tvorog/pytest-lazy-fixture"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aae6f2b7c9b3ced83e0b5bb42346d4dd"
+
+SRC_URI[sha256sum] = "0e7d0c7f74ba33e6e80905e9bfd81f9d15ef9a790de97993e34213deb5ad10ac"
+
+SRC_URI += "file://run-ptest \
+           "
+
+
+inherit ptest pypi setuptools3
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+
+RDEPENDS:${PN} += "python3-core python3-pytest"
+RDEPENDS:${PN}-ptest = " python3-unixadmin"
-- 
2.33.0


