Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4B4FD4600
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87953.1772164295882861164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 19:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SMIJJwt1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cBIP1ElY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: priyansh.jain@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JulM2402979
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 03:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O4/nKhOYEMz2RaMJosdhq4sJpKQSbRS0yvt
	Ir6xObCk=; b=SMIJJwt1tM520ck0bvUrTaKP5/tEQ/YOuN3gdsfDqRrCJdCRiUW
	K5HGQAYKAHDPx+UHHiHajbIydEaessHDVySeIQYJ+pkOzQ07hmlNAcTiL1fKsX4E
	RDd9lePu7cpVBqLuugc65nknqpi7uKHbqneE0PbuUgCgjDiWBINDiqMQhBOeDk3K
	pxQEFnlXJVNdh2DLMXz7lr2tMKA2+M8GCOs7auMjFBBkNkyc003UOSYqpUXZTwF3
	wuDEh5Me9AnODfa7gfGyswKzViA2x5N4sKkbf7WdROdLFLrwilY+mGrnB7z+hDpn
	KuU2iLdYeD4hw4nl3lQg0mEtRoK3VxQPq/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw2391cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 03:00:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824b3532298so632717b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 19:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772161207; x=1772766007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4/nKhOYEMz2RaMJosdhq4sJpKQSbRS0yvtIr6xObCk=;
        b=cBIP1ElYAP6IfXDOKtwE/GqXRzdNmc+t+WPofgQ+iCe+AFV8IBDfgYZe+mOcY10Pqq
         rHyhChQpQbRspFvlzQsU1eSv6rvZCjKq3aARkofHclAhTc4DIo62U29QD/71nstFSYmq
         8X8YP2a/GkNf/+4wyn6Gch2DLN92p4X6L/dPhwKHFUKOaPlidJfblG9YOu6CU8N7VTUn
         U5W9Z6r6Korxj1twFYbo6zYVMk04P/pOPfmqyK6+GZWS50THMlLCuzza1TY3zXc+qPwK
         mtQ0Sv23nEbyfZpMq1/HoV3PyPdQpME5vf6g1cXSUYaOaG9BIhE40UaUDi5+wPtyKe63
         VQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772161207; x=1772766007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4/nKhOYEMz2RaMJosdhq4sJpKQSbRS0yvtIr6xObCk=;
        b=B+pS+hWq7ji0UpQ1U3Sl9z4BaT5VUDj6Zh8zDtHrs53snBa+jF8IbOongKyUMW3e94
         WspGBVJhCpv3ZlLC3dm4kHTEh2YNwAEURM/Ra7lD4B/2lbnZSfHqe2SFhANUDLhB8VOE
         F4EEpxQPBwVORIjcF9wPW1C9gIRUexoZm1rn3V1A5RhTr3+6gSxtQnXrtvHk78COPwi+
         YiOuPAH2ZVvCT+rv1FfMO/ZYQ1IAaSsmBzi84M4imZZqTxs7cTNOCynNlg+tZUREuUG5
         TUbQ0clFvGFclMCq6EFiNewHrwqjmupKBTB+/BruV9pPQTKJdjQXZ3tfi+h9sMPna0+Y
         9HVA==
X-Gm-Message-State: AOJu0YyICRgeSXAtTKPamoT/Jek/+FxMXuddX9SQyDsZOLW/Gx9nWc2v
	Slrxa6MrWcdaQXPSp4ouvPL2R5E+QJBSrTvNIRxzCr/Ava+jIa3cRouH2PYz0fJZMKi3G2jod2C
	JWu0BQXKk/Dtl1lOtuRVij2eT0ej6PEVWfZjtH2mG6fXWH/FvG+cXf/eOuWQP4+6oVgGJymL3aC
	855StBD5GFU04QRhBf
X-Gm-Gg: ATEYQzyU26+GgUJ3Zwn2pVBFqRalqHc9DYvdxc8HtgfNXILF6ViknufNPQatoXU3lT6
	37jEdLKRdQA32nI+uxZ93s+oMui+j8OPbMAIzJYMwVmU22XnE5Wjn2gQ2S1hmnweqNman8C5F0U
	WO3DiRE5hiImavm7UPhF7bFGTkOBWH4vDGysOpPGRsBigib6CFLMYSnMQ9tJhyA8zZ/ikl+F2aI
	DxUd1RfCS7GVKjSyFXzzBbPzkyU1C31g1M0Dx8dQE1SG7IgGVtFgYxlp0WIJ3wlK2Vnfsp9EONa
	vtS036SNueIxOo/sGordEf8vNhRoiwo+WhxCEsV72kLtA4BYXiU0HYF+tJKI+eYCtAE1UGGr/Fk
	nEOyOoE2HVY2RVbe4ZfhDJzYFUJWjaWIpbxmQ7IB/5p75KToF3jgk8k8=
X-Received: by 2002:a05:6a00:4505:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-8274d9347fcmr1186727b3a.11.1772161207492;
        Thu, 26 Feb 2026 19:00:07 -0800 (PST)
X-Received: by 2002:a05:6a00:4505:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-8274d9347fcmr1186702b3a.11.1772161206934;
        Thu, 26 Feb 2026 19:00:06 -0800 (PST)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db3ab8sm3529129b3a.27.2026.02.26.19.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:00:06 -0800 (PST)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, amit.kucheria@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH] thermald: upgrade to 2.5.11
Date: Fri, 27 Feb 2026 08:30:00 +0530
Message-Id: <20260227030000.1438923-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: LeuhnZDKIBE_niWTBvtJf7u7J1rqQig9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyMSBTYWx0ZWRfX5J24sMK5Q08r
 bQm8gGbFTs/SsHglWlFabc6OyCEJtJvZhdEbJszzW+oORNw/OGCJl6LiWV9gXsr0FJIvZime1p2
 Wj1xmORAFSl6suJRmAzwcfFdGTNWqPxv6LQQKUMBa/zEjsmySSJY9ZSPUtfSO86VVvminIFDkhK
 QoaVQOQ4lMOPUGbXQP02qszjVOdSuxKPicPKpqiv5Sw6hOQna9G30LAs3lkhcWlbC047XZhbNXV
 P9u55XNmFNt1lOZpCF3ql3THUhd1QXyCgkNRQVQOFcBzNUdGoLmE87BllUNt/efq6aWfsFM3h7h
 JSTBDOMKpbzBM1NZPm/+08UfgnvWE84HljmaVaX1tN0wqOwOprBLUurkda58yWGR584vhpb7FNT
 gFVdK4UXo+mi3HFXGVa8oJ0IJC34k4cujyV7qRDWnX2EiMSQKmH9wNmvptCkGg3qmV/HQe/qwiS
 CpEaUUIEWfsxAdsgujw==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a108b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=SQK6WCmdDylYjIm04O0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: LeuhnZDKIBE_niWTBvtJf7u7J1rqQig9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270021
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 06:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124693

Upgrade thermald to release 2.5.11.

This update includes the following changes:

- Clang-tidy fixes
- Added support for Wildcat Lake platform
- Fixes for CVE related to symbolic link exploitations
- D-Bus interface fixes
- Removal of power group handling after Thermal Monitor support deprecation

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 .../thermald/{thermald_2.5.10.bb => thermald_2.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/thermald/{thermald_2.5.10.bb => thermald_2.5.11.bb} (96%)

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb
similarity index 96%
rename from meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
rename to meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb
index 98310b4c5c..caec3d5610 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.11.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"
 SRC_URI = "git://github.com/intel/thermal_daemon/;branch=master;protocol=https \
            "
 
-SRCREV = "88369b42ec523787081b9bf8811b364e2a3d5f2d"
+SRCREV = "5269afcf3e021e4e1b672b4640a0358f4ae5821b"
 
 inherit pkgconfig autotools systemd gtk-doc
 
-- 
2.25.1


