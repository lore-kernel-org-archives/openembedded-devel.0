Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D78CF64BA
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 05:14:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27962.1763615647101603146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 21:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lLnzHhU6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341940cbf5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4t103071231
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:14:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qLSxaZs48pdNymNEBysw
	TYaSHLuXvfvkU07cPYOTX+8=; b=lLnzHhU6mhtpWXuI287INQUeu4JNTG+fITbb
	L/5KQmoAgooS7qp2idEI5ijDfsMYzfMgLDxhcGpzIt6lTkZu9L3vkW+DrD4fwdIS
	fkgHf5IxkX4R6QGROttlf+SkmAwkl82bGFYIu+/UFVu1Pzgel43i8JIbNW7gTZGM
	FdwiQvU9RKYRHneDVijOymTldu6NIFDa/cLwWA5xlpUGOLRwdOTtnm2xqpYi/hfb
	uyGxN1hMUU8jV8eWsF/ofDOq/rGXY/t+SXXYfzKUaFlboN1rv9RLLt7eqJiE565+
	yRLkICtf8sEC89Yz9AP7mg/XDF7vm/azfr8hTZ7kvzJfOmgLEw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2wx5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:14:05 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 21:14:05 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 19 Nov 2025 21:14:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thrift: support reproducible builds
Date: Thu, 20 Nov 2025 13:14:04 +0800
Message-ID: <20251120051404.2231799-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAyOCBTYWx0ZWRfX3P3hVxwp+qDs
 d+EB59eRZ0LtIKnfXeotgJG7vIv9qLMqdXJm+wyPn82kUDuNxDqJ/PTua1hLueB8RGIJGxZ5wX/
 vOqUdRYEH0qiTD57rrLbYhWxAlcgmxXyG71KAhKiC3DTO8RyQdttD6yPiQNlbzCevzVplqJ4C/h
 f1845jXy1otI+dgc6J/1oCrfDjslPYvoJwTrQPY5fF3j0Kuw7lSbKgiDONtK653Boj5qSjP9gnu
 XrmpDw+Ap1QKERnRAdt9kUqef37sH+QxJK9wLYY/cY1us1eeEDlN9oRK/W9AsQrfwXVMNEbwg6M
 wDhufAQYHZvNE+/J7zGh1SX2Nfyfv4AgaDIOJ2C843sxz0ZiVOolEokhTQEPp83KkZQNvCJuU94
 J6RpGO2FIVDvEFBCNe8xpzTTmsGdAg==
X-Proofpoint-ORIG-GUID: Xk8_wdVnCJwn9JdqN3B7vtsZ4ux8UMxT
X-Proofpoint-GUID: Xk8_wdVnCJwn9JdqN3B7vtsZ4ux8UMxT
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ea39e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SsMK-6ewAAAA:8 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=k7TvBiywjsa08gjsEy8A:9
 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 05:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121924

In order to support reproducible builds [1], while using bison
to generate source code, add COMPILE_FLAGS --file-prefix-map [2]
to remove build path prefix and source path prefix in the generated
header file.

[1] https://reproducible-builds.org/
[2] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=dd878d18519689c7bbcd72de4c9f9e53085a3cbf

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                       |  1 -
 .../0001-support-reproducible-builds.patch    | 49 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 1f55f5bee1..186ff9a488 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -200,7 +200,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     libsource-highlight-dbg \
     libsource-highlight-dev \
     libsource-highlight-src \
-    libthrift-c-glib-zlib-src \
     libvncserver-dev \
     libwebsockets-testapps \
     libwmf \
diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch
new file mode 100644
index 0000000000..7fad4ddaa6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch
@@ -0,0 +1,49 @@
+From d4c19c3c88200c49d48c9d47971977627f98f51b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Nov 2025 11:43:45 +0800
+Subject: [PATCH] support reproducible builds
+
+In order to support reproducible builds [1], while using bison to generate
+source code, add COMPILE_FLAGS --file-prefix-map [2] to remove build path
+prefix and source path prefix in the generated header file.
+
+[1] https://reproducible-builds.org/
+[2] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=dd878d18519689c7bbcd72de4c9f9e53085a3cbf
+
+Upstream-Status: Submitted [https://github.com/apache/thrift/pull/3246]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ compiler/cpp/CMakeLists.txt       | 2 +-
+ compiler/cpp/tests/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/compiler/cpp/CMakeLists.txt b/compiler/cpp/CMakeLists.txt
+index 4c1c2c5..a1a8fcb 100644
+--- a/compiler/cpp/CMakeLists.txt
++++ b/compiler/cpp/CMakeLists.txt
+@@ -30,7 +30,7 @@ find_package(BISON REQUIRED)
+ file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/thrift/)
+ 
+ # Create flex and bison files and build the lib parse static library
+-BISON_TARGET(thrifty ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc)
++BISON_TARGET(thrifty ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc COMPILE_FLAGS "--file-prefix-map=${CMAKE_BINARY_DIR}='' --file-prefix-map=${CMAKE_SOURCE_DIR}=''")
+ FLEX_TARGET(thriftl ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thriftl.ll ${CMAKE_CURRENT_BINARY_DIR}/thrift/thriftl.cc)
+ ADD_FLEX_BISON_DEPENDENCY(thriftl thrifty)
+ 
+diff --git a/compiler/cpp/tests/CMakeLists.txt b/compiler/cpp/tests/CMakeLists.txt
+index 6a078ec..39f5bb2 100644
+--- a/compiler/cpp/tests/CMakeLists.txt
++++ b/compiler/cpp/tests/CMakeLists.txt
+@@ -45,7 +45,7 @@ find_package(BISON REQUIRED)
+ file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/thrift/)
+ 
+ # Create flex and bison files and build the lib parse static library
+-BISON_TARGET(thrifty ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc)
++BISON_TARGET(thrifty ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc COMPILE_FLAGS "--file-prefix-map=${CMAKE_BINARY_DIR}='' --file-prefix-map=${CMAKE_SOURCE_DIR}=''")
+ FLEX_TARGET(thriftl ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thriftl.ll ${CMAKE_CURRENT_BINARY_DIR}/thrift/thriftl.cc)
+ ADD_FLEX_BISON_DEPENDENCY(thriftl thrifty)
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 9c50317eff..8ca1d0085e 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -10,6 +10,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
+           file://0001-support-reproducible-builds.patch \
            "
 SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
-- 
2.34.1


