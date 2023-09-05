Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D09C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 07:58:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16530.1693900724344140056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 00:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mioPP93j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7612169c0c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3856xwCQ002860
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Sep 2023 00:58:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xO8VlnOHyJAz6i8Pbc
	ksvGrUGMTn46DJoPdqIcmSrp0=; b=mioPP93j7CkopTeyDeWUTu/6V12W01VxHo
	1uizJn2NtZLgImW90QuML9Kctu7c+/YngilsBVfLy5EzQp/s31iAt0e11VjzZT+E
	cE66RibFc+93neFmHTq5fk+QqVLduh7cNf76+GUaf9F6Ojfh4/QpcTvEX2l2ZjZn
	DxnHE6wheVWVCO7ppFWwGqZdljiGAs+nvmyfkQKrjaC8Z84y2E9XXWw188FdhPVK
	XpMM1w9neBp7imoRhWZcsF6hJ5goqWvjdcxykFrAV2LlhLh4yrFzlA8ruml9ZCGD
	MPvaMGdbROlljvGukLbINAFlAc5dHCaXVMduSwm37rhByekQWpkQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b024h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 00:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPzPhVlPT7Dfz0ZoxOHyIoCgpj8/mGmILWZE2bsp2iU0hqQ+jiA9O102B1hVsyyVXCec+5yKBXrsyKmBuDhyKFV1UQBU8b1QMji+f4Ww2+cDPu4f/y+Z5y4t76TwlCUkQ47kg9267CmMuq+qQTqbnPt9UQHZ0gBtW/snGHMLg0k4vUElr7ItVUKKxy/WtbsXxTTHPVzb3Yko/5mDlgw4gfLV30zBkly9SC+aHxwVStn0k7UsPcIDRf/bPC79VleWpCOW8TvV4nvozldwBjf5s+84uxjen4I1Cp4zJIZoWFhown8V/A/Xwz7AqdHJI9LMM26FRs62BNrBKjl7IipGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO8VlnOHyJAz6i8PbcksvGrUGMTn46DJoPdqIcmSrp0=;
 b=faUiAVtXtYg5lO2nuGaFFRap8pgsUcUhXwfbUfC7AzUbbBlhQ5NgNhPp8pewuoCvb0IUgq9/E8HvbZmhCRInb7mR9AcshNkEzygIhLezZ1kWG7SkpqJObnj8jQFaN7RBvcF/elBOK/xCddvf93HsauZAX6wmkCiBQ0kaW8rPan31aduLrxRcdMT7tUx+mbpvaQhD6lkgS64H+iBzrKbmXbDwtt8XF9w3+vlCJIEViM5gsTF8Pg3fCj50zwTHY+pKNOpckTjy/vnkhrAVqfOS8Mjq+qTHIu4+CZNI3JHAW9DKC0ddshOK3sNg3oB8mR06ocU0vhglQSt17pgIElUQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 07:58:39 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:58:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V3] vsomeip: add recipe
Date: Tue,  5 Sep 2023 15:58:26 +0800
Message-Id: <20230905075826.38097-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: ae30598c-34c1-43eb-2395-08dbade5ea0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2T0y90y+620+Rfg3LrhY1c/Zge0gmZ8XdItj5o52D2AprJ48z0gcXLcxRUUBRlWEcquu0MDrjna+qXUZ0cFFYABjrU48mJppEvib+MdCdcYWusMCIezRTLcmcnbh7f+vVRybndrEDLOMY8iEEb+G49f0kSXaBoTuT1frwMKDY0wR4qUde/wjjMF5ZqONEtMaokttcCvGUYO4B2PoHlmjel//wKxA7EGPSsfn33BNL4+paO0PNEGLKWn76MH/goTLdIvwaE6SUkvVwrcinUzmuWBuaDx4kQXGbfq3C8HP/mGXJRH8Q5gjyFHRslME9Bak/SMfO4inZKujM8zH53OsHF3fH7ldE9VzGOp3ot1L6F9B7fjIPIwGbDiw8s7shFvf6zyzjGuvPldvgsodhTzZiQ5F85UaDyrXebfO3n6eVniWHoV+XUcKSk3JAeULOzFNCzMl1q2GMCfyBGZxeQivlNEDgRZZAcE6uMdlmW/lO0VpwVhDhYB1YD8wWM0rkf+OGN4Iz8NNANxCI3V2zUjEoDVvSn+XEE8VZCNMH/50QuQ9COzaScJZCSfOztB9D815k8DOa8hYnl9c2yM8GTIMJ3RFEQ0X2D6qCSLHlnCCIJA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39850400004)(366004)(451199024)(1800799009)(186009)(26005)(44832011)(6666004)(8676002)(8936002)(83380400001)(5660300002)(1076003)(2616005)(6512007)(66899024)(6486002)(52116002)(6506007)(41300700001)(478600001)(66946007)(66556008)(316002)(6916009)(38350700002)(38100700002)(86362001)(66476007)(36756003)(2906002)(966005)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CtEaLA3zN8WT/ut0QJU5v8h6TlLkqcijjmUYXBRfy+5JtdrEve2FXwOMdVWg?=
 =?us-ascii?Q?E5zO61FFMRU0pg7NvpBXTV+g96GK5ubIQBYZtOsI/z7Qdevz55XgjRYuRIEe?=
 =?us-ascii?Q?WnXTV5dKuyTV+GIqceeywpL/uBQhp+5u0cFpXnK/pu2P6MLDXAOCWhzxec2U?=
 =?us-ascii?Q?X/QgNfKRBe8mtgbn8rDRUOT55/fRBFLjC1m65gU4KA7YIEFjR6b0hFiG2XcJ?=
 =?us-ascii?Q?2yBcdGCstJZKtNxUZVL9zOoolFEG5Hh+Wmg8g7iyVC9pOtu9DpmU4JpszriK?=
 =?us-ascii?Q?06bNOzYZpBLBUdW2CMjXbxrkt9otQy+w3Kh1Ot1Olcq62vCRXGXhJ4X86Mwy?=
 =?us-ascii?Q?h1pn92W/EtDp4Whm0hARPFB7zU8vCugY9/8JVAH2nl8QMQD4Rb+MB7g/EIqS?=
 =?us-ascii?Q?PGafD7kQZp6ElbQP0j9S/7uqwe4ejchtbrGlVVjRudmLvDlxEZ1vTJK79pWZ?=
 =?us-ascii?Q?cYhJU/X6B2lGp0+AifyT+ijzau6d1DXAvp4hL69PzodmCPwVEfHoA3hxDAB+?=
 =?us-ascii?Q?htPXR3UKV5M2usD85ko8ykDlrOiYx3Z/gDSlyALHaLYVrTrVcTdwDdoKRdbQ?=
 =?us-ascii?Q?78/DN0vJs+o2tVXznRHvELIDbMUJKKkhKkccXhA0hgU62c7QbNfWNXI7LrWb?=
 =?us-ascii?Q?Kl4S1DM6QobOSJxgwVBclH9eEXhuKknX5otVccG/rEAl/utuucvtU0fHNdPl?=
 =?us-ascii?Q?tSEVZDkyR/pPR/eb9u25UV0N8pbfHt8YTU2LvV+BLxEj/0n4ysYA4OrhIHTZ?=
 =?us-ascii?Q?CN5oWWudcPocshxBU6TKRBQ5reH9MQ3rpqWSkYclY/1OaeLLNUiOn+WhOpge?=
 =?us-ascii?Q?TDaQln/+XbUd2TXeYZtNisJmqEDhnvjKMSUxOnivTxrfCZwpNCxYPS6fg6aA?=
 =?us-ascii?Q?7nHda70G0g+z5KnA18/xRfX7LcRWwevQdGEI22MnkPHwcNKYKfc2dXE+QcgR?=
 =?us-ascii?Q?5TZNnYcu2pt0HsQv7XKqqLte+nLKuzUrXMHfgUAlIO8r173ETbAop8UzknhK?=
 =?us-ascii?Q?mm55PHWzFwiH7n5epclQ1ZLw+KUgTNEBsb9d4GsNdd8OluvNxszo1S5CXir9?=
 =?us-ascii?Q?TB9MPxXEn3ggMHfy+5nemXhUkdWUBpVbGi3TW39jhtkodzIaBZNdFkLPSPnb?=
 =?us-ascii?Q?NLd8t0HC0vMHJh2sg/HEuTZ/7F4Hmg98ZhwjnPAy8WStvIG3t/QZjCoaV4Jv?=
 =?us-ascii?Q?4CcNrv9JFhzNg8olZqLD0q0MIIRxtlsOgE2pBKUkk7F8go5cqQRmLyW9Atg6?=
 =?us-ascii?Q?17ZXxjYR6VF5arz6vEb5n/JQkm5vE1g3d6Z6KZI0WXZDpJxQmBbHGSGre7cX?=
 =?us-ascii?Q?or8keGgBJmUQiLtiEZ+/Zl7Do9Nd/XpyCKr4EQNF7+GuGunGzR43bc8oIGNF?=
 =?us-ascii?Q?CZ+6xm+II9k0Y8xjRSPV4IdG8+C7RKj86DvPQvcETQrI05qeTRWdz5vkgia4?=
 =?us-ascii?Q?P2mRJ+5fdI6R9XG9bDM2efJ9OiKgbW+fX5muz0G8Vkpr5algAAeQ2zYlmJXm?=
 =?us-ascii?Q?mSNN3gbpc5ftBFitgXVIrAbP/ffPp7FbdUyvgzFXz/Qf7CI8TYCZhY5v8lyk?=
 =?us-ascii?Q?01uDgw6OCbjYtAVpdeN3zRDz/nYQpRK5X/ZCBCQo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae30598c-34c1-43eb-2395-08dbade5ea0e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:58:39.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJhgu/Im3GVZLnIz3lzlO3YOXcfStG8cVT4qZJnECQ6AKin2ggsAweMzF+l8XkRvrd7OeS8L9g4noKZ+sJwXag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
X-Proofpoint-ORIG-GUID: kapa1pcFFoQdnIGxyLrf3yHBrFy6eifx
X-Proofpoint-GUID: kapa1pcFFoQdnIGxyLrf3yHBrFy6eifx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_06,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 07:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104719

The vsomeip stack implements the http://some-ip.com/ (Scalable
service-Oriented MiddlewarE over IP (SOME/IP)) protocol.
The stack consists out of:
  a shared library for SOME/IP (libvsomeip3.so)
  a shared library for SOME/IP's configuration module
  (libvsomeip3-cfg.so)
  a shared library for SOME/IP's service discovery
  (libvsomeip3-sd.so)
  a shared library for SOME/IP's E2E protection module
  (libvsomeip3-e2e.so)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V3 Change: update to latest stable version 3.3.8

 .../0001-Fix-pkgconfig-dir-for-multilib.patch |  28 +++
 ...e-configuration-files-to-etc-vsomeip.patch |  28 +++
 .../0003-Do-not-build-external-gtest.patch    | 160 ++++++++++++++++++
 ...4-Do-not-specify-PIE-flag-explicitly.patch |  47 +++++
 .../vsomeip/vsomeip_3.3.8.bb                  |  72 ++++++++
 5 files changed, 335 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
new file mode 100644
index 000000000..1c7eb17b2
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -0,0 +1,28 @@
+From e8a1b7a176398c2a9b5969f1b48ae0e1aa30f4ec Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 2 Mar 2022 14:51:13 +0800
+Subject: [PATCH] Fix pkgconfig dir for multilib
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index add3edda..fea80b4a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -602,7 +602,7 @@ endif()
+ # create pkg-config file
+ if(NOT WIN32)
+         configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
+-        install(FILES ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc DESTINATION lib/pkgconfig)
++        install(FILES ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc DESTINATION ${INSTALL_LIB_DIR}/pkgconfig)
+ endif()
+ 
+ ##############################################################################
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
new file mode 100644
index 000000000..c22ef697b
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -0,0 +1,28 @@
+From aea4c06ee2a0661d0c7b4773e846276a4f10e2e8 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 9 Mar 2022 11:48:44 +0800
+Subject: [PATCH] Install example configuration files to /etc/vsomeip
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fea80b4a..e7a92ec6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -501,7 +501,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
+ endif ()
+ 
+ install (
+-  FILES ${EXAMPLE_CONFIG_FILES} DESTINATION etc/vsomeip COMPONENT config
++  FILES ${EXAMPLE_CONFIG_FILES} DESTINATION ${DEFAULT_CONFIGURATION_FOLDER} COMPONENT config
+ )
+ 
+ # Add all targets to the build-tree export set
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
new file mode 100644
index 000000000..370d8a0fe
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
@@ -0,0 +1,160 @@
+From e012f91a73af7469ef6f660c3a6a752430a4d649 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 11 Jul 2023 16:53:46 +0800
+Subject: [PATCH] Do not build external gtest
+
+We don't need to build external gtest since we already depend on
+googletest.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt                    | 30 ++----------
+ test/network_tests/CMakeLists.txt | 80 -------------------------------
+ 2 files changed, 3 insertions(+), 107 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e7a92ec6..f6c680d4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,14 +18,6 @@ set (VSOMEIP_VERSION ${VSOMEIP_MAJOR_VERSION}.${VSOMEIP_MINOR_VERSION}.${VSOMEIP
+ set (PACKAGE_VERSION ${VSOMEIP_VERSION}) # Used in documentation/doxygen.in
+ set (CMAKE_VERBOSE_MAKEFILE off)
+ 
+-if (NOT GTEST_ROOT)
+-    if (DEFINED ENV{GTEST_ROOT})
+-        set(GTEST_ROOT $ENV{GTEST_ROOT})
+-    else()
+-        set(GTEST_ROOT "n/a" CACHE STRING "Path to root folder of googletest. Must be set for building the tests.")
+-    endif()
+-endif()
+-
+ ###################################################################################################
+ # see http://www.cmake.org/Wiki/CMake/Tutorials/How_to_create_a_ProjectConfig.cmake_file
+ ###################################################################################################
+@@ -630,27 +622,11 @@ find_package(benchmark)
+ ##############################################################################
+ # google test
+ 
+-# check for set environment variable
+-if(${GTEST_ROOT} STREQUAL "n/a")
+-    message(STATUS "GTEST_ROOT is not defined. For building the tests the variable
+-             GTEST_ROOT has to be defined. Tests can not be built.")
+-    # early exit
+-    return()  # test can not be build -> make commands build_tests and check are not available
+-else()
+-    message(STATUS "GTEST_ROOT is set. gtest root path set to ${GTEST_ROOT}")
++find_package(GTest)
++if (NOT GTest_FOUND)
++    message(WARNING "GTest is not found. Tests can not be built.")
+ endif()
+ 
+-# build google test as static library (always) -> therefore deactivate BUILD_SHARED_LIBS in case it is active
+-set(BUILD_SHARED_LIBS_AUTOMATIC_OFF 0)
+-if ("${BUILD_SHARED_LIBS}" STREQUAL "ON")
+-    set(BUILD_SHARED_LIBS OFF)
+-    set(BUILD_SHARED_LIBS_AUTOMATIC_OFF 1)
+-endif()
+-add_subdirectory(${GTEST_ROOT} ${CMAKE_CURRENT_BINARY_DIR}/gtest EXCLUDE_FROM_ALL)
+-if ("${BUILD_SHARED_LIBS_AUTOMATIC_OFF}" STREQUAL "1")
+-    set(BUILD_SHARED_LIBS ON)
+-    set(BUILD_SHARED_LIBS_AUTOMATIC_OFF 0)
+-endif()
+ 
+ 
+ 
+diff --git a/test/network_tests/CMakeLists.txt b/test/network_tests/CMakeLists.txt
+index 6a148604..a501b6a7 100644
+--- a/test/network_tests/CMakeLists.txt
++++ b/test/network_tests/CMakeLists.txt
+@@ -3633,86 +3633,6 @@ if(NOT ${TESTS_BAT})
+ 
+ endif()
+ 
+-##############################################################################
+-# Add for every test a dependency to gtest
+-##############################################################################
+-
+-if(NOT ${TESTS_BAT})
+-    add_dependencies(${TEST_CONFIGURATION} gtest)
+-    add_dependencies(${TEST_APPLICATION} gtest)
+-    add_dependencies(${TEST_APPLICATION_SINGLE_PROCESS_NAME} gtest)
+-    add_dependencies(${TEST_APPLICATION_AVAILABILITY_NAME} gtest)
+-    add_dependencies(${TEST_MAGIC_COOKIES_CLIENT} gtest)
+-    add_dependencies(${TEST_MAGIC_COOKIES_SERVICE} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY_CLIENT} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY_SERVICE} gtest)
+-    add_dependencies(${TEST_LOCAL_ROUTING_SERVICE} gtest)
+-    add_dependencies(${TEST_LOCAL_ROUTING_CLIENT} gtest)
+-    add_dependencies(${TEST_EXTERNAL_LOCAL_ROUTING_SERVICE} gtest)
+-    add_dependencies(${TEST_PAYLOAD_SERVICE} gtest)
+-    add_dependencies(${TEST_PAYLOAD_CLIENT} gtest)
+-    add_dependencies(${TEST_BIG_PAYLOAD_SERVICE} gtest)
+-    add_dependencies(${TEST_BIG_PAYLOAD_CLIENT} gtest)
+-    add_dependencies(${TEST_CLIENT_ID_SERVICE} gtest)
+-    add_dependencies(${TEST_CLIENT_ID_UTILITY} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_CLIENT} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_SERVICE} gtest)
+-    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_SERVICE} gtest)
+-    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_SERVICE} gtest)
+-    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_CLIENT} gtest)
+-    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_SERVICE} gtest)
+-    add_dependencies(${TEST_CPU_LOAD_SERVICE} gtest)
+-    add_dependencies(${TEST_CPU_LOAD_CLIENT} gtest)
+-    add_dependencies(${TEST_INITIAL_EVENT_SERVICE} gtest)
+-    add_dependencies(${TEST_INITIAL_EVENT_CLIENT} gtest)
+-    add_dependencies(${TEST_INITIAL_EVENT_AVAILABILITY_CHECKER} gtest)
+-    add_dependencies(${TEST_INITIAL_EVENT_STOP_SERVICE} gtest)
+-    add_dependencies(${TEST_OFFER_SERVICE} gtest)
+-    add_dependencies(${TEST_OFFER_CLIENT} gtest)
+-    add_dependencies(${TEST_OFFER_SERVICE_EXTERNAL} gtest)
+-    add_dependencies(${TEST_OFFER_EXTERNAL_SD_MESSAGE_SENDER} gtest)
+-    add_dependencies(${TEST_OFFERED_SERVICES_INFO_CLIENT} gtest)
+-    add_dependencies(${TEST_OFFERED_SERVICES_INFO_SERVICE} gtest)
+-    add_dependencies(${TEST_PENDING_SUBSCRIPTION_SERVICE} gtest)
+-    add_dependencies(${TEST_PENDING_SUBSCRIPTION_CLIENT} gtest)
+-    add_dependencies(${TEST_MALICIOUS_DATA_SERVICE} gtest)
+-    add_dependencies(${TEST_MALICIOUS_DATA_CLIENT} gtest)
+-    if (${TEST_SECURITY})
+-        add_dependencies(${TEST_SECURITY_SERVICE} gtest)
+-        add_dependencies(${TEST_SECURITY_CLIENT} gtest)
+-    endif()
+-    add_dependencies(${TEST_E2E_SERVICE} gtest)
+-    add_dependencies(${TEST_E2E_CLIENT} gtest)
+-    if (${TEST_E2E_PROFILE_04})
+-    add_dependencies(${TEST_E2E_PROFILE_04_SERVICE} gtest)
+-    add_dependencies(${TEST_E2E_PROFILE_04_CLIENT} gtest)
+-    endif()
+-    add_dependencies(${TEST_EVENT_SERVICE} gtest)
+-    add_dependencies(${TEST_EVENT_CLIENT} gtest)
+-    add_dependencies(${TEST_NPDU_SERVICE_ONE} gtest)
+-    add_dependencies(${TEST_NPDU_SERVICE_TWO} gtest)
+-    add_dependencies(${TEST_NPDU_SERVICE_THREE} gtest)
+-    add_dependencies(${TEST_NPDU_SERVICE_FOUR} gtest)
+-    add_dependencies(${TEST_NPDU_CLIENT_ONE} gtest)
+-    add_dependencies(${TEST_NPDU_CLIENT_TWO} gtest)
+-    add_dependencies(${TEST_NPDU_CLIENT_THREE} gtest)
+-    add_dependencies(${TEST_NPDU_CLIENT_FOUR} gtest)
+-    add_dependencies(${TEST_NPDU_DAEMON_CLIENT} gtest)
+-    add_dependencies(${TEST_NPDU_DAEMON_SERVICE} gtest)
+-    add_dependencies(${TEST_SOMEIPTP_CLIENT} gtest)
+-    add_dependencies(${TEST_SOMEIPTP_SERVICE} gtest)
+-    if(${TEST_SECOND_ADDRESS})
+-        add_dependencies(${TEST_SECOND_ADDRESS_CLIENT} gtest)
+-        add_dependencies(${TEST_SECOND_ADDRESS_SERVICE} gtest)
+-    endif()
+-    add_dependencies(${TEST_SUSPEND_RESUME_CLIENT} gtest)
+-    add_dependencies(${TEST_SUSPEND_RESUME_SERVICE} gtest)
+-else()
+-    add_dependencies(${TEST_LOCAL_ROUTING_SERVICE} gtest)
+-    add_dependencies(${TEST_LOCAL_ROUTING_CLIENT} gtest)
+-endif()
+-
+ ##############################################################################
+ # Add tests to the target build_network_tests
+ ##############################################################################
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
new file mode 100644
index 000000000..970a37e50
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
@@ -0,0 +1,47 @@
+From 69805f9c8973a7a4d29297f8d50c29c88f981bee Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 17 Jul 2023 14:33:32 +0800
+Subject: [PATCH] Do not specify PIE flag explicitly
+
+For nodistro distro, packages are built without PIE because
+security_flags.inc is not included by default. But in vsomeip, the PIE
+flag is explicitly specified in CMAKE_CXX_FLAGS, which will cause
+building with PIE even in nodistro, causing an error when linking the
+googletest static library:
+
+TOPDIR/tmp-glibc/work/cortexa53-oe-linux/vsomeip/3.1.20.3-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/12.2.0/ld:
+TOPDIR/tmp-glibc/work/cortexa53-oe-linux/vsomeip/3.1.20.3-r0/recipe-sysroot/usr/lib/libgtest.a(gtest-all.cc.o)(.text+0x4a90):
+unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `_ZSt4cerr@@GLIBCXX_3.4'
+
+Remove PIE flag from CMAKE_CXX_FLAGS and only enable PIE flag by
+including security_flags.inc.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f6c680d4..dce1e701 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -60,12 +60,12 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+ if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
+     # This is only relevant for GCC and causes warnings on Clang
+     set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wl,-z,relro,-z,now")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wl,-z,relro,-z,now")
+ endif()
+ 
+     set(NO_DEPRECATED "")
+     set(OPTIMIZE "")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Wpedantic -Werror -fPIE")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Wpedantic")
+ 
+     # force all use of std::mutex and std::recursive_mutex to use runtime init
+     # instead of static initialization so mutexes can be hooked to enable PI as needed
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
new file mode 100644
index 000000000..b45bd2d63
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
@@ -0,0 +1,72 @@
+SUMMARY = "The implementation of SOME/IP"
+DESCRIPTION = "The vsomeip stack implements the http://some-ip.com/ \
+(Scalable service-Oriented MiddlewarE over IP (SOME/IP)) protocol."
+HOMEPAGE = "https://github.com/COVESA/vsomeip"
+SECTION = "net"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
+
+SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=vsomeip \
+           file://0001-Fix-pkgconfig-dir-for-multilib.patch \
+           file://0002-Install-example-configuration-files-to-etc-vsomeip.patch \
+           file://0003-Do-not-build-external-gtest.patch \
+           file://0004-Do-not-specify-PIE-flag-explicitly.patch \
+          "
+
+SRCREV = "07464840f503670bc75997b8e926b54734ffa410"
+
+COMPATIBLE_HOST:mips = "null"
+COMPATIBLE_HOST:mips64 = "null"
+COMPATIBLE_HOST:powerpc = "null"
+COMPATIBLE_HOST:libc-musl = 'null'
+
+DEPENDS = "boost dlt-daemon googletest"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DINSTALL_LIB_DIR:PATH=${baselib} \
+                 -DINSTALL_CMAKE_DIR:PATH=${baselib}/cmake/vsomeip3 \
+                "
+
+# For vsomeip-test
+EXTRA_OECMAKE += "-DTEST_IP_MASTER=10.0.3.1 \
+                  -DTEST_IP_SLAVE=10.0.3.2 \
+                  -DTEST_IP_SLAVE_SECOND=10.0.3.3 \
+                  -DTEST_UID=1000 -DTEST_GID=1000 \
+                 "
+
+RDEPENDS:${PN}-test = "bash lsof"
+
+do_compile:append() {
+    cmake_runcmake_build --target examples
+    cmake_runcmake_build --target build_tests
+}
+
+do_install:append() {
+    install -d ${D}/opt/${PN}-test/examples
+    install -m 0755 ${B}/examples/*-sample ${D}/opt/${PN}-test/examples
+    install -d ${D}/opt/${PN}-test/examples/routingmanagerd
+    install -m 0755 ${B}/examples/routingmanagerd/routingmanagerd \
+        ${D}/opt/${PN}-test/examples/routingmanagerd
+
+    install -d ${D}/opt/${PN}-test/test/test/common
+    cp -rf ${S}/test/common/examples_policies \
+        ${D}/opt/${PN}-test/test/test/common/
+
+    for d in unit_tests network_tests; do
+        install -d ${D}/opt/${PN}-test/test/$d
+        cp -f ${B}/test/$d/*test* ${D}/opt/${PN}-test/test/$d
+    done
+}
+
+PACKAGES += "${PN}-test"
+
+FILES:${PN}-dbg += " \
+   /opt/${PN}-test/.debug/* \
+   "
+FILES:${PN}-test = " \
+   /opt/${PN}-test \
+   "
-- 
2.25.1


