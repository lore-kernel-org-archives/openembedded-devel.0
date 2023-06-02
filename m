Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29104C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:48:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8084.1685695716390372679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q1Pu7l8s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55178882b4=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3526gW7u018329
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jun 2023 01:48:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=XVJJoiRqhMIevOBX8Pa44E/zYB7+wr52Q0pogrS3z+4=;
 b=q1Pu7l8skn+T6hln0HXrMMKb6htvY49n75ntQzEhE17GMMwg0hQj6Hq+oZ6ybRJHrXHh
 eM3lDdk1OBCMuyRmbJgeZd2p7S27guK6PvVKj3/TOGRMxRlUnTRSdiDgWvCdjo1WEBh8
 hJ/lUDlYIOMYrHs7wbkhteyVNjoyd6PKpUxyy9w86DpsngoBRJkoHrLQM8ATvlDJC4Jg
 skOoAIQ8RsE9WaS8axojVlYfcZT1dJEnRt622HWRcVVj0mgOAuNMvM0XlOY9iBJp6Seq
 jLHs5/8RnFvQ5cKVmy0UI4NYeCLsYf5exYUftVP0jQMwDAFXsqY3dXw8WvqgR2cwzlAl zQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53dm0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 01:48:35 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 01:48:33 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2023-23517, CVE-2023-23518
Date: Fri, 2 Jun 2023 08:48:13 +0000
Message-ID: <20230602084813.270697-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: hMGph4TTBDXmkb0CmeClgRDPUEq_JF-b
X-Proofpoint-ORIG-GUID: hMGph4TTBDXmkb0CmeClgRDPUEq_JF-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_06,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=990 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103096

The issue was addressed with improved memory handling.
This issue is fixed in macOS Ventura 13.2, macOS Monterey 12.6.3, tvOS 16.3, Safari 16.3, watchOS 9.3, iOS 16.3 and iPadOS 16.3, macOS Big Sur 11.7.3.
Processing maliciously crafted web content may lead to arbitrary code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-23517
https://support.apple.com/en-us/HT213638
https://bugs.webkit.org/show_bug.cgi?id=248268
https://github.com/WebKit/WebKit/pull/6756

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../CVE-2023-23517-CVE-2023-23518.patch       | 131 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patch
new file mode 100644
index 0000000000..f4116f55cd
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23517-CVE-2023-23518.patch
@@ -0,0 +1,131 @@
+From f44648f07471b6c34f61993baa8997f7519a18a1 Mon Sep 17 00:00:00 2001
+From: Youenn Fablet <youennf@gmail.com>
+Date: Mon, 28 Nov 2022 00:43:35 -0800
+Subject: [PATCH] Type getter is not needed for internal ReadableStream sources
+ https://bugs.webkit.org/show_bug.cgi?id=248268 rdar://102338913
+
+Reviewed by Eric Carlson.
+
+Make ReadableStreamSource method privates.
+In ReadableStream, use @getters instead of private getters to allow getting private values from prototype.
+Covered by added test.
+
+* LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt: Added.
+* LayoutTests/http/wpt/fetch/fetch-stream-source.html: Added.
+* Source/WebCore/Modules/streams/ReadableStream.js:
+(initializeReadableStream):
+* Source/WebCore/Modules/streams/ReadableStreamSource.idl:
+* Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h:
+(WebCore::IDLOperationReturningPromise::call):
+
+Canonical link: https://commits.webkit.org/257063@main
+
+CVE: CVE-2023-23517 CVE-2023-23518
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/f44648f07471b6c34f61993baa8997f7519a18a1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../fetch/fetch-stream-source-expected.txt    |  3 +++
+ .../http/wpt/fetch/fetch-stream-source.html   | 24 +++++++++++++++++++
+ .../WebCore/Modules/streams/ReadableStream.js |  4 ++--
+ .../Modules/streams/ReadableStreamSource.idl  |  8 +++----
+ .../js/JSDOMOperationReturningPromise.h       |  4 +++-
+ 5 files changed, 36 insertions(+), 7 deletions(-)
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
+ create mode 100644 LayoutTests/http/wpt/fetch/fetch-stream-source.html
+
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
+new file mode 100644
+index 000000000000..856ea8180ca2
+--- /dev/null
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source-expected.txt
+@@ -0,0 +1,3 @@
++
++PASS Only JS streams should check type
++
+diff --git a/LayoutTests/http/wpt/fetch/fetch-stream-source.html b/LayoutTests/http/wpt/fetch/fetch-stream-source.html
+new file mode 100644
+index 000000000000..fbebfa5e524f
+--- /dev/null
++++ b/LayoutTests/http/wpt/fetch/fetch-stream-source.html
+@@ -0,0 +1,24 @@
++<!doctype html>
++<html>
++  <head>
++    <meta charset="utf-8">
++    <title>Fetch and source</title>
++    <script src="/resources/testharness.js"></script>
++    <script src="/resources/testharnessreport.js"></script>
++  </head>
++  <body>
++    <script>
++promise_test(async () => {
++    let counter = 0;
++    Object.prototype.__defineGetter__("type", function() {
++        counter++;
++    });
++
++    const response = await fetch('/');
++    const fetchReadableStream = response.body;
++    const [r1, r2] = fetchReadableStream.tee();
++    assert_equals(counter, 0);
++}, "Only JS streams should check type");
++    </script>
++  </body>
++</html>
+diff --git a/Source/WebCore/Modules/streams/ReadableStream.js b/Source/WebCore/Modules/streams/ReadableStream.js
+index ddef56ecd460..7f0def325d84 100644
+--- a/Source/WebCore/Modules/streams/ReadableStream.js
++++ b/Source/WebCore/Modules/streams/ReadableStream.js
+@@ -48,10 +48,10 @@ function initializeReadableStream(underlyingSource, strategy)
+
+     // FIXME: We should introduce https://streams.spec.whatwg.org/#create-readable-stream.
+     // For now, we emulate this with underlyingSource with private properties.
+-    if (@getByIdDirectPrivate(underlyingSource, "pull") !== @undefined) {
++    if (underlyingSource.@pull !== @undefined) {
+         const size = @getByIdDirectPrivate(strategy, "size");
+         const highWaterMark = @getByIdDirectPrivate(strategy, "highWaterMark");
+-        @setupReadableStreamDefaultController(this, underlyingSource, size, highWaterMark !== @undefined ? highWaterMark : 1, @getByIdDirectPrivate(underlyingSource, "start"), @getByIdDirectPrivate(underlyingSource, "pull"), @getByIdDirectPrivate(underlyingSource, "cancel"));
++        @setupReadableStreamDefaultController(this, underlyingSource, size, highWaterMark !== @undefined ? highWaterMark : 1, underlyingSource.@start, underlyingSource.@pull, underlyingSource.@cancel);
+         return this;
+     }
+
+diff --git a/Source/WebCore/Modules/streams/ReadableStreamSource.idl b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
+index cce9ea37ce80..ae7f1403b8ac 100644
+--- a/Source/WebCore/Modules/streams/ReadableStreamSource.idl
++++ b/Source/WebCore/Modules/streams/ReadableStreamSource.idl
+@@ -30,10 +30,10 @@
+     LegacyNoInterfaceObject,
+     SkipVTableValidation
+ ] interface ReadableStreamSource {
+-    [Custom] Promise<undefined> start(ReadableStreamDefaultController controller);
+-    [Custom] Promise<undefined> pull(ReadableStreamDefaultController controller);
+-    undefined cancel(any reason);
++    [Custom, PrivateIdentifier] Promise<undefined> start(ReadableStreamDefaultController controller);
++    [Custom, PrivateIdentifier] Promise<undefined> pull(ReadableStreamDefaultController controller);
++    [PrivateIdentifier] undefined cancel(any reason);
+
+     // Place holder to keep the controller linked to the source.
+-    [CachedAttribute, CustomGetter] readonly attribute any controller;
++    [CachedAttribute, CustomGetter, PrivateIdentifier] readonly attribute any controller;
+ };
+diff --git a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
+index c4d1513ad5c4..1dda9d3834f7 100644
+--- a/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
++++ b/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h
+@@ -43,8 +43,10 @@ public:
+             if constexpr (shouldThrow != CastedThisErrorBehavior::Assert) {
+                 if (UNLIKELY(!thisObject))
+                     return rejectPromiseWithThisTypeError(promise.get(), JSClass::info()->className, operationName);
+-            } else
++            } else {
++                UNUSED_PARAM(operationName);
+                 ASSERT(thisObject);
++            }
+
+             ASSERT_GC_OBJECT_INHERITS(thisObject, JSClass::info());
+
+--
+2.40.0
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..e340c3b19d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2023-23517-CVE-2023-23518.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


