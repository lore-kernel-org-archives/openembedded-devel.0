Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3879CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 02:00:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7518.1758852027384039042
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 19:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CpYcFBc9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q1oaCA810228
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kpNRw02+juVUdDDjnBKmW7Q+r+9HRZohkq1uLoGsfwo=; b=CpYcFBc9kA1N
	PfJcpJFA1iAj8MwJJbnzToQVDoEWu30DKaf2SxrE6hAZo6yJOUbYp0LL07ZXD41Y
	cP2uk53PAi9wtvtKRukEyjDxxKpqRXrSWu15oUaucasEgtMW0ad/uTe6nvhgv9ge
	k4+/LOuJLz6em9vNGjK7IgbH8u7wiP7cjNS1jAuHgguOA83Zye1FfZV6XYfXTKVw
	2Aqm1W/WdKgQnm0qceqtkaLJ28Oly0X0+rk4w0lmutAzok8/Kvbr6Y7ODLuuy7o+
	/vQMPijdjm8i/D87mBRN0rfs+PL8zJq0IZHcHAv52nKC8uYw3Y25sv/gLu+Xht1W
	mWwpPDy3BA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh89fw-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 18:59:45 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 18:59:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v3 2/3] python3-propcache: support reproducibility
Date: Fri, 26 Sep 2025 09:59:36 +0800
Message-ID: <20250926015937.2916794-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926015937.2916794-1-hongxu.jia@windriver.com>
References: <20250926015937.2916794-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDAxNSBTYWx0ZWRfXxk9lY7QqB7Pk
 uSDY8wWN/eI1Bh1OzztTgOnfEcyG9cd9vah6S6L6lrr7ErDtL9bmfRwx05Wvb0U/1W+LHM1DC8J
 oB3jQwvN+6A6rZ/hIZJw763QJ4BUuXxqh0ME/ZcrDnI6hHtk6d3hQwcRYZiHQTDI30Em/SjLCQj
 u4eHKFVlaKF5YeHby01Wbnh7QwwCMRcvG59+0QAtL2T/QFwUAV5soGkpt3scunNbvnsOZs9M1aU
 +nGXLY9TZymhnrWd65SypGql3XzjluiX8rl+I/Zupk7/NiDU/Iasf142Ebnil31CUmLn4gxAM/N
 9P4zBpSkdiYgZdIqvh6lops44f8lnRzyzv5AUP83OntWWCUffDYAsJG4R7YsGvMp0BFyzBpyeiU
 XzD+t5Yxso1ZuBz5jAZnrxhXKSIWlQ==
X-Proofpoint-ORIG-GUID: NX3IwdeoZ2r1lXri_nK35VUHysrt8bwB
X-Proofpoint-GUID: NX3IwdeoZ2r1lXri_nK35VUHysrt8bwB
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d5f3ba cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=KN5EYQx-VXQCu9ShEz4A:9
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
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 02:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119889

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

This commit shares the patch 0001-build-wheel-in-place.patch of
python3-frozenlist in meta-python/recipes-devtools/python/files

Note: To support reproducible, it also requires oe-core commit [1] to be merged

[1] https://git.openembedded.org/openembedded-core/commit/?id=61d98d12eca1c7bdf3b7387a820c83d3b8fad965

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-propcache_0.3.2.bb        | 4 ++++
 1 file changed, 4 insertions(+)

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


