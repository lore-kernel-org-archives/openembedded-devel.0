Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E13C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 09:30:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8716.1711099858686104375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 02:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FbxgzlVK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38113fe0ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42M6nKhS032076
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:30:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=6sDhFEmHkF6NGKKiH8
	C/dch6NwGgCiszVR7Y6uJqqmQ=; b=FbxgzlVKn1RkIAGzqaPrSRT3y/lpNBsB5j
	9ZmdBZnI/IEDE7amXUd2ThM7CG+4SP++DiDMIQZUX5tylwq+Sr96iMRtdUoxb0Mu
	wQpLn30oKSq6AgfikJzmvXg8NQSzQcWAOOj+6RXXHFmBfhirWZaWzaeiKCnExOAA
	6wsG8gpANdJ/WK+Lrryywypfa6JJOA0THQAWdvvgQqczMYWoo45rC6nTsPuVGDba
	D+wbbCckSQml8IJT8xyTlP+Qc3TZwkzHYY9AvFzKtDttpQ6nTWHoXILHu+VtKzEA
	x9lSkhEW8E0Sv9OJWHzYWAhlxWLabSylqrbDvdTBE0dOs+MZXfYw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x0yuj0c2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5WaAvUpsTsIGVoklgs7195s6wByyV2ofuTb1Jx2YhJVUlnIqU+73WwJr0PO99ZqXFlYtdE4Gw+xsnO7CymlaM/hEPx7M1XMG7S4LMGGtF22LYuZQOIIMrRxkvKeU6/YXeuJ28M5mXVxLhEtzca0BI0+CJJViik9TduwtvbYZ5zJE8W7KwdbH0rz+VjBR4QH7iLI+iGFt1lgah0aSZX9Pf41Y17ODFndhowb4HDmRJcc6++5kIs/w7pjCg+r9YeZy64jtB6NDSoz/zyOZqXhjQ3cLzJn47V0NfRVZJVfnn9YvE9yJfgABLvi7SKDMu69h0BarFYmg+eK9yGOOJhL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sDhFEmHkF6NGKKiH8C/dch6NwGgCiszVR7Y6uJqqmQ=;
 b=NDVCOAQXv/IbH4SrCJZryPS0JON6riLS1uhWNPryxDZ3eM2I/rzR7rLz+/Ejxpa5vG9xn7S8nozpk/0jqplvn4XXjqWw4kFOgaG0GIgnu6rumIWDlirz/3ze0FY+bupjqYO78rFbGmTbAXBmuptyMV5/rcfGSLkjQDgPT/nkBJ4xivWI1u+mQ5o/tqSGpRHpdi6yxaiTR8GeXdCMOXzmlFbK5BxhzUZ+XEciRudMiaR3/yzFpVMC9xczS971Vd4W16z9IVQ+NrhyGbWuUJ37hJHnoiZ25a3mGmUtX54e6miQHCNhmyYfL6PIdCI+EzE57vqJVHOYCAMSPUch3CbbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Fri, 22 Mar
 2024 09:30:56 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:30:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.0 -> 4.0.1
Date: Fri, 22 Mar 2024 17:30:44 +0800
Message-Id: <20240322093045.3382031-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0197.apcprd04.prod.outlook.com
 (2603:1096:4:14::35) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c8c992-e93a-4100-62e1-08dc4a52c68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	28giYKajA1Tcuj/KAUBSAPi0DKGxNJQmDxco4/DU4vbX8bfIk7Zgf+VC11G8Wd2RNHzqQMmEa76TM7DtZHcEFyAHVmOrxBS1+mfVGC4cLyBVtE4xBtwXQyJzNYoM2BaHwYjcTJalK/qNbAh8H8xRXVxzIdz4tcuL4ovsECiOfK5g9yIcs8N6kEcSSCX46wEZG9GPVOUR4M1b7qX1tYD9wUsC2YvMNYkbJYsgwItGENUlvooGzdr7Sa2VK8jspRFw1dZbJy7epjXXW/M1ip+AZlfnfz3YBRstein9UbwnK2BP5GjZ5z+gQKwmMsoLeal1zXZL9Suxzaj30VF14D0kQ+wY3afznW5HEQpgA4c70GIDKtvpG0NJuYMiOZuQfjxCLW04c1U0n8AwimwqQJksYGF9Qx7ZNsuhn7iO8LnXOEZQKFSkwX1xAZQkosmReI8EW+9vIUrSQZk+FRkpytp3PjXHfKFbQyqbMb+jKZbWeqml+onilSyboXSbfD3s5zeguHdJsq3pKOlgma1IfG/uHrpqSN28fNUZyjy73yJWNhsRVAYN2RSsWsDu9sSTaBT5Av8gLyi7ebyj64LPk9ZW72G5jExzLV+FsMn/D4r66aTczceKzU611rPtbGfkJOBCqaazswoY8QpFupunDQ2cG7LWEQQ6Yu50MijhuofRzqWgWXFNQv7At8ebhMZf/m79QIDB2UbKaUN4pxqVsbiPliZvLpSZ7FtJfJO+rPrAsYQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VWNtMY6Tc3jIBCHn0No4Zq1cyF5oeungrfB4YkwR8ieY0VKikaf7ZUuaK9T3?=
 =?us-ascii?Q?rQTb7dq2YIJKE3zBemQexKD1al8NA/5iNX7CIcedHMvn2CNYv8VUVQJRf8LQ?=
 =?us-ascii?Q?XuHk/1pHa+ugo4ka0RCmGN41fx8NzL5YLATHAN23W/3B7jv5qrkaxKqipi4o?=
 =?us-ascii?Q?is1izSX0yYqtDJAYMmyJlbaoX+gwSFeX13m5fTJhz3tM4gQcDr9cCsPEY354?=
 =?us-ascii?Q?Ct8mW86pCO8ahoYDBE4PPnOtIvnaoSkd4R/wkqkuO8p5JH2OMwxHpVoIaU+z?=
 =?us-ascii?Q?dr4V6sFcwh01BtsMtmQmIL3o0Kl+BrXwlr5XUIfQeokzs6IsUwL9GEvLZKQg?=
 =?us-ascii?Q?PW6MKLyHKSt5TkZTQRWdCE7sKU86PKGcijIwAo/3r+rW7J42ZTKZB/DCqH8z?=
 =?us-ascii?Q?+/3mQbw+/nH0nJfOlX4pzg9BAoNwAZbusZ7o6Z//RY2dDi2z1YDC+cU8OvdQ?=
 =?us-ascii?Q?iNPYjdMX5a2knh0h1304t2BBT3wwfStq+y2gARPrZaXsUmTSwuMMz6zl5nhP?=
 =?us-ascii?Q?PpJS7njCTU6WHGGIJnEJxFrXELbaSTpR7KJ6dUitYuOP4t3qkGn0HKoihGfD?=
 =?us-ascii?Q?LO298Zzg53snW2YCaxz/OK8CviNGHCQL578zg2bO1k6a4FAno4/bCG4SBOYu?=
 =?us-ascii?Q?ThFqGyLl8yFHSdEQa0tGdw28OWOgsPXsFdyKqrVWRatgXO3bChf8RH6pXXsS?=
 =?us-ascii?Q?FdhbyTzANjrFoVo7veH4GUXE7QyoQIkb+DWiGbsmZdT4wiEAgAdrzemEGm/q?=
 =?us-ascii?Q?4LksC9yOdb8ZgQCCkKNqyQJigk0+R9hgA3afFQpvALiKjoWrlyIgt4XY9BQ/?=
 =?us-ascii?Q?5ojsI2Zq9+ee4QENgYOz323sf6d1+IMhuEoYfeWfHu+EkFwBFDLlTUOYDw4F?=
 =?us-ascii?Q?SXc9Elt+tbvjBVBNF6qQ3i55yM8yAbg7z3pveU+e3Kop833cjEwxL1X5Zj4r?=
 =?us-ascii?Q?nxI/vQDEiMJ4iBeQejgyQ7n7X3s0UlG12me2XUILXv0PoNne6NLCRUGY0YQs?=
 =?us-ascii?Q?nz28zEKvgZq+9MGZJFP+izDzoXUDSO1WAZnsXmt3YRSwoJlwlz5J65lqSpbc?=
 =?us-ascii?Q?jnhIZ9y4UjBZ5YcjZ51LbCePz1cbAnPG+kdYbmUmQUDpPfzg1qr+9rVrH8Nr?=
 =?us-ascii?Q?JXoxfocpF5TrkdQ8WhVGPViEVmJpFDkGW6+VbqQ991b+S6SE7qRARZZbi4jl?=
 =?us-ascii?Q?dJONd+XQqhieH3bRSIiogLrqux5o9nKriXTf8YOrlUpD0HHpYg3mpqi0I/2a?=
 =?us-ascii?Q?4uHDm+n5dXiprf5PjnUNNh3EtU3S8lZ35zLT2HQXZghviJVtVpLADmsirFSP?=
 =?us-ascii?Q?76YS95/HYFckslhTC5sUZbcVAEAkaHHpmRxZSEeamVgCposkwMGE1vzti58E?=
 =?us-ascii?Q?OppUDjUSkZZDiziHM9ieygjekPFP3gjglHeL8O2GBgNAsruC3qOTcNjDsCNM?=
 =?us-ascii?Q?H6aGJdv1UxA41ye1BYTlY2J1koVnZuOth/lWItm7BFd9M8hrNp6jAdrbCohQ?=
 =?us-ascii?Q?O6rKNk00OYlpIUKqIfM4e34fS97RKiuqdEQzvWKVvVvSdzHq0fJEGLv84wp0?=
 =?us-ascii?Q?yDLq5lEwC5ChXDf1s+zUCOncbwRHMznYukst/Y7z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c8c992-e93a-4100-62e1-08dc4a52c68a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 09:30:56.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnuVA2QvKGnc8R0zXuoXHLOI7aWAbKzlEAmS1Hy53Lh/ebl5ojLRauvvQjylnX2o8R2+DZCAcWcX0MfZNc+H8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-Proofpoint-ORIG-GUID: 8BqJmMN3TZWdmkQwjugr4SpsF7QX8R-E
X-Proofpoint-GUID: 8BqJmMN3TZWdmkQwjugr4SpsF7QX8R-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 09:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109515

ChangeLog:
https://github.com/linux-audit/audit-userspace/releases/tag/v4.0.1

Update TRUSTED_APP interpretation to look for known fields;
In auditd plugins, allow variable amount of arguments;
Fix augenrules to work correctly when kernel is in immutable mode;
Add audisp-filter plugin;
Improve sorting speed of aureport --summary reports;
Auditd & audit-rules.service pick up paths automatically.

* Drop backport patch.
* Specify runstatedir.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0002-Add-attribute-declarations.patch     | 35 -------------------
 .../audit/{audit_4.0.bb => audit_4.0.1.bb}    |  4 +--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
 rename meta-oe/recipes-security/audit/{audit_4.0.bb => audit_4.0.1.bb} (97%)

diff --git a/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch b/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
deleted file mode 100644
index 349142580..000000000
--- a/meta-oe/recipes-security/audit/audit/0002-Add-attribute-declarations.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 64cb48e1e5137b8a389c7528e611617a98389bc7 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <ausearch.1@gmail.com>
-Date: Thu, 25 Jan 2024 15:14:51 -0500
-Subject: [PATCH] Add attribute declarations
-
-Upstream-Status: Backport
-[https://github.com/linux-audit/audit-userspace/commit/64cb48e1e5137b8a389c7528e611617a98389bc7]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- audisp/plugins/remote/queue.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/audisp/plugins/remote/queue.h b/audisp/plugins/remote/queue.h
-index 36b70d04..2c70e839 100644
---- a/audisp/plugins/remote/queue.h
-+++ b/audisp/plugins/remote/queue.h
-@@ -1,5 +1,5 @@
- /* queue.h -- a queue abstraction
-- * Copyright 2009, 2011 Red Hat Inc., Durham, North Carolina.
-+ * Copyright 2009, 2011 Red Hat Inc.
-  * All Rights Reserved.
-  *
-  * This library is free software; you can redistribute it and/or
-@@ -25,6 +25,7 @@
- #define QUEUE_HEADER
- 
- #include <sys/types.h>
-+#include "common.h"   // attribute decls
- 
- struct queue;
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-security/audit/audit_4.0.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
similarity index 97%
rename from meta-oe/recipes-security/audit/audit_4.0.bb
rename to meta-oe/recipes-security/audit/audit_4.0.1.bb
index c8ab0d880..96ed6ff3d 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
            file://0001-Fixed-swig-host-contamination-issue.patch \
-           file://0002-Add-attribute-declarations.patch \
            file://auditd \
            file://audit-volatile.conf \
           "
@@ -17,7 +16,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 SRC_URI:append:libc-musl = " file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch"
 
 S = "${WORKDIR}/git"
-SRCREV = "ae7d2830391c1115cebff6340ef3130b1b03ce45"
+SRCREV = "22ccbd984e493524050ac445f796e9a7e90e1149"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
@@ -40,6 +39,7 @@ EXTRA_OECONF = " \
         --disable-gssapi-krb5 \
         --disable-zos-remote \
         --sbindir=${base_sbindir} \
+        --runstatedir=/run \
         "
 
 EXTRA_OEMAKE = " \
-- 
2.25.1


