Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04DDCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 05:15:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1952.1755839734780044990
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 22:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JHW3ThpO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0329417d5e=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57M4bnE9021988
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 05:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+M0pau+XgTRHT6ZLOaXT
	xzYcCocRIklx/P45riibAjQ=; b=JHW3ThpOVga8VAzRQ7F3rEN6rD+jAuUX9m43
	AmyPg5R3P/kDJf+063EgedATRj3DnC2DQ26WaPZisVUrDpZyVjCjlAqDjV0qzDcX
	lwAsJud3V6fTIVWP/nhtCLqIsMtrKiDXHOOsN+YfjNIJW/Cw6Zr2JeXSdY77hZdc
	ZPVyYLopgM72qO29RDHD5YQ/o0DOa4g3k7tzkvTEc92EnFDQ2Vd2ZEorLlt2NDka
	EbkUI94jPWW+eNo4ZfUcYclPACAwptgrzKBS30o09e/AzGfZQfys4B5IkHmfOfQd
	TYvac8oMDq43rLObmEZrWbzcwiia0dx1Oqxm34HoZyesbg5HYA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjthk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 05:15:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 22:15:27 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: upgrade 14.18 -> 14.19
Date: Fri, 22 Aug 2025 10:45:03 +0530
Message-ID: <20250822051503.834240-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDA0OSBTYWx0ZWRfX3QPzVmGrJ6Q8
 pEa6oG7hXtPI0nReXSqDSE1ZwZWNoG8h6xD3M3JIeDaUTR/hPZBXB9MyjpZICDdYrJWP1NHcDn9
 uoqqHk+BIf5JUmaaTlL1uDnd+UjoVT+GAbrdgk5iY/+1yUpQylE1hucmb0TKX7SYZJ7xYYubrbH
 VWZzx58X7r/JhpaF3AvlMp04QevrhO3iRTUSzqLdfFnWMXKjWURKZMcdHdC34gDjpyQz3GVV/mD
 KCP26OpOxnMo3LZrhO3u4Lb4uEuBB8St3K7Itzoca1ZVBSmARBCtw6z4b0Vp71HgseXnvMA4CRW
 4KRpvig/SGFzNEY9AoNmRPKqWYHo7Cjsz69dRkCmUK+cswC9rgDpxiflXDFnP7tcWtAlRqfv+W4
 6qEPDxiZHh/1CHhHzKwjqKhhqHz/eg==
X-Proofpoint-ORIG-GUID: Rb5YTcspxvJWTfZCBFN2-tjo7X5iZdIZ
X-Proofpoint-GUID: Rb5YTcspxvJWTfZCBFN2-tjo7X5iZdIZ
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a7fcf5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=2OwXVqhp2XgA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8
 a=bAYW-0WZY4zRW3ytb3UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 05:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119083

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-8713, CVE-2025-8714, CVE-2025-8715

License-Update: Align organization wording in copyright statement

Changelog:
https://www.postgresql.org/docs/release/14.19/

Refreshed 0001-configure.ac-bypass-autoconf-2.69-version-check.patch
for 14.19

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...1-configure.ac-bypass-autoconf-2.69-version-check.patch | 7 ++++---
 .../{postgresql_14.18.bb => postgresql_14.19.bb}           | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.18.bb => postgresql_14.19.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 2396be2df9..4b471caa25 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bbbb204..0919d2b 100644
+index df565fb..5007057 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.18], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.19], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,5 +27,6 @@ index bbbb204..0919d2b 100644
  AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
---
+-- 
 2.40.0
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
index c9616c21ff..1d8ab90c25 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "83ab29d6bfc3dc58b2ed3c664114fdfbeb6a0450c4b8d7fa69aee91e3ca14f8e"
+SRC_URI[sha256sum] = "727e9e334bc1a31940df808259f69fe47a59f6d42174b22ae62d67fe7a01ad80"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.40.0


