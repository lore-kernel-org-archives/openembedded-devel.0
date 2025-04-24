Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDDEC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:25:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.570.1745508302940980938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 08:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6209e62087=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O4pIQa016660
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 15:25:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhjahbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 15:25:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 24 Apr 2025 08:25:00 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 24 Apr 2025 08:24:59 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  3/3] perl: upgrade 5.38.2 -> 5.38.4
Date: Thu, 24 Apr 2025 15:24:53 +0000
Message-ID: <20250424152453.2431217-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250424152453.2431217-1-archana.polampalli@windriver.com>
References: <20250424152453.2431217-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v21VNa30IX6Wz9uQIZ3AeMOE52KTBGP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNSBTYWx0ZWRfX2fwXwxFXPlPi LmobeIqBS/PlCxFeiDf+yUJTVJGQTLCgW5iKFw+H+M/kXM28lVh85oBd1qPrtzQqdmNS+o/+IAK YNSQuO98CFXbSJiAA/3I1m60i7/EMmwvBVX/EDls2ZPHJmxMguqnCcaWaeQrSGc/4PxzO3tC6Qv
 m87brECo9Y1rMiJ4FUqFymkEV8PS+9Pko8AFTzpSHXD3HcXEMo0skWdRP6CxJhepAtDb/Qz5K47 Lx0JqEWYBCXdPGThyocvDp6ONqYWg97H9gz8BxvcFLT++xaGI6LKsr5xV8lnxJ1l84m52K/7dZw A1F6FcLo8bSowO67U5mDf5qtKFCypaYTKVbfxmYaMrpsC2Zl0+k/6/SJcFF8cBj2DIJx43A1wOz
 lsaVR4WyX7kelmetPV3Lg1FV9cY61heJGgPGwFVdrwDMcWByRlDDWsbtnB0q4J2MX0pOT77x
X-Authority-Analysis: v=2.4 cv=ONQn3TaB c=1 sm=1 tr=0 ts=680a57cd cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=_IEhM8lNAAAA:8 a=t7CeM3EgAAAA:8 a=W--2V7L1KeMcrOQ6b88A:9 a=WN5SZLvFwbRUu1hQBHWk:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v21VNa30IX6Wz9uQIZ3AeMOE52KTBGP6
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=888 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504240105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 15:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117098

From: Archana Polampalli <archana.polampalli@windriver.com>

update include fix for CVE-2024-56406

https://perldoc.perl.org/5.38.4/perl5384delta

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.2.bb => perl_5.38.4.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.2.bb
rename to meta/recipes-devtools/perl/perl_5.38.4.bb
index b6c9cda7ae..e59022e2bd 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
+SRC_URI[perl.sha256sum] = "fb888accf8b50b5180e91166e5153608be294c57c19878e95f7659c1f1f12758"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.40.0


