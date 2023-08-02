Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D4AC001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 05:34:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8105.1690954459494388022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 22:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IWkWraIB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7578dd9463=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3725XeQG010150
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Aug 2023 22:34:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=u1KmYw+bdyXDp+vCoh
	mU1K1MstTIQWa0Wu6KNP1ekRY=; b=IWkWraIBgWZ6RJ8VSefK57sXnDHHOlfR9p
	xk85bQp5efDv0GK8RmOcWlIuRaMJ79yBAbax2d51cDN3n1ssYHZoJVdpQuWMh1up
	PWnSHxQfDZHCvSLxpPYj6QxNIRwkS1RXTQW3UOOrf8vHLShO6uBeB4bCIvZ3aMoz
	rmMtncD/6mV4a3VQ52Euw5oCmGmNQgZ9MyJI93y3reZ8alx7SkDZSyayKGbdr/IJ
	n8ybfv4ULk6SafuH53GaJdvWjOY7C1DlmCwihLhT8P8JxAPLaVOx0y/o4Po0CcBA
	w7SSDNqVM7fcikHEJt2WPb5lnGQB8u+e6oecQ0JJDub7LVYuwmjA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqsuud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 22:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAupDemAszuFlnA64oB4jd3OCb7nIb7iSgxKGqylJybOalCDczf7/hH4MW8bwR6qKpy9k9bBHSCigCJntciqAA6ySAPZifHOoZKdiCMsuQVhX7xUlo/wIncaqiy1YSEJAVt/WVMbfQdEmOpDydkW0y8Hhdl1LB4nsdY2t0C28cfMKOLWMiR67sDiFqzn9vvVp2NY3++vzAYw4ev5DcfB5dbgdU8eM7UZZC0iVx52fscXtyOfq7lxvI3VResWmkAGoaeVOG1JAszAMxD9Om5jt61iLSJBb1NXV5SoncULcDcY8EUMDfcy0bkvF89lDS2HdBJSnUC5y8EZz44NtmP8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1KmYw+bdyXDp+vCohmU1K1MstTIQWa0Wu6KNP1ekRY=;
 b=U/FdlVYOg2WfrKiB2hm5BJUg4eCcZwTxh6F+1i0T8QOVLheU9GeA48ke37xldJY73Vmwzu1HpPBQ9ufCDTf4LJPv+X13OFs5AkIp3puhwCnQVs13/ypwxeetGlzB34CxOwH4c4AdZFpryL6L7gAvD/q/0mzEAe0wa4857btie380/Qe2coXXp4NlYm4WHR/gYSFTtmFUfyd/h8l2x8OSu8x8t/k0MTIS2EJpk+6c19D/m750hKxNbmFsOzz7dvUxqkCvu8DXSqA+P3GFcBQhLgVlKNNZnEGHBdko9QhLYC1drjIKGpvTb36pPUNjULObQMCIzjl8tpCgvZeBdkQq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5557.namprd11.prod.outlook.com (2603:10b6:408:102::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 05:34:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:34:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iperf3: remove incorrect CVE_PRODUCT setting
Date: Wed,  2 Aug 2023 13:33:39 +0800
Message-Id: <20230802053339.437075-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::17)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 270cfa71-7c66-4f7c-a8d9-08db931a1b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tX3mYEfd6KfRBvKFLW8wgVA28UXt1Pmiz2P/qYBcPG+i0aBle0oHKiXi7tg+/YpnoaTmwSy53ZcQj0ogOPtLlFeZppinMUiPYsozDek9wPQW6/c0VMrXgMDPqu02F5XNUq+4+ul2ekWex1x9SgoBYIt/Ai2oOBY0xjLkljT5TLhyRa6Jbos2Q1752CTdbVW7C/qGqEFT30xTcbe9cJfhALXXhGKvBEfvidNRRM/vOaLlpvyH4lUTIcqmjXkkPkTlLZ+KR0EVfVlVv0EEsfagyrWJNSZEk/ZLn9UCZ+dgtGCU8Hv/pCW0jBXLX0jEqDF+N1XuPuircfsyypY6O3y5RVso14wKEXIHMmxdWbttNKcGURcujVAraByNnipbb3xsgYN17GOlaMiW1pDfZr0PBAWlBQ9YQoahqFhrX1vVY7RJxFCMBOKnZD3y9i1fnYSGijBrtw/c/biD5eFZ0tleS8F5l4SN9MuKTaaRBTn1dH6XE2Mm5wbymTPMh23rGf4OIEIZCaBOpKIPspKTSaqaeAXVk47RjF6mwQ7Ai/G7cldfU3OT2S7hTLrkWU2r2GN+nV4i4jp6vps14f4ZFhF5meSnPAv6VOOqycVcibYBR84=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39850400004)(136003)(396003)(346002)(451199021)(2616005)(186003)(966005)(6512007)(9686003)(316002)(86362001)(478600001)(38350700002)(38100700002)(66946007)(66556008)(66476007)(6666004)(6486002)(52116002)(6916009)(6506007)(36756003)(41300700001)(26005)(8676002)(5660300002)(8936002)(1076003)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ftxiHSKbnWRJiGDs5uWn9zEKjTWFnk4E7bo7wrngI9FDjMjnYZzSIpva5fvl?=
 =?us-ascii?Q?GlMUjcDlvJM/m/RafqIIT9653Caqlzls1EbLKx74b4Ynx8wYuNwboX+qms50?=
 =?us-ascii?Q?7oxwtkAsuGpMLoWHWqN920HUXcYMTj3oLgkp/fHWQvlGiM0SgQtQ+4Fg/ZdB?=
 =?us-ascii?Q?4qm8tW4bA5KsJ56fdJBicTnbEqemr6sU3SIFXAbuJqN/aCus62bs4hRiA4yd?=
 =?us-ascii?Q?3GkLiua+uQwUNKmenOOcvQVQmdnVdxSkwFu/LdXqII+26UKoKLpy2UeaXr17?=
 =?us-ascii?Q?cbyrVDAqcryjjIctpkmh2MhT5O6eQPuIJjJ4pv+1mrSynXJEge4kORqN0YAN?=
 =?us-ascii?Q?8LVa2sfwssVhSgAM/Zgyxo4+moeMqga9maPXLfz5nRiMAZaslZ1waAtEQHQ/?=
 =?us-ascii?Q?6KxbkQMBr5goDeeDMRIUK51Gzc/OPIpDF0FH57hOkq/mRLk9RMeCJwmjdMy9?=
 =?us-ascii?Q?4yYAr1LYDt3tJraXY7B3R1ZY5vX5rBXn8MH3zny0rLlXZFOgmcSgMnYdMROe?=
 =?us-ascii?Q?5h303Z+qptEr6+oZnH1VhOSK4890GFrKNo6ufAVqnwuizhql0cxG0/Yk4gM0?=
 =?us-ascii?Q?Fv17B0GzqE4c5pSFmGyzjmcWBdyE0TxrBdw51lz7MVL2MkmjT6iMfOcqva0i?=
 =?us-ascii?Q?daK7ZgKebMGp1HCwtlGN8YTffPrZmFWr89RAlbpXrqR5aziAJg2cndkIUl1v?=
 =?us-ascii?Q?CD3ctqmkL3kojdfvW7Ll03nzEtKps8SC8B4xsDe5wwvjyssUunYM+8lno44R?=
 =?us-ascii?Q?GPtnZBE2vTkdzZMWxecRErBnFjMnjFk10KVT+l8OH+wfiUedq/a4vtEuyOf2?=
 =?us-ascii?Q?MK9Qq+cYUPbSGn64IO3lGMM91F187qMfkeBOpB95dF98hzcYvWVnV8Lrh1DT?=
 =?us-ascii?Q?0u4HtpZwIoD90wg700Zkyz2jFn7AKxJWssh8RkjlLUCgct90S0sFyulbzDQb?=
 =?us-ascii?Q?n6aq/3PY5TApCaBRnx907ExQjKUzj7FKVzHWrU9p/v0HPA9qGr5+VhgtlPBJ?=
 =?us-ascii?Q?KOy3sWIYkdh6irD+lzMpwxybvTRhVau/uYLSmPn0D52dGh8YZrKvP2pUFKsF?=
 =?us-ascii?Q?ScFaJOBtOdZA/NhdiYZN3ZFSmfKwRvEM1WPCLFgmb181KlRc3bFh8bq42TwK?=
 =?us-ascii?Q?T9ruk+yqeoalciHvFZncmuNzF8Tayk64wJ8eEmXMI7i4gllMeVDJYiuGDx4y?=
 =?us-ascii?Q?/5FQvMzFA8RyAA8P/h0YW0iUIUT4Fpq/OTih39dT3jtMHNHL/mpZGUVHyCC9?=
 =?us-ascii?Q?gVIvA4VCSSJulJWK9bgybXarIjjH+81Ply21fln20oynhKsNEPmbSdA2DcuD?=
 =?us-ascii?Q?2a66/3M47kXDqcr3eu7rLYzBR7X+KXNkipQyaC/V4Dq3N3rXe6H4SMK+KhKD?=
 =?us-ascii?Q?qWEotYWNEfD09mbFK4Ezr7ZzYcx35MFBnTUBZUBphbvG2sKJhfcByljokwoL?=
 =?us-ascii?Q?pGW/j7yx/28no76Yz9uz1AREfDE4SrZdZC5Y3YRicIoFjvKFpVbHZ8rwjhbB?=
 =?us-ascii?Q?00Xcm72qzBnigYaS2fuVw1GGh/cXuqQHTbjmWZeJo9MuVRFFYbdlAWQ9TIof?=
 =?us-ascii?Q?8+JLc3QVXsaWNp8g5xj0BbCozd5EGYiDExCW7tVs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270cfa71-7c66-4f7c-a8d9-08db931a1b2c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:34:14.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MHvieYQo7XidV0B9/1sgKaRILZBrnsGsssT6CJEqtS/p95RDS5nd7VqnWl03HfzGuZutpS1X9lGNnX0Sq4vzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5557
X-Proofpoint-ORIG-GUID: 0ipnmOph2E6xU3gGzpFS91vp_e8sf1TT
X-Proofpoint-GUID: 0ipnmOph2E6xU3gGzpFS91vp_e8sf1TT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=538 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308020049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 05:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104201

From: Chen Qi <Qi.Chen@windriver.com>

This CVE_PRODUCT setting seems to be copied from the iperf2 recipe.
But the CVE_PRODUCT for iperf3 should be just iperf3. For example,
https://nvd.nist.gov/vuln/detail/CVE-2023-38403.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b0..74c715617 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -30,5 +30,3 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 PACKAGECONFIG[openssl] = "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
 
 CFLAGS += "-D_GNU_SOURCE"
-
-CVE_PRODUCT = "iperf_project:iperf"
-- 
2.34.1


