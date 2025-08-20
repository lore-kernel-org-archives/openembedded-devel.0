Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F15CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15330.1755679580852609673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YPYPhm83;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03271322d7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K7oZ1g3274624
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dFcyDdQ3bwc5+r+eEwjO
	JtXjyMQg0ZyYycQDjfHtk58=; b=YPYPhm83LGxCHzosny09xikmv6C2biKulrN8
	SY8n0oc9sInH+z8BXfQL7eACxsHhR+nze6DggfWCwobawiVSGO+FzwjCnQbkLGUL
	nSlHsoer3jiI4yaM6POqxW5XqYynAs+wBKXomRCZ2UPohQZ6ClHkQtfK4Z/1tmaC
	5pTV3pdIiMWcZVSerskwkX7y8UTaULwMVYxzSdgR1x9SJLppeb3h+vehQznN8MqZ
	OL88QAkLMAeI3lEEA2WtrTDE+uVgAdco9eFvTZdfVCxpXMTS71oOFjbZUF3QWXYa
	Fhy2KhsyXrSnYw6t2FILhO9LjaW/wVALtlDPIFr195rYkeev1w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq0gxq-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:46:19 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 01:46:03 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] postgresql: upgrade 17.5 -> 17.6
Date: Wed, 20 Aug 2025 14:15:41 +0530
Message-ID: <20250820084541.2054378-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: 6PKYHJFy_XhdUzrToJaT2UolAXXVOttq
X-Proofpoint-GUID: 6PKYHJFy_XhdUzrToJaT2UolAXXVOttq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA3NiBTYWx0ZWRfX8jWikteC/zAf
 GGQv+d2JNogEgCcUCrBS/9Yj8iopUaqYoWkdvszWVBDuYEwhgWnLDyJjORo+WCEVBB9xv78FC97
 FknjqWE8VcDf3edpGzFPWpDb4xnQEQC9BI5pRu9lNOOM8R4fLb7tid0xDY8yWTB50biTecQ2qZ5
 /EhqdSTmT/C9hlWXQ8dVGqQnDwknmTQFehErKuGtL1mzGriM7sWiZG1Yi+ldGI3XQWLifl0sfyO
 E+Apn7+7pQQTY9BOnJEj7nQ7wBAPk4/VUhxx9ixtKFufZKlRsgcCuOOKEFB5Qlcj3M83bolpdAC
 OZsa/JNVdoeD0nFCF+FuO7rbs/iky2vD0i7uNJw2vigBJPXBu+R3EGa68pHe2PmanvbdM4XEvBc
 oTkgfr2cwN4tROBgH+TsWBJRPMYUQg==
X-Authority-Analysis: v=2.4 cv=SPoblOvH c=1 sm=1 tr=0 ts=68a58b5b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8
 a=bAYW-0WZY4zRW3ytb3UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119040

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-8713, CVE-2025-8714, CVE-2025-8715

License-Update: Align organization wording in copyright statement

Changelog:
https://www.postgresql.org/docs/release/17.6/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
for 17.6

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_17.5.bb => postgresql_17.6.bb}   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.5.bb => postgresql_17.6.bb} (76%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 4382741da9..95070b98c5 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 84febaf9330fe99802f75bcd0606ac7d86c35b25 Mon Sep 17 00:00:00 2001
+From 30b1b37d309f67ba6d58f2197bd917107bc7d56c Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 493d5cd..f0fa973 100644
+index 642dbde..af37179 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.6], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
similarity index 76%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
index b7fce886f8..9ddb40fefa 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8"
+SRC_URI[sha256sum] = "e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.40.0


