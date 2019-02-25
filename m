Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 74388 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 13:32:37 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
	by mail.openembedded.org (Postfix) with ESMTP id E31FD6C1CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=io7EkLSwmOnhT1c5TomNCgCigz2MrLVFiY0gxSHmIps=;
	b=Bt4+CB6QA3AF3xZwA7J1fgG3fT+3Zzo3UYaUTt8p5R4WhS/TDx8RAlOLy25AdtRlwDaTtZlmn7l81O0fxHSQTRWqz8wLHp/fW1Tgj9f6G7WLOVz6CuN0yynnVWBaO9KaWRoa4U8If/r/2cDDleD89Jn+cJq4ho1vC2oEreE8Zek=
Received: from BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32)
	by DM6PR02MB4524.namprd02.prod.outlook.com (2603:10b6:5:20::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.14;
	Mon, 25 Feb 2019 21:55:44 +0000
Received: from SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BYAPR02CA0055.outlook.office365.com
	(2603:10b6:a03:54::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.20 via
	Frontend Transport; Mon, 25 Feb 2019 21:55:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT044.mail.protection.outlook.com (10.152.72.173) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Mon, 25 Feb 2019 21:55:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODv-00080v-2c
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:43 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODp-0003Lh-KB
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:37 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1PLta5C022776; Mon, 25 Feb 2019 13:55:36 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gyODn-0003LN-M1; Mon, 25 Feb 2019 13:55:35 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 13:55:33 -0800
Message-ID: <1551131734-13486-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(189003)(199004)(106466001)(6916009)(9786002)(16586007)(51416003)(76176011)(47776003)(36386004)(7696005)(26005)(316002)(186003)(356004)(336012)(77096007)(63266004)(426003)(107886003)(4326008)(446003)(36756003)(106002)(81166006)(81156014)(11346002)(126002)(2351001)(2906002)(305945005)(486006)(8936002)(48376002)(478600001)(50466002)(5660300002)(2616005)(476003)(50226002)(8676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4524; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab38395-75e5-472b-78f8-08d69b6bfd85
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:DM6PR02MB4524; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB4524:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4524;
	20:99uQ0NXX7rAnTW90FzT5Bl90fU/WGsLAliOVmgFFl/R1D2FLbpFw3rbXUuVLvKLhIi1Uujgy+TTRnVOAdKmiK7ecdvCgtMFN3xlNf8V6wncbhwNZakzzogD5JRhOaKaAqjYhv+rM7ejqbWfTJpZ4uAH5Eek6TMoH8qndFx/unc65nhzWaMEiJdfNwKNB4yJj0URaVqBdCgZk20k/tFG2ox5L+FarO7WVXMEcOe5M0COFfimme1w25rJ+1Pum6Kxb+O52HTYYC/gQizOb7upbwYo3uTGZc13qiC/UWZ42NcZe7prjdkvnoERU6h1WHHhRk+oQuoFgncbt+/1yfsKv18W7YpGZnmyxF/i5EYd7OoUk8f0FnSTdhh3JE7tlCt/stEhAM1xgVX/0F64rjj4chNqSVBXyY8Z6ltTPISqkVXwoYzupLt6Xbx18fToaBsOEf+lP0w7zuL1rXdDxqNOdQ3hkS5Lt8KkIw3IDipJARXiWn+2GW0X6cOUJHPxmS3ch
X-Microsoft-Antispam-PRVS: <DM6PR02MB452454EA082F585CAB2D317DB07A0@DM6PR02MB4524.namprd02.prod.outlook.com>
X-Forefront-PRVS: 095972DF2F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4524;
	23:3vBIwAkGe505nuTwRSGtAAKKHSxUXtbTH5u9JrvJM?=
	=?us-ascii?Q?Yf9bMGCuunspraw/XSE6pazyxqHKW9sfYZM1kRCI3Ls9z+e2Vnp0CmC4N0l1?=
	=?us-ascii?Q?gTnKwr0RR87nU3lPSwk+vDWeAlsZ22qVo5dhhUXDtN7FEmuMFzzWZG+HXPgU?=
	=?us-ascii?Q?+D7JchOlkpcsIn0i6cZEjlcLaekGpJoF/dftF7GtC5dG1kLWSXyNK3U32Wqi?=
	=?us-ascii?Q?IUq6GNln/YZ+vpNm+nl5dxdmWHazecNAF8gX9BozSD5CkaaOuSQ+cnDQCegp?=
	=?us-ascii?Q?fwl68QW1g2P4pUYISuQejQGbwJF00Tb/cazgZ9yqzckKnq2JLRuO1OI+G2O8?=
	=?us-ascii?Q?s/n8oIWfSgGa7gPgtQ2PEECnRPiQRjraVswEVfFPcHIZ+Zdva3P5kcR45u9L?=
	=?us-ascii?Q?qkP5DSd1hu6524CPc2G4lIKSFI5KvaZ6mAwud04TOVKfkS9hwggcUJ6Pfgvb?=
	=?us-ascii?Q?2mAo/MvB1XovIA1elUv7/2/njdRL4n6r5TXnFt1ZWUJwr+yx4XTa9SLA7C+t?=
	=?us-ascii?Q?vSDFSLZ9WAJ6wKr11I0u61zCb2G45fWZXk5I+TVpbvr/a/Cl24PYnmdGlAOb?=
	=?us-ascii?Q?1aO+fQ1eTMy5SwCflIuQ4D1mf8gR42KIi+D1Wj9Y1R5J9f9tUjLyzSh6mGuR?=
	=?us-ascii?Q?SrzeW2sptOnMLqs6+JYASOk92hM+B+5cES7P0DcdDvZTMsRM9oEs9fu0cjqW?=
	=?us-ascii?Q?7KeDtyj99IZFtmLYCHHMjx4TMsNlMOlJPONrMr5tg3pLysIxQ+KEq7yvVWgC?=
	=?us-ascii?Q?IjDpUirbohueM1aldEzph8e4HunXOPUlWfyOUjHlS1l3eazHNT6W0Q7YK4cW?=
	=?us-ascii?Q?kCYi2/kt0OtL/ymdfg/S+IvdCFiXRfDFEnu47ebeWkRi85ERNGKSe0poTKVg?=
	=?us-ascii?Q?WFY99YLC8WNTjH3f6GTIEf8jJ7+LawTlYEH70FK8isiZZ1K4eadYw8YxuLQ3?=
	=?us-ascii?Q?ZN0m379NXWYhuSugw/gHuxvNrdEvfMKqBLfLYq5PEmR5xlXNOEEY2e3gbN4h?=
	=?us-ascii?Q?k3Quku4wDXaP1ETaNdypYGVODq82VrUgUNQqB19hVwd24jfoeHQqoL04wT6i?=
	=?us-ascii?Q?V87JvI=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: z+NbqEJk+qzhYDSELoEeJ78hNI7HMSWV13pe0PtUGl4r2rVqpWQ7Z/xiMr0HgGPFJjIPeewUnSm3tVpiPjSjpRYR4mcTDROmsvXjuhkJIm8zV8ICUtVY1wU329Qk0Fl+WPDNxnpHz5A0oz5sQMdmeDzqzcH16VUYju/H123Gg4S1wIj5dEIKH3QWY2UZEnKqpZoVjpKSmk18bc7vD51MTWIwdmMj5r3QJpLuCUsDwRamjUNExEQEe3+/DNenp4wmsRmp7gCAv6r7yfvDRxnq3RkXvIyrOXe44l9IzdqSvtkXtbs9IjMt/qlqr4CzetnYSaVBts4h8PHdk2wu8Q2hIgWCwv1OurzBPtK7gDgNW1YiHudkYFEHDk3ontAZvW6DcmiZwttbWudyui+neDzhYyYTGF9KUf/2SARzv07RLfA=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2019 21:55:43.5471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab38395-75e5-472b-78f8-08d69b6bfd85
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4524
Subject: [meta-python][thud 2/3] python-requests-oauthlib: Recipes to
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
X-List-Received-Date: Tue, 26 Feb 2019 13:32:38 -0000
Content-Type: text/plain

Yocto recipes for Python Requests and Oauthlib libraries to provide easy-to-use
Python 2 and Python 3 interfaces for building OAuth1 and OAuth2 clients.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python-requests-oauthlib.inc   | 7 +++++++
 .../recipes-devtools/python/python-requests-oauthlib_0.8.0.bb      | 3 +++
 .../recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb     | 3 +++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
new file mode 100644
index 0000000..4bc6a36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
@@ -0,0 +1,7 @@
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
+
+SRC_URI[md5sum] = "4358a879a4377393bcfd37d0f9ae6d4d"
+SRC_URI[sha256sum] = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..4318915
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..1294661
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools3
+
-- 
2.7.4


