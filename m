Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.210.1621531348440515256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 10:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OBgS5wIy;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0774a447fa=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KHGl7o009591
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 17:22:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nphwga47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 17:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NimahFyMCiB72CWRxlb3fQQrMDb4f4ZSH0TmnSejfpDbQwF9e4IQ+E6o3qlpArE3N9IK4jqltLQZyihHBTWm08KV32A7jPASI6Wwu34rntrpTHVtDbdA8ufChpQ9cXEjtWMkbjU0rJT+SmkvOd7u9GPv9yn0Sx8dcZX5k4Ag6PIEoBa5IKEONhHWV1aT916Bc3wke4EGQV1dOn7UAnXjyVN4+lRkfnXVHGj/cxBMotqLxibPkOkQHT0j6zf4YLEebqF4c31cGUEbyn6otTYy5B17+my2ALh4JWzX8lh51Luof7ml+/vKTiv3VM6pxqM7EPFoHSIUd2XfB4w/NGFLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33lBWmWwZWTOyZ3itM/cY/wrasPBfoKzf9AM4lIarF4=;
 b=I3xULfns+OI0gmCg3pcwkbNkXO5ltPsHT49NWV+MEP8WBUI+04wmxDot6kZAxVduMPGEIulZm1+us/E+JGMfbc4iDF9deGBXSQfZjdNbu6brejXRc7PPZwTy3I2UFwPx8oWIArkTeh302JcTT+UWyzoT6n3q7UokGz2cn1yspBVzcKP3KW/uHKEJc6LVpF2OtkVzAZ+JkH6P1EciAX0EwGxLNW+VsdG6zg+Q2hhWQ2Bbd3dEHFLCqgh8sUr9gx3rnvBiIA2b0CrP3gpVzdMZdHaszHPfXLsgrQPtek3PWo2SMo6fsX9Kl1LrDVIwpuZJOs/H+8w5t9es93A4kX3few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33lBWmWwZWTOyZ3itM/cY/wrasPBfoKzf9AM4lIarF4=;
 b=OBgS5wIyHgrqrPBR3RkeqLEdkpFtI7IkJ2tFrAkqhiojKiG/dZn/Vln2ZtsbcBv8D29KO+kTbPSM8r1wn0b8oErLyQRLRI2IomCenidARdEox8a2Fz1IifeSZsxgqtR83uuVYV+2/YpzmjVkFAQdNZue0TnZTvCtj9DKAPlA8kU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Thu, 20 May
 2021 17:22:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Thu, 20 May 2021
 17:22:23 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-ujson: fix ptests
Date: Thu, 20 May 2021 13:22:14 -0400
Message-Id: <20210520172214.1064122-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY3PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:39a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 17:22:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b3345ec-4a19-495f-6b8d-08d91bb3d4fa
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4862:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB486249501B3C59E2E7A4BFAD9F2A9@SJ0PR11MB4862.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7DwESBn2Xz04sVsaTXDkmu4t2xuW2YXn8XTdA1sMmC4VsokYFDdqqhkOh15sj+00TbD8ID3Y3WdAJq5hi0Kw3TLlejAIKGyraEFlzvhsGhCpupRAZF5w9G8HJv/uBFhHQlo9TOtOeTuuxp2kDP4xQ6V0XwSrnHzM8juebDp+EzOlaxaWxuZhUuHOmGurbcsqd2Cy6bZHIawr5FiLn4/yAaKrcjKAfZus+JDpc1xeaLU/TIUrLydFfEP/IvkaOqxod9fjPEVMG+D5pRCR2XQobM0lR7rzSvTNekvOTh5j+Cd/NLP/KuPbl7XQVn79YYcA3dNs9ZUAHLOHO+ijEdGBP+mED/1nfCDCYu7wEiZDPn65RRNP9KV8/YU6uZG8tr1CpIDJSs7zc08UR77JUk7Kzxu308tFrHN+yT3F+ebC7Wc5atVMmhDP2ad6HMfge6a7MvFZb8gdnG2jisziAE6hjR3nRdAFt7aKc7HnAJPIMUdbYe7/Eyvm6fBI9AaBDGhO9R6iq2+1fMVH68GbT8XziHa0WkS5anZH+n7PTHJ/CgqNE9SfXLZmoSaeBb75pQMOtlIBNyoXswPyHb+sEw+RFyvzgxs0rglTffalp+Fck2pl+bN4uieFQoNYRJWaKBE4M0xxM7k5Xg3d4CaDG4FMNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(366004)(26005)(6486002)(956004)(8676002)(6506007)(2616005)(44832011)(83380400001)(52116002)(66556008)(66476007)(66946007)(16526019)(38350700002)(38100700002)(186003)(478600001)(6512007)(6666004)(6916009)(8936002)(316002)(5660300002)(1076003)(86362001)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0basvVqBY+rSVi099B6p1ykuDUbOzoAnXbERXHwGqfMBdACJ+36yJ2EHFHEL?=
 =?us-ascii?Q?zLO56ECcTH75IQ1jw90Ikkrd1vERkHGJQp5+5kyvIBKQ+FUjZ7W3UOMsP5zr?=
 =?us-ascii?Q?oo+MPGudXGzLLAw81A7gqK+JHfXTCxXDxsHCuiNwX9eTIrGmauhLUq2TSU5K?=
 =?us-ascii?Q?+zUL0Tmv0lc2TNFsKkmXqKz0k7gRyobkTcxsaxxrBzi7WQd+CCFKg/F/nrY5?=
 =?us-ascii?Q?C2ncc/pOhmDmTcsQAvRD7BC5Gkdm1E+JmloHuYCj8N1Kng20g930787P3JZu?=
 =?us-ascii?Q?69nm5a689cjZdM3i0tZd6AHSEw/OH2HlsliFxIWdsCdJI/gfODGHdbvaEygY?=
 =?us-ascii?Q?ZmBlzhoq2ITchHttYCGzDsXANRy3N7IvrF/E92ZuDg5RCNjnMJFD85n/oWbO?=
 =?us-ascii?Q?NJNFy5pmdSrj7GqdXotFgi5pUoxqTXAPjTVf1io4zJfJhiNhA6ZFHImjLkqR?=
 =?us-ascii?Q?y9JIjnqu2utEfOoPV3zrsXBElNHXIUZPPoUHRn7AZfsOiK6DAjwOY7gn055f?=
 =?us-ascii?Q?VU+mgTzpIg4UKWpx+xsY1g1+Ulf401BAKTLhoPdOU4sbAPrKLphmTe6cv+rP?=
 =?us-ascii?Q?JYkZ1Y8DZJN2j2ohBagA1OSBoNYPJaIPAW2DRB28Fg96Ndw0M/TiwrglMe/n?=
 =?us-ascii?Q?kN9qOC2p9rmRqOr8hSLg4pE+YA51kdS32frwMh5NIjZpmmwj1P9fdpfhaSb6?=
 =?us-ascii?Q?na3ebO+1NngOUSBeBe3BPdQbGrvG72PGi28i7FvfBnggeUsR7WGUuBSORWtc?=
 =?us-ascii?Q?F2R9EsZRmMHeotaFYEjzDsyIW2rTj8i0iQ9cJ7BS6ZMALQDmFatL643AkK1p?=
 =?us-ascii?Q?Wex7zZvM3PfIxPFO7h7W3Qf+VPMBDRqOMIVZGYX0qy397nLUSuato3NWnhxI?=
 =?us-ascii?Q?6QzerSRcyTyAbkGj7AP3q16QQz/YrL1SJr41mroP9LVUvBplSAU4IdThVFCu?=
 =?us-ascii?Q?ETUqKfADNpHmuNz0MD5lugXSn+OK5pXAJqYFWsuOc8fGlRyqHAR/z2p9D4EG?=
 =?us-ascii?Q?xHKP2maHtBCphBCkL+PIhz9qHawdNJButvR7Gj2O3tIMHKva2TPhEo3LQKDY?=
 =?us-ascii?Q?bNRRv9HXKD7SQRQzfgUfr+6V8yW3frcvKrSVSNQ9cOBgFcgXDc8I64jbTCIr?=
 =?us-ascii?Q?9+9zEFe4ghuRyPzgBUJQ2SSjy3od8ZSGwZeznaBxe3c1gKPztvDC0SCFaK6y?=
 =?us-ascii?Q?FyHYqahrqoLrIVqtMtNJ8UiIckHCdpQVO03lE0XZgvUGMqhEbYefOzvngNNA?=
 =?us-ascii?Q?7YlIT/W0KnUyyyYQy+eJT/QBrZePGM+SR7jlCl43d9zATbRRIuITrT7jHf+s?=
 =?us-ascii?Q?WiBMACvB8YV27BjIKkn8gbfk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3345ec-4a19-495f-6b8d-08d91bb3d4fa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 17:22:23.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izV5hXiNY0mmuJzwixC1j5oNV9+oTgNdLFuUh4U84y+YKNRmWkfWMJsF9e27kfJAdATBx3nQrk/ZsimrheSZrPZRRHo4m6ZD+oQSto/JPQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
X-Proofpoint-GUID: jAkADG4cXXOiX9rLVKBIFC55An-woZ1T
X-Proofpoint-ORIG-GUID: jAkADG4cXXOiX9rLVKBIFC55An-woZ1T
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_04:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=982 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200109
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add python3-json and python3-pytest to ptest RDEPENDS
- Correct test file path from tests/tests.py to tests/test_ujson.py in
  run-ptest

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index 1b3914647..b1539453a 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 tests/tests.py
+python3 tests/test_ujson.py
diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
index d79206fe6..43f286d16 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
@@ -20,6 +20,8 @@ RDEPENDS_${PN} += "\
 "
 
 RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytz \
 "
 
-- 
2.31.1

