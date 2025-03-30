Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AC6C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:28:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27664.1743326902764957886
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U8wHnA006640
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQyTevZP2mj0Nk9eL1f3O/J+lDmhPhWF2lQxI4H/mYWeXc/r7NL8Q85q9LC4HKdj4iS5rpaEklW3aMOfzAbVP5YMfekH3tpRXtZLlDqGkHzNs4w/mxZpEE72e7FSAgn4u+N3s+XpvSZnoYWrYOaHBBYEHn3YKN+4nyOSRbFoGJTYHG1F7JUY4xwn1tqkqosN/0KHRRWNv/AMxd88/xS/zGkMMYw/xqsLhllRD8Co1wFv5Zx1AhTGZwRbW+1+aHcMVVJCIla0An+XOZjqHlfGck/G4QEcERhXYt9j2eRqV72dtZ16K4+Nuh9z/YqhJejtEsRBRPMl4jStc8D+aZAp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph0vw8GLA0jQku2xoXiS9cfu6jlqArc3rczvr0XV3pM=;
 b=ujK2SEUW9Cz4E/5R/1GKG3oK+EGrkEweFa4PDGpXmUlQWDqy3J+x8GfurBAGDXxGPai56kG8v7x5M4mwqo/P4stmnUj2BUxZq32B9dzt4qrJ1/HHm/RbE49BOVhdWfBisai1pvKek4tR9b3N7nyIYHo7m8AtcVzfXHWCR9JZYpIqU0wPqNL1MXC+y0nRad9P+gPWHU6tCk56fTacHJibUsleVZ3HlzJZ4llUhjjxRonFTyhkfs5sy8zl3CqFPIhI0SxUg5FN5WfJmE50dW7MfOOMai8JCv1pG2IJc5gc9w051Fmb1zz/LjkqS5jlaefY/CeRh5botE6chNxj5Yoe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 09:28:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:28:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/7] jansson: upgrade 2.14 -> 2.14.1
Date: Sun, 30 Mar 2025 17:28:00 +0800
Message-Id: <20250330092800.1275186-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092800.1275186-1-yi.zhao@windriver.com>
References: <20250330092800.1275186-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 9303b00b-4e53-4861-5bea-08dd6f6d35c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jl0XayesAEr27+dTNFxC13fI6xqqB7jnoGCDo+DnXC0bAbREeNKNz/Y9mMyI?=
 =?us-ascii?Q?NhePc06zaXMq6foC5X1uVFMvzYFLiYb/BScKINor6HoPvc6Ir7AWtxaWd4eC?=
 =?us-ascii?Q?6VLgAYmN0N6vJwmnxDp2H4iy1wbwrrjv6MqlFhhtwcK9WJ7bW4KEzbbiKsv8?=
 =?us-ascii?Q?EGO2CQKN/veTVt0pbAiFsosS1qg2HWZwdX4k4zQWk3SlBEeDIN1M0gRhKFm/?=
 =?us-ascii?Q?cq6la3xDMgguFNHg5KXjffRSf/vC3h6Rwwip4GXbZ22aM6h1iCu6wdBwPXwI?=
 =?us-ascii?Q?EJOCPzwEW72sDv16QctcJQ0/MevKhWKJpEw/DFdmwRBQuVFeGx9k5+z3yb80?=
 =?us-ascii?Q?FCCzlncEiIWjUNcsW3Kg4ttW9RJjm0OgReDXf9pPx3wQGryr94wlwG/bl939?=
 =?us-ascii?Q?77TC8TfXuKhfr9Y3ekBUiBO0lr56aqj2kOkdtnkBWwREJeaSayJTVjOL8ZP+?=
 =?us-ascii?Q?f2Rj4nVdRt1D4aXxhBv9xZE6IFCBkh3V/14pB7R9Mc8UAYhHQTT3yVS9ARBW?=
 =?us-ascii?Q?L8/7oy/W7eH9n/E/h1dxufVETH9TWVb4nAa7BiQ2vBH9L61n/OKWLukfafxt?=
 =?us-ascii?Q?0Dyq5xkZFotauxuVtrGRJeCOMGAC01oZtnPpvtI6IKXHpVEwfu9KYRZzxQhC?=
 =?us-ascii?Q?yLOlIJvqmq2CrlKnM9995e/0U9TA95JrZjaaqNKnYaVAg2eJrY4HeRhSrnHz?=
 =?us-ascii?Q?rpoe2gnuWko/fHg5KWkFdeKNjXxOTkrD/PPnCrMjRBvvlHZrpo04rhZjxAx7?=
 =?us-ascii?Q?8lrVjzJC9wi6syIl+21OJ3lWIC3B5xiIom/zJjM61R0RD0EAhxHjrjN8NlXV?=
 =?us-ascii?Q?I+2VqAe90vzlxH/u+m54fxuWm04qBoEL4/hpj244v1/e2TBHa9sb278rDQ1L?=
 =?us-ascii?Q?24vW45IIwL3hpU+jwMg3ZWgOgamg8Noh5T7jBg9nxu6PCQ+xNlqIhHRmxKLL?=
 =?us-ascii?Q?tE9LSwq+H3vDzLYbrMhEHKpUvTJgDEyFQYlUjE85knVLP7T8g9GIcBo84129?=
 =?us-ascii?Q?psk9dY6QTAqWKOyyhreggng0gVqTDrcAU2CN5rrAInyc6+E7InUZGVkvssEm?=
 =?us-ascii?Q?fALi4NIe7QEsag1UTTCbbFUATYHs3aGfVUaI3dSFPRlMC53MsN0+Nso9N12K?=
 =?us-ascii?Q?4jS2iAniIxJoJWlrFsdRKQl/fgcJyQyHlXq98pc6nJnJ4IiIcyt73FO+paLY?=
 =?us-ascii?Q?QFTPjzWPciPFE8iNeQ/e395CGZvBu/yhCBj0HAfGuGmQ8KwZez9iBBJMplH9?=
 =?us-ascii?Q?m2t+JmqoiPs9JxICgSXA/itPz/1d+wTV/M6ItntMb6JrRwyvjvAoHFd1Ptf4?=
 =?us-ascii?Q?yluLuxZi8jsbLieBwhmsbQnVtEyefB+abYwfk/7AmPQFV/RE+bbf+UMzDJuH?=
 =?us-ascii?Q?c6SezYjeM2hgpE5tzaNnJiTNlIzYlWKqNXydYnSCAtfmLL3g8EdxMmTE1yGz?=
 =?us-ascii?Q?eoBEETf2hHw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5mAPEIc02Mcs1IjSuMUZ+Qw8LHoyB9oYnqb+fGJgfYHfnsHsUq04JyPpCXFE?=
 =?us-ascii?Q?WWRooBCzy2Q6P1ZWfRcL4yyC+ZbixBzkdm+rh1+UWIZ7KJcFrIzHekh8Nhh+?=
 =?us-ascii?Q?PhzUyaRG58KYt4cdntQEiJ2cf9WHDYQ5fAD4Poz4ckC8E05f2GNLSc+Kc7M+?=
 =?us-ascii?Q?GetK8xgVvFjO1rrGzCQ/yeItiYydzAPcstv9NK+doOHAsucT83aALPHL3zBA?=
 =?us-ascii?Q?mrxCGP26GB0tOkhyCGQJcx017Phv/bETNdFw5vPR2gYg7XVJssHxLF+HjyhR?=
 =?us-ascii?Q?Qx0J3lpK/w6xOamZL1yevTEyuFO48u+z4bISbp0qX4UMX59o4xctg+kde1JC?=
 =?us-ascii?Q?v5ccIJgmJfUzvxIbcGuklNjzZTzy5N3cGStd7E4Gku8yEE4AvlkePvkGqJyt?=
 =?us-ascii?Q?JQYP66L6GkQmPWQcxMo3HkFV/uSVXtW/433WC3IqNFR1sTAk0YdSEkSpEcVi?=
 =?us-ascii?Q?NNaPgYkG5T/tA9fIQyzPTojYgt7XaUHaC1nlfYjPgmZggKolOtRkZR3i0nMo?=
 =?us-ascii?Q?3LX6iC4ByO68dcE2eaCavN2dMlwg6w9IhIq0rAZMFmwxcAwR6d0NsXUmeXUf?=
 =?us-ascii?Q?bwBbOHvhiFmW8d9yCK9MU2f8nlKluVDecMeHkdrbcTfmpgCFYL5Axigox26I?=
 =?us-ascii?Q?EeWATQdKczTJFbWUMhB9IxvJphXRFUVr5TQliGaTWBhe0BQ4uxcY87ZuDHrR?=
 =?us-ascii?Q?PQsRAOWMGFSDSv8gPOHEcSkUqsoYAJ8Zv8nixn++vE2p9HnvpfZVv1mZTnk+?=
 =?us-ascii?Q?eZXFHhUzrjSm3DfM0lknLdjJVTfTK0+tLP1C8YJiZH5LCIle6KaCp5ENuksW?=
 =?us-ascii?Q?dkC4gvBFIhMxEnk9WzHfyOKFlpdtO4qcbYFrMaEjA2jFZ5OVtBJIPichwVsn?=
 =?us-ascii?Q?Op2ndTIXq8Jfx7WpTupq6fMCIlQGeVUFGMtPIOc7kkB5d2gaP7T8SC/DCMsa?=
 =?us-ascii?Q?b9yQCThPdy3HLlCGl+G0An5BgAvzJFN19fuJG/+ehLGp6Pc+QYx2mGjax8w2?=
 =?us-ascii?Q?TGUwrV4QwfeMdxSXEP9/RzGtVrWDy4HGBNrgN8dsk3jrrcDvWaBNN5WjC1Si?=
 =?us-ascii?Q?4XffxMODXqZvZxcy3bTC6cAkgznIBzo5lYo6ohKfeB5NY5O8OTi1Ji2CGdYC?=
 =?us-ascii?Q?e2zGioOmBUwRiUjvjM+cTngEv290waciSy06QynzfiCdwN8haEt4RUXRTJJq?=
 =?us-ascii?Q?vL7qTrsQySGubcFERGBEXRk8gzkFC3J6o/EuZBnZYvmcMWOMk3b2YyfkvXSd?=
 =?us-ascii?Q?6wI9gnLjk3X7Gv6TukVamxk149n1wCZ3UtkFEHWZwKGv3ooXr0OB7QcT13LQ?=
 =?us-ascii?Q?W0AE2v9QB0F2/W+qtW0JIZ7fH0comtIMOxVjJzpYXlbBsrJmHfIm+4C2jtzD?=
 =?us-ascii?Q?J56INlq6YIyarXJvB/ZQUw7AXj9xapMAmd7QpchujH6cKBRZkcyCOaYEjQb8?=
 =?us-ascii?Q?NGSYO95fsl6vdti50uLw4ZgG+QjpDA7YMvM8Y0trL4bt25ab/XkeBvlWyE5o?=
 =?us-ascii?Q?ZGU/go6XeAw6T3oBqc/abes2tevceUjSqZPNGBKLUyl6nK0e3yOtSQT8ooIY?=
 =?us-ascii?Q?upGshkxXz9W27OaoGhHREYKSfspyb9xa55ZgK4Gz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9303b00b-4e53-4861-5bea-08dd6f6d35c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:28:20.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fpt4BUXbufLXhJwPG63NWJDMK9tGyUbDaF7gCPR0K6vdZQBBVj9sOLSzdBdEtewRmusbCWNaSyywVULAhEOeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90eb5 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=BxPZCSMkAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=57SyGIRnAAAA:8 a=0AgF8otmac6FBS3P_fcA:9 a=QI-fByHmJdxeabfFLagU:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cSGsH6EVExG9HcJ3RYpClq0XO4oZiBNl
X-Proofpoint-GUID: cSGsH6EVExG9HcJ3RYpClq0XO4oZiBNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116385

ChangeLog:
https://github.com/akheron/jansson/releases/tag/v2.14.1

* Drop backport patches.

License-Update: Updated copyright years
                Add an exception for `src/dtoa.c`[1]

[1] https://github.com/akheron/jansson/commit/2297a2e320ebecc6dc98f7034a2f38509ad1d7f5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Fix-overwriting-linker-flags.patch   | 29 -----------
 ...ols-starting-with-json_-and-jansson_.patch |  1 -
 ...-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch | 51 -------------------
 .../{jansson_2.14.bb => jansson_2.14.1.bb}    |  6 +--
 4 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
 rename meta-oe/recipes-extended/jansson/{jansson_2.14.bb => jansson_2.14.1.bb} (70%)

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch
deleted file mode 100644
index 5eee6f85aa..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson/0001-Fix-overwriting-linker-flags.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fe6e8eec7e7df4f1e72f0c9d9337b1fe11236687 Mon Sep 17 00:00:00 2001
-From: Thomas Heinrichs <46387399+Thomas1664@users.noreply.github.com>
-Date: Thu, 28 Apr 2022 17:36:54 +0200
-Subject: [PATCH] Fix overwriting linker flags
-
-Upstream-Status: Backport
-[https://github.com/akheron/jansson/commit/fe6e8eec7e7df4f1e72f0c9d9337b1fe11236687]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 39b9ad365f78..ed33e3c47f70 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -342,7 +342,7 @@ if(JANSSON_BUILD_SHARED_LIBS)
-    )
-       list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES "-Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
-       if (VSCRIPT_WORKS)
--         set(CMAKE_SHARED_LINKER_FLAGS "-Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
-+         set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--version-script,${CMAKE_CURRENT_BINARY_DIR}/jansson.sym")
-       endif()
-    endif()
- 
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
index 30b30b8850..a1c17d1d8e 100644
--- a/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
@@ -10,7 +10,6 @@ This makes symbols in the same visibility as built with libtool.
 Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/704]
 Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
 ---
-
  CMakeLists.txt | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch b/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
deleted file mode 100644
index 5298cfbefc..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 521d37abc0ed1178a39298d06d80d8d0e2a43e28 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 10 Sep 2024 00:48:00 -0700
-Subject: [PATCH] add back JSON_INTEGER_IS_LONG_LONG for cmake
-
-For autotools, JSON_INTEGER_IS_LONG_LONG is defined, but for
-cmake, it's not. This means such macro, which is also documented,
-is not consistent across different build systems. This is not
-good, so add it for cmake.
-
-This patch refers 8b975abca1055d40637c90b1dc4585af1d7df76c and is
-part of it. So the upstream-status is marked as 'oe specific'.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- CMakeLists.txt               | 1 +
- cmake/jansson_config.h.cmake | 4 +---
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 39b9ad3..0e95a94 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -193,6 +193,7 @@ endif ()
- # detect what to use for the 64 bit type.
- # Note: I will prefer long long if I can get it, as that is what the automake system aimed for.
- if (NOT DEFINED JSON_INT_T)
-+   set (JSON_INTEGER_IS_LONG_LONG 1)
-    if (HAVE_LONG_LONG_INT AND (LONG_LONG_INT EQUAL 8))
-       set (JSON_INT_T "long long")
-    elseif (HAVE_INT64_T)
-diff --git a/cmake/jansson_config.h.cmake b/cmake/jansson_config.h.cmake
-index 2f248cb..bec64da 100644
---- a/cmake/jansson_config.h.cmake
-+++ b/cmake/jansson_config.h.cmake
-@@ -21,9 +21,7 @@
- #define JANSSON_USING_CMAKE
- #endif
- 
--/* Note: when using cmake, JSON_INTEGER_IS_LONG_LONG is not defined nor used,
-- * as we will also check for __int64 etc types.
-- * (the definition was used in the automake system) */
-+#cmakedefine JSON_INTEGER_IS_LONG_LONG 1
- 
- /* Bring in the cmake-detected defines */
- #cmakedefine HAVE_STDINT_H 1
--- 
-2.42.0
-
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
similarity index 70%
rename from meta-oe/recipes-extended/jansson/jansson_2.14.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
index 4ac30c4dba..715b1af5c5 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
@@ -2,15 +2,13 @@ SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON d
 HOMEPAGE = "http://www.digip.org/jansson/"
 BUGTRACKER = "https://github.com/akheron/jansson/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
-           file://0001-Fix-overwriting-linker-flags.patch \
            file://0001-Honour-multilib-paths.patch \
-           file://0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch \
            file://0001-Only-export-symbols-starting-with-json_-and-jansson_.patch \
            "
-SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
+SRC_URI[sha256sum] = "6bd82d3043dadbcd58daaf903d974891128d22aab7dada5d399cb39094af49ce"
 
 UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


