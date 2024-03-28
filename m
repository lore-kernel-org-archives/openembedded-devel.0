Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4990CC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14142.1711628055853150648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 05:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m4Mh57cM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4817690a73=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42SA1Tlo009662
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 05:14:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=lZmHt
	U2YTnsXYFdFZncxJRWet17NevHizItS9KMwpu8=; b=m4Mh57cM/x6xo8WD7PhlX
	8O0HNztqmSQvMyTXDhSr95u0oocfrqcS3aViNb9R6Z5bMV8TJFRN8rO82RA4Ip91
	KL5Wq0JuosqivT/5YrRGjIOf1IOnzysN97/vMzjb4PG+GkRpavLQl0uo7ruZjFRd
	HPqnb0riuJL0domYakLfF2GB+8EsspHrs3YKgvCg01gpVRDNaWFC6tGBHJc5YqLJ
	IlI347NBY6YP/o33iPtvHGUQu0KaUnL6cxEYxCounkhGaPkWx5V16B9QUF5yY+ER
	BnU9tIF2vmXGRF6HCmf2EiN4K0OkwmRDuK/5rpizxWH+PlVyO02Ee2ZujfcEVQuV
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1tc0xp96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 05:14:15 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 28 Mar 2024 05:14:13 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] iniparser: Fix CVE-2023-33461
Date: Thu, 28 Mar 2024 12:13:56 +0000
Message-ID: <20240328121356.2365164-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: OBSQn47LJOsPbqRuV99EbSC3yKMhjFex
X-Proofpoint-ORIG-GUID: OBSQn47LJOsPbqRuV99EbSC3yKMhjFex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=912 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 12:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109663

From: Soumya Sambu <soumya.sambu@windriver.com>

iniparser v4.1 is vulnerable to NULL Pointer Dereference
in function iniparser_getlongint which misses check NULL
for function iniparser_getstring's return.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-33461

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iniparser/iniparser/CVE-2023-33461.patch  | 51 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
new file mode 100644
index 000000000..1b577fa33
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
@@ -0,0 +1,51 @@
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
+Upstream-Status: Backport [https://github.com/ndevilla/iniparser/commit/ace9871f65d11b5d73f0b9ee8cf5d2807439442d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
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
+2.40.0
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index 2810a4f65..7c23b514b 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -10,7 +10,9 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
-	   file://Add-CMake-support.patch"
+	   file://Add-CMake-support.patch \
+           file://CVE-2023-33461.patch \
+"
 
 SRCREV= "deb85ad4936d4ca32cc2260ce43323d47936410d"
 
-- 
2.40.0


