Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EA4C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 13:56:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12827.1708609330583086863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 05:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o84kFQ45;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=278222b5b3=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MBL2Mp005665
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 13:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=whNycchleCXanozizU
	kP2DiENsKa7la350fSRP26H/Y=; b=o84kFQ45nbiGrxSfnJVhSoGbuw3Q9SSyAF
	MoVjBphEkZn739YEC1VpJTz8eVLo8DudAzgLPrHMk1khAheMXqXBbi1zat1jqzYN
	mvCK3nQyBRhLjd5uhQmvA0gX8unfFIHjUqoRDClZgIhtdTbJ9YogUdHBtZRxywo9
	ek3A4PmmJTVxSfejsIRqF6fYAL2++IKVxMgCF8KSaEshrmPgHXKegvjMKWS9TsPO
	yU8SLlPGqtTLDuUzoV0p4nkpdfQrfMZpGYo+ufW79GKg/GWyOdKUtbuaAiXbhwtI
	cB/J3IR4jaV3+TZUhzNuQjRDkk1DRntgv5X69EfH4z4awjqXsQUw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd2179yce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 13:42:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1uglT7wmLK2R+vE7JtGknfsrqhAHrZFDMjgyClrbUXf37c4tWmufnU36vi8I3C2EwzMrkKkcTxqP1zkRWcEX2F0r4Z9/4291uh94R0ZRVl/YU4wOjDREysPMdaYYAIUf1x5/hEAJt5ARbwq9q6QxMjzVI7PJlbIxeYEu2RmJ5BHnh0kDjkF6uxx6poUbZqfy/1ZBf1wY8H5LUsoXVCgyeYF7mIHuA81Wprmgvr7hgScd7V0WYWIdDYcQYRXFfp19B3qH0eW8D1MZIZMLsbFbn3YAtEVRx8QZqg19ERKefIz+WHt86DxnL5DhjUm8nH5HijuX/6rz4KvOxEOOiEKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whNycchleCXanozizUkP2DiENsKa7la350fSRP26H/Y=;
 b=DyDTD5R+YdU0XumZ6aQ2TIPRTKhqiXlKm+NzrmHVKPU75XecQuM08XKSqZDDoQiFlmRRmQ7VrLsZzaCK6vZkhLh45+5Nk/Ym+5NXIDgO78kMvX3a4Sl8Zd1KAO606GmjR8sID54g2l7JbNM3XUVRmqil0qyVRb38+yW4HICqbh0JIVGIY0sD3ElIbT18fqkbr+VdxMeYg7l7j4FkuHfKr+1XpR6fTmviH8nykjSEOdPc4GHGsy4rI/ptOpS6L1xXooGmFtDehw+Omr7+cWd52h1CxI2vHFyIccQBAQtjRfm/FuHTEwGG+6Qxr2Rbi36ycSImWnoGVRBsrrqTOHiq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 13:42:06 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::cbe9:338a:f9bd:abe5]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::cbe9:338a:f9bd:abe5%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 13:42:06 +0000
From: "Lyu, William" <william.lyu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] e2tools: Add ptest
Date: Thu, 22 Feb 2024 05:41:40 -0800
Message-ID: <20240222134140.2367805-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bb3427-4419-4a39-c10c-08dc33ac0f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LjINL6Zp8MG41YBEHi8WZHJfALcv1SKUWIc5MsZ7liW6ttCcRBe7EN04HQdbK66fdGrOHgtpT17ITWe1mKidR50W0eDfsHb5WbCkswvow6n515Ol1Iu88Ytxd7ncZs+3hz1EbrqLpt0+oafcDzJqVFvWcMHkCKQahw+0xwfEim5yi6yI/qPZlD0sS6YlmqveL1+Vdy8U6oeaNIlWbfzQ0iYo5rqSEi78Bha4UKjIN178hAzVLgOhfC6X5xXWLzcDVqXhBAYICgdPpTyNaU89Kp5zQmAgxvwXwfHXcJjhXjXAPnKY6BW8kknbtrZutkoB5fHvosHH7bpDMi+zDAaumcfHCloeZZk6w1MGof0enDLOZcGSRbZBemlBtkf+egJqXEjB4hOrl9ngCOYBGI0N4zDfQrQkksHuNhidQLx9jZ66hksHz7XlMimSJelP+CBeTpPgu8THf0Fom01yuwQ3FzW/K5IkGFxdGkYqWWsaeLvzXsLH54rU0LB6UQvMmS2VjYPZALWQQD11zc3vRlauvE77YHGSz2HzyGuNDqRXiO4MMztxIOn/bIHScDv0s+sxz7aO4/iPTaKYJMeh013AalMBvLC+DTuv/WkjoyJt5Qu9KqX1M/s8vv6dUe+570OW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WfW1BX8jqNm47Y3UbYMDlRFG+n2AQRWntIRS9i+7G3wJ5RhGBvQ8lRofwqp/?=
 =?us-ascii?Q?RHJI3oLkg+n615aCLUdNXWjblbgwY4jXopOmHZtf6B8bFg8mHnexwdcRf2RC?=
 =?us-ascii?Q?Ou6lwyNK2nNdVYlNtWy7NRHmILAlRT+oSxGjk8LGugnOlGmTR46W/cIHDsFx?=
 =?us-ascii?Q?Rb6GhTkirr1XpLGuEUPvTyxUtYB4//iWerV2/MSoIZ0M68uN8lDZEzezglY/?=
 =?us-ascii?Q?20UZKWBhOHQ79mhJjXB+n9L0s8f3ejuF3YbRY7E6szaUOFCf3rVXpbspH++n?=
 =?us-ascii?Q?XbsN2xlvvUTdnu6p+JG/X5TGQXI8QQS5exidwCUX67hfEM0lvB0waMu0UbEv?=
 =?us-ascii?Q?OgbyrATnTJ7OWRkFItsVXcXuHijt6qeSW5qvZw/9YIuoWCOlo5OiCCv4DUa1?=
 =?us-ascii?Q?tu7zzK/j/Hf1s0xCuNQSDZD/xl8u0xMbfCMY0Kg2GTzeKfq5QEIVlcQLsLbo?=
 =?us-ascii?Q?h0ZDYNNql8HZYaFsvWryGtVxs9fzx46TZk8iXEey/rtNXbBcbqwYp8eujaUe?=
 =?us-ascii?Q?wohDVtOQpe/5qmC+8nL2hb8ol4gEEG1SiSPduHAlWaSG+NCxMvtmTx+eQ57r?=
 =?us-ascii?Q?pIEdqNp5c1j56/kwgUWl+9eUNkEkmeXkiXfQ15RTKxcvpGyQ6uojMD0+25g5?=
 =?us-ascii?Q?VE2BXy+yD0GINSRNqwX2ASLEHXXFREtPudXYPZjo9IgS12gh1P9sPFmRj7MN?=
 =?us-ascii?Q?YAf9vzRDPreY+EQ55k6akdaWaK96VbGLdbein556YQjRwCI9vGaq0Ea3eoMn?=
 =?us-ascii?Q?Ctr9bCaxf1x5j57l/oMt5ynW78+pP3l27xIHGj5wMtE8SIOAd41Es3sw3NXM?=
 =?us-ascii?Q?U5IivdKcG8KMzy5oLPzPv9rdnOcNdep09Wn0PHXBvA01TBlBCRBYTKqUUAwi?=
 =?us-ascii?Q?+ukZg7qs/7nOAaZpspDf8XHvI90eIXs9fAS4qHw58pH/Rpvel+sa8PSfMjru?=
 =?us-ascii?Q?dxcaZqNlV3GVtVWyeTbHARPThqEZNqoizD04XnWIPLHBCEaNZ5w8HmlKDaKF?=
 =?us-ascii?Q?PlH4sB1iS1gx0dm7USqU10foUj0DSvOa1unWCHP6DRsZJDqa/ZyNCK4DRl5s?=
 =?us-ascii?Q?JYB+n7kp6Hxng3xXxx5skEsuob8ztbqbTFuR0dvMadurYIsGi21uShIqL6MP?=
 =?us-ascii?Q?Gdfr2fyxYmn3kwCVKj71+OHC9NLTIR1O13x39C5Fm02mtgYuBsA5W3s+txnc?=
 =?us-ascii?Q?W4pbStsy+n45KguSLHjQVyR7vsxFsE/GnguAzEZRLnN+6M1rPc9nEzS3pGQ0?=
 =?us-ascii?Q?p7pSWmWKGMB0dzFSwnQKWVKcI2/fI/0/wZv6p0Xyn0esL1rpcW+BwVjlbKtr?=
 =?us-ascii?Q?YcBL9ey0Q9k+uESa+bAmCqmu7yUOO6mBW5zGkVQcZxufiU4sZNY3ieTIWtEn?=
 =?us-ascii?Q?Smuwh7SJ5VQHqiYroxNJHHwUaV9dasxLsN2BSEFOpq/W1ESugYh4Cm15WWss?=
 =?us-ascii?Q?HqOj1MNnF4RVa7JbAZXVrNkFNzO1926i9PEy7N8/3syAs/h/BxPJqrjJPb81?=
 =?us-ascii?Q?w5uw2FJWnGYMde7JvCOVZkhdm7EEo4wo0Zd+AOY9Wc4/9oxO1pAtLcw+OoPU?=
 =?us-ascii?Q?Fp/Q3yQHWWnh1F+Pwcd34WPhQNsnzufvWNUxKeHpk0wgC9YI50yQEUBk1cuL?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bb3427-4419-4a39-c10c-08dc33ac0f05
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 13:42:05.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dCT/WSrXqkMTLRsaR/wvOWg5tzaCnbrNHt5A+89AUywgLIEkWre8+YAS13eGvGexSOPi92LVQjlUVo6NyNytj/pggcABI9PFmNGCZ2fZ60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
X-Proofpoint-GUID: vsf1-w5w6zfMaL0wA98Jry-toX3EeRtM
X-Proofpoint-ORIG-GUID: vsf1-w5w6zfMaL0wA98Jry-toX3EeRtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_11,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220108
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 13:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108987

From: William Lyu <William.Lyu@windriver.com>

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 .../recipes-utils/e2tools/e2tools_git.bb      | 51 ++++++++++++++++++-
 .../recipes-utils/e2tools/files/run-ptest     |  5 ++
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/e2tools/files/run-ptest

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
index caf0025c8..a80b6f598 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -9,17 +9,64 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS += "e2fsprogs"
+DEPENDS += "coreutils e2fsprogs"
 
 PV = "0.1.0+git"
 
 SRC_URI = " \
            git://github.com/e2tools/e2tools;protocol=https;branch=master \
+           file://run-ptest \
 "
+
 SRCREV = "fd092754a6b65c3a769f74f888668c066f09c36d"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+do_configure:prepend() {
+    git -C "${WORKDIR}/git" reset --hard HEAD
+
+    # To install ptest for this package, special configuration needs to be
+    # done before do_configure(). So, do_configure_ptest() which is scheduled
+    # after do_configure() cannot be used.
+
+    # We only do special configuration if we are installing ptest for this
+    # package.
+    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
+        # Since we guarantee run-time dependency when installing the ptest for
+        # this package, we do not need the check macros under section "checks
+        # for programs" in "configure.ac". Plus, these check macros set the
+        # ouput variables to incorrect values as these checks are performed on
+        # the host environment. Still, we need these variables outputted from
+        # these check macros. So, we insert the following lines to manually
+        # set these output variables to the correct value in "configure.ac".
+
+        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are only ever used
+        # in tests/Makefile-files which determines whether to include the test
+        # cases. As for output variables CHMOD, DD, and MKE2FS, they only
+        # point to the programs which test cases need to run. Since these
+        # commands are guaranteed to be present due to RDEPENDS and are
+        # guaranteed to be accessible under PATH environment variable on the
+        # target, we only need to specify the name of these programs.
+
+        perl -i -0777 -pe 's/(^dnl\s*=+\s*^dnl\s*Checks for compiler flags\s*^dnl\s*=+)/
+AC_SUBST([CHMOD], 'chmod')
+AC_SUBST([DD], 'dd')
+AC_SUBST([MKE2FS], 'mke2fs')
+AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
+AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
+\1/ms' "${WORKDIR}/git/configure.ac"
+    fi
+}
+
+do_install_ptest() {
+    rm -rf "${D}${PTEST_PATH}/*"
+    cp -r ../build "${D}${PTEST_PATH}"
+    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
+    cp -r "${S}" "${D}${PTEST_PATH}"
+}
+
+RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
new file mode 100644
index 000000000..3d4dd9cf3
--- /dev/null
+++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+set -e
+
+make -C build check
-- 
2.43.0


