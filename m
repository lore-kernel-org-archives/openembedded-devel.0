Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC024CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:20:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12568.1758874801867983191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nE8UlsDo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5boPB1836918
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 01:20:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=So8D/4W9EYxCrP9ZCHmMbZzZyeO7o9/A8z2HTUnlqtM=; b=nE8UlsDoG2qT
	x1CreSwANqYbavg2CymeCGsF3932ogC2va9NMK0u9Bg/OPCykprR83S78ppLv+tk
	3l/6y3l48T31T+zPZ7awCBA1i0npxzRruZQqgz7p0KViH9/NEPiECSkVSj1PWcRV
	4iyB1RNyAs+/CRtx49FthyyKrTLK3LybkAm8LtsmXmN3bYgwCuzhsIBCK2p+J2Qx
	W3gIRtPVJYcMtrJYAVYXo18Ynm0Lo/7r3kvdMtjAU2Gh79t6FuLW4SMtMC8sTEkJ
	Q3Sh77fadSCpzWT2+OS2H8ZO3T1moRuha81u6WC9kC8ZfFkIH6y/73ey76PxiZtu
	YcflGwXO3g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh0jgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 01:20:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 01:19:20 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 01:19:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v4 6/6] meta-python/conf/layer.conf: update OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES
Date: Fri, 26 Sep 2025 16:19:14 +0800
Message-ID: <20250926081914.3127272-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926081914.3127272-1-hongxu.jia@windriver.com>
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ebUwvrEH c=1 sm=1 tr=0 ts=68d64cb1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=zO_fQK5tYUZrF3Q8s6MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: t2hBbkSI3urUa5daurhOvyPfzpNk8tPh
X-Proofpoint-GUID: t2hBbkSI3urUa5daurhOvyPfzpNk8tPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NiBTYWx0ZWRfXy0kNpuWx++cn
 qZBw2l4qrzz5U6W1XvCWsCsvg2gGyoBKnHYXKbfahw/m0zvdyxP8ofTDdreYS5gsuR6gPes39yD
 233bPyc2aW9RmsP96GpSMkBnc6fk7v67lRmRJ7JAYmecMVZAs+GpRDWzGNXr/fay0oukldPOLDH
 WGXqS8DbikrEEm9dvkOXkFhV19BcMnqXerBB7NSJP4n1XaN8/3RET5v4VXVyagQWtokWCdk0jj4
 z5iZKRW4JUX32MXrG8JbwrGogIU9P3OKl5cj4rm6Nb8DY2z6PtqRvwa+eppXHg5WBti+SxFCK2a
 wsUsVfneCJiZ1Lu2EO1xsVuWDjlIwSwgOH/vMnRwiGwI57mDHMeDN7o9GDzKiLJHOYmf8AVYMt/
 CDQw3+n8KzkQcZZO5keV6jdA4Kxrgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119903

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


