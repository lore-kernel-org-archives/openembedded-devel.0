Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web10.2883.1615859957017431919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=fHe9HPBL;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: devon.pringle@digi.com)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47]) by mx-outbound19-79.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 16 Mar 2021 01:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/FdruWzTTivobZv0j2a7OxkdCmi3gh7LAF27VMS6V8VInq9KTIyJp75WKLMmciPh+dlb5C3cP0P8RdAeosB0adBp67ew58rEFC0bp5IIAclEvviLWCZbEfoWajZTLHOCaD9OsO7U1mRKhNB+lAcMeRlZZlyPDwdHDWPretHKwYSAlQ4OyK+apeMUYHNMGXiohreszgxwZsqYMMxhybDWt2yJsXn3nCDsXIjceB85XPAFEjV3K80XAJ7Daj+gHD6Kcsp22oj8qu1aGZy+d604BB4kLqgGFG48QRdIyDnBZyZSOt69FTCmglPpPsXuUGd+yXKHmNDg316M/GZrBrkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihd3JsS9yk2QZ+kmpcNVlUdnqVLjM12HhG6lumXTHvI=;
 b=J9dJNe+IIQMhNOUS7PydYjyO+SLPn9U9TudpvPLxfaIrCUFH104nGJK8KOFj8JwWeD6siI7JeV9d+uVXWf31JLx/hFl71sUt8EuhFsqThAVg7qpZa2ez/07OpKG0ebv7ilJmNH1P5nBntyxKBs6IG/ZcL/f+1uanMhYjb24E9LF3dSNHoSIRq282NYtF8uh3Jzn5TR1M3PUG7wFVstYZCrzHhmJ7RX1lvkwyNteMoqJV1044ypIPGGk8JCAuH3cffWoobPNrWFTg/QOT+5nBVmVSJ02b0X0dNgH1Si+M/4tAT3Ja6KPHSJ5i4sM1T/GncuTv0QH0P5qHuaNRb74nIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihd3JsS9yk2QZ+kmpcNVlUdnqVLjM12HhG6lumXTHvI=;
 b=fHe9HPBLAiezbp7nRoBr9C4IyXD1f9Ow716+WcB98Tb88SsilUvHBuJHnvIRDI7/LUcHmaHoiU87SFhrdlkzkVSlj+6350D+aiQeWh6pGQ85scCzz0RqqTfTP/ZP++kkUw0vPQcZ/lmMKlkVAUcybY378quX3lUiWXNLZctHvEM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB2838.namprd10.prod.outlook.com (2603:10b6:a03:8f::16)
 by BYAPR10MB3525.namprd10.prod.outlook.com (2603:10b6:a03:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 01:59:09 +0000
Received: from BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809]) by BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 01:59:09 +0000
From: DPringle@digi.com
To: openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>
Subject: [meta-python][PATCH] python3-pastedeploy: Add recipe
Date: Tue, 16 Mar 2021 11:58:26 +1000
Message-Id: <20210316015826.1941336-1-DPringle@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0067.ausprd01.prod.outlook.com
 (2603:10c6:10:2::31) To BYAPR10MB2838.namprd10.prod.outlook.com
 (2603:10b6:a03:8f::16)
Return-Path: DPringle@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from devonp.devonp.bne.opengear.com (60.241.24.90) by SYBPR01CA0067.ausprd01.prod.outlook.com (2603:10c6:10:2::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 01:59:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b8e13c-6849-470c-7765-08d8e81f162f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB35251CF6092FAC2E1E0B9D86856B9@BYAPR10MB3525.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BJTGfEx17Bz47ZTAVC1tHZ23wVRgBxcbLkJLWf5aF4RZEJr6yv2kZms17pLMLjTQB1k5bRKBUd9fOP/oocoXSTeT8eXL7IDuUi6YCHFEavYZNUCbUySuc5kXKpAvFWNaNDlFap77+02yNI4Ug0Fw4QaKxVPFNeq2I7jK3iBv+DIirO3uq4T11TFmQfY3IM8xhvJBbV59/SwhWSgnutzAPZgrBCfL0L9AzXV/uw/kGF0XNlxMQnF1bE/PwOUjyPsSJPa4tsY0E0lgkJY2Er/EiiXBRcx6ky2+7UtlhzvP5rHIQI2wDTAEyPDLEC+ezKUAa5/24AKBysMTCPjL+KLWp6Qe3Ton1yMU5+3TTigTEFl3Ob5N02g0fKQG80hdEjycCdExIWIS2JEDCcfSFto8ozGwvRbaRGb63HydK1h4IBOCmOUQhZPVrquAveOQGJ83hFWEhVkVvlVtT5tf7owFkLQHK26NEP1OEON51rhcRRvfKNp+LzHDVhPuXHPlJmdS5TQhPEUMcoB3i6qM1wyxhtLr5ZNt6aBBlT/0pWHT5PykycjDzMESR2yqJeg/PcXcSlo23e8NYfnNGm2zMUnb1nbR00M+UPrHE+jp/rTpndE+MHnQU5DyW8VvgyyrEm4Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2838.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39850400004)(346002)(366004)(52116002)(6486002)(6666004)(5660300002)(8936002)(66946007)(36756003)(2906002)(2616005)(956004)(6512007)(316002)(1076003)(186003)(107886003)(6916009)(66476007)(66556008)(16526019)(83380400001)(4326008)(8676002)(6506007)(478600001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?oqqUT8A2X7gUA9yAmHS/ZM3jthJc/B6tfZ8lgmYKBm4DyN21Yz9LP/a6cnh0?=
 =?us-ascii?Q?wfvmp+pcmcJDDuRYttTedwHIUv9ebUnzYiI6BHFRHLFlH92URa/MOkH9fs+u?=
 =?us-ascii?Q?+ql6EZizpDOpcDbzKJJgCB+LC+/fQSvOUTW3Yca+/1jx8M4aZYGKRHJPZhI/?=
 =?us-ascii?Q?cM6pI9M5M5xNGSsYH3xlJX93vd4/XGKlzN2g91OWQBzsAZA8iY9+n7Ff4yxd?=
 =?us-ascii?Q?VzUW0KbT7oPXydw59xPMATcQcexFZSH3+P0WrfqBvXTH5I+EPSFZ9bk1LHox?=
 =?us-ascii?Q?KlGCahaY/UCHkFAIpVaoN5Q4Pm7C7pGApBsGb/qDxbQl0FmBUaGFSFm7Zg6W?=
 =?us-ascii?Q?S3Gj9QYACLeK/nlmfrXV00FJiifPaPwkMMcINXHJrW5R8rYDU9LtAdp+9M5J?=
 =?us-ascii?Q?RDtzEJaaDb/m1zPMxeF6TaSwhyJeSKeCOJLy14CZK0aA9s4fRSvez8QDb8Gz?=
 =?us-ascii?Q?5XEW4aHjyC+L3nv90WOKoUk34y/ME4YvehphUp5TqesRgGxjZndjzKLT4O3X?=
 =?us-ascii?Q?zQ9uHErOlwCCmIsvMl5WG0c8RF77XAUplIDt/BC9Vgj+gcCEruomYgN/fvlk?=
 =?us-ascii?Q?5oAzHTAk8U8bpdaT6c+H5VKEB2S1xgZBT0iNsZxFX5m7M6g4/a7OoYqJ4FiD?=
 =?us-ascii?Q?MqyvV4MhUN6cIMyRxjWmnk3llZgD1N1yzEiyGYQ9TAr0vfLxa1txmoPItqwm?=
 =?us-ascii?Q?nsYCTvmqRzHbd6T8u4OjS2OddKSdVUA1z1LfWzL7aZkojZSTpKS8zP91wFNw?=
 =?us-ascii?Q?P9A+2B/GTYestZ3QHcknbU3JOih6wHs5nnY18kL30Jxc9r90Vl3d/Bzqd3WY?=
 =?us-ascii?Q?63htMok8stl5wii/P/uhrU2wzWqDQc+UkSMztVYxPPDMZRJ3jx1+VyqRtH85?=
 =?us-ascii?Q?XceGADRd2ykYFy+pCUfy+3N6jdb7o/JcmEWdvff2mJJy+x8x0238OFrFMfnc?=
 =?us-ascii?Q?B9WMHcx+QWHcxZ0rwzYLh+adok1PPeZMmg4U/hdgh3VnsvhnWmhRgp+0bMPq?=
 =?us-ascii?Q?eWyEoBekgKnj9cK5K+1EKs9ti0IdFlhoKnnhimM29V+rtS5BFmF5Rby2JlDm?=
 =?us-ascii?Q?sIe+pu9Rt00sYAd59YSJTqnbhYbtoN8vYUXyYLCl2xqLzbDgx+RlsFJi3i4M?=
 =?us-ascii?Q?n0BzSb7vK9cecS3RRmUwVigTxinguzz5sSnQoadap1nRvO+964g4leHO0wx5?=
 =?us-ascii?Q?fCbw/wHZVBJIBFqNa6G9H1Y9k4abJ7Sx55DORN3E75iijhz2ECVv9DBgfuMf?=
 =?us-ascii?Q?9EB0qLxgvh8qH/pGZVue3J12YnV5dPWmel6sYkOyvKXL/qcEcPRtp3axhyZB?=
 =?us-ascii?Q?U2MT+86nLGjXU5rIeFrD55Tv?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b8e13c-6849-470c-7765-08d8e81f162f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2838.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 01:59:08.9133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jSa1P08qPMcUXg+Ju2MhMGp0AZjoptVRjy8sM+ia/b9OpqPaf2uWxZBz+RSwa4zAPV1D/F3WH9ZM0G+PMjROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3525
X-BESS-ID: 1615859951-104943-5626-101140-1
X-BESS-VER: 2019.1_20210312.2105
X-BESS-Apparent-Source-IP: 104.47.66.47
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230869 [from 
	cloudscan19-90.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Devon Pringle <devon.pringle@digi.com>

---
 .../python/python3-pastedeploy_2.0.1.bb       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
new file mode 100644
index 000000000..b7c8c61d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "https://pylonsproject.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
+
+inherit pypi
+PYPI_PACKAGE = "PasteDeploy"
+SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
+SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
+SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
+
+S = "${WORKDIR}/PasteDeploy-${PV}"
+
+inherit setuptools3
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "paste docs"
+PACKAGECONFIG[paste] = ",,,python3-paste"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
+
+DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
+RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+
+# PyPI tarball is missing license.txt
+# We will need to keep retrieving this from the online repository until version 2.1.0
+SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
\ No newline at end of file
-- 
2.25.1

