Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41534D35164
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 09:53:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7716.1775029801193896675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 00:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Wpf5uIVs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: asusmith@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316CTI8639226
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 07:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wj88zUpYVqxAHPHH4moXMoZnI2d8LZ7PSRC
	0hTRM+Sk=; b=Wpf5uIVs1dDddJK7Fw46zV+AgexyXVa+8xW2W3OGl4iTj9HJx36
	A5+omi5bjB36gq7PSE7m+jqU0zHW3LxzVY0Dis00pkOU0GiqIh4ZxYO6UYzT0T6B
	M2bVHgjXxQalDCb4UeSzAzZgbWpXnQ7QmPc2RSZy/XC0t7ll5wJqY5nu/1402Z/F
	/H907z7I7k5jFpIGk02tnkN3y5YRElafHx/Z4p2pG1e3A+ATUX/zoGG/Q/6bmA/i
	MYOs1pbo7dqHjSiOptkWfdcs6b2TEWKozKMiATOLX5Im61kUG4Ungs5LcM+bJ5zs
	YphCRQvRK4CGGrY0EW58ZG98r76Lq3bR/hw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auwhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 07:19:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6317Jo47008680;
	Wed, 1 Apr 2026 07:19:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk27cpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 07:19:50 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6317JowC008671
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 07:19:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-asusmith-hyd.qualcomm.com [10.147.253.242])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6317Jned008669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 07:19:49 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4249264)
	id A27515E4; Wed,  1 Apr 2026 12:49:48 +0530 (+0530)
From: Akula Susmitha <asusmith@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Akula Susmitha <asusmith@qti.qualcomm.com>
Subject: [meta-networking][PATCH] networkmanager: enable modemmanager for 'phone' devices
Date: Wed,  1 Apr 2026 12:48:52 +0530
Message-Id: <20260401071852.406134-1-asusmith@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2MyBTYWx0ZWRfX2I6nCKfhoySx
 V1E/WZx2paWScua7kWGS0SO4c1VvZmAZgqH9aGNR/R8SwNhv41ArKrTGl0EXcbJe1MczGPHeqhm
 xpqEN9dOA+KxAqzNX8Ht8hvLYr9R3JnmPz/tyPh166UO7yKE4a+tMbKQIX4HNUh7O2l6cYMl41L
 ADpUGWI4H4AkU03o/tq12LfbDCZuJkFqDtjc7mKg2QpTakM+xsU8BIdE/xNEMo3j2s+e2yrVowT
 S/9p948Y38TuCp/P7jRnTz/UrXf5QP/ZRT9v8uUpjjGDzHQp7mqhNKUP8CQa7StWXlpcImWmme0
 ImYnWhdv3QJwPnvNp/xaIjjzxQqeKNIKmlFAdhG8iA2qKPigndSNMQkmLuXP7o7JrGwYUYXqlAd
 8U6OI5hWfUOcf4VJ+s9ahSe/jxKYDOLIHLx10XiRi0VEoM9XUzFUNKo48s+M8yyvs8slXvxcwx9
 LOCWJIdU1QvmfwZr13w==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccc719 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=b39R_zg6VpF3oCpMgmcA:9
X-Proofpoint-GUID: amFzBBYBSmM43E2NUnkVvKM8TJDqh6fJ
X-Proofpoint-ORIG-GUID: amFzBBYBSmM43E2NUnkVvKM8TJDqh6fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010063
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 09:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125904

Enable ModemManager in NetworkManager when the 'phone'
MACHINE_FEATURE is enabled.

Signed-off-by: Akula Susmitha <asusmith@qti.qualcomm.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.56.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index de163fe00e..31d9f1d2b0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -91,6 +91,7 @@ PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES_BACKFILL_CONSIDERED', 'gobject-introspection-data', '', 'vala', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'phone', ' modemmanager ', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
-- 
2.34.1


