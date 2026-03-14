Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B6610706D6
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 12:18:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8579.1773490680126371100
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 05:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cmGD40g0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gEy5WqKU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4CkMG723321
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/
	DiTydyEM=; b=cmGD40g02ogG7HHN8ZsKY/ncEvArTSqb3rD/+njjc2WpRqzITtw
	StHXSoJ9GqWd0CjyAjNUyBfG752HUejijIdV9l1EZnEWErkUgRlh8y7O62edvXSe
	c4VDKD3Aqkidb0D0xJnAa2eaPdk9WOTeqygQ/N4uCS5VoJWOUNG/vv5ptM4CI+5G
	0GNucUFDHM3IH5+b1cAWPLx240iYS7JD+jVqSYQW6pPolvlC8+jGKVSCGdvQ+hr6
	JvBta573c+L8pov9WBS4CjM/dKF/ZhwQpk48bCdnEJ4K9sCXdiQTFyPypf/N/ana
	AWVfPQJRqiIwbzMmzu2WfRNHBrEg1Atf0BA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ec8p2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:17:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso3499002a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773490679; x=1774095479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/DiTydyEM=;
        b=gEy5WqKUTirpYMIMlkEtVYuRwiM9xRnleJcd1JAKqZ0UkLlFipn+b3LUo/Y/ZIlM6w
         irdCdM8k1ghpk5MQflQS4tnDYvkSYkbpxfnb97gE115QPjyruNlPbnU9p2+Tt3/qGm5W
         2qYooNjKz0eh2hP5dlnP+tWPKwtG3787ofyRmRReHNlm7yFJjstUp/h/LWsxVhPCGfCf
         LX488olhJsydmosJphmUzICLUAEGKg2WFETqcwL1iBr34gmgHN8q0EB9iQ+9l+nYiY4p
         9t+eapIyp60so+eUVkq33kGwINv502OhjXAUkPTDQgSy2ZEiKApek5z0aqim1RdjyUG9
         lbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773490679; x=1774095479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/DiTydyEM=;
        b=jvl9vezOjksBb7A8gZl/Az+OSuiZa+e+LjNtWCupeKMeLXwtB3jOnLqRSXS3KOJhrM
         ZzR83HP2HVteVo5eecEWZk7KZ2Ya5WJXRm8MElniQFgYghCY3llqTxnq5P9pNsuwA90S
         +pORwxdR5x1/iaWF37CKP/J/MUI9pI6hI9yg9zgACB7cQCE0gzfnVXPMZpIgtXPQdJi7
         denkH4NHO6S+tFgbcGNWXe10P9vbtlpnWSa1NlYC4c8KMTHZdvn53lOCTwxGskze6gqZ
         P5TDSYm/8Y3jIeClFiYeVWmyQIN9OdZhHsZOm65rbjWGwbkWzydn1IgsoiWurfQl4OjB
         yrog==
X-Gm-Message-State: AOJu0YwM6mf0jVMseprUy/0riyNijxyhSmWmb/9z7QBRqFjFC1JcGuF8
	AGHT5CSchCCm/O4t+7/68rEWJ9kwXTgjif62wJqLAkG8NtMLjqEvDqCdif4GtOxNkv3z3NME5vV
	F6S+dHoKIh7lX6CsZFNXf5AU88U4JWhNzIKEJHvTqYPCed6sbC2ajEyDW8lIkhlQ7qn8Nh4MjwO
	8G8T4GkeSvekU8A3hT
X-Gm-Gg: ATEYQzzncRs98xNzA6G+zIHCZ5FPE7aJhfXQu7d7rOyoFnfu1o3JpVzByxbidL5Luxo
	cNkwKF4JJHdX8b6Pv9p4UXTVRqRFwe7EftchXbrCDOGPPN+yhUbAPtY1NIJA8iGLi9Yo6nj3YIj
	BS0xNgOWsV0KdnvkzyztSjznaRcIp+N33xOXbP4tY8uHpdE7df7vscdwhUCt4FiiBnxviwHnpGd
	F4TLx7MtpJhf0deI3AyfWbu+Ay23tN2gjdADgp0cG2vR33/FjduftK60nnYlGFFtorI75dDArKK
	pztByyIC7Cuwu1wo8x74evVzc4/8cWeyZ1v2OkrK6zg2g2psKL4FCr9M/gqlbmiP1UoWpwn2vAL
	UV934WWV22yIqq0T8V5MQiDAqfQ6AWKT+LE1Xo0IiU7g5Qpu6Da6GDBtPN4e4bsh2+zqgX/PYQl
	Y5MIt0kc3g9zyD8EQaS/0=
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr6491230637.57.1773490678650;
        Sat, 14 Mar 2026 05:17:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d83:b0:398:6461:6879 with SMTP id adf61e73a8af0-398ecd9770fmr6491218637.57.1773490678134;
        Sat, 14 Mar 2026 05:17:58 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb8ade35sm4148695a12.0.2026.03.14.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 05:17:57 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] android-tools: add fix for strchr() conformance to C23
Date: Sat, 14 Mar 2026 17:47:49 +0530
Message-Id: <20260314121749.2875772-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M5Kmza2ah8OcmHhPHjvw66Ugi3PtDP42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA5NSBTYWx0ZWRfX1rLdt+t8GuIv
 LC/Gd+XZj2XNx0NCC1uQ8KkehCn8m7pLgaPpV1G0GXpox6VQu9oUFPV0iR1krW0SZUZYTpoEl8D
 Mw8oxOCdypBkFYz8tISAkad4AB+0JA2SqhfIJ9PyC3VeG17ito7a7VymyrvvOF2waKw54Iy62kj
 aVp/Bl6zisLOSpP5T5143+vt1pCsz6/9XyCNNzHtKDY1wr8Xe6j27t96mzlcDM9BzwEakad9522
 GzNu0R+ysXeSu96NJMDZJ9QwM6ZJW6jUb3vxW+Z2dibMhwOIfY3qV8FdRTUOeGxcU7X5RffkFYq
 ab0y9NPfls/bd2XRJ/sCI47W5M8SUDiJy/ybsPPYMWkV8gIKJTb6abtO5wESwsDATKWzr13Wu3r
 VVc7Q/6aPPr1oAMJmWlGupgoPVtXUJFU0iwmeJeauOQdEYQA6tFZPnyDMHyAFtanqTgbTRtPY3f
 pGtF2hEPrlw1ugVyfGg==
X-Proofpoint-ORIG-GUID: M5Kmza2ah8OcmHhPHjvw66Ugi3PtDP42
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b551f7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SZdcAycclXX2kHHUgkgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125204

Building android-tools v29.0.6.r14 with glibc 2.43 fails due to ISO C23
changes to strchr(). Add a patch to update the affected libunwind sources
to use const pointer types to fix this build failure.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 ...nd-fix-strchr-conformance-to-ISO-C23.patch | 27 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
new file mode 100644
index 0000000000..4da65ea285
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
@@ -0,0 +1,27 @@
+From d91f5324f809c3a5b0343927716e4b99bc31db53 Mon Sep 17 00:00:00 2001
+From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Date: Fri, 13 Mar 2026 18:57:36 +0530
+Subject: [PATCH] libunwind: fix strchr() conformance to ISO C23
+
+Fix uses of strchr() to conform to ISO C23, supported since glibc-2.43
+
+Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Upstream-Status: Pending
+---
+ external/libunwind/src/dwarf/Gfind_proc_info-lsb.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
+index 77ed3d09..37eadf52 100644
+--- a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
++++ b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
+@@ -248,7 +248,8 @@ load_debug_frame (const char *file, char **buf, size_t *bufsize,
+ 
+   if (*buf == NULL && linkbuf != NULL && memchr (linkbuf, 0, linksize) != NULL)
+     {
+-      char *newname, *basedir, *p;
++      char *newname, *basedir;
++      const char *p;
+       static const char *debugdir = "/usr/lib/debug";
+       int ret;
+ 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 74928ed171..3d4e95b496 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -22,6 +22,7 @@ SRC_URI += " \
     file://debian/external/libunwind/legacy_built-in_sync_functions.patch \
     file://debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch \
     file://debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch \
+    file://debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch \
     \
     file://debian/system/core/move-log-file-to-proper-dir.patch \
     file://debian/system/core/Added-missing-headers.patch \

