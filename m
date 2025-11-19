Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B17CF31B9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:34:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5830.1763555687328222685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GDE0c8TN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MRLQB/qx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB60fG1981507
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6Hh9ICx43T7BLaE11IO6a5bp56fHGhlJzKz
	bBIth7oQ=; b=GDE0c8TNhC37GyDXZWe2cy2G0f6tTAPIqv9vQ8zSkj7KNbZnzDa
	7rLOgS3VMaTMxddSiFSwlCL3tQvvLGE3rBo1Uu8ipRvP6P9s2EDhGeOtxKV2Ohuo
	caBeb4ozg52xyFG5qi9IbanP2Gs1z6Mv1kCz8gNSWfMKx2KLxYpIkKFRNM7rP6Q2
	S/hF9XlWe82wJvjJbCRFoLNoI/gQhT4yFZZ/fnHr6VvRs74h/E8bsexd5T3w8rd4
	7nBUWp2LW2wCpLsyWNvtjq0/OlSwx39JJzTWbBmcTXTagI1QVrMBXZ4/c3dvmqP9
	lJTNj8lJbWLkRDj4iCZ9A7+pLUCFUFk6WGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqng72c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso58489345ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763555684; x=1764160484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Hh9ICx43T7BLaE11IO6a5bp56fHGhlJzKzbBIth7oQ=;
        b=MRLQB/qxuZRvoELIH19jO6NmLlTIbT/j7fgGI9vaNP1uhbonOWRY6k9C44Y+BG6Jc2
         L6UVeY+S0W957Qdj61mlIwDnICUJ7DSs8oW9SFKnzAHLZy38Ars41pWAiJL/cxjDg8nN
         QCy+LPsddM5jzLMAwwAudAWRx2r91WAhGNkZoGr2aPS0dLLEM4oiiO1gFfDGOemyYPyV
         3A7rBQigAI1e5JoJNXVKzvnGWUjDX58m0iNuaGgFJ7WjG4fqU7hQlm6aN3MCNySgxBsq
         ohIQZKZhOLdo3Xz+lQTYcIgovJhAOcFy686rDeoJ1JGoYndP2gLsKwCRjWDtNs0XEse8
         EoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555684; x=1764160484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Hh9ICx43T7BLaE11IO6a5bp56fHGhlJzKzbBIth7oQ=;
        b=exxvB3y/cqPDB5X0jCIPJz3Oz2ET5thxjj27RAgkBu0d5/fajiXQ3JImULhPFwmozj
         L+s4xvodHa4Yei8ihfP9G6m2dgMkOtdvnVMAbi5m/7gHAj7mf6QoXCnEreiAwO8f872E
         IcE+dzZBAf8RAzW/aN1HwKypO/z8q26/EecKWz21XkMJaOZAW02p7QEWKfkf98r4L+cW
         wKOy3j1yUDWkLPPySjZMRbn/lxbhcGzDTsd7SnrJxMaQ+6BQKJjEAvZuqDV7NUY9cW3U
         RAUTb+ktuyCcwF/YVCodvWLlhd3VKpsv8eR2mC+3lBG701yqOAu7j6ntwvMr1mdH20qc
         +tyw==
X-Gm-Message-State: AOJu0Yz55nBLL04plAH8DTrVmSVLLmMDWOcAmfv3WJqZVSlxCKDt/JKd
	Gv2K+CH0h9+txwkZoAgYmgdGTqlUV1Mvtg5EJFPG47PCJztUcj5M+ABX58UXO4pcFwhtICApp9j
	edtKgU4mywUzMl9xe0y1A+PwrVQhRfbuZA5oGsTRtUEaAAvipELhh9A7NZ16zyKhrNcdf+l1Z0k
	EuVvfelZbosA4DEcRuIfA=
X-Gm-Gg: ASbGnctM4zGa7Hlx4eNNjErhOF5skzj/TQOKFrfrxVPyk0cxv3/h6NVCvkVLGd0J3p4
	Ja+KxZi/J/+D/Wexh70QT8/O58AA4erZXRgK7vP7lqOuxBhYiHPEgbVS3tefAltuMUAk0f7rq5j
	zJEvTqhs3sghqoHpEzj1Kh03jf7Kyf3koA5wdqIXA/nCqZ9qIAZw1N8YflJ56gWYMPMqMszHU+/
	QJsgTBbFTuKXhpiY2CsMqgJDTqLTqdklCSbRbIi6u9BGw4GQ6K/RBnCIoyklPhP05c//svtpenR
	+Plx7JkQCF6Y5WG/ZHpsl0q12s/6n0n/sP7bzVMONuEC2hxMd+lbGemmpBCbXvgubQkITwWtxnB
	pYWSYjLf2pCcx2v6o1Kr1FtwL9OMQRHQjAPRxgeA2
X-Received: by 2002:a17:902:d58a:b0:296:3f23:b909 with SMTP id d9443c01a7336-2986a72cabbmr257014615ad.39.1763555683748;
        Wed, 19 Nov 2025 04:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/vyUMFJkS38jVfzioICytR397vBiD8n57iFzXOnJgwuwbI/hI/9V8Pz5TxVzzZOZ4wM0/HA==
X-Received: by 2002:a17:902:d58a:b0:296:3f23:b909 with SMTP id d9443c01a7336-2986a72cabbmr257014235ad.39.1763555683156;
        Wed, 19 Nov 2025 04:34:43 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm207999915ad.91.2025.11.19.04.34.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:34:42 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-initramfs][PATCH 1/4] klibc: fix debug pkgs reproducibility
Date: Wed, 19 Nov 2025 18:04:34 +0530
Message-ID: <20251119123437.2192091-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwMCBTYWx0ZWRfXzgeR7yLfX057
 1JOuO4pfsDK4nqZ/7BlWhHQuUL30BawF4YvF+BM2SkhWw62r7K35TQUcHjlYc25DBwBN78yJnsF
 m+0au+24PbnqL/AKWNOH0N33I3tSctpFkDzFOZQt+hNzCV85AiP5L4JtqxH9ZtAfawlIh8boT9d
 /7DzSr0fY8iV3GsLwaex3rznm3H/2CsCH/GmjCzggrLy8DlpttlakVtx3MybN5WXMYB8Iu/SRil
 2RQxTovr8M84UpG39otuCYuTklq30eZ9rlxrLflMozGolkpIrv109RWLFaUV3zAf4S1ETSTGnNr
 4MwYdaN3jgV/A1CPshC96e5fduzjJcJj8ixIK6Aif15199a/zFxBmarzZ8IsF8F7sP5DNXIqe7D
 GPOigwGHf6OjNmpix7eJBQkSRLAlAg==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691db965 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rGqztzX4EKtxgQP8p-gA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 9Ho24DlGaKRpuvm_1EwnE-kYWYtFqc3h
X-Proofpoint-ORIG-GUID: 9Ho24DlGaKRpuvm_1EwnE-kYWYtFqc3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 12:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121901

From: Yoann Congal <yoann.congal@smile.fr>

Debug packages of klibc-based recipe contains reference to TMPDIR and
fail to build since "buildpaths" is a ERROR_QA: For example, from [0]:
stdio: ERROR: kexec-tools-klibc-2.0.18+git-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/kexec in package kexec-tools-klibc-dbg contains reference to TMPDIR
stdio: ERROR: kexecboot-klibc-0.6+git-r0 do_package_qa: QA Issue: File /usr/bin/.debug/kexecboot in package kexecboot-klibc-dbg contains reference to TMPDIR [buildpaths]
stdio: ERROR: ubi-utils-klibc-2.0.2-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/ubirename in package ubi-utils-klibc-dbg contains reference to TMPDIR

Fix this by adding DEBUG_PREFIX_MAP to the klibc build CFLAGS to rewrite
these paths in a reproducible way.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/40

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 643bc59b0ca271f71c7fef80ed1db4d117248f9b)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-initramfs/classes/klibc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 202d132d94..ca50a3d431 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -9,7 +9,7 @@ CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-export CFLAGS="${TUNE_CCARGS}"
+export CFLAGS="${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
 export CPPFLAGS="${TUNE_CCARGS}"
 export LDFLAGS="${TUNE_CCARGS}"
 
-- 
2.51.2


