Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761C7F433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:23:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8158.1776324193959932010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 00:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ghPo82M5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dXzENJUk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G1fhH11702608
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 07:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ED5D5I4/9v6zhXXkaOO8V1i3r4/ry0d+4f+
	zEVCl8hQ=; b=ghPo82M5GiIgbGj3PEO7cn2EAb4aNTMfex3bAo+Mem7SNvq9OhN
	S6TH1waaejutjRv/Eu6ZtCpH/nvlolyhyuHCuOMhaKQse3nw6A5Pte73rERFLlU9
	7NMzuMTi++XtU2h7yWOJdUf3mQdvyNooOmqHYj2Pl2O3uJNMCpg4wyTcuaBGrU6O
	SzD/sLN9asGWdzrq2Qbyn7DiKUWtUx8p7Y/s83T6xc4b8hzJnge5f4ElvpE+x3YJ
	cgblT1UHU0kg1IgM4WNE+qKPE6p1FAPd3n3RxOAlRpNCOf1Z0qXrYVm0fzo9ZI0I
	RcujiLb3zmfWMCrPrc26kEDk2nw0HLPP8Vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamjpcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 07:23:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso79162465ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776324191; x=1776928991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ED5D5I4/9v6zhXXkaOO8V1i3r4/ry0d+4f+zEVCl8hQ=;
        b=dXzENJUk/HTjj4EywN6/4pwkUjqHxsviHleHxKAvRmWemPd0WhZBId4Fd3+jEt11Fm
         BnRXK1qcdoICRmzTgpN+Qg0qLzlzbMUuFSRMmsu2LQAG4YlGStFiCyxuvg8gBO+959UW
         BTiaDaUWiZrdXVTSynk8/MGUxVi3oa8GHExQ4VQUxSX9ha1a9gf2uOmCXVAcwb8m5ORM
         YArCjvbAPS13EaQEtOtJM/Rxe9Kt92T7hP042E4mtfK8cGRlzH5dUxS809tmE81FwKe3
         EcUo3B+e/3r/lUNr0QgithkTozIvwkWLJUYbWToyjERXO8lxV1nB1THNBxxu2gQFb0OS
         hwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776324191; x=1776928991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED5D5I4/9v6zhXXkaOO8V1i3r4/ry0d+4f+zEVCl8hQ=;
        b=aG61Vmkr//Q+sBt1+V7IImCgCgSwE1wPHNl9oaa7fxX46jfaBWTM9ms0y6TwCKzCal
         64gYx18pWGiuoPnnkOvUAEcVtBgJiyb0hrafzuzobaPLpw5uZZn02quUPtkMCmeCDAkp
         7CArwxke6wBB32bjXpCfQQAs7Rv5/jNcaJ1C8TThgD7mQOQtJuDtsfVyb4vQjPIGL77l
         SsoD6erDfRB54cRljdVQJpFEWUtkXcGtsDuyVNd2xWuMcyFOIHyR1TgSg9YI8SgBEPHN
         XMaxpL6X/3eFbc5fZPYP1XUcnS3VEBWcH9w78sRr7DgjVn2ZXURYI3yfTT57EFaVEDRj
         CeDg==
X-Gm-Message-State: AOJu0Yz3xOTDSplvgMHq/vOOGYGmXx/U+eHSq3fShgj2/hcnT7PBx+xN
	Kkr/Njg7vhf021hL5cdc0YqdooDxy2qFZ4SLOKAPEw7PKoMWfmBNq1eqra1T7jK0wNWBrWCBQi2
	gzkY5kPqfEqt9kdY5Coz9ixbKU7sjFOKT20AyMCRKUMhg51LI1kv0OSEbSuDaXEL9W9CSA9pAwN
	AIMxsmDGgVnBgYE49W
X-Gm-Gg: AeBDiesiP58g6sQEjXgpN3QP1hRRmyIKnb0u2UR9dVn3DmnHYZjp/L2Lc38QiUAwDgK
	Xqt24SV8MvohEPlAx52zEl+Ygd+T31qVRH6REpOuq0oCpSysW5eyCbZt2M/baxdlauwwrhRXX58
	j86ZwLGZLq//eMO1Wq9SOzMOg0tnxBVaz+bQnjzHhMW8iD2J4GEp2tP7ibXxdJAMrfptoGh64Tc
	KejqkG0dIxKpODJ3zQEDlyWMBsiPPuLXJKwnY+/5GK85PzPUXMwotjcQXkQ0KeIWGIN8ZYyalTt
	pSZS1EdT/kMwS1St2XhfgmaV1h+RNWz4eCaBmhj0tKsT/silKcPKhwBHrGbe5Rrjv+5Cl4wSFnN
	WX8zVxnkGmGc8eXWAuyHtksd+pemkoEm6lPT26VrnFG6xmrDv/CBgIp+yDDP7JR8i1VsJhx9Lls
	vtUBfo+apVWmTSeyqjw8E=
X-Received: by 2002:a17:903:489:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b4460e723dmr116999955ad.34.1776324191443;
        Thu, 16 Apr 2026 00:23:11 -0700 (PDT)
X-Received: by 2002:a17:903:489:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b4460e723dmr116999765ad.34.1776324190737;
        Thu, 16 Apr 2026 00:23:10 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810e1c6sm42786635ad.26.2026.04.16.00.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 00:23:10 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] android-tools-conf-configfs: replace fixed sleep with UDC wait loop
Date: Thu, 16 Apr 2026 12:53:05 +0530
Message-Id: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RQtExwzId1ySnAt--sjpGrAE92gPVWjA
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e08e60 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=D97eaGN5x2HrZfm-qN8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: RQtExwzId1ySnAt--sjpGrAE92gPVWjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA2OCBTYWx0ZWRfX8tvLUW0wZaIP
 TwTcya+Rwz3fVfD54PylhXm6VdDgPVDjaUZQBE9ItS5H4O6f6b06TF7gXGG1ofRAyY43GbH0+IU
 7wZKFUUDU8UVhRyHZxrZDXL1bfTY0GxVriE0iRn0vrfGJaknNyYhYcZBEX+4961AL1/R5NG1f6c
 S5a/32elS6E2+wgr0cu117R/yUxHY+VygC9BaYyBkkC77b+N/XdFyF47rL0vQJePd5d2A1libHd
 7xij20Y8akaUyWvx3mML1fCQtypyav08OOxbtS0dFA+vNngfI+yOStZGxKPhnAW7xd2mqpuH2a1
 J8IdKp1/R9QcwAFOMRlDJwFWIGToSvGwMkueBogRHKN82HU/JQ5laIqHNDGmXD3Klzw3nie/79/
 N5qqho3w5g1AFDkGUjBdb0+dH6vjZktcjJ7XNPI1OB3wB6ZEPUUmXfotNaSIfgotrwHPp/bwt4g
 x12ZRpba4tFFSi31bGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 07:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126402

The android-gadget-start script previously relied on a fixed `sleep 10`
delay for configuring the USB gadget UDC. This approach can either delay
boot unnecessarily or still race with UDC or configfs initialization on
slower systems.

Replace the fixed sleep with a limited time polling loop that waits for
both configfs and a valid UDC before configuring the USB ADB gadget.

This makes USB gadget initialization more deterministic across platforms
without relying on arbitrary delays.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../android-gadget-start                      | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
index 76b5e29624..ecc9a0ff84 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -2,8 +2,37 @@
 
 set -e
 
-sleep 10
+n=0
+while true; do
+    # Pick first available UDC as default. Set UDC_NAME in env to override.
+    udcname="${UDC_NAME:-$(ls -1 /sys/class/udc 2>/dev/null | head -n 1)}"
 
-ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
+    if [ $n -eq 30 ]; then
+        echo "Timeout waiting for UDC configuration"
+        exit 1
+    fi
+
+    if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then
+        echo "Waiting for configfs usb_gadget to be initialized... ($n/30)"
+        sleep 1
+        n=$((n + 1))
+        continue
+    fi
+    configfs_udc="$(cat /sys/kernel/config/usb_gadget/adb/UDC 2>/dev/null || true)"
+
+    if [ -n "$udcname" ] && [ "$configfs_udc" = "$udcname" ]; then
+        echo "UDC $udcname successfully configured for USB ADB Gadget"
+        break
+    fi
+
+    if [ -z "$udcname" ]; then
+        echo "Waiting for UDC to appear... ($n/30)"
+    else
+        echo "Setting UDC $udcname for USB ADB Gadget usage"
+        printf '%s' "$udcname" > /sys/kernel/config/usb_gadget/adb/UDC
+    fi
+
+    sleep 1
+    n=$((n + 1))
+done
 
-echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usage"

