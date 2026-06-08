Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7D9CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 11:12:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52012.1780917130035115179
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 04:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fzhgTFbG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Qz2veGp+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BC0nJ3487394
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2026 11:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pfSJaonTyaI
	Ta5TxbCT4DlujUG9dnV/McrTZf3zdxCU=; b=fzhgTFbGtbmNkyVOQK6gQUl0z2b
	3oHtcVOKwN2LtriSFOBsxq+Zvh2oxXhU+4npTHlgnxud7FaWQfjupRmKoRQJpL5F
	7lEKAXcFGPZmoYXKaD1mm9+ywm/qMa4LX/5MHcTvr0YfSGqfJUBZlf5s0aphGQMN
	YlUDuoMGRWfhzT8C5xfNmHdeG1E6fRYY3zLqYT94lvwXsxHJqwD3fcInSazzz4m2
	Vp4so9mAnV54nr/0/QPBDdzfP+bnduEtJJjPgV9ZPDZSWOk8SkrbrezVWGGVU1Kf
	ifoUKj49ycic1g/0ydwkJS/PILRDRB+W/ZY7HK1PVVycMbRJXKUf2542MVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrfm42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 11:12:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c89de84f33so4651110137.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780917128; x=1781521928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfSJaonTyaITa5TxbCT4DlujUG9dnV/McrTZf3zdxCU=;
        b=Qz2veGp+U5mRDoQ8KVlplRQqLciHW9oE9MV6sc4gCErFY4BLs3vfoyWe93x6fSn6Xm
         py3QF9IxRm8DHQX2SXRbTe5M2NJ+dxCXT1bOGCKl9072cl9s8l/oC3sMuGRJqjUvEyxS
         SgBczhiMsn41Vgbwi0gDTEPI+oKcYNHolt0hB4cAgdk9NbcXBGU4fv1UykeDatSNxFTy
         Eagktt8r4R4rUajzIunq8Wpag2QOiWc1Yxu51NTPjhAHWhE+n3N0qUMC4+HUSQs4cUBF
         tYjHIG/Yqm19x+z3cQ3ZdPIb7IsM20WUFZSK8VJ5Hnuj4CwrADKfd6brTwLMLInj2kbB
         3FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917128; x=1781521928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pfSJaonTyaITa5TxbCT4DlujUG9dnV/McrTZf3zdxCU=;
        b=YQkzoaV+C21vBiz/f2Of662SPUMxpfpTYu2ip0Y8kZVrE1/Eh3FDKPVaZEJzIPolAs
         aAxHeFHoCslGhqkWDtdD+/kXFlTjTN7Q6E6F/Kf9LOlDqFlvnNp+OF7QhPdeaSHjasA0
         yqH01Ah4qVWFQZGPIu84yJWtn572C4w+WclzkZ219j+da06P2TQq67jXwJdwwKRWBZvc
         vyJ99PZpi9CUVdjfGvjEDw2dPvIGwUlXj1WkmQ90sKiLQt42ZisyG0npj0B5ZIrnmcVM
         9pqT0wH0yCLwuvXB7OPGoQ4oUS7yce64GH/V9C7c4M9QInKeMjF5QTxJ/pxhtAwH7Ur2
         /m9Q==
X-Gm-Message-State: AOJu0YzNHh2jWCfbx8f+ZyTH7FnAmYLBBcrYU0xfqybvjAkn79HxdZKL
	ll2dIpTv+UjIElhCc59rrdI+Y4pddAWshaQz+b3hZ3+AnWBdoSALNFKkxLoXu4vSZiEj8EEzl+z
	HywQXfhM6ixTRIKYpYQv3o+Qr1hV5cnQFBFJSWrI4pGz/tDsnMuBGApCdwXJlJx6BrAf1wEzLxS
	jkzAu0FePIkjyPUoke
X-Gm-Gg: Acq92OGHEL+bLmUW3zCdtfolKKf305xsWR0HxBfXpQmliXLb/+sVgzn5smdtR1XYeDX
	icF4MLF/K4GqI/phaL4hTOXfQoJVyxyOp6M0H+KIx+JbPlicUCukNubBEx4WZY5KKHSUE8F3HE1
	DwURvGWXMGckCMe18vubS/4o/Zk0g9sa8jgnhg5K1e2AGkB6h302T41T0dlCb+Aq0Zh2D/yYG+6
	KC72Hh6kZZSxzBA2j6vQGTFprS972Z6Z2aX1BwNj7mAcMMNQLOsl2WkQi9Y92IuvoP3FKQRStov
	XfGBp0+gW+DFBCjm5tjdqbfvsH1pwIAIK6KNWR8vteW6fNTFcUbz1gHWYn5UX+1YS1O0ndI+FJq
	2dOs5bBxSy8s4+vkUMU3KXynQk77/RmLill3NuYTjVZ1td6smTIxL/HXebJE1slyiqiK8MTTbt6
	IrYD4HYLS+pMk3YAfA1tCTL7WPkuG0RwAzYAyVwvcOKwtpfA==
X-Received: by 2002:a05:6102:3750:b0:6d9:a879:8e39 with SMTP id ada2fe7eead31-6fef8532688mr6652646137.14.1780917127606;
        Mon, 08 Jun 2026 04:12:07 -0700 (PDT)
X-Received: by 2002:a05:6102:3750:b0:6d9:a879:8e39 with SMTP id ada2fe7eead31-6fef8532688mr6652634137.14.1780917127053;
        Mon, 08 Jun 2026 04:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99cc7esm3732490e87.82.2026.06.08.04.12.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:12:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] OpenCL: upgrade 2025.07.22 -> 2026.05.29
Date: Mon,  8 Jun 2026 14:12:02 +0300
Message-ID: <20260608111202.3259660-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608111202.3259660-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260608111202.3259660-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwNSBTYWx0ZWRfX/TvGWyUWMGOu
 oQmY/zGvOQKJhmTDegdhz1F3u4R1wpuTE5kc7COpAW0JrVtOLaXQQeeCz7Xl1PtMBcucgbpN094
 P2gNrHoFGWUQSXOa4qiUPenRMd9iibJHvdTqiYgUsYccAI0knjnVXXJtx7NY5cvsDamaQIQn+lQ
 J8r3l99XIivwh0DHYQs8d72yTQP7hHgLlf6vMIVG7Cie2phUzmoVu2KDnIpIYed8Pe52FADP+3W
 55Ft5kAVuao2SPokO6fizEen1ZlDqGtn/VAlq587tEsmaqgJ+RE8bGvjhzrG8mqE60GpE2sIZoR
 i5Cv5lIQX0cSkZYXHUNAXSBHj3UcOqo3FkLA2k5aoqoflAmPAq1NxnUj2DNZv0TTvUYSdh+qD9e
 5jhcAPRhSHWxa7C0Do44sVmOzyy1dbCjHBHmc07urFG5Rh4/HnQSZrUrylkEmhEf2Wvuqgu1h4l
 5Cqp0beQh2dAmL4YzfQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26a388 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=YXbCWqCE5ribvV5TXM4A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: GnLE_EgyOWSjy2Jkp_1iLfjQF1Oovw4z
X-Proofpoint-ORIG-GUID: GnLE_EgyOWSjy2Jkp_1iLfjQF1Oovw4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 11:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127423

Synchronize OpenCL headers and ICD loader with OpenCL v3.1.1
specification release. Apply the patch to opencl-cts to fix building
with this release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...r-the-command-buffer-pending-state-2.patch | 61 +++++++++++++++++++
 ...25.07.22.bb => opencl-clhpp_2026.05.29.bb} |  2 +-
 .../opencl/opencl-cts_2025.04.14.bb           |  4 +-
 ....07.22.bb => opencl-headers_2026.05.29.bb} |  2 +-
 ....22.bb => opencl-icd-loader_2026.05.29.bb} |  2 +-
 5 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-remove-checks-for-the-command-buffer-pending-state-2.patch
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2025.07.22.bb => opencl-clhpp_2026.05.29.bb} (91%)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2025.07.22.bb => opencl-headers_2026.05.29.bb} (89%)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_2025.07.22.bb => opencl-icd-loader_2026.05.29.bb} (96%)

diff --git a/meta-oe/recipes-core/opencl/files/0001-remove-checks-for-the-command-buffer-pending-state-2.patch b/meta-oe/recipes-core/opencl/files/0001-remove-checks-for-the-command-buffer-pending-state-2.patch
new file mode 100644
index 000000000000..801162a7df80
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-remove-checks-for-the-command-buffer-pending-state-2.patch
@@ -0,0 +1,61 @@
+From e936977934ac450d8bb7c66635c02105a29f7ea8 Mon Sep 17 00:00:00 2001
+From: Ben Ashbaugh <ben.ashbaugh@intel.com>
+Date: Wed, 27 Aug 2025 03:43:29 -0700
+Subject: [PATCH] remove checks for the command-buffer pending state (#2504)
+
+This is a very small subset of the changes in #2477 to get things
+building again, since the command-buffer pending state is no longer in
+the spec or headers.
+
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-CTS/commit/e936977934ac450d8bb7c66635c02105a29f7ea8]
+---
+ .../command_buffer_get_command_buffer_info.cpp                 | 3 ---
+ .../cl_khr_command_buffer/negative_command_buffer_enqueue.cpp  | 2 --
+ .../cl_khr_command_buffer/negative_command_buffer_finalize.cpp | 2 --
+ 3 files changed, 7 deletions(-)
+
+diff --git a/test_conformance/extensions/cl_khr_command_buffer/command_buffer_get_command_buffer_info.cpp b/test_conformance/extensions/cl_khr_command_buffer/command_buffer_get_command_buffer_info.cpp
+index 88ea906b1ce5..add0a5319d9e 100644
+--- a/test_conformance/extensions/cl_khr_command_buffer/command_buffer_get_command_buffer_info.cpp
++++ b/test_conformance/extensions/cl_khr_command_buffer/command_buffer_get_command_buffer_info.cpp
+@@ -250,9 +250,6 @@ struct CommandBufferGetCommandBufferInfo : public BasicCommandBufferTest
+                                           &trigger_event, &execute_event);
+         test_error(error, "clEnqueueCommandBufferKHR failed");
+ 
+-        // verify pending state
+-        error = verify_state(CL_COMMAND_BUFFER_STATE_PENDING_KHR);
+-
+         // execute command buffer
+         cl_int signal_error = clSetUserEventStatus(trigger_event, CL_COMPLETE);
+ 
+diff --git a/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_enqueue.cpp b/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_enqueue.cpp
+index bb59118d2995..ae14b87bcc09 100644
+--- a/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_enqueue.cpp
++++ b/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_enqueue.cpp
+@@ -124,8 +124,6 @@ struct EnqueueCommandBufferWithoutSimultaneousUseNotInPendingState
+ 
+         error = EnqueueCommandBuffer();
+         test_error(error, "EnqueueCommandBuffer failed");
+-        error = verify_state(CL_COMMAND_BUFFER_STATE_PENDING_KHR);
+-        test_error(error, "State is not Pending");
+ 
+         return CL_SUCCESS;
+     }
+diff --git a/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_finalize.cpp b/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_finalize.cpp
+index 8d00ca86344e..05f43506cb76 100644
+--- a/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_finalize.cpp
++++ b/test_conformance/extensions/cl_khr_command_buffer/negative_command_buffer_finalize.cpp
+@@ -89,8 +89,6 @@ struct FinalizeCommandBufferNotRecordingState : public BasicCommandBufferTest
+ 
+         error = EnqueueCommandBuffer();
+         test_error(error, "EnqueueCommandBuffer failed");
+-        error = verify_state(CL_COMMAND_BUFFER_STATE_PENDING_KHR);
+-        test_error(error, "State is not Pending");
+ 
+         error = clFinalizeCommandBufferKHR(command_buffer);
+         test_failure_error_ret(error, CL_INVALID_OPERATION,
+-- 
+2.53.0
+
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
index e1302f4963f6..299cb30e4849 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "2a608428f725cad7903ef55e1ce5b995895838f5"
+SRCREV = "5661a0efc215b1e05d3b90315c64f670101fdbde"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index fe1d6075e27b..0d2356b519f4 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -12,7 +12,9 @@ RDEPENDS:${PN} += "python3-core python3-io"
 
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
-	   file://0001-Ignore-Compiler-Warnings.patch"
+	   file://0001-Ignore-Compiler-Warnings.patch \
+           file://0001-remove-checks-for-the-command-buffer-pending-state-2.patch \
+           "
 
 SRCREV = "e96edaef8b582c2412a2aab4b82f5c88af88617d"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
similarity index 89%
rename from meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
index 3b5f948e7d6c..24982c3b6789 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
@@ -4,7 +4,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
-SRCREV = "8a97ebc88daa3495d6f57ec10bb515224400186f"
+SRCREV = "6fe718c31a45fe25151362a72ef041c3a1047cbd"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
            "
 
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
similarity index 96%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
index 1a9af6238019..9f6f59215930 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
@@ -12,7 +12,7 @@ DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/libopencl1"
 
-SRCREV = "ad770a1b64c6b8d5f2ed4e153f22e4f45939f27f"
+SRCREV = "b7bd2803acc779c03d96588e9ca9e9568a18698a"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
-- 
2.47.3


