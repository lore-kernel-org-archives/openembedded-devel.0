Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95D8CDE025
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:08:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13220.1763107707892624645
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SfSkAs8y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341359508a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE5HpoH1967562
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:08:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=grOdIFlrd7hDgpMIbsDt7557UsYUVd8BUWjV7Y7oUDE=; b=SfSkAs8y+RVb
	93qQvG1z0HmWiLk1iBQyZC0Oxdl+MxMOl3OJbBRsUCi9bDqxsjaWFfHa1bgqoE5R
	HL428qhcHpzxRXNsjnY0b4g4Peh8hxtX89n2FyeuvG0f3wEMEj6kppmMttcPfVEb
	0uSff5PXf0L8Zdsbtx/h2aFfZDXZZcuwKepqZDgIojj/XQxFI8gKJb3VBPA9yTUo
	LrI68B0ikecasbXhIaABG5emNX/EOPJBPAyzL6xxp84i1+uJJWEGSaFVT7TNMuGn
	qZ9Vnkely5hzFYokmeor/L2dNZKonad2Jf7rWZFj0CFXq67B8rTaVjgFv573cQVW
	ALzCvEMEFg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtk6r9fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:08:27 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 00:08:26 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 00:08:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] mariadb: support reproducible builds
Date: Fri, 14 Nov 2025 16:08:24 +0800
Message-ID: <20251114080824.2364576-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114080824.2364576-1-hongxu.jia@windriver.com>
References: <20251114080824.2364576-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2MyBTYWx0ZWRfX8cwAUEkm6TJV
 tUY0gU2RfJm/QPvmUbCaMQBYR6XZOKIJHGNDIZMMfkT+KGBQz1Mvwk4tTi+sePklp2tAmyuvIh0
 IaKKrHVeGDSb/cV32a0r/vMACCZ+gWlf8hepdI309PChRO1jAxfAp8/rJNwC2aURmEk7pwxHV8v
 ApV9bXLQ+gCySubaflGBOgukIy5Xd3dHJRzo1WtpZwe2uOjkrlW6/zN0jZicuKZothEUyqZrpiF
 K/PIP8niZqrrnESf8tGaaPqlm5I67XyJWBwr+13t77GoEuw6BWmc7oF+Nmlxs4RWnwKzzg50h0w
 hqAM/+Yq4jB3GhVxixN26d2B7fIJJ+DHgB3opUJiPXSQVolnKMeJncwOSyzZWh34t9mGGEmhCul
 T8O3w+ZH0RgbJka63MYPiEI4Mfe0mg==
X-Proofpoint-GUID: H7T66ziZTDC7xPR11tsvHTSJprcfw7N3
X-Proofpoint-ORIG-GUID: H7T66ziZTDC7xPR11tsvHTSJprcfw7N3
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=6916e37b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SsMK-6ewAAAA:8 a=mDV3o1hIAAAA:8
 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pkX5S8JXvW1tajwKmusA:9
 a=49hUO6naoDravHwzbBTq:22 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121690

In order to support reproducible builds [1]

1. While using bison to generate source code, add option --file-prefix-map [2]
to remove build path prefix in the generated header file.

2. Remove link directories for Yocto to drop source path
from compile link option

[1] https://reproducible-builds.org/
[2] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=dd878d18519689c7bbcd72de4c9f9e53085a3cbf

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                       |  3 --
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +
 ...CMakeLists.txt-fix-reproducible-buil.patch | 40 +++++++++++++++++++
 .../0001-support-reproducible-builds.patch    | 38 ++++++++++++++++++
 4 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 23af8d0183..83b790fa18 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -212,9 +212,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     lprng-dbg \
     lshw \
     lshw-locale-fr \
-    mariadb-dbg \
-    mariadb-server \
-    mariadb-src \
     mce-test \
     mime-support-doc \
     minifi-cpp \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e07f1ffa9..a757a10bfe 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://riscv32.patch \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
+           file://0001-support-reproducible-builds.patch \
+           file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
           "
 SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
new file mode 100644
index 0000000000..c34ec92415
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
@@ -0,0 +1,40 @@
+From 5e53d0f2ef08b0805136adf580b5e84fee9fcfc9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 14 Nov 2025 15:35:52 +0800
+Subject: [PATCH] storage/mroonga/CMakeLists.txt: fix reproducible builds
+
+Due to the link diretory includes source path and then the compile option
+-WR,rpath,xxx caused the generated libarary not to be reproducible
+...
+|path-to/mariadb/11.4.8/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ ...
+-Wl,-rpath,path-to/mariadb/11.4.8/sources/mariadb-11.4.8/storage/mroonga/vendor/groonga/lib:
+path-to/mariadb/11.4.8/sources/mariadb-11.4.8/storage/mroonga/vendor/groonga/vendor/plugins/groonga-normalizer-mysql/normalizers:
+path/mariadb/11.4.8/sources/mariadb-11.4.8/libservices: ...
+...
+
+Remove it for Yocto without regression
+
+Upstream-Status: Inappropriate [OE specific, the removing code may matter for others]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ storage/mroonga/CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/storage/mroonga/CMakeLists.txt b/storage/mroonga/CMakeLists.txt
+index 1538b6cc..cdccb2c5 100644
+--- a/storage/mroonga/CMakeLists.txt
++++ b/storage/mroonga/CMakeLists.txt
+@@ -298,9 +298,6 @@ else()
+   set(MYSQL_LIBRARY_DIRS
+     "${MYSQL_SERVICES_LIB_DIR}")
+ endif()
+-link_directories(
+-  ${MRN_LIBRARY_DIRS}
+-  ${MYSQL_LIBRARY_DIRS})
+ 
+ set(MRN_ALL_SOURCES
+   ${MRN_SOURCES}
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch
new file mode 100644
index 0000000000..10e6f03df6
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch
@@ -0,0 +1,38 @@
+From ff394a977e699e1b757c6e83143e1f330e20ca37 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 14 Nov 2025 12:38:20 +0800
+Subject: [PATCH] support reproducible builds
+
+In order to support reproducible builds [1], while using bison to generate
+source code, add option --file-prefix-map [2] to remove build path prefix
+in the generated header file.
+
+[1] https://reproducible-builds.org/
+[2] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=dd878d18519689c7bbcd72de4c9f9e53085a3cbf
+
+Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4440]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sql/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
+index 3a7c9d36..ac868072 100644
+--- a/sql/CMakeLists.txt
++++ b/sql/CMakeLists.txt
+@@ -400,10 +400,10 @@ ELSE()
+   CONFIGURE_FILE(myskel.m4.in myskel.m4)
+   BISON_TARGET(gen_mariadb_cc_hh ${CMAKE_CURRENT_BINARY_DIR}/yy_mariadb.yy
+                                  ${CMAKE_CURRENT_BINARY_DIR}/yy_mariadb.cc
+-               COMPILE_FLAGS "-p MYSQL -S ${CMAKE_CURRENT_BINARY_DIR}/myskel.m4")
++               COMPILE_FLAGS "-p MYSQL -S ${CMAKE_CURRENT_BINARY_DIR}/myskel.m4 --file-prefix-map=${CMAKE_BINARY_DIR}=''")
+   BISON_TARGET(gen_oracle_cc_hh ${CMAKE_CURRENT_BINARY_DIR}/yy_oracle.yy
+                                 ${CMAKE_CURRENT_BINARY_DIR}/yy_oracle.cc
+-               COMPILE_FLAGS "-p ORA -S ${CMAKE_CURRENT_BINARY_DIR}/myskel.m4")
++               COMPILE_FLAGS "-p ORA -S ${CMAKE_CURRENT_BINARY_DIR}/myskel.m4 --file-prefix-map=${CMAKE_BINARY_DIR}=''")
+ ENDIF()
+ 
+ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+-- 
+2.34.1
+
-- 
2.34.1


