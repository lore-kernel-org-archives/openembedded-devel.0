Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D513C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 12:47:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4960.1786193270214701549
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2026 05:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Pir8xHQt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y0jsa/Oa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678AJ1hA3017203
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Aug 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HnDAWpuodR+vJXj54DkpljMn2zjClCXjcAX
	2knccRL0=; b=Pir8xHQtzwaII0wIxfSOTlIXuh7o6be73tYxqhMbyAfLIRnvcU9
	l5MtJeuPUkEqmXa16gqI/B6qiPVlhilbjijB1K2nWA/v7CyU/A8Ew99Oa4qgCwEG
	NzbUwLf19bRPuvr3hYzJ9ADNTWCbtkepTGdqw0OY+a/E5qqeTDuT1nuQarTPIXtg
	r1ojkfl81gkUS53KaP9ADOcVknhsAC59AApElgLGtv/rZ50/AeyKw9uHF/RDml5f
	49rl9a2oTpOvCZK+KbO5TZoP/ejOAMEFL7fRGcOjoFmvwF42Q5m8ecLpw0uCmVgL
	Lyh9QR8zQUlvCJ1h1IcOMZpkU/Q2HF9bDYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgrq8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 12:47:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso7715756d6.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786193268; x=1786798068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnDAWpuodR+vJXj54DkpljMn2zjClCXjcAX2knccRL0=;
        b=Y0jsa/OaFwwUv+6lqwaPdk5Ql0YdfCtewmv9s72gpYgEtcbzbcEBOcuO3KdeWUNibh
         E/V9B05Zp9w4Vjq84/AIlSTg0X3Tw/DQHxGt4xmPY7szHjyYrFCKcqzdEcisvAOJyamO
         b1EStybqigGJVHweucaKjUI4bgvVU3qGHu+EXNUR8gR05ICl0KhDuRfdXxmNNvbH1p/2
         iefHjhjtZPXa/F08jo+73mMh8U3PnHXSHL3wlj5EmIzmQy7ZUW4+t/xtAtFX9usMV0ln
         jFEMUbAndb2GOe6k7VlDifblm3tPzxTaMHN9Ba60tsweq7auSAbkLc6pHOMef67NHuEd
         zExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786193268; x=1786798068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HnDAWpuodR+vJXj54DkpljMn2zjClCXjcAX2knccRL0=;
        b=iexrWMI/dhGnncNbomslLb8my+cm5Wb1+LP5UaohF2nm4MQciIoiZKY3ZSAQ0BpqJW
         ecVOqFX+FzZCJBOm+jdYG2/hskSHdVfqueCkmWiDZV80gu4oAVhnyHijCOmHZpCvxnvK
         gAXRP7qk4ZqUDjGijLmRWtVZbn3OnHmRCZkpMLYxPahcVMxcooH5csYK0DLsN60ZQYyl
         5jtpZ3DqqoaYnz4Mz6+V5Vp4stlHNaIyKr6UhEyqk3h+6mXUb6uBDIAJF3ofwcimn3oV
         LprY1EkjklYe/Lc8fcTPwx9NzujXTTw1+gHVhCN4wrJfPByDD6opCL9dt2DsXXc04FAz
         sjjg==
X-Gm-Message-State: AOJu0Yx4E3WAqYSRwLSoJdWJ/x+vIOFcZt/FXQnmGwsQO8bYhmLKM1EI
	hgfWzN9vxhS2MfP+4RncHJQh4f/g8WePT+JJ2aTxj5dj75H+4AG4f1yBZvzxl7A5T8DA4ZrtAnL
	6jTm1Ng4YLFirPOYZxxs5xm/YAJEHSJpSloToap2wE1sL2KXrszfXSGpzqTh2FAavXH22wBjgs7
	pVKveruszGlW3zyYH8
X-Gm-Gg: AR+sD13fe7Mb7/HWFee2280Ut43OWKRjVEFUSPZUr5/ZJ4ZQOKb18ctI/5KMtXcCOZx
	3Gr1fAAggkSETyrCNbnGKu/w9U+1ZT9w+pt5PBNjMqvgc1s1bMMVdiWusTv/4rlQy0mlROrDuCR
	HB91P5fActHymj+ehbJOwNpyQS3sQg0i/tKoOx7/bJB4RttdVjlVk/yd3FYRAnccz7yU/zAvEp1
	g8WuvmcjTQIgVY3DxeD6E2tCWMnhSUOxieNUW4pw/xyCYsNDMwPhws5objyLdtYM/srm3V/cKdX
	Pl+CKADTTHVYHQRiRqH3ohlhe7brkEUNFzmpnY5eZGpetu8jbtkPZeRFcuXCIFI2bzCMyxkXGC6
	D8pMygiAwu0jMBNvfIhuocpfIVGGGdnK8lA2quJr+GTyda6ikQzithmoPoF3SUj/CcV5rD8XKeD
	cJdIz8c/wsS9ri0A==
X-Received: by 2002:a05:6214:2685:b0:8f1:8737:d794 with SMTP id 6a1803df08f44-9088126d7e3mr341499306d6.16.1786193268389;
        Sat, 08 Aug 2026 05:47:48 -0700 (PDT)
X-Received: by 2002:a05:6214:2685:b0:8f1:8737:d794 with SMTP id 6a1803df08f44-9088126d7e3mr341498756d6.16.1786193267793;
        Sat, 08 Aug 2026 05:47:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056eafc0sm977465e87.76.2026.08.08.05.47.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] thermald: fix building on 32-bit ARM systems
Date: Sat,  8 Aug 2026 15:47:44 +0300
Message-ID: <20260808124744.468104-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEwOCBTYWx0ZWRfX7vR2K96Nt/VT
 zdzlLNiiUGUSrjLmfRWUMnIpT9iT6xboEuioBZP2G8vwuNGeoK+Rh0k5krTvfEAe8RXhmpjFHYe
 LyjQeZQLf9FJoFZo2BO0hnmXuC8o4N8=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a772575 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=pqIWkkr7sL1niNfngmUA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: JPpRG6cjjuNxQE_A4QMhVGFv4i1iFSDS
X-Proofpoint-GUID: JPpRG6cjjuNxQE_A4QMhVGFv4i1iFSDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEwOCBTYWx0ZWRfX1tcyEuvNuuBA
 iANwjduFdqlAIVqXbfvOIhabqvfq/EsUPyCUY+CQJTsR4vjkIGCYWZHOF+UAB99y3GpHiR7dLeX
 kCN3boP3KnR+o3Od6+8Jkhu+LQyiCRtXmiG+XU4zffnP6Czub6QFLNIAKKcIuP5/B0W610gYt0Q
 UtpAVIl2bh3HDvgZnsHo/AkiosZHtGIw7sKW+YI4Tkr3nGOQVP9GHFHJq0fO1AHwVqBn3bvsgM4
 r7eklA+apBggkU5Pp3GdsXExRlcUJXPXLwGqXv4ZTGj6mI6Aeiu3Gs8b05qNgdBm4ombu4oRqsm
 8/HJMqArcLgDl4coeYVQ3gsS2gEVai36O2BMMniWtITAWCmleu9knShj2ndruAqEfJF6m7aUF9N
 Z1rBUM0eZMdYI82Ir7075OgSVrz4eEnxvtHKxOPsd4SPOkVMACJ0q6HIS8WQs6Fr4BC2P6D60PS
 CWd/J864A6B90vLqFVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2026 12:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128868

Apply a patch fixing the following error:

thd_gddv.cpp: In member function 'int thd_gddv::evaluate_condition(condition&)':
thd_gddv.cpp:1721:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ..._gddv-fix-building-on-32-bit-systems.patch | 29 +++++++++++++++++++
 .../recipes-bsp/thermald/thermald_2.5.12.bb   |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch

diff --git a/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch
new file mode 100644
index 000000000000..b445c98db9bb
--- /dev/null
+++ b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch
@@ -0,0 +1,29 @@
+From 30251d7754fe308251747dc40328a52a6b0e0601 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Sat, 8 Aug 2026 00:27:15 +0300
+Subject: [PATCH] thd_gddv: fix building on 32-bit systems
+
+Fix the error caused by type mismatch:
+
+src/thd_gddv.cpp: In member function 'int cthd_gddv::evaluate_condition(condition&)':
+src/thd_gddv.cpp:1721:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Pending [waiting for clearance]
+---
+ src/thd_gddv.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/thd_gddv.cpp b/src/thd_gddv.cpp
+index e822b9f72f45..a2691594960d 100644
+--- a/src/thd_gddv.cpp
++++ b/src/thd_gddv.cpp
+@@ -1718,7 +1718,7 @@ int cthd_gddv::evaluate_condition(struct condition& condition) {
+ 			return ret;
+ 
+ 		if (condition.time) {
+-			thd_log_debug("time condition matched %ld \n", condition.state_entry_time);
++			thd_log_debug("time condition matched %" PRId64" \n", condition.state_entry_time);
+ 			if (condition.state_entry_time == 0) {
+ 				condition.state_entry_time = time(nullptr);
+ 				return THD_ERROR;
diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
index 6b193466a367..937e9a5705c2 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
@@ -12,7 +12,10 @@ DEPENDS += "autoconf-archive-native"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"
 
-SRC_URI = "git://github.com/intel/thermal_daemon/;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = " \
+    git://github.com/intel/thermal_daemon/;branch=master;protocol=https;tag=v${PV} \
+    file://0001-thd_gddv-fix-building-on-32-bit-systems.patch \
+"
 
 SRCREV = "9996a1a1cdd01d32cd411459368a177f463d0047"
 
-- 
2.47.3


