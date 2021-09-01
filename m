Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6730.1630497626854653101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 05:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QQo5EiPx;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4878a39683=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 181BohL5016988
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Sep 2021 12:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Mbs+ccGkGAUgO58COoLA6VM+Bgi1VwkpKAZDE6WjkJ4=;
 b=QQo5EiPxmM9qZxAgAZa5TTOfQsnFOPe0spCYwuz+aFQZc56sbQCWXr/wwmiTNusbMqSt
 3NNaKv9RCtYJF52g1KxDwYB0cYZYbPmUp7EnCNFyp46pHu6pvNOQtc8W7ufJkNbN4VcN
 GpxLRHpothwFPbMpO5EpKPN6mI1aK+3WTJzYGpZgq95UOnRHkSLgPyVy8fQZHamA5PPc
 yCiV+Vgu3C0qKhnwZWeN/I33xLU26u5vvNSNe3WjaXFQAzNOFqUG4yPp94l9D0cV1VVA
 Bv2ajQCeGZG93eK/P56fNFGNhEdDIAmyRxSBY8swCAIUAJM5yM8TzZM8jQPufvbQePjc xA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 3at08a09qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 12:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRbOqH3gjk7uRukEYw0x9IAanhqYTqms8WA6kXspOYgT725IEeZDN22sxVPvVJFLbBICv8wmDNRztEv0pkZM1F4ZI2GOBRsdDmGk+K7S4yGSYvFCR8DEyQocLYO/vNPos9V8Uy7XjcmxSWRYK5P9wigQVauMhfWc2gBEMpTpFoIveuuVnTTbQNRRB+5qNXVsNFZx9Z9cAriH0cdK6p8qm9vKmFKkzKlvfPkA/8h6sMHg620+lOzMQbMwtRbc2LB6S6zuHiLDGPN4YFFMg1qn6deM7MNBJCCpHT9gsKhtDnnDkfsoh2LpSogWRYNkCxc7bjJfEPNVNspgxO6ZoTc/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbs+ccGkGAUgO58COoLA6VM+Bgi1VwkpKAZDE6WjkJ4=;
 b=bEzhCwOvE1sBn9WCAMEm+vXBH4APmgOgLmBSgfdnufkZTGJZmeqQ2/rWh/50fGf7JDpMEy9aFAkEpUErDmzxhAv22t7t1m06t4K2lufywi5UjI9LE1jLe/RmLayrEZ4UowvhAhCKWLrzHm8qYZyqXpGeZJDEXdX1MBy+Xslo7zmkLdM2w31Xlx1iKXgjzNYKbRFdF+Nnj8S1SelKPS0GCMKj+sHl6sxQy3xI0PIl1sphf2RYKFpWOoYOoa1FxYYdSn/yahyW7djWsFZJD2NCiifYgRhKMEEp+opzjHn5ivwoDKXdBgvM7lwWVlNvZRlbEw6VWGMJAFTQB3pW+Bs0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 12:00:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 12:00:23 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pytest-subtests: add recipe
Date: Wed,  1 Sep 2021 08:00:05 -0400
Message-Id: <20210901120005.775345-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BLAPR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:208:32d::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BLAPR03CA0056.namprd03.prod.outlook.com (2603:10b6:208:32d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 12:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edc79e50-10d0-4286-94a7-08d96d401421
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389468C78DCE04C6298ACA789FCD9@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7d6ougRXFGTA84z39+LkM/qm8MhzrOcocw4i3UgL7a9FmCGfP29zfQ0LMnBSkKf0cCR63Y5SsKzlCougN1STCInGSeZEqMmUHgVD2jufluGj4H5F1pDjjMn4gjUddWWYrNI1bQBHt515eI+t0zCduak8izzZvDCmS4A38srEpt7rBcaQDjSm3l4qV5BFi9HUR8ElBf0lp1yZ657ijqKAMx5ssi3SxtqFcR4gaUkP7dqw8VplHKxXitb+Z0ZwGu3TVUkPRbDWareWWSZru0yCvu0yxr/OfaJ5AudRIHCZSL+O76Hj6lCrM2ySOEXDmsqsoDi8Cua8/32pAr0nwC0VlBNO7OQ1DcpkyqLLekpDMZK9A9YUA1F0L//85CGhtQu7Q2jIVctsur5uB5Si/BEBxyILRIxO2n9/BcQrvTHGgNgK2WrPqUHp6NxjLd+FcNsZNtxki5G2+XaDJYk8JMRoFASt0j31b9R0VGJ+iU0r93Qh1KZJTs5dYzedDi0QU4sglDDOB9suwUkikNsXCwwOJ97w+JvMVENXP5Ut/I9x+15iJ3PVqSTk/ZNrHrz76xx8EbqKT3uIf80MuMwBua5zOjzewFJrW/t9UmkkBVPq1fc3f3lzF+nHx5MHSgSJP4G5o+LyyEXGOC8g9TD0DuHzEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(366004)(6506007)(1076003)(6666004)(2906002)(66946007)(52116002)(38100700002)(186003)(5660300002)(36756003)(66476007)(86362001)(44832011)(2616005)(6916009)(316002)(83380400001)(6486002)(8676002)(6512007)(478600001)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gomZ1zpGubMQpVd2XhVE+yz9oMHTxLLMOUfZI+MdcCuuyrtdVr+5oxDnBF7R?=
 =?us-ascii?Q?VVZ3oMUx3DTbLim2t3j7KW0pt5sWH9AkS5MLYAJB3CR19XO7Gc/gKQXpJKs4?=
 =?us-ascii?Q?wXerKa2vV9z+0R7jQrpzSKV8L5X439guTXP2ip8YL8prt4cGdpYSC7Be1Dkh?=
 =?us-ascii?Q?mnJWP0W1AjS+G3J7ATPxjtxvKh3vY7ND9koqtNU8tM8T6dO/nwBj7jsl6WJt?=
 =?us-ascii?Q?Hku2tEkyU15IS4R8b0agUkVt+BKf/exbtYKJFh4538/wB+X6AtWOC2Ew2KzF?=
 =?us-ascii?Q?O6maRo5PmfpBjMPF9Vjbd5KtNjRhJfoLJsrE2VY0+0SmhWCxdgJQIPJORA/K?=
 =?us-ascii?Q?jSAsrW5BpI5HeLj6tdqrorGsopT4ZJZ6V69dKkLDKkxxFuvHS2DsA2WFHiTm?=
 =?us-ascii?Q?l/MIVkd+7NZ2Xak4OX+EzMyd5julLFA86ZXkHqAGTVggME9/yVkIUHLjV2mS?=
 =?us-ascii?Q?XgMDF4/g1/iJqhMz9ZyCSDPo++ESATpcirvYR0t6ZnQBVnRO3mQn396sq4Gx?=
 =?us-ascii?Q?EmSsbXdnnyooCAHIRJR7+okY8WniVMo7N5z5D5p9qOQEahvQPGT5+0XKLWZU?=
 =?us-ascii?Q?PJWYVF+KMx1QtF8qmXC9AolDgf5GV7d8KgrwrMsqwB4PYyVe/uncK9cCgptq?=
 =?us-ascii?Q?ycwVZ5eRB2yTM9LJxE/1qtc0ox7KOrxW7p87FXAUCSvKfsy/2+nUkYtTLc3e?=
 =?us-ascii?Q?4A3M13cZCvSzC202+2wfDz6IZE5JG6ZEnC0y+yRBcGiS2JEUO7saL6MxbNax?=
 =?us-ascii?Q?eXzVjiLrb+9Vh4q7q5cSk8GJOYbBt9IgcWAEg0CWwed+FrJerioaNFRUCy9G?=
 =?us-ascii?Q?2R14HPgFUKoSW+qwbyEj0ALY7yWMYDxvMe5FPb0HoZ4lkC8FCKik1gEk6VQH?=
 =?us-ascii?Q?wgj62+/La+LWVP52M7t5ByatfIqpyoaL7udIlmTplN5BnWMocPPJlbrnOhxv?=
 =?us-ascii?Q?4HS8mkQfN/pQ12qi2t4KGS0QAuU6pCNokizAlTxLhEb1BLk0t96iI8j8qbr5?=
 =?us-ascii?Q?o0Uy0+T5QJHyW/RlajCcfwCOzhjXqM51CCSnkLly33E365030Oau+Iy9qIjg?=
 =?us-ascii?Q?uZm02Xh3IJYo+BMX5lLA1woq0tidQ+UpwS/P97yOqFmmgkGWVOtUVvvAq4iR?=
 =?us-ascii?Q?KfUzlAtvInHQh8NrJ7N9OpBN6xnZS0RDjNjk4XK2Zqkt1D60m6KeIBZVjAlK?=
 =?us-ascii?Q?S6LIGp+/B6bMtWF7uhG2+onhog7klDnbD50H+fIaFW9ENdIe5FDT4GuEBeJh?=
 =?us-ascii?Q?2vp5CKAVSZ3wup/vVuS/zbAEWLS8NAV9HhDr6DfZJi1Tl7Q8QA0VgxdAaDtn?=
 =?us-ascii?Q?i3YVsBhUedad8zAQFj2HVUv5avY5S0211Rw7mQ2xFMaBhPgee20agamkVvY7?=
 =?us-ascii?Q?00fPLsWPxQnQI6mcWRt8IrouOsG4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc79e50-10d0-4286-94a7-08d96d401421
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:00:23.4884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVloJK/thj8EqPaNyKhhY015KqeRf9d3YQ3/8m4Dtee9FDCuqYm1SFjaZgNBVUr1qEtaoMz0cSg2ktVKZ7q898gzbpB9JfH0swaRgjef3zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
X-Proofpoint-GUID: E7ZuOmwBFg-T8CdRHBFx6fep8lfzWiQ7
X-Proofpoint-ORIG-GUID: E7ZuOmwBFg-T8CdRHBFx6fep8lfzWiQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_04,2021-09-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=548 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010071
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Newer versions of python3-cryptography will rely on the subtests fixture
for their ptests. Add this recipe so that cryptography can be given the
necessary RDEPENDS when it is upgraded.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-pytest-subtests_0.5.0.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
new file mode 100644
index 000000000..c2bf47203
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "unittest subTest() support and subtests fixture."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
+
+SRC_URI[sha256sum] = "c62d68a84f94f8bc49bbb01b39392953e26a52570ad380581a3b2cc8d7eaa037"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

