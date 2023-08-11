Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8151AC001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 10:21:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39614.1691749278680394474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 03:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IJR6Qp3m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7587f097e0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37B9orEp024075
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=THibu
	bFjyfFDpGSZpOK1ANOZE5PhrpldcGDx3jjkfZQ=; b=IJR6Qp3mfFTtlCC3kM+1t
	Ef9V7WtCYrQ0EjelYOpVxPhY79oeQBoqNXWxzdsvcjtEjSU/mN2ehTCZ8akApuyR
	tYervOpJUz+CkX/MrPEfps1c0jhcJYyC1ol1G6QZhkavUTF/k6WPFWhrksRVxR/x
	JxPE+Fel8FfvrA6KIXaKuMGdJAWqqGGl5rmc4pHMsOp7o2RRbGc2qu4bk0yh7OTE
	0SHN16PtCeK5gX8VDbzmMbK7XMArWUGVET+7gBY8GNjnjosZIhJq5rV0nQwO4nYT
	xYVcgZIwKNyTsWfgIUsatkw7Sb9toEiHN7j9JuqtaRuO2MiWM0Wvd2svbNC9mZt3
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sd926rdeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:21:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 03:21:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 03:21:16 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][PATCH] iniparser: Fix CVE-2023-33461
Date: Fri, 11 Aug 2023 18:21:15 +0800
Message-ID: <20230811102115.3507102-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tZM6RMkElYwgB02eH3-VmbOpidhbpDwd
X-Proofpoint-ORIG-GUID: tZM6RMkElYwgB02eH3-VmbOpidhbpDwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=938 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308110093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104336

From: Mingli Yu <mingli.yu@windriver.com>

Handle null return from iniparser_getstring to fix CVE-2023-33461.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../iniparser/iniparser/CVE-2023-33461.patch  | 52 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
new file mode 100644
index 000000000..ae714c531
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
@@ -0,0 +1,52 @@
+From ace9871f65d11b5d73f0b9ee8cf5d2807439442d Mon Sep 17 00:00:00 2001
+From: Antonio <antoniolrt@gmail.com>
+Date: Fri, 2 Jun 2023 15:03:10 -0300
+Subject: [PATCH] Handle null return from iniparser_getstring
+
+Fix handling of NULL returns from iniparser_getstring in
+iniparser_getboolean, iniparser_getlongint and iniparser_getdouble,
+avoiding a crash.
+
+CVE: CVE-2023-33461
+
+Upstream-Status: Submitted [https://github.com/ndevilla/iniparser/pull/146/commits/ace9871f65d11b5d73f0b9ee8cf5d2807439442d]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/iniparser.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/iniparser.c b/src/iniparser.c
+index f1d1658..dbceb20 100644
+--- a/src/iniparser.c
++++ b/src/iniparser.c
+@@ -456,7 +456,7 @@ long int iniparser_getlongint(const dictionary * d, const char * key, long int n
+     const char * str ;
+ 
+     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (str==INI_INVALID_KEY) return notfound ;
++    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
+     return strtol(str, NULL, 0);
+ }
+ 
+@@ -511,7 +511,7 @@ double iniparser_getdouble(const dictionary * d, const char * key, double notfou
+     const char * str ;
+ 
+     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (str==INI_INVALID_KEY) return notfound ;
++    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
+     return atof(str);
+ }
+ 
+@@ -553,7 +553,7 @@ int iniparser_getboolean(const dictionary * d, const char * key, int notfound)
+     const char * c ;
+ 
+     c = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (c==INI_INVALID_KEY) return notfound ;
++    if (c==NULL || c==INI_INVALID_KEY) return notfound ;
+     if (c[0]=='y' || c[0]=='Y' || c[0]=='1' || c[0]=='t' || c[0]=='T') {
+         ret = 1 ;
+     } else if (c[0]=='n' || c[0]=='N' || c[0]=='0' || c[0]=='f' || c[0]=='F') {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index f9e153016..166a74824 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -10,7 +10,8 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
-	   file://Add-CMake-support.patch"
+	       file://Add-CMake-support.patch \
+	       file://CVE-2023-33461.patch"
 
 SRCREV= "deb85ad4936d4ca32cc2260ce43323d47936410d"
 
-- 
2.25.1


