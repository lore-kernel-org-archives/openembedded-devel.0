Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D431C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 19:56:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55729.1669406178716698041
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 11:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=C/KxzHuN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APJqXhr024031
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=cjn6MOYBYZvkz6JrxH6trOB2EJDeyP4Vl6oaWxZnpFs=;
 b=C/KxzHuNa1zmz+rNZx4n5ia1TJgzf0zLicGpFVKiTQR2yco1W5gEH8y1jCyuCyqsnl72
 YT+WV5bPF00b8u8nXUKdjqwefDvs0wfQgKhJlfDXjl7J8P47eOsCGs7Ey5wClqlvWSyp
 VikQskHUXS3DN3IXx8qzYD9bsVctVSFJ0XKYDLKK2IYPdSoGedCrRvgBFobxnp7RX1GT
 Bp6anM2YH4XTzy4rXSMcqgd2s2WzUueARyAJpfYERQfNoHirjhdS3LVBn32WLgJHKtpF
 XeFcu1V22mb1qcP6uI9jHea/KEIyVgtnRmPR6qxbILEpwawLeXDZepnq3o/ZytEI3922 Xw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj57me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8RrEtCmb1lUcivo0XqLBcgOTni3KTrgJAcfqJfnz92ClzHNbWi/noMT9xjzLvoaQZGScK+hGipV6tCDoEJmH4ZtDrHC5k9KOcrkt4A3nHidvc6Rjk9rvuvbyh6HQBALC+uSSAmD0kmVYCT15RuIwG++aQ8q8gmq7hjdSwNNnFLJ0bq3aesqUs0400Mgp6tUNHqic56oVGSMIAeL4JxZQAt54haNFVmy51XrlEp9oK116dRqQB6Qln2GWU6+rrQvyhSlcqmDWGhk6R9IbOMxTn2nyKqGh2K9s481ZYKYPiweHa7HHcISSzfsNWsC1hh55xDmsbt7uPsTRMRnbKnsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjn6MOYBYZvkz6JrxH6trOB2EJDeyP4Vl6oaWxZnpFs=;
 b=nUzFEUi/gqJaa/JLxZ0FPpHC3PuKhkaXf7vydmQSpEiu+uENeNZ+dzOEu8XPTCZuJrHE6Wc5beyqY9jpDlIWV1aqR1XOdteKSx4cvgdMatCjqanOnuLzNTPmlqvIKFJkqR82W3Vzjvlt4tQK4Hj+yI7A5mkbYXttMna/EzaUM5xuKLfUJO7e662I6X2S2M6R49Ikm0QgzQrYlHEC2Jm6XZzUEkT11K3H4wFd6+z6vTSlxZzznQqpGGM5fzXyXQu/OZY3dNqeSS2VH6vKVFTfkTS/FD4Xx5igc0I8djwBJEJKmPi/xkXwbCKHRLURMxTuXVYSFhUv4oP5YuCsq2wdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Fri, 25 Nov
 2022 19:56:16 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 19:56:16 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH v2] python3-inotify: add ptest
Date: Fri, 25 Nov 2022 14:56:01 -0500
Message-Id: <20221125195601.3696953-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::29) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c1c447-5a8f-4d6f-9bc3-08dacf1f1cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DglMufhOtyrVk7V68wDlZMeI7opYSWmPghan035mfRhMP7aJNseGvWhmMdIuO73wqABnW+M901OJpZpUgEJsGdEsl242Kg97E/trCSCIE8XwkjrlTTomuP4r5wGK4aAt/3Dddz0br8L05NC5VDb5P5dGLuQFtlEI/T6BsVTAW6DeAPQW05HRfGntHqZJenAoHGyhr01BX5U3FNhjEUSkkCBFDx4PaXbOmxmZgC6JogtximR1ItVr6ZDMMzp/fMSnq2KrN2fQaazOf1eOzs0l7nbFYOpa3G7dM7tYfl5LOXa7QYsQ24vhLHT1HLrj2SMX8nEKtR+5HgtVUs0UQqAMhyEiBq/dmiIOFSHxPyT4vikYR3OQeSiqy9dY8DBHc+SPln17oLs6qPp3WRJfRbizF7eSv1yyRolry4aiqcAp2Tz4VsxUKZA9cEC/PZuwgOt2dBe2dZ8xzKFfh21QLJQwi15zhuifRv35dSK+row4jgSJdByCEcg9zl4T3jPSG3ZvHYtMiY416+H0HJE243Ohll+BOkJhE15o8ZRvkxfdyb//1H/pvxoRz771n30z9kcpbiAIjZkxnxbpo34UdBEMGOqfcaoE04+Dcm/pwyo83+0KUSFW1Klu7xxj4CbLbERrB18tqP9K3GFrjByQv6viANd7zu7iMoSpOrzTLEG7UqYV/e0jn9Bt/gQ4bFXLSQyUN7JL2jDLzvvXUIIcQaOHhp1AML5uOjvjAruQ1Ny691o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(451199015)(36756003)(4326008)(8936002)(38350700002)(38100700002)(83380400001)(86362001)(8676002)(2906002)(66476007)(66946007)(6916009)(186003)(2616005)(966005)(478600001)(6506007)(6486002)(1076003)(6512007)(5660300002)(66556008)(44832011)(41300700001)(107886003)(6666004)(316002)(52116002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ncWvgmtxcLgk8TDCM7CKyam/JLpRziz/cR8/PjI581CJXBfwrrfna7dV4Xq1?=
 =?us-ascii?Q?p0RultT/0nE47nt3+GuP2gHftEYm2jDsvKJ6x/leP9BKpsIRoddUBDVD2j/d?=
 =?us-ascii?Q?KQOGh5AGsMUM9SklwVqgIrs+kDRslK32wGDtztMAEcctaDRKShdLLeDI63dd?=
 =?us-ascii?Q?MEnJw3elTBA1U7wrG5wohYMflIRBIXhWSzW+P3MWDl21uXezGJMcBSlm22Az?=
 =?us-ascii?Q?caCIvzDGeazVp4M5YRYbDcJc3N9H/6wZzE38JP5Cyrc6TFmOy61TJ+Ut5yeZ?=
 =?us-ascii?Q?Rljr2vW1BJaxTTWtYWRF0K+Eyu+5K5BX0gU5M6TiJDLVudVL9cBLXHpa9tp+?=
 =?us-ascii?Q?+34B9HRBjIsK2zppSm4nmvWRsxrZxtNqboNZUE09ag1ItRhwjw2Cg4dgbBAi?=
 =?us-ascii?Q?+3G/rZRSdRdIBmXKzXCz7qp0rExaEHlO0di/GeKpbwpS1s+5ZzCT62YoTNTh?=
 =?us-ascii?Q?0h+ibLkyMkt2fFvFg3SJMXkhNfT3AwooK01Hd+uHDi6KnfHpqLZu/SAjGxzb?=
 =?us-ascii?Q?RESB7oNp7CVG1bmGnJhK5Tg/en8TCMVv+n2XiIjGchU3yBBljFY8/PnMApwL?=
 =?us-ascii?Q?0Gn2HT4VSd7IFBfd3Pqv+Ae1J0kumTz3CYJLE44PCF0gPDOZlXt7PPdPON2G?=
 =?us-ascii?Q?Y+J/Eg6mI6hizjuUal8zPxS5XORoBozh8hLjtDAeQVw0gjZ790fIrZVajtX2?=
 =?us-ascii?Q?oKQiMkdK/GjsNSCGL0t/b34G0EijcrH4TST7IPbm/pTBGtE8hdlF9F0re582?=
 =?us-ascii?Q?cpjOlRBnVLUOM21+JKNYas8KVJzAf8Ls+qoF9sG+nXL4rNluLZpTh8DUBtm7?=
 =?us-ascii?Q?K+tnOfGqakGUUMK39R4sheE5ncPSkgrrw288MhnDnkcD9CF0WbV+yb3Wm+IE?=
 =?us-ascii?Q?RdxBiAIRjexDxaDPucGYJgkKQ0SYguhEsZOkk9K+tcsMQW6iWqfII4gvaD3H?=
 =?us-ascii?Q?hjX8bejrrRnbImIb4QonZ4TKucK2eHRze7CdjWJ67kAIiq3ekOUFGPl11kFA?=
 =?us-ascii?Q?nASBSq32JFP0T0+OFJtp40q+Omt8IppUEO6NtqBwdoQDgpaFqniIzBxax4an?=
 =?us-ascii?Q?RV4X0XUB7xwC5xrmDHeFOHRtTsn5p7S0/rJiE748r+L8dzbRTIvEKjKUFXer?=
 =?us-ascii?Q?c/gA0+aYX4RTWYRnAbUAkPPpUS6UvSjr9MSk2TKYzGe1WFxxmJdJa6ROxILX?=
 =?us-ascii?Q?lpeEsSzmeXEwwNmGqIfqQs5M/WWYG4hA9kY0om6guK9HqE4riuf9yfeB/0ew?=
 =?us-ascii?Q?3PvKJR7UlhT8Lp7BHl9V5euYNYRygd/yRi+jRhcDZmpu1d8e7EXN8PzzdfDu?=
 =?us-ascii?Q?5DKkf7RtX8H5FUQDnDQ4vay9x4CR9TrJ3rf1dKmjXjV27SlY/tVLYxzT/3vL?=
 =?us-ascii?Q?9KHG4QxTD7YZb2hESeTwL31TM1Rfqlhu48O4DaKLVh+rPVuWLSy+h3qHroE6?=
 =?us-ascii?Q?4bry5k+NOttjjBHPc72cTZ7Ds+e6qetQ4wg00k3GL2jQ68diAmIOyI3fSnof?=
 =?us-ascii?Q?N59yFXgj1/CAsoiRQDchtEZcGr5JQDuY3dNVQx/wnYpzwpmH+N7DxKXIkc+P?=
 =?us-ascii?Q?/+rQqMrEn2t73ghRGK6PZn7AhmkiK6lj1x6u1biD3nI3cw3aT4jV5AKZpykA?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c1c447-5a8f-4d6f-9bc3-08dacf1f1cba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 19:56:16.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfTrijiSxpFl/v41UGrdQARtIiLCvQ1CeQIfvLKn7t4OBSXp5oLvYkAcyQ0d2Zrbd7InO7RRHZ/+K2pNcgDjKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
X-Proofpoint-GUID: xrP1BYbHnFy2sytMI474Trmf9Nf3nD5D
X-Proofpoint-ORIG-GUID: xrP1BYbHnFy2sytMI474Trmf9Nf3nD5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99740

Add ptest provided from the source code, and run it using pytest.

Since the tarball provided with pypi does not include ptest, switch the
source to be its git repo.

ptest result:
           PASS FAIL SKIP
qemux86-64 5    3    1
qemuarm64  5    3    1

This issue exists since inotify adds unit test support, and it is
reported here: https://github.com/dsoprea/PyInotify/issues/95

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../python/python3-inotify/run-ptest          |  3 ++
 .../python/python3-inotify_0.2.10.bb          | 14 --------
 .../python/python3-inotify_git.bb             | 35 +++++++++++++++++++
 3 files changed, 38 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
new file mode 100644
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
deleted file mode 100644
index 524c3a0d2..000000000
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "An adapter to Linux kernel support for inotify directory-watching."
-AUTHOR = "Dustin Oprea"
-HOMEPAGE = "https://pypi.org/project/inotify/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://setup.py;md5=79b7ec72aa0d446a552d3cceb5799e41;beginline=28;endline=28"
-
-SRC_URI[sha256sum] = "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6c02a07"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-ctypes \
-    python3-logging \
-"
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
new file mode 100644
index 000000000..22615a97e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "An adapter to Linux kernel support for inotify directory-watching."
+AUTHOR = "Dustin Oprea"
+HOMEPAGE = "https://pypi.org/project/inotify/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://setup.py;md5=79b7ec72aa0d446a552d3cceb5799e41;beginline=28;endline=28"
+
+SRC_URI[sha256sum] = "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6c02a07"
+
+SRC_URI = " \
+    git://github.com/dsoprea/pyinotify.git;branch=master;protocol=https \
+    file://run-ptest \
+"
+
+SRCREV = "288a2b01fd4a726dc68d960f8351630aee788a13"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3 ptest
+PIP_INSTALL_PACKAGE = "inotify"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-logging \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.33.0


