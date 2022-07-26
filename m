Return-Path: <brenda.streiff@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69506C00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 16:10:54 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.8587.1658851851495107188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 09:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=4NzQhO+Z;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=420681fa7e=brenda.streiff@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26QEmL2i023762
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=dcLjXng2KxiRm6oqAyhPkxa5G+Qo6GOty2LfTd5mbmA=;
 b=4NzQhO+Z41nGvrqmwm2zixC+x7sPlbjqo8eAFT/hSNuajSyxC1xLXJuCg6haly3/JzJQ
 +DLe04vG5/NtzUJfogT0KgXGmg6a4D+bc2cRBCaMVwEez4ULgfwq1ZDlEeSsymQI/bNP
 tj2fvbFaXzlHsRB0kWZtjvMfcGIkrLgQMgpjkhvUqyYe6rd0MU0yvcHCeQUaEdgd4V+L
 RsBUr240bvHFFoajiipUSc6YrSmBIJcrVDhlBVZPT9+gdN3Aq7stlKVbBylEE7HGW2cN
 veC+2HE7B/twxZvi99kGYpfw3h8uB5gdwYcF5HUxJc4t/rdqeJuA7PzEfE/9SV79QtyE oA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3hgd105gnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:10:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdr3v4Zqn4mga9/aButiQdJXpDpfy1lmnp65zQCPaSaQsNvtjqErnRuWgOsKYssLIOsxdKSAXOzUhy95dW9GFXOFIJvt042m1/KK5I126VPelUzPi6HCnhnwuUlyA+Ni83zyqHC5dsbTjatekyGbqQhCGx1bmyUFTx3BnTS9JuVs6X6dmzuG1YtvnP6cicfxfbtpDKfJXwPJLBM9nFDbRcPtxQxd5P92vtkRLOv7+KEyZ1VC5usLDK13ptjp+t0C/KZZoIhHj6EI8/SbYeLLTM1o95gs8n/DKzkqFLnDUSr90noZItEsKyKNL976vjc2UTFhLJh8DghF34f2EfI3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcLjXng2KxiRm6oqAyhPkxa5G+Qo6GOty2LfTd5mbmA=;
 b=SBYXjywO7gXDvmBSl8K+Rq+J6IAfx24LTRuBJZJ9l8z8ZqciXiYbozz6jElIBXCfx4q2Vo8GKMoBWVaDHg+FSjGkSZ2aM9LEJDSHkxBC2LjXqJh8+7NW0KGLVDYLuepZ0kG6ItH9mwvKVG+0Mcs3bHI6DR3zZVnvtbxwpEaXmkASaIrHzAA2uOLeBS+lkMDcxua0dY75Ty89B2Wk4SJqGw+GYDJgQKRsXO9Onatf60d/ZDlZvEbiLgP1lfBwmATBF3mP5N4RWFnIEa5XxoYd0xOB23Gd5xJ7Q6qanDMnSsV37H99OgLS27m24f3x2sGw04MIpCMmxaFR71MGazfw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcLjXng2KxiRm6oqAyhPkxa5G+Qo6GOty2LfTd5mbmA=;
 b=Sv2jd1vukOdmXhWdq1no+EjCziHBxpmCJKFEURH20Ov61xtdgPk597a6iFCMWOcOSzL6VXJh4qVbq1WJ9jIW+sWc/IkPhBpl/bxB52ZOEoNeZS655RsMdY29+oLNmu+EqXae3Iwc2mhwI+2XkigQY+Q1OGdOMUQa8JbXIbl56A8=
Received: from SA0PR04MB7386.namprd04.prod.outlook.com (2603:10b6:806:e4::13)
 by SN6PR04MB4798.namprd04.prod.outlook.com (2603:10b6:805:b2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 16:10:48 +0000
Received: from SA0PR04MB7386.namprd04.prod.outlook.com
 ([fe80::b1f0:fc1f:d740:3993]) by SA0PR04MB7386.namprd04.prod.outlook.com
 ([fe80::b1f0:fc1f:d740:3993%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 16:10:48 +0000
From: Brenda Streiff <brenda.streiff@ni.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] Add python3-pycares 4.2.1
Date: Tue, 26 Jul 2022 11:10:31 -0500
Message-Id: <20220726161032.1630170-1-brenda.streiff@ni.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::19) To SA0PR04MB7386.namprd04.prod.outlook.com
 (2603:10b6:806:e4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb2e3c3e-197f-45ce-6937-08da6f216779
X-MS-TrafficTypeDiagnostic: SN6PR04MB4798:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	umPOJ8IOlkSGPLSJEO9c9uZwArtrou2vlpMLFTkQxKRqdemWiV8tct8ULeb368FBNbMyh6+TqCZBEs7uN9k8PIP+wJ/921nHbnu1J7vmIU/v2U3VNBKXXkzA6J56Ze1CNdits0LHmaq1RmUVRFbliR/quoFvTULr48nHCYPY27c4nONAkee4BaA94ixPtel7Of4YxGWNg3GJve+TRCIPfKUolWNQpFFeAJINBhb3zq88TaiDMg82mpq6wiWiuHr4t2Qu7hO08bu8L2t2Pn4g1G51Wp5GWgef47VhuIr1qe2MdvltwbcKHFRqE4XXG+CRnr6uLWb02zpYd3s5wllsbLH8cnGezajraBLF7GuL8YJ6ccvrgJWS1/loD3k9rVAZsmefdXq3ECtNtN7c3z5UrDiyZCb2w8qm38ZrFQB1+fRFYYzbHKnwo3dFYoXGCCwDXw2Chu0Kr+5aVf2iR+CrEtnn2Ga7ink9boOzZst8WvZk1qKVLy8SR19M3IHeAk4NbnWHghobTCz6K6YD6rBq1Wnnun3QvqfZ7wc1tDk+kzx0/z92tcGzjnXKFajI/rKeBn4l2ho9cgeap1LoVtSzTmDJlyDxHaorerM8eYc/QffPULDlTdMq16rCym52iNxd9d1WhbWIIbVdJPXLWdFGv6belSc7EzdCYV/m+t1SV8ljjxALjrJH41Ebn7ZDGBWbydRNFtTSkTua5noh2x5X0Ker/yAsi+4ynItgRJZ8H/z5tQh1y0Rl9vBpSXenxJN3gZd1Lq2iNQfYpeXwnTwPow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR04MB7386.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(396003)(376002)(36756003)(66556008)(66946007)(66476007)(8936002)(8676002)(5660300002)(44832011)(6486002)(478600001)(316002)(6916009)(6506007)(41300700001)(86362001)(6666004)(2616005)(1076003)(186003)(2906002)(38100700002)(83380400001)(6512007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PBbDPcbFzzWUFxjxQKxjJ/nDgPD8wh/1euZB3DvPhMywM1jjUhERPVt3efWZ?=
 =?us-ascii?Q?kojD8ZNayXUpUWptS5U3xipYZ9+wySXJbVAl1vznVgQ2gTyDx5eVUKlaV9oI?=
 =?us-ascii?Q?GDcFGdQ8VacT/kUM3TE0CRV0z5wOurfQDnkBoHTbNjB3xKsZ9Bhcl3i/XN1x?=
 =?us-ascii?Q?Ri8RGKXj9nrRGUroYwgkguNKuwsNqIHCsIWi7xA01Z5LmWtu28Qw7L980uhp?=
 =?us-ascii?Q?zZLcO7uK8zuxtJmWNsLo/GX7fguZDoUSAADqDTo4//M1ngugL71iJMQHwjx7?=
 =?us-ascii?Q?YfQzx2CsJTxT/9G7r67+1qmUm8ixIVKhhBetJEFqFlGtIRUEbpfKjyhrvadI?=
 =?us-ascii?Q?LuDm1mehSR0j9Ogrp2Y1WYXEzoeXH5pFlwr6UbS0Do3zu5cYM4g8DEocftBm?=
 =?us-ascii?Q?AGdawW9tutonsO+lETGYWazB8aUuOOdZnFg7k/xaMiura1N3Xqo1EKPfwDe5?=
 =?us-ascii?Q?Z4s6eS1wzD63VzSL+jBwMhKKw1KuTz2rQgI+Dint3AdnypxXW/afho2V8rI8?=
 =?us-ascii?Q?bqb09axhFcd3s13AcoiF4cFjv+A296VVfiFrCzy5Jgk45wDSTvFS78DicyDm?=
 =?us-ascii?Q?NJAt7JQsMa7W6tAQ8qMwljsIcLhMhxx6E1bpSFAyXlM3lCBz5GKhNJrZsCjG?=
 =?us-ascii?Q?JFQKM2OcsH6bx3+KECkCeKbTTxp2ICrEVlMpFxKv4jYJcQR8l1vw6rT5EYRA?=
 =?us-ascii?Q?hifr5dDfuVTYqx+tEMNf1FI7tKxRMmWRfXx+qavUDIk+mivpCbj1Wc6+T3g2?=
 =?us-ascii?Q?pLxl87wmEzOCxjPDSj2rhBEOtNIUhRNgMNVuDENuyiZ/RFESS41KAe0x7LUJ?=
 =?us-ascii?Q?BXLVkMbdNh3EgnKl0bl8m1m5MrY9j6OBddI9+DadKY0qE4u4nzqjDMiaOCXe?=
 =?us-ascii?Q?rGUB9L4wSVKXVYjsE+V3t2PJPAL2BOL1wtR/sveaGPFIyn4GtfzxKVWYYVWh?=
 =?us-ascii?Q?Bl4huccO2Wu8bCTT+CjxHVE1zjzjldXcy4qNv7BpjsMS96tfxBfHs8LIus8J?=
 =?us-ascii?Q?+/sa7eVxSJqPqAArRLzxwIdA4ODEo3siuA0TX8Sj3SkNDkyCHqZ7HxIyNCkk?=
 =?us-ascii?Q?beMCHYRLwLkD+IqgV8SymQqbdnEeVdDaDBfTiyvu4rGIpta5CCATjN0O3yG/?=
 =?us-ascii?Q?S7Fo+yS6RGUt0wb2ZDtTeOIBUhdio++36Xxok8mEdGOMqCO3peVGPWizioU4?=
 =?us-ascii?Q?Yf6qxkfz+6t4LjLj3tN5P9SQWzPPWvCEdyopDyW8rnrV0PX7yOxCDePpSI8r?=
 =?us-ascii?Q?uF6gnphqX4b2/07lSGX3SW84kW0VSIIyfdkIBUYoApRIRE9594gjerPy9y2g?=
 =?us-ascii?Q?TxHQ+wUTXCPawtT+75bZIZxvDhj41XG+UUuoBOJxU/kiY76OcOmjcExhz1s4?=
 =?us-ascii?Q?bbDoHc8tUTaQ9l8JbcwmYv7tjK+OTDYigul8hF86xqG79RPh9cER6jjUhace?=
 =?us-ascii?Q?dTqkpI95bnngmVGWsvNDll1mUYP6tWbZfEOtX7P5JHek5+318awF/phFVhje?=
 =?us-ascii?Q?BnNDrx9ngI83V159ATCyt74AFiKnK90iOosDPq55JkY2/PMZcs6XqkwAdOAc?=
 =?us-ascii?Q?ufxWG+8gBkWfkwuPz5JyjoUy2p2v6F8Q8qB7Dyo4?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb2e3c3e-197f-45ce-6937-08da6f216779
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7386.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:10:48.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DFqhPvrZmmZuvKfc8Vff1oIlUnU3N8BMcNTCTfcuPD7+RKH3b8jQZQtrPa0KhWa80nlpRadVi/fhmIpr0x6+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4798
X-Proofpoint-GUID: 3DO-fotT7vX1DADHQAS_sbO2iqLrDP_-
X-Proofpoint-ORIG-GUID: 3DO-fotT7vX1DADHQAS_sbO2iqLrDP_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=895 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 16:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97993

From: Sergey Kizunov <sergey.kizunov@ni.com>

pycares is an interface to the c-ares asynchronous DNS library.

Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>

Updated and converted to new recipe syntax.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
---
 .../python/python3-pycares_4.2.1.bb           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb b/meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb
new file mode 100644
index 000000000..dacaaa787
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.2.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Python interface for c-ares"
+DESCRIPTION = "\
+pycares is a Python module which provides an interface to c-ares. c-ares is \
+a C library that performs DNS requests and name resolutions asynchronously."
+HOMEPAGE = "https://github.com/saghul/pycares"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
+
+SRC_URI[md5sum] = "92fa9622ba42cb895d598910722e80b5"
+SRC_URI[sha256sum] = "735b4f75fd0f595c4e9184da18cd87737f46bc81a64ea41f4edce2b6b68d46d2"
+
+PYPI_PACKAGE = "pycares"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-cffi-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+"
-- 
2.30.2


