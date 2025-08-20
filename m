Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3602CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:51:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15543.1755679855910732183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EJniZt4j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03271322d7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K6ZofF321815
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 01:50:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=y/9UpLA9MBqYf4xGC2ag
	+1A3/bFy8NC37hTOQoDUEBo=; b=EJniZt4jryqnald8SErUmzJqY5kGsYrL2SQ2
	13oxrGgeCw1qP+UodNaNscrlYbYL9Yy6XEmF0dU38QrrPLlzu+G3P5GGSqCQsYSe
	n8GTV3pwZov6F46D/L770dVIE3eKrE3e/OqvqKK0Mz/WZQxhBTfTZLP0cUyiBxhM
	9LMtnAqHWYvwDXiptwWGbwzWRJ+TnbgyjMlK5xlnySs/1aKvRaIFMFo8kwcQ7Qj5
	9P+SLHKarqW1mn/RuuQdl0oiW4wHaRyXn5IBORcTU/w2btuGNBsL8qiKq6NPvg2J
	UmRz1krSg+j60jpwAQ4Km+k8xDHIx66qM6MM4wMYXaMsksWj2Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydmgjb5-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 01:50:55 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 01:50:20 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] postgresql: upgrade 16.9 -> 16.10
Date: Wed, 20 Aug 2025 14:19:58 +0530
Message-ID: <20250820084958.3023878-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA3NiBTYWx0ZWRfX/9uT1ylYtC1W
 S3tehhYCxC291yirBXXCfe/r56uK3TmMvXA/AvL/rEHGOuTdBHBacKpUcCtz8MW3Jy0BJEwjZJY
 UXuEeg5jZCDyiNiWslQSVneVz8j2fIxMgxZfcLwyc9ZVRuq58sD2O7kQ0hnER+cHtQB1hJrj9F2
 QCWALJ+p9u1lFFKcuI3GevCcb7gCXroBhbFqyMj+q0qgN82+M1PzSckVuild8eNM7nU4PM3j8HE
 F5l1NOjJKlL0K8AZ8JrFr1UUAJhEDufXyxHMLWais88pzVrGvEiUXDJ2iDAAdwDxXwiaLuOuBed
 fcCMRD05ozGHZ0j55kpU3fLAxABjyyAAm+O2QF4acLUpA6KC/tHn9K2LaTBNdNpWqLNTa0jQLhj
 AJe3TqIR+Zj6LmzbYzcCdL+O18qnkw==
X-Proofpoint-ORIG-GUID: YWZY3W0k7Bvpp90Na4Fh8c7jg6Q8iJ37
X-Authority-Analysis: v=2.4 cv=INNbygvG c=1 sm=1 tr=0 ts=68a58c6f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8
 a=eG7aWNzutWAoOeBMYPIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YWZY3W0k7Bvpp90Na4Fh8c7jg6Q8iJ37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119042

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-8713, CVE-2025-8714, CVE-2025-8715

License-Update: Align organization wording in copyright statement

Changelog:
https://www.postgresql.org/docs/release/16.10/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
for 16.10

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
 .../postgresql/{postgresql_16.9.bb => postgresql_16.10.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.9.bb => postgresql_16.10.bb} (75%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index f78904192e..7707d238e7 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d707a0a..8895a3d 100644
+index 4f25567..b6b1eff 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.9], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
similarity index 75%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
index a1b80a5ad4..b1b8411dc7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "07c00fb824df0a0c295f249f44691b86e3266753b380c96f633c3311e10bd005"
+SRC_URI[sha256sum] = "de8485f4ce9c32e3ddfeef0b7c261eed1cecb54c9bcd170e437ff454cb292b42"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.40.0


