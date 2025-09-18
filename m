Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13576CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:16:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8195.1758179753933776760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HzY63AXk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13563ce15f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I5cBED2526535
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=l8tVKqzy6IDF/yAPNpou3pR9VGv1cNJdjlW/hBunLsQ=; b=HzY63AXkzSEU
	94WXS61KpLOKdrKqS9wydMK0bmPo0mjwOb7gdJsNDaliGA3jTU4ymA4KO9jaTU3Q
	TFPQskZ4Yujm8JLYT9T9RhoX1NTzldAJhZSv1R4jHtDEswZORMBXwzOkpGamI7d+
	GiKohtLXzQy2SFmQTnqH7h95IzCPyJgTNed4NXrIqcQROG5NMcxE1j7kva3dQoR7
	nmCaR3pxjqNop7n1nzSs7lrQT5gczf4+vOwWxx426Qp9riOUfkr+WxbNn+D2C1Jd
	8Rm9UD4CO3kIG7Rcdn67rr4jjCTypjxaC6OQPH65R1M5BEyurMI8dVRk10Og0etb
	9pH63Ymm6w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwssrrn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:15:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 00:15:52 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 00:15:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 3/4] python3-propcache: support reproducible
Date: Thu, 18 Sep 2025 15:15:47 +0800
Message-ID: <20250918071548.3934769-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918071548.3934769-1-hongxu.jia@windriver.com>
References: <20250918071548.3934769-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mzD-1_hcBdLR-ByT4AZx7LgH78Tt4whY
X-Proofpoint-ORIG-GUID: mzD-1_hcBdLR-ByT4AZx7LgH78Tt4whY
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cbb1a8 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=mL1YNQHE8x6IF4yIovkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA2NSBTYWx0ZWRfX3l4+O6EUM+Vw
 elbd0nfHAjXzRpuJPAgsKfgT40mh99W5J4itDAps+kzgz4OETznQ6x39v5kBQdN/M3vOAZvNepm
 rNUlBT4ZRtRGEcMRjSuTSTRpMgMx3v92Hxoxnr82ebD6NnfEzEQDPl2cLoDAAN6TDrAz8R8jAr3
 +PiEGOTWxHqra7+0OJvpuCxwcXJJReL0GJU8ISmo/j4mXJF/q2040E2SPjp18/L8mZNSfLFVfF6
 4WpXJN2lNjSq+VvDvlgBeTLS+akkngl76G9gZ7Hzy3hR6m+PBmhVGDAjfNhfoOEWyVBu7s3/e5l
 2+K+zm2mg3YWafCNj04I+Wjgtqs/kiJXajQhARKsb43zqW7x09fbxhEbPDTylc=
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119533

In order to make the generated library be reproducible, build wheel
in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
option -fdebug-prefix-map could work as expected

Note: To support reproducible, it also requires oe-core commit [1] to be merged

[1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D3&d=3

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


