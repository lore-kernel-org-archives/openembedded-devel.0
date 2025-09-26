Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1327CAC5B0
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 02:00:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7517.1758852027209282038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 19:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T7iUXTQb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q1oaC9810228
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RXzJKqwleTt4cWhY6c8j
	yWT2vBSu4LnzajbrSaFQLhI=; b=T7iUXTQb9+z2HQvs2rjLC4A2NEFbPbEwE8fM
	1+ZVYmVP6ut717tdqNbkJJdZxLefCmqktyzk+oE9TpYr7ys8sxgwawS+LkfT1HNt
	lsP2RrxIzxReuCUTKhK+dA6L6SI5OzqeQ6douaW1UiTNyc4RdVXFn7FFy11bX59h
	TuisNfrs+gayCwN+kUB2XYKz6Gt2NLQUsGcZ9KEMe3L2eNoxvx+qxK5j4eUbJO8T
	3Wp53fMuysj+sEASG/aZlZmMAl8Bn7xCRaGYn50C3bBF3FhBSpghujEt8mGi3GM8
	Tuyqs7h/ihj/lF8rxWOLzauuQ/Atcw2y2pSB4yNFTneVenR+kg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh89fw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 18:59:44 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 18:59:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v3 1/3] python3-frozenlist: support reproducibility
Date: Fri, 26 Sep 2025 09:59:35 +0800
Message-ID: <20250926015937.2916794-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDAxNSBTYWx0ZWRfX28Yp9dU4IiOy
 ZUPfv0fiT7gbKNpVFLYtSdhD1sZdTb2QZcS0vwYkXMkdB2cCmkgK2HTkm6Qp92JwWRPwRBP5NTy
 EvTkeHFAtWmXPEMnPj+x5neDXmfhI6ruVKWvBHlO9N0W9uAK1EHgC03ov4t2tmA5vpK1oUfboPm
 yxL395pMEbLThxz7yUmw3pcLpGUN/5r8kA1V5beDJctM7JcrA60JCp5Hk1SuZmBW7LA/kw+A6bb
 cfUdt/kV2VM1+xT6Gv0j+AwbhaXZqZ57zKwne2Q64aOifMVHWC/SzAuUnW0ux6MXZ12RDLoUZ6d
 9ucRkjyCAPtbFLOejkRHFqQ5rNhT5iUMuF88sxmkjACDRXGhd7aIUSCn4/v9SQYP8RHsZrcCXE5
 p84UYNefrNqQny0RxjGYuI3Qf0fwPg==
X-Proofpoint-ORIG-GUID: I5uA-cuxS29fpSr0I1TagA34dB6VGny5
X-Proofpoint-GUID: I5uA-cuxS29fpSr0I1TagA34dB6VGny5
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d5f3b9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=BbirK1CDs2gZwnygIKIA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119888

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

Note: To support reproducibility, it also requires oe-core commit [1] to be merged

[1] https://git.openembedded.org/openembedded-core/commit/?id=61d98d12eca1c7bdf3b7387a820c83d3b8fad965

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


