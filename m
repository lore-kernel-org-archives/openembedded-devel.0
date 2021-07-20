Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1462.1626807249446310197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 11:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qF/Fi0xz;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2835133119=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16KITe5W004964
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 18:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4hNPCuFvGwzAeG9aYUoN9tVIXAhbau/0mc2BqnJgSok=;
 b=qF/Fi0xz3tZTWD6I3Xu8ptuhXOFX/2eUZ6dmAXTH/fpqbmXoXQE6TcdSqKM6m/BZdqT6
 WMyr6xiQfGGPEGsmIMs/CX3d+H9cDZuvm9+t582YIZZwNBp3sH65lAtT7nSXuuUj9uP/
 F3c2p4Xka30lFkXf+15ul6J7JTS1x4Jx/vjLkU4AC4/4hb9ASMka0xNg2cWku1kqQ9oK
 12HhV5WIU7ku8e/+un1q5zl55/zSxH2fBTzLocx2vGb84RvqTGlgcYQR5atnNPw2GJEN
 ehT9hexNyuN28na+56LIDZUjuUBKZP39e7ao629NjmslhPQwkpojHto9iE7EXKiFqQUG hQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 39whgs8q1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 18:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXxreTowpfZ94YX7dtDuVJe48keGqqO+aYimjc5MLCx8CikPftY7s5UZPGlYViqibDEdl1zOn3WC4xX1Jd4GYgYVJ10rMGxDZE4C0QAdm/c2G4CPK1hallBp9ikuhzVZ5bgI9jW4SjAHy9rFx7fC68lkAXzoD/ew+e0XD88Z1IOu0f9JSFmESRqweLW71fz2gWkSNzKbwno1P0whIXnzZT1FngtgJ0Vck4fyrVP5QVWumqHt0J/26S2ISMIiNS4ceq6ob4W66NQAWrY9/t2MuostfEpo1F34/gLQXsTQRRBJEThrCtLpDK99Jyk5aO6iXcvUUwQmRpnWDrgaVzLIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hNPCuFvGwzAeG9aYUoN9tVIXAhbau/0mc2BqnJgSok=;
 b=Q92tY9989BEhfZxDJgP8kNgXDMQWZfL+96sZQY6ClFnyFLo6PHiCSDF0RxYsgVO3civFKRFvH+dY/LKVQvMqvy9Kv/NqTXOkN9FY12sS9LCJndhdOo6pzVsW7NgGs44G5nGgqHTEaXdVErPMI0+sTCKPqJhKd4cGbk0jVYKgcw+VzFHgUmVfBlJH+eXhHddldgPjFS9S87Kf9Jf4v1pFznI+KRHQ+uOJ0aY4WW8Jm3k7gDTSAQtAsrNv/pXsqvhAYJtVMjbX9eXozPwVp9xe6q/He6/vRRZmm3HYqeUM1MFEejyyIlpI7ox7/IivnT8M8sPdu6FgJQ3yGoWrSPOQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3319.namprd11.prod.outlook.com (2603:10b6:a03:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 18:54:04 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 18:54:04 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [hardknott][meta-python][PATCH 1/1] python3-urllib3: Upgrade 1.26.4 -> 1.26.5
Date: Tue, 20 Jul 2021 11:53:52 -0700
Message-Id: <20210720185352.134342-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:a03:33e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend Transport; Tue, 20 Jul 2021 18:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b53429d-55c7-4b1d-be62-08d94bafbf02
X-MS-TrafficTypeDiagnostic: BYAPR11MB3319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3319F85B3A95F0DF9757597C88E29@BYAPR11MB3319.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zdPftQCTenZzK/SI1/XgVK5pjYf7OGy7r4izG2hgFZWRxMUgf+blciV7ZZ+9C7gSr7ljGmqudTGiIs2yY//xjdN784s//Xbm0OdgnjN+pIeKKOMQSyaU8wunrzQlMxl49uZ29NK8x3BfTuac38K/6MHOqHtCjbJpdwWxo+4oaRiJHQ23IM7ykNrMO7536xf8HCNaMlSXg3FU/2WneS1MWi9tp9HxUYTd664lSATtMmqxfMKaxgVjD+/Pa08umhY4UPcdUNYSZM9A6FN/yq2FMc1nfAb/UMCqMaPGckbHwDOOnpRJWyL1Ys0bqdVpgkBQEaeNdusqXZnZlH4lYX0y++Aq01PypMIsIg/FOjVHf8L0IRjYqsnXr3NJnenohItH6v8MYOs27krngUrGV4VJM/b4g0LnqwxAJuJaVWBxxRg4mJcwVAGMJTBgVD7ZFy5yvx8EmEdpmd+AOrGDmZB3pVluxNJtYYWGPc1nJVlAQj3fLaG6H84YhuHcyHfF1fB6BXauzUluPDUHyHVejp2xWNUO6OJyiZkYkkDUwDi/yPoFAcVva+Zt4zJmLn1e7ALnlGkDluZJFOm3VD8TB8+SHLH2BVITv7oImqVW3iQpwVzWrgDDmrv3osHPocuK3v0c+mTiLsL/yox7l8ofUA5CbMSyx0k74idKp6w8Nn7NQifOoA2Z8l6xKfBxRD7KAzg7dGxK5Wh3wHjN4Cm2iq+9lDgkbktqZrM5RSlIPuVeo4NuIH4lyipkmM6Dldei2UjO4Ih32OJ4g0YnZcOQnsGKCvOGF/ByI1h+QDOndNXahOQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39840400004)(366004)(136003)(66946007)(6512007)(5660300002)(2616005)(2906002)(83380400001)(26005)(36756003)(66556008)(66476007)(38350700002)(38100700002)(316002)(4326008)(478600001)(6666004)(52116002)(956004)(6916009)(6486002)(86362001)(6506007)(44832011)(8676002)(1076003)(186003)(8936002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MSss6H5fTbpMZ53DoFndN+TI8oiR3Z4/Ay30NVMH5iFC1XAmveX2NwbGeWTq?=
 =?us-ascii?Q?ANSvse7kbBX/wdVzDC7AQWxnvUTCC9Ch0xpZQmrYn7/YtmO6uQcAJ/bXiE9e?=
 =?us-ascii?Q?nyV/TbbsLWbTz89ufyD6hXMVBVck7TdDL4gYwgdPwXSB+YFVJnDztJR45zTT?=
 =?us-ascii?Q?9S94ZYpCfTtrczQ3aFOCthkZxWSYyJquemikRa45EdvfEh8GC4tejhfcLizI?=
 =?us-ascii?Q?TjG7UbPLYldk6AirSNuGJsCwyi5aXh8vWjySvhoy8nVwFhmJ8MRFUDiC5p1I?=
 =?us-ascii?Q?uYWpY/3fJTkGUnOlhQWNpbFRsc+Fzp5BaDkOOsm0l+9//Wmg8K9S3buu3ClW?=
 =?us-ascii?Q?X3DQmmmW737gxOzwJyw2GRDfkiZbA3quv1mOXI6r0eXbJ9g5+Kl3ObMyIUjt?=
 =?us-ascii?Q?w8kytDr6Jy7fxF/f24fPdr0aafrFfP/oxyZpRZjqrVzwKK1ocFyGs5u5M/fm?=
 =?us-ascii?Q?koUvL4mQfc/GBc4M9nHsccFPC+Er+eSEJn3DNcy8oGk01zxtmC+NvYOIJ3S2?=
 =?us-ascii?Q?yq8RKNeNJ+SDoP2YTSVLPJtK7dnCL3g0k1DtIdaTFU/Dg5OohBzM4GbKPLdW?=
 =?us-ascii?Q?UgsRfamfh+uMnqaMPKPBy8Moq/Nro1L5EOAylH897Z0rR0bdh2mvLwaZC963?=
 =?us-ascii?Q?USRccVTpL5ds5LET5t4ek+FBfY2kPig03LEL0dkGucs4t2CHFOZ81cHOj0Zh?=
 =?us-ascii?Q?l2eKI9EXo1qBSMcsQuiBcwLVcKvSMJSb9yyWta3ID1CawpXnczCGfAWKEske?=
 =?us-ascii?Q?rLcWGqxdBc13Ebqc6i0NAa39pMKCokb8N+Ya5iCERbHqGJXtuWON98lXWFBb?=
 =?us-ascii?Q?Y1cTcHCQdI6Hix90YeG+6/Xgd91m9NCQ1+SL+shtsFerjsVuUpFRBhUmA8Mt?=
 =?us-ascii?Q?yrec368rTKbdhG7D2rHqySdTXSlyHOxSGqEUPoFYHEtULiBoNFaMVg37jVLl?=
 =?us-ascii?Q?+BhS91AmoMrQnHv1Lar3EPgCY1NHmf9h310O7mI3472woMzUe6iXPwsixSdu?=
 =?us-ascii?Q?wxmVz4IThV6jf8pyDcmqua7eyyfkKVYwGxhjsOvYPzvhXZL2z2UsEPj16Rq2?=
 =?us-ascii?Q?nPe70260IlbJc5HgNKOI17DpJAILzxeQsFpPZUE7S6HSZPGyBqxzvVXq1srP?=
 =?us-ascii?Q?+IlzogvFvXUyJn9i49otOBqqtYPHXUm1E3Pz5JqkIVczhmiT4YpAIp6/ic3+?=
 =?us-ascii?Q?ZVFVDTrSu99EPPBK/n9L9HWfTwQqv3D9osef/7p1okIVSJxV4aqN6HxBJgCd?=
 =?us-ascii?Q?qxcoBHSe1NDFw3kyd380aMxvqyWHhAKCjlo+bq98cydWy8JpyIy2HmwyEkkq?=
 =?us-ascii?Q?5GId5QIbiEbKiA8BdpPGMDWP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b53429d-55c7-4b1d-be62-08d94bafbf02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 18:54:04.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kULkKCpCezwrzL/Aye5lHMXaT7eECT6zU3QKFKQS/3HkVSytoq3Zion2eo3vRHtkdx3eHhmKwtTd4gjlszo/b8qUcERrq+6XjkH/dJkJk5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3319
X-Proofpoint-ORIG-GUID: wp9C-wInSAtSLlWWYMoT513pDYsj1t0S
X-Proofpoint-GUID: wp9C-wInSAtSLlWWYMoT513pDYsj1t0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-20_12,2021-07-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200122
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.26.5:

- Fixed deprecation warnings emitted in Python 3.10.
- Updated vendored six library to 1.16.0.
- Improved performance of URL parser when splitting the authority
  component.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

Fixes CVE 2021-33503.

(cherry picked from commit bb39c29a46e44fcc082aed0ce8772f4267a41d2d)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
index 0a31fb1e2..f2fb33c6d 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
+SRC_URI[sha256sum] = "a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098"
 
 inherit pypi setuptools3
 
-- 
2.25.1

