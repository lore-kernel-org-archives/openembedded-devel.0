Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6228.1626442071100226497
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fx6PmI1Q;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GDGGv1032500
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:50 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218gem-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqx5OsmL3yX4g+PZz7i8it+Y57ZdIQ4ijNvqOIprsw3540WLUF7VL6gqCAHIUJ4yxiNzgAHUjlIjbJ/hPiaUG9wxi2L5xymlDP43H1rY1b8B336DaRMfglMa61AF4wvkGUzZbgTVnYpBJmZj3UGwO9Ddu6mfXHRjZiQcdfuoTGaiW2OdVC86pW7ia6L9kvXk0dfVz+GcJCO4NF64nuZF3PBLi/7X8YjmyKgGeWqTHWsfwWqe7wCKGuxQ/Apg/wW9LR8XLTZqYsJAa9vLQkokhwt+c/e+jtpJEYA3JVrwpLPJ2Yc+Dtf+odA5TnoIVyp+lacZwdI6hGxjEBzGPYwkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2W3PTkl4+9LAe5B6de2N3+33lg/Q7Fb8M5m0WIuEBI=;
 b=PNCyYq3TZnQyDgBFW+MTdQzpM65MD5I3w6GLIzEXYrGeicFGJYjzSOI+4FRQCwBScKvUvNGdrGsZCeDt+agvDIktqIZxOPlD1Pe8SSajE2WMIwGlMjmxMglGaG9rAQwRX+ylAzD1xtg0e9dh8Pw82AGPvvYPEvWVRoV5f68cAQqCyctZG1SQWZHgvAdccVKiAp4ZHi7ph2/yhnxm9uaV+z/8lxWZDUfJVDb+SuOzXq8dDxCuBazFTuMrshmxastsi9bkqjVGL6DTK74kzGxgNtpxSuepL/7gKL3Lyz/7l0GR5dmgQO+i+Uo2FwUFALu193pBa9vLfOVfVkm3mxrWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2W3PTkl4+9LAe5B6de2N3+33lg/Q7Fb8M5m0WIuEBI=;
 b=fx6PmI1Q9rZxi+JkBzgL4mJ3+/T2D5sK14MLy3aOKBw1jKXtTfMF9rOvrGvq6tAt3r/LtC8QqbJN0LqIONW3SXFRJBCR2gu+w+qjFP8YqcqHs+FsonQnnuMMCyoOmCKLPvy3Kl77RZThsbcBBOJiH/3WYE3OViG6yKPHL62uLjk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 13:27:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 13:27:49 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-geomet: add recipe
Date: Fri, 16 Jul 2021 09:27:36 -0400
Message-Id: <20210716132737.398621-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716132737.398621-1-trevor.gamblin@windriver.com>
References: <20210716132737.398621-1-trevor.gamblin@windriver.com>
X-ClientProxiedBy: BL0PR0102CA0050.prod.exchangelabs.com
 (2603:10b6:208:25::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by BL0PR0102CA0050.prod.exchangelabs.com (2603:10b6:208:25::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24 via Frontend Transport; Fri, 16 Jul 2021 13:27:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27580d12-d6af-43e4-10cc-08d9485d815b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44013BE166B9FF2D3EAF81BD9F119@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	InKRTrXmahfmxc5OEu6dGHBojjnP2iLlRhrapcIFG4eSWmcOM4jRtPAfpc4mYlmtMX2KBjifIAbO6u2Cf5O6eNiJcTDTEyKsTaEQEy7nkDvdg/la1qc/BBiSIBeIUNnH/860QFyRCRrbEa7y7u0xtI7AvJlYCNqw8JAvfmo7CVIGUG+bAbAgnI0EgXpnuMcvYW5kMQqpd0cxoQyeEVR9Zm66Kec14UniTNSMvUPsCVOVXK5m4ICNIWbRSdMvGtE4aYRZSq6SCug1IqvTZNkdt+Ic2cEAwgsiNMKdooX1XscjzQ3t1wSKyXKwaGClygeLhk/1bAmj0LU2U6OAi1X2z5kloRb+5jb/jz0Js8xQpsLqloHKB0Ho0EnVgQ+j8cWX38V7I4d0TQTGnzBW9zyGUbmUXDdvUzV8Z1fUHeYHnLieMJ2HJwv1OplywLlaByK08vEqRD3S4QL8I/G4UhYqPCmojV8wP9uO+O8cKWcV8Q2a7OSMxtsKlujleRb5hsYRyQ9Vi2d/2xSjQHjLTlUc+xJ/fg8SgciX4UPZtsEVwa7dhnholkBFAz2ZyMYcJ25JQqWHU/oaVPjIKEzN4rLcgyd+k7TihxqrF3W4a2RAyHLFiAQLpm+hiMJExeHsept5GACkH0CnACQ5jVQhQyXTDk9A5A2+Kb5hXXb4wGvoU1HK352oOA5j9gP2hsmfjBYBkidpPut2m2RipqJjg8MrlMrpZmJReI6twrEc2rPop1o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(186003)(6486002)(2906002)(508600001)(6506007)(8676002)(6666004)(38100700002)(66946007)(8936002)(6916009)(5660300002)(86362001)(52116002)(316002)(44832011)(1076003)(36756003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oOisvX9eiVqhSNm2zse0c5F5nYLdLcN1fT/xsYFsawgrRfLq4KiWdyHKalew?=
 =?us-ascii?Q?IL6mWM/6QmGvZnZDKXV/i4rwCm6vKNv+4TcWzUPbZ7QRsHiW+VtqLP3WOtCU?=
 =?us-ascii?Q?HNSFKPGZ//6BfVLBH1k5NL+4HAZCDwONL+WyJF3bfuv5ARMiPha8l9VqV5xQ?=
 =?us-ascii?Q?AxhXt46ct0AajtCzYvgHY4p4B1tP8qQZ32MgKjTRx1++yjtaDR/lxxprxbX/?=
 =?us-ascii?Q?E0Z5zS70GXdJWxbAEW27xqYgHVblwH7U6Djof+JRnSueRAtRvXo8YCdRGbLj?=
 =?us-ascii?Q?63A4ffxY4RTIFMZ8Ut9qOZDO1/3yVAAuLDdmR1KUOPcZA97nVF4Jp9JULsV+?=
 =?us-ascii?Q?X0iOkeXzv0P8vX1XhWBBnEilSl2ysIzZw321MR6jaIpNl6BwF5gpK7x8hM0v?=
 =?us-ascii?Q?imDe7ZKjf7XfEXZHyqB7/G1gxc/gsre1w1Ry7fMMXr1Lc0AozDsvaIKE+zKq?=
 =?us-ascii?Q?uKvdfctT1i/ksrocAyyeGjhA5vlPAnQQJqiSO02NK7ZEYc2IQcn5TX0OsIXz?=
 =?us-ascii?Q?N9D0D0PpvcoV9Bp37fVBUlWg3M/oaGRPZfkAignFEX5YcYYmwS12MxpNZUze?=
 =?us-ascii?Q?Ix362B/wN/PsfsFvtb4FxkWiDHyGkJITEYay9zuaays1v17W7MzdZ/WLyVpB?=
 =?us-ascii?Q?dgrH453HNm9U4HF9SeypLzyT0IM2Xd53aVNQmrkZpKlEsGptLcF/gaP7sCy4?=
 =?us-ascii?Q?ZdvapbdDceb7oA2uLkgeRTcIH2sS/qPZiP5G/au2w82D9/05U3sGWpqP6BMV?=
 =?us-ascii?Q?yU2UT9DSNnqn1WNNUX0o1eVYhem6X3tpiZjHu9Kejuitn/at59mkPW36rzUG?=
 =?us-ascii?Q?0lJ3uAWYA45LTvD1B/7LnLegWOAI9x077rLkq3Ljtya6kV8JOdcjzXg+UM00?=
 =?us-ascii?Q?oTpXExSVvHH4eDYsALKHH1SRh3vfuCFaSKt+OWKEGgyA09fKCAjDzXWJwQBz?=
 =?us-ascii?Q?RaSsdTnmQlfAvCxWn8TIODZgBCiz3EUQKwScDvClx8Ct/7Mt1CMvY2B2yKox?=
 =?us-ascii?Q?dveJpASaf+IOIZYaMXKO7MYaEoURdhiGczjZrwAADe36PYLQ8b+NvGv2H5bm?=
 =?us-ascii?Q?iQ8P6U6CNcnSQA2aaWt64mvxynHkPuMhbWYdRJha6WURH/EYGKrgiGI7OdUq?=
 =?us-ascii?Q?Y5SECcdW1lv++WDLq9SU0eU4ZIXqmbwV+19l3JW8xL5zRWc71KcHBHgWNG+4?=
 =?us-ascii?Q?LJbzCXw/5uObYDJeVt26/px8085nHMFFx9X5iRJlNT7J9C4exlqVuHNZQvoq?=
 =?us-ascii?Q?pV1xzBeQ3QXc1ZTr3Xr8r2D54/uB3tm0NvCnmO47jFms9UDQCmS8cUJdbzml?=
 =?us-ascii?Q?sXnqalSP/z391dS/0Oa/RGHJgMPE7oEzxoPKnZsZfa/0PA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27580d12-d6af-43e4-10cc-08d9485d815b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:27:49.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLOMUhyUk4Ilh8dltIn1X/W+Q+uSq8ZO3/u41xADGp5sFzKncubLxqYmp5+Z2pL1w2aOYedwLcyqRuwxPpl8Oh+6Vk6zgpvdV4SdEK8OoEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: 7QZuKqlBa_sblbTxw6-XVHscOLvFWr5n
X-Proofpoint-ORIG-GUID: 7QZuKqlBa_sblbTxw6-XVHscOLvFWr5n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_04:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160081
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

GeoMet - Convert GeoJSON to WKT/WKB, and vice versa

Release 0.3.0 notes:

- Add support for GeoPackage binary format (#56)
- Add support for EsriJSON (#63, #66)
- Migrate CI/CD/release automation to CircleCI, away from
- Travis-CI (#62)
- Automate releases to PyPI through CircleCI (#62, #67)
- Fix parsing for empty geometries (#53, #49)
- Improve test coverage (#54)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-geomet_0.3.0.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
new file mode 100644
index 000000000..bf2db495c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-geomet_0.3.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Convert GeoJSON to WKT/WKB (Well-Known Text/Binary), and vice versa."
+DESCRIPTION = "Convert GeoJSON to WKT/WKB (Well-Known Text/Binary), and vice versa."
+HOMEPAGE = "https://github.com/geomet/geomet"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+SRCNAME = "geomet"
+
+SRC_URI[sha256sum] = "cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29bda2e1b"
+
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=release-${PV} \
+           "
+SRCREV = "73ec5ec96cca32f2e2461d3964fc3d4ab80248f9"
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-click \
+    ${PYTHON_PN}-six \
+"
-- 
2.31.1

