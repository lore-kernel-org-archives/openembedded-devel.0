Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6339.1793257665536911449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 00:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CZ3ZAQj5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vaibjind@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gm3v176790
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 07:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HYBEOK7PVaOjrbrh7em55ZWZzD0vd+m9n3J
	OrNIM3WU=; b=CZ3ZAQj5o5B+bGWonMXrUZ+0wdYdB3pLG06pxywaRFINOqxIcx3
	q0o/LvJMJlG5mOwtMDLuKcq/ctl7b/pWGT50de5EJyOgyG555PjfV7vLKiXdm4o8
	RPYS1aCwj0qRBGIHoLxhKXflHeYpCM6vI6l1cD97pKhi871zSiPExnhrj54i+GN4
	OX0SRzhlNiOLn/WgZvfyOgh9zv9gN4l08otFlFhup18ymRGYasZJdcgdUKwZZisl
	BsJmqrJqJ9dNm4G7oHtBwzY8GGPTjDH2cCxd/VZDcxH4ZJCCvF3hy+w3mqXkA2TR
	kgbv1eBdFNIiEqzxM5hqyqMt1QJG18jq9+A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehuc3k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 07:07:44 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69T77NjC2226090;
	Thu, 29 Oct 2026 07:07:23 GMT
Received: from hu-devc-hyd-u22-a.qualcomm.com (hu-vaibjind-hyd.qualcomm.com [10.147.244.121])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 69T77NWj2226081
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 07:07:23 +0000 (GMT)
Received: from hu-vaibjind-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-a.qualcomm.com (Postfix) with ESMTP id 63B8F64F;
	Thu, 29 Oct 2026 12:37:22 +0530 (+0530)
From: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [meta-oe][PATCH] wrk: fix parallel build failure due to missing obj directory
Date: Thu, 29 Oct 2026 12:37:20 +0530
Message-Id: <20261029070720.2882299-1-vaibjind@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: A8JsfI2R17CpanQ_p-9xNEgjJBKLAIgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX2RPADytsLrPC
 xmAKI/Vk7uy9rsdU/UHt03Xpguz2Qs16RaDA9JIhK2GTYHNtwEP9zG159ocxOWq5OV/X/IoazvX
 FIfx+Ybi+IGifGJ5XUSulr69TKLHsoJdYJ1r/k5SewCtuQ4jCsTusBTptFnwngZwM0r/zsphn3q
 SHEHHGz0qnWexEpKLrDgf4SdKsXkjP5VoHeG8Sq9xw0ulSoXeE+Hh+Fatz3fPFGxZsMceaGms+t
 FUulsb7ZnENwEAJCGTX9b+9xtohB+8EM4zuEUSZ/tdMi8QuDee/ohetZeJpvpmgwZSft5vaLhkH
 6uFebGJXjn15chzwdPqzp+X/MaRh7gF3jvjpSdO+oPdM/Swl7K+IviBx+2M9HY9jDeSN6POd32R
 fM47JgT6ToRvDbnrv1c3J/I7pMw1qNrXvUK35Kxc9efR3SJmlWTAj3QUgJG+Q/MWgQDLFJI5qFN
 vyJZREQj/9vA9mujMhQ==
X-Proofpoint-GUID: A8JsfI2R17CpanQ_p-9xNEgjJBKLAIgC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX2ZSnlrHjynR6
 bsL9x3sgIGhBXkWtGtLKtz/Qyp2dFtQpjrozx308IUsStcHemzxN0twV3g6FIDbX6184wtsV0Sd
 Cv+yv03ClnH8yruunoGXdEOXj7hktUQ=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2f0c0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=_Y2gOFyC22x1hoYQTOcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 07:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131641
Content-Type: text/plain; charset="utf-8"

The obj/bytecode.c rule in the wrk Makefile has no dependency on the
obj/ directory, so with parallel make luajit can run before obj/ has
been created and fails:

  LUAJIT src/wrk.lua
  luajit: .../obj/bytecode.c: No such file or directory
  make: *** [Makefile:64: obj/bytecode.c] Error 1

Create ${S}/obj up front in do_compile.

Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
---
 meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
index 47ca9ada01..d06d86825b 100644
--- a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
+++ b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
@@ -25,6 +25,9 @@ EXTRA_OEMAKE = "\
 
 do_compile() {
     export LUA_PATH="${RECIPE_SYSROOT_NATIVE}/usr/share/luajit-2.1/?.lua;;"
+    # The obj/bytecode.c rule has no dependency on obj/, so with parallel make
+    # luajit can run before the directory exists. Create it up front.
+    mkdir -p ${S}/obj
     oe_runmake
 }
 
-- 
2.34.1

