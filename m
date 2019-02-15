Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 19126 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Feb 2019 06:02:34 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
	by mail.openembedded.org (Postfix) with ESMTP id 454936BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0/8dqDbAtoCfV7xt/RgIfc4COn1eEvHoJLRB3398G+Q=;
	b=MueVS6fK+UgdGSnvhi1yqLZ0cpbDAwBuzFXcmy0KqKiAMZRqgF4NS/vYshFBkrbN5z+7w3hD/Xe5R7mCjSMDE9yIxy48w+a86ZnLVCp9Rz4lXsdCMiHSRd2elKJWvD45ngv29tNzf3Z7AXYsSs6nrx5iUNL7RkeNOwIR69mfYk4=
Received: from CY4PR02CA0004.namprd02.prod.outlook.com (2603:10b6:903:18::14)
	by SN6PR02MB5024.namprd02.prod.outlook.com (2603:10b6:805:67::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16;
	Fri, 15 Feb 2019 00:28:51 +0000
Received: from CY1NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by CY4PR02CA0004.outlook.office365.com
	(2603:10b6:903:18::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via
	Frontend Transport; Fri, 15 Feb 2019 00:28:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT062.mail.protection.outlook.com (10.152.75.60) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 15 Feb 2019 00:28:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56053
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRN4-0006qR-6V for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2019 16:28:50 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRMz-0005tP-1x for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2019 16:28:45 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1F0Sf7i015488; Thu, 14 Feb 2019 16:28:41 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1guRMv-0005qC-1u; Thu, 14 Feb 2019 16:28:41 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2019 16:28:36 -0800
Message-ID: <1550190516-10077-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(189003)(199004)(6666004)(36386004)(4326008)(426003)(106466001)(26005)(2906002)(77096007)(2351001)(107886003)(486006)(14444005)(8936002)(336012)(81166006)(476003)(2616005)(126002)(50226002)(63266004)(186003)(50466002)(48376002)(8676002)(81156014)(9786002)(316002)(106002)(16586007)(6916009)(305945005)(47776003)(478600001)(51416003)(356004)(36756003)(72206003)(7696005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5024; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT062;
	1:hOnIOM7xBWD8iP3tcvCpM0yGiT4KsCAkoR8n0PeTQa2TEYyoxxI9wgq26x/KmSVdsl3Edq+x5psDEgx/AeEGV0AvUdnpeys5YsEX3a1zpItMwQZBRlxiaCbVSYOVT3je5xjyKUOLhhOPbB8+HSHWZS/vqySlxtvUf5WyqZiX+gQ=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd9d5442-b4c8-4c3a-0825-08d692dc8ef7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:SN6PR02MB5024; 
X-MS-TrafficTypeDiagnostic: SN6PR02MB5024:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5024;
	20:pMexR74mTtzOEMmoQcc+BI/BnUTbIwqeVDYh0Y7D6I6tcsl1KO5/XKKPGuXbpYKxN8ySn4E8AMsvIKG5KcEyLHH7079v6ouklOMlJxt3Fvh95wHVW6eAhcwciPljJe4K6QO9uHz/Y8fNG1Zp2N4QsI3PKuLR/QI8BmbbdilUxxtRaVZkIREQJlHX7Ynex3Q/ARLBnNhUcwRFRD9gAFnC1GggxaamNA3oX3h2S6ZG0oDvlhgQkLLbnjOQTp7I525PPHSKfyvwG5t+BABGxmfHgCvvASiJm+EpFgKMKeC1TmQL99ufKvrUOT502Q/mq18y3KtqzxsbqAGsschhSSvZ/4gQgLNlyM2LO5U3DCXFseqyQmjnkpc42RAKh6xehD7s/ygTiM9meccOzZ+KzeTrBW+oxlsDSGtJ3jxyO8eeUrFMhHTJ1spzL5J4QfbxX6b5TQq373Emotr3lvhR7k7/ApicKs3jttO/dPmoRJ3OWpBG55JYKx8O92N/iceufxgT
X-Microsoft-Antispam-PRVS: <SN6PR02MB5024AB053C683805275E686AB9600@SN6PR02MB5024.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09497C15EB
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB5024;
	23:dReVYPLzEaufx7DZrGo9F69E9S4R37QLZMju25mWg?=
	=?us-ascii?Q?dE1HvdJ6yX7n+2lWCqgOSOzfGaNDF181L1c0IKWia8WuySHy0MuLoxKG7oNf?=
	=?us-ascii?Q?p4bsZu1NPXsqTfxhV2cu1Bl3XXOHrTTvTiC7BQz5ZvuKMruMxlHkWcTIyNf+?=
	=?us-ascii?Q?VnVIQokRjkIC8Mz5HNq5DQA/bPBJFTFjbTsLCIcmEbDNrk9YUZwNc80C2CMz?=
	=?us-ascii?Q?8xw/n/F4Sqq55kRkWATFRyUiGJNzLE1qPLDBv8Rk0QGaVZYPDj5G5MDSpwHk?=
	=?us-ascii?Q?w8eKeBNhEHOMIpATdE5NQskVQEsTOmIFfD1+zx2oV4xsXOjPpXCfT//jjXal?=
	=?us-ascii?Q?rGoxcyaB4eRzLG62CbISSokODAPdSZcaculjnvpvTA98A96ieQLEvwrTqF9+?=
	=?us-ascii?Q?dJG5dCdSiJU836qEXGpNtudRCX9FilFlcZRY9Iz8BjiW8B6c2YbHk8lewkVX?=
	=?us-ascii?Q?VgMlUSRlkgsR5k7u8dhi84MVIqN7s87MET9nhZmJY9C+OZf2CpRfLgalmk0k?=
	=?us-ascii?Q?eR0Qrsf7cskGcyxL039mvu2OjuqN2ofTfUc2ye4xqm4jUP4s3N3FrY7UtTX7?=
	=?us-ascii?Q?DNDQBDHiJe+GH+U+AL5/CQ1L4m4S5snbw+XvdQU9psPM68H1IFm4GEmWsgpm?=
	=?us-ascii?Q?lwh6Hd19RuXBe1rr9w2aOkrbLDdyI1HBTZvVJ5GOpSXUcWW8NORPVwGgNZOJ?=
	=?us-ascii?Q?B9/qdMgvbdNWhpga4VJX4TzWvPWQtQ+KUGZ5w3U357qp6jtf0rLBup0e140/?=
	=?us-ascii?Q?nfwLu7BJwcYEI90N9VALgEPgBi2lwcAmHtSzlM2VaGVrFCrEVYQKDUdb3G+2?=
	=?us-ascii?Q?Cm/rSxd1Dp/FQ5jPrXNQ8mj/fI4l7xrohS2jXtwAT5WImJbOKBvPZZGAIJGt?=
	=?us-ascii?Q?OYeyAddJc/+S3Iizj6FytrQ04Be1p7dRfGSF0FgsXEIzeEs3R3ZaPUxKk5Fw?=
	=?us-ascii?Q?rAp4zC9uUImwZwuXSeF71K7WJXLPNpUssE2mPf1U3hdTM0cMg70UHsb1Jzbj?=
	=?us-ascii?Q?7gHTY2jWNsoXm2VAsBpxKFqTiWuPKgFgL6SnVuWL8sUB61YfCXm9Whoq9z3u?=
	=?us-ascii?Q?H9hR4ymDxKojLVSbnqkpdQvwHdk?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dqzj2U+im0Ns/gQkS3fPTuEfsYRPV6xvPzx2euJuzIXh9zXycqBPZuch75OtbOrzIUnTLrqNKk0TFVKAfSd41sj8vnpx296YEzeXnYmH8cBquNulY/gsdIKIRcKyOdgpm1pmzZ1xUScHjO/rld42V45owB73d65znVkRpQj9IKoRawl9E7WQ86/IeJwlYmbYKcuCY6WLpMIdUVWNvNIU8mxdfgPfSFIM3FVkCnQqtf1yLG3qlX4A90X3mtCYe8C3ehCjXIDUTqoiFAuZTs6SDC0vgaKpO0yORlwoHstEkJui8OZ/yNG85l8MrgiseuncfpygdYFoRP5m90dPUfdRejZXaNsEQyGaSccKWWvvI8r3lbKEvgzqCJe5KAokG9ej8pMsEQulv0d5vL9l5aSg7eGqwS/QwMRRfwEnIOqd3Ds=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2019 00:28:50.6827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9d5442-b4c8-4c3a-0825-08d692dc8ef7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5024
Subject: [meta-oe][PATCH] upm_git.bb: Add fix for installing the python files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2019 06:02:35 -0000
Content-Type: text/plain

Use SWIG_SUPPORT_FILES to find the list of python files generated by
CMake Swig module and install those files. This should be applicable to
cmake version 3.12 or higher

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 ...txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch | 38 ++++++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb            |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch b/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch
new file mode 100644
index 0000000..4b9a195
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch
@@ -0,0 +1,38 @@
+From 3707f467f9a26a7df3d41385023b43c3d08911d2 Mon Sep 17 00:00:00 2001
+From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+Date: Tue, 12 Feb 2019 17:46:52 -0800
+Subject: [PATCH][v3] CMakeLists.txt: Use SWIG_SUPPORT_FILES to find the list
+ of generated files for cmake version 3.12 or higher
+
+Use SWIG_SUPPORT_FILES to find the list of python files generated by
+CMake Swig module and install those files. This should be applicable to
+cmake version 3.12 or higher
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ src/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e19cda2..b565814 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -337,8 +337,14 @@ macro(_upm_swig_python)
+       OUTPUT_NAME _pyupm_${libname}
+       LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_PYTHON_BINARY_DIR})
+ 
++  if (CMAKE_VERSION VERSION_LESS "3.12")
++     set(support_files ${swig_extra_generated_files})
++  else()
++     get_property(support_files TARGET _${python_wrapper_name} PROPERTY SWIG_SUPPORT_FILES)
++  endif()
++
+   # Install .py's to python packages directory/upm
+-  install (FILES ${swig_extra_generated_files}
++  install (FILES ${support_files}
+       DESTINATION ${PYTHON_PACKAGES_PATH}/upm
+       COMPONENT ${CMAKE_PROJECT_NAME}-python${PYTHON_VERSION_MAJOR})
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index babe5f4..8854a33 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -13,6 +13,7 @@ PV = "1.6.0-git${SRCPV}"
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
            file://0001-Replace-strncpy-with-memcpy.patch \
            file://0001-include-sys-types.h-for-uint-definition.patch \
+           file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -20,7 +21,7 @@ S = "${WORKDIR}/git"
 # Depends on mraa which only supports x86 and ARM for now
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
-inherit distutils3-base cmake
+inherit distutils3-base cmake pkgconfig
 
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
-- 
2.7.4


