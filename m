Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDAC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:17:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2103.1686028623233292788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RL3SKi+b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35650mn1013602
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jun 2023 22:17:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MpznQVzIuxynWQiXw+RcSeANP3qZpDnmZGaTgGzlGAs=;
 b=RL3SKi+biiIaRPnZDGCHOEs9napuAxbvoVNJDLRi6OWBq5jv1rR5N83u2cjsCijmnwS7
 aHF3N+uDld1nDW7YX/LPwhDGqXqJyo88O4zNb1RKNqUT3VY0hfNcMHindwnnrUSPLnDL
 1UWlnRfvBHOR42AD0z6rQL47XxjGvmnJYvXBsSRAwmiQ7JfOH52vPixT+aEvLhkOtLO1
 +j7J0HyUNGUxPYSFiyztE+AFwpYXeS86XQb1YAVCsCbQK5uaTm93yCB5E9zxyLKDGoxj
 +AVntlQevDkXPCejVlZlCavZ5rfIaXEwZV6STvc9IuHrEYSk3DSJ7BXKb+675JpjweVG zw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9vp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 22:17:02 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 22:16:58 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42856
Date: Tue, 6 Jun 2023 05:16:34 +0000
Message-ID: <20230606051634.303687-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: qh6Q097IS-wEIHeZNbycLGsC1-0HB-s3
X-Proofpoint-GUID: qh6Q097IS-wEIHeZNbycLGsC1-0HB-s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103131

A type confusion issue was addressed with improved state handling. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 15.7.2 and iPadOS 15.7.2, iOS 16.1.2. Processing maliciously crafted web content may lead to arbitrary code execution. Apple is aware of a report that this issue may have been actively exploited against versions of iOS released before iOS 15.1.

References:
https://support.apple.com/en-us/HT213531

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-42856.patch     | 110 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
new file mode 100644
index 0000000000..97d58c955a
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42856.patch
@@ -0,0 +1,110 @@
+From 71cdc1c09ef199db74b2b60ed5de781250d96a56 Mon Sep 17 00:00:00 2001
+From: Mark Lam <mark.lam@apple.com>
+Date: Wed, 23 Nov 2022 13:48:49 -0800
+Subject: [PATCH] The provenType filtering in FTL's speculateRealNumber is
+ incorrect. https://bugs.webkit.org/show_bug.cgi?id=248266
+ <rdar://problem/102531234>
+
+Reviewed by Justin Michaud.
+
+speculateRealNumber does a doubleEqual compare, which filters out double values which
+are not NaN.  NaN values will fall through to the `intCase` block.  In the `intCase` block,
+the isNotInt32() check there was given a proven type that wrongly filters out ~SpecFullDouble.
+
+Consider a scenario where the edge was proven to be { SpecInt32Only, SpecDoubleReal,
+SpecDoublePureNaN }.  SpecFullDouble is defined as SpecDoubleReal | SpecDoubleNaN, and
+SpecDoubleNaN is defined as SpecDoublePureNaN | SpecDoubleImpureNaN.  Hence, the filtering
+of the proven type with ~SpecFullDouble means that isNotInt32() will effectively be given
+a proven type of
+
+    { SpecInt32Only, SpecDoubleReal, SpecDoublePureNaN } - { SpecDoubleReal, SpecDoublePureNaN }
+
+which yields
+
+    { SpecInt32Only }.
+
+As a result, the compiler will think that that isNotIn32() check will always fail.  This
+is not correct if the actual incoming value for that edge is actually a PureNaN.  In this
+case, speculateRealNumber should have OSR exited, but it doesn't because it thinks that
+the isNotInt32() check will always fail and elide the check altogether.
+
+In this patch, we fix this by replacing the ~SpecFullDouble with ~SpecDoubleReal.  We also
+rename the `intCase` block to `intOrNaNCase` to document what it actually handles.
+
+* JSTests/stress/speculate-real-number-in-object-is.js: Added.
+(test.object_is_opt):
+(test):
+* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
+(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq):
+
+Canonical link: https://commits.webkit.org/252432.839@safari-7614-branch
+
+CVE: CVE-2022-42856
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/71cdc1c09ef199db74b2b60ed5de781250d96a56]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../speculate-real-number-in-object-is.js     | 22 +++++++++++++++++++
+ Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp |  8 +++----
+ 2 files changed, 26 insertions(+), 4 deletions(-)
+ create mode 100644 JSTests/stress/speculate-real-number-in-object-is.js
+
+diff --git a/JSTests/stress/speculate-real-number-in-object-is.js b/JSTests/stress/speculate-real-number-in-object-is.js
+new file mode 100644
+index 000000000000..0b10799954da
+--- /dev/null
++++ b/JSTests/stress/speculate-real-number-in-object-is.js
+@@ -0,0 +1,22 @@
++function test() {
++    function object_is_opt(value) {
++        const tmp = {p0: value};
++
++        if (Object.is(value, NaN))
++            return 0;
++
++        return value;
++    }
++
++    object_is_opt(NaN);
++
++    for (let i = 0; i < 0x20000; i++)
++        object_is_opt(1.1);
++
++    return isNaN(object_is_opt(NaN));
++}
++
++resultIsNaN = test();
++if (resultIsNaN)
++    throw "FAILED";
++
+diff --git a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+index 8621b554d578..588298eba350 100644
+--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+@@ -20285,18 +20285,18 @@ IGNORE_CLANG_WARNINGS_END
+         LValue value = lowJSValue(edge, ManualOperandSpeculation);
+         LValue doubleValue = unboxDouble(value);
+
+-        LBasicBlock intCase = m_out.newBlock();
++        LBasicBlock intOrNaNCase = m_out.newBlock();
+         LBasicBlock continuation = m_out.newBlock();
+
+         m_out.branch(
+             m_out.doubleEqual(doubleValue, doubleValue),
+-            usually(continuation), rarely(intCase));
++            usually(continuation), rarely(intOrNaNCase));
+
+-        LBasicBlock lastNext = m_out.appendTo(intCase, continuation);
++        LBasicBlock lastNext = m_out.appendTo(intOrNaNCase, continuation);
+
+         typeCheck(
+             jsValueValue(value), m_node->child1(), SpecBytecodeRealNumber,
+-            isNotInt32(value, provenType(m_node->child1()) & ~SpecFullDouble));
++            isNotInt32(value, provenType(m_node->child1()) & ~SpecDoubleReal));
+         m_out.jump(continuation);
+
+         m_out.appendTo(continuation, lastNext);
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..93dae6039a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-42856.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


