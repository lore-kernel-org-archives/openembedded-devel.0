Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21485C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 14:22:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7192.1648563723423664602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 07:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ATYyPDvH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=108711bdc2=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22TCo2kr020772
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 07:22:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=8XRZljVtz8H5ogdbPjKdM8bsW0eRbjwVz/dN6V0GfS8=;
 b=ATYyPDvH1bGOYYvRogeLvIXsR0rBePzrRQwTCpidrOrhseVHr7Uqzo127/qf4dRgIwc9
 xs7pjJhILvEA4x4+/vSXbHwLkn3nGOLHJ5dZw5qcO2jN28WNjj0h85nQPky57zJyL77n
 GK15cZ6F3RH5AvWdbYYBgXCsXmmcVKX64GSfOz/yrEkuG+8XrJQnVmnnJHlHvQ0iQMFy
 zLvS8hb6R5BeD8MsH1WKospW4wNGlgADChj7c/vVpsbhVcdFriRbeVUv2gQpPyEt9sGE
 THIgRayKlyf5NB6i16XBROhdRFplGkLe5V1bmZIJpfCKD7Sqzu2R51xOO/slRY/gLExz Ag==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1x42jec2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 07:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XECn8AIfeYQtDtz/CQpAZl6O1ffJHVfc7YxgReeAWAk+fyuhoYi7ENf1yU3+Al+ihbIBf41OFv++pYbI1N3+owt7ZWtJbLXFVB9sJL4CWxqbAe/0CFnht4XopuNAxdpKxKPHHz/B1m70knpRQ6v1w7SztPde3bphDSv6ylxBb4KcgX/N72KsJ1XLif5oFnYNloFKneYH/e8d60ngPl2/0lUprFeLU40/X12bSJ4BTyknaYLMRanxTwsnP5i1Ezw64aJaQxGj9Djtr0F3dslyivaKZpTVISPvGzUT8BvLG3yNd3wD70qbBLB250wbKMwSMySR5Jz3UBNbyynWyhrWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XRZljVtz8H5ogdbPjKdM8bsW0eRbjwVz/dN6V0GfS8=;
 b=dAeGCP4o10DihGpVNSTIfoYjG0UqvX3R8ObbwcHHR2NrydjDf/FMFJVDFCbdsR0pQynPjYGw+ZVr7yY2nB8P8NkFux7Z8XcpbTUUn/JskwY5AnP7XIjwfcHZQrRzok5v4wveVrbxFwmVnoH1S6Wo1lm/lynXG9ZQvZ0EzLoWz9ajbpmuenp4YS6zv+rv8w9YhAX3LKvXTVoGnDI7l51quH8PGKCcfrFSm2/qlp1gOSPkciQYGTYqmv2bz/FC6xjWH1mpCHdPOgNNtkKMVw6+6zc0P1dZ25SEdTbeg0Gtbuc198lfOXYabpI95HOOBXkDBtOJnIppg7HHXzGXdyICIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SN6PR11MB3424.namprd11.prod.outlook.com (2603:10b6:805:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.17; Tue, 29 Mar
 2022 14:21:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 14:21:58 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott]PATCH] python3-lxml: upgrade 4.6.3 -> 4.6.5
Date: Tue, 29 Mar 2022 10:21:45 -0400
Message-Id: <20220329142145.3702-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0197.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef547171-3cc6-4bb8-a5a4-08da118f7c1f
X-MS-TrafficTypeDiagnostic: SN6PR11MB3424:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3424A776CAB7664FF83CA79D9F1E9@SN6PR11MB3424.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+CJKylvBtkksVIBuxXfii5OSzkIiUpcdSsoe+nk2T6WKCtH13febdHyYsb0YhQIgLNSSkIIQjv9KZIPW5uTVau80OToKk4SYyK+tF6ikVTnC8GsygA8zXpwfjX3Alwkd4nYiqYANNvchPbZWpxYIvasIzA90yJlgjrcqOxgBq/YMugaD0A+5qTniyWbwLxKj8s5JDQf7kb2qEohe1ILHqndptaVGftKP7nGeCCvAFhm9MTLBWbLKn0I4ve3oIjVAq7qsU5rBq2wuo9OzOR4vidUDJl7KvKhz7L2Ft9YB1CXKK5Rc2MD4K5jqYNbsduaiwRaq0XLzdzUZNn+S2LS+fA0jbY3yf/X/RywRTgOZx0BH+EVCjrod2/W7Blov9zxC+ixe99YYIzhZeKjdVLfW+wHDwuru4t0rNgZVzGv3LPl1SPI6256ar5ilQyGHTe6ml0g2MVVWmVJba1rphBZWNz0d2x9VGMFciGtTQKM3DJaaZ0S7X+HvaLMkKH5gbE3/t7FdwcwrooRmvSu20LDfOrFUZJmNYZTz9fUuUdZn1uEVJ1Anq3PjfKoAPRhkUVB7vYVh/qLvvVMbZ0E3dmon8qAZHr7IjhoJPU/byYcDqbgWoZHpv3Fyi9R8gW2UfFhMJGkbdHgyOre8Xsf9A9ai50kEc9sCw3PL67fYrXxaktXks31IcYW8jQzslMtfyIBCE+VNiMFzn5MBGtcLQqZ2/GXWGVhu1nmO6+bnaUq14HstapkYTBEBVT8Q/IAb/PugxUvtmIVcd7GbrVieEcE2og==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(508600001)(1076003)(6666004)(6512007)(36756003)(6486002)(26005)(186003)(83380400001)(316002)(38100700002)(38350700002)(8676002)(66946007)(66556008)(66476007)(6916009)(4001150100001)(8936002)(5660300002)(2616005)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q7/eeQM5FMUFgNmhnFMG9keXnh4JHpYhQHHfTg2svEKHziAKqcoZdoriboUw?=
 =?us-ascii?Q?g4+ZRysa9kMV+NzXxPSBcf8ShPZlr82ljTHEr+8QinK0jF0TgvY0IXRxxjnY?=
 =?us-ascii?Q?Avaa3F+RKRPvKh/zNxAcKSnY1TnkBthTrq1I+m6cJ/RRKIs4ZyScWIRYm4Os?=
 =?us-ascii?Q?0ZOWqEDzuZe9tZrw+j7BndM6pfrSnLmj8upJFrgOtWTX2SL5HGd1+89wUzmR?=
 =?us-ascii?Q?Jg9PaI33hipuA10CIXPht1SpxNnI0pjxxm10r8ywtlXQhPD7CBWPnyLiFnfh?=
 =?us-ascii?Q?ZrUPpznJcmnhiW8CcQUT4LvAKfC6tVPI+8fSpTBl3jfRYqvluVD1Q9reiy28?=
 =?us-ascii?Q?qRmI7xo8MUdgo84NxXaXTjttzn7EkoZGqOCjr38yACghPQL9MbFJdTn69/kG?=
 =?us-ascii?Q?KPmU2/x3VMua8npTtmFlYv67G26p+xKT/MqY1G+VPr9hopzplhhGgs7i+sXd?=
 =?us-ascii?Q?0Lt1TuDlyUGbFyFXdPrAd7Yo5rCwgFmbbvGhYf2o3ZlqLCsS8ahwzMwqFSSF?=
 =?us-ascii?Q?LlbIqJatbCL/SFaZofmp2+9wBcAfVt6WpJ6Lckw8UOAatquUBRPVj+xyhgBL?=
 =?us-ascii?Q?Dpye4ViaNLetHAw7lhWpwaEStEICuQ1dVIzMHnHW7nd2GgAAnRcs+p5q/4Y8?=
 =?us-ascii?Q?oyb0fiTHGOs+TTj6GghkcWW7SViyPKAvYtxrObQm0rhCUAyXn3HpgwwgTCYQ?=
 =?us-ascii?Q?6lOHXpxagVNo4V2PzwumYK+afK3nLs98GU0g2GjQM0VbolQc7Vu8zioPi04g?=
 =?us-ascii?Q?B7jfoblqOcH2d6wfZYL8ZHy3zTnMBecRXlXqk7et/Ef7rWJTG6AVDK6dg9dQ?=
 =?us-ascii?Q?vKqinOBgJsfIB7EkpdQ/d+xjeFb9AL4CwhWHMAzNhSHdlbYoslDhapUNQMtv?=
 =?us-ascii?Q?RNllq+auHGbXE0hryyDMk1/0obX/ELm0G5VstmGXLLddHu/7jF3ncB/028K/?=
 =?us-ascii?Q?yfg0oZkVO49mpjVZD+SEehplWb0KhF8IqEQsMNLPvRncLxnVmA0j0hOByW/C?=
 =?us-ascii?Q?JvABjRKlrPUU/zwjUYX01FNaF2O5IyADt+QQjnCTzhnDS0AhxcA8cfuthAVN?=
 =?us-ascii?Q?Vj9xYAQYp0t/Jg1MZoWFWJLAN+ILW7OrpTfy9jsXEM7DxC26+in6PPFLHRjw?=
 =?us-ascii?Q?cXJRpghwZwtSZ/U7L8Waz6kXOgze9R5A38fELGawYKhc/j++UiXIHih+z0WZ?=
 =?us-ascii?Q?9iamYQUiKUdSU3FVxFNLBvEA0H4zS/Se0RxyejVRgPS8sw3TChnz6K/Cj7GH?=
 =?us-ascii?Q?EtKGq5ib+bRTLQku3M2Pb4BzWTFj7VJF1vwesQ8vQ0/b/DW/u/t5zVCAkj1F?=
 =?us-ascii?Q?fUtbrAGjoXc4xtuKXuOAmaWmeRzeopk0Sb6UkkQr81xGdqeXOxPpzBeMm7FA?=
 =?us-ascii?Q?FI17QxcE+O5a1v2mAkXS17kj7gGeWWVefdXq2IF20S+5YvMVFT/tDpgFqJDo?=
 =?us-ascii?Q?L/Fw9WVO8BSXKOCVYBmDtj0jizVTuKRzt9xV0HGntrSG0WT5tsyf8bb7Plu6?=
 =?us-ascii?Q?A02CZOAoO7zMJN5aWvL+p+6nmTmr7KCy0a3gSlk2pPKJNPchgBu6LiBgcgNG?=
 =?us-ascii?Q?vLCzHRQEfuLrJJy0rVVDmqWFZM/E2BGe/GQbeQYQMvwBskr9wYUHNtjykaYb?=
 =?us-ascii?Q?GX0W86tKcyQEqfwr+WMkNVVaATTsNJuNkGQSgl8c9XqxQG2jQGqSDrfqzQlv?=
 =?us-ascii?Q?1we2tECOUf5wpotvHya0LvIOrL/ZoT+6slDXfwksmL6GPSG/foIllW0k+xjd?=
 =?us-ascii?Q?/49shnCo0SXg8117XP3LjWG6OEoVV+I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef547171-3cc6-4bb8-a5a4-08da118f7c1f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 14:21:58.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AOeVmSrEE/x1To8tUMnjfvqd5sGPoq48sg0sWfogMZ3CmJppdeuzvp4cfX4G5fS8nfe8QPH1SuNtxPjOfyLjk4WUPshXallpt77qVGFN8qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3424
X-Proofpoint-GUID: R2JegoHlZ64B_SCsZKmWIKP3uP7MyEq1
X-Proofpoint-ORIG-GUID: R2JegoHlZ64B_SCsZKmWIKP3uP7MyEq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 14:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96260

Release notes (https://github.com/lxml/lxml/blob/master/CHANGES.txt):

4.6.5 (2021-12-12)
==================

Bugs fixed
----------

* A vulnerability (GHSL-2021-1038) in the HTML cleaner allowed sneaking script
  content through SVG images (CVE-2021-43818).

* A vulnerability (GHSL-2021-1037) in the HTML cleaner allowed sneaking script
  content through CSS imports and other crafted constructs (CVE-2021-43818).

4.6.4 (2021-11-01)
==================

Features added
--------------

* GH#317: A new property ``system_url`` was added to DTD entities.
  Patch by Thirdegree.

* GH#314: The ``STATIC_*`` variables in ``setup.py`` can now be passed via env vars.
  Patch by Isaac Jurado.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-lxml_4.6.3.bb => python3-lxml_4.6.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.3.bb => python3-lxml_4.6.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
index cefe1ba34..d03715cd4 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.5.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
+SRC_URI[sha256sum] = "6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca"
 
 inherit pypi setuptools3
 
-- 
2.33.0


