Return-Path: <asusmith@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EB8D35162
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 09:10:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8849.1775034600038923370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 02:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h5xWQ0Ah;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: asusmith@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314NxLd1562478
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 09:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wj88zUpYVqxAHPHH4moXMoZnI2d8LZ7PSRC
	0hTRM+Sk=; b=h5xWQ0AhYePHrgTdJdWNO8T1+pqtgvVS3/DYHIjTZAovlezh/qY
	GJYLop+bbrHMYEKUITkOW03TRM3GoIHZvd/UttrCWuj7Gsdfh+STvnHoNEbCOvln
	Te+zSaJqTMoSoiesPh8jzdItBHzRz63kfZv0iQy4z0zWA5Z46msAde2X8dRFvm4x
	qEEIcjGEyD+4a359CsGfbEbFVexiZqc+J6NjyegX51+2H7p7Ns+OpaluY+00JPOD
	56TOIhkYhYIc3lNs2lOvf01H6VKHyiwWyBCbQWQXfrCzW0+sDiLdJX0tG44Wgai+
	JRK5jctCgSfEp6Pm5U0000dcEGfNQ8iqOGw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3s2k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 09:09:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63199sJM012493;
	Wed, 1 Apr 2026 09:09:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk289eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 09:09:54 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63199sxl012488
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 09:09:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-asusmith-hyd.qualcomm.com [10.147.253.242])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63199seM012487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 09:09:54 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4249264)
	id 3DA235D5; Wed,  1 Apr 2026 14:39:53 +0530 (+0530)
From: Akula Susmitha <asusmith@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Akula Susmitha <asusmith@qti.qualcomm.com>
Subject: [meta-networking][PATCH] networkmanager: enable modemmanager for 'phone' devices
Date: Wed,  1 Apr 2026 14:39:44 +0530
Message-Id: <20260401090944.469001-1-asusmith@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: LYBQtSdfaOpRcTll8lfab6BKh6hMGY0s
X-Proofpoint-ORIG-GUID: LYBQtSdfaOpRcTll8lfab6BKh6hMGY0s
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cce0e6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=b39R_zg6VpF3oCpMgmcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX9/HjOTqlTHjJ
 qhomjfmFgT9cympEiHxL/3ziMTB9Stc2BgjAauXISUY+QOfBMjRDtVltMZ1PXdjHnWPTf4zT7ha
 ghw+25WyaUMu3omdnj6HCo/gvLLkVFg8N+JOhubP7fCRt8CiiOBNaS+VxTU3PAoC2j3deFH5dPm
 O7nOjm4BtN7Yv0pQ9EbkohbmmsoWTlAPPceaYzRc24gZIj9677TpuJB1AS4SpxizYozit0Xz9dH
 zVDEDi9rdQGDCdxdNZEJobGE0/w5h6CJsAV5O2eJv8JYspTqrXgcCzIctx3J835igq+sCWIqH8P
 3HJ4HonP/XQYdyxStRvNKHaHW8yQRGmCH6Hqh7FXyg8/G/fRvRPreZbVhaRhFauRIQ7nEWPy5Ll
 Cl1mHBoCYtaSCG+UHq1fZyTADcfQKoMtklpMs+IXsk4hQW8yZubuX5ZbBP8KRaD42k9K197zS+F
 24TPyhMt1phWizZuFJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 09:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125903

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


