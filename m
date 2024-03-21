Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC0FC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 03:13:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5937.1710990800909110478
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 20:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T6Dc+G9p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38100d7185=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L30hnj024528
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 20:13:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=zJw/LdiposCEJICY3j
	kRz1VyToM3057dG6WFvqD4g2g=; b=T6Dc+G9pUEFI+EVQHXxAUVHJ0+pdsSHXOR
	ckGedSP9TXJPSoZYs7FcNtX+KaOQHfpQ+iCMEV0cpVtkLjkhz1fdFh92yD4wwLGh
	KJ+nDM7K8h/sLaW+/0/CSP0taY285pqF2qWGOzRhsNtBlF589UjwisRyfgSQSfrF
	26CeLA5jeYXNCMmKB8tDxJ+xpFp79ZHWiQ3fuOBB4Xy7uOech5N07v9rFTXKPFX9
	kWGInb72l5GqQ+9M91N0xHT8YfFBIFa8d8+Y5/tuUAqUC+6XaZ7IiIY7euiXVYlN
	R1/b/dswguaT2EjhmVyVS3hLfRYXytq2cc3eNbqihVFN0Ypo9s7w==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww6q0mevn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 20:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZBUJQATI2g+C5lvG92zoMNR0X4rRC2/k+yFmGQjQNpM3LDRmf9HfBRiuC+UE47g/yJaJ2JIHcSEQr9aefq+9bxWtQRhiAaoMwqO/epEJIP8KsbbVXMCK+x0OWG0Qe7iVo8hB8JSI2PvslOm5u7woH9x4/zj1eccEL9AUYiUKgFh+5bAtilUy51rhLzyy55OC6AQgcXjmqImSQ1lp0+YlmFE9CzmKake4IK6srLEzoWq19iWZZCHeUSC5OWqUI0KWuCaW3v1PWFb9uFMKWYUFQGRxFXNsOIgFFCCKp0JxjN4BYCfz4/jY0GjYCH/AU6aO1SwquD7BU+DdzWPKjs5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJw/LdiposCEJICY3jkRz1VyToM3057dG6WFvqD4g2g=;
 b=Bs23aXo0fBSOp16WO+G7zTz11oezY2vqUz7X7MhMEhVv94W5LGWfo3ategAz7AITR19ZKpwNxIqJOzNSdhxlOvxlznMaFwiE+Njv8gusUr81d7ZxPISfdn6yrBwQP/JEi/vgX4ze5JeMBSYMXZk5CNMZ4f7uJXybT7aArHktuM+dafxLiLR0aH1qg2bFnwc+uBsygT+1DiBwyWEpJ9jZ2FhYnHipFtdTOG/3P96EN82Y8It69nU2YvPM6OIQPyIJc/bXIbNsF/IM0wVrnyFuUJrnDeEyKt2fwiJLVQ9OiD9ATab4TVk1XIm7v/H1ZMrbncIl1ZiZBLAqYDBe9wlcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 03:13:16 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 03:13:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2] minifi-cpp: upgrade 0.7.0 -> 0.15.0
Date: Thu, 21 Mar 2024 11:13:05 +0800
Message-Id: <20240321031305.1075342-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: a27bfd62-3b13-47c5-3c00-08dc4954d974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	seP2o/Ll/FRDDM0/mzZmztvaeB5S/KNOuWWLnIWUjye/xcujGRYFWDCrhFiaw/DpufD1EG0Zcty8CB6aaCS46l/vKpUstZMt7XzMz1aVpEUrPMDfI15+ERu2jKSWJga0kCPmQbP2dSmJuu9oo38ZMwXr1ckHdoqK5Ox5eiHX2N7Fv7POqfXrG/gsQOHo2mrycxJa+mhClKhpzZX9OCAZpH9l/W/IG/DiDTiOqX5F6JqPArJt4N2adGZiMcWp2quJ1+aMl+hgBtq0Idljch0IG0CjdDJNFjotnNNZYf8BL15SQSezlaVcbsYXxmpzPeKkfGqXsWId1zZjMe5iLz0yABl5+XjADltIVS1aNknlZ9H9EO48ZUY7Ski4BrgivDgLPmEwYkI7/UW7tm+vUD74Ne7R7dRouHs7IIUxDtNm/fyShx1vOVa3/TOIACsRBahKEyJXhKYUbmnRkS7KPY6B/1HjXFq3yQtQzubaFJOw22mb5J1m0cZ+A4EEZKoIameelh4GwMFXWRqYNNMUTXrDuBCYd+X96jmxKHImF3tZznE6KwiirGRD4WIf3NG5zNgga2oMIwiZaVfv6dzfQK+ZPnxvJURx8SUjT8srKzBR7POj5NdGpclPzJQP+Uq3dyQ5Tvcv/g7jpdPrl/NKuBUvVv6T+rBw3nBtQZRLV/ceVqDlddao7SaAXf6DmcxOcp2V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/2dPbAp554XT+bc11B17GtxetfFD2vELDg4QWj/MUkrv1osQkimEqMwyvimT?=
 =?us-ascii?Q?Vhs0Q/c4c7m098/mmcw8EU9+aR4/Nnx4XYxrqYAL9dF6kZCVdJZ6UKYeD3Dh?=
 =?us-ascii?Q?kDVChlHT5mjgIyb2W4TtJitDjb80f8HzNugzzCbWJmLDhyxR09TOMqfCaioX?=
 =?us-ascii?Q?jKBiWrx5r9QzPF4HHARcGgMIz3nZV9S6kxH5kCLEKNQJEAfQ0kvM/IcWYvVT?=
 =?us-ascii?Q?8lqQ7c6gmSoqoHQjSyVaiciG/mf+fjwpBV3myXosBGw0EdAvnhmNK8PLni1O?=
 =?us-ascii?Q?4fi5en7EvuereOspOSdKMX+hkTa2JnkXuCX6I8wniN5/885mjvvs4AgJEkn5?=
 =?us-ascii?Q?rzncwuCiKG6Q8r8yJIHJaEWoBs/dsXzSMH9dFpGwnJokxW8uuZsydECpwt47?=
 =?us-ascii?Q?Hic4d/ZBzfy24JEOQz1VpnJLaO1brAPcQ2NHdoB21mjpEa0Unw0DC7zdfShk?=
 =?us-ascii?Q?Mno7lk4SS5HXsT5sSfixovN0PfklCwuFCQO61ZYiC263PV1QCjdS/8LzDW0q?=
 =?us-ascii?Q?xJ97bb6U/R8sgedh8jZiGGIK+HeuNSNWyLkoFXH3VevBTAdH07lUY6qBZA2S?=
 =?us-ascii?Q?1x0YKZMlL2M8GSfJYCanASg7DgtDyEbxbxwaqos8JIZ6q4Hwt1g4a2ao3OZG?=
 =?us-ascii?Q?zHsbX5A377Z6NPE3Jcua5LBdUNnG9Ei7WP9splT2MHFK6BK/UzdqGw14RryS?=
 =?us-ascii?Q?vLnlYAkV7+1/7obhXKT4AwWkTwcLhfY+gjIJyt91HJwf5H+GRJizeQvwGv14?=
 =?us-ascii?Q?xwVs/e9iFokziBZcxuo6BlxaWhjtU66sn11lOfwlkSQu3G+51M/gzKl+26vS?=
 =?us-ascii?Q?pL518V6ehgUIDn4P5Drf8duaEtqCrqsOY6/FR7dtPdzPSeL56pIHWVlM8BnZ?=
 =?us-ascii?Q?O83E9O4JPseazWLx5h9zEc77H26VCAPAk5fhtzI6rm0E98kpICfWbkr5/8iv?=
 =?us-ascii?Q?wbWV69i1Ga7n5h3/Q9505BEhG1V2iWJOqjJKCDvOV/8RguOmJu1oPqFwsNBe?=
 =?us-ascii?Q?+hqvsuOJPfAWhbQnsGUiuOeJyNhJnRhI7S31T2hnzbGPwPAEv44Nh55AqdAO?=
 =?us-ascii?Q?YR4a2QXi3QYt/jm/1zppFqjI/+ErcI3A1pFhtPGvICDc6yyIALKvnDzFLM7u?=
 =?us-ascii?Q?QdAe5xuBnLlwneFqSsofD2OofkhxmcslZGEpyRSJ8HCmLpx6es9QrIEOJ8n8?=
 =?us-ascii?Q?3G/7cNiUN1WM0LNK3lKc36V6rafr8qCUWlBmrLdukoGnNQxbDKW2lCmzZgWP?=
 =?us-ascii?Q?u1MXR610+m5j8bHvzlvOrSp/K9VLZ+pNrYq/EdsIkA1pZ+8H3ETQrhlcShQV?=
 =?us-ascii?Q?6GIX7DfC9W6JsGt+of0c+tINaVXi/JeDtCU0GyZ8cDPWAj04W2j41aEOxPFp?=
 =?us-ascii?Q?Md20kJOM6ipYHX+uclXjI5X8Tpk1ewxrGjGyxRaIdHD6DYOuUP8037JYWM0m?=
 =?us-ascii?Q?DMN1Kuw8gu6NIMccu8mb9TkbV28yeM1ibZNAuzFkLDcOu69P93hBt0JR+vPi?=
 =?us-ascii?Q?Gg/7dezrw97kbwZO190WVMYg1oukbhLobkhWTymiyzui8Y2QwFidROfudskj?=
 =?us-ascii?Q?phicCPYaAQfKWP1vRv7yfmLTbTBjLQeLY7JHCdsY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27bfd62-3b13-47c5-3c00-08dc4954d974
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 03:13:15.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIshQ79vtZ+4S+An3vNBhRO0J7K/tZJh2/X+zsIouGQs682etKeNtjqI7dN4EFx0PIvFuDJpgCXoiCBZp0orsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
X-Proofpoint-GUID: sZNiv3IUP7JGOdgBMwIEAd2t6GkuYRpI
X-Proofpoint-ORIG-GUID: sZNiv3IUP7JGOdgBMwIEAd2t6GkuYRpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_14,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 03:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109500

Release Notes:
https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=65145325#ReleaseNotesMiNiFi(C++)-Versioncpp-0.15.0

* Use external dependencies where possible to get rid of bundled
  packages.
* Add PACKAGECONFIGs.
* Use its own systemd service file.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 change: do not use ccache

 ...l2-to-linker-cmdline-of-xml-is-found.patch |  39 ----
 ...-missing-includes-cstdint-and-cstdio.patch |  70 ------
 ...SPUUID.cmake-Pass-CFLAGS-to-compiler.patch |  35 ---
 ...1-CMakeLists.txt-Pass-the-OPENSSLDIR.patch |  31 ---
 ...ts.txt-use-curl-local-source-tarball.patch |  34 ---
 ...ot-use-LFS64-functions-on-linux-musl.patch |  35 ---
 .../0001-Do-not-use-bundled-packages.patch    | 108 ++++++++++
 .../files/0001-Fix-build-with-libc.patch      |  36 ----
 ...s-issues-around-autovector-iterator_.patch |  65 ------
 ...sts.txt-do-not-search-gcc-ar-and-gcc.patch |  34 ---
 .../files/0001-civetweb-Disable-lto.patch     |  33 ---
 ...onfig.guess-Support-build-on-aarch64.patch |  31 ---
 .../0001-cxxopts-Add-limits-header.patch      |  34 ---
 .../files/0002-Fix-build-with-clang-17.patch  |  37 ----
 .../files/0002-Fix-osspuuid-build.patch       |  78 +++++++
 ...make-use-libressl-local-source-tarba.patch |  32 ---
 .../files/0003-Fix-libsodium-build.patch      |  39 ++++
 ...PUUID.cmake-use-ossp-uuid-local-sour.patch |  34 ---
 .../files/0004-Fix-spdlog-build.patch         |  44 ++++
 .../files/0005-Pass-noline-flag-to-flex.patch |  31 +++
 ...d-missing-header-cstdint-for-int64_t.patch |  36 ++++
 ...007-CMakeLists.txt-do-not-use-ccache.patch |  38 ++++
 ...essl-avoid-BSWAP-assembly-for-ARM-v6.patch |  36 ----
 .../files/fix-libressl-compile.patch          |  45 ----
 .../minifi-cpp/files/fix-minifi-compile.patch |  62 ------
 .../files/fix-osspuuid-compile.patch          |  38 ----
 .../files/fix-osspuuid-cross-compile.patch    |  39 ----
 .../files/fix-osspuuid-musl-compile.patch     |  27 ---
 .../files/fix-rocksdb-cross-compile.patch     |  14 --
 .../minifi-cpp/files/minifi.service           |  13 --
 .../remove_const_due_to_std_lock_guard.patch  |  40 ----
 .../minifi-cpp/minifi-cpp_0.15.0.bb           | 200 ++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            | 169 ---------------
 33 files changed, 574 insertions(+), 1063 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.service
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
 delete mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
deleted file mode 100644
index d813b37f9..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 609e1745d26d6f42d426018a4dd8d2342d6fc170 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Aug 2020 08:37:57 -0700
-Subject: [PATCH] Add -lxml2 to linker cmdline of xml is found
-
-When cross compiling for systems where static libs
-for libxml are not available cmake's detection mechanism
-resort to linking with libxml.so but doesnt use -lxml2
-liblldbHost.a however requires libxml on linker
-cmdline _after_ itself so its use of symbols from libxml2
-can be resolved. Here check for libxml2 being detected and
-add it if its found.
-
-Fixes
-minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/lib/libxml2.so is incompatible with elf32-i386
-| clang-11: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/libarchive-3.3.2/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thirdparty/libarchive-3.3.2/CMakeLists.txt b/thirdparty/libarchive-3.3.2/CMakeLists.txt
-index 0c1ea6f7..cde0cc51 100644
---- a/thirdparty/libarchive-3.3.2/CMakeLists.txt
-+++ b/thirdparty/libarchive-3.3.2/CMakeLists.txt
-@@ -1031,7 +1031,7 @@ ENDIF()
- IF(LIBXML2_FOUND)
-   CMAKE_PUSH_CHECK_STATE()	# Save the state of the variables
-   INCLUDE_DIRECTORIES(${LIBXML2_INCLUDE_DIR})
--  LIST(APPEND ADDITIONAL_LIBS ${LIBXML2_LIBRARIES})
-+  LIST(APPEND ADDITIONAL_LIBS xml2)
-   SET(HAVE_LIBXML2 1)
-   # libxml2's include files use iconv.h
-   SET(CMAKE_REQUIRED_INCLUDES ${ICONV_INCLUDE_DIR} ${LIBXML2_INCLUDE_DIR})
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
deleted file mode 100644
index 0fce8dc64..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jan 2023 21:40:43 -0800
-Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
-
-This is needed with GCC 13 and newer [1]
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/88edfbfb5e1cac228f7cc31fbec24bb637fe54b1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
- storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
- tpool/aio_linux.cc                                               | 1 +
- 6 files changed, 6 insertions(+)
-
---- a/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
-+++ b/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
-@@ -8,6 +8,7 @@
- #pragma once
- #ifndef ROCKSDB_LITE
- 
-+#include <cstdint>
- #include <string>
- #include "rocksdb/status.h"
- 
---- a/thirdparty/rocksdb/util/string_util.h
-+++ b/thirdparty/rocksdb/util/string_util.h
-@@ -6,6 +6,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <sstream>
- #include <string>
- #include <unordered_map>
---- a/extensions/expression-language/common/Value.h
-+++ b/extensions/expression-language/common/Value.h
-@@ -15,6 +15,7 @@
-  * limitations under the License.
-  */
- 
-+#include <cstdint>
- #include <string>
- #include <sstream>
- #include <iomanip>
---- a/libminifi/include/utils/StringUtils.h
-+++ b/libminifi/include/utils/StringUtils.h
-@@ -18,6 +18,7 @@
- #define LIBMINIFI_INCLUDE_IO_STRINGUTILS_H_
- #include <iostream>
- #include <cstring>
-+#include <cstdint>
- #include <functional>
- #ifdef WIN32
- 	#include <cwctype>
---- a/thirdparty/rocksdb/db/compaction_iteration_stats.h
-+++ b/thirdparty/rocksdb/db/compaction_iteration_stats.h
-@@ -5,6 +5,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- struct CompactionIterationStats {
-   // Compaction statistics
- 
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
deleted file mode 100644
index ceb8ec34b..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ab031c2b1f8c03e23a8dc8a95c9c9e9b8ce397b2 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 15 Sep 2023 11:32:11 +0800
-Subject: [PATCH] BundledOSSPUUID.cmake: Pass CFLAGS to compiler
-
-Make sure -fdebug-prefix-map options are passed to compiler to fix the
-below warning:
-  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/minificontroller in package minifi-cpp-dbg contains reference to TMPDIR
-File /usr/bin/.debug/minifi in package minifi-cpp-dbg contains reference to TMPDIR [buildpaths]
-
-Upsteam-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
-Upstream-Status: Pending
-
- cmake/BundledOSSPUUID.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
-index 0cf4bac0..ec57ef51 100644
---- a/cmake/BundledOSSPUUID.cmake
-+++ b/cmake/BundledOSSPUUID.cmake
-@@ -37,7 +37,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
-     ENDFOREACH(BYPRODUCT)
- 
-     # Build project
--    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CFLAGS=-fPIC CXXFLAGS=-fPIC --host=${HOST_SYS}
-+    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CXXFLAGS=-fPIC --host=${HOST_SYS}
-         --with-cxx --without-perl --without-php --without-pgsql
-         --prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install)
-     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
deleted file mode 100644
index 158fed559..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0c5735a0a02e15c3eae94d25fb8756285d121ddb Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 15 Sep 2023 10:59:05 +0800
-Subject: [PATCH] CMakeLists.txt: Pass the OPENSSLDIR
-
-Fixes:
-  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/minificontroller in package minifi-cpp contains reference to TMPDIR
-  File /usr/bin/minifi in package minifi-cpp contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 215a4ef4..6fe8101f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -75,6 +75,7 @@ set(PASSTHROUGH_CMAKE_ARGS -DANDROID_ABI=${ANDROID_ABI}
-                            -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY}
-                            -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE}
-                            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
-+                           -DOPENSSLDIR=${OPENSSLDIR}
- 						   ${OPENSSL_PASSTHROUGH}
-                            -G${CMAKE_GENERATOR})
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
deleted file mode 100644
index 183a006e8..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8d99edeefb23c9d7574a0b5a0e2e3f41b0433490 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 10 Sep 2020 16:14:10 +0800
-Subject: [PATCH] CMakeLists.txt: use curl local source tarball
-
-Do not download curl source during compile.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CMakeLists.txt | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7cd550fb..215a4ef4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -314,11 +314,7 @@ endif()
- 
-   ExternalProject_Add(
-     curl-external
--    GIT_REPOSITORY "https://github.com/curl/curl.git"
--    GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.0
--    SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
--    LIST_SEPARATOR % # This is needed for passing semicolon-separated lists
--    TLS_VERIFY OFF
-+    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/curl-7.64.0"
-     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
-                "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-install"
-                "-DCMAKE_INSTALL_LIBDIR=lib${LIBSUFFIX}"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
deleted file mode 100644
index 29f5b94a0..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6690e7fe566445e20fec178e9e209e5f9f2fdde3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Apr 2023 23:33:46 -0700
-Subject: [PATCH] Do not use LFS64 functions on linux/musl
-
-On musl, off_t is 64bit always ( even on 32bit platforms ), therefore using
-LFS64 funcitons is not needed on such platforms. Moreover, musl has stopped
-providing aliases for these functions [1] which means it wont compile on
-newer musl systems. Therefore only use it on 32bit glibc/linux platforms
-and exclude musl like cygwin or OSX
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
-
-Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/spdlog-20170710/include/spdlog/details/os.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thirdparty/spdlog-20170710/include/spdlog/details/os.h b/thirdparty/spdlog-20170710/include/spdlog/details/os.h
-index 735f60147..639b07a79 100644
---- a/thirdparty/spdlog-20170710/include/spdlog/details/os.h
-+++ b/thirdparty/spdlog-20170710/include/spdlog/details/os.h
-@@ -237,7 +237,7 @@ inline size_t filesize(FILE *f)
- #else // unix
-     int fd = fileno(f);
-     //64 bits(but not in osx, where fstat64 is deprecated)
--#if !defined(__FreeBSD__) && !defined(__APPLE__) && (defined(__x86_64__) || defined(__ppc64__))
-+#if !defined(__FreeBSD__) && !defined(__APPLE__) && ((defined(__x86_64__) || defined(__ppc64__)) && (!defined(__linux__)))
-     struct stat64 st;
-     if (fstat64(fd, &st) == 0)
-         return static_cast<size_t>(st.st_size);
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
new file mode 100644
index 000000000..b997d6ce7
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
@@ -0,0 +1,108 @@
+From 65923a872e44cb461ef1a03374057351f0bc5efe Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 19 Mar 2024 19:39:04 +0800
+Subject: [PATCH] Do not use bundled packages
+
+Use external dependencies for openssl, curl, bzip2, zlib, libarchive,
+xz, yaml-cpp and libxml2.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt                       | 23 ++++++-----------------
+ extensions/libarchive/CMakeLists.txt |  7 ++-----
+ 2 files changed, 8 insertions(+), 22 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 13a2b992..8a1dd6d9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -222,9 +222,7 @@ else()
+ endif()
+ 
+ if (NOT DISABLE_BZIP2 AND (NOT DISABLE_LIBARCHIVE OR (NOT DISABLE_ROCKSDB AND NOT WIN32)))
+-    include(BundledBZip2)
+-    use_bundled_bzip2(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
+-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/bzip2/dummy")
++    find_package(BZip2 REQUIRED)
+ endif()
+ 
+ if(NOT WIN32)
+@@ -247,9 +245,7 @@ endif()
+ 
+ # OpenSSL
+ if (NOT OPENSSL_OFF)
+-    include(BundledOpenSSL)
+-    use_openssl("${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_BINARY_DIR}")
+-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/ssl")
++    find_package(OpenSSL REQUIRED)
+ 
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DOPENSSL_SUPPORT")
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DOPENSSL_SUPPORT")
+@@ -262,9 +258,7 @@ set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DSODIUM_STATIC=1")
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSODIUM_STATIC=1")
+ 
+ # zlib
+-include(BundledZLIB)
+-use_bundled_zlib(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
+-list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/zlib/dummy")
++find_package(ZLIB REQUIRED)
+ 
+ # uthash
+ add_library(ut INTERFACE)
+@@ -272,9 +266,7 @@ target_include_directories(ut SYSTEM INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/thir
+ 
+ # cURL
+ if(NOT DISABLE_CURL)
+-    include(BundledLibcURL)
+-    use_bundled_curl(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
+-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/curl/dummy")
++    find_package(CURL REQUIRED)
+ else()
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_CURL")
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_CURL")
+@@ -285,8 +277,7 @@ include(BundledSpdlog)
+ use_bundled_spdlog(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
+ 
+ # yaml-cpp
+-include(BundledYamlCpp)
+-use_bundled_yamlcpp(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
++find_package(yaml-cpp REQUIRED)
+ 
+ # concurrentqueue
+ add_library(concurrentqueue INTERFACE)
+@@ -357,9 +348,7 @@ include(Extensions)
+ add_subdirectory(libminifi)
+ 
+ if ((ENABLE_OPENWSMAN AND NOT DISABLE_CIVET AND NOT DISABLE_CURL) OR ENABLE_ALL OR ENABLE_AZURE)
+-    include(BundledLibXml2)
+-    use_bundled_libxml2(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
+-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/libxml2/dummy")
++    find_package(LibXml2 REQUIRED)
+ endif()
+ 
+ if (ENABLE_ALL OR ENABLE_PROMETHEUS OR NOT DISABLE_CIVET)
+diff --git a/extensions/libarchive/CMakeLists.txt b/extensions/libarchive/CMakeLists.txt
+index 2b89d3ea..49e13e21 100644
+--- a/extensions/libarchive/CMakeLists.txt
++++ b/extensions/libarchive/CMakeLists.txt
+@@ -22,13 +22,10 @@ if (DISABLE_LIBARCHIVE)
+ endif()
+ 
+ if (NOT DISABLE_LZMA)
+-    include(BundledLibLZMA)
+-    use_bundled_liblzma(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
+-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/liblzma/dummy")
++    find_package(LibLZMA REQUIRED)
+ endif()
+ 
+-include(BundledLibArchive)
+-use_bundled_libarchive(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
++find_package(LibArchive REQUIRED)
+ 
+ include(${CMAKE_SOURCE_DIR}/extensions/ExtensionHeader.txt)
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch
deleted file mode 100644
index c1c118196..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 72e0fe484444169007e481c9b33d8f78ebe03674 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 27 May 2021 15:44:10 -0700
-Subject: [PATCH] Fix build with libc++
-
-In libc++ on 32-bit platforms, int64_t is defined as alias of long long. On 64-bit platforms: long.
-
-On the other hand in definition of std::chrono::duration aliases, that you can find here long long is used
-
-Therefore create custom unit to avoid incompatibility between libstdc++
-and libc++
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extensions/expression-language/Expression.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/extensions/expression-language/Expression.cpp b/extensions/expression-language/Expression.cpp
-index a25e1d3f..68d6320c 100644
---- a/extensions/expression-language/Expression.cpp
-+++ b/extensions/expression-language/Expression.cpp
-@@ -629,7 +629,8 @@ Value expr_toDate(const std::vector<Value> &args) {
- #endif  // EXPRESSION_LANGUAGE_USE_DATE
- 
- Value expr_now(const std::vector<Value> &args) {
--  return Value(std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
-+  using Milliseconds = std::chrono::duration<std::int64_t, std::chrono::milliseconds::period>;
-+  return Value(std::chrono::duration_cast<Milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
- }
- 
- Value expr_unescapeCsv(const std::vector<Value> &args) {
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
deleted file mode 100644
index cd837d8de..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 787d5052a6034cc722b073c652cc610ae037f933 Mon Sep 17 00:00:00 2001
-From: Levi Tamasi <ltamasi@fb.com>
-Date: Fri, 22 Nov 2019 18:12:35 -0800
-Subject: [PATCH 1/2] Fix the constness issues around
- autovector::iterator_impl's dereference operators (#6057)
-
-Summary:
-As described in detail in issue https://github.com/facebook/rocksdb/issues/6048, iterators' dereference operators
-(`*`, `->`, and `[]`) should return `pointer`s/`reference`s (as opposed to
-`const_pointer`s/`const_reference`s) even if the iterator itself is `const`
-to be in sync with the standard's iterator concept.
-Pull Request resolved: https://github.com/facebook/rocksdb/pull/6057
-
-Test Plan: make check
-
-Differential Revision: D18623235
-
-Pulled By: ltamasi
-
-fbshipit-source-id: 04e82d73bc0c67fb0ded018383af8dfc332050cc
----
-Upstream-Status: Pending
-
- thirdparty/rocksdb/util/autovector.h | 15 ++++-----------
- 1 file changed, 4 insertions(+), 11 deletions(-)
-
-diff --git a/thirdparty/rocksdb/util/autovector.h b/thirdparty/rocksdb/util/autovector.h
-index b5c84712..6d337908 100644
---- a/thirdparty/rocksdb/util/autovector.h
-+++ b/thirdparty/rocksdb/util/autovector.h
-@@ -120,27 +120,20 @@ class autovector {
-     }
- 
-     // -- Reference
--    reference operator*() {
-+    reference operator*() const {
-       assert(vect_->size() >= index_);
-       return (*vect_)[index_];
-     }
- 
--    const_reference operator*() const {
--      assert(vect_->size() >= index_);
--      return (*vect_)[index_];
--    }
--
--    pointer operator->() {
-+    pointer operator->() const {
-       assert(vect_->size() >= index_);
-       return &(*vect_)[index_];
-     }
- 
--    const_pointer operator->() const {
--      assert(vect_->size() >= index_);
--      return &(*vect_)[index_];
-+    reference operator[](difference_type len) const {
-+      return *(*this + len);
-     }
- 
--
-     // -- Logical Operators
-     bool operator==(const self_type& other) const {
-       assert(vect_ == other.vect_);
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
deleted file mode 100644
index bc480d969..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0eee3fb85dad084b6b42f7b219d8aa3a62620a27 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 28 Oct 2020 09:52:40 +0800
-Subject: [PATCH] civetweb/CMakeLists.txt: do not search gcc-ar and gcc-ranlib
-
-Do not search gcc-ar and gcc-ranlib. Specify GCC_AR and GCC_RANLIB in
-EXTRA_OECMAKE to avoid host contamination.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- thirdparty/civetweb-1.10/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/thirdparty/civetweb-1.10/CMakeLists.txt b/thirdparty/civetweb-1.10/CMakeLists.txt
-index f559a04e..0689e3f6 100644
---- a/thirdparty/civetweb-1.10/CMakeLists.txt
-+++ b/thirdparty/civetweb-1.10/CMakeLists.txt
-@@ -246,11 +246,9 @@ set_property(CACHE CIVETWEB_CXX_STANDARD PROPERTY STRINGS auto c++14 c++11 c++98
- 
- # Configure the linker
- if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
--  find_program(GCC_AR gcc-ar)
-   if (GCC_AR)
-     set(CMAKE_AR ${GCC_AR})
-   endif()
--  find_program(GCC_RANLIB gcc-ranlib)
-   if (GCC_RANLIB)
-     set(CMAKE_RANLIB ${GCC_RANLIB})
-   endif()
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch
deleted file mode 100644
index ec4e6ffc4..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 120c708d51f72ade4a31d3d8f35bcfad7b12e723 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Sep 2022 20:38:03 -0700
-Subject: [PATCH] civetweb: Disable lto
-
-lto does not work everywhere, therefore disable it atleast in the cmake
-file, we can still enable it via environment
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/civetweb-1.10/CMakeLists.txt | 4 ----
- 1 file changed, 4 deletions(-)
-
---- a/thirdparty/civetweb-1.10/CMakeLists.txt
-+++ b/thirdparty/civetweb-1.10/CMakeLists.txt
-@@ -298,7 +298,6 @@ add_c_compiler_flag(/WX)
- add_c_compiler_flag(-pedantic-errors)
- add_c_compiler_flag(-fvisibility=hidden)
- add_c_compiler_flag(-fstack-protector-strong RELEASE)
--add_c_compiler_flag(-flto RELEASE)
- 
- add_c_compiler_flag(-fstack-protector-all DEBUG)
- if (MINGW)
-@@ -361,7 +360,6 @@ if (CIVETWEB_ENABLE_CXX)
-   add_cxx_compiler_flag(-pedantic-errors)
-   add_cxx_compiler_flag(-fvisibility=hidden)
-   add_cxx_compiler_flag(-fstack-protector-strong RELEASE)
--  add_cxx_compiler_flag(-flto RELEASE)
- 
-   add_cxx_compiler_flag(-fstack-protector-all DEBUG)
-   if (MINGW)
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch
deleted file mode 100644
index 3086a7045..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 92fdbfdd6b55ff0b65edd9a283ac85ad349e325b Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 12 Dec 2023 07:27:52 +0000
-Subject: [PATCH] config.guess: Fix do_configure error builder aarch64
-
-Fixed configure error when build on aarch64 host:
-error: cannot guess build type; you must specify one
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- config.guess      |   2 +-
- 1 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thirdparty/uuid-1.6.2/config.guess b/thirdparty/uuid-1.6.2/config.guess
-index ca2a03c..a858bfd 100755
---- a/thirdparty/uuid-1.6.2/config.guess
-+++ b/thirdparty/uuid-1.6.2/config.guess
-@@ -835,7 +835,7 @@ EOF
-     i*86:Minix:*:*)
- 	echo ${UNAME_MACHINE}-pc-minix
- 	exit ;;
--    arm*:Linux:*:*)
-+    arm*:Linux:*:*|aarch64:Linux:*:*)
- 	eval $set_cc_for_build
- 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
- 	    | grep -q __ARM_EABI__
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch
deleted file mode 100644
index ef26c475d..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fda0713ce3e07786757a057abe7ebf2146d33780 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Mar 2021 18:31:45 -0800
-Subject: [PATCH] cxxopts: Add limits header
-
-needed for numeric_limits
-
-Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/1021]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/cxxopts/include/cxxopts.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/thirdparty/cxxopts/include/cxxopts.hpp
-+++ b/thirdparty/cxxopts/include/cxxopts.hpp
-@@ -29,6 +29,7 @@ THE SOFTWARE.
- #include <cctype>
- #include <exception>
- #include <iostream>
-+#include <limits>
- #include <map>
- #include <memory>
- #include <regex>
---- a/libminifi/src/utils/StringUtils.cpp
-+++ b/libminifi/src/utils/StringUtils.cpp
-@@ -21,6 +21,8 @@
- #include <Windows.h>
- #endif
- 
-+#include <limits>
-+
- namespace org {
- namespace apache {
- namespace nifi {
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch
deleted file mode 100644
index 7581efc76..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang-17.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a784973e500753747992a51dc0fb1caabbbb03be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 6 Jul 2023 17:52:38 -0700
-Subject: [PATCH 2/2] Fix build with clang 17
-
-Part of https://github.com/jarro2783/cxxopts/commit/513afbc6dcfe2952cb2ffab0dae2415b11bba2d0
-
-Upstream-Status: Backport [https://github.com/jarro2783/cxxopts/commit/513afbc6dcfe2952cb2ffab0dae2415b11bba2d0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/cxxopts/include/cxxopts.hpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/thirdparty/cxxopts/include/cxxopts.hpp b/thirdparty/cxxopts/include/cxxopts.hpp
-index e87416f1..bd2d81cf 100644
---- a/thirdparty/cxxopts/include/cxxopts.hpp
-+++ b/thirdparty/cxxopts/include/cxxopts.hpp
-@@ -468,14 +468,14 @@ namespace cxxopts
-         {
-           if (negative)
-           {
--            if (u > static_cast<U>(-std::numeric_limits<T>::min()))
-+            if (u > static_cast<U>((std::numeric_limits<T>::min)()))
-             {
-               throw argument_incorrect_type(text);
-             }
-           }
-           else
-           {
--            if (u > static_cast<U>(std::numeric_limits<T>::max()))
-+            if (u > static_cast<U>((std::numeric_limits<T>::max)()))
-             {
-               throw argument_incorrect_type(text);
-             }
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
new file mode 100644
index 000000000..65c52c633
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
@@ -0,0 +1,78 @@
+From 4e8e1943541d3b887ba86dc1b488cbb058c7d1cd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 19 Mar 2024 20:48:25 +0800
+Subject: [PATCH] Fix osspuuid build
+
+* Specify correct configure options to fix osspuuid cross build.
+* Do not download osspuuid source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ cmake/BundledOSSPUUID.cmake                         | 10 +++++-----
+ .../ossp-uuid/ossp-uuid-cross-compile-fix.patch     | 13 +++++++++++++
+ 2 files changed, 18 insertions(+), 5 deletions(-)
+ create mode 100644 thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
+
+diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
+index c4fa1523..1faf2e5c 100644
+--- a/cmake/BundledOSSPUUID.cmake
++++ b/cmake/BundledOSSPUUID.cmake
+@@ -23,10 +23,12 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
+     set(PATCH_FILE1 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
+     set(PATCH_FILE2 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-no-prog.patch")
+     set(PATCH_FILE3 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-update-config-guess.patch")
++    set(PATCH_FILE4 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch")
+     set(PC ${Bash_EXECUTABLE} -c "set -x &&\
+             (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE1}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE1}\") &&\
+             (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE2}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE2}\") &&\
+-            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE3}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE3}\") ")
++            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE3}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE3}\") &&\
++            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATCH_FILE4}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE4}\") ")
+ 
+     # Define byproducts
+     set(BYPRODUCTS "lib/libuuid.a"
+@@ -39,7 +41,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
+     ENDFOREACH(BYPRODUCT)
+ 
+     # Build project
+-    set(CONFIGURE_COMMAND ./configure "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
++    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure --host=${HOST_SYS} --build=${BUILD_SYS} "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
+     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
+     if(NOT build_type MATCHES debug)
+         list(APPEND CONFIGURE_COMMAND --enable-debug=yes)
+@@ -47,10 +49,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
+ 
+     ExternalProject_Add(
+             ossp-uuid-external
+-            URL "https://deb.debian.org/debian/pool/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz"
+-            URL_HASH "SHA256=11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
+             BUILD_IN_SOURCE true
+-            SOURCE_DIR "${BINARY_DIR}/thirdparty/ossp-uuid-src"
++            SOURCE_DIR "${SOURCE_DIR}/thirdparty/uuid-1.6.2"
+             BUILD_COMMAND make
+             CMAKE_COMMAND ""
+             UPDATE_COMMAND ""
+diff --git a/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
+new file mode 100644
+index 00000000..b8d7b0bb
+--- /dev/null
++++ b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
+@@ -0,0 +1,13 @@
++diff --git a/shtool b/shtool
++index a2d2567..ab4fe17 100755
++--- a/shtool
+++++ b/shtool
++@@ -1400,7 +1400,7 @@ install )
++             if [ ".$opt_t" = .yes ]; then
++                 echo "strip $dsttmp" 1>&2
++             fi
++-            strip $dsttmp || shtool_exit $?
+++            $STRIP $dsttmp || shtool_exit $?
++         fi
++         if [ ".$opt_o" != . ]; then
++             if [ ".$opt_t" = .yes ]; then
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
deleted file mode 100644
index da5ee9754..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5a5317044b0039e9e19aabcecb7b666a3f13e136 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 10 Sep 2020 15:08:19 +0800
-Subject: [PATCH] cmake/LibreSSL.cmake: use libressl local source tarball
-
-Do not download libressl source during compile.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- cmake/LibreSSL.cmake | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/cmake/LibreSSL.cmake b/cmake/LibreSSL.cmake
-index 57319e40..bab30129 100644
---- a/cmake/LibreSSL.cmake
-+++ b/cmake/LibreSSL.cmake
-@@ -43,9 +43,7 @@ function(use_libre_ssl SOURCE_DIR BINARY_DIR)
- 
- 	ExternalProject_Add(
- 	libressl-portable
--	URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
--	URL_HASH "SHA256=9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
--	SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
-+	SOURCE_DIR "${SOURCE_DIR}/thirdparty/libressl-2.8.3"
- 	PATCH_COMMAND ${PATCH}
- 	CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
- 				"-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}/thirdparty/libressl-install"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
new file mode 100644
index 000000000..a08962724
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
@@ -0,0 +1,39 @@
+From 1c697e4d75f0045d5364d622960ff8047a4ad3ec Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 19 Mar 2024 20:56:05 +0800
+Subject: [PATCH] Fix libsodium build
+
+* Specify correct configure options to fix libsodium cross build.
+* Do not download libsodium source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ cmake/BundledLibSodium.cmake | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
+index 3a3daf41..d851f753 100644
+--- a/cmake/BundledLibSodium.cmake
++++ b/cmake/BundledLibSodium.cmake
+@@ -58,14 +58,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
+                 EXCLUDE_FROM_ALL TRUE
+         )
+     else()
+-        set(CONFIGURE_COMMAND ./configure --disable-pie --enable-minimal "--prefix=${LIBSODIUM_BIN_DIR}")
++        set(CONFIGURE_COMMAND ./configure --host=${HOST_SYS} --build=${BUILD_SYS} --disable-pie --enable-minimal "--prefix=${LIBSODIUM_BIN_DIR}")
+ 
+         ExternalProject_Add(
+                 libsodium-external
+-                URL "${LIBSODIUM_OFFICIAL_MIRROR_URL} ${LIBSODIUM_GITHUB_MIRROR_URL} ${LIBSODIUM_GENTOO_MIRROR_URL}"
+-                URL_HASH ${LIBSODIUM_URL_HASH}
+                 BUILD_IN_SOURCE true
+-                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
++                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-stable"
+                 BUILD_COMMAND make
+                 CMAKE_COMMAND ""
+                 UPDATE_COMMAND ""
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
deleted file mode 100644
index a39e15b79..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 74ade26f7ccd0dbc4ad97cb3082204118a67c92b Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 10 Sep 2020 15:12:41 +0800
-Subject: [PATCH] cmake/BundledOSSPUUID.cmake: use ossp-uuid local source
- tarball
-
-Do not download ossp-uuid source during compile.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- cmake/BundledOSSPUUID.cmake | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
-index 1103156d..0cf4bac0 100644
---- a/cmake/BundledOSSPUUID.cmake
-+++ b/cmake/BundledOSSPUUID.cmake
-@@ -47,10 +47,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
- 
-     ExternalProject_Add(
-             ossp-uuid-external
--            URL "https://deb.debian.org/debian/pool/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz"
--            URL_HASH "SHA256=11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-             BUILD_IN_SOURCE true
--            SOURCE_DIR "${BINARY_DIR}/thirdparty/ossp-uuid-src"
-+            SOURCE_DIR "${SOURCE_DIR}/thirdparty/uuid-1.6.2"
-             BUILD_COMMAND make
-             CMAKE_COMMAND ""
-             UPDATE_COMMAND ""
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
new file mode 100644
index 000000000..177c6adee
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
@@ -0,0 +1,44 @@
+From 8a5fe73f722718aa5c9a467c28a26913771f7208 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 19 Mar 2024 20:57:37 +0800
+Subject: [PATCH] Fix spdlog build
+
+* Specify CMAKE_INSTALL_LIBDIR to fix multilib build.
+* Do not download spdlog source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ cmake/BundledSpdlog.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/BundledSpdlog.cmake b/cmake/BundledSpdlog.cmake
+index 974cbbaa..c0c45688 100644
+--- a/cmake/BundledSpdlog.cmake
++++ b/cmake/BundledSpdlog.cmake
+@@ -35,11 +35,12 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
+     endif()
+ 
+     # Set build options
+-    set(SPDLOG_SOURCE_DIR "${BINARY_DIR}/thirdparty/spdlog-src")
++    set(SPDLOG_SOURCE_DIR "${SOURCE_DIR}/thirdparty/spdlog-src")
+     set(SPDLOG_INSTALL_DIR "${BINARY_DIR}/thirdparty/spdlog-install")
+     set(SPDLOG_LIBRARY "${SPDLOG_INSTALL_DIR}/${BYPRODUCT}")
+     set(SPDLOG_CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
+             "-DCMAKE_INSTALL_PREFIX=${SPDLOG_INSTALL_DIR}"
++            "-DCMAKE_INSTALL_LIBDIR=${LIBDIR}"
+             "-DSPDLOG_BUILD_EXAMPLE=OFF"
+             "-DSPDLOG_BUILD_TESTS=OFF"
+             "-DSPDLOG_BUILD_TESTING=OFF"
+@@ -49,7 +50,6 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
+     # Build project
+     ExternalProject_Add(
+             spdlog-external
+-            URL "https://github.com/gabime/spdlog/archive/v1.8.0.zip"
+             SOURCE_DIR "${SPDLOG_SOURCE_DIR}"
+             CMAKE_ARGS ${SPDLOG_CMAKE_ARGS}
+             BUILD_BYPRODUCTS "${SPDLOG_LIBRARY}"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch b/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch
new file mode 100644
index 000000000..53939131f
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch
@@ -0,0 +1,31 @@
+From 083babbd6c6cc6f31530fbac0227c1d426fb0863 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 19 Mar 2024 21:00:59 +0800
+Subject: [PATCH] Pass --noline flag to flex
+
+This ensures that line directive is not emitted into lexer output which
+could be absolute build paths.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ extensions/expression-language/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extensions/expression-language/CMakeLists.txt b/extensions/expression-language/CMakeLists.txt
+index 775b4116..84edc617 100644
+--- a/extensions/expression-language/CMakeLists.txt
++++ b/extensions/expression-language/CMakeLists.txt
+@@ -77,7 +77,7 @@ flex_target(
+     el-scanner
+     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.ll
+     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.cpp
+-    COMPILE_FLAGS --c++
++    COMPILE_FLAGS "--c++ --noline"
+ )
+ 
+ add_flex_bison_dependency(el-scanner el-parser)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch b/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
new file mode 100644
index 000000000..38893e74a
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
@@ -0,0 +1,36 @@
+From 08d1b4b66fedde97eefb5e3ff6aa98fd02be7c21 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 20 Mar 2024 10:03:14 +0800
+Subject: [PATCH] OsUtils.h: add missing header <cstdint> for int64_t
+
+Fix build with musl:
+libminifi/include/utils/OsUtils.h:31:1: error: 'int64_t' does not name a type
+   31 | int64_t getCurrentProcessPhysicalMemoryUsage();
+      | ^~~~~~~
+libminifi/include/utils/OsUtils.h:22:1: note: 'int64_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
+   21 | #include <system_error>
+  +++ |+#include <cstdint>
+   22 |
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libminifi/include/utils/OsUtils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libminifi/include/utils/OsUtils.h b/libminifi/include/utils/OsUtils.h
+index a7117233..5e623d1a 100644
+--- a/libminifi/include/utils/OsUtils.h
++++ b/libminifi/include/utils/OsUtils.h
+@@ -19,6 +19,7 @@
+ #include <string>
+ #include <optional>
+ #include <system_error>
++#include <cstdint>
+ 
+ struct sockaddr;
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch
new file mode 100644
index 000000000..73a59f2a8
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch
@@ -0,0 +1,38 @@
+From 44867a8e4100a7296b98e0e850d950d24b980959 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 21 Mar 2024 10:18:39 +0800
+Subject: [PATCH] CMakeLists.txt: do not use ccache
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8a1dd6d91..8a5314544 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -82,12 +82,12 @@ if (USE_REAL_ODBC_TEST_DRIVER)
+ endif()
+ 
+ # Use ccache if present
+-find_program(CCACHE_FOUND ccache)
+-if(CCACHE_FOUND)
+-    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
+-    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
+-    message("-- Found ccache: ${CCACHE_FOUND}")
+-endif(CCACHE_FOUND)
++#find_program(CCACHE_FOUND ccache)
++#if(CCACHE_FOUND)
++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
++#    message("-- Found ccache: ${CCACHE_FOUND}")
++#endif(CCACHE_FOUND)
+ 
+ # Use gold linker if instructed
+ if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
deleted file mode 100644
index a7dc35ae5..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch
---- orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	1970-01-01 09:00:00.000000000 +0900
-+++ patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	2020-08-07 23:14:46.196764271 +0900
-@@ -0,0 +1,30 @@
-+This patch was imported from the libressl potable.
-+https://github.com/libressl-portable/portable/commit/a9332ccecfce63bf54924e70c11f420edd3ae312
-+
-+From a9332ccecfce63bf54924e70c11f420edd3ae312 Mon Sep 17 00:00:00 2001
-+From: Brent Cook <bcook@openbsd.org>
-+Date: Sun, 17 Jul 2016 18:12:23 -0500
-+Subject: [PATCH] avoid BSWAP assembly for ARM <= v6
-+
-+diff -urN orig/crypto/modes/modes_lcl.h patched/crypto/modes/modes_lcl.h
-+--- orig/crypto/modes/modes_lcl.h	2018-11-18 21:27:10.000000000 +0900
-++++ patched/crypto/modes/modes_lcl.h	2020-08-07 23:11:01.960764745 +0900
-+@@ -45,14 +45,16 @@
-+ 			asm ("bswapl %0"		\
-+ 			: "+r"(ret));	ret;		})
-+ # elif (defined(__arm__) || defined(__arm)) && !defined(__STRICT_ALIGNMENT)
-+-#  define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
-++#  if (__ARM_ARCH >= 6)
-++#   define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
-+ 			asm ("rev %0,%0; rev %1,%1"	\
-+ 			: "+r"(hi),"+r"(lo));		\
-+ 			(u64)hi<<32|lo;			})
-+-#  define BSWAP4(x) ({	u32 ret;			\
-++#   define BSWAP4(x) ({	u32 ret;			\
-+ 			asm ("rev %0,%1"		\
-+ 			: "=r"(ret) : "r"((u32)(x)));	\
-+ 			ret;				})
-++#  endif
-+ # endif
-+ #endif
-+ #endif
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
deleted file mode 100644
index 32bcfbd2b..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
---- orig/cmake/LibreSSL.cmake	2020-08-07 21:58:34.660773928 +0900
-+++ patched/cmake/LibreSSL.cmake	2020-08-07 22:51:18.620767245 +0900
-@@ -18,6 +18,9 @@
- function(use_libre_ssl SOURCE_DIR BINARY_DIR)
- 	message("Using bundled LibreSSL from release")
- 	
-+	find_package(Patch REQUIRED)
-+	set(PATCH "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch")
-+
- 	set(BYPRODUCT_PREFIX "lib" CACHE STRING "" FORCE)
- 	set(BYPRODUCT_SUFFIX ".a" CACHE STRING "" FORCE)
- 	
-@@ -27,16 +30,29 @@
- 		set(BYPRODUCT_PREFIX "" CACHE STRING "" FORCE)
- 	set(BUILD_ARGS " -GVisual Studio 15 2017")
- 	endif(WIN32)
-+
-+	set(BYPRODUCTS
-+		"lib/${BYPRODUCT_PREFIX}crypto${BYPRODUCT_SUFFIX}"
-+		"lib/${BYPRODUCT_PREFIX}ssl${BYPRODUCT_SUFFIX}"
-+		"lib/${BYPRODUCT_PREFIX}tls${BYPRODUCT_SUFFIX}"
-+	)
-+	set(LIBRESSL_INSTALL_DIR "${BINARY_DIR}/thirdparty/libressl-install" CACHE STRING "" FORCE)
-+	FOREACH(BYPRODUCT ${BYPRODUCTS})
-+		LIST(APPEND LIBRESSL_LIBRARIES_LIST "${LIBRESSL_INSTALL_DIR}/${BYPRODUCT}")
-+	ENDFOREACH(BYPRODUCT)
-+
- 	ExternalProject_Add(
- 	libressl-portable
- 	URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
- 	URL_HASH "SHA256=9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
- 	SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
-+	PATCH_COMMAND ${PATCH}
- 	CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
- 				"-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}/thirdparty/libressl-install"
- 				"-DLIBRESSL_APPS=OFF"
- 				"-DLIBRESSL_TESTS=OFF"
- 				"${BUILD_ARGS}"
-+	BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
- 	)
- 
- 	add_library(crypto STATIC IMPORTED)
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
deleted file mode 100644
index d5b4449b8..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/CMakeLists.txt patched/CMakeLists.txt
---- orig/CMakeLists.txt	2020-08-07 21:58:34.656773928 +0900
-+++ patched/CMakeLists.txt	2020-08-10 15:08:31.800278357 +0900
-@@ -119,13 +119,28 @@
- 	endif()
- endif()
- 
-+include(CheckCXXSourceCompiles)
-+CHECK_CXX_SOURCE_COMPILES("
-+    #include <atomic>
-+    int main(int argc, char **argv) {
-+        uint8_t m;
-+        __atomic_load_8(&m, 0);
-+        __atomic_fetch_add_1(&m , 0, 0);
-+        return 0;
-+    }"
-+    HAVE_ATOMIC
-+)
-+if(NOT HAVE_ATOMIC)
-+    set(LIB_ATOMIC atomic)
-+endif()
-+
- # Use ccache if present
--find_program(CCACHE_FOUND ccache)
--if(CCACHE_FOUND)
--    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
--    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
--    message("-- Found ccache: ${CCACHE_FOUND}")
--endif(CCACHE_FOUND)
-+#find_program(CCACHE_FOUND ccache)
-+#if(CCACHE_FOUND)
-+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
-+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
-+#    message("-- Found ccache: ${CCACHE_FOUND}")
-+#endif(CCACHE_FOUND)
- 
- if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
-   execute_process(COMMAND ${CMAKE_C_COMPILER} -fuse-ld=gold -Wl,--version ERROR_QUIET OUTPUT_VARIABLE ld_version)
-@@ -303,8 +318,10 @@
-     GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.0
-     SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
-     LIST_SEPARATOR % # This is needed for passing semicolon-separated lists
-+    TLS_VERIFY OFF
-     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
-                "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-install"
-+               "-DCMAKE_INSTALL_LIBDIR=lib${LIBSUFFIX}"
-                 -DCMAKE_POSITION_INDEPENDENT_CODE=ON
-                 -DBUILD_CURL_EXE=OFF
-                 -DBUILD_TESTING=OFF
-diff -urN -x .git orig/libminifi/CMakeLists.txt patched/libminifi/CMakeLists.txt
---- orig/libminifi/CMakeLists.txt	2020-08-07 21:58:34.676773928 +0900
-+++ patched/libminifi/CMakeLists.txt	2020-08-10 15:06:17.124278642 +0900
-@@ -108,6 +108,7 @@
- add_library(spdlog STATIC ${SPD_SOURCES})
- add_library(core-minifi STATIC ${SOURCES})
- target_link_libraries(core-minifi ${CMAKE_DL_LIBS} yaml-cpp)
-+target_link_libraries(core-minifi ${LIB_ATOMIC})
- 
- #target_link_libraries(core-minifi  PRIVATE bsdiff )
- 
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
deleted file mode 100644
index 903e72e07..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUID.cmake
---- orig/cmake/BundledOSSPUUID.cmake	2020-08-07 21:58:34.660773928 +0900
-+++ patched/cmake/BundledOSSPUUID.cmake	2020-08-07 22:05:57.404772993 +0900
-@@ -22,7 +22,9 @@
- 
-     # Define patch step
-     find_package(Patch REQUIRED)
--    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
-+    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
-+    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch")
-+    set(PATCH3 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch")
- 
-     # Define byproducts
-     set(BYPRODUCTS "lib/libuuid.a"
-@@ -35,7 +37,9 @@
-     ENDFOREACH(BYPRODUCT)
- 
-     # Build project
--    set(CONFIGURE_COMMAND ./configure "CFLAGS=-fPIC" "CXXFLAGS=-fPIC" --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
-+    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CFLAGS=-fPIC CXXFLAGS=-fPIC --host=${HOST_SYS}
-+        --with-cxx --without-perl --without-php --without-pgsql
-+        --prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install)
-     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
-     if(NOT build_type MATCHES debug)
-         list(APPEND CONFIGURE_COMMAND --enable-debug=yes)
-@@ -52,8 +56,8 @@
-             UPDATE_COMMAND ""
-             INSTALL_COMMAND make install
-             BUILD_BYPRODUCTS ${OSSPUUID_LIBRARIES_LIST}
--            CONFIGURE_COMMAND ""
--            PATCH_COMMAND ${PC} && ${CONFIGURE_COMMAND}
-+            CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
-+            PATCH_COMMAND ${PATCH1} && ${PATCH2} && ${PATCH3}
-             STEP_TARGETS build
-             EXCLUDE_FROM_ALL TRUE
-     )
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
deleted file mode 100644
index add1f6f2d..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
---- orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
-+++ patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	2020-08-07 22:28:04.396770190 +0900
-@@ -0,0 +1,33 @@
-+diff -urN orig/config.sub patched/config.sub
-+--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
-++++ patched/config.sub	2020-08-07 22:23:48.412770731 +0900
-+@@ -238,6 +238,8 @@
-+ 	# Some are omitted here because they have special meanings below.
-+ 	1750a | 580 \
-+ 	| a29k \
-++	| aarch64 | aarch64_be \
-++	| riscv32 | riscv64 \
-+ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
-+ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
-+ 	| am33_2.0 \
-+@@ -314,6 +316,8 @@
-+ 	# Recognize the basic CPU types with company name.
-+ 	580-* \
-+ 	| a29k-* \
-++	| aarch64-* | aarch64_be-* \
-++	| riscv32-* | riscv64-* \
-+ 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
-+ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
-+ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
-+diff -urN orig/shtool patched/shtool
-+--- orig/shtool	2008-07-05 06:43:08.000000000 +0900
-++++ patched/shtool	2020-08-07 22:21:23.192771037 +0900
-+@@ -1400,7 +1400,7 @@
-+             if [ ".$opt_t" = .yes ]; then
-+                 echo "strip $dsttmp" 1>&2
-+             fi
-+-            strip $dsttmp || shtool_exit $?
-++            $STRIP $dsttmp || shtool_exit $?
-+         fi
-+         if [ ".$opt_o" != . ]; then
-+             if [ ".$opt_t" = .yes ]; then
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
deleted file mode 100644
index f8ba89dc3..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch
---- orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
-+++ patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	2020-08-07 11:22:49.344854508 +0900
-@@ -0,0 +1,21 @@
-+diff -urN orig/config.sub patched/config.sub
-+--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
-++++ patched/config.sub	2020-08-07 11:19:25.948854937 +0900
-+@@ -120,7 +120,7 @@
-+ # Here we must recognize all the valid KERNEL-OS combinations.
-+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
-+ case $maybe_os in
-+-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
-++  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | linux-musl* | \
-+   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
-+   storm-chaos* | os2-emx* | rtmk-nova*)
-+     os=-$maybe_os
-+@@ -1250,7 +1250,7 @@
-+ 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
-+ 	      | -chorusos* | -chorusrdb* \
-+ 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
-+-	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
-++	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* | -linux-musl* \
-+ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
-+ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
-+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
deleted file mode 100644
index 0a3194da9..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
-diff -urN orig/thirdparty/rocksdb/CMakeLists.txt patched/thirdparty/rocksdb/CMakeLists.txt
---- orig/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:39:40.254677515 +0900
-+++ patched/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:51:11.898676054 +0900
-@@ -618,6 +618,7 @@
- add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
- target_link_libraries(${ROCKSDB_STATIC_LIB}
-   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
-+target_link_libraries(${ROCKSDB_STATIC_LIB} ${LIB_ATOMIC})
- 
- if(WIN32)
- #  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
-
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
deleted file mode 100644
index 059cdbcc2..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=MiNiFi Service
-After=network.target
-RequiresMountsFor=/var
-
-[Service]
-Type=simple
-WorkingDirectory=@LOCALSTATEDIR@/lib/minifi
-Environment=MINIFI_HOME=@SYSCONFDIR@/minifi
-ExecStart=@BINDIR@/minifi
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch b/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
deleted file mode 100644
index 365dec9d4..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bfce136fa9ff1e955928539484ba4dd55f98f05b Mon Sep 17 00:00:00 2001
-From: Willem Jan Withagen <wjw@digiware.nl>
-Date: Sun, 16 Aug 2020 23:38:55 +0200
-Subject: [PATCH] Update channel.h
-
-Compiling this on FreeBSD with CLang fails due to:
-```In file included from /usr/ports/net/ceph15/work/ceph-15.2.4/src/rocksdb/utilities/backupable/backupable_db.cc:16:
-/usr/ports/net/ceph15/work/ceph-15.2.4/src/rocksdb/util/channel.h:35:33: error: no matching constructor for initialization of 'std::lock_guard<std::mutex>'
-    std::lock_guard<std::mutex> lk(lock_);
-                                ^  ~~~~~
-/usr/include/c++/v1/__mutex_base:90:14: note: candidate constructor not viable: 1st argument ('const std::mutex') would lose const qualifier
-    explicit lock_guard(mutex_type& __m) _LIBCPP_THREAD_SAFETY_ANNOTATION(acquire_capability(__m))
-             ^
-/usr/include/c++/v1/__mutex_base:100:5: note: candidate constructor not viable: no known conversion from 'const std::mutex' to 'const std::__1::lock_guard<std::__1::mutex>' for 1st argument
-    lock_guard(lock_guard const&) _LIBCPP_EQUAL_DELETE;
-    ^
-/usr/include/c++/v1/__mutex_base:94:5: note: candidate constructor not viable: requires 2 arguments, but 1 was provided
-    lock_guard(mutex_type& __m, adopt_lock_t) _LIBCPP_THREAD_SAFETY_ANNOTATION(requires_capability(__m))
-    ^
-1 error generated.
-```
----
-Upstream-Status: Pending
-
- thirdparty/rocksdb/util/channel.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thirdparty/rocksdb/util/channel.h b/thirdparty/rocksdb/util/channel.h
-index 705fa2d28f..993bef5bc0 100644
---- a/thirdparty/rocksdb/util/channel.h
-+++ b/thirdparty/rocksdb/util/channel.h
-@@ -31,7 +31,7 @@ class channel {
-     return buffer_.empty() && eof_;
-   }
- 
--  size_t size() const {
-+  size_t size() {
-     std::lock_guard<std::mutex> lk(lock_);
-     return buffer_.size();
-   }
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
new file mode 100644
index 000000000..0667fdaec
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -0,0 +1,200 @@
+SUMMARY = "A subproject of Apache NiFi to collect data where it originates."
+DESCRIPTION = "MiNiFi--a subproject of Apache NiFi--is a complementary \
+data collection approach that supplements the core tenets of NiFi in dataflow \
+management, focusing on the collection of data at the source of its creation."
+HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
+SECTION = "console/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c62efdfb90a8aa4cc3bc15f56baa30b7"
+
+SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main \
+           git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;name=expected-lite;destsuffix=${S}/thirdparty/expected-lite-src \
+           git://github.com/ericniebler/range-v3.git;protocol=https;branch=master;name=range-v3;destsuffix=${S}/thirdparty/range-v3-src \
+           git://github.com/Neargye/magic_enum.git;protocol=https;branch=master;name=magic-enum;destsuffix=${S}/thirdparty/magic-enum-src \
+           git://github.com/jarro2783/cxxopts.git;protocol=https;branch=v2_2;name=cxxopts;destsuffix=${S}/thirdparty/cxxopts-src \
+           git://github.com/gsl-lite/gsl-lite.git;protocol=https;branch=master;name=gsl-lite;destsuffix=${S}/thirdparty/gsl-lite-src \
+           git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/thirdparty/date-src \
+           git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
+           git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
+           git://github.com/civetweb/civetweb.git;protocol=https;branch=master;name=civetweb;destsuffix=${S}/thirdparty/civetweb-src \
+           ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
+           https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
+           file://0001-Do-not-use-bundled-packages.patch \
+           file://0002-Fix-osspuuid-build.patch \
+           file://0003-Fix-libsodium-build.patch \
+           file://0004-Fix-spdlog-build.patch \
+           file://0005-Pass-noline-flag-to-flex.patch \
+           file://0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch \
+           file://0007-CMakeLists.txt-do-not-use-ccache.patch \
+           file://systemd-volatile.conf \
+           file://sysvinit-volatile.conf \
+          "
+
+SRCREV = "9b55dc0c0f17a190f3e9ade87070a28faf542c25"
+SRCREV_expected-lite = "c8ffab649ba56e43c731b7017a69ddaebe2e1893"
+SRCREV_range-v3 = "a81477931a8aa2ad025c6bda0609f38e09e4d7ec"
+SRCREV_magic-enum = "e1ea11a93d0bdf6aae415124ded6126220fa4f28"
+SRCREV_cxxopts = "302302b30839505703d37fb82f536c53cf9172fa"
+SRCREV_gsl-lite = "755ba124b54914e672737acace6a9314f59e8d6f"
+SRCREV_date = "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
+SRCREV_asio = "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
+SRCREV_spdlog = "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
+SRCREV_civetweb = "d7ba35bbb649209c66e582d5a0244ba988a15159"
+
+SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_cxxopts_gsl-lite_date_asio_spdlog_civetweb"
+
+SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
+SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake systemd
+
+DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp"
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+
+EXTRA_OECMAKE = " \
+                 -DCMAKE_BUILD_TYPE=Release \
+                 -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
+                 -DGCC_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+                 -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+                 -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+                 -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=${TARGET_DBGSRC_DIR}' \
+                 -DENABLE_ENCRYPT_CONFIG=ON \
+                 -DENABLE_LUA_SCRIPTING=OFF \
+                 -DENABLE_PYTHON_SCRIPTING=OFF \
+                 -DENABLE_AWS=OFF \
+                 -DENABLE_AZURE=OFF \
+                 -DENABLE_GCP=OFF \
+                 -DENABLE_KUBERNETES=OFF \
+                 -DENABLE_MQTT=OFF \
+                 -DENABLE_ELASTICSEARCH=OFF \
+                 -DENABLE_SQL=OFF \
+                 -DENABLE_PROMETHEUS=OFF \
+                 -DENABLE_PROCFS=OFF \
+                 -DENABLE_SPLUNK=OFF \
+                 -DENABLE_OPC=OFF \
+                 -DENABLE_LIBRDKAFKA=OFF \
+                 -DDISABLE_CURL=OFF \
+                 -DDISABLE_BZIP2=OFF \
+                 -DDISABLE_LZMA=OFF \
+                 -DDISABLE_JEMALLOC=ON \
+                 -DSKIP_TESTS=ON \
+                 -DFETCHCONTENT_SOURCE_DIR_GSL-LITE=${S}/thirdparty/gsl-lite-src \
+                 -DFETCHCONTENT_SOURCE_DIR_DATE_SRC=${S}/thirdparty/date-src \
+                 -DFETCHCONTENT_SOURCE_DIR_EXPECTED-LITE=${S}/thirdparty/expected-lite-src \
+                 -DFETCHCONTENT_SOURCE_DIR_RANGE-V3_SRC=${S}/thirdparty/range-v3-src \
+                 -DFETCHCONTENT_SOURCE_DIR_MAGIC_ENUM=${S}/thirdparty/magic-enum-src \
+                 -DFETCHCONTENT_SOURCE_DIR_ASIO=${S}/thirdparty/asio-src \
+                 -DFETCHCONTENT_SOURCE_DIR_CXXOPTS_SRC=${S}/thirdparty/cxxopts-src \
+                 -DFETCHCONTENT_SOURCE_DIR_CIVETWEB=${S}/thirdparty/civetweb-src \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DENABLE_SYSTEMD=ON', '-DENABLE_SYSTEMD=OFF', d)} \
+                "
+
+PACKAGECONFIG ??= "civetweb libarchive rocksdb expression-language"
+PACKAGECONFIG[civetweb] = "-DDISABLE_CIVET=OFF,-DDISABLE_CIVET=ON"
+PACKAGECONFIG[openwsman] = "-DENABLE_OPENWSMAN=ON,-DENABLE_OPENWSMAN=OFF,libxml2"
+PACKAGECONFIG[libarchive] = "-DDISABLE_LIBARCHIVE=OFF,-DDISABLE_LIBARCHIVE=ON,libarchive"
+PACKAGECONFIG[rocksdb] = "-DDISABLE_ROCKSDB=OFF -DBUILD_ROCKSDB=OFF,-DDISABLE_ROCKSDB=ON,rocksdb"
+PACKAGECONFIG[expression-language] = "-DDISABLE_EXPRESSION_LANGUAGE=OFF, -DDISABLE_EXPRESSION_LANGUAGE=ON"
+
+SYSTEMD_PACKAGES = "minifi-cpp"
+SYSTEMD_SERVICE:${PN} = "minifi.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install[cleandirs] += "${WORKDIR}/minifi-install"
+PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
+
+do_compile:prepend() {
+    # Remove build host references
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+        -e 's|${DEBUG_PREFIX_MAP}||g' \
+        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+        ${B}/libminifi/agent_version.cpp
+}
+
+do_install() {
+    DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+    MINIFI_BIN=${bindir}
+    MINIFI_HOME=${sysconfdir}/minifi
+    MINIFI_RUN=${localstatedir}/lib/minifi
+    MINIFI_LOG=${localstatedir}/log/minifi
+
+    install -m 755 -d ${D}${MINIFI_BIN}
+    install -m 755 -d ${D}${MINIFI_HOME}/conf
+    install -m 755 -d ${D}${localstatedir}/lib/minifi
+
+    for i in encrypt-config minifi minifi.sh minificontroller; do
+        install -m 755 ${WORKDIR}/minifi-install/usr/bin/${i} ${D}${MINIFI_BIN}
+    done
+    for i in config.yml minifi-log.properties minifi.properties minifi-uid.properties; do
+        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MINIFI_HOME}/conf
+    done
+
+    install -m 755 -d ${D}${libdir}/minifi-extensions
+    install -m 755 ${WORKDIR}/minifi-install/usr/bin/libcore-minifi.so ${D}${libdir}
+    install -m 755 ${WORKDIR}/minifi-install/usr/extensions/*.so ${D}${libdir}/minifi-extensions
+
+    install -m 755 -d ${D}${libexecdir}/minifi-python
+    for i in examples google h2o; do
+        cp -rf ${WORKDIR}/minifi-install/usr/minifi-python/${i} ${D}${libexecdir}/minifi-python
+    done
+
+    sed -i "s|MINIFI_HOME=.*|MINIFI_HOME=${MINIFI_HOME}|g" ${D}${MINIFI_BIN}/minifi.sh
+    sed -i "s|bin_dir=.*|bin_dir=${MINIFI_BIN}|g" ${D}${MINIFI_BIN}/minifi.sh
+
+    sed -i "s|#appender.rolling.directory=.*|appender.rolling.directory=${MINIFI_LOG}|g" \
+        ${D}${MINIFI_HOME}/conf/minifi-log.properties
+    sed -i "s|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default=${MINIFI_RUN}/provenance_repository|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default=${MINIFI_RUN}/flowfile_repository|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default=${MINIFI_RUN}/content_repository|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=${MINIFI_HOME}/conf/config.yml|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i "s|nifi.extension.path=.*|nifi.extension.path=${libdir}/minifi-extensions/*|g" \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -m 755 -d ${D}${sysconfdir}/tmpfiles.d
+        install -m 644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/minifi.conf
+        sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/tmpfiles.d/minifi.conf
+
+        install -m 755 -d ${D}${systemd_system_unitdir}
+        install -m 644 ${WORKDIR}/minifi-install/usr/bin/minifi.service ${D}${systemd_system_unitdir}
+
+        sed -i -e "s|^Environment=.*|Environment=MINIFI_HOME=${MINIFI_HOME}|g" ${D}${systemd_system_unitdir}/minifi.service
+        sed -i -e "s|^ExecStart=.*|ExecStart=${MINIFI_BIN}/minifi|g" ${D}${systemd_system_unitdir}/minifi.service
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
+
+        sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/default/volatiles/99_minifi
+    fi
+}
+
+pkg_postinst:${PN}() {
+    if [ -z "$D" ]; then
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
+
+FILES:${PN}-dev = ""
+FILES:${PN} += "${libdir}/libcore-minifi.so \
+                ${libdir}/minifi-extensions \
+                ${libexecdir}/minifi-python \
+               "
+
+INSANE_SKIP:${PN} += "dev-deps"
+
+CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
deleted file mode 100644
index 5059b6321..000000000
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ /dev/null
@@ -1,169 +0,0 @@
-SUMMARY = "A subproject of Apache NiFi to collect data where it originates."
-DESCRIPTION = "MiNiFi--a subproject of Apache NiFi--is a complementary \
-data collection approach that supplements the core tenets of NiFi in dataflow \
-management, focusing on the collection of data at the source of its creation."
-HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
-SECTION = "console/network"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
-
-DEPENDS = "virtual/crypt expat flex python3 bison-native libxml2 nettle lz4"
-RDEPENDS:${PN} = "python3-core"
-
-SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
-SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=https \
-            https://curl.haxx.se/download/curl-7.64.0.tar.bz2;name=curl;subdir=git/thirdparty \
-            https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz;name=libressl;subdir=git/thirdparty \
-            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=git/thirdparty \
-            file://fix-minifi-compile.patch \
-            file://fix-libressl-compile.patch \
-            file://fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch \
-            file://fix-osspuuid-compile.patch \
-            file://fix-osspuuid-cross-compile.patch \
-            file://fix-osspuuid-musl-compile.patch \
-            file://fix-rocksdb-cross-compile.patch \
-            file://remove_const_due_to_std_lock_guard.patch \
-            file://0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch \
-            file://0001-CMakeLists.txt-use-curl-local-source-tarball.patch \
-            file://0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch \
-            file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
-            file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
-            file://0001-cxxopts-Add-limits-header.patch \
-            file://0001-Fix-build-with-libc.patch \
-            file://0001-civetweb-Disable-lto.patch \
-            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
-            file://0001-Fix-the-constness-issues-around-autovector-iterator_.patch \
-            file://0002-Fix-build-with-clang-17.patch \
-            file://0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch \
-            file://0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch \
-            file://minifi.service \
-            file://systemd-volatile.conf \
-            file://sysvinit-volatile.conf \
-            file://0001-config.guess-Support-build-on-aarch64.patch \
-            "
-
-SRC_URI[curl.md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
-SRC_URI[curl.sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
-SRC_URI[libressl.md5sum] = "0f1127bd21b4aa8495a910379c2ad936"
-SRC_URI[libressl.sha256sum] = "9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
-SRC_URI[ossp-uuid.md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
-SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-
-S = "${WORKDIR}/git"
-
-inherit pkgconfig cmake systemd
-
-SYSTEMD_PACKAGES = "minifi-cpp"
-SYSTEMD_SERVICE:${PN} = "minifi.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
-
-EXTRA_OECMAKE += " \
-    -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
-    -DSKIP_TESTS=ON \
-    -DGCC_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
-    -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
-    -DDISABLE_PYTHON_SCRIPTING=ON \
-    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
-    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=${TARGET_DBGSRC_DIR}' \
-    -DOPENSSLDIR=${sysconfdir}/libressl \
-    "
-
-CFLAGS:append = " -fPIC"
-EXTRA_OECMAKE:append:toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
-LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
-
-# RV lld errors out:
-# riscv64-yoe-linux-ld.lld: error: init.c:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
-LDFLAGS:remove:riscv32 = "-fuse-ld=lld"
-LDFLAGS:remove:riscv64 = "-fuse-ld=lld"
-
-# There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
-COMPATIBLE_MACHINE:mips = "(!.*mips).*"
-COMPATIBLE_MACHINE:mips64 = "(!.*mips64).*"
-COMPATIBLE_MACHINE:powerpc = "(!.*ppc).*"
-
-TARGET_CFLAGS:append:riscv32 = " -fpic"
-TARGET_CXXFLAGS:append:riscv32 = " -fpic"
-TARGET_CFLAGS:append:riscv64 = " -fpic"
-TARGET_CXXFLAGS:append:riscv64 = " -fpic"
-
-do_install[cleandirs] += "${WORKDIR}/minifi-install"
-PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
-
-do_configure:prepend:libc-musl() {
-    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=1/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
-    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=0/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
-}
-
-do_configure:append() {
-    sed -i -e 's|${WORKDIR}|<WORKDIR>|g' ${S}/libminifi/include/agent/agent_version.h
-}
-
-CFLAGS:append:libc-glibc = " -D_GNU_SOURCE"
-CXXFLAGS:append:libc-glibc = " -D_GNU_SOURCE"
-
-do_install() {
-    DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
-    MINIFI_BIN=${bindir}
-    MINIFI_HOME=${sysconfdir}/minifi
-    MINIFI_RUN=${localstatedir}/lib/minifi
-    MINIFI_LOG=${localstatedir}/log/minifi
-
-    install -d ${D}${MINIFI_BIN}
-    install -d ${D}${MINIFI_HOME}/conf
-    install -m 755 -d ${D}${localstatedir}/lib/minifi
-    install -m 755 -d ${D}${libexecdir}/minifi-python
-    cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
-    cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
-
-    sed -i 's|#appender.rolling.directory=.*|appender.rolling.directory='${MINIFI_LOG}'|g' \
-        ${D}${MINIFI_HOME}/conf/minifi-log.properties
-    sed -i 's|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default='${MINIFI_RUN}'/provenance_repository|g' \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-    sed -i 's|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default='${MINIFI_RUN}'/flowfile_repository|g' \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-    sed -i 's|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default='${MINIFI_RUN}'/content_repository|g' \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-    sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-    sed -i 's|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g' \
-        ${D}${MINIFI_HOME}/conf/minifi.properties
-
-    sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
-    sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
-    sed -i 's|pid_file=${bin_dir}/.|pid_file='${localstatedir}/run/'|g' ${D}${MINIFI_BIN}/minifi.sh
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/minifi.conf
-        install -m 0755 -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/system/
-
-        sed -i 's|@LOCALSTATEDIR@|${localstatedir}|g' ${D}${systemd_unitdir}/system/minifi.service
-        sed -i 's|@SYSCONFDIR@|${sysconfdir}|g' ${D}${systemd_unitdir}/system/minifi.service
-        sed -i 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
-
-        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpfiles.d/minifi.conf
-
-    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
-
-        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
-    fi
-}
-
-pkg_postinst:${PN}() {
-    if [ -z "$D" ]; then
-        if type systemd-tmpfiles >/dev/null; then
-            systemd-tmpfiles --create
-        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-            ${sysconfdir}/init.d/populate-volatile.sh update
-        fi
-    fi
-}
-
-CLEANBROKEN = "1"
-- 
2.25.1


