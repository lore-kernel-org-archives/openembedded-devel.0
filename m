Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.529.1621532495596007791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 10:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nncGC91o;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0774a447fa=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KHYA4b015819
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:41:35 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 38ngvn0hj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqp2LlnmO7w8O/B2d/RjkwqIEo3wwwCp78cstBajdTNzfl7sB8X2xiXUp1PA2eYp5s4epfoTAGJWjFCFvjBlL/0hXiDOwqjj35DdDjKfarFWeDrPvW/WCFb1pnXKUnK1ruhgb1sJHb+W+JM1zpsYKLmJkI/35YpGm9wngs/4zKrmzx5awJX9JYQ1rsATc8sWv0IDY9S1pO58j/dFdffthVsy8Y42lUZWuVsEmqdQeFduVT9qf9pzBsd2x7a8wmf0UtK4gxQNjJIuzMO8r17hkb3NILC1KBYzEpie2t9O7LRjbecoc70JE/2MdV1j4SMYG3xSnYl2oVXAzxIHHo5ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeYd6UtDHU9WnMDU1HFlYyKO5gExlDXN+pl1GRGLivM=;
 b=iAwWYCzBsdgMyqi7Ik7yfjaqHihHqMA941XOumDp8QNePqpQcPnmuVUgIKJ/Q1B8YIccIZPqAYCI1P+/DhILvGkX/LHE3nT7E6zeiPJtUi7LtiXC4i+vHcqliPf24HKlobzc1kf0PjCqLrltRkdmLj4ogH8/UmI7C9dLYSSI1yleWGFXxeteT1JWUShlf8wVQr6lQDXLDKt98TszqV1BDo4j3TqWB2BhUxWmeSmAJzVjC/tX41us9nGAoja3hVXpicSJw74Z/fud5i2g+uIrkg83KD2Zxcu7bxkPX42nJ189pEIk9647Ta+pU2XQmHO/5qkoMhv6GiDXI5SjwzLqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeYd6UtDHU9WnMDU1HFlYyKO5gExlDXN+pl1GRGLivM=;
 b=nncGC91o4XSpQOGDD0o3AhvhvuECMJTF9eVeayTQ5OF/KyzMTA7XmcTZ+zH9m/tVQdFp+ADQX1Gk5rULr9yPXxCtPwu+vDuX7lsU+4298vc/kfFVvyDeQed2lT1rqHB0Xw5j2p8OWoxXrUESyWx5l9edlW9+xsB+m6t6wX7I5gA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 17:26:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Thu, 20 May 2021
 17:26:25 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v3] python3-ujson: fix ptests
Date: Thu, 20 May 2021 13:26:18 -0400
Message-Id: <20210520172618.1065633-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Thu, 20 May 2021 17:26:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ffca092-be84-45e0-f6e6-08d91bb4653e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
 <BYAPR11MB36719E99791753117C95D01B9F2A9@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 xJmCPYOlyh2/+J5YH+W8e62Jw4nKODsLq9bBrfDusmSLx3H7Ou2QWG8imVKRbfmorWj2KS6rDJ4mi49O42AhSFGSh7MmuROiu7I2BnlcL9aznt1nYfT4vutEp1DFAEBZ6Pz94KAhBIhSnI0jqRzCPru7aNNEDId967J42ImjdCdq+PHOmzQtkZrDeNv9Pe9+Ml985ZPZtnsES9rGfIIx7CD2AzZ/VD10MTUEWc+ZBJW7UlRlRsO57NsghbEBJ/kSAcEf0IKN5GoyVe+tWtoyA+24an21JPjuVsQF+fTb/SOopTIZpNCg+zLU2aKLlTCOOoK3ToXIdERKXiS6DspOFhZq0L3VrGWF2T/S3uxvl6i8boTEgWoxVi36IRz17HWH2Bm3tbePReKdkmRFmmhuPJYudd26W3/a8IId9XFquWgoVs+z+RiwkJXVgtD4KwfV5dBu0FFkj7rmkNi6WXzdEwxSQGL0JgvM+btVgwisMP4XO27goA3WJG4izSeojWv/BBaSSsYQ/u+Ex5tfJS7EHm4aVchTavhFMbGce5YDCKQL/5kthEa1kNMEdaGMkEUkYraA1vVoW7LuYD5bd5qwD99R3XAqWRKHWQ+hKF7Rp6pF4n3Xz2VIUt3ppGSl13DBUf3Z/j4P5JA3IbBjAV80sw==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(478600001)(38350700002)(38100700002)(2906002)(6486002)(6916009)(83380400001)(8676002)(26005)(8936002)(6506007)(66556008)(6666004)(66476007)(2616005)(956004)(5660300002)(66946007)(52116002)(316002)(1076003)(6512007)(44832011)(86362001)(36756003)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?rGkxALc8n2dGN9K+x0t9/XxSKd4T9CxeM0+EQRylt0q5OD9lsG1FyGZLTAMO?=
 =?us-ascii?Q?01xHhVHBNgrb/WZaLeODChYFD7pUiH/NIkj5DipxbgA4OT+J7JzkgSBWoJZt?=
 =?us-ascii?Q?nKr/zd+PCRiDR8Woqd3qLThQ8IaqYqgUbRw4qAAVPgO/VFeFEaBAWCXBQNdv?=
 =?us-ascii?Q?jsMgZ0np1p9vgBljDr5FbA55YXFs828BiZYVgcP6OHwIM8MiFWwv73W4zfSQ?=
 =?us-ascii?Q?uy4agWsefrHfEbU+CcUnurDPj5HDGf8oBCfkCNSL4NA+WlxDob15tYe+OwGo?=
 =?us-ascii?Q?nV0MJ3YToRT14VPesBb1hZ3YbpjpK8gWs5ibaYbs4S1YakrEvmqbtXe8PIC3?=
 =?us-ascii?Q?mA6EUby5pXEMJTAs3R3dA0yz+t/TEPkfMLUtbvREukCBBnpxYoosIrLjGyDG?=
 =?us-ascii?Q?QrYf0qX2cgOr/VSfgsD2WhGhn8/Rok/pW0yC6RhXSzEESWsGlgs98WoFjzX0?=
 =?us-ascii?Q?SjcoGzJno5L8sDCwiDvGY0NM7aEE1Cp5oj66LUsn6RTzLmp/xyCMr7YDYWEe?=
 =?us-ascii?Q?zrLtlCdnt8t1bq7n6+3i0n6sydHlJHJIBNmerX8stz6RUb0bXEBVRzjtrlQM?=
 =?us-ascii?Q?m/dlw6Ij/0khEZa0+a2Tn0rYZB6aQBqA0sP/UrMoSSS95pPANGBMD6WK77eC?=
 =?us-ascii?Q?ENnWs4adFjm+L9kTeEsFeNBcdREnEBq+0yoP1L+/wcQ8PhNlqBdo76cLEj8D?=
 =?us-ascii?Q?ans2P+LCa+mBYsyADb+vHPj66de2K6ExuYla4wROOOiaec0bDnxCdzfnP3Ad?=
 =?us-ascii?Q?xOgR3WiYV/IQgjM7e05TWlZ1QJhMvVWn0lTX6fu2dTLHynG7xSMA7DKWGrm3?=
 =?us-ascii?Q?TIa5GGKASLk+gL+BpcKNuM6iwgebrLuDfoSKO8aeOC+UqyK862qKdxncljH7?=
 =?us-ascii?Q?lmo+i8HO0StbjSzpyFQ1hboed1G+WTMDRtXqXWzXhGNKpLlfk9GDO+wcoN/O?=
 =?us-ascii?Q?Kspy90mbJ4u9ElRSTpad7t1FmnUhUsTP6/TaJdx+jyPbMT+U0Pmr+BT0XLCC?=
 =?us-ascii?Q?nTVxwEZH2h4mjsJ1flr4jTLfMyuagXyNkWSYVSpmM3ya9yX19wA6OjuUmybn?=
 =?us-ascii?Q?R8diORpxb3o6f164453O7jGY2QvEA1yLn93xNK/jHJ5cKK4ynQZ26kRE0hGB?=
 =?us-ascii?Q?G+VNYizmeWskik1LApevRFkC/CIn0L8LivWQo2f4BOt9JSwZmBkXBMUamSRk?=
 =?us-ascii?Q?65iMZ2/boXoOxZoMeyizDF9agGWLDTTD0SaiHrrR4Oo3zQy0nsF0feKVWpF0?=
 =?us-ascii?Q?510k2mF42p8uUWHKi5MUVtxTPl7Yqi/Ghv2w7Q52EYR6fSPdv+E4BJm02Cc4?=
 =?us-ascii?Q?ZadECnbA0vJJDKS3cN5mOI8w?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffca092-be84-45e0-f6e6-08d91bb4653e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 17:26:25.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txMpbv/my/UWValyUKCRkrBpTz81bjw2ewJ1gzUf0JYotFnkB3nk7lMJOKkVbyhMHD+lFwIgJPAJw7DT8VSHXBoX8BOKm98aqELg7Oa6XTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
X-Proofpoint-ORIG-GUID: JlHjUlYnnj-hm8nCe_baTLXbgsWTMnAI
X-Proofpoint-GUID: JlHjUlYnnj-hm8nCe_baTLXbgsWTMnAI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_04:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=982 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200110
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add python3-json and python3-pytest to ptest RDEPENDS
- Correct test file path in run-ptest

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

