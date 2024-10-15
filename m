Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADC5D216B0
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:30:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15037.1729002598323721780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00181c24c3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9Vn0Y030285
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428hm4aamg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go8IEKdVudsiWoeqPOh2cK3RwfX2Ij5oH7g2H0gfp1A0znyo62FOLOkxCvz6FxKJVLGe5jXOc/jFaxTN9qz2npjNzdi8WTbqjnPlPmPBPLjbYCVDdgFm0HMf/XMTfKMLhcJ85AWRRXkFjDjqd6jTtPvONcm5WiWhv9jLo2+QUs7oaRwOAoBjkRW2k2t3RJJ8Isdvv+k5U4EAwIESwhRrs4HN6TCmRIqrZqUSFNPhK2bj6qTW3Rrz1I2ixI78KoEoI+/EzUi7ECygdd+kBfSmAXIsFfgrqacl6HdHRGYQmdzyC/SM9h0St89dUglO0AnCMgTKjrPvv33cu9E2bZMVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zu+CvXDiYrpdPxv+Q1CVKuYvICksq0E+KvKUjyd86Y=;
 b=eCNibg0q+tfu48ceA9LLHjL7EuewJRZM8koL+2DPWgtZtkmnX58bGACqHlGB7abjmmOJK0oaHdRI69lkhtXgf3RRlHY4droWvDzOu63zzVkSzxZZU1F6AJdF1Y1X2RQ2rxTQBCbXpbNTNwG3h83Ee5qztKU2fzldM9rvWxPAEyjhxA0B9vKkkqnhArWLTKMWiSfC5F+wIBk5OQYE9QCmA74ZUlp/4aLfHmXrkR0tj139oxndNqqa2ITG5vf4gYEdQt6HIewtREXMuGmXYZeoA4Jat7LV5aePy9CWd1Jlh5GNZDR5cD6P292amXu24plrGEb0zvkI61tzSKCZvhfmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 14:29:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 14:29:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] doxygen: upgrade 1.9.3 -> 1.12.0
Date: Tue, 15 Oct 2024 22:29:39 +0800
Message-Id: <20241015142939.719707-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241015142939.719707-1-yi.zhao@windriver.com>
References: <20241015142939.719707-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: eb56e73a-51cd-4f76-5f62-08dced25d56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3LvzFbhSlYXpGHwaygC/nlZB5OuugZiUG7YG+dnSsDM4wQqEAnW0SsYTw1nd?=
 =?us-ascii?Q?28WLY98bQa0PkeTTGiOeXA8PIiies7cgT37nk7BFYzd2WvxD9I80AO0Cgd2+?=
 =?us-ascii?Q?Nry99MgOH64ft/s4P1yFYUS+Fe+XIBovXjjEh3sLHElSdSPeW6txlhbbF4tV?=
 =?us-ascii?Q?q4kAyNOhaErZkrfKZsvFoMR8rINK2dgEom8vdPjziizIECb/FhLLDcWqr7vw?=
 =?us-ascii?Q?NDr1zNqd6OX4YOGvihhkbW9QMSWbqv4hAaringGEStd1vIV8GkxTKPSDKnIQ?=
 =?us-ascii?Q?RdnEA3PGWMX0yiFe3QN4M8jwFRGp60AdCSfYGECXvrwIcA6jSDj8Ei+OfyuI?=
 =?us-ascii?Q?nj16Ezn1nQHn2rY0kmDJzTSezog/Nk0l8259x5R4cZWgNvfvC8LFcmq1Idts?=
 =?us-ascii?Q?8DLjIJLy6a8BlTIZcmjgduepXv5gHyVLRkU70csCYuQhHbXuiI+mzHUMKpOq?=
 =?us-ascii?Q?s/G1ZY+InZcCp0Yol7z0GIxSojq1onySg7Ozu0lZ6Y4UYZR2WA5wcUtHHdI3?=
 =?us-ascii?Q?PjWNp76vOVdj43dhNrFkfUkV+IbGXRUM0A7f0Q3mxDHr1R0f0qHQ4f5P9na1?=
 =?us-ascii?Q?OGN0ReqSF0Rg8OvO7a4UETMuFRAAi5nl1cUwe5yr1xgBzWjeIG1FsleQU+Fs?=
 =?us-ascii?Q?T/XXbr5CZIPJcZE+ztCtLhWx8VEcbZkN7a142CvF4vs19eNenEseERcLOOxx?=
 =?us-ascii?Q?OzANrOcN8VaklMrOXsGE8PhI9JagRTBfL2I/rbM9G2EF41+QjbOkZbpjABtt?=
 =?us-ascii?Q?yy8HRb40o8vYsTp1+NijiUTPFP0C24AuQ1jfO1VI7s70rkHqc7U5QVhbiLel?=
 =?us-ascii?Q?t7RU56bqpQP4y4sL4oP69TjkTPNbPLwQsnw+CGhefdRHEGPAgWajB+v2Zh7R?=
 =?us-ascii?Q?mLIAXm+zv6KVlLMsXbl5D37SU/blM00eDrk311MrOwUMmRV4HjPnHQC0z/Ls?=
 =?us-ascii?Q?dFkcb66mh4JM3/9mfGuJaghsbR1iOlgu2CZIvVieTTHXQuaS7kqoe9NctgN3?=
 =?us-ascii?Q?RGrQQkU6vhO6d91m4Z0LiY4TqxIBssj+RU6eNnugS3reC/ZG4rvgIhdfJf5M?=
 =?us-ascii?Q?oKEe1Ggd0PjdGBvwXRZf+DMrcxzf5oJdg/zdLpwe8RVE3xle8IqBGtqWKQla?=
 =?us-ascii?Q?VTP5sYeUJQo043lzVyJTaee73lOuRQVrSOH54iAH9AgNVyNgWpGZnMEUza7z?=
 =?us-ascii?Q?EDN1EhTvXLIVoaZD0+g5AAXcCtcX0CVlZ7fsu1oOAp1AjmzMB9mw2ul3quDj?=
 =?us-ascii?Q?0aYCpIWYHj9TVEOn04xscMvBsvc7yOwLzbtqhq4fkQBb2tzUztOf1StKmmeW?=
 =?us-ascii?Q?MYA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bQB8spzsmgQV+FQ+OvRMZhD1oKGXgkKS/tGPqturnZGFbzoXLhf40OnkVNnX?=
 =?us-ascii?Q?QC+7DyYPorySDbwWQkON7didiDBSw9uREsaZU9+xc7dYntHXWykwmHrhlJ0T?=
 =?us-ascii?Q?Qn++3ONNnEeLoTF00k22n+vAm6qhiW72WgvXYd9zGgYHf5dWAHWnZHAnivzW?=
 =?us-ascii?Q?4kKThdWPLrIa8w2/sjWYwTMla71+48cks7wTGwmyg5BmO81zDSy5fZdWvk5j?=
 =?us-ascii?Q?mDb4MvzzuCFx16rN3W8V5s5zN/6bGcHrurr+JuWkNbpues8WUyFc9Aij38j3?=
 =?us-ascii?Q?z+znVbAkTiB/lj7RWtSKsQz0EmK/4iHQfVHxlXGSxJfAfQh6fBJTB4HK20mN?=
 =?us-ascii?Q?H/7i8C0mptVbLn83neRFo45duplvCAN42XuvGtvg6/BGXKkgOY5cXzYc6ttZ?=
 =?us-ascii?Q?3zRZujB/1vsT59KXZtyE+VVme1zPpsEX4ZYXAhQaiPUMP5gUWWG2SoK0XkOP?=
 =?us-ascii?Q?+rbWkreMPJtTtwZj2AqpN5T/qi1w8HsgvMOdn4i18F9ihejJ4cU5LMn2WGYA?=
 =?us-ascii?Q?rt8As7cFKpVQNDUE9gNvRx/MynCtnryrhcmXp1xfp67xmtlIw5Wdp2OWlz/U?=
 =?us-ascii?Q?YUhsNI5bfKIn52KJDRi8aFHrVywu9fvU6ktUzdqU3oYaPhbvvANdamQkJ0jp?=
 =?us-ascii?Q?9vYnNrtEk+nf7RaTn/1GznmMYqij+iUjrYebYAEPuPHXs5wxVdMnw/ZDe3HN?=
 =?us-ascii?Q?gOB1knetrD/xmCLDpgVX8CwNO98TSKZj1mjZwepyA52FFsuVWV2FY/+D0AOh?=
 =?us-ascii?Q?6dEx0y4LIIfs6jACVyAPvSO/gIt3PytxnNBVJleJJPeDwQLExo6L7APux4Jb?=
 =?us-ascii?Q?YQ9SdlqxSZlrwBU/2EHGqf9zH1hroXgxV4ZKtz7QoErOqvLbwI63YLlrtPHV?=
 =?us-ascii?Q?XjDYegf7FgkD/T3yG2bl/TQBt5vFJPpwM8maYIgLiBszarDRgiAibvB6omtq?=
 =?us-ascii?Q?gV4ydY/wjtDtZ9IJSLWEQWqaRbs9p+FxzDZFk7VMXl0c6t/ypYGPISrdqLqm?=
 =?us-ascii?Q?vAwap3bBfGppksx55cFBYVP6+npwDMz1xfIS0iG+MSh4DTsdWrcdU0IjImQ7?=
 =?us-ascii?Q?MnM56PI6DCZybux5lcze+nyscEsfDfPPcgmilBB6RbT2NjDpFefPmiaMhIn6?=
 =?us-ascii?Q?VdgEVYKzpyh0Xu+pmxjyhxE2xnpzf0Dq987WU0OofZyPG+Fq0EGtm5HYP+YE?=
 =?us-ascii?Q?ANg2nHNflRGRxzDM9wb9z0+PSdfksG7THoLptMAwqAvsWq9i4mZuIRigOObG?=
 =?us-ascii?Q?//xmxGFfTe0HyAsBvdBct5cLrdBe2d5Y6vAQAwtZEkpzjRB5htiLo/RvjHol?=
 =?us-ascii?Q?6Vt8haDFzTsM1FeW4FjIP0VpMehSxBwG9q9H1QU7cX/ofmkVhPzV6ZIhr64p?=
 =?us-ascii?Q?Eoj+Hd2Y9p/p0rJTJc7gnjFWzsGi+4pYjRbXwdU8HI/xRR8QOU0b1qPDJLWf?=
 =?us-ascii?Q?zLumhiTOAqnw7pwDNebsyh1CmtFyO4uDXfDTyfurcabFWDW0PW89K31t3VG8?=
 =?us-ascii?Q?RducckhsK14GhCIVRnOqoSP1fDHZpIx/0Ngf4rI0t2V0Zu+9CRbfDeiXJCl7?=
 =?us-ascii?Q?Bt2WNK2ZTYsDoVAnJbf89qWMpu6PQjN2jYS6FsBM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb56e73a-51cd-4f76-5f62-08dced25d56c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:29:53.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6VL+DZ30/egKZkFwQZKkf5yQEGiF4vHXkXaP8XnT49bEu1FlFGOCZS2UQLVZYiq55zlGFWrnNVMqqP1J0AnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
X-Authority-Analysis: v=2.4 cv=Kqgf2nWN c=1 sm=1 tr=0 ts=670e7c65 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=w20KmqIKAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=k-42gJp3AAAA:8 a=8IenNxhtyOxn46NhC8IA:9 a=Xjc3AndYmIsA:10 a=ZPE7x7C7M2cA:10 a=Qf4GdZp0wr9wS1Hk4A6d:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: Sl_5VQ9_6sl7D2Z3DjSsEM_PhSq2Ue3J
X-Proofpoint-ORIG-GUID: Sl_5VQ9_6sl7D2Z3DjSsEM_PhSq2Ue3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_09,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410150099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112929

ChangeLog:
https://www.doxygen.nl/manual/changelog.html#log_1_12_0

* Refresh patch
* Backport a patch to fix build with clang
* Drop doxygen-native-only-check-python3.patch as the issue can not be
  reproduced.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-build-don-t-look-for-Iconv.patch     |  20 +-
 .../0002-Fix-build-with-clang-19.0.patch      |  52 ++++
 .../doxygen-native-only-check-python3.patch   | 232 ------------------
 .../{doxygen_1.9.3.bb => doxygen_1.12.0.bb}   |   4 +-
 4 files changed, 64 insertions(+), 244 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-clang-19.0.patch
 delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.3.bb => doxygen_1.12.0.bb} (80%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
index 47c8edb49..6b0a48f00 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -1,4 +1,4 @@
-From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 2001
+From 2d587d043fc061c53c3d8015501392a804c5f0b4 Mon Sep 17 00:00:00 2001
 From: Bartosz Golaszewski <brgl@bgdev.pl>
 Date: Fri, 23 Nov 2018 11:44:56 +0100
 Subject: [PATCH] build: don't look for Iconv
@@ -7,31 +7,31 @@ Drop the find_package() for Iconv. CMake is unable to find iconv.h in
 native build but all modern systems supply it as part of the standard
 C library. We don't need this check in meta-openembedded.
 
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [oe-specific]
 - upstream doxygen must build on many architectures, this change is
   too intrusive for upstream
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
  CMakeLists.txt | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 06b9696f..f30b46b8 100644
+index 3adf456..ad73997 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -117,10 +117,6 @@ if (sqlite3)
-   endif()
+@@ -212,10 +212,6 @@ if ((CMAKE_BUILD_TYPE STREQUAL "Debug") OR enable_lex_debug)
+   set(LEX_FLAGS "${LEX_FLAGS} -d")
  endif()
  
 -find_package(Iconv REQUIRED)
--include_directories(${ICONV_INCLUDE_DIR})
+-include_directories(${Iconv_INCLUDE_DIRS})
 -
 -
  #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
  set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
  set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-clang-19.0.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-clang-19.0.patch
new file mode 100644
index 000000000..fc3aae75c
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0002-Fix-build-with-clang-19.0.patch
@@ -0,0 +1,52 @@
+From cff64a87dea7596fd506a85521d4df4616dc845f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>
+Date: Fri, 9 Aug 2024 14:13:34 +0200
+Subject: [PATCH] Fix build with clang >= 19.0
+
+Clang >= 19.0 requires a template argument list after the template
+keyword for CWG96 compliance, see
+https://github.com/llvm/llvm-project/pull/80801
+
+This patch has also been submitted to upstream TinyDeflate as
+https://github.com/bisqwit/TinyDeflate/pull/9
+
+Upstream-Status: Backport
+[https://github.com/doxygen/doxygen/commit/cff64a87dea7596fd506a85521d4df4616dc845f]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ deps/TinyDeflate/gunzip.hh | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/deps/TinyDeflate/gunzip.hh b/deps/TinyDeflate/gunzip.hh
+index 652058ab8..3ba341487 100644
+--- a/deps/TinyDeflate/gunzip.hh
++++ b/deps/TinyDeflate/gunzip.hh
+@@ -1141,21 +1141,21 @@ namespace gunzip_ns
+             //fprintf(stderr, "both track flag\n");
+             SizeTracker<DeflateTrackBothSize> tracker;
+             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
+-                (tracker.template ForwardInput(i), tracker.template ForwardOutput(o), tracker.template ForwardWindow(c), std::forward<B>(b)));
++                (tracker.template ForwardInput<I>(i), tracker.template ForwardOutput<O>(o), tracker.template ForwardWindow<C>(c), std::forward<B>(b)));
+         }
+         else if constexpr(code & Flag_TrackIn)
+         {
+             //fprintf(stderr, "in track flag\n");
+             SizeTracker<DeflateTrackInSize> tracker;
+             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
+-                (tracker.template ForwardInput(i),std::forward<O>(o),std::forward<C>(c),std::forward<B>(b)));
++                (tracker.template ForwardInput<I>(i),std::forward<O>(o),std::forward<C>(c),std::forward<B>(b)));
+         }
+         else if constexpr(code & Flag_TrackOut)
+         {
+             //fprintf(stderr, "out track flag\n");
+             SizeTracker<DeflateTrackOutSize> tracker;
+             return tracker(Gunzip<code & Flag_NoTrackFlagMask>
+-                (std::forward<I>(i), tracker.template ForwardOutput(o), tracker.template ForwardWindow(c), std::forward<B>(b)));
++                (std::forward<I>(i), tracker.template ForwardOutput<O>(o), tracker.template ForwardWindow<C>(c), std::forward<B>(b)));
+         }
+         else
+         {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
deleted file mode 100644
index 796bc61dd..000000000
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From daf686508f2ee4711d93e96e5b100e50bf161656 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Wed, 26 Aug 2020 10:52:10 +0300
-Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
-
-It fails to compile doxygen-native when /usr/bin/python is a link
-to python3 on build host:
-
-| Failed to import the site module
-| Traceback (most recent call last):
-|   File "/usr/lib64/python3.6/site.py", line 564, in <module>
-|     main()
-|   File "/usr/lib64/python3.6/site.py", line 550, in main
-|     known_paths = addusersitepackages(known_paths)
-|   File "/usr/lib64/python3.6/site.py", line 282, in addusersitepackages
-|     user_site = getusersitepackages()
-|   File "/usr/lib64/python3.6/site.py", line 258, in getusersitepackages
-|     user_base = getuserbase() # this will also set USER_BASE
-|   File "/usr/lib64/python3.6/site.py", line 248, in getuserbase
-|     USER_BASE = get_config_var('userbase')
-|   File "/usr/lib64/python3.6/sysconfig.py", line 604, in get_config_var
-|     return get_config_vars().get(name)
-|   File "/usr/lib64/python3.6/sysconfig.py", line 553, in get_config_vars
-|     _init_posix(_CONFIG_VARS)
-|   File "/usr/lib64/python3.6/sysconfig.py", line 424, in _init_posix
-|     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-| ModuleNotFoundError: No module named '_sysconfigdata'
-
-Replace find_package PythonInterp with Python3 to fix this issue
-that it uses python3 from python3-native. And it also replaces the
-result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
-
-This patch is only needded by doxygen-native.
-
-Updated to apply to release 1.9.1.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Co-Authored-By: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
----
- CMakeLists.txt                  |  2 +-
- addon/doxywizard/CMakeLists.txt |  6 +++---
- doc/CMakeLists.txt              |  6 +++---
- examples/CMakeLists.txt         |  4 ++--
- libmscgen/CMakeLists.txt        |  2 +-
- src/CMakeLists.txt              | 10 +++++-----
- testing/CMakeLists.txt          |  4 ++--
- 7 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2455793..28f0d83 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -105,7 +105,7 @@ else ()
- endif ()
- 
- find_program(DOT NAMES dot)
--find_package(PythonInterp REQUIRED)
-+find_package(Python3 REQUIRED)
- find_package(FLEX REQUIRED)
- find_package(BISON REQUIRED)
- if (BISON_VERSION VERSION_LESS 2.7)
-diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLists.txt
-index 63ac8e3..d37d1d0 100644
---- a/addon/doxywizard/CMakeLists.txt
-+++ b/addon/doxywizard/CMakeLists.txt
-@@ -57,7 +57,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
- 
- # generate version.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-     DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/version.py
-     OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
- )
-@@ -65,7 +65,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/version.cpp PROPERTIES GENER
- 
- # generate configdoc.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
-     DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE_DIR}/src/config.xml
-     OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
- )
-@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
- set(LEX_FILES config_doxyw)
- foreach(lex_file ${LEX_FILES})
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-     )
-diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index ec63ceb..49a2bda 100644
---- a/doc/CMakeLists.txt
-+++ b/doc/CMakeLists.txt
-@@ -168,7 +168,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR
- 
- # doc/language.doc (see tag Doxyfile:INPUT)
- add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
-+        COMMAND ${Python3_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
-         DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
-         OUTPUT language.doc
-         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
-@@ -177,7 +177,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
- 
- # doc/config.doc (see tag Doxyfile:INPUT)
- add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${TOP}/src/config.xml > config.doc
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${TOP}/src/config.xml > config.doc
-         DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
-         OUTPUT config.doc
-         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
-@@ -228,7 +228,7 @@ add_custom_target(docs_chm
-     COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
-     COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.html') or file.endswith('.png') or file.endswith('.css') or file.endswith('.gif'):" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
-     COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join(root, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
--    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${PYTHON_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
-+    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${Python3_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
-     COMMAND ${CMAKE_COMMAND} -E chdir ${PROJECT_BINARY_DIR}/chm "${HTML_HELP_COMPILER}" doxygen_manual.hhp || echo > nul
-     COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
-         DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY_DIR}/doc/config.doc
-diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 194b427..248b807 100644
---- a/examples/CMakeLists.txt
-+++ b/examples/CMakeLists.txt
-@@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/${f}
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/${f}
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
- 	DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
-     )
-@@ -73,7 +73,7 @@ if (DOT)
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/diagrams
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/diagrams
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
- 	DEPENDS doxygen diagrams_a.h diagrams_b.h diagrams_c.h diagrams_d.h diagrams_e.h diagrams.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
-   )
-diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
-index 34cf4d8..f015afc 100644
---- a/libmscgen/CMakeLists.txt
-+++ b/libmscgen/CMakeLists.txt
-@@ -7,7 +7,7 @@ include_directories(
- set(LEX_FILES mscgen_lexer) 
- foreach(lex_file ${LEX_FILES})
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
-     )
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 0e0c5f7..c1d3ca5 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -40,7 +40,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
- 
- # configvalues.h
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configvalues.h
- )
-@@ -52,7 +52,7 @@ add_custom_target(
- 
- # configvalues.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configvalues.cpp
- )
-@@ -60,7 +60,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
- 
- # configoptions.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configoptions.cpp
- )
-@@ -95,7 +95,7 @@ endif()
- # resources.cpp
- add_custom_command(
-     COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-     DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
-     OUTPUT ${GENERATED_SRC}/resources.cpp
- )
-@@ -126,7 +126,7 @@ foreach(lex_file ${LEX_FILES})
-     set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h CACHE INTERNAL "Stores generated files")
-     set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}.cpp CACHE INTERNAL "Stores generated files")
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
-     )
-diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
-index fd6912e..0af1865 100644
---- a/testing/CMakeLists.txt
-+++ b/testing/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # run all tests sequentially (keep for backward compatibility)
- add_custom_target(tests
- 	COMMENT "Running doxygen tests..."
--	COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+	COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
- 	DEPENDS doxygen
- )
- 
-@@ -19,6 +19,6 @@ foreach(TEST_FILE ${TEST_FILES})
- 	string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID "${TEST_FILE}")
- 	# add a test target for each test
- 	add_test(NAME ${TEST_NAME}
--		 COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+		 COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
- 	)
- endforeach()
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
similarity index 80%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
index 16a4250b2..ed0c71b31 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
@@ -8,9 +8,9 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
+           file://0002-Fix-build-with-clang-19.0.patch \
 "
-SRC_URI:append:class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[sha256sum] = "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f6c81c50449d254e0"
+SRC_URI[sha256sum] = "a3a3dba2018ef409d83d81a2fc42a0d19bdbe087252ef342bf214b51b8b01634"
 
 UPSTREAM_CHECK_URI = "https://github.com/doxygen/doxygen/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


