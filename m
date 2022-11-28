Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03121C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:45:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.121420.1669650320590303407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q6WnjDjb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93317ef19f=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASDTBMd027291
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=PfzO1di3SHBfZ6s1Jixk/n+L8rd6k4+K9gvFha7wTCo=;
 b=Q6WnjDjb2VDwrmDgRcMC399rSdGefbA35TBLiHVln34mAbkok3yEetMCYQSrsKr2ifzI
 f1X7gfukQ0hmlXEqgDx4Hj/T540j/Xh0AOV/6CXjU1UG+OpKBzgM+yabUbZgkzfutjnR
 ascgnUDEIDctkRVySYk/QDPVPKfbFWzmMR2fwokcc+nyFBKwSf3q0cEU75te/AAGZti3
 zL7lhAXkexoaoZNk1J1+QjLkyOcQLJSGhkxznbKsXPWZSuQ3uaRppKo+M/9K5TNEHw2C
 SZYUDcJFlE7FIh6p8NTQ2xh0OPcBeh95erf8zfhwi0XX7d4CPl9DcM/lc+fioE1J3qPP ew== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m38131n5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:45:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNDqpjwQ8PiJZydim1F1gYP/TpwtNb2GJ2LaoH9mHny/1p+iftmabW1Ae0ryFReYVsTS3bdM5cuKLfcwbGWiaWxV/qwfH1sZ0s6vpJOdkW4cA42CVARRhEGW2ZeiORLkxJc0Fm6t+afISvz6XsLzd47CUB9lWNqY5Cy3vHmwZeIS93DIiPqcwzzSu/tdk1rkzXcSpgI8Zxpg1iU0PUlpmqf1ALomzZ/7CvwpuNnF4x9/iBOS/KX7YWLXKKuz3COILda/slYZpN6gXjlDp9DIzf23GADXQTPzquYf++CyVsgwjRRdQyWZ7Gm/n7PxZrvHP5M2i9Pa++x6C79aeWXAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfzO1di3SHBfZ6s1Jixk/n+L8rd6k4+K9gvFha7wTCo=;
 b=mEcWCq978yaDshVzfSWSu/jpTBjcTZITzj++Nq7uYrs8COxHbdlkNDEgfJtP337DSc9nSYRPVYJuvJxkFQRXn0287Q/LVMMCtYLjZvXjg5Yjc44TMhwm0MS+xRVOkIel+s0HZLGNJDsj0WIh5qrJqrYKUPb7AQ8jQ6b67nNksm8neQoEwQWeTevnwW+uoWEaGQYmpYBGlUUYtyWc1cMngByOsdSo9cqEMWCjTAdfZFz7YoZIUkR+wAqua3igzDa342K4MyiWhWcaLCYDjt25XMrKbXS+W+RSRb/ikwTuYPUVPEohvzQ8iexrherKQ40MFri43BFpD5bBR+WsODPKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:45:15 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:45:15 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH v3] python3-inotify: add ptest
Date: Mon, 28 Nov 2022 10:44:57 -0500
Message-Id: <20221128154457.3778874-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0293.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::27) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd69d0a-19ff-404c-17dd-08dad1578ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FGiZ10+DaNUV7udtBsMEJNI52fuEDUWdKCABHO0uHU1CWZnchLHEb9Wfqk5G2HocPc8FQFBQyjs22BkplRCO/g1uXYKUmG56YPyWw6uxucDwT/oPh0+cfCyZTQKCGbGClHX+nc4US45Y6pUGB3BZM1karwMuQn4rSpwbiqnkKW+ke3LGhW09VNCjNhFqzDAApLRza3cXBDHkDusdNLa3H2qeOLioDNO/QVTso8kWYjkIWHNPMOUONSIeHsbfK1xZs+09bjrUwleP4D4k87vjr1AOG8ryFJSeYhjP3Kp4mAnLjJCGmDzgWBRMkkRivDulP/YJOOaQvqiA5kEHsLuYZnDEQGwouzfFQN9dA+a0544NxqhyGScGDPsxvosjtOmu/UPA7nvRCRcleJc7QoU8kH4gWr6NV4Uo7fds3CavHzpDimkOP99i++v4fCyuhOOQZo+xO2OLl2f4aiM/PIvcKHHAWyM82MODplj1gcMD74mejjkQzkSdmWU9MqWP/ZXQby6XnnbFfbGEvKH2WDb++iTpLdCQnNqIV4osiLyCgaRl4lwYKW0UnkHP87En1Hkb1ESFLck9TUYI7G7+EA72QzCBvb0g7hsGwSKu+so3MIYJ4D9p7rCw9kW+DXTXLs3kEPkZgDkySfF0XZsBERsyD84mTJCuG223Bctyu5GaB5zmc9gix2qnWp/rFgM961/EmtZwSdVh75iyJMu6i3UBoSWe24pjEuiRQfRx/yY4KSzuhf546PHd13WPmOH+VVCwimLHQHtpnjj+wLrgCIERVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(451199015)(66556008)(8676002)(66946007)(66476007)(36756003)(5660300002)(41300700001)(44832011)(8936002)(86362001)(4326008)(107886003)(52116002)(26005)(6666004)(6506007)(6512007)(83380400001)(2616005)(1076003)(186003)(6916009)(966005)(6486002)(38100700002)(478600001)(38350700002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c55LLF+lPSSt3KBSmRpTtG6BdnmzWS8QG2nAAjxR0kBmRGmx8TH1zMrvOgjX?=
 =?us-ascii?Q?3ufKCbyjLYklIkSip4CKSv4YmkhT/gWg1TY/sN3NYhK0Ew0qsDHhH8NMEsAI?=
 =?us-ascii?Q?Q7Nn/cvTpfRtDIHeoUC0AtURIQPhSeQHOSkC4wnYtR6or4F0aCaiQB6/WTnp?=
 =?us-ascii?Q?cP2Ppi6Ve3KSoAzftzhU5i6Y6oouzRgIALYDlJGtbN6URjfYKfBNTO73jh/8?=
 =?us-ascii?Q?F7xYy9Vph0JptuHxLHi7rM+Pe8k/Hozy6KxZruR9N2oyTh6jdus4nDZhWJPE?=
 =?us-ascii?Q?Pg/nPXL2RG9U1IvUhNCT9Gzy+KLI1BnvwMg7lB6n6NAL4NJG6ELlDD/sMsQN?=
 =?us-ascii?Q?1TMunUZz56ct2nxW/IMy0eX6oOgYHUMti6sWNQd9FpCoFneW2FAemMNQLqsT?=
 =?us-ascii?Q?mY8HOR9+Ut/d9H7ILbFWGrUF46dP0woXwji/6+RL7SZLWyngcxEsB7q8upPL?=
 =?us-ascii?Q?8tezzLvSOB9niKk7m2pcciG1n8AkECcMKOJ4o5pZEyIVDiat5Yvoootz8NDH?=
 =?us-ascii?Q?h3kFtos8FwPXpnNoqbMSB7DuSiPhQVWraHHoizBcQhxVEZ5yZZMSs0tdMGLq?=
 =?us-ascii?Q?KS8ujuicrcSYIWakF0bQSS0NqyDr+WhEptszyIdeb62H+8oKmNtsxcvdfKlF?=
 =?us-ascii?Q?MymRCOAtlhw9u+XG4QIPbWeLRPPTeZYh4hAceY7RKzdc8Wr4zhp5O205PI9b?=
 =?us-ascii?Q?6tPGM4gcvC56VHrqaSMt1dF5YOV8js42El1FCYxRYoF+jZgJIakzKv5R3fsO?=
 =?us-ascii?Q?HVR97Qeoq7FoSATowTee1ssGBfaPd8XzxVJSIuvm+D0Hri0t2y2dS5IKt+oT?=
 =?us-ascii?Q?5/kDOQacbCHWKWwy+riTJ12sCFeq3f7n/PxCXqxhz45EVsblL4deWqX0Qzyk?=
 =?us-ascii?Q?PqEF2aVbLOQ/LxAE+mxtVW2jI4V6zpQkG9bLTDhubUaZRi5kfQT9nxTO8Ab0?=
 =?us-ascii?Q?FeYNcCzLNT5puLyNX8msW70ffSyi835MIxUD4v7p4jC5TxodI1D+YWphmh0s?=
 =?us-ascii?Q?Z67fgB6zKJYDZRIS5VVx/oy1S8b4KpFzLPmfDEojinSVXkkqFAuvq8EmbYhX?=
 =?us-ascii?Q?5k2iSKg685xtJWGwD89NylN+0EBNHKhc5Hck7sAn1gdwxMNQIBAojIg0v6ni?=
 =?us-ascii?Q?7DnnH9+XFl1ICLy7K1aNEWsNYFko72U7jAuVJcKRohuBJYwntqzynthaMofs?=
 =?us-ascii?Q?Eya2a15Qv2h9ax8TljiZxEKVxuM3DlkGTNGpI5B7UqMA7vA7gXHT1y8/6+7H?=
 =?us-ascii?Q?ZcYwPkPpnONoyzGrSkj/BlOW0q24RDT1F3hJ6blvEtna6IZl1EUdgtMK63hB?=
 =?us-ascii?Q?0Dp6lFqumD5Aw8zpwf1Hun/ezr+41GxJebCtcvdQgzC4cpCjLtsfh1IfJL2y?=
 =?us-ascii?Q?dd/tULuBOx3d32UJcujcQjn8nNhEOshmwi7ohZb9V0bZWE0QENfgo+aOzVF6?=
 =?us-ascii?Q?w2t0vURMcaLzf3kspEJ3GwfCTrJMG4uC6slvZ3Ecm6ZnPUMdfs1wIsKvRafh?=
 =?us-ascii?Q?fcFwH/TQrFW9qiB4+8Ja7vqtl/t+kUR76H0MI8A/OFTzhYP8uTeRLRjDdIjp?=
 =?us-ascii?Q?I0YY/6+4uklXSLIEKGL3moBP76hDgQvezY/AE6Sn/pAk207c8+lXlVkcnVF8?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd69d0a-19ff-404c-17dd-08dad1578ae7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:45:15.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgrZ2XKtQS6pPo0YEYQcHHEc+PTV+xEID7ZAiXIxqW17gn/L5g0sD3RyxCw9VwFhpfN36z6KH0l12i0UTy7Jww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-Proofpoint-GUID: ZpPuoecq8z-qOMQt_d4c7rfP-kWDn_kQ
X-Proofpoint-ORIG-GUID: ZpPuoecq8z-qOMQt_d4c7rfP-kWDn_kQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_13,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99831

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
index 000000000..15fb92eed
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
+SRCREV = "9be6a51d1660991562eefaaddefa757ca0e0e00f"
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


