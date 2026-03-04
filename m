Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4142EDEC0D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 04:55:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11617.1772600096803605113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 20:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WIDHSCoj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244f9rn1976703
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 04:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kMImEcwhcCekj+jMCibU
	FchXlu7GpcViQxqysugSItA=; b=WIDHSCojeZLQAdvHspv+1UiCwohVmJdas2al
	3iNWowzYYHpYSWvAkDiwKy+DYV7glWDTANwKM77S4yGWJFeH7edqLSPb/PVgUwQ1
	zDFoH2UojPVtDWibdSV+EZpoZtIH9Iy0j6ysEKh25FLVsod6WI6YF0ChNLxbQIhk
	4hvtgJOXjwOobkO/O+rLPT7SA6Cz7rK4IOKSIGPihIkhsVNJYeSwUaZRzWgX+j09
	Wrh/OHMzzzmIQZl2k5r3V8Ofc7MqViIp2fv1TAWOu2WpofFsos36pfzOVfOAwky9
	bZrr62EmNUNJKITOIp++g3zMYAF71LSe1nSYrVVu/X6MLnTZ4w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvmr1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 04:54:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Mar 2026 20:54:54 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Mar 2026 20:54:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-can: remove python3-pkg-resources from runtime depends
Date: Wed, 4 Mar 2026 12:54:53 +0800
Message-ID: <20260304045453.3266504-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7Cy_6HG__8WogZW82kn_a9l8Q1pwC0v9
X-Proofpoint-ORIG-GUID: 7Cy_6HG__8WogZW82kn_a9l8Q1pwC0v9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzOSBTYWx0ZWRfXxIoxvcIha68o
 hW/qXhANfWZM77u37ZR4C20Jbp3kgjcD/4SHXqkrzgjc41INGpmVOjRkyDpF4zxpK0bHsvN2S8k
 ug1ITfX6XWBzrNxTLZ3VbLCDp1qv6xG3KxZF95Jrk75vCtsoACH/rgNAFiQzu1x3pc8vwKnh8ZP
 p+p+U1MnUH6l87DiaVbx+KubUgF9aUvM7YDSdMiIgBavPtnPsS7HZKr2D/Zj1YDB0YNsuJVeQ06
 uz8RYpID0AF8dDeK6/mRLtGQ4/EtJpQOSrPg+dTL9XgIGH4KLmU5mORYVFi+guP3Id7ZZDBLhC9
 ns7gNjQurKnqmgpPyK2MXrgRYllLZ4DKT8DttZYSg/fUtLNIXpSHWO2VVR1PZxrN+IR4JUpF23H
 3tHnjuicXF0Op8naMT7yS+IK/6bwT5eDiX5Q3CK7inW/IyH1DQmAGq0caz6gkvrNN7R/4/HTopv
 +YA9ytTXdSoNr1K/fOw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a7bb1f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=LUZo4zgNzH4Kyz_TZh8A:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 04:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124837

Due to setuptools removes and deprecates pkg_resources in 82.0.0 [1],
python3-can does not import `pkg_resources` in [2], then python3-pkg-resources
is not necessary for us, remove it from runtime depends

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
[2] https://github.com/hardbyte/python-can/commit/1a3f5e3769aa565ada8c27177a94f7db43d019dc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-can_4.6.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
index 04ce22346c..a2746511f8 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.6.1.bb
@@ -26,7 +26,6 @@ RDEPENDS:${PN} += "\
     python3-msgpack \
     python3-netserver \
     python3-packaging \
-    python3-pkg-resources \
     python3-setuptools \
     python3-sqlite3 \
     python3-typing-extensions \
-- 
2.34.1


