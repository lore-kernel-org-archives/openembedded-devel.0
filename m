Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA17D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:06:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10728.1764752755923727184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ph0WF4S8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=443295ddc8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B358AK01750390
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Dec 2025 01:05:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LFr49EEYNewCi8zD92Ff
	Lsk/o1+MdkkV69sE8Mql3D0=; b=Ph0WF4S83mZkG6/i+Fn92bxWQPqR7s40f5/G
	hVCslPD87Apdi4tjN6R7pVFJUeKoff5q0pLOF29UuLEVfzqOjeQW7WLiWP/BLpvR
	agVkEESEBVtWNhiIQvIcs76GpunDl02Sl4aY9wJzrbalvKvPxmHhV3gcY892oKwL
	q5R78WORSvaOH0mM5gtrWwUgTmuqIahPLTeQMC4VoaFuVjO++c/mEz+zpaNIf7v1
	pZx9Qyzj1oDIKx3NS4Bf/MgrZbnhXJURCzdfdNJkJ5WNnNPBMYwnSD+NRHVVGE09
	T8W34Y6vl+G2QXqcDSBvBWD6bHq3VoTjNP+UT4Cp4gXtRa9Ggw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05mgce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 01:05:55 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 01:05:54 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 01:05:54 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] version-check.conf: mute version mismatch warning for flite
Date: Wed, 3 Dec 2025 17:05:53 +0800
Message-ID: <20251203090553.2029737-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -vo6Stkh9NmQpQ8pEcdOuae7JDNxr6up
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692ffd73 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=2GnAhPRnY5GPLATKUWYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -vo6Stkh9NmQpQ8pEcdOuae7JDNxr6up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MSBTYWx0ZWRfX7rKR5VWsUixO
 g6UXoBh6+ZPAdgUj5rJXr0ZfI5VU6ZBA8LyqneEVKKTseGqFqZm2UC1kZhrcnDfJJlZnER9qCS3
 nupGxxV/Ukst0j99oGYUTzlUMQnLRmWrq3PRnBF72VZhut77uN8Yd4EgDRIH0BI32Ga4OwP/w12
 grpmdXwKcW2ePfCuZi9Oe1bgPzibhclZLGn8EZJHM9w57+Ndkm0VULrvXULXdEaTRd667YlpBv2
 rymE0Ildv+P/9UmGUyQw4OAGt7AQbA8ZKnBsWuv66YG3ba1mdz4rXObwd0NUInpAwnACl3xFPSl
 n7mLzE9GKlojkBEvV11y5a9egG8cVsp6LUsu1Pc0+B5DXh2glYyeou1OBf4WPa3fTxJ0DP0wzc2
 RalXkBE3NOzauusFbU8R9Q0PXfVmaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 09:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122274

From: Changqing Li <changqing.li@windriver.com>

* flite --version return 1 block version output for
  check-version-mismatch.bbclass
* even with version output flite-2.2-current, regular version match
  regexp cannot match the version

so mute version mismatch warning for flite

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index b41c9e8d22..d1a6cdf7a5 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -35,3 +35,4 @@ CHECK_VERSION_PV:pn-pps-tools = '%'
 CHECK_VERSION_PV:pn-libusb-compat = "0.1.12"
 CHECK_VERSION_PV:pn-jemalloc = "${@d.getVar('PV').split('+')[0]}%"
 CHECK_VERSION_PV:pn-dialog = "${@d.getVar('PV').split('-')[0]}%"
+CHECK_VERSION_PV:pn-flite = '%'
-- 
2.34.1


