Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.4353.1626899299793835671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 13:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dSrsMKdR;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28363971ff=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16LJeTmC020920
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 13:28:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3no82vkKjgFtWZ2SD8W/I/3BryBewXuPgNGno07Gryc=;
 b=dSrsMKdR7kNlrAEEFluIQct++rUmbKddP+B6TRCVUOqYG33YgZfyBAJ6NOG5FZ7ZhL5C
 ljBsMHSz/zd4ylzlMj1CSueJDk4UpRDoptLLh/QEHc7J+XZm5vBbqIcT28XCmHBNyZ5e
 WN2XLlR7E+szkBh3TdJ4SuDYhh4eqVxzJcFSOWOcm0cO/CwrLZeV4ZWoJPPQZRePPK51
 qHLq8rjwGtDojowG0wEx5AaPomYSEZydV0vYKO37mpWn3l6L6RTIx4ztfOePsW54VtF0
 fe2XglpEF5qRzXmdg0HBau0563f9lUNlu9wXm54/syiXuwwKgyeWna5ZujzatEQUCeVG tA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 39x8q10rbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 13:28:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKj4s7dZ4ZSuP1YM0M/uzkd8TT+4bcX3aJyj3aWNRHXLz251Jrm+pgB6Rm2rOmpCZnC7/7iJJpHeCUKyWa6+KiRmaEnWLsaJ+SfpQl6DqqPS7AKV2QhmE7woMn8BbbGqs87e1fzXxCcpu6Z4KZ1fY8ZEElXnIdRHtMunO5aZvaA5r4gO/X245fe0HokpTLXqQMf+xr5usbaqD/F+W3yha3pG6MODtqleDKDoCdAgtJSMGxI43pL6kgAK2r7DAKUWTTEQNh6d8uvCjB8X82QPM4+o4E0XECK+f0T3C/378KaVSkvWKfyheSiaVnxdoiAnOkCVclEAPRUaZULNbKdDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3no82vkKjgFtWZ2SD8W/I/3BryBewXuPgNGno07Gryc=;
 b=KBZixA6rb9ClsghE9iceplZPAjitzvaPGwH+e3SlBRGW05E3JmAeNcB+M+yZTen/g/JDyziDQwEuT5fFUr6SuJ6+NVTmLUcgiQtHZUAlGmzuc4MmYyT6Jt/G96awS8C/lh10dEIF4/8AntPKjk9zo/FCKB1fOe7eLmSqY3Agu2LBihmf2eoLJGNMIPY7/Or9ouAW0GrcgF5vfgQ9orqdhbPwV3YwVPkT5S6vKEx4mFUmZElFrEBSexUO12ji2pru8LVe+0OJ9GfusQRixTRAxI4NgjKpD75yQJSuu8HkEgedJA/q6R9KTaf/Krh4rZWrnWwOMnOWWmtyI0kIviGw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3781.namprd11.prod.outlook.com (2603:10b6:a03:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 20:28:17 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4352.025; Wed, 21 Jul 2021
 20:28:17 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade 8.2.0 -> 8.3.1
Date: Wed, 21 Jul 2021 13:28:01 -0700
Message-Id: <20210721202801.27916-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY5PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:180::34) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY5PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:180::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Wed, 21 Jul 2021 20:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40457819-e284-49ec-3fa3-08d94c861266
X-MS-TrafficTypeDiagnostic: BYAPR11MB3781:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37815D4222D9C60298F89DCD88E39@BYAPR11MB3781.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:112;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BoFSz+GGNJjEbq1aFtq8rjgXImyY+pvsFxA3aMOIKpK4UGJV57kvRtA2Sy6Ir5jjBp3mzgOgNxhTf3Tkra12epQ51C7FDm0825YGNGgcV5PXTstjnLItmRNzSl+dQqfomPBBScLhcu5TcTszBvwHIxMeRXQf9bIOqVQVQpHidbODVABfKJRHze2gsk/H+CLPmTtML5aso/VFbZ/r6HlR64G30F7qrM9QcmLn35ysUA2k+T+Idqg3gTTw4jwJA6cRVcKoWXjxJrEcqXxgNxeds1LW4ahW79QMa4yLQO06GATdYzZCANt+qvgB6h3GwXQc9Jl3Sy2ZmCuAi5fYkeYFQZnTcHB7uN56AoiPzJVxyEDMRBLzSH/3rlB5uZe8BD2DTyCHwpd+7WbEnuJhMeXjwcv5yQE3bbFhe1HDN9r3WTn5cOSi1o/+1Kk4Zpm3GCGSLVZs/Q8M2FumOnIRf+d2Qa3EibHgdmkifFTljTmRMaZFLWXEHTWNS3jpi9vCFieWdJug/ALcpo1qkfVY58rMQNLT5bK/H1lJJltpYZKyIqyt3RAkBjnafxUB1fE1fFq+Odzf30piMuyU54Afsvd/4jXya1y/hzvvjdpeWBu6ZY1BYnKc88ajJ34sstEeaNHtxhSulfTsLMr6YDFfqS5rtZZtoK6uBzSaqjyUQIbHWffMbXf9dpN3FXt3qJt7QG6NZRyu6K1TGdVjwyvE0UUNeA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(5660300002)(6506007)(26005)(6916009)(38350700002)(6486002)(38100700002)(83380400001)(1076003)(66556008)(66476007)(6512007)(508600001)(66946007)(36756003)(2616005)(6666004)(4326008)(316002)(186003)(44832011)(52116002)(8936002)(107886003)(8676002)(956004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?udehCXtQRFjIQ80dkQS9nFLaJyxHD8jOVOD+DucVNJxLc9zbeaa+Jn2U/spX?=
 =?us-ascii?Q?thuv5SqKbbqiiZN3BOqC1ugIR7wOQqf1PRvKH8dr/aYhnbM6IQVyDJuYO8kS?=
 =?us-ascii?Q?JWsEJy/tOoNgDqoxLtTquvfWhc8RzYblvg6WGblm/hps9dIVfUJNUXNVlnrC?=
 =?us-ascii?Q?KaNGL6g1ksaJHzo+Oebg/bl+StZffR7VZ+/+kcz53khFaAVenQdybidOFekb?=
 =?us-ascii?Q?ll8Ey3xMLF02d4v2dLv7B5Nf50/P0xicML4ItQla1F/JbaIcQmby2pSHg7Xx?=
 =?us-ascii?Q?K09+GM1T2NVM0ih9XO1cfaaqvN6eVsCpjxJ37fdn3INZg+ItI0Rv/V/Xq80B?=
 =?us-ascii?Q?LGnd+kUVV9KBcFMy52FsPQYvsIuB1lewUOcJ9v2FRi70UWd8CC2UbJcd++tv?=
 =?us-ascii?Q?PZd3gAXb1zv8L6lyI3wakkY5Q/W+hxbBw3Y3eRn7UXErX84RODCgLxb3V3m0?=
 =?us-ascii?Q?AeC3DGIRaELSc4iNbwcfAoHNAWqJNcCLsQfFdIR1JA/UwTOIa7izH//DjU/W?=
 =?us-ascii?Q?E+ouUBDZuDBG5DUxsyrIN3EAr3cvaV++khy3E23f/3oMIV01r10IgN5Rt/Dm?=
 =?us-ascii?Q?NYxYPnenHRPK0aCY56wzgQrS7MRjJ6AdsIdvSWMZhzM4qiDqX/5h+Op1Hx1q?=
 =?us-ascii?Q?OL1AQ7Uu7gkeYuXz0UuJVlzq5PCxrjFhQ/it8VCu9DrgVyRr0CeaeAwTDnig?=
 =?us-ascii?Q?5AlmzZb7rQKQGNuJv0OVYq/SKIyt51iShRPtqeZ70vMVFLxK0q5RoEys6B0L?=
 =?us-ascii?Q?H8C+x/05p1P/7F/jsBJgaR/DoY5Tob+N3ujuNxZJKKrIYSbGcC/FjQ23L4IO?=
 =?us-ascii?Q?Fu38ssfB8XcueD6uYVuIeSKZVTA5niL4BtXaLidCqvKlrVXn0TpAdmnTEmPW?=
 =?us-ascii?Q?QQZlOLjI5JA/6F56A7+nvmTSTzOgVbP29/FQtje5N7GZewaYDd9pVuHKGEwa?=
 =?us-ascii?Q?UNjarWVCzLRhsQxi77eBk73sv+O5kqdvzG+Pk1k0E9b55VBNLjxCAkJk9Z8B?=
 =?us-ascii?Q?8+TSbn8lqhuLXY15Ra+t5ygXgzyN7O5cnBvyMpaYskRMrOKkBp+7dzOQ5v4L?=
 =?us-ascii?Q?WlfZ+qtFrD/vB4Ha/j03aR89e4NE40umj/PqAae6I2vHoOCeA2wnkB67i2yi?=
 =?us-ascii?Q?Iq9kTS2xL7lgBuBgm5B8V+1Bt1l0VqvCNuJwId9dhcTeoBQTfBHi8Jf85Tst?=
 =?us-ascii?Q?EYeG9Yjwfflk9wZL9tmmKbe0dImwVmTfjz16Vdi3TSZmFHulukZWzedOT0Z/?=
 =?us-ascii?Q?ltWkroLa68VmVlO1Tpsw99b8qql1byuqM+fip7pjRP3BQCo5XBKod88tMFOy?=
 =?us-ascii?Q?vT799yS9eB724uX7xyLyEsqQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40457819-e284-49ec-3fa3-08d94c861266
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 20:28:16.9434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCy3ipqmsPkoHzENLGdjPlelZMDDupeGj2e2yO/70YP1/xQ9gYzncpbl2XnYowYo2xQvEQogycKe0h+NO90o+OxmM0fsMClS1BpoJMdYJT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3781
X-Proofpoint-GUID: s1BlkkESUtOmRVkyTs7WNkMNlGf0dj9e
X-Proofpoint-ORIG-GUID: s1BlkkESUtOmRVkyTs7WNkMNlGf0dj9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_10,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210121
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 8.3.1:

- Catch OSError when checking if fp is sys.stdout
- Handle removing orientation from alternate types of EXIF data
- Make Image.__array__ take optional dtype argument

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

Fixes CVE-2021-34552.
(cherry picked from commit a5fc60071f0a0a16096792c4e1970d31f5964539)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
index 3241230d1..045357a6a 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
+SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
 
 inherit setuptools3
 
-- 
2.25.1

