Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9928C55838
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44172.1785766647382335015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WTgCHLUR;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq7pQ6fzS9RcjYFruXFCystAHTo+hpi7D34K3GmYBDCU0Vi3nsND3s57c3j8A9CuvL0BUXgBozxp3QHp0uDYdhyD7xMNGfO3dKpy2ak1x2MEoA/nJtN2THuRkxPkyWNZQAL7Mf+C8Cq1yFAGKzt6XCpVFhA5WqZraVvDRzT+oB1vDDoYRzRInJvXb89oywgq8Ljjy4YSebSwJ4EvArRStoaqOBR3yrihfDbf+N3fWVtYIAffHmEzoLKeMzKOp4zIsP9ZaJ+OG8KJYEv/srlJC5wT1j6+2+A/vntVHA3EgDYXpo9DWAVSU3hxn/arUV3n5+5f35JruFNnyxzJZZzD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M58YcnXt0m2hPZBJZZddtpjK/XxZukls1yhSmpGrv9s=;
 b=DaJLK0aoFWnszOWCSUbaeT22sC4IwUZqpKX9VLpiWiiakm5TJhjHtfeTal8eN2m5k6GhCHMFl6axAQ6W0TCW/jZnqwCr/gKQQ42PoQUWm9nOnml8n1P45ppeTjTpKzXpcSNKDrLaqMY6FvwoE7Mz3Tlx98RUOTfabOQCVAKNKcSnFisR5gb9+nw0N/88Lca9C2dp5NZVJEvGb31wOA6ijT6MijqHHs9BqmTZBzvHDWtf35nqdIbGo70ze64PzEwYr7tdyA8jwMi8MtjSL4piX8aweaZ7LCCE3oS8A8AlE9kmOTPgRjXTF5baqZzejCAr1t1hal0onzi3vHhJt/gklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M58YcnXt0m2hPZBJZZddtpjK/XxZukls1yhSmpGrv9s=;
 b=WTgCHLURRI+38BYiaKIVV9/Gjavpd9NSCtnOmTsAfhqZpaNE270c95i9W8+kJXNU3k/9yOkCmr4EVoSUV5xf5ledL9AatNqLsWwWdPUZ8eg4tjz/zLyI1NwdTDvK5rwb6QtJ6nSOwZtfLKxyofDNrJ+FPNQ++sGQ2jW0ZNw17V4MACN6/sP1Vr6cHnNEbedWEOuTkKodijGefb4L+U2pJnuXlLxTVV01yvxH6F6ldqJuNdWOMRwWTUuBS9hPEYlWeYmVGumWh+Fxkn53UBEbN5e4MitoCEBTLvnVQePAHXJ0fV0W4/WEUsx7YT9AodTg+JidC4TOT9XK5iZcLvNSjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB1820.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:344::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 14:17:22 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 14:17:22 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/3] thrift: fix CVE-2026-55971
Date: Mon,  3 Aug 2026 16:17:10 +0200
Message-ID: <20260803141716.853285-2-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
References: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DUZPR01CA0189.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::7) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ce15f5-9077-4bde-9efe-08def169efa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	/f4A9Sm95PA7+VhcsqcLDei/XOuxy288tbkEgpSM+3b+/w0iFlKpKqhcW88Ld/fs/kG1JQLk5JJqfQ1M+l8Xh+dSsxtYZZcSidbXrb28/b8NO43j1vSYJH0jX6UaDR9grbPHNZUPrczFHDemqg+rwf7fumRnpQJQ71oFX+xgpL0MMpVg39ddOz/7/yk8T8dDVH4FhpbvwHZYpCk0ArLATgfPe1glSgCMGaEKXOmDANG4DHB1cYC5MMPnPuu4T4UqtVAHIxZO5vqcLUBBPk3ZUkOcnLTGBZywgFt59CclFOFTwdjHdVKCdpZKCV/wms0tDNkMcYHLW6QwEp7Af9gvv+5mB9HR93cAF8qfiP17TfFh7F7aeX2VfjNJcIkJWwEhPN/JXsLGZCFVwkX1dt26ZWV6qrG2rkEOrZeU8HVmVPhcNSV++RlZcb4l5RmNmCEukzoIcN4o3+4W0sIgyfsateANPIe/zSYApqgv4l06K3JRdW9ab4IL38vN1r/Hm0MWBy7wMcKZhbIxcqhHj1Sn7iUBlx+2MzDToaWfhg+2Cf1aQmaE2bcaahpO5q+tukLnNnP9AEByX57j3WPza9s90+esTdRlT8cDpBv60TV6v97e1K1HUW0Fk1oKJbRgx+MKpcvmZ2o3p1Pq2ggvi/pFKnDoc+9UpZGTWBQob7Wc9xE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OA9sBp7mN10xpJo6RGQ8NylCmZtIXroS8WYIw86W9mwno2ug4yN37TL7ssxi?=
 =?us-ascii?Q?nn9xj4wz0aPggOfgI69ycIVaSMvaEW/pXkO7Hdrv0KfAQHqjQcSc+n/xmg4s?=
 =?us-ascii?Q?srKD16SBWucCeQKphufJ6d29Og3mFytPgpIlAYHUKpjcyEEd4s2zu25DjDXa?=
 =?us-ascii?Q?ESfigFNnnAl3D7rMAUgypr/lQPGP2FwLQCNeKFVUF2WK/B0alebXnxeYX9Qx?=
 =?us-ascii?Q?OxGiGXZofcJaKoSZB/AwmLRMusYQ+QcGAoOECt/q6KJLwt8y6a1NQNXL1ykM?=
 =?us-ascii?Q?5FatCIHhNPO0VSaMoep9u3gbUz7CzfWtKgzgpY76lm+9BQtGpA82w94RsFlm?=
 =?us-ascii?Q?7RwYEe44FHIgWSCgorozA5LdL1xiWGL0ZLq+G1BoNCJXwKtGTJpvXJJ5NHNR?=
 =?us-ascii?Q?SOpA7h22JPkOlSbj/X3IONWjLnCc92edTB4/jmaNLPmBax2JCma3TRf3xfnz?=
 =?us-ascii?Q?DB4bswMrjcLvn8wq/tEcAmIXvcyfNUMbxy4kcaSFXUnqtQDu0VT5KLMolI5R?=
 =?us-ascii?Q?L3VLnSuhqV4UmLlwSIekDqOvLnrnx0YH0Sr62NhwK0tyMNbTc+mLK0a2bt0F?=
 =?us-ascii?Q?cfT5MBftx058j7uIlA+nGXrm2xv9tVRldzQGmNM4JhtO3Et/ZpK/tzfskO9F?=
 =?us-ascii?Q?ytFdCtZpInllGz98y2p2GSw9s9Y7LHi7SAxjV0QCC0Jh6iTqb1Fo8rVkq8Pq?=
 =?us-ascii?Q?bU4DTeGeWAIO6l9QQU/8/Bug81/7P8uDQfO5Amqo6FL+5IlvgayG66qoJ6r9?=
 =?us-ascii?Q?GHttLKz/+DmXyayh6O7jXT3PInpxRIsPxdEVsnScsV5CCY89L9EcmL2LH4w0?=
 =?us-ascii?Q?8IzZLZLDmWwroXBLd8kx3VpLeRQhr9JZhDzeLFOjCWMIvMzYyfiArWrBhLlB?=
 =?us-ascii?Q?u5joZGJ3RFwHext6ksDOy+6UizPe/Z9Hc7zlHoROhQRh78rfEbI4jSkxx9Cd?=
 =?us-ascii?Q?3fjfqurw8AS3c10immc5O/8avV/RysUa6d9TBBZgN2/NC7d60luH/ps7FAzb?=
 =?us-ascii?Q?6kI0eUOI9/n7SZhLTVZ+0bXjHNGS8d1SBeEmrwcVzUX52bVJvReqvEoEUyZg?=
 =?us-ascii?Q?GZV+mTJt2ag0ffBrE+bKLo4x3GtS/qp4CSDfGX4chEpq2qi0THPax8vHDa4k?=
 =?us-ascii?Q?6uYtH18ahuJig71yetaMNs5rkQ+g13Xs0JjwTNhfwQ3ME5E6gVxK29G8+9Pk?=
 =?us-ascii?Q?SbCATBRKXXx3oQna0kNOjVzWi100Hu7pjjw09PmotOgylecaQDogdjFHePK0?=
 =?us-ascii?Q?CPuhGAF8XNs0hMTz7ECEg/uIo2JmhEZKzVCGxu9Es8r3bgtmV9pmbZOvllxp?=
 =?us-ascii?Q?487Pzvne46dkU7CDuQTUfvmHdF2NAsWYYYeomvDK6PDdvwOFG43GivMph8yD?=
 =?us-ascii?Q?Ms663hXvzdgRIrX416cdP95zGOKY0C3/Ra7/yxz8RYgDFyuCAKodQRTCLHPV?=
 =?us-ascii?Q?WeD3DZhkLAj6C7lLLVCwZM4RY55KZuereQGFWTMXL9qfWvCVwYIm42KE52vz?=
 =?us-ascii?Q?3PclUcZXLMVBijlMVrk7V7O1TvQdzDrakg4VbcUGmUflOwLFlqQDBF/Zy1n2?=
 =?us-ascii?Q?gfvTgoG6Ts4GXWcxFjANaWh1oMxcJXooWer1gPUMCInks5r5PR/mxH5esh4s?=
 =?us-ascii?Q?jJY38b/1GI6EeOwJb80X8MImO7vi7f/K61bUAd4KMqkE/84kOVbgocuHYmYQ?=
 =?us-ascii?Q?b7H8S+86s6FJ6p250Wsekn+WsHwhJSUFocLopQQRVA17/Rqrcgj0hW9U4Du0?=
 =?us-ascii?Q?I2du5mDv6Gsg3p2OFx/1EiYAz7XZqAmx/TobYw42BTveL8eoHUGJ?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ce15f5-9077-4bde-9efe-08def169efa5
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:17:22.8477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dop2nRAXdCPnyDnoVryIIDKS3gG4/n7tCXmMz+xieA6gYDOXnMN3Ns5AW5LAI/09lS+cxX6TD+ICyU2UTx1/XPCshujcbMvOFtAf2NnJedI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1820
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 14:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128690

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-55971.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55971

Upstream fix:
  https://github.com/apache/thrift/commit/db4a473f3a984eee27273256fe737be5d=
d175595

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-55971.patch        | 98 +++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
71.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
new file mode 100644
index 0000000000..584352a027
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
@@ -0,0 +1,98 @@
+From 46533058efd34461065e029d9f180a349647db5e Mon Sep 17 00:00:00 2001
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
+Conflicts Resolved:
+
+lib/cpp/test/ThrifttReadCheckTests.cpp (1 conflict):
+- The stable branch lacks the prerequisite THRIFT-5854 commit, so the
+  test_theadertransport_header_size_exceeds_frame test and the
+  THeaderTransport.h include it depends on are not present here. Kept only
+  the new test_theadertransport_zlib_roundtrip test from this fix and adde=
d
+  the missing #include <thrift/transport/THeaderTransport.h> (present in
+  upstream's tree via the THRIFT-5854 prerequisite) since it is required b=
y
+  the new test and is a trivial, self-contained include with no functional
+  code dependency.
+
+Assisted-by: kiro:claude-sonnet-5
+
+Changes from upstream commit db4a473f3a98:
+  - lib/cpp/src/thrift/transport/THeaderTransport.cpp: adapted from upstre=
am
+  - lib/cpp/test/ThrifttReadCheckTests.cpp: adapted from upstream
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
+index eb4ca01b2..2ef6ae0c6 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -38,6 +38,7 @@
+ #include <thrift/protocol/TList.h>
+ #include <thrift/protocol/TSet.h>
+ #include <thrift/protocol/TMap.h>
++#include <thrift/transport/THeaderTransport.h>
+=20
+ BOOST_AUTO_TEST_SUITE(ThriftReadCheckExceptionTest)
+=20
+@@ -224,4 +225,27 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_ch=
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
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index e4fd07198c..23a6debf9a 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-term=
s.patch \
            file://0001-thrift-pr2755.patch \
            file://0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t=
-.patch \
+           file://CVE-2026-55971.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20

