Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED6C47074
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 09:32:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2265.1704101561100566372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 01:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cG3x6Vmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4019HtIW024570
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 01:32:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=vnZh1E5FJc1betrCH6
	aXyS0zK82Brsk+fQ+eXgo2qFI=; b=cG3x6Vmvh/vKXn03elhzkzgJYQz0C1oixh
	+rCTdtgHWmu8fI5TDYsUWpYEKUVYjFlg5amYETUq0azo31wWnMeVWx0eSgZXN1Ic
	DjHdCHnia4OcAceMjZKO98ip+ile4cPOt9nPSzT2JaBssmhNVi/YaOOTyu/i9bfU
	o9y3CVbwJcJbhFbyaxB+YnBRX4HGB3VvZvdMed5eLazFbud0Y6CcBCx06+4eO8SN
	/PZzgAro9AK3olw5O3v6xqRfbGtA28XK5Ll+Lpyj1zj+2jhS/ZeSi6Zhjj4FGyZQ
	QvdSUFx8SL8DFbFN4vjhBfkG02lh0/sQ6giVXPS/3KQjOeSZo2+w==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkksdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 01:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R27bQKXKoBUz7G78tIAMuZ8ocjY8KsVl+ptC+tek+pF5+hqXI4hF2HkZn54Z4WM80AGLK6Iid2N0ZLnkqRaXOonkEF39HcvvD1KK/5GDTLp8vHu0rAMI/lwC1WOs5evH6TISWuIBop3y8TKuzyOtcgh+K+65abPgw3Dg6tO42CesgmASbnPRyL+ZbRDHqrDCq8d3OAWS/LbxkIxBsszLEq2ZwR1JSy1qYbURlc/8Vt650k8fe/npUVtaNSQ3m1/2sikawMuNNjDAR0MSq6dPm4y1Kjt06s1AZVoXvW9b4mIvB9+fUVbKzuV3wmBa8UGQRJdNEJmMeknlTVG+flyHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnZh1E5FJc1betrCH6aXyS0zK82Brsk+fQ+eXgo2qFI=;
 b=JeQIcn//O9HGoxn9FDX43BcDPCosTL1NTYLq5JxQQFmAQpsCa7JqnAzhebty0PzozUcJCuOEYQkOK3jeynN0dm8qyMWb+Ty9yt6OovKF7rxaj9HWBIfbVLhHlYq6r6IDyTRsp/8jaTPmHJRdEv/fklUGZUDScPD+2RjgyRcCSbX+RKCT2ClKspkqybuBasJvCTxZW6jC/rgWTdQxzYXbRfs0eld/8DprpyYOFqRokQbl35S8FCuOkMZVDV2GTvyYMk0+/R7cE7HBflGv7xSpq3kLALSBOTl/eTv2zZGZ9v4A1cbNr5Sx9p6cPDYAhq2Nw6wCnYIJeq/ti2JF05ZqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19; Mon, 1 Jan
 2024 09:32:37 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 09:32:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] vsomeip: upgrade 3.3.8 -> 3.4.10
Date: Mon,  1 Jan 2024 17:32:25 +0800
Message-Id: <20240101093225.2889204-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0197.apcprd06.prod.outlook.com (2603:1096:4:1::29)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e8bd80-6be9-436a-8d43-08dc0aac9780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	96qlx9oKk5kq0zHLWyjPqScYd4i4YrcyNHEEqz7s6PYVtJXTIWEKeeyndqwPp6SM81ocnO0/UXpLHWm+WPqTlQciBbBreaHKQqP6jQSJ59e/m8JGtzlbv1m2kxfaoewEUt0Q1jvWG6e3tBQ+vtPbkxhSN3fjRUJHo8g/1ESOzTYHHr7UdwIssAWCHyP9xxW2VdEIyAKVHaPLqxPIAxRuxFGKeNDRH0VVc3i6Kl6VZaWovsZF04LaB62kORUHT+jtrlFDQlZnomLweAcc6GtuccQxBy4XddZ6Qvx/8wpoyfpSf8tJPOT0NkKVqb6ReTDlbA81rGSzFI7HP4sENCmPUTTtW68Nb4NuJ+8CZdzrOSDZjKW8b7mHMuwcFmGBVAskIigzYNj8JwamA/IMJUInXmsXF2NeS6nhlIHhVK5crUzmPGU+Xv+ZmQErjGM7/9B/BCN40S418f/ZhsM7jdEwfWWXHeu/h4+IUZD764s+gyhLZhS/WodjulOKdGtHSw+sJdj3Nl2WUKKV66+0hJU3CXIEZa46uQJ0wU16wdxCggaQrulkDqYVBWqnob3CrAWEnXWSvUnq2zEwqdZ4iAURtN+lHVWQva6hSwhxK9r0+Ov0sJh7XyMKx4/m+adZuTGqEbFdha13Jp6LJj5d6JbfGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(366004)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(26005)(1076003)(83380400001)(53546011)(52116002)(38350700005)(86362001)(36756003)(2616005)(6666004)(6486002)(30864003)(8676002)(8936002)(6512007)(6506007)(38100700002)(5660300002)(66476007)(2906002)(44832011)(66946007)(966005)(316002)(41300700001)(6916009)(478600001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UMwTAJIWKuGqmJQZmV3Nc1yxillfa8ALzrjaTfqXBeZMubS5MUlnJeIWA6jm?=
 =?us-ascii?Q?Q0LCp4nfBlr7EVH9dc3ltMIa9FqcBQjtlKvzhpluhUGCocexm1NugjwHomwy?=
 =?us-ascii?Q?FWx1FEzvtaJaPdO8Whm1TVhWgZKRRAf9W29CoV6m8AYliIz7VQ3vq5Tk4lVa?=
 =?us-ascii?Q?r2MDvggfIJnnP1mUqpskBY+jLJCglSREirXVPAAzgyQ4wVDiYNJaDEdYiPqP?=
 =?us-ascii?Q?b98tAIfXuTGdu6/VNSTaFkMweewBk0aWbU+4hxgL/o/QD24/cH6VYNDOxeAk?=
 =?us-ascii?Q?j7Y9JyOUVDb2U82OcCQ+UWmO3zU1PwTkRW1kRJsGDFmybr6adrueSgjRF2iD?=
 =?us-ascii?Q?0sk4tDJ/EN57lh//Z1q9+vavYZUehNqBIalEWmCmbGQLp4Ih6L8rn404U2ij?=
 =?us-ascii?Q?xbb/36ooZqIW3OI/bOKAeMgbBHbrOgBLWD3z8965Zk464Y2b+/Effk7v26kS?=
 =?us-ascii?Q?tqJjWRpYBLn2CgiGOJuSy93r665a4p1J3TMMEGk2Vlf+88HCQg8Y6AqR/yNv?=
 =?us-ascii?Q?Z4wfYrbcwkAMQFV8Dp4I3EUVTk0vchMOXus0JsH7VFBAqvplH/+r/bDF1BuA?=
 =?us-ascii?Q?lNhhEUwW8Zn2Oh8J0ivenbSwaH3FlpE7n7G0DBazIXTFYyADz+S/LNs4MOH/?=
 =?us-ascii?Q?feYMofqS6cRy6XFIRj8Vzq6D6oN0F84BcgrtpMgBDf6YCwaLg05I1GzVV8PM?=
 =?us-ascii?Q?V68Ng0WUw87kWFMyqT/Z00KhNxN4Et2Z/33CPhBfpK9QfdKxhHMCDRTGLEKo?=
 =?us-ascii?Q?T1grhg/bKJxFb9sU6/QyVVIVvOA5TDzrhCLtKLxnUbALhH7k5s2BTEdG4VL2?=
 =?us-ascii?Q?KWvwgMhD4bc7os25EbFchFAoHxuICco9MyS188ectstAPcOGUyf8tQ+Btb5u?=
 =?us-ascii?Q?oQgBY2+ySwlL94wQAsLufv2FUQHYOdKoUfdCR51RfaGftz0kpdaOhOcVkmZw?=
 =?us-ascii?Q?SobMy1OFRT/2blEQowt4y+wSOoHYQX1CRB2tSwTxvtBStLqIAb4ae1Id53ff?=
 =?us-ascii?Q?yfyY0GrhZTRtsUqiCrEttSqE1SpvHbpGPZRpfZ4VRO5RQignYCj10Nqg43t9?=
 =?us-ascii?Q?b5NM/Df4cJz58nakSbDdg37D18Fj4hSDf+5AiRycdn35i0lGikNn5Yy3mmec?=
 =?us-ascii?Q?4z+ye/kRtc7AuPAbJriJ4JIltBoec3T9ph0z/GerFbEksBIbdm4ZoP7WiSAF?=
 =?us-ascii?Q?ZxeKnH9O+G/7VwtpcwLi3cIk1PEtGBs5Tc1rSJOnYNzS0tu6tV8EMxGpzNF6?=
 =?us-ascii?Q?j++v0N+sz03Uxz14s8WkXh9aJQ3eg/uB4Xsu0VqO5UEpVvwuBrSjaFMTYoiC?=
 =?us-ascii?Q?USjd4rBK2A9qSlDkh0dU/7yu2cSEUycO082YcHAusPxPxTuG+E1JiaVDi4Rb?=
 =?us-ascii?Q?lFHep3gppAAAVNv+7rmCgoN6feIXpdFU8J/pM0u72TLCOjgIAFccDvF+uDQQ?=
 =?us-ascii?Q?6ahbRpSSjm2qv1WxX1Gpf5xXS1EnJvwebfz4ZGjwyvQTAI2zVDUL2cr6ei1z?=
 =?us-ascii?Q?NvK8eh6qyx/qC4e/TZW9fC6BJ95jMu0V/zYfcLaczgX6ryzSy12C9j8b9HxV?=
 =?us-ascii?Q?4Kh5+suEotZT1XZWixNV4YIsXRId/s+lkkWImWlS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e8bd80-6be9-436a-8d43-08dc0aac9780
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 09:32:37.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGCaRj0hl0niWU4R/OOcE50yhH6ERxYfOtzZ2aSWVEk8Wmi7kcJOLCe7FfKqB3YELO6Ab16uqMT+QOfO1AfCgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-Proofpoint-GUID: bu4ttqlS1_QHJAXvqozgmy9kTPVB6QZ3
X-Proofpoint-ORIG-GUID: bu4ttqlS1_QHJAXvqozgmy9kTPVB6QZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401010077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 09:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107984

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.4.10

* Refresh patches
* Fix build for lld

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 Change: fix build for lld

 .../0001-Fix-pkgconfig-dir-for-multilib.patch |  6 +-
 ...e-configuration-files-to-etc-vsomeip.patch |  6 +-
 .../0003-Do-not-build-external-gtest.patch    | 59 ++++++++++++++-----
 ...4-Do-not-specify-PIE-flag-explicitly.patch |  8 +--
 ...eLists.txt-add-missing-link-with-dlt.patch | 41 +++++++++++++
 .../{vsomeip_3.3.8.bb => vsomeip_3.4.10.bb}   |  5 +-
 6 files changed, 98 insertions(+), 27 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.3.8.bb => vsomeip_3.4.10.bb} (90%)

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
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
new file mode 100644
index 000000000..25d66514f
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
@@ -0,0 +1,41 @@
+From 8676ef287bb25b49668be4336387bdf83a0cae5c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 1 Jan 2024 17:02:41 +0800
+Subject: [PATCH] test/common/CMakeLists.txt: add missing link with dlt
+
+The libvsomeip_utilities library uses functions e.g.
+dlt_check_library_version/dlt_register_app/dlt_unregister_app which are
+provided by dlt therefore add it to linker flags.
+
+Fixes:
+x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_check_library_version
+>>> referenced by test/common/libvsomeip_utilities.so
+
+x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_register_app
+>>> referenced by test/common/libvsomeip_utilities.so
+
+x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_unregister_app
+>>> referenced by test/common/libvsomeip_utilities.so
+
+Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/602]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ test/common/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/test/common/CMakeLists.txt b/test/common/CMakeLists.txt
+index d4d14534..afc8c2d6 100644
+--- a/test/common/CMakeLists.txt
++++ b/test/common/CMakeLists.txt
+@@ -27,6 +27,7 @@ TARGET_LINK_LIBRARIES (
+         ${Boost_LIBRARIES}
+         ${DL_LIBRARY}
+         ${TEST_LINK_LIBRARIES}
++        ${DLT_LIBRARIES}
+ )
+ 
+ # ----------------------------------------------------------------------------
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
similarity index 90%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
index b45bd2d63..4c3897020 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
@@ -12,9 +12,10 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=
            file://0002-Install-example-configuration-files-to-etc-vsomeip.patch \
            file://0003-Do-not-build-external-gtest.patch \
            file://0004-Do-not-specify-PIE-flag-explicitly.patch \
+           file://0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch \
           "
 
-SRCREV = "07464840f503670bc75997b8e926b54734ffa410"
+SRCREV = "02c199dff8aba814beebe3ca417fd991058fe90c"
 
 COMPATIBLE_HOST:mips = "null"
 COMPATIBLE_HOST:mips64 = "null"
@@ -55,6 +56,8 @@ do_install:append() {
     install -d ${D}/opt/${PN}-test/test/test/common
     cp -rf ${S}/test/common/examples_policies \
         ${D}/opt/${PN}-test/test/test/common/
+    install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
+        ${D}/opt/${PN}-test/test/test/common/
 
     for d in unit_tests network_tests; do
         install -d ${D}/opt/${PN}-test/test/$d
-- 
2.25.1


