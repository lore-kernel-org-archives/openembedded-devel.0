Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.40304.1629212450926875882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iWKgI9Dc;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=386332e5d0=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17HCpak6020564
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 08:00:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=OJK7FKy6ZKFaBb9I5RHw26N0n3KbOnfeU8xIlFqAhaU=;
 b=iWKgI9DcdB34glt6hnW4ra53MY4/EQFuHtDt8nru/kW+J0WPCxGSJzFPQR+AJL9aZXDp
 RrL570hNwfXgexJNCh/76im1J/QKSPWy/AwltZHxHVQYBVa5qogz6RgDVHJwGvLBaPLD
 A070LvHbH7ryFu3JIpVUfQV84TAFov2UQeiprPy6SzCKDAThY7gGVs5CvXsJhXLF4TLj
 p4EKkGN5ugM5+ZY+I4OUFDpxRcr+AkprZ74D80yo2xZLvOUGp1YVRv6rJnKA7VeHBZE0
 kDkRBu+VNBD7EcBUx3wqozYoyo9rR9KxjdZNbCuQLI/tbgVrkDt/3ox3Objq0+cKMWM9 3Q== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ag10rrgyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 08:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9mKs3jZKo1Rsg0j2MZ3MlmKPRJm/aplCqGdujN9wXPJEXS8hgEd/gq3c5+PuH7vg7CysUiaxT3M9na7tH4P/3A7AHTxecVU0Nl4TYzxyQ1baHaJ/vAtDyVJgJQ/e5Pp5d97kZ/Fw8SAI1UlcTSoCYqDuFI3v6uzizk8aLH0dINoBrIqF/zH1WlHnzq8V1nCa4B+oed7CPghrRBrmDzhgrC1xGkywgXOVIbx8Xo/v+QIDxtWeNKqPSYMz0kNaJbbBqVpK6K0pJmy5Js0G/Anjdn6YBfo9PtW+M0XFvt3IcONwCOIa13prjo9MBxDi1sAD1D1S7nJewdruWMukWAuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJK7FKy6ZKFaBb9I5RHw26N0n3KbOnfeU8xIlFqAhaU=;
 b=SzPxsSAjNP2vP0y/8PcoJlSSN0OvKE4217cQN8i1fbpbLYpx6pHtFYGiYrvu3KAy2qv7LyGj8BoJeuCL/ss2GtxNq4Jy93MTTiN9yjThIUHan2OH3idyktwrwkKlGy4rGmzydGNsLAuKPzwdodct6vyTge1pQLrurGSve5KlIEPfiUJ4dsyJxSgeseiJWI7/zbiBsoUTXRO/7b78PY57yCwxAhQH6INJqpgwm9WoGdnmkHdHR0iMOepwHF4JB+ZXidDWUoc6mynI5uGDMKDc97y2Gc4b9b8Iokbl2cZRjzgjLFeD0SeLbSd4lCdvjF9g3wy/7O8MgrZ7z1AWstTnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 15:00:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 15:00:45 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-click: Add missing ptest artifacts
Date: Tue, 17 Aug 2021 11:00:01 -0400
Message-Id: <20210817150001.104189-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by MN2PR06CA0014.namprd06.prod.outlook.com (2603:10b6:208:23d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 15:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a35d7a-64fb-4520-2f08-08d9618fca75
X-MS-TrafficTypeDiagnostic: BYAPR11MB3031:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30318BA17FE862AE90DFF8199FFE9@BYAPR11MB3031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ndC8to7D8+DhCnzN8wnJFQvUFlui3OlYrnpiAuB+e/ZyPi0UVCIe2iIlwY8OeO95wwlM8VRnDiFdSq+e1RQGSlduijvODAfEyKcvAARXrrFGhmpD7xThHD9CrtulMwBHjmghl4bWsQCULL0ie/6wiSVqmU/g3xWhrYXv9KD37hcYQUHwWXJ1cZA2HmywLRo2De6RlmVnk1WFE+Fj+S4BKKhglfHU5GBJKP5O5wmkOppcEwvmuB8qds58Zr0anxRQczNQI2wBLKHfDdPQXzh9vT2aMOy/cCCKtLwdBDslcncweyPt8vamyWCfhwf+3t9o4ymC+/1KLpFbE0t82YjSCnetL7WQkl5WNFZQfwGrI0xGZepysfswpvzflNGz4dYPCbT7REH48THfeFRmIbCA0fYmr+g3++hQScMgjErQilY/XOFJk3BXVEM83umiuBThHi+jh7KfpIutcoBf4IDzSWfLv4ac+TbDkZqxHyJ2QcarMBS8mpKf88I6Gn795PQLGZlHLryCMFa/03cEmQf041yjSxnlXb9VV+JJjNgIdCfTv7eukVuQ2Lt87QePiQ6nPoXqFPgVnI2I5Zlr424IoKCH1dGww+tLFphX4S3aG8TrZZP+xtV6YkvUJvYI52n0Ax6uATe1a9EzNFrxD9H5+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(6666004)(2616005)(52116002)(1076003)(5660300002)(38100700002)(316002)(83380400001)(66946007)(6512007)(2906002)(6486002)(36756003)(44832011)(8936002)(8676002)(508600001)(6506007)(86362001)(66556008)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WdxDBS0plNdhLGRcrT1Tj/x6/l83h1DpZExoNXWKQ2wVVVZxXsf0PM1lQmwY?=
 =?us-ascii?Q?coz0Xns70KSIMwruVhI5VoGRiL2+9UaEFnC6K4x2RBmuTf5iLy6mbE/YA3tk?=
 =?us-ascii?Q?BaimVz2cFbFsrhNO7+sG9SMaRmSBFJm7YxGHn86yqVpH+buIWeJf3SIBOeY+?=
 =?us-ascii?Q?0aV7Zf8LUfw6xehtK75jmxaMY/qRSvgN3F9oGhk/TFdrnYulGVyFVz2z7MQ1?=
 =?us-ascii?Q?unbYMggez9fiBqqZdOcQmQOjH41/WyHZxl7gyRExnAFTfWEfRzQNCOZToZK+?=
 =?us-ascii?Q?TrJ+vnAPlbwbzAuIjfNUwhxV1JceUkvD9YE+qpYq5n/yMnctGeCh34wBZSFQ?=
 =?us-ascii?Q?XuXcR7qMZFXda2vOGF6w4CvyeUco5/lZo12BMQEkeeu6JHUmzg8P9Tgtuzun?=
 =?us-ascii?Q?1VpmahtyUfo9dUV+r05HdgLZVNn6Dwn89RbJfMSX9aCUWWv1e4EzGdL/2UGK?=
 =?us-ascii?Q?Ded7eJWMZSuqQdX2YLWgcDXiGF+94PvYDnTtf1Pl00ms0CoEV3ZIepprhGlj?=
 =?us-ascii?Q?ftStUgRa2G+lr2Halgvz/Wukko5nyjaAp3KvJfS3inapv8OlxHKciae9C30j?=
 =?us-ascii?Q?kVjqW4KT5+bgLY+LanVzsilZMG0bdxZLODJFPiT2onuQiJUgtW7/6bbBqdbj?=
 =?us-ascii?Q?/cVzoWdzQsgLOFzmgELOXcHOMLx5y91eS3XTEvVlaBnBSGZeV77aiA1Ck78x?=
 =?us-ascii?Q?/4Aa1bx53r5j5yFzPYZNb6YRvGbAsyMc9EFb/d5uH+Tqryc2ArHE8DqmqoAF?=
 =?us-ascii?Q?NFA/M9VRVr4WiXBMScBT8lb/Xy53+7a1knH26vU7bS5n+LjCY4or2Bg/581l?=
 =?us-ascii?Q?W+yIhIX4dCUo6VIptNrYaQbCZcjbG8SZc2Jdz2GgWm0NJd8CUVjdRsf2kHtT?=
 =?us-ascii?Q?E8TTkFJcN16Rm2Toomq4V2cc8trlnjC2LZrtp/uRsAu0hpNV0Q/8NYQ9ghFB?=
 =?us-ascii?Q?DD+xn2HLSCqqAlh4RmxdBULkds9IIlfQ9VwY12Gk28XT1S5s6i9X8cHfz743?=
 =?us-ascii?Q?/ULUXANjYuns1pMQa/n1ObIOO9miIZ596m7qFtJv38YsSK+gQujxSz90lzDh?=
 =?us-ascii?Q?3aO5mz2aI7EhCYLLT5UUma/JmD4M9QoNDBEwsydviEyg2gLHkr+IoZ2g2SJ9?=
 =?us-ascii?Q?VJjn0pDqzEvq4afYBsbw2KfE/6V0n5diA4tWzD/fp/6FXPRvOf5VB4mhxPp7?=
 =?us-ascii?Q?SVS4njYp3nzr4Uk9WrsJe2syjZflgeXwiTfaCX0X4fQunOyoOW0Z+CtJzqMi?=
 =?us-ascii?Q?IV9sTNMx0M+YTvHXQHEwNPzt7sewBJfBHlKHBt/kdKPm096OsNMomjKPsTRR?=
 =?us-ascii?Q?84OCRl+tnOJww2BdPVi1HBkL0KQVLXMn9hT1MbzzraNgHQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a35d7a-64fb-4520-2f08-08d9618fca75
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 15:00:45.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpnfmoyDsvHhIFv3fT7Y6fGyGcTxt7Pt7im5GbNgkPPbM+19gd/9STuqlrPrUevThojwc2yJd61P2Yeoo/sU4CGREQ37uC70BIkb6H5rTlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
X-Proofpoint-ORIG-GUID: GaNWBnL-MwIwxkImD-d5R-4SibMh4jtb
X-Proofpoint-GUID: GaNWBnL-MwIwxkImD-d5R-4SibMh4jtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_05,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170092
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The click ptests require the top-level setup.cfg and the docs/conf.py
file to be present in the PTEST_PATH, so add steps to copy them to the
image when building the ptest.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-click_8.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.0.1.bb b/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
index be13570b5..c8b9a429e 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.0.1.bb
@@ -23,8 +23,10 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
+    cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
 
 UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
-- 
2.31.1

