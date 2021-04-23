Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web10.5058.1619150057074209049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 20:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aG38RQ0U;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwWK6mvqe2n1l6Ct0VCb0mh6GB1KYL5AYAL8pT1pTwkJpHc/ClhJ3r+CZOa25DrTYDt0FDuv6E/u005w1A6Hn1ux8CbevekYEkaQEHZmGPsDWcQG1gYU7Nn3uot5h6gjqA03bxqnm8CNItO8b7XEp24kb/Hhw/XgcuKqsL6yjbdZoW2Qe+vhmJmxVaVeyPZWtleoXD3aN/oDXzkflmlD7s4e7IGzbsVwptmspisXgUk5SyzXbI9HusQXQIAiB9HTLvycYeSpE9nM10M003xMYtwwElA4WymoSVHmocn/jklRLFO7LSWDqHCBjoVUW/MPtj9WHo8nm+z/zmjjlA02HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hE7CUvCt5pr7jV1ca6QEmGsGwmWcyH1F8AMrSyMC/M=;
 b=hvEHRrCmNHF6DfHz/JbtwL7qVTppCGGk7x3bvMUXKROaRTi78h86qah6L9qPPit/Jui7EOjabh/b1W6NMBMJRVlqPekCzOK95BvmHD20vSTECo012ALWP2x4CFghUp3v+NHiNNpKIDUPNaiN/8hp9/7DxRFX+Ux4cxa0F3vRNqGAezQgdtezHBdcb98NFNDk/kSYP0tPL7bhXTvmr/j0abUld0uIqhHZVm/nBhIfHp031yq7wyhg2gLNFA0FC1L66vox/mjjvtuFqMYoaLTfK2K2JY24uXA13XLBECoGXJv1/zoKX5bsxi6P8Wlp8cA2i/jvauJ2M7RWjLd7WGzZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hE7CUvCt5pr7jV1ca6QEmGsGwmWcyH1F8AMrSyMC/M=;
 b=aG38RQ0Ud/MX8vZUGfyue6YOpLoCAW97gwDQFuW9DGSborowb8CZLWdsLMThUNhG+wjjUH1Exgx5E2mkmDEs87Tqy33wBrzEUp6sl/fWqpAhbaeM4q3GLK2t99hBRdlFse3mixNED4ctlxhDPcmhUk1mx7A+x7qldfIW30KTgl8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 03:54:14 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 03:54:14 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][hardknott][PATCH V2 1/3] tigervnc: upgrade to 1.11.0
Date: Fri, 23 Apr 2021 11:53:55 +0800
Message-Id: <20210423035357.28906-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 03:54:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf090af-3a5b-4310-09ba-08d9060b75c9
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48966C06C8EB60928B6A48AFED459@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QjngP7c4SoaM7xEI0mjnF7Uo+0bHxp6M5e3PDOOxJS4ym2neuHKHQrJDWoXz/kLmI06u14uAZ8mlLD9yqAt5GF/yFcRX6F65O0yNNTke/xGaZ3xlPoS/0g22koO72WFYtPedECTOyik+j6PZsbtO46UIskc8fIMfLFJSwfqZZLged6JhLcIx+jnLtzkUcMOXaaSj1VoL7YIZoisRJewoFFQv4J3y6sZWkhWdUfgi28LImhz5vjOrECDzvmTJHYE7q3uEv29OM5j6p0PAmWrLGLcJtyRWc+tot9kidnuDeZQWfn+FivaGetcHlW607Iq9qdm4+6Rjcdm8QuiMcFHfNYkiosG9L6QHwuWZaXGxTLvIL5BjznrnhB21fxUcCs6GKw0Y6XiQCSH9ASN+pLQYjN5NpFsGRgBnXMYDQX3Odyp+8PzVbRhp1l4knkFpygmInCSFECu3bZvKUKuqWCF9gba0E14KVXMB+m3b7d3UZyVds7Sd/2Mcf5Grm8eVp1pm2VVna1rkMOL3Twys6BYKjYgnE8aqjtY6lhZiDfyvAT1VgGiCrO9Zp8VJ/uAR6IiMlsBJ1kk8m4XkLJzYXGpCNx8CP6RriO1fG1mBZzeFmDTXIJe5khV/NhP0f0jcYfmJoej2K55MRc/GDJFAJMpTLE8GPBXN0kyvmQnrIPpvs8aZprvb3AKW3T7td/THz/n8BVZmHjm/3muu4cPIvoeOvHhWE6mUh0rP4sPpJeZy/uA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(38100700002)(38350700002)(6666004)(36756003)(86362001)(52116002)(966005)(6486002)(6916009)(2906002)(6506007)(6512007)(478600001)(66946007)(8936002)(8676002)(66476007)(956004)(66556008)(26005)(186003)(16526019)(316002)(2616005)(5660300002)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kfZ39XjvMKX/e80klMsSz85HWBhbWu8dfCtrFWoNaJpwHOsc2unEmgmuJ8+F?=
 =?us-ascii?Q?mVfof/N+bEK1GL7UMmrhvHrnc1czr+jqy1d12xX2RoIjdSkNUxCK8Xi0nmRZ?=
 =?us-ascii?Q?FltBgunw0QtuaS0dsqHJUVJenvdlQeWDUFrLBMxLqkJmoVXRaZWHl7Zzzbih?=
 =?us-ascii?Q?dKhYIVuaFVFNlb9obwLpXfiRQ4YAr+RLx2VwLmYaE7ntsRYBIzl7uSk+GyLl?=
 =?us-ascii?Q?HDQRbDn0CmeNGVIW/mhWSca5tutfMTgW6PMgENSSyf0eCvAx8jBC+cmXHB0q?=
 =?us-ascii?Q?+Sd6BknuGfmeCjDeRm7rLMyPGy43rU/JvuAeT/WzUEKip568fw/RlUSn25jb?=
 =?us-ascii?Q?j2yIWKSeSC2U5sLMmZ9Np6ts4MXNt8TZ4Jp9J52DwOgus0j8DaMl3AV5/bvY?=
 =?us-ascii?Q?rouwZXm/O62sYopkIm6KtK066n1au5Q7U8aiWwpgUU8lagi/h2SoCDfWv1fj?=
 =?us-ascii?Q?YdvT7+GsUABmrz6zHMK+g8iR+inHOMk/pDFLVy9hjy5YQbwL3jwYqvuAYSJr?=
 =?us-ascii?Q?9fbjjhMPFPHp5SBUI/7TNcmzDdEedgtRnD/ZTVFaYWHpRUsJYA/mHCzv+yf4?=
 =?us-ascii?Q?PS3cPA8CykONYGje5SC+T7M2lLaGovj+wIKX1IC0ZpESaN7r0Nb4xMvIU/tY?=
 =?us-ascii?Q?gjtmhAe2JglD/auKe7kK8iA6n+KzF07MmnKQ+Cjj4eUj2Kh8jDzWWB5FOleV?=
 =?us-ascii?Q?ReZcfc7CWwZFslvo+oNApKtwK/+yWn5KxuX9NigBa2fgd+0NP4jkH3n+pxbt?=
 =?us-ascii?Q?gjhBjmoGeyBURsEfx+ouhqYosknll81ior0kZF4eS2gTLGSgrvl+eqhv/fWy?=
 =?us-ascii?Q?H4kkKKcnMMj29Imp0802aF5SWxF4ib3k3Qt28J+dIs6EpLl1crMCgBzlbS5Q?=
 =?us-ascii?Q?9VOmYj+efU4NYTK802TAYGeJ4Tk/oNnyKtc5xiqT6wnpUzD9ZNdC+BZXg8iU?=
 =?us-ascii?Q?mj2dXTw03M1NY/+yF9dVMxwZGhxk/OQpkcB0NrwZ2QpkzRMpcKleO1lIf46C?=
 =?us-ascii?Q?vlfU4m45P6b4+86vunxM6NfBplDRSSqrmb0yFthzPSucePawtUs/4yVY/kcS?=
 =?us-ascii?Q?zNQyx3ECoJUzLJyI3XJbRZDD21ox9qRF7bRc8v4ReonXdNAELyR8zu3tEzu/?=
 =?us-ascii?Q?me8fmNAUIVFgZVGA6ltfSELW/wr742BcVzCFfIBrYHrkfwV6UsGH0vaVmqMn?=
 =?us-ascii?Q?Bdfl8LEWrtZgr8KnFgeG2VEPU6MGFuNNZGEbzsHw2u7FLung+gj5S1X+CjyW?=
 =?us-ascii?Q?GfIg9gYF6weh9T/Ob4A5GXK+IOo/UW16vGw/QxqRT/f+gS2uja6ONBXaqqIb?=
 =?us-ascii?Q?I0SYdEPryRN3q6JAxoKvhVgS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf090af-3a5b-4310-09ba-08d9060b75c9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:54:14.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFBRxm8rxI3pKyXzD7H+sHasrUJWAbrBQLS/wk3k/+EHdxVaZCU0gHmOZe5Uo1T9V8jdB4utvm9nbIOFUsh6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: text/plain

Upgrade to latest stable version.

The 1.10 branch is not maitained any more, it stops update in 2019.
The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
https://nvd.nist.gov/vuln/detail/CVE-2020-26117

Some changes in this new version are as below.
1) 'bash' is added to RDEPENDS as /usr/libexec/vncsession-start requires it.
2) DEPENDS on libpam and requires 'pam' distro feature.
   This is because upstream has made 'pam' mandatory in the following commit.
   """
   commit d80817f101d1b3f1a9b1c5ec268f28fffa2d75f9
   Author: Pierre Ossman <ossman@cendio.se>
   Date:   Wed Jul 11 15:49:46 2018 +0200

       Make PAM mandatory

       It is present on all UNIX systems anyway, so let's simplify things.
       We will need it for more proper session startup anyway.
   """

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
 ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
 ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} | 13 ++++---
 3 files changed, 32 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
index 4e875ba82..5a42e67d0 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
@@ -1,29 +1,30 @@
-From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 25 Apr 2017 01:36:44 -0400
-Subject: [PATCH 2/4] do not build tests sub directory
+From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 19 Apr 2021 23:02:45 -0700
+Subject: [PATCH] do not build tests sub directory
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [OE Specific]
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  CMakeLists.txt | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94ec2ef..fb72a00 100644
+index 7bf99441..bda80598 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
+@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
    add_subdirectory(media)
  endif()
  
 -add_subdirectory(tests)
 -
 -
- include(cmake/BuildPackages.cmake)
+ add_subdirectory(release)
  
  # uninstall
 -- 
-2.7.4
+2.30.2
 
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
index 97b0a388a..5f14665b8 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
@@ -1,44 +1,34 @@
-From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Jul 2017 17:12:17 +0800
-Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
+From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 19 Apr 2021 23:14:28 -0700
+Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
 
-The static libraries in Xregion/network/rdr/rfb were linked by shared
+The static libraries in network/rdr/rfb were linked by shared
 library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to fix
 relocation issue.
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- common/Xregion/CMakeLists.txt | 1 +
  common/network/CMakeLists.txt | 1 +
  common/rdr/CMakeLists.txt     | 1 +
  common/rfb/CMakeLists.txt     | 1 +
- 4 files changed, 4 insertions(+)
+ 3 files changed, 3 insertions(+)
 
-diff --git a/common/Xregion/CMakeLists.txt b/common/Xregion/CMakeLists.txt
-index 40ca97e..9411328 100644
---- a/common/Xregion/CMakeLists.txt
-+++ b/common/Xregion/CMakeLists.txt
-@@ -3,4 +3,5 @@ add_library(Xregion STATIC
- 
- if(UNIX)
-   libtool_create_control_file(Xregion)
-+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
- endif()
 diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
-index b624c8e..6c06ec9 100644
+index d00ca452..e84e0290 100644
 --- a/common/network/CMakeLists.txt
 +++ b/common/network/CMakeLists.txt
-@@ -9,4 +9,5 @@ endif()
+@@ -16,4 +16,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(network)
 +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
-index 989ba2f..20f6489 100644
+index 989ba2f4..20f6489d 100644
 --- a/common/rdr/CMakeLists.txt
 +++ b/common/rdr/CMakeLists.txt
 @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
@@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
 +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
-index 5047e5e..88838ab 100644
+index fc5a37bf..7f5ce131 100644
 --- a/common/rfb/CMakeLists.txt
 +++ b/common/rfb/CMakeLists.txt
-@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
+@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
  
  if(UNIX)
    libtool_create_control_file(rfb)
 +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 -- 
-2.7.4
+2.30.2
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index f97c2b2d6..ce6c59bc3 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -2,22 +2,22 @@ DESCRIPTION = "TigerVNC remote display system"
 HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
-DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl"
+DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk libpam"
+RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl bash"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
 S = "${WORKDIR}/git"
 
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 inherit autotools cmake
 B = "${S}"
 
-SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
+SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
         --disable-xwayland \
 "
 
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DCMAKE_INSTALL_UNITDIR=/lib/systemd/system', '-DINSTALL_SYSTEMD_UNITS=OFF', d)}"
+
 do_configure_append () {
     olddir=`pwd`
     cd ${XSERVER_SOURCE_DIR}
@@ -125,6 +127,7 @@ do_install_append() {
 FILES_${PN} += " \
     ${libdir}/xorg/modules/extensions \
     ${datadir}/icons \
+    ${systemd_unitdir} \
 "
 
 FILES_${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
-- 
2.17.1

