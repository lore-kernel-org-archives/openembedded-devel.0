Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90D7CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:44:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1805.1761720786724253613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 23:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=P9b86kOp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: sasikuma@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4utBQ3692119
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wVlsk9WXAdXGRBQuFg4yNWEQyshWnIzVE7r
	vUTrD91c=; b=P9b86kOp/TGu7Iaq6Y3SmHd0kytdHXDuY4pv/dXC6ISJUc4C+9L
	FB6MsckfYQsFqv6yUGGhVzepYHcILOAtAssb9mTxYgIL212amgUMikoMUctaDcS2
	XVS7uBjRbu3cCsKlBQHWmEWZc7W4Madjww54qvB6S+np6lXW3EjLCDNRwNobx6CX
	agvM/pSUaNBGel/tWGjCcLQAXyowEIcrHuuOMOAoddfk/9aT0WMrQtac39h3wsbV
	I9Wa8kqH/nmurXwae8aK4ETowgob/rLUniJ5IJiUd/OQ8+De0T4GgfARdpjXAlY5
	Lfo3nd+QDdETkaOd7m0+BO8AYkXli2uM1jQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2hgbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:53:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T6r2Ow000909
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:53:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a0qmmbcwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:53:02 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59T6r1CJ000900
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:53:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sasikuma-hyd.qualcomm.com [10.147.243.253])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 59T6r17K000893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 06:53:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4060212)
	id 948935C8; Wed, 29 Oct 2025 12:23:00 +0530 (+0530)
From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
Subject: [meta-oe][PATCH] android-tools: scope 'write' macro to prevent conflict with std::basic_ostream::write
Date: Wed, 29 Oct 2025 12:22:58 +0530
Message-Id: <20251029065258.3394808-1-quic_sasikuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uif8WKXrRiChPL2cSruWJM4OvSxtrGee
X-Proofpoint-ORIG-GUID: uif8WKXrRiChPL2cSruWJM4OvSxtrGee
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901b9d1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=PVV792kUnmjxiNvU62QA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0OCBTYWx0ZWRfX73Xk/+8ziotC
 w7brBPbdved1vbKSfHOjcctKqQcj1CngYiK3BFsFJSMeRGJVp9wPWqeRE4DppvRGkxxfSVZh4L9
 z9kZukKgJQcxJwMaygBxg0b66oPAArmiO4kLqT2CcArk/n3u1ZHRnuflXWo2GPWwvAyEbWiB732
 YIU2z4pAR81QpHOeZtG62kWCjyCMj8Gj9Bv0PsiwtI84HtKBgIBbGW/mkQWJLdYOkwbBPJ0/YZh
 72hVbRbfeYqAwP26KBf4GWDGHwK8rVSv8hRwxznpa7OH9wsYYUIIQdeoJTMfTjVDehkktMLzrQm
 OSMi7BmgpItL7vvpsgskC3hl0+BIekwH/bTzQXwnltH7ZmMJNjFwh9OcMeBqrkO118erUf96xCJ
 dyQEOGZLnjMKvcPRmaypVQNv2qgXDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290048
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 12:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121149

The build fails with a compiler error due to a macro redefinition of 'write'
to '___xxx_write'. This macro substitution interferes with the standard C++
library's definition of std::basic_ostream::write, leading to a mismatch
between function declarations and definitions in <ostream.tcc>.

Wrap the `#undef write` and `#define write ___xxx_write` directives with
`#if defined(__ANDROID__)` to ensure they are only applied when building
for
Android.

Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
---
 ...ope-write-macro-to-prevent-conflict-.patch | 52 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
new file mode 100644
index 0000000000..61032944d8
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch
@@ -0,0 +1,52 @@
+From 72b53f2d5c6e1b462a288cef3d84dd302fe603d6 Mon Sep 17 00:00:00 2001
+From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+Date: Wed, 29 Oct 2025 11:58:20 +0530
+Subject: [PATCH] android-tools: scope 'write' macro to prevent conflict with
+ std::basic_ostream::write
+
+The build fails with a compiler error due to a macro redefinition of 'write'
+to '___xxx_write'. This macro substitution interferes with the standard C++
+library's definition of std::basic_ostream::write, leading to a mismatch
+between function declarations and definitions in <ostream.tcc>.
+
+Wrap the `#undef write` and `#define write ___xxx_write` directives with
+`#if defined(__ANDROID__)` to ensure they are only applied when building
+for
+Android.
+
+Upstream-Status: Pending
+
+Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+---
+ system/core/adb/sysdeps.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/system/core/adb/sysdeps.h b/system/core/adb/sysdeps.h
+index a4827b8a..ff51d574 100644
+--- a/system/core/adb/sysdeps.h
++++ b/system/core/adb/sysdeps.h
+@@ -127,8 +127,10 @@ static __inline__ int unix_read(borrowed_fd fd, void* buf, size_t len) {
+ static __inline__ int unix_write(borrowed_fd fd, const void* buf, size_t len) {
+     return write(fd.get(), buf, len);
+ }
++#if defined(__ANDROID__)
+ #undef   write
+ #define  write  ___xxx_write
++#endif
+ 
+ #undef pwrite
+ #define pwrite ___xxx_pwrite
+@@ -463,8 +465,10 @@ static __inline__ int adb_pwrite(int fd, const void* buf, size_t len, off64_t of
+ #endif
+ }
+ 
++#if defined(__ANDROID__)
+ #undef   write
+ #define  write  ___xxx_write
++#endif
+ #undef pwrite
+ #define pwrite ___xxx_pwrite
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 24b6822433..47c8e08b62 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -39,6 +39,7 @@ SRC_URI += " \
     file://debian/system/core/stub-out-fastdeploy.patch \
     file://debian/system/core/fix-standard-namespace-errors.patch \
     file://debian/system/core/Add-riscv64-support.patch \
+    file://debian/system/core/android-tools-scope-write-macro-to-prevent-conflict-.patch \
     \
 "
 
-- 
2.34.1


