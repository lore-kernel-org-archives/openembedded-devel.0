Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6041C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 09:45:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71212.1669974294899521511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 01:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dppgOXcQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=933539f9f9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B29dNRF019552
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Dec 2022 01:44:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=7CzWTYV614wyEnHhX1JLa0AyhKkn6naTMxKQxgpZ//c=;
 b=dppgOXcQ0vqZaLGlid0P4XtaIhjUSRV+zLdXtbPCkM1zxxjRPC37Qphe9qjBDq1sTgrJ
 rDEpn0rs7Gt6d65nhQ/A8f6U6cosjU3dvTv28YGqoNL3/E23gEFu5AWPXfqHUcowG5S6
 urtBbp7EW3uzH/VIqR/UmHuA2wAR57kF7ClBIJFaghc3cNpdRE5pAW8BleoZ3XnPjKhD
 OP6UrYOP8OVPXP+2a9cW7FyxCTm5GImOML7wh/Mzit5Tbf9G064V8mwBXyDrwQfvGBi6
 wSkVq2VRliMaB9EsFZ5KEgOjW5JAERIlT16YPPTocq0M2mByJLTuHs0I5hUZ/L8HzD4j pg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey954hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 01:44:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 2 Dec 2022 01:44:53 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 2 Dec 2022 01:44:52 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] keyutils: fix ptest failed since "+++ Can't Determine Endianness"
Date: Fri, 2 Dec 2022 17:44:52 +0800
Message-ID: <20221202094452.2379260-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sdWVPx3FqUAaW4FVYtDfa0h_VLPcUzVB
X-Proofpoint-ORIG-GUID: sdWVPx3FqUAaW4FVYtDfa0h_VLPcUzVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212020075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 09:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99911

From: Changqing Li <changqing.li@windriver.com>

All the ptest cases are failed since error "+++ Can't Determine Endianness",
update the regex for matching the endianness to fix this issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...c.sh-update-regex-for-getting-endian.patch | 35 +++++++++++++++++++
 .../keyutils/keyutils_1.6.1.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch

diff --git a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
new file mode 100644
index 0000000000..728f464331
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
@@ -0,0 +1,35 @@
+From 935a31dd6f14bd1aff735495f0fdbae4ca05c695 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 2 Dec 2022 15:35:40 +0800
+Subject: [PATCH] tests/toolbox.inc.sh: update regex for getting endian
+
+Update regex for getting endian in following condition:
+/proc/777/exe: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2
+
+Upstream-Status: Submited [Submitted to keyrings@vger.kernel.org ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/toolbox.inc.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
+index 1964450..e827e20 100644
+--- a/tests/toolbox.inc.sh
++++ b/tests/toolbox.inc.sh
+@@ -13,10 +13,10 @@
+ echo === $OUTPUTFILE ===
+ 
+ endian=`file -L /proc/$$/exe`
+-if expr "$endian" : '.* MSB \+\(executable\|shared object\).*' >&/dev/null
++if expr "$endian" : '.* MSB .*\(executable\|shared object\).*' >&/dev/null
+ then
+     endian=BE
+-elif expr "$endian" : '.* LSB \+\(executable\|shared object\).*' >&/dev/null
++elif expr "$endian" : '.* LSB .*\(executable\|shared object\).*' >&/dev/null
+ then
+     endian=LE
+ else
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
index 8a95a15f6f..019118f38b 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
            file://fix_library_install_path.patch \
+           file://0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch \
            "
 
 SRC_URI[md5sum] = "919af7f33576816b423d537f8a8692e8"
-- 
2.25.1


