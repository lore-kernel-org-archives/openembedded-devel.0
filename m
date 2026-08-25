Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC604C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 22:07:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.247.1787695624200219125
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 15:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FSxSY5lm;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bGq7FXV2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PLA1Zw1924697
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 22:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U1SJS8fFtwtFhnpK0+9uL1fV2Ydf6CMgzJz
	uW6dVP6k=; b=FSxSY5lmREmTmuOVtajYz/ctne3g/QgThIuXtBP+lr9tRsiYksB
	sTWNoxFu5uzJzh6twDBtJFDWd6IMDVOv3wCeRpaw8ZozHutCEqRvKr4jNPE/WkiD
	OH0fNi58VUJVTsMwA83JP4Vw9du0wPDDhSS4rnbAsodVk9Klc1FgsGsfJV7Ek3QE
	0MnmUFxmQogf2m3Rg+M0p5utmYt6YJy3rwA8tKl8JapEz4+P5u3CbjvRTbRfAnBk
	gyMyLUYhAKgZWBtYtE1VYre/Hijc9kE2JpfNc8qY078r/xyVsPcp3sK9JPzfspiH
	9FwdrjM3l+sjTs5fRD4ARMrF90eis+XPOVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9urxxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 22:07:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so3454421cf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787695622; x=1788300422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1SJS8fFtwtFhnpK0+9uL1fV2Ydf6CMgzJzuW6dVP6k=;
        b=bGq7FXV2RoypO7+C92n/F8qBWJDJ5d/9QFLBeKMeq+AeauJ476VFOpB4ympo9NXiIA
         e+jS3AQDLrUfulBFQjUD2LCTZ/TxINjGd4/U1aAtHwg/7gPiGfJr4BTofpqdwuFfyBVn
         6amxcbtD9jGSAgf8vlt/cLXX3dP84YdE0wOSJCW7FACahBC7rkMJBjLO34VIB/u7nfqg
         OteOHZ8GWZvAsytpXnbNLG5YL9GrcAilf3eYJkWDR90P+gxa4Bf8bJYcdYnAsoceoG9A
         i+TMsI3PbNX3l/DUXTLZO13cH8HmbHW3IHVc/2IDg5g3I3ytIO+OwUd/0mJUwPWU8r1p
         Z9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787695622; x=1788300422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U1SJS8fFtwtFhnpK0+9uL1fV2Ydf6CMgzJzuW6dVP6k=;
        b=bw2YcgNG4ptnLe1JEJvwJyVR6pwMPwIKFLvxt+TfylJfkxELhH0REghZgAeIMaAwhO
         3arv7SOMzGoXqCt8AZWoGOVBN74w4hVad+DTzn3cjuI4emYm263dmX0DWi87OuJykZ/U
         37cHpOtJ/11DV0gRYy9zKJQQyEJI0oXV0I9o38CnTup519iXr5IQjRFxB8cOiRbMNK+o
         jG+f+5+LGb5TO7aNvhUzTsyEv2MVwNvyycs1F2iFTkNTTdW7QzA7aSbShSb3IELw4h8c
         K8+GLjneoZZQey6/ktOXDTTH9y/tVAc8qnRqKlLYg4RKLyEiGpPRdn9dBtY+/Dsx9vCv
         h8TA==
X-Gm-Message-State: AFuF++lYcUmC6MuBWxFTU0kP3EpSYyb6Ey0H+4R7loqsbqjObjb+irZo
	04tVkLlX9MQXtifCAIr2XcTPFrrvqbbcNhPdBTvMtdcTF/qPAwO0/LmU5Otiw0OqF3gJS87gyrQ
	X+iAxHOGJUcPMihB66qqvGVW7T9Z8ysr08BeTXx3azbm9aeLjxyufmsG0M9Gnl1n24s1+QFBzJD
	6MKJdKTCkG58pgXIoT
X-Gm-Gg: AR+sD13lnSxazMzhOXt/pF06ChN46XTmTp7+ONe7VCZ1OFMIlek7iO1MCQKHPvVIqUe
	a+aKVSz8DMQeyL/z69l5ILjfePrhCgKG+L7qwWzYkbup1MUGa6SX6eMED/gC9NGwKKHJIqLQiF4
	TuR2/2ibfxxLfKnxeYQeItQnFUFkQYNlQ6I/t35+K1H4zgFy6tZpNOA6fJWECG+z/UWMwGkbAl+
	Lx2s+7s3c04FxaFjQ31pOaWhc0YwQbovWF0HS/A0/B+G/87WIFTU+XvERsIRcbQg9AA8zrxMadc
	jftgFOHFncxBVof17t9FfVo74byt3nWgqeyYlpWYJK6/J1W6leRO5T5nFF7H17SFpJByyiroxi+
	aqj7EenIyLeti1BMzvYIKuvLZhgw1mwUxjb7qiyr701QGg5KQyoHNAlaKNdRm1bZ30SDDiOThQX
	5tosVJgmBO0mid
X-Received: by 2002:a05:622a:148:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-52e423f69fcmr21194931cf.39.1787695621952;
        Tue, 25 Aug 2026 15:07:01 -0700 (PDT)
X-Received: by 2002:a05:622a:148:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-52e423f69fcmr21194231cf.39.1787695621361;
        Tue, 25 Aug 2026 15:07:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41aef4esm176344e87.60.2026.08.25.15.06.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 15:06:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] thermald: fix building on 32-bit ARM systems
Date: Wed, 26 Aug 2026 01:06:57 +0300
Message-ID: <20260825220657.2121461-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7uSZe52Ib8pfbpZ7HKgwWu3Nz4CN4kpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4OCBTYWx0ZWRfX7sr7sRNTojrC
 yMh2+va3q2r7f7q2HueaiW2ktnBmJ6hEy62ar4ge5zh0YCbpJbs39eXOSgC2gOV9eLUx+jt0PHj
 0xP1OYBChodOSUqWFtz5l9OfXG8PTZHfSjwcpm0TQBbtpTYLbI1Z17c5ZFPBLc5cDEJJ3IVcTJc
 10hRSxghrvj9NYxh8EnP92hgp/D48TNqhoVdGPGISLff//6JJ7ZRrCsJ8y6A9st57umvtNc+pH/
 mZWd1ArNxuBlyMIGvNtN8sogFm9tbIhwu2GHEqiw0wQkRNkz8TtJIsVYwjB9BFa+hXhwgU0f5Mo
 uUBPuc33sQbk4lq/o86hOCv4NjFXZ8yzkgz15Ln6+SZolhqw9Rkni4qeG+8aqQZssZrL3DYZKfw
 6LecJi4ZpESVes5f0iasPl5hHo50+oLtRuCchMULkGMEsJMJIZwwWISOouxxh4SftBym2XhTQ6y
 OvXZ09DjtPhwyPlnqPQ==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e1206 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=pqIWkkr7sL1niNfngmUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4OCBTYWx0ZWRfX+YO2SYgpRsTh
 Rfc7HLvYdtLgqC2KCfs1eddY1inItOnpC+Zksqe6yhe++GgwBpyhVHcaYltXl0P4LwvmJceP64V
 B5p2lk4FWFSuWt0GmKrVQ9EEc2Ukch0=
X-Proofpoint-ORIG-GUID: 7uSZe52Ib8pfbpZ7HKgwWu3Nz4CN4kpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 22:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129476

Apply a patch fixing the following error:

thd_gddv.cpp: In member function 'int thd_gddv::evaluate_condition(condition&)':
thd_gddv.cpp:1721:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'time_t' {aka 'long long int'} [-Werror=format=]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ..._gddv-fix-building-on-32-bit-systems.patch | 32 +++++++++++++++++++
 .../recipes-bsp/thermald/thermald_2.5.12.bb   |  5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch

diff --git a/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch
new file mode 100644
index 000000000000..9e74e144fe58
--- /dev/null
+++ b/meta-oe/recipes-bsp/thermald/thermald/0001-thd_gddv-fix-building-on-32-bit-systems.patch
@@ -0,0 +1,32 @@
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
+Upstream-Status: Submitted [https://github.com/intel/thermal_daemon/pull/596]
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
++			thd_log_debug("time condition matched %jd \n", (intmax_t)condition.state_entry_time);
+ 			if (condition.state_entry_time == 0) {
+ 				condition.state_entry_time = time(nullptr);
+ 				return THD_ERROR;
+-- 
+2.47.3
+
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


