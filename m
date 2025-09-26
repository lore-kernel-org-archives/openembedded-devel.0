Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1443FCAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:20:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12562.1758874798825434478
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n5jWLBWi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q4FkZ41581083
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=56Gw75tG3/wKQCmZ5EFmNWG/rU6tC3YpqC+ZPEtsxNA=; b=n5jWLBWirek2
	nq+VyxK8PdcQImAQAH3nSqxCDLkbPD6A5AfARcc8yoWmMEwpR/dCBBI+/KpMnuky
	721CIO8EH+K/NOPYDtiq2rXXY/fbi3SWzar+6IsPNNl35bACXxkdjIGe6ivbpZnT
	Pjlt3KuSxfx61t4wNguRl4wvEuvXLs44czole+fmYKhOdQr6VyAVEZUqM2ZsWF2w
	PRlPZINN9TluVltNOMMCfs6SKc8sywQ5VA/qbYjQ89ekWJaS0BMadxH/dRfK92rK
	znymkfSaHo93vgrqDPW80WI2ek6bdSmokI6PS5ke7ZuLjaWwqyY0kKBRoU8jxSZE
	jPNk4llhVg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8jdh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:19:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:19:16 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:19:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v4 2/6] python3-propcache: support reproducibility
Date: Fri, 26 Sep 2025 16:19:10 +0800
Message-ID: <20250926081914.3127272-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081914.3127272-1-hongxu.jia@windriver.com>
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WiWnohR63_3aIDNZS-w0qGApqPYQCXKg
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d64cad cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=BbirK1CDs2gZwnygIKIA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WiWnohR63_3aIDNZS-w0qGApqPYQCXKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NiBTYWx0ZWRfX/JblG9qXmM6L
 1dCGUywVaL/RmrPfbRrsE7LlFBn+1/hmzRr1Dsps7a2suez/KrrOlaxiXNcPHxDPrgYRhBvSwa7
 Ek4dKfXrSgNiI9OKGGaep4V46t9a099yHt1CtB+GR9ICszSfdCID1W6x7GEzV4E2Itr/I8C/XE8
 Do1QDad3Py97wMIvY4fOLNb+pjEjIl8Tky74ZvGAZdEiMmQsqCkmLkFp/kah0Rreot3BUsj2tmu
 ezX6a+e2odycD6Zz6pgmtY4fPFtHuVTBBultKbVnh5ne4fhxB8aMRXkuNBEtgHxHQFr9QXOJbYk
 sWkeo86TthNn7Ey3hnIp0Ma2lFegFR+hf+WK3b1rl4n3KnlV9bLaIgrnbBdYmdCSZNjPRb0dvZB
 M3wdTzzGwq0ZDLYLkRDGxVN253z5rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119900

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

Note: To support reproducible, it also requires oe-core commit [1] to be merged

[1] https://git.openembedded.org/openembedded-core/commit/?id=61d98d12eca1c7bdf3b7387a820c83d3b8fad965

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-build-wheel-in-place.patch           | 31 +++++++++++++++++++
 .../python/python3-propcache_0.3.2.bb         |  4 +++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
new file mode 100644
index 0000000000..84f81da775
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
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
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
index e78d7b3428..8e2394a5c4 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c70
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
+SRC_URI += " \
+    file://0001-build-wheel-in-place.patch \
+"
+
 DEPENDS += " \
 	python3-expandvars-native \
 "
-- 
2.34.1


