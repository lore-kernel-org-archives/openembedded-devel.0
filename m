Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.836.1622735655083138520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nRRnJoQ4;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=178868c7c5=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 153FsE49016212
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 08:54:14 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 38xhk58pys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 08:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzPQfBwc2kXThNYCEVcDdC4Hjrb6xrVeeXrQG9RiOuR427WfdmeQ2EtDEM2EU8CeTXZ6SC/lJ5GB1hg6BUhwNhMnQqIJ3pP+sKcGrROblf5GxXtWORRCfA6r0Trl0o+cbmL+U5KuVwEMnfCuL/ghdZMaeqnf+C5dTn/rFYyVFpGq/ckuYsmmNFp8je+rz4vhNRbpyumgSrNdyY3U9UauvHF1/OtmJOZu4B+BqYmi6cDwTXHOY2Ny61EZViMn1Dzx0wzzG7iIsE1E85gFTiOXdEKai03WaJJzC19zJvx/GVlSC3P9K4/h5dn9m02aqetASkC1yYFXbEu1YBymjSjSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox4ERDQtyP6+8yskKFeUgxx/VpKCngfjtgWX/SPgkkU=;
 b=CH1tr/TlmsWMoHKYms6j70StvDhb/Ox2IL6yeX35wBV+Jp4jzP9ifu0fAJ09EykNsAtqkQJd1c2/E/HUKJihMkUnIFZUTZyWJpoe8px06c9qqSpbSvA786enRqRt8+L035dqSvC2t+jFo4hRa7KcRa/DCZeeNWaAlWxhIiWJG8MbB8IJb0+p/soJMX2dsTpVeErSMFyYmZ57Y3SJXFQvY/BSo/xTVKYDfrsSOr9XM/pMuV1EwqqS5stvNecMMCkp05S3toWTGHVfiEZM/EEY4ry5HIW6tEsCGF4Oq+z19CCFX4GNYyBCsJgxlI+eYppI5FeIxzrJNXpzKHWQoYSupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox4ERDQtyP6+8yskKFeUgxx/VpKCngfjtgWX/SPgkkU=;
 b=nRRnJoQ4T085TAxxmO4SFi9nnMdiTjUO6+kiTEHoY1ugOGJFQtPxidFBA6Kptxzci6yxFCiVAzyJeKqhfFdtsvVp2KBWtUoYccZJZIVHwJAGGqtFIHaCTHnWYHPBvI19PAoRo/iQVHO+gloSWHJnNGQeDkhYgHaz8vsn20dH9xo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3717.namprd11.prod.outlook.com (2603:10b6:a03:b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Thu, 3 Jun
 2021 15:54:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 15:54:12 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-yarl: backport fix for test_url_query test
Date: Thu,  3 Jun 2021 11:54:05 -0400
Message-Id: <20210603155405.297155-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:a03:39f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Thu, 3 Jun 2021 15:54:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0724d9-1daf-4dcb-c440-08d926a7d503
X-MS-TrafficTypeDiagnostic: BYAPR11MB3717:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3717DF9ECCFC72C917790D6E9F3C9@BYAPR11MB3717.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Do0oHZ02cewht4kkbra3vnIjwjyMV2PLg9/JdkxkhV62nxoVqIBQNJDIx7ezSe2Ip0mpSLcNhJe6WeK8pYrz61kbuP5HHDoCDoJMMhodyUt1vuiO4RVcUtgFwcjcHCsPKxe9dtx8hDOKV+Rr+njXI0n4BmQh1DLmxtZZP625ehgtXrYLu64H08lswWMtCqh+SsIkJdnX4cXywDdAFY3GwsD8aCQ2Uhb1XnLn52KUkjalE/WCIxw6Z8Hb1JsslzXxP/yt1QLCtE/OIE899mvrW5IFKNYObSRPSFiLUTOuRFcsAqQv4Q+gjM9eVFSQVawai8W7WrGYFvt2GfJlYNOYsI95ImSO6+z/bmRNpK/9XMogZ7NGNpIAA6Yj4MgpEJ2+22SxiTJvKfn4oJOvPLR5ZkJ25DqGWD6VRSCbAs9I44YxutlfDwFgJ+jD2bC2cDaVczB4qu4d42UiFeT5nNKQE1BqfTgJk6/c8OUnl82HzV4gOLVG9lSeTSHoJ6SRoZz9Eon8ge4OSPo4PmnLYtlKSbnBSdQvaxM31H46wtTSKOgmzsrB11z+AeqpalvjrekkJ93IO2gr1YhdxS0FA3FlKSqLN2C0hKuOCrRkrGKVH4bY+3zlPJKRR+axkmQbWw/tq8n5VfQoZUQOXgYPP+2L51KSMoo86V/1woQuQA5LGS7vEF3V9YDV7NfUtyPYRnrPhi3kGNvzl4UFwtfXp4SJZsorlB6a4qBVxoHBnYULD/6UnsLL/JPOB7KojDjO4Z0wOOnXEPD7HUbTq0A5b+MIOzPLRrc8rx9e4BFvWvE2slET1S8fZpbdf2WyeVCUh4YcXkQ/GvnPU4C5msJUVVmWfCWq8yTCuT+2sh48+jaASic=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(6019001)(4636009)(366004)(136003)(376002)(39840400004)(396003)(346002)(269900001)(5660300002)(2906002)(66556008)(16526019)(6486002)(36756003)(2616005)(966005)(6506007)(66946007)(956004)(6512007)(44832011)(66476007)(478600001)(186003)(86362001)(52116002)(1076003)(6916009)(8936002)(316002)(8676002)(6666004)(38100700002)(83380400001)(26005)(38350700002)(343334004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JeTXX2Dplt/aQQy0d4ij4J67f+BWh60d7/y8qapJTdt/Bq39Ika/Hljl0Ag+?=
 =?us-ascii?Q?MTBEbKciStYxyKyQkYwDSCyYXxB95KJLeKgsoORjVtKFINvgkxufpYyc1isS?=
 =?us-ascii?Q?sMNRYs5vCQHOK8ncjK51Y/0GVGOQitxdc9OSH27QNZgZ4/WSRSYVPvNEVnER?=
 =?us-ascii?Q?zadzcxA171nsj1r/X8nBI6Tlwr3VYX55VCCVfuN6aJPpRh9AAAl3XqrSb/eO?=
 =?us-ascii?Q?d1zsBVc77ok3VOXyHwDALg1dQusEt04l7S7UIzBFk1ddzc9rWZ3+3lT0Q1Gp?=
 =?us-ascii?Q?E5UKQLE0r294umpLtu3hARu2c8LnlGp6eIPyK6mtUaX3r1EOIoy/R7tXwqEd?=
 =?us-ascii?Q?4vK8fumDc7HNjsM8QKKLXO3T1TV1kIzstvTKoMzQqPTTUDb/mVW9ySSAZLO7?=
 =?us-ascii?Q?e9o5NrNo43NKX57/IIOOvtzUGd/N0J4jBa+flg391tOWdsvzeR9+p1bSXvjx?=
 =?us-ascii?Q?vXcivZQY7elSAgi58NK30t4F5nFeuPODuqD4sTsPV+8GdOteyUG6N6an17Op?=
 =?us-ascii?Q?GnfxhLTkaFcvJsAEeWDo9s5EfRQ4Irlx4Fxu6+8WfQYqSR9zv+IQ13h/BaS9?=
 =?us-ascii?Q?jKFYUjAUEMSJRlnjZlQpUruEvEWKUmQgX+rPWG+t2FIoMg0xzyu4qxv2ndly?=
 =?us-ascii?Q?HNKj0Wgct7xLa+3lRwFFQvj6R32USzT22xQhUJV3D2L2ToeFqVur5v1TMwnQ?=
 =?us-ascii?Q?B0t5poKiO1LAnmUIxphJ/aycPcvuuRI2smVZxVKSLs75B6cIkJUd6haQDAO1?=
 =?us-ascii?Q?SBcWjvOl+oFVqvgMnFdcobMWOL+haK8lKbuBjoAeKYAkSjdEfVSZ36bHtQja?=
 =?us-ascii?Q?MHYpF/vlXqO6YhJKL0NJvngJpw/sPJN+er/Kwvk/96MS6081oX6337vV+RLO?=
 =?us-ascii?Q?GtzOoK6IzhdLEK7TqC8f8jSrrJExqhfyF9CV48TOBnttTig/i+MEUGutc/px?=
 =?us-ascii?Q?Og0R0jKhJpNssFM0XrnEdHN3G8TIZs6gDQcVKVHMVc2tUylWYZd8YB9Z4df+?=
 =?us-ascii?Q?n6zZ6ZFmyyimTVl4aMSe1IpKD2/btSV8NWpfp2ayr7ECgZhZrP0o8LsLfB4G?=
 =?us-ascii?Q?IsMRzTTe3+QBomezHps4n4cIsTKKjnY1PNgKW+P9P3LI3Xwn+Pom3oG//6PD?=
 =?us-ascii?Q?p6WBNiiuTousWmsMXaNkTZmGdn3b0k4CZzJDqaOIx0tMvnEg1lLmQDAm+nK4?=
 =?us-ascii?Q?SQXB21FgURSCZIC4zWG46c8oEq8e53grYqrdACmL7kMh01y+Vn1aokK9xTAT?=
 =?us-ascii?Q?U91OaUgNg3nHG/jAZNSVnP3ZzkMhaka8OiYbb/aIsMcobUDTPalaHgIjgjEp?=
 =?us-ascii?Q?isNM/aDKk9UIt8ikrrWWLKUp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0724d9-1daf-4dcb-c440-08d926a7d503
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 15:54:12.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9gtnoHRN25AnkjhuTcsmCMMGNMc/fHZ7zb6lgr1uDR0GPvMUNNXhs+Fd/O1hqec289R71waKQJdPnRLQpo8MUoxmEW3lkIFAuxgsiUB5H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3717
X-Proofpoint-GUID: T6tLUw1mEnUAp6fHG1_TeVRlnFqw78s9
X-Proofpoint-ORIG-GUID: T6tLUw1mEnUAp6fHG1_TeVRlnFqw78s9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-03_09:2021-06-03,2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030106
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-yarl 1.6.3 still tests semicolons as URL separators, but this
test has been removed in master to avoid failures due to upstream Python
no longer supporting them by default. See:

https://bugs.python.org/issue42967
https://github.com/aio-libs/yarl/issues/563

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...p-tests-for-semicolon-as-a-separator.patch | 45 +++++++++++++++++++
 .../python/python3-yarl_1.6.3.bb              |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch

diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch b/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch
new file mode 100644
index 000000000..1a9d5d02d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yarl/0001-Drop-tests-for-semicolon-as-a-separator.patch
@@ -0,0 +1,45 @@
+From 47eabc562a8883d757e3cff487c6c6e98def5a21 Mon Sep 17 00:00:00 2001
+From: Andrew Svetlov <andrew.svetlov@gmail.com>
+Date: Fri, 28 May 2021 12:42:17 +0300
+Subject: [PATCH] Drop tests for semicolon as a separator
+
+yarl 1.6.3 ptests check the use of semicolons as separators in URLs,
+which are no longer valid by default in newer versions of Python. This
+patch is in python3-yarl master, but there is no release with it yet, so
+backport it until there is a new release.
+
+For more info, see: 
+https://bugs.python.org/issue42967
+https://github.com/aio-libs/yarl/issues/563
+
+Upstream-Status: Backport
+(https://github.com/aio-libs/yarl/commit/47eabc562a8883d757e3cff487c6c6e98def5a21)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ tests/test_url_query.py | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/tests/test_url_query.py b/tests/test_url_query.py
+index d2ca640..07f858b 100644
+--- a/tests/test_url_query.py
++++ b/tests/test_url_query.py
+@@ -60,14 +60,3 @@ def test_ampersand_as_value():
+     u = URL("http://127.0.0.1/?a=1%26b=2")
+     assert len(u.query) == 1
+     assert u.query["a"] == "1&b=2"
+-
+-
+-def test_semicolon_as_separator():
+-    u = URL("http://127.0.0.1/?a=1;b=2")
+-    assert len(u.query) == 2
+-
+-
+-def test_semicolon_as_value():
+-    u = URL("http://127.0.0.1/?a=1%3Bb=2")
+-    assert len(u.query) == 1
+-    assert u.query["a"] == "1;b=2"
+-- 
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
index 01682a46d..e0e262646 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.3.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b4
 
 SRC_URI += " \
     file://run-ptest \
+    file://0001-Drop-tests-for-semicolon-as-a-separator.patch \
 "
 
 PYPI_PACKAGE = "yarl"
-- 
2.31.1

