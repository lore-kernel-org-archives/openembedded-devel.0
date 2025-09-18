Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A42BCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:16:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8194.1758179753357831077
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BJAkI55q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13563ce15f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5cBEC2526535
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fFw7+qURPIEbOX4HkVpVxYjzNzGW1eXhsiMM387qQpU=; b=BJAkI55qf9yV
	bxq3vVyvLyalEmC6b0wic9AyqnXWZATT4S5M/ATG5ZE+YGzzCQ/vW9lB1x/FVeIR
	vvvMexwntsNkEVmSNasC0cCoJhWZRTvCvl2kj+DosL/uNw1aNCARPMGGcQq8ewIj
	kMVJwR5kdviOmKaVZLxUIFBkc+JnpPgKiG3jwM4V1ErXKm6jp0wazF7Sd6bw+L9M
	IPWnOgBa3HP39mBl+HFXwdFX7t9pUnTUo4nmznaz6adRFF0qQaFfIAanckCY8Niw
	Ik45f8cYkm9irZTREqafkgc4K2PdpOP3m40Rq3HzOtNyVNA+O//u8trsXPPeLJji
	0Mb75DoxbQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwssrrn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 00:15:51 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 00:15:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/4] python3-frozenlist: support reproducible
Date: Thu, 18 Sep 2025 15:15:46 +0800
Message-ID: <20250918071548.3934769-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918071548.3934769-1-hongxu.jia@windriver.com>
References: <20250918071548.3934769-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: N2hlrha_fSV156ugmtf7v7Pzq36BhVXk
X-Proofpoint-ORIG-GUID: N2hlrha_fSV156ugmtf7v7Pzq36BhVXk
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cbb1a8 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=BbirK1CDs2gZwnygIKIA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA2NSBTYWx0ZWRfXzuUZqxU7O3TC
 WR7DY+2PTTjXnm+Xg6YYulKorOSq+i5LYEMUOqcjZz4LF2TpUgnZ9eE+TXc3K/3DBOKc6rkHo7b
 lqen0obdO28l3g7EPVukIrf9StxT0F6PcQVdVXykpmj2aOhFdWOuYPSlBNJGkN3AcQ3/PE4fHcR
 k22W/p5ffPGlOBw8KhwOtQ9sAsT3RBZm7HfRh1aeaE5adlV3VD3JGbfRseyeo9tmGL66VLU2/5x
 B+CFxCrPHXaGTissafKWZ6sz3u9TA94LnBP7pTupUyf9b2ShyrsA8SBVXXz5uzkVT5ERVAr0lR4
 fHrOmMsSaUQqqSk79wQTwQ6e+d4tJRrWO6fnAseYQTZYCvwjS5+bVgx2kZUvFg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119531

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

Note: To support reproducible, it also requires oe-core commit [1] to be merged

[1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D3&d=3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-build-wheel-in-place.patch     | 31 +++++++++++++++++++
 .../python/python3-frozenlist_1.7.0.bb        |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/files/0001-build-wheel-in-place.patch

diff --git a/meta-python/recipes-devtools/python/files/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/files/0001-build-wheel-in-place.patch
new file mode 100644
index 0000000000..84f81da775
--- /dev/null
+++ b/meta-python/recipes-devtools/python/files/0001-build-wheel-in-place.patch
@@ -0,0 +1,31 @@
+From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Sep 2025 15:41:09 +0800
+Subject: [PATCH] build wheel in place
+
+In order to make the generated library be reproducible, build wheel
+in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
+option -fdebug-prefix-map could work as expected
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ packaging/pep517_backend/_backend.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
+index 61cad34..d5d839e 100644
+--- a/packaging/pep517_backend/_backend.py
++++ b/packaging/pep517_backend/_backend.py
+@@ -316,7 +316,7 @@ def build_wheel(
+     """
+     with maybe_prebuild_c_extensions(
+             line_trace_cython_when_unset=False,
+-            build_inplace=False,
++            build_inplace=True,
+             config_settings=config_settings,
+     ):
+         return _setuptools_build_wheel(
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
index 7d813a026c..d832494c82 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
@@ -7,6 +7,9 @@ SRC_URI[sha256sum] = "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb
 
 inherit pypi python_setuptools_build_meta cython
 
+SRC_URI += " \
+    file://0001-build-wheel-in-place.patch \
+"
 DEPENDS += " \
     python3-expandvars-native \
 "
-- 
2.34.1


