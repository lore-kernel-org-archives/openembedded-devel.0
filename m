Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EECC55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:06:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42528.1785761978156741678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=T1nvBf38;
 spf=pass (domain: est.tech, ip: 40.107.162.19, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I295ddIsNj6MU2f+Q/Wq6Tq9+81uUwHGbdEKNG2fJvVY7+AbBJsoBjiMefk0HR+qhBCIpYStfZrDBc97a0EadsGM4Xdm94b8zPeBSKRqW1EYHyk1kQH1fO+Y6daOL8SaQIHUuLoZQxjJphAbX1x18r6i2Ap1g/uuM54sIwNCZrw9TivMmBxq6Radp/1lIou3jH6oGHZo45Tfibx8NgjvZhISAqqNxRYyQ/B93PhfB1g+B6T4ovmNMD2itIWdWK4JZS4Kt1FKW3KzsFjNAsavO6+8Ay8D4r4S5N+pgdMpJi0oZ9RXByCBcFVaE6RGtkYF+kPLcyK5AIov9xBRri4xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K9Oxc4GQfRNdlyps/mA2Z/DuAylp6/XLoYkKK7eslw=;
 b=ZdGvcmH473mTaiYtwjQs6ZME86vRam4l6f1zE5vqcpy/2AXcnXJ/dr1kYVTKF1kE6ALZe6VMtamMSp3eyitDe2TC2GUxNanxeeAtdFzvGm2833hSMDVscuy1yQiGWUfPbYK9h0GNIThRP8+ItPjsLRqfs0+AXwnfKkNBg1Nk9XpuUMKHrLNHd/4wJY9heLap9YUcWqOrlXJEjuxXGXe78rQdqW0JQvrf+qcxOZu3lJ6BaFQareWZezi6SHNmJvOD5SSk+mzQdDY8VO4nzcd/ucy50laNU6oHiJ4TihyQlJ0P2fe5KMPt40zlOn7Cr5eG/WKw9d+yW3luiNcfN5+h8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K9Oxc4GQfRNdlyps/mA2Z/DuAylp6/XLoYkKK7eslw=;
 b=T1nvBf38W8LInJyXfshkbSagrH2BBtt52jEGz0wBjzgSlN4XV3QLbWXsDYzSBOb2IHUFrPnXMzOa5LH4bZGqUU7kpqKL8dfH4bJr8bHJgBH0si5M1OykwPv/VvEw1zEnt0daqjREF2hm1ju340xxpGPE+L77QL1nV10MaGBprttF/OFSCU97hYA2rEXC2XK/SRl6zRuu9ZjZSIxekQKYbCMdPsJRp1wevor4ZzGouiPlAjeNSDsnApBBxTz4XEbJ+4Coa09pnsD4HxDPl/kDCT9hWB8GXsMrC6ZRcWWZIehYCdOpSyQtv/Jzxqw1W82bd+M0sKvXaTT9lj7LVtXpcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2050.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 12:59:37 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:59:37 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 1/4] thrift: fix CVE-2026-55971
Date: Mon,  3 Aug 2026 14:59:19 +0200
Message-ID: <20260803125927.831690-2-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
References: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2050:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ab4128-e0b7-4c15-caa9-08def15f1199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|12006099003|22082099003|18002099003|20052099010|11063799006|3023799007|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lU6M/CHf5AryhXFPrqvzho5+osTlvgsZLRfkrs1RmT3qSxzMyq6W0TJ7ozWOkpuGDAJib6/L4CEEL8vShW3TYqgq8oL7kSEAMcGw76u15QeGymxbRts7WWIyVnTs9wjnzj9Xhl7dXHnL+ERVLp/AOg+2xgrkfffP1O6klnQh40Sp7HA+IQk7Zpt9lPAQdMgkiu9UtykC1ioWPrZr0YSh2xua44QUqGfFBJKY6K8QAlfjcD4CTq2ZP35x/CvR0/oXbbX32fuFN+NhqsmW13qJRPNhVmneYAdszuu97zIFy7FfrpduvE5CvL7w6diMbUsKgK5XqaXxap3jpHLO2e3AJlxw7BQzBZkEgyJqWpq1Ner9mEwZqRlUlaJxZcvH2hOqCZnZ5me5b5+QuI6kdwMs6AGQHoH3OzrcFFYcORmCUFaPHFrO4GN3uHveVH6CAhKEo1rdUexTykkCpYu0NUC1DK7ZOSK8b41dpmnDTBCcpEt0DatNkefEBIJgHTpiSZwXI7a8zuKI3LcxpubkAB9y3oveA3+dToqLAJamz5a2vk66uYJ0I/yJaJ/DChFOv+DJi9ZIbqG0ecGeuFFaw16w6CZUgC7LTdx8VxoXb+O5NCsZbf0XwCnKvjoGpJVUOG4aPdvuve9jCSoxIjyL6bdWZiA+jI+hDnKnKTaI46rpD4E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(12006099003)(22082099003)(18002099003)(20052099010)(11063799006)(3023799007)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1N3aXWVsqIMwZuNKn/9voGCwvLfvxiAwViPofz1TVOcC4gPHzWP2XZZaP9eH?=
 =?us-ascii?Q?zHLOtngZ5B/ZuiVLB8kg/GF7c7Y9sJFXN9I77gljWLb5GkVoxkVVMFJvxbsW?=
 =?us-ascii?Q?QhwAGsgYxuhkb+gJvizYTmIVNRwCF3qOetWtbHDsaiM0IpNHnhzSIHV9ltuA?=
 =?us-ascii?Q?N1vSvilVl8kV2kef26FM0dElavMwOmWEcG4ZH+uB0CaOdya09+n49xXSC7xj?=
 =?us-ascii?Q?EFBoES4h8OUZWI99eJPJpiwISj1md/XEvseKYk5B8KadUxBRQxObv0lm+cLS?=
 =?us-ascii?Q?SXFg6VajLS2D8wzY0Xon5Zz3gKdq0oCTaWLvMbuXml2Wu+xCI3rQALPEYHyK?=
 =?us-ascii?Q?2QOyTTWOnRuBwZ3XTaJkFpmO29PpsxgiX8tiDOWjc/r9lHzhBCFsNiBc4rMc?=
 =?us-ascii?Q?d14thglWF3DV9r3PzJcA5KuKYGDfmPdJSKxnEFuQvNaraGbGKMqfMNZM5cfq?=
 =?us-ascii?Q?yt/qX3c/pCNra85Fl4gcl97yBKZVAd4KQjIX644T0mmPRzwCbgg294CvQ7q4?=
 =?us-ascii?Q?X6VUcuA9zKhKSrHYxcCPNVIHTbGA9l//gWXoUmtFMb26C4KUZC25YlbfJacj?=
 =?us-ascii?Q?OIAVN4FMS4yrG8I+MLeeUs3qGhkSUTxqGhVPG5cfAxqr3Oib8PWabgYGoDr7?=
 =?us-ascii?Q?x+hcW7wAAEAyGIIpWSklYY61QPqbcx2Wg4eRBt4w1gGpxLqnEazQRHEGuEzt?=
 =?us-ascii?Q?dQPIORzOO8wBNMBcLUngiFqUUVGmXf4njC5/w9mb+HxuwoqLwezDBoGQHVpC?=
 =?us-ascii?Q?sVD+EK/GYxW/avofVkb6IiQ0TnbHyVZitDdnphfHJWz2uQQpEUxhn62vsEY7?=
 =?us-ascii?Q?NbrtfEG+RBypwYs3JwessWryXZHQrePvhhYDkMZmhEAyGULbPxmJX9xJ1cUD?=
 =?us-ascii?Q?w38HuHtcz0+8/+TTjK6lGmGXkL2raaMJcyb9RFhiX9CZ+LzsNQV/gtbKoB7Y?=
 =?us-ascii?Q?eM0ywkQfuvkUI7I7qwyaN8ohbh7LY7nbN44D44nFvT/TyfnikExFazp9vdOm?=
 =?us-ascii?Q?cuMyL7scnIwtTUCN2M37junoJi9dqtv/eo7+lRGnJNdCEzsExNkVbwvkiwwg?=
 =?us-ascii?Q?bS3HdrE+t600LFKdFcv4tmdu4pQTX4XHnACdl6CszUX1dA0OVDWpWb+N1MOA?=
 =?us-ascii?Q?EKrS33RRO6tegL9k3rL+RmdvQsRMgwsbqCcj7wlIuygG6RpdoQ0UQ6YwqzVI?=
 =?us-ascii?Q?/egU9GwsDoWWf/Cq0dkZamA9/v7ahAYicAluNb06+XfbK9tEg/NVFUPdBoha?=
 =?us-ascii?Q?n2coxQd8vYHmvOZAWUTw6VdYnVXHIOEWR0k5gu1e8MpHhfGSSzFgOhjVQvO4?=
 =?us-ascii?Q?KCjX8jLoUsJdv3O1Th8qTMLwzhot+/TOje40ESK/4SYd3TWtNzhVezm/YrHO?=
 =?us-ascii?Q?9y3+uQgbl1IuajHlx/h3HqMhzmtZCQxYKhPTHbXrKXmEA4Q8/8nqbIHPlIbN?=
 =?us-ascii?Q?8qPTeUHEkhpZKef5bfqO1igXDUevWbwPdpks7OiUKOi70dRyPI9sszJcIrlK?=
 =?us-ascii?Q?WnpSLC/kEH9AHnqNcih5927I3Um7u9RC2yqZLSBeM5siJO3Mqu9mAylifpP7?=
 =?us-ascii?Q?lvxBZlS1e1nvhhECX8Iztqr++PdFx3eN27Ajbx5Lg6tHl32uCLVCH1r8Ca5P?=
 =?us-ascii?Q?GnqhNmrvH7H3aQ8PaRYwtpBnoFdNAIE37NNtUHAfeTkfk3VXu0+Ax+toMQ/6?=
 =?us-ascii?Q?p7940a/pKs8AyUJMVHuHA/5qHe/7Go1RbmPpMOBMsn9VIOEbbTz6+X8deoiV?=
 =?us-ascii?Q?u9a5C3uAydh3DjgizOQmE3Z0wQEz1IGVW608cYPFilym9/6NL0es?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ab4128-e0b7-4c15-caa9-08def15f1199
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:59:36.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/zewdlhljGA7BUnWi2WoaqgFnIlqmPCp7F2JL0sXvY5zoerZVHaPL9YJ2qvYfswLQUjl02jn5rhK8QSiUX/qn56o/dqX+fM1CVtzY8vnD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 13:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128685

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-55971.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55971

Upstream fix:
  https://github.com/apache/thrift/commit/db4a473f3a984eee27273256fe737be5d=
d175595

Testing:
  The backported fix ships with a C++ Boost regression test,
  test_theadertransport_zlib_roundtrip, in
  lib/cpp/test/ThrifttReadCheckTests.cpp. The recipe builds with
  -DBUILD_TESTING=3DOFF, so the C++ test suite is not compiled during a
  normal build. To verify the fix, the suite was built with
  BUILD_TESTING=3DON (using the native thrift compiler for codegen via
  THRIFT_COMPILER) and the resulting UnitTests binary was executed
  against the target sysroot for MACHINE=3Dqemux86-64.

  Result: test_theadertransport_zlib_roundtrip passed. Full C++ UnitTests
  suite: 79 of 80 test cases passed, 107659 of 107660 assertions passed.
  The single failure (ToStringTest/locale_de_DE_floating_point_to_string)
  is unrelated to this fix and is caused by the de_DE locale not being
  present in the minimal test sysroot.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-55971.patch        | 92 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
71.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
new file mode 100644
index 0000000000..e13b6464e0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
@@ -0,0 +1,92 @@
+From e5f8281298e4809d57143ed52933487fa90f20e0 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Wed, 17 Jun 2026 23:27:46 +0200
+Subject: [PATCH] Read the zlib transform result directly in THeaderTranspo=
rt
+ untransform Client: cpp
+
+The zlib read path decompressed the frame into the transform buffer and th=
en copied the result back into the receive buffer. Swap the transform buffe=
r in as the receive buffer and read the result directly instead of copying =
it.
+
+Adds a write/read round-trip test through the zlib transform.
+
+Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
+
+Backport notes:
+  - lib/cpp/src/thrift/transport/THeaderTransport.cpp: taken unchanged
+    from upstream.
+  - lib/cpp/test/ThrifttReadCheckTests.cpp: kept only the new
+    test_theadertransport_zlib_roundtrip test. The upstream
+    test_theadertransport_header_size_exceeds_frame test was dropped
+    because it depends on THRIFT-5854, which is not in 0.22.0. Added the
+    #include <thrift/transport/THeaderTransport.h> that the new test
+    needs (added upstream by THRIFT-5854).
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-55971
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/db4a473=
f3a984eee27273256fe737be5dd175595]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../src/thrift/transport/THeaderTransport.cpp |  8 ++++++-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 24 +++++++++++++++++++
+ 2 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/s=
rc/thrift/transport/THeaderTransport.cpp
+index b3b833389..117c8edd5 100644
+--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+@@ -298,7 +298,13 @@ void THeaderTransport::untransform(uint8_t* ptr, uint=
32_t sz) {
+                                     "Error while zlib deflateEnd");
+       }
+=20
+-      memcpy(ptr, tBuf_.get(), sz);
++      // The result now lives in tBuf_ and is typically larger than the s=
ource
++      // section it was read from, so it does not fit back into the recei=
ve
++      // buffer at ptr.  Swap the transform buffer in as the receive buff=
er and
++      // continue from its start instead of copying the result back in pl=
ace.
++      rBuf_.swap(tBuf_);
++      std::swap(rBufSize_, tBufSize_);
++      ptr =3D rBuf_.get();
+     } else {
+       throw TApplicationException(TApplicationException::MISSING_RESULT, =
"Unknown transform");
+     }
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/Thriftt=
ReadCheckTests.cpp
+index 09dffe228..963286100 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -31,6 +31,7 @@
+ #include <memory>
+ #include <thrift/transport/TTransportUtils.h>
+ #include <thrift/transport/TBufferTransports.h>
++#include <thrift/transport/THeaderTransport.h>
+ #include <thrift/transport/TSimpleFileTransport.h>
+ #include <thrift/transport/TFileTransport.h>
+ #include <thrift/protocol/TEnum.h>
+@@ -269,4 +270,27 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_ch=
eck_exception) {
+   protocol->readMapEnd();
+ }
+=20
++BOOST_AUTO_TEST_CASE(test_theadertransport_zlib_roundtrip) {
++  using apache::thrift::transport::THeaderTransport;
++  // A run of identical bytes compresses to far fewer bytes than it occup=
ies
++  // once expanded again, so the result of the zlib transform is much lar=
ger
++  // than the frame section it is read from.  This drives the full write/=
read
++  // round trip through the zlib transform path.  Keep the payload small =
enough
++  // to stay within the transform buffer the reader sizes from its write =
buffer.
++  const std::size_t N =3D 700;
++  std::vector<uint8_t> payload(N, 0x42);
++
++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer());
++  std::shared_ptr<THeaderTransport> writer(new THeaderTransport(buffer));
++  writer->setTransform(THeaderTransport::ZLIB_TRANSFORM);
++  writer->write(payload.data(), static_cast<uint32_t>(payload.size()));
++  writer->flush();
++
++  std::shared_ptr<THeaderTransport> reader(new THeaderTransport(buffer));
++  std::vector<uint8_t> out(N, 0x00);
++  reader->readAll(out.data(), static_cast<uint32_t>(out.size()));
++
++  BOOST_CHECK(out =3D=3D payload);
++}
++
+ BOOST_AUTO_TEST_SUITE_END()
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index 8d885dadc4..26849da0c8 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://0001-support-reproducible-builds.patch \
            file://CVE-2026-43868.patch \
            file://CVE-2026-43870.patch \
+           file://CVE-2026-55971.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

