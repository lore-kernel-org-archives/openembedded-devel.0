Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 109980 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 08:27:22 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
	by mail.openembedded.org (Postfix) with ESMTP id 042CC7C8C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6Ug6WxHfxLbEmssMmhKQJhNmCerCIdkaIdge805e2BI=;
	b=lh6FOX1ToIkdNmI5Lkxhs6Db5yK+LWMazqTBishDh+L4wHMlkJLXXFyeA+wCsxWTumzu+DInV+JWtfNN9XVLqQWu6F1y+RHLut9QYw92jt6EoXtDIMDUNc4A4W7FvKTP0TEZnElOGv+yln0ty+/GeYiAlKgbGUX8L5zEVJIFEgQ=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
	(2603:10b6:803:20::33) by DM6PR02MB4521.namprd02.prod.outlook.com
	(2603:10b6:5:20::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.14;
	Mon, 25 Feb 2019 21:55:49 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by SN4PR0201CA0071.outlook.office365.com
	(2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via
	Frontend Transport; Mon, 25 Feb 2019 21:55:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Mon, 25 Feb 2019 21:55:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40727
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODv-0000Ni-07
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:43 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODp-0003Lh-HG
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:37 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1PLtabo013956; Mon, 25 Feb 2019 13:55:36 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gyODn-0003LN-KM; Mon, 25 Feb 2019 13:55:35 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 13:55:32 -0800
Message-ID: <1551131734-13486-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(199004)(189003)(107886003)(6916009)(336012)(426003)(11346002)(446003)(126002)(476003)(2616005)(2906002)(486006)(478600001)(4326008)(48376002)(50466002)(76176011)(7696005)(26005)(316002)(51416003)(16586007)(63266004)(186003)(77096007)(47776003)(106002)(81156014)(2351001)(36386004)(106466001)(305945005)(6666004)(356004)(5660300002)(9786002)(8936002)(50226002)(81166006)(36756003)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4521; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5149e7d-3a7e-497e-cc55-08d69b6bfdb6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:DM6PR02MB4521; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB4521:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4521;
	20:Y9PoSq5pw2J24Vjeg1OQwCMN1FR3noF0AVOIBfYkASF9wAOC6sqB8KXI7EmGh16Buz2skBQtxDNEU2mL0HtOkwBKFVQdpjDr5adUAuFG8S18fIvRNJwkGXCF/CDB82ZzzL6VhkyfC71LJK8zmejn2Xexx0Zlka26+BYarxOQ6YACmDqTOD9unNvLggJskJUwNWlqhxwywOEY7r8tdrpa/16LIQzvoHKrfg1uBU7anrm1MW/1yUik25D6is0iOqJNW6CzLFd10Vu71/eLwYGpCeSuNYsYWeFRQzk9oZftpgP2ZT2RG6laYZ4V4/js+yHnVwn6/hOlEceuJjJ9ao2UQowrrok5SNDT7SM6hb6YI0Uwp3K3f6JYX76+fDf8ENNAFRG9xC02ChlRcHDxeoZAR6NYXaqMbHyRCt8XeFGw0F/bgxxwY87pqAIF3RZM08ZzVeZfAr1yi+CHYFQ2ZL5xalCMSWB8bv9T+5adZvQyHePNz6aA51gQxHYEINNREqAD
X-Microsoft-Antispam-PRVS: <DM6PR02MB45213E5A3A689704E20845AEB07A0@DM6PR02MB4521.namprd02.prod.outlook.com>
X-Forefront-PRVS: 095972DF2F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4521;
	23:qoMSdHL0ueaDppSub28rChnYzAkpf3cRSCuvE0CkM?=
	=?us-ascii?Q?XWLl6WY+Lt7pasI6t5cA0MyzA87I8TUbBTv0bHS1LNc0hicIZvv6E+2SxeQu?=
	=?us-ascii?Q?LCmixSKhFxc92mm1HfTL0Y3vW47ud9j7B7QAc0B+hJGCKOr7r3Se9ZdE/90x?=
	=?us-ascii?Q?8/xrmL5s4/B8ks3H66xyOIVDT5PjDdVCfrk1VqAT5wl9PwknApPuQTsp1gUp?=
	=?us-ascii?Q?FrInY3du2i8sKJR67Rhvxe/qLbqx/+VYLQQMpWdQNOisArlGl3yOrqLKsOuL?=
	=?us-ascii?Q?YoIiw4aehajdULMyoi5i6kg6vcdlLmXgfpTm1hnL4MHLCU8aLUIPLx5b5wTe?=
	=?us-ascii?Q?FMlEoY+MSyQ5N3vXDiBpWDzdBK/Mwasyyl+QiE8XHpSY4xgNpe70qJ33GMgC?=
	=?us-ascii?Q?PLOshqFix5YqcucB64Bw4MYO2Cm3gDGR12dAC69DgowzqW+1nYu9mtszXl01?=
	=?us-ascii?Q?1M/n5MRYFJ5JQdc6FJQricGzQa4U+X1KdLicVbiYCLfZ/4d7Elhp0RZuesel?=
	=?us-ascii?Q?ogwCmWvsWpoRml82oJttat+ZLUivUL6XNU6M7nDHWFZn9Hg/3SdBI3xjeWQ/?=
	=?us-ascii?Q?JqhCQ8+NmeYUoS1YV5RUevZKq1dIf7G2i4HMlEzVnRgYuxBFUdEunBq2lk+2?=
	=?us-ascii?Q?nO5fWvDQkbF4+gpkxKW53oZ/9Tsc+H0NRiLSzsw4EZAKUg5vdVeuRQTGTT9q?=
	=?us-ascii?Q?cfm0Xm0rcXkh4llVgDBEAvxfE7NouY6zY4MAVo/rfKPx/+Zq3XMG48w75ZtA?=
	=?us-ascii?Q?pprt41oncTzt1/mVi8giCsS6vFLqbUKJwuoXCGAeM8RdAngG6O9Ctfyeyd6w?=
	=?us-ascii?Q?4ESEyj7jQ//YdloGfiNb5P20UXl+SY+YyjElPtNIrJ/PJkylxp1NuDIweEUi?=
	=?us-ascii?Q?7+ZO+kqXII0W28Gks5Lg0CRYcmgRQaDjpRM0wYDoMw+ep410EUycPsGxlNUW?=
	=?us-ascii?Q?sXTCKPb14LUjlW3bwlaQwqIWogwgsBH+BTpJ9athG/QL3vV4DNPL+K3LlAW2?=
	=?us-ascii?Q?wa8Eu3jdQOV7m1feQ8CucTYq1el4p363hH+6OrdAli4rpMuK+v5g9YSJNXEU?=
	=?us-ascii?Q?iCaGsvfH7+MD06tOsuG4U63S4XL02bvIlGVSEbYFHUNxEjvb8+mxG88iUoff?=
	=?us-ascii?Q?D8zzEua5zA=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eP0fBp23s6ZhOeAoLOXRYvz0l2KvmUksqtWzv/Of2rZT+v7qNmk7IFZ/jwVmzJ8pHTkuheir23W4cSxShkMuFI51kJWAAhrUBUyPHmxYe6QfeBFQ96uqpA+5cs2LyI9+4yoIxSvHFjAqFmQDmTXFkQlfzQOF/Tc5OS2G2NAXCnZ78LoAjx0+GMDc1DVmpPTwh48JKnF6ubPQKK3ujlIcqQRX/SkLhDEi6eZnkszbTl0WKwMiF0a1JMntNEbrZED8dIz59tQR9yzRR9rZ60MbLuQS5hGl+w78PDuqjjE+ia93S4phptioyZGs1m4RtVQqJXhN4UFPg6SJ4XVO2LE1iz2je8XI/jMAXHgzgMW/+ALaLIZ5DzpvFgGxlKildZFfW14pOu496MllKHnb0ypzY4jCBch21la0K9YfckL9aT8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2019 21:55:43.8634 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5149e7d-3a7e-497e-cc55-08d69b6bfdb6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4521
Subject: [meta-python][thud 1/3] Yocto recipes for tweepy packages
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
X-List-Received-Date: Tue, 26 Feb 2019 08:27:23 -0000
Content-Type: text/plain

Yocto recipes for easy to use python2 and python3 libraries for accessing
twitter APIs

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python-twitter.inc  | 17 +++++++++++++++++
 .../recipes-devtools/python/python-twitter_3.7.0.bb     |  3 +++
 .../recipes-devtools/python/python3-twitter_3.7.0.bb    |  3 +++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-twitter.inc
 create mode 100644 meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-twitter.inc b/meta-python/recipes-devtools/python/python-twitter.inc
new file mode 100644
index 0000000..f5657ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twitter.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Twitter for Python"
+DESCRIPTION = "Python module to support twitter API"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0307fffd8c4d9946c029daa1426d26e7"
+
+SRC_URI[md5sum] = "c6dc2f315ded761aafc96bea3351c7f6"
+SRC_URI[sha256sum] = "fe85a79f58a01dd335968523b91c5fce760e7fe78bf25a6e71c72204fe499d0b"
+
+PYPI_PACKAGE = "tweepy"
+
+RDEPENDS_${PN} += "\
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pysocks \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-six \
+        "
diff --git a/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
new file mode 100644
index 0000000..6a28b08
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
@@ -0,0 +1,3 @@
+require python-twitter.inc
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb
new file mode 100644
index 0000000..c2e4d2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb
@@ -0,0 +1,3 @@
+require python-twitter.inc
+inherit pypi setuptools3
+
-- 
2.7.4


