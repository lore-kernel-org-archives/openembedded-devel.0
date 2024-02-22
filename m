Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AB9C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 07:03:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7804.1708585398366487969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 23:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F5Dnvl1z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2782c7dc8f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41M4e3wO003201
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 23:03:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=AXDce
	oXeJ0n1eH830Nl6HJAJ5ZDblFhR0bp3/E329Uk=; b=F5Dnvl1zmI97j6Ya5Bqoo
	/7vxRHgwPlbiH5xEq44JtxVUXEo3mnBmpTHrjRjieocF5lKoHOuLGkpLL3z/wOf4
	uHMZTXEaphCzBVzJl1S/Z8mxlrXSCwGR3R8MDaPEzhmz7zd4EHlNbVJVovw4ezAL
	NyDONGqt9QLs4sCBTubShaSFf5ucYZzaBZVoFgYFmQg9AsXjNnd3SXMqZ78jZOKi
	qm95HbT2MvMTuEi7SaIXNEOcpBrWoNYZWLB0VhEE+vEOE8fO9wuxsg3RGslP6Xa+
	TXTfUuJ11N15hSOyw0c0cOy/Aj4E0uI9iuOaJvYquuF4j7pixUYwhEUHTlIFPsZl
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20csnmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 23:03:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 23:03:17 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 23:03:16 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.7
Date: Thu, 22 Feb 2024 15:03:15 +0800
Message-ID: <20240222070315.346679-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A0BXNvaoFbyIe7_XosyzCzDo1WAnhlou
X-Proofpoint-ORIG-GUID: A0BXNvaoFbyIe7_XosyzCzDo1WAnhlou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_05,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 07:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108982

From: Mingli Yu <mingli.yu@windriver.com>

As the change [1] introduced in 10.11.7, there comes below configure failure:
 | -- Performing Test HAVE_SYSTEM_LIBFMT
 | CMake Error: try_run() invoked in cross-compiling mode, please set the following cache variables appropriately:
 |    HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)
 | For details see /build/tmp-glibc/work/core2-64-wrs-linux/mariadb/10.11.7/build/TryRunResults.cmake
 | -- Performing Test HAVE_SYSTEM_LIBFMT - Failed
 [snip]

Considering [1] is mainly used to test fmt 10.0.0 failure and we use libfmt
10.2.1 now, so define "-DHAVE_SYSTEM_LIBFMT_EXITCODE=0" as workaround [2] to
fix the above configure error.

[1] https://github.com/MariaDB/server/commit/b5c367cd88e37091ab5f8dab0396c01c97d037e2
[2] https://jira.mariadb.org/browse/MDEV-30694

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.11.6.bb => mariadb-native_10.11.7.bb}   | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                          | 3 ++-
 .../mysql/{mariadb_10.11.6.bb => mariadb_10.11.7.bb}           | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.6.bb => mariadb-native_10.11.7.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.6.bb => mariadb_10.11.7.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 25dc15b46..9be8ef3eb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "1c0163463e98d71f4780741611a40981eee2bc44d392601ca49bbf948d04dd67"
+SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe258110e5157"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
@@ -96,6 +96,7 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DSTACK_DIRECTION=1 \
+                 -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
-- 
2.25.1


