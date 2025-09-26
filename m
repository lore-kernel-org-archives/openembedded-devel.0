Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B51CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:11:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12464.1758874272836403094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HdWryPwp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q69rT21767034
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=So8D/4W9EYxCrP9ZCHmMbZzZyeO7o9/A8z2HTUnlqtM=; b=HdWryPwpFg8e
	CE2eHgvUrj54pw5cSnz4UA7e1nsnYleH/eNYrdnqhmbUNYTfP5VQg79ZzfD52DPf
	wPv7/uwti9q+B7DH44jXUKBNRPqe0ZXUMF1QNucd+FmSn+9Ci00E8/zhtCucJ2Yw
	Y6iRmgZfRWcXrJUy2MO49z1FZ0iroBXzZucypBxMfmjChMWAawwiF1QhX9vROWIg
	tH3f1Aa7ptiuHL1jsR2K+F1SkWFnZgp1pg3/SCrTQGxw66rVlo/jDkOjkc90X+iA
	TbYifa/OfQLLKzx+M/uXfwfgPPcUoDm8HpqT/2abgR2sl7rk4AHwTc7+HAFbkFMp
	BuzTrU7aCA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8j1h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:10:29 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:10:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 3/3] meta-python/conf/layer.conf: update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
Date: Fri, 26 Sep 2025 16:10:26 +0800
Message-ID: <20250926081026.3104475-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081026.3104475-1-hongxu.jia@windriver.com>
References: <20250926081026.3104475-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ttm5PuwHLkf7riSNA7gn1G3Jl_-sdHBs
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d64a9f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=zO_fQK5tYUZrF3Q8s6MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ttm5PuwHLkf7riSNA7gn1G3Jl_-sdHBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NCBTYWx0ZWRfX1cLhNXGBjnyM
 DSoPYBL06KyQPJ47jNih759/rv4SkNon7pjW0Bv31Eh3uOPom9WpdueeJ/Zk9nFH8mVTsRi6KUm
 eW7EpXVDaZQzGa52/DqEpQQRvg3+ztbF/clEsB5eccKZhA+1ZuJKdbSmfTa3yBoycU6zBLkjbDH
 G7tNjrosoyHFCm7qjYFL/Hfc0ZTZz82twAFv4Rp6To8g4bloqL/pGN5A5WsPYk9OFNjp6NI2V7L
 XbFKTtEPRaWnxAQkrEJMlkucae2hrWDakOOp4eW2T5JQrmviWBmSxsvMZFG/vjLbxK9sb71yOlZ
 wF13kS7SW0QMuQkrqq4EIh+p7ai0RMk6eP504DcBKK15izt1vBX7U4Fm/tnw8BhZvfllJ0CeQTx
 Ngn6mDe1mGBGHlIabpPmGGQA1OkCGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119897

Due to the recipes listed in OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES has
supported reproducibility, update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
to latest

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/conf/layer.conf | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index b887accbf8..202c66561f 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -21,31 +21,4 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 # List of known non-reproducible package of the meta-python layer
 # Please keep this list sorted
 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
-    python3-evdev \
-    python3-evdev-dbg \
-    python3-evdev-src \
-    python3-frozenlist \
-    python3-frozenlist-dbg \
-    python3-kivy-src \
-    python3-lief \
-    python3-mlcommons-loadgen \
-    python3-mlcommons-loadgen-dbg \
-    python3-mlcommons-loadgen-src \
-    python3-pandas \
-    python3-pandas-dbg \
-    python3-pandas-src \
-    python3-propcache \
-    python3-propcache-dbg \
-    python3-pybind11-json-dev \
-    python3-pycocotools-src \
-    python3-pydantic-core \
-    python3-pynacl \
-    python3-pynacl-dbg \
-    python3-pynacl-src \
-    python3-pyproj \
-    python3-pyproj-dbg \
-    python3-pyproj-src \
-    python3-pyzmq \
-    python3-yarl \
-    python3-yarl-dbg \
 "
-- 
2.34.1


