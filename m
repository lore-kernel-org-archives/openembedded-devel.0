Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10512.1624374274749203253
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 08:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UGZEDuKJ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MF4EWD026323
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 08:04:34 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com with ESMTP id 39b47h8fsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 08:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brCZcA0U6sh1mmB7IYON85DoKSfDUyqS0XKjdd+0ivVIyQvyUmkffK/pLvvF+bR4jwvF6E/tLA6eLAMd5tU6krC51eENLBXUJAVOZlHn1rooYWRNoWG7rfDECp1xjxPYxpKWJKX0TstPhhio92OwRZNIPEO9dSFfw1x2tpt1GKNAMZWTbnO0KFns1I813JAjKXMnDyPIzd/pPg0quq/wFP5FU8z91dnhVhqqVZ2AID/oxCpk+Ewj0ro9dMNHiQ/T01J/rpZQ4fDR4asEPIPzmkf/OYeLNAU5Dsid2P/j/R2vM/ipjMnfnoXn/X6P/T36ZPttI+Abj6M957PblPGEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KeGGK+CBMOJXkKdzk6kITPg/rdlCiaVyYwlt5hSSYo=;
 b=DcEH0r1MWbH4fZ1fWroxD2OFH2jSjezT9+oQ3Ge0NMQWs9wrYaUli/0JJ76OrdjwdI4tL6+yhZbaEvUb5M+kkBRyOubtkI1pe5ScdXXwabLKo90ll3xkUyBjszJSDXMoHCrbHXD9PsZ87fPBNYtlwbsaULhX0oGX4X8IuVS0T33CPR3EiZvqnNFkkE704FUHh4hJyKfJqFaYdkXjj/90hygassjRLgldr6sf9JAbi3+BZKMH8S4tAo0qlRNbnFLJNq1ZXh+03yg/Tp1MjJs+OeMPMNr84aWgRE3TsCAZ3Dr1+aNiWarKGA9umpzScbzQkwgybMsdfUYU6EbJ7twpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KeGGK+CBMOJXkKdzk6kITPg/rdlCiaVyYwlt5hSSYo=;
 b=UGZEDuKJwWO/Q+lho5IoTwmYENah5BaePHYiGXWgVgtepu5Mi+EUixKqu7YuS28/Nk5hU8SjoYLgpwi7G9Ssc1gwMssTUG6xbEUy0lLjv3/X1gHmtnKK/j/Vi59yZmZi34FjS9BXU7ACDQw3WVT986zLJTuOUtesxMkcGE040TE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:04:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 15:04:31 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-django: upgrade 2.2.23 -> 2.2.24
Date: Tue, 22 Jun 2021 11:04:23 -0400
Message-Id: <20210622150423.310928-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:180::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 15:04:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b83ea77f-8c43-4e0c-a8ed-08d9358f0a11
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44016A5E9565817AB36F3EF69F099@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JpVqBaba2b4d19ntSAszOqIH00Cw/6x2/9kgks2Sh21/Wg0VxO0AIVoYs2zv8e9eqvqWrgZkORmoaLNoFUMO5FmFkUsvJnAd27CPl8k08cisu1cG86hMN0XH6IAPzlcbp4wau8TduQo9dJpsLAwF3HMfnKb77DvBIsvJQUazsrPnoynE++ICXenGNu2oWoCwRaSBLbDKIqfUuwnfZFdfmUe6R79PXjP1bfe21Bcyii+d+RlDq6LZ4KI5MsO1WXZFoABbq4ONMVSC4wBRMwecUyYVNMNf5poQl0ode1XfjyzZHgAZ4Bqkoawi3UN/s3r/dTHYJe8DXTSYc4amGv1LERembsHB/pNmFKgxbmtfTqVD0oHcZAGCUZORqb8oPFLolKDNfOgUMm+l/J0Nj2IFWajgAciR/VQSFfF1zj/KaENO7cl8rGgDg8X6SHc3c/l/TObFaR+/koeM/e51asQJaO1RVCAIu3Cw3HU2Vp1y/xeEJ8CpQg6iIogbVgk6/LGf2ccp162cG0wMg1Np9w2KivmsFA05pYnUW6XEZ3PWpAHvudGGCRL7KthJxPt2XMJIMgMDRqan9/xnGw+Zb0X9nLMO2hNndn8l/o0TlCSsYYe7JsnN52i9+6nMqt08odebwc8hfFbTDkVa07W3q68LXJZT0AMXQSh2/6MBUmWoPsyq9HX0R8vNeTMLRxoChzrntEa+3Bztm80iKzjeo5/h1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(2906002)(66946007)(6506007)(6512007)(316002)(2616005)(44832011)(956004)(5660300002)(86362001)(8936002)(1076003)(6916009)(186003)(6666004)(52116002)(36756003)(66476007)(66556008)(38350700002)(26005)(38100700002)(6486002)(8676002)(83380400001)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tmja3WXoqxH6wTM+5FCjEVgep2z6N5+RlWZBTVp7uMcpY4BuwbwjTvQOM6B0?=
 =?us-ascii?Q?R1aH8n7izZCnbTfgaAmBzMdSuMJwUii1RQ9rVpc0Le/qF7a1t++JgrTsqX6t?=
 =?us-ascii?Q?Nsc1ZDtQmq14PkbNf6i8DxtOVJV/zGzr35AdkgexsauHhdZegXy78sCFor2U?=
 =?us-ascii?Q?xlVWtU0f6qCTI8kY6YR0t2a4ekxDjjFU840GI4J1RA7VL1ptC3tcaztXiSx1?=
 =?us-ascii?Q?PNhdptAZFgzkFERTMWYA6dfwa9LML4qWbrv9sJmqoO8mf0JERYpTvbdCe3tX?=
 =?us-ascii?Q?7+uWdupukc6PFmDVNjctl7ZHXh/7+T9hlRDQdb93LMn1HU+LQPicCiiaFmMf?=
 =?us-ascii?Q?/Oj7I3klrwcsVqv3DB+oA2LODrZ8VGr9os3I+EifTQgOKVAn/ao+fqFd/ykS?=
 =?us-ascii?Q?6YaiWbwb8EO2460ocKP/WjQx2LLWraWVCFUEZ9ZoGWSa6nPku/izwnnkUl7Y?=
 =?us-ascii?Q?gQsKChW8rvGn2GmJfZa5gbL4TwQTl3xGIYwW/z7MJ83TvYBKcPKpGd5tC3l7?=
 =?us-ascii?Q?fNnYv1xpr/nEF8BfaOYumpjo4tqxwt+pN76352eWVcsiuf9cd/J9FREGfxsb?=
 =?us-ascii?Q?qAuU+YUoNcP407ul9O0QSopzWPKfl17tlUIr1ZQ743pycugrPvx2cwh5Bt4u?=
 =?us-ascii?Q?91VvOd0QbIkX/wOVS3VqmIBt2giKnBnjmaldTfTNeVB0/SCvDvVSLvUbnjIv?=
 =?us-ascii?Q?ccLrsW+IxKsBJauJKyAvcn3S9pGkbTl/l04dQds7xkHiACdIorwe5m6kuvms?=
 =?us-ascii?Q?xkkMZfwQyo+E8qF3x/AUPl7BNQsVsuf54dUi4JBmGKx/noW2j/RohmTRbxIa?=
 =?us-ascii?Q?rdrn5A7YmYtPr68ikyUSVzDafuW0TCLsoSKL059YYKABd90JMltm/0E5F9lT?=
 =?us-ascii?Q?CU3huQCVZwTwbS3QNvBcRMKstzqk4cmdKZqRvN0Ok2UGDH8aJnXLe9uxJFgD?=
 =?us-ascii?Q?PQOIutstkjVKXFkSeD7bIB3tVhg9zN5xEwOq/JsYqLDwYINm3yKjKiIxI+/9?=
 =?us-ascii?Q?mVoxw3CATguX8KQ2s6k0bIKXnWHWNSjsBu74Yp7XwjU0LVkTBgb5nyE/P4aQ?=
 =?us-ascii?Q?HbXH/NtVr3xmR/O5nIin3djqP92vyiDoqsTmd+d7HgB4p5zy2esy3UYUKmLq?=
 =?us-ascii?Q?RS5iGqsBlUn+PBKtWWszOkj2R/jbLLADAFHE6AUCXuNw3UYvOJ1McmAJ2jo/?=
 =?us-ascii?Q?YZUxmv1LGiyAytA/OijVuWYPoxpcpd2KVx8sHWoER/hz7XZESXcyvD+N66jG?=
 =?us-ascii?Q?+O+laqnhJMUkKKZKxBMhdx2ouWxqMvaiYD9r/vTswYVxk7+pcVTZDQXNlrQG?=
 =?us-ascii?Q?Zy7nLMOfM5W1GOnIu4ucUasO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83ea77f-8c43-4e0c-a8ed-08d9358f0a11
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:04:31.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUCrvF1LPJXT4q9ujNTfyplSYTuL39EWS1mEV11RyqKnt6tS1DPzserFeqxzjo81KaLyMxUBLqAmy2BzxhGMflJYXAd38vFKIF/8I4wuZeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: X13HaJXZn4b0Uz_uonKLTtsmvo7w1Xec
X-Proofpoint-ORIG-GUID: X13HaJXZn4b0Uz_uonKLTtsmvo7w1Xec
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_08:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Version 2.2.24 contains a fix for CVE-2021-33571 and is the latest LTS
release.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.23.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.24.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.23.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.24.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
deleted file mode 100644
index ab4b68fc8..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "d72405637143e201b745714e300bb546"
-SRC_URI[sha256sum] = "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765a3e825ef92e414"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
new file mode 100644
index 000000000..964ca6ba0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
+SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.31.1

