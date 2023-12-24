Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303C6C46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 13:51:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26796.1703425873880582700
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Dec 2023 05:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L4bXWdsi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0722ee0bab=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BODfPFr018912
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 13:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5BvDrK6YLDUf17vEuq
	K5DQc8OVGuENRBg86tiFGY0vQ=; b=L4bXWdsi0wngjo8k+8izzuDh7IUHnwmnzt
	8hUTZmVCiF99Fd/FAgAIXkGnzyP3kw+y8ppJB/QgdtfUXYnxRB0nR6i+KgtbuQ3S
	4abGnpF/MGr5gMldbMvxT8gpLQ5Kbh70Bti3I1sp5lBdGXCCUixAYI4i4OmQvxYb
	l52u+gRgswp3WiLl5XG7cBaLaSy47lA/oEQOqtUGNsSfEYpJXMiSV5muvZh6Izlt
	GMH3AgByN6MUy0KU5nsTmZvWjvo2Ld6E0Jmj8WfNTqPOHMYBKPM0LcwuMUaj7Kv8
	suuWxaavQ9hVK4bw5XxzVFgRelSAtCJ7FpoWlbEhpmHhJBwL8eng==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxryhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 13:51:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHKpYsQvhG4N8771rPfoPluSb0Fs6rTuUSCTvUfEpYeIighTblmiBZy+llgCwCLe848y+x66A5jhnlKTi2lWVgTjis9RRlgrIHujWOdkKMQyhoEujWJzlm0kL6PaKA4m7cTdW2eoXw0AyimvyvOCr0SrSonHVu61pvrHDB4zN02mb6oibEPbIOndUS4bICwgqhP2LxYA3aeNi35kRwhmeNACNu6mNOeaQQn9DxEqo70/ViIKQyYZkseNnbUIrK8kMZxjlyx9OjknOFnOn28odt5fcH2KqtTaFmY7D31gwFHcgKHrfEXddRHCdWcZhC9s0RdwyOmEqgxqp7fSTgJ2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BvDrK6YLDUf17vEuqK5DQc8OVGuENRBg86tiFGY0vQ=;
 b=W+npNVaIrbqv5W7F2gsW95BUJImRenLL1ZdyYIod85pKC32uF0xf0mcIHwyzQ2qoGYyhiITHQ0O4feOVYg+3Gtj4BAKYxO5Ajl5C4EpzX2cDjdk1cnf5I3t5vZ5Dw/Z2ipNNGi2JcBTmfo8Xn1NHhshDPiM5aVbjiMPLCgwQ1qkvmvuM7j5/2euutLDfzWglv8nQvAjeIsBZOo7P3WAj8RrP2kaH3b8J10HtRpxwkXdUOBAo0ym/jEkMzV7DJbmTHb0k2AmFx+yTLWHhpVFLqDm5pYE7HHgEtpIBM9BmLfxzc6ond9Wq4R5urRz6XEHehNLjJ71UNeC82KG9gNXiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Sun, 24 Dec
 2023 13:51:07 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7113.026; Sun, 24 Dec 2023
 13:51:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] vsomeip: upgrade 3.3.8 -> 3.4.10
Date: Sun, 24 Dec 2023 21:50:56 +0800
Message-Id: <20231224135056.3617584-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CH3PR11MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: aea9fdfe-19e1-4ff8-5a1d-08dc04876111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K8UT2zg1pf84n+GPYlsvBEW4eijpWodYI8qwoO1iPAqOs8aGmuAA3S2MpOeVZAFOOFjkmMZ3jccor3Rqly4CYtkB4reyhbVd36llMFH7tTgLzi4la7eJjYpw6SOVPVBi3DYeydqXI80YJhgwj/GNVXGF20fWZ1UXnjB+iJxmm8ZZEaNRZSSvXwv3AAMLPQ/GtqiqbVNgNJkstIeWXALjxCMpa59bIWzVv/IYvOVJoJ0eJodUBL/Q13MyVp0pAsh2jiLlZOUPppyzn5EQxMjSvk8Uvrdf6zBovVmrhtJotz6X/JD9oLrA+6vyVquYUyApCvTNfa0x56ZlyxLx946ki66udaTRjlmiTfO/Z8favGl3sT+SDUSn+TSd7oSRAv7sXRzXpHqlqMepspzI+gKAaMPGLxTMpPBFPFKJ+V6JqwBiJRTwUzHWueSYRgLzhxeTIDDGnaDPqe2DgBRKO57Cfi+NvWfCY9gTrhyKV1cohmUhaN7M2baEp3nBejyfq/AyY0ZCTfGACoSM89qC5F2ZCJunFN+2mK3nqhQHvXxzLq5R4grehTs9c0XwD21p14tN/wZ69OUrTsOaC4MxLqc0zawjEbHMulbw51380w+XHtigjmwiWTMPNZBKhAvNc8caC8J16f1+zY0mP+3LOEStag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(396003)(136003)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(36756003)(86362001)(41300700001)(38100700002)(44832011)(966005)(6486002)(478600001)(8936002)(8676002)(316002)(6916009)(66476007)(66556008)(66946007)(5660300002)(2616005)(6512007)(1076003)(26005)(6506007)(52116002)(53546011)(30864003)(6666004)(2906002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VH5MqZUcJBAKBp2FoNDfM9ohnH45RLH5ntQb+1zYeGp6sz1Aa55Y/YNzoZan?=
 =?us-ascii?Q?5rbgi5OeipMniA40UgAeoJKe7edTnm99m44rdnnsMKFPFEgHaftzbcxs5+Ln?=
 =?us-ascii?Q?Qd/BJvOZN6TotOwsqfPt+LT3KuOVazvvnO42WfNh8MQzNBTd/reawC5WYERA?=
 =?us-ascii?Q?1//+wriVtqLDn6kmm8Zs923W5J7BSURCE4DfL4tGEa1meDyzLs3Po0A67Gf3?=
 =?us-ascii?Q?fdd6LbaSypJw2v1giinR695VtLbpHDwBODe+7lQLa1W1T4D0LP85o5GR2UiL?=
 =?us-ascii?Q?hKMmMO3FGQFMNeLhRRFN8om8Lrv57ofoF6E3tO86T3mHLAQ1dLrMrElIf64N?=
 =?us-ascii?Q?frfLrdUr/eqcOQe1pzfooZ7KcsEaS7POfa3AUuaPfr8b5OY7YoRN9s+zY+FS?=
 =?us-ascii?Q?T3TGYo5q3FNZ8VfEMVYdxtC3iofoXStKspNC18HXsZnOUslV0IABKZrOK4eF?=
 =?us-ascii?Q?3K0I2hPyRPZAo7YKgVECs2exze3HmwCq20ErmcYYTzAEA1LGa3I8RA0wHBcV?=
 =?us-ascii?Q?G+G2UOxiiV/L5Vs8I62fe6oaK9/cYsuTNe8+WbIXoZSOIj9bDo6o1bjy7j6X?=
 =?us-ascii?Q?VCqam9pLN/5/TtHxm1iploSlGWhY1docAwCJFZh+Bbd75iPzJrPTwTrll6Ne?=
 =?us-ascii?Q?ULnC1C5FNEfsmqx33nUJYFFgP7LYELa6W3yk0LoObNa19DxJyUV2+PbsOySA?=
 =?us-ascii?Q?xtMrAahU9N0PGq+RnNKeAOdZIpGMvQJ4TnkcM+NFzLw/yxQziVnKRTNM+DwR?=
 =?us-ascii?Q?Xj9V8XSEWWikSVv6MCi6NMwZSVPsT4jDeIkSIXZrot3yLC9LkeCPArmfrAik?=
 =?us-ascii?Q?EAF7lDNMv3/YpStdehrubTUxvsfCsCmudr1a6GdBECNRSk9mT9MqfQ7Q6j4T?=
 =?us-ascii?Q?5MLeE62IlJhX0EUT405tZMlzyWcYfc/mXT3ErdvSsZBquy8ys5Rn8MyOASdv?=
 =?us-ascii?Q?5gVVyM3fOAQHcnMSJ7SGHwGlO8zgVmO2LXJTtTXO3mA+vneynaLHa15bzToF?=
 =?us-ascii?Q?sI6HmTDEolNHUoScxqxQSv7Q+5z1iXuh6mzR9MhVCX1IOXK9JyDd366IXm6k?=
 =?us-ascii?Q?bKhoiZvjjHMwyXgcstpmaPfdim0PNZWLd8PmtxsoLlR6fLHqqAxIHUBVyv29?=
 =?us-ascii?Q?g7uk63bZQoZO6ZQxHVUz6Mc+lCKmTh6Wr2WmwqdOL2P8ONL9rHGnk2cx+Lmi?=
 =?us-ascii?Q?wJFSDi0pIPeTvwl/VluJMo+/YTyUrGVN6ek3Iwa6xvHrrnwMR92SnLZV/2eP?=
 =?us-ascii?Q?e3Grh2qO0V0ojmDjVD7f3blGyL4OW/cZ91qQ4I0LgW3AuQGZ4mRbQLWS0sI9?=
 =?us-ascii?Q?MOVNTV0TTiOU12gKifI9hliSWXAof+P0MH4AFPVeh2Ouba9Ly5bmxxznSDKB?=
 =?us-ascii?Q?Fep8RyoyV/QvsPHw20dQ8HaMH5tbP3//qBk38w9jpGqfYw9bUbN8ytnbIdSK?=
 =?us-ascii?Q?mW/pDtx2pQV36b8/cEnD+IMW6bIa7rDGc+qf4VNJ8UlzgK+SEgnk37CUs2T9?=
 =?us-ascii?Q?0PYS9Ojz6y/OWivogom4pA+H9QSFNdiKGDMfRL5AP8lFFKFyXQ+Fh6tCBy1l?=
 =?us-ascii?Q?gvpRH1D+HynB//K6kNxbvCk2KZylIo+S+IZP2AZS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea9fdfe-19e1-4ff8-5a1d-08dc04876111
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2023 13:51:07.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtM/TbUeT/tvXjb2UHrWVN47OXy9KsnseMfZDNHGqmdp5ZjB9eMxawnnQg6AlkYGDWK66y0vJpWjPtGvGy6pAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
X-Proofpoint-ORIG-GUID: 87uHa8DF3SfnQzwt3Ui5L-WJffMKZtPr
X-Proofpoint-GUID: 87uHa8DF3SfnQzwt3Ui5L-WJffMKZtPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312240115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 13:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107780

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.4.10

* Refresh patches

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Fix-pkgconfig-dir-for-multilib.patch |  6 +-
 ...e-configuration-files-to-etc-vsomeip.patch |  6 +-
 .../0003-Do-not-build-external-gtest.patch    | 59 ++++++++++++++-----
 ...4-Do-not-specify-PIE-flag-explicitly.patch |  8 +--
 .../{vsomeip_3.3.8.bb => vsomeip_3.4.10.bb}   |  4 +-
 5 files changed, 56 insertions(+), 27 deletions(-)
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.3.8.bb => vsomeip_3.4.10.bb} (93%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
index 1c7eb17b2..0ddcb642b 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -1,4 +1,4 @@
-From e8a1b7a176398c2a9b5969f1b48ae0e1aa30f4ec Mon Sep 17 00:00:00 2001
+From 2f931baf290477b586309189445bf87e3bc5d5ba Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 2 Mar 2022 14:51:13 +0800
 Subject: [PATCH] Fix pkgconfig dir for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index add3edda..fea80b4a 100644
+index ab399a69..beae6eaf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -602,7 +602,7 @@ endif()
+@@ -637,7 +637,7 @@ endif()
  # create pkg-config file
  if(NOT WIN32)
          configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
index c22ef697b..bdaf34360 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -1,4 +1,4 @@
-From aea4c06ee2a0661d0c7b4773e846276a4f10e2e8 Mon Sep 17 00:00:00 2001
+From ebaa3206ee125741314272cddafa04fa71bd2d1e Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 9 Mar 2022 11:48:44 +0800
 Subject: [PATCH] Install example configuration files to /etc/vsomeip
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fea80b4a..e7a92ec6 100644
+index beae6eaf..d791c12e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -501,7 +501,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
+@@ -536,7 +536,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
  endif ()
  
  install (
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
index 370d8a0fe..09dab9a8b 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build-external-gtest.patch
@@ -1,4 +1,4 @@
-From e012f91a73af7469ef6f660c3a6a752430a4d649 Mon Sep 17 00:00:00 2001
+From b1bf398015bc090020459954e5cd1ec3b51b8ac3 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 11 Jul 2023 16:53:46 +0800
 Subject: [PATCH] Do not build external gtest
@@ -10,15 +10,16 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- CMakeLists.txt                    | 30 ++----------
- test/network_tests/CMakeLists.txt | 80 -------------------------------
- 2 files changed, 3 insertions(+), 107 deletions(-)
+ CMakeLists.txt                    | 11 ----
+ test/CMakeLists.txt               | 22 +------
+ test/network_tests/CMakeLists.txt | 99 -------------------------------
+ 3 files changed, 3 insertions(+), 129 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e7a92ec6..f6c680d4 100644
+index d791c12e..f1bcba27 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -18,14 +18,6 @@ set (VSOMEIP_VERSION ${VSOMEIP_MAJOR_VERSION}.${VSOMEIP_MINOR_VERSION}.${VSOMEIP
+@@ -18,17 +18,6 @@ set (VSOMEIP_VERSION ${VSOMEIP_MAJOR_VERSION}.${VSOMEIP_MINOR_VERSION}.${VSOMEIP
  set (PACKAGE_VERSION ${VSOMEIP_VERSION}) # Used in documentation/doxygen.in
  set (CMAKE_VERBOSE_MAKEFILE off)
  
@@ -26,16 +27,23 @@ index e7a92ec6..f6c680d4 100644
 -    if (DEFINED ENV{GTEST_ROOT})
 -        set(GTEST_ROOT $ENV{GTEST_ROOT})
 -    else()
--        set(GTEST_ROOT "n/a" CACHE STRING "Path to root folder of googletest. Must be set for building the tests.")
+-        include(FetchContent)
+-        FetchContent_Declare(googletest GIT_REPOSITORY https://github.com/google/googletest.git GIT_TAG v1.14.0) 
+-        FetchContent_Populate(googletest)
+-        set(GTEST_ROOT ${googletest_SOURCE_DIR})
 -    endif()
 -endif()
 -
  ###################################################################################################
  # see http://www.cmake.org/Wiki/CMake/Tutorials/How_to_create_a_ProjectConfig.cmake_file
  ###################################################################################################
-@@ -630,27 +622,11 @@ find_package(benchmark)
- ##############################################################################
- # google test
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index f66ac5d3..6f09bf40 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -17,27 +17,11 @@ find_package(benchmark)
+ # remove export symbols from the cxx flags
+ string(REPLACE "${EXPORTSYMBOLS}" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  
 -# check for set environment variable
 -if(${GTEST_ROOT} STREQUAL "n/a")
@@ -62,13 +70,13 @@ index e7a92ec6..f6c680d4 100644
 -    set(BUILD_SHARED_LIBS_AUTOMATIC_OFF 0)
 -endif()
  
- 
- 
+ ##############################################################################
+ # build tests
 diff --git a/test/network_tests/CMakeLists.txt b/test/network_tests/CMakeLists.txt
-index 6a148604..a501b6a7 100644
+index 883cc5cf..9a2a4f5e 100644
 --- a/test/network_tests/CMakeLists.txt
 +++ b/test/network_tests/CMakeLists.txt
-@@ -3633,86 +3633,6 @@ if(NOT ${TESTS_BAT})
+@@ -4116,105 +4116,6 @@ if(NOT ${TESTS_BAT})
  
  endif()
  
@@ -97,6 +105,12 @@ index 6a148604..a501b6a7 100644
 -    add_dependencies(${TEST_CLIENT_ID_UTILITY} gtest)
 -    add_dependencies(${TEST_DEBOUNCE_CLIENT} gtest)
 -    add_dependencies(${TEST_DEBOUNCE_SERVICE} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_FILTER_CLIENT} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_FILTER_SERVICE} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_CALLBACK_CLIENT} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_CALLBACK_SERVICE} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_FREQUENCY_CLIENT} gtest)
+-    add_dependencies(${TEST_DEBOUNCE_FREQUENCY_SERVICE} gtest)
 -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_SERVICE} gtest)
 -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_SERVICE} gtest)
 -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_CLIENT} gtest)
@@ -127,8 +141,13 @@ index 6a148604..a501b6a7 100644
 -    add_dependencies(${TEST_E2E_PROFILE_04_SERVICE} gtest)
 -    add_dependencies(${TEST_E2E_PROFILE_04_CLIENT} gtest)
 -    endif()
+-    if (${TEST_E2E_PROFILE_07})
+-    add_dependencies(${TEST_E2E_PROFILE_07_SERVICE} gtest)
+-    add_dependencies(${TEST_E2E_PROFILE_07_CLIENT} gtest)
+-    endif()
 -    add_dependencies(${TEST_EVENT_SERVICE} gtest)
 -    add_dependencies(${TEST_EVENT_CLIENT} gtest)
+-    if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "QNX")
 -    add_dependencies(${TEST_NPDU_SERVICE_ONE} gtest)
 -    add_dependencies(${TEST_NPDU_SERVICE_TWO} gtest)
 -    add_dependencies(${TEST_NPDU_SERVICE_THREE} gtest)
@@ -139,6 +158,7 @@ index 6a148604..a501b6a7 100644
 -    add_dependencies(${TEST_NPDU_CLIENT_FOUR} gtest)
 -    add_dependencies(${TEST_NPDU_DAEMON_CLIENT} gtest)
 -    add_dependencies(${TEST_NPDU_DAEMON_SERVICE} gtest)
+-    endif()
 -    add_dependencies(${TEST_SOMEIPTP_CLIENT} gtest)
 -    add_dependencies(${TEST_SOMEIPTP_SERVICE} gtest)
 -    if(${TEST_SECOND_ADDRESS})
@@ -148,13 +168,20 @@ index 6a148604..a501b6a7 100644
 -    add_dependencies(${TEST_SUSPEND_RESUME_CLIENT} gtest)
 -    add_dependencies(${TEST_SUSPEND_RESUME_SERVICE} gtest)
 -else()
+-    add_dependencies(${TEST_APPLICATION} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY_CLIENT} gtest)
+-    add_dependencies(${TEST_HEADER_FACTORY_SERVICE} gtest)
+-    add_dependencies(${TEST_PAYLOAD_SERVICE} gtest)
+-    add_dependencies(${TEST_PAYLOAD_CLIENT} gtest)
+-    add_dependencies(${TEST_BIG_PAYLOAD_SERVICE} gtest)
+-    add_dependencies(${TEST_BIG_PAYLOAD_CLIENT} gtest)
 -    add_dependencies(${TEST_LOCAL_ROUTING_SERVICE} gtest)
 -    add_dependencies(${TEST_LOCAL_ROUTING_CLIENT} gtest)
 -endif()
--
+ 
  ##############################################################################
  # Add tests to the target build_network_tests
- ##############################################################################
 -- 
 2.25.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
index 970a37e50..4bb231855 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 69805f9c8973a7a4d29297f8d50c29c88f981bee Mon Sep 17 00:00:00 2001
+From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 17 Jul 2023 14:33:32 +0800
 Subject: [PATCH] Do not specify PIE flag explicitly
@@ -24,15 +24,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f6c680d4..dce1e701 100644
+index f1bcba27..2653a4df 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -60,12 +60,12 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wl,-z,relro,-z,now")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wl,-z,relro,-z,now")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wno-tsan -Wl,-z,relro,-z,now")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
  endif()
  
      set(NO_DEPRECATED "")
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
similarity index 93%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
index b45bd2d63..aa1ad9e39 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=
            file://0004-Do-not-specify-PIE-flag-explicitly.patch \
           "
 
-SRCREV = "07464840f503670bc75997b8e926b54734ffa410"
+SRCREV = "02c199dff8aba814beebe3ca417fd991058fe90c"
 
 COMPATIBLE_HOST:mips = "null"
 COMPATIBLE_HOST:mips64 = "null"
@@ -55,6 +55,8 @@ do_install:append() {
     install -d ${D}/opt/${PN}-test/test/test/common
     cp -rf ${S}/test/common/examples_policies \
         ${D}/opt/${PN}-test/test/test/common/
+    install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
+        ${D}/opt/${PN}-test/test/test/common/
 
     for d in unit_tests network_tests; do
         install -d ${D}/opt/${PN}-test/test/$d
-- 
2.25.1


