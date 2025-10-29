Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46BCCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:44:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1593.1761718688358133261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 23:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=TJfDUw/C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: sasikuma@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v5KM3764469
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RTM9bIDA6mvJuWDoeQycRfB+wDE+VrYen6l
	FxEDiP04=; b=TJfDUw/CrAlVjEVHk+q4ADJTFPjPbDUtQUW4WmUFKcfHIvOuWzH
	N0ZscNOUFjdJZjmgWbFf5Vk5SUg6FW26tl3M/WRKiGkYl9MGRNEhJ7KptE75f+bL
	j2aK+G78G85+1YiqW+rbvO+O/N6OUoYWDAqJGatbdQA+mhYciY1dpoLcBWvnmPYH
	hHt2B7ajWaP+gQbYA6rrCbd7mnsOmFZbP3grEMJJU7+5XXNrIGZsEtzkNAhhnELT
	O4k+CiMf54mS2S4/g4OEeU2NfrjESeX3oKdkQ3+rTXnQJXwS9IDJ4mC6VSp6lRdT
	5ztorfr8GpyulEw7hKtdKDQzB0OfkRDft2Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11a44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:41:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T5fU6C028450
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:41:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a0qmmmsje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:41:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59T5fU1I028329
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 05:41:30 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sasikuma-hyd.qualcomm.com [10.147.243.253])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59T5fTUf028212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 05:41:30 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4060212)
	id 14B8C5CB; Wed, 29 Oct 2025 11:11:29 +0530 (+0530)
From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
Subject: [meta-oe][PATCH] libunwind: guard unreachable() macro to avoid redefinition with stddef.h
Date: Wed, 29 Oct 2025 11:11:19 +0530
Message-Id: <20251029054119.3334168-1-quic_sasikuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ltVN2_o560RB-uAJ6Pp7rZdr6AuiAene
X-Proofpoint-ORIG-GUID: ltVN2_o560RB-uAJ6Pp7rZdr6AuiAene
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901a90d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=ZkrdLYcGXQqz-2ah4s0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MCBTYWx0ZWRfX7N2Ef0hLr5dy
 GJEfhnL1SCSZ+Xw+WOBFbk1OkckwMYXV4L5A9Q6Sd66+1LU/eNnXePGImMgbZDqKINvMFMGQObo
 DJHIoVTuhU4PQqDOsJsb/pRE62AnX4x7F2xiYQMjstth0k6wYqlqrLUY0BI0GSv1pItg59gYJlU
 OqOcP5uQ5cckcp/6zhSBhveuDTH3UbS3xge5DNZepA51REatheE21YyB2feeYHo4SPEMjQPvtQD
 6FDU85i0+XXTCFbhqgGIn/ee5WoEUqWSwGIR8IdMvZ/L/F8Sfke7xq3O4BgV/ciGPpZYXYrRE/M
 ZmfeA6zHM7WWK2bFFEVJxe3SrjeVMeFXP5oVhlkLD0rIFsgDl5dFc/hxyjavKYVxUeYFdOx0JUC
 WiFaLrQqaEefRv53r8TWxKKQfijSqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290040
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 12:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121148

The build fails due to a macro redefinition conflict for `unreachable()`.
GCC 15.2.0 defines `unreachable()` in `stddef.h`, and `libunwind_i.h` also
defines it based on the presence of `HAVE__BUILTIN_UNREACHABLE`. This causes
a redefinition error when building with `-Werror`.

Added a guard around the `unreachable()` macro definition in `libunwind_i.h`
to ensure it is only defined if not already present.

Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
---
 ...unreachable-macro-to-avoid-redefinit.patch | 42 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
new file mode 100644
index 0000000000..1e0f15ddf0
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch
@@ -0,0 +1,42 @@
+From e64495a109eefaf87235729f4dd79fc9121c16a6 Mon Sep 17 00:00:00 2001
+From: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+Date: Mon, 27 Oct 2025 19:39:05 +0530
+Subject: [PATCH] libunwind: guard unreachable() macro to avoid redefinition
+ with stddef.h
+
+The build fails due to a macro redefinition conflict for `unreachable()`.
+GCC 15.2.0 defines `unreachable()` in `stddef.h`, and `libunwind_i.h` also
+defines it based on the presence of `HAVE__BUILTIN_UNREACHABLE`. This causes
+a redefinition error when building with `-Werror`.
+
+Added a guard around the `unreachable()` macro definition in `libunwind_i.h`
+to ensure it is only defined if not already present.
+
+Upstream-Status: Pending
+
+Signed-off-by: Sasi Kumar Maddineni <quic_sasikuma@quicinc.com>
+---
+ external/libunwind/include/libunwind_i.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/external/libunwind/include/libunwind_i.h b/external/libunwind/include/libunwind_i.h
+index c06912a6..59a462df 100644
+--- a/external/libunwind/include/libunwind_i.h
++++ b/external/libunwind/include/libunwind_i.h
+@@ -88,11 +88,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ # endif
+ #endif
+ 
++#if !defined(unreachable)
+ #if defined(HAVE__BUILTIN_UNREACHABLE)
+ # define unreachable() __builtin_unreachable()
+ #else
+ # define unreachable() do { } while (1)
+ #endif
++#endif
+ 
+ #ifdef DEBUG
+ # define UNW_DEBUG	1
+-- 
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 63e31e90cc..24b6822433 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -21,6 +21,7 @@ SRC_URI += " \
     file://debian/external/libunwind/user_pt_regs.patch \
     file://debian/external/libunwind/legacy_built-in_sync_functions.patch \
     file://debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch \
+    file://debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch \
     \
     file://debian/system/core/move-log-file-to-proper-dir.patch \
     file://debian/system/core/Added-missing-headers.patch \
-- 
2.34.1


