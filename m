Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36078C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 05:57:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.155036.1692165435491752383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 22:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QiIoQZ5O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7592dbdee9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37G5DcOw022486
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 05:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=j45Do
	JBOM3sWK83gkFW8+8XECq0FUw5W/BxPR7aweSk=; b=QiIoQZ5OF6uY5lu3bZ9my
	0U/lKI/8yAewmoTBLcFnkuejrhrzA4RfLCPqczZRiixM2SeF0+OVgbDkyjkwBwmk
	JSXIzHlIUNp1gSwfBTp2Em2am23Pl9HTe3QOTjEduqo8bBlqEjWxQraZU9DQZZzq
	DOKNbrpK4XcY1HeSS4SusTZ0yFkk6zXQK2Qory7tV+Kej7rXjVeULqVXWwK8QzBG
	WYG+CjGsCMTnnclU7BWR5XJHjmdwcul2wdrVrYLEDBiO1XaqgJH4UGeBUfZCpvAi
	F3L61tkxFkktYdm0jmfsY9si49/KOmPALoZd1+aN9YsiL685ABdI2KBVI3jluSVb
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125uhrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 05:57:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 22:57:13 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 22:57:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.5
Date: Wed, 16 Aug 2023 13:57:11 +0800
Message-ID: <20230816055711.2298616-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KsVhS4VdmcKMD-imXX4gy-qNZsG-sDGl
X-Proofpoint-ORIG-GUID: KsVhS4VdmcKMD-imXX4gy-qNZsG-sDGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_03,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=712 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308160053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 05:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104410

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.11.4.bb => mariadb-native_10.11.5.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.11.4.bb => mariadb_10.11.5.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.4.bb => mariadb-native_10.11.5.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.4.bb => mariadb_10.11.5.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 2fb0bd7be..f364f47bf 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "ce8dac125568cc5f40da74c17212767c92d8faed81066580b526a485a591127d"
+SRC_URI[sha256sum] = "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
-- 
2.25.1


