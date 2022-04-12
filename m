Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB22C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.12014.1649776214732448818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nw7Zo1Fl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11014c7d2a=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23CDtXQG015369
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:10:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bDZ9WO4zle2XSgeh7ZWuX8F5KyIvLXI+PvJy6QArcAw=;
 b=nw7Zo1Fl9bAKnwElDXOPu8bGwtvRvFsple+AKgiVIqdR3DJRG5ZY2uPvA8/wQmRkc/9L
 wuhh2HKnbJPt0oAE7lo+kHWJ2unExdrwX0n875QV6lhkvcZaeQMXTA3FP2rXblPY+DEu
 chX/OF2gMOJGiONKf1X0bBdM4TsYQGP2+hrIubt8BVToz8GrYmXoTQ6k305YBuNjG+HB
 gD+m5+qGuOO5JdD2bw+QmVipxt8svPr0GVy2O3atw8b8ur5bWNABja0nUqf0aHc9HXUh
 T7VPG9rl887Exwot/a7K4YMQh/u1QfS4yd1XvywJtFPkJGVGt5pOm1FhRit4dfTxXSmy yQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nft7tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:10:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk1/4XHOViu0Am6oiHioPOoQxiaxa+r3YVa74HH4djCSsJ04l8z+2wI+giaOePQGv8wBLs0BgVhW3g8aF9fIbFfXE/JsCAieFAcEuqxYD/IWLHBXpOvlflMj1Pecz5C8yFuzkun9DF4NjcnOL1p6IvH4GSb65BFu9k/+hnbKA/ut3fJzjuw7tJGZHjtY4lRrHuSdMmojmppQkRIvVSaNXXV9T2ivjzF/cRpzwTBw7JMQPUoe1sWHtVMA9/nHJAedCAeNmhKE4T5TMN79DnkKsG+Ngd5JrsVF/PMKeUYeipkhytTvkpI7vVJyggYqEQo2zDzm89EQw7BF00Ncp61feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDZ9WO4zle2XSgeh7ZWuX8F5KyIvLXI+PvJy6QArcAw=;
 b=YyQUJmfQ8gzEs8eEmMFTiijz7gvQMtJiM0D267RZ/EbFIf5feWeQDSzi/TTBelyD6lkTu1jBK7nK4FMKh5VxpFXX5YUkb4OrIx6Zf4QZzPrh4qSvl7SCK8wXd0M3v8w4lxvwqmsPp8e0lfXGJCHsGUZ0Q4SXJjLOOF3VG+SyhU2rra60decOBK/WQ7cDoG014fZpieCY3L5p7YfFbGMelETFCiVxFLksf7Q7nnTOeSRuN6i9KUwGIugsBS4yqUXHjOSa3Zzh2qXl0ZFs5v2wlp9qTPrGhUqHZ/tA5Tytm8Q6htotTVORC1WDep3WFtMm20A6JT61ToVa58K0tkhPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:10:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::451f:7e82:b7f5:8c6e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::451f:7e82:b7f5:8c6e%3]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:10:12 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nftables: add ptest
Date: Tue, 12 Apr 2022 11:10:03 -0400
Message-Id: <20220412151003.2340963-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::44) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76184025-2975-4c6d-df55-08da1c968a54
X-MS-TrafficTypeDiagnostic: MN2PR11MB4598:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB459828C4470B531C3B9285559FED9@MN2PR11MB4598.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	doXIu0JVQLltJ50pUHHcII6QE4pzmMb05BEvL1WdMINPNgo7xvNxUyKwsMG2gvu0oeQ4PjkCVeyDMnPJTY5GLlF+mWrUJdSITKlPwPxOaq4KQDyfE1ePHDHZmRMv4galeMk2aSeJJvIqmB3/LINJ7oRIxenzsQb9ws1PnKnA6DAxCckdSLorDU8PpgyndQ6gDSEYRLHCsQn5VuANi2TF77BTVcgNffOX+1EaayEpKqJApQKeLrNicrCOKYdjuO+XLb/vHrZJ5PUZ8QA8caUQF3izqJRdXhz5/OfcsN86rKnWyGRfxVafaYFe2zNEt4+1SOtQXIsTBnPkow10NA/OAlXtHIU0NKDDzyentmnk8uZ3PycIliPqxujqZH1lXP6TtuJmce/N3OXQbTLbJE0WG0lcHIe9HdXgexuKgE3qlRzJ0XzeWa3e4U/ofWSzqNfCxfPMwOC0+aAWleVBY6JSGi4dBB8kNKLY99sip5d+Ww1aYNJF42m1GVcFrRdWC3C4SAfG7rrmYaA4NuXvwU13sGmLJxBvlI9X/j8GiWmkfn31uht3+6Q3Ut7RL5/PAT/ksFEtwKb1WfWhpBr7t1ITk9OGy/s+ZBWSd7Vm8nvvVLyck+cZ541xTb9Dz8217AOrtaYrGYW1zHi0ditluAxr7reMoLovW/RLgC/OKkwB/DzE5XRuc35xYgEb6wSYz4KzN/2kfITD1DfBzfP3CJZdvMeQ0J5ww30a64hOuBAxmR+Kk+Zi1IsAhUWCbY7ZkXj5TkngHT0usxbOJdkSazvxrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(36756003)(66946007)(38350700002)(8676002)(66556008)(508600001)(8936002)(6512007)(6506007)(66476007)(83380400001)(6666004)(5660300002)(52116002)(1076003)(2616005)(86362001)(44832011)(6486002)(316002)(186003)(26005)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?700j9Zpv+P4DlkWyntmw51Ojv50hxujXQuVUMDDYo8/UJtGalSF0YeXW3hY9?=
 =?us-ascii?Q?oU3V50w+xReBxX2mYsZs6CIENnf7cN9LAHKUjOv2G5Rx1k0C2XnbsEIVvPTC?=
 =?us-ascii?Q?oX8zb1USQCuP2Auwr/EJeuz/SvFTMRylxd2tX0bpJUWW/IPnJpSJLnarfj63?=
 =?us-ascii?Q?j0DdG8dsM83ATpzdgFf5dnv2WCZ3zaoAOJbT3WAg6PruR3cll57MmjclAsCx?=
 =?us-ascii?Q?0dYHdSvhQWrx/tTRfJXsjtA4WFKMcIF4bZD1Fz6YvDGynVm5a/w/y3vY9T5k?=
 =?us-ascii?Q?LvkcpoBVgD5mjkHyw1//55PAcPoGcuvplgmewGZljTG2PCO9zccunI5tXczr?=
 =?us-ascii?Q?rzFMjX2tt4Tg14iH+39XBUWnaZtpH0Y8RJtz37Cj4UXVSBXYmPv/o1Ylk+/0?=
 =?us-ascii?Q?jdeOBgbDq4CVwVJKaOpnULyIblqewC+6vsU963FzoyIrtXxVg+5ed9WCKlC0?=
 =?us-ascii?Q?pUnykhZgN8aDM6XLRAKn8hI9zFLa4+PCmVC1oVVD53j+Y9OG5sUq/IUK6zGx?=
 =?us-ascii?Q?A4eWoFiUvzDAMrnE8S7lgtifqTrUsCjiVy3Sf8TXw31zElcDjhDBRdiEMXKk?=
 =?us-ascii?Q?Ao+jz+CfL7M7dI5oExqqoKUVMuQu9QwlYdNZZtibRwl6c4oa6sRvKJJomYBp?=
 =?us-ascii?Q?WnwgtWDk1VWieBWS+XGH/TX7pqqFaObhDUacvmzXCTdzi5LC2zW7U+vXUH6A?=
 =?us-ascii?Q?ZrHSCgkXx7NAxcBocGg2Jo9f7hAi3xzobx6QfOOVWquzibjUCkYh6dEp0W79?=
 =?us-ascii?Q?K4eAppla8DIIhWsJhoLDUnKeh4T5a+rJBWYh6lCDU8BHxWmG3DYNvpYLMC89?=
 =?us-ascii?Q?/5AT/G8R+FRveRHaV3oxNlRa5QzagpCes9MlAGZ9kb0gpEeX8taqt0wXfhak?=
 =?us-ascii?Q?RO8FZMvVXRXnJcr+aWNCgbSLQiKkQFbDawnE5FTsQDUt5gZjMJKDhflrXDES?=
 =?us-ascii?Q?Qq3HNdZslMGbHQxgkj6E/MY+zH83udT51Tj2m5a1tv4ONZ0KTLo774XqYrij?=
 =?us-ascii?Q?FHgZ5bsENV/dm67XH21bzm2wS/veVtFd30V/Nf1EPeI8ngAa1fiZvnv6p0fh?=
 =?us-ascii?Q?EahTWmAHoviYxbz54JKz6qeBkoYpdxKyL5iiL5oUtnnq3wQQl7WwtPr79a4C?=
 =?us-ascii?Q?HEAXcQw+kmLBGuXa7eZfpAk0jq7Mf2n2s+NwQi0ctpr7ZM/PF5xHJ6epFJbr?=
 =?us-ascii?Q?A8XIPxu6fmnjFNg4egdTUILj9N8I86GbRiBgI0RaQq80gULy4cnMggZEmto5?=
 =?us-ascii?Q?ANw0a6vZ1E6W2ZIdHWFXc/s2Pd0zB0gFML0YNPVjGO1T6MJHWmzbZugqDbd7?=
 =?us-ascii?Q?v0e8Ao4iDQOr3AJy0yC9xNrcGKUXUYsdi4uXvn/XBIZGe1dkdYuR16z8QaoN?=
 =?us-ascii?Q?ZpApl5aMR+RvF9P9A98ipyv4qvEXnJgNVxZRBYSjsioL5l9pyJm3EYZig3He?=
 =?us-ascii?Q?KWXMG4XRwrZBKji9C7Qeeg8qpkPoyk6h1kYzwC6Cg89geGMUuy3cJaxkpWnV?=
 =?us-ascii?Q?7JPnaLj5f6yzsnLnyfdsluDqvzOMM4GVGRvNXpOOOE0fxYTXQzVVMzfliaI0?=
 =?us-ascii?Q?FMvP4QnLY+zxSMVaqJ/KijbIp1dwAZvG6dLkg2BYSJxLOfacfXnzzMjwm5aA?=
 =?us-ascii?Q?IyEVNZSMrheAwqwR89ZcujcI4+0OFcPMv9YuEkgOzHr2+oa9sORxwrLgwNJP?=
 =?us-ascii?Q?p9N4YCDLzPi4heDcCxs6kVNWcrQaC/ejZhvRHg+ZgkAKwXPlTl/A/NmmMsTN?=
 =?us-ascii?Q?1PmbtdLd5JnuhA58wjyqBTBMlxTysgE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76184025-2975-4c6d-df55-08da1c968a54
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:10:12.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pboN81Tx1c2vDV/33IOOgyjf3ayzTowF0mHfbPZb6NTW5pCvQSrCaeCEHarsPr7tlQIiIfp/OswXrORsb4u+Fbqhlufn961Vg7q2owelvnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
X-Proofpoint-ORIG-GUID: j0zB-jHs_xvK3w03iIgfOIRPQQPZFmB2
X-Proofpoint-GUID: j0zB-jHs_xvK3w03iIgfOIRPQQPZFmB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_05,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96589

Note that (like for nftables itself), the ptests will require the
following added to local.conf (or the kernel configuration):

KERNEL_FEATURES:append = " features/nf_tables/nf_tables.scc"

Current pass/fail results:

I: results: [OK] 271 [FAILED] 29 [TOTAL] 300

I've been investigating the failing tests under the assumption that they
fail because of missing kernel modules, but there are some that suggest
syntax problems (possibly problems with the tests themselves). Example:

W: [FAILED]     ./tests/shell/testcases/listing/0020flowtable_0: got 1
/dev/stdin:2:12-12: Error: Could not process rule: No such file or
directory
        flowtable f {
                  ^
/dev/stdin:6:11-12: Error: Could not process rule: No such file or
directory
flowtable f2 {
          ^^

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../nftables/nftables/run-ptest               |  2 ++
 .../recipes-filter/nftables/nftables_1.0.2.bb | 21 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/run-ptest

diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
new file mode 100644
index 000000000..611b84485
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+tests/shell/run-tests.sh -v
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index fd8e26ed1..e078be79a 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -11,11 +11,12 @@ UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
+           file://run-ptest \
           "
 
 SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
 
-inherit autotools manpages pkgconfig
+inherit autotools manpages pkgconfig ptest
 
 PACKAGECONFIG ??= "python readline json"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
@@ -32,3 +33,21 @@ RRECOMMENDS:${PN} += "kernel-module-nf-tables"
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
+
+RDEPENDS:${PN}-ptest += " make bash python3-core python3-ctypes python3-json python3-misc util-linux"
+
+TESTDIR = "tests"
+
+PRIVATE_LIBS:${PN}-ptest:append = "libnftables.so.1"
+
+do_install_ptest() {
+    cp -rf ${S}/build-aux ${D}${PTEST_PATH}
+    cp -rf ${S}/src ${D}${PTEST_PATH}
+    mkdir -p ${D}${PTEST_PATH}/src/.libs
+    cp -rf ${B}/src/.libs/* ${D}${PTEST_PATH}/src/.libs
+    cp -rf ${B}/src/.libs/nft ${D}${PTEST_PATH}/src/
+    cp -rf ${S}/py ${D}${PTEST_PATH}
+    cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}/${TESTDIR}
+    sed -i 's#/usr/bin/python#/usr/bin/python3#' ${D}${PTEST_PATH}/${TESTDIR}/json_echo/run-test.py
+    sed -i 's#/usr/bin/env python#/usr/bin/env python3#' ${D}${PTEST_PATH}/${TESTDIR}/py/nft-test.py
+}
-- 
2.35.1


