Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56088C19F2C
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:56:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6371.1659516963767579465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ChYaed+v;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52140db50b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2737Tjd7021974
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 3 Aug 2022 01:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=n6G1C8celaandyqaiEozcpXghS0IUAto/P271FKViSo=;
 b=ChYaed+vfXge/JpYNX7PFEcV2TUnVRkhmbHrK1gJVkZfvd7AzFRMh9siehLBAEzu3qGL
 u+cZowKSvI4Aa1mdRkC0ShSymgcvBxWCPWApZN26Lou4OTobp1KsExMh1hpAhKSnC2tU
 444FxlmLCFLJG1IdY0wwK26wPhdfUmYQV5bBB0NhSBNp12ydy09PnMvvbg7jCJtaBibs
 hTebHr+tLKxmhS00/DLuGswzhoBoMehukfJ/usgw+TAbSmAufnQl//yUuWyp+LkxQVX0
 KX6ejertPaeG8904UbEPd5oM63bAK9b0DWLU4vtM0KeKKPWFkskFaZRIcBCC6lGYDH6y Qg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hn45jtw8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:56:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Aug 2022 01:56:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 3 Aug 2022 01:56:01 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: Fix buildpaths issue
Date: Wed, 3 Aug 2022 16:56:01 +0800
Message-ID: <20220803085601.4079856-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TYw_MsQc4QWUi63S4yQfW4DBY9zJlsqO
X-Proofpoint-ORIG-GUID: TYw_MsQc4QWUi63S4yQfW4DBY9zJlsqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 08:56:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98110

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/bin/radeapclient in package freeradius-utils contains reference to TMPDIR [buildpaths]
  WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/lib/libfreeradius-server.so.0.0.0 in package freeradius contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...01-version.c-don-t-print-build-flags.patch | 41 +++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
new file mode 100644
index 000000000..697205efe
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
@@ -0,0 +1,41 @@
+From cbc64dcf6aa2a1be63f45ea6dd7d2c49b70a0bee Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 3 Aug 2022 16:44:29 +0800
+Subject: [PATCH] version.c: don't print build flags
+
+Don't print the build flags to avoid collecting the build environment info.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/main/version.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/main/version.c b/src/main/version.c
+index 62972d9f53..cf81de72c9 100644
+--- a/src/main/version.c
++++ b/src/main/version.c
+@@ -589,19 +589,6 @@ void version_print(void)
+ 		DEBUG2("  unknown");
+ #endif
+ 
+-		DEBUG2("Compilation flags:");
+-#ifdef BUILT_WITH_CPPFLAGS
+-		DEBUG2("  cppflags : " BUILT_WITH_CPPFLAGS);
+-#endif
+-#ifdef BUILT_WITH_CFLAGS
+-		DEBUG2("  cflags   : " BUILT_WITH_CFLAGS);
+-#endif
+-#ifdef BUILT_WITH_LDFLAGS
+-		DEBUG2("  ldflags  : " BUILT_WITH_LDFLAGS);
+-#endif
+-#ifdef BUILT_WITH_LIBS
+-		DEBUG2("  libs     : " BUILT_WITH_LIBS);
+-#endif
+ 		DEBUG2("  ");
+ 	}
+ 	INFO("FreeRADIUS Version " RADIUSD_VERSION_STRING);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index d6477e340..1407b798b 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://radiusd.service \
     file://radiusd-volatiles.conf \
     file://check-openssl-cmds-in-script-bootstrap.patch \
+    file://0001-version.c-don-t-print-build-flags.patch \
 "
 
 raddbdir="${sysconfdir}/${MLPREFIX}raddb"
-- 
2.25.1


