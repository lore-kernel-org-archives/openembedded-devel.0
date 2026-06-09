Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A66CD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 06:57:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73808.1780988237195483163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 23:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gk9ftlE5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062099a0b7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6595744T1636737
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 06:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=WHczw/MwtKazoEQj8CJhgvr57aw8GuXmZi2CTWVoHpw=; b=gk9ftlE58d/k
	e01SoXWtU9444WN41amGcWLCCFqpJxuLG4xFYXiLGPbz8WN/4RiN4UweehbiRO1J
	/l1J3zvHaEWHOjR8ec0p6dy1XZim5c9hUVZwpdVVVr9nOzYuxDNcz6Zh4H5z2vE8
	ByagZpq74+vVAp/guDIng+8SpdrnQvB7xYE6RAlpVqFE+zAbk4RBh+Irw3P08qtA
	GlQlXGimLbby/Bqnbd11ljkdmd9Xty7GC4cJ/vzfjT7TKEtPhVAIQQIxqtL1eeCR
	CsrN/wvjo0kcS14J9OA6zzsTRT1qW8F/LD0nzR9l2juprMgJz1UWPZLquj8XjX15
	Vh2Adb1+PA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7c244-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 23:57:13 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 23:57:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 3/4] minifi-cpp: Fix build with gcc 16
Date: Mon, 8 Jun 2026 23:57:11 -0700
Message-ID: <20260609065712.2888126-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260609065712.2888126-1-mingli.yu@windriver.com>
References: <20260609065712.2888126-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX/dAH/t7W0tgr
 FKrDpaChVITlNN41lIRzoY49n6GbcQtYHRqvfdR0K/L9Fmthw57n0yXX0SAcG8B+N3woIVzU89N
 7tuNgyI/L3YcFRBjPgilQyo7IBxz3u4pym9j5/iae1qIYikFst8vx9vN+ktHDthO0wKW6Yq4deK
 KYDPujazBiaiQqVw+1C9xudOi+DGr9aNgwglWchPyWrA1s2Zby4J72eCP5OSHgIcvB0CmOCswua
 sbmmv85q2KtJbLpNsY0V5TB+g/WQPToAKSOKorThFvLYJHJPa1ox+gSuyhnHt2+/f65K5nxsWXn
 TmN6ZX1DaxZbTzhu9YIIzYJqm1aVUT5MDLGTkBXRKpslHy2b6w0Ck0dIOwzexBr2a1asLjLc8qz
 rMkpUN72VYhxmLHO+qSNhsQv9HQxktgw928T6mR9sbrT2QwmDMzIa3VMb3aQedYSXx5qY8gTeLw
 WV9y+HCg67qLsbe/xtg==
X-Proofpoint-GUID: kC-GvvJOZ6fbtZu5kQYKobvAYIxH6bhL
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a27b94c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=bkB8zT-EMu8MVrPCFxwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kC-GvvJOZ6fbtZu5kQYKobvAYIxH6bhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127434

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  extensions/systemd/libwrapper/LibWrapper.h:38:31: error: 'uint64_t' has not been declared
  38 | virtual int getRealtimeUsec(uint64_t* usec_out) noexcept = 0;
  | ^~~~~~~~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-Fix-build-with-gcc-16.patch    | 49 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.2.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
new file mode 100644
index 0000000000..f1d83760b2
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-gcc-16.patch
@@ -0,0 +1,49 @@
+From 950aea28ffefd88f230d6bd25fa0352e9ca157c9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 3 Jun 2026 02:12:01 -0700
+Subject: [PATCH] Fix build with gcc 16
+
+Fixes:
+  extensions/systemd/libwrapper/LibWrapper.h:38:31: error: 'uint64_t' has not been declared
+   38 |   virtual int getRealtimeUsec(uint64_t* usec_out) noexcept = 0;
+      |                               ^~~~~~~~
+
+  libminifi/include/core/RepositoryMetricsSource.h:29:5: error: 'uint64_t' does not name a type
+  |    29 |     uint64_t table_readers_size{};
+  |       |     ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/2194]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ extensions/systemd/libwrapper/LibWrapper.h       | 1 +
+ libminifi/include/core/RepositoryMetricsSource.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/extensions/systemd/libwrapper/LibWrapper.h b/extensions/systemd/libwrapper/LibWrapper.h
+index d7e7b7c..c8af00e 100644
+--- a/extensions/systemd/libwrapper/LibWrapper.h
++++ b/extensions/systemd/libwrapper/LibWrapper.h
+@@ -19,6 +19,7 @@
+ #pragma once
+ 
+ #include <memory>
++#include <cstdint>
+ 
+ #include "../Common.h"
+ #include "utils/gsl.h"
+diff --git a/libminifi/include/core/RepositoryMetricsSource.h b/libminifi/include/core/RepositoryMetricsSource.h
+index 6c933b7..f39fccf 100644
+--- a/libminifi/include/core/RepositoryMetricsSource.h
++++ b/libminifi/include/core/RepositoryMetricsSource.h
+@@ -20,6 +20,7 @@
+ 
+ #include <string>
+ #include <optional>
++#include <cstdint>
+ 
+ namespace org::apache::nifi::minifi::core {
+ 
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
index 4ac5b87ba9..6c64046161 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
+           file://0001-Fix-build-with-gcc-16.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
-- 
2.49.0


