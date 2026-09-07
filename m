Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FAFC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 07:48:51 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29641.1788766965289206888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 00:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=asSbaj6M;
 spf=pass (domain: est.tech, ip: 40.107.130.48, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJJHk8ujk5cB/OvOXB2I6v4DsaWJgfcjKdUoAUB4pnUICBLxbgh7gW4SaFiIJP4feawEMS9qdaLrGdgODvO/R/Ci2lre5BKzeLOx1TA93fR/Q5RQbTcG/FKzjyRlfc8an2pD3b5DsmBZ9wJB9ZM60sEv7CQs3MjyYrCGdfJUBlh7v1OluFJhSyQGwNbnYtKcVW/TO7bM+cG6bO5m4Yg+4sR76kEqexCxpE+OzSDnRO/Z8vc44Rde7jxnJwCLeG7vpJYHk+Hb7wv5WDq9rFKz6ne3rJDv3nwUpOpNhH2SdUb/JnO3oD+FeCFwr6E8CIqs3j0M1taMTlPTSQGLNvsuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgMovgN/+32R2m/filYFqTF2ya3AQPeiYkQpb4xRDuo=;
 b=SyS7dMjQNPsbr/C7ey7V2g+KtKekQyXz6cEQCOc9Sn9Zk9zh/yxgkl0wrCUNl5Quv43yXo3qlpsxZenZUAL8iaN8rYA6ZNS7wJbensNQdY8gX3QcxQU/4E49rXfJ3jiT/IrdmkO2Y5D1/A8nsMHwVWBkUxtwS6WpqkYerToqzSFna03O/QmeeFBHuRupBRhbr+i2VUiPIkCQdOQySjRh/f/u+z44kddkD8/nr30yqWQyc5mYqwsffGBZhDl/Ix2n2gZx6m8tLF9zejxNVB3PCPULB6vDY0rrd3RpEvGHnRWpM8WnjbBVJjQYFvF47KLobyedhghcJTQ794iUqGRhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgMovgN/+32R2m/filYFqTF2ya3AQPeiYkQpb4xRDuo=;
 b=asSbaj6Mia7FfctkW1Dh/ho8DLQExFU2GDUXZKbfbLHCfcaDd+1w11BImw8MF79WCrx0joW1LmUkEFQxMnxtWugDM8QQPmZWOwABZ8iyQcVO2bOKwBHZbb7DZsykGuoDSpbdehha5TFmbieTHzlEim6fHBZtr0nwKKzEQCsjh4V2lyju7X4iQkmLKMF9PohjzXwO+mEYc27ebk0uvfiCEsKWcG1WWXk0BEDoP2RuEaN5V5sWBN+vRlDcLNZt8ROjRaaBVvB6ZmHEABBM2/kf14ZwrBxzdnOJcqs+coixpwGCAOPIPQM4Ww/UsR9/VI6JmS8qYrfLBt4WcOVORjalhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA1P189MB3420.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:42:41 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:42:41 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 4/4] thrift: fix CVE-2026-55970
Date: Mon,  7 Sep 2026 09:42:20 +0200
Message-ID: <20260907074231.388316-4-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
References: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: LO6P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|PA1P189MB3420:EE_
X-MS-Office365-Filtering-Correlation-Id: 658d9fae-9ae3-4e52-295a-08df0cb39899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|13003099007|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	2gL77WL104iR3777GEGh819179kxZujnuF40eNJK3BrebB4gw2PGKTl9ni4nVLQLSaE8gEvL8eo2hyzxDY7HWx0YulmVVE2oHlgqJHzC0LA2iBFPv/mrZo80A0SXYFs24hC0LJM2Eu6HWE/iy0XwQxgYGwy6VZEIK94cor9CrTrykkloySOVnCTFpMz77V7jjb7lhg4Mb2pVgAap/tK7F69XhSXVGRr2+9TjdmS2v3wbeSbVpD1oyOjCu8Km8AVkNTFFZw6+RtTR2JDBR15pMgkMiw/SvQ/SuHW9ZQZMaAuxjK7/bBF9XsIqHMLfcHOzDJl5A66GTku5y2aLw1Gr1k1vQfRPJdtaz81jplzN3ihga60dQJzcEe13ENNLfVwwp2X62AnCVFTyEHAS2BXWpKvPNhp2GwLgcc1uAqvWV1j4cviiGmqX54XbsfBoe7ksk7IPgI5U+tAhdTJoH1hIqrtXJMSXt0mqeNtGEKaeLJJn5CxS31z48MGwY4JO3VX5jT9hCN/sH7wRvGbnPmIR8WyNL7JxLfDJtblqEdmwgIZ5YXp3cZpFCeidj2n1FFHk1ctW2KXAgZIIwMe0qREaBuvBydbVRjokWCo/UGhRCMXHU1HIc+XKegZ3AdYDYgTF1+8gvPhSJMyCCZMOZIzYiAt1+tNUcHD/z1rOU9stHR0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mq0+c4wwHrJ+EY1C4/MJs49FEQc4WzzwSUAJcqwJTAeNp94W4I+FLUwtiEQp?=
 =?us-ascii?Q?kjerz9CMJUjHHLEghX1+GrmaWUu79nLLWaC2d9jVMak2vU5k1ClHSJFGvlEh?=
 =?us-ascii?Q?sx5cok1pjh7aurUQZU1yt8VWHeyiG7ge9mJJofTQgkfYHo9wBH8b90cQm9p1?=
 =?us-ascii?Q?pKPj/yp3muyuheiK404A/OIJkJyC2mMNQqcopH08bNllcDaAkTbRm+pCrAbH?=
 =?us-ascii?Q?eJjNwOwlC6T6IqKCxax8QfQO8ox4dBoplPaeKygs5J9AMV1C7pkNlSv+xgjE?=
 =?us-ascii?Q?is2/cxDCIaKJKwrQHTpOZYWrpp1vViBS62FS1kbBJAUNJJ6Rr064q7g1nTbl?=
 =?us-ascii?Q?mhvSAvI+prmZpPJzU2/QaH5GjUeIPMAdD8RXcwBY44b77vUKjWPtPZHh8vgK?=
 =?us-ascii?Q?n19lQQ9U95Ux+GjGiOnsx/F5Kg4Az8FAIgvgu/dhVK2IgyTfh2nHN5xHDnhd?=
 =?us-ascii?Q?U9VspPds8ItUEUUFBMmvFLLVmFICQuzn5TKCF3JCROvbO9ZdeoB32TE5nf+D?=
 =?us-ascii?Q?XZKF6r/y56F6TauVM1GvFHaV4nMxdEH1mVsvA4wQPExer25Y8y8syVCLzRc2?=
 =?us-ascii?Q?n9bMwBkXH0K0eAhtAgAbAESMgnRwsbRNmdYeTR+KvGzqgw+px1SXcEn6te00?=
 =?us-ascii?Q?WlUpiqdJCZOR8GCI5D8RGHZxNQ7DTuVU+Nv1G7J0Fxt3obE0ziCNY5UQnKk9?=
 =?us-ascii?Q?0VssWcsYrWn/4vV6ERbGORk5O6EbZNDEc3XPMGse5TpwUw1rs7QnY/a2Y/Xk?=
 =?us-ascii?Q?rv9hcRoDVV06uNRv7z2WZhAnWipx1Ai6TynGzsFSv5ZStniTgsBo3mqZyXj8?=
 =?us-ascii?Q?prVdZSv8MElgXmKHz9LLfIfWY8AGXwYSd0mZKMQXQ+354bJNtMjgGZU8FFoe?=
 =?us-ascii?Q?2JxZ/tXJGX51ztC85IVIR8VDOaxt12dQBvT18nMOaMGuwfD5ZOciBxn/nEsn?=
 =?us-ascii?Q?zzmsYRfh6cM45Z7N1aK3OBFFbPzhdtHrggWiugYb+s4FQKJRfHPLt+WT3EbX?=
 =?us-ascii?Q?k+rz/ohAcFv5XonlFB6IfCtCY1ENEIAi2hzFXK2Ub3P6xM6XtvG4Uxvzxcyg?=
 =?us-ascii?Q?lSjhNnOxogeWMMN2mFVvFzazFNEbcGI+G9aaTDGCh3T7koEIdBZXSWtXJVRR?=
 =?us-ascii?Q?3chbDDNZOOFRQjO4dwqWeHzbE4alaxsu3HxjxiEn0p0iTdaFvgZqPmzJhcXO?=
 =?us-ascii?Q?f9x216Z79JDAvnNCCy2MhwMkESVHQiSd4So8YX9mAbNY2U+1XVlLk5gUm76s?=
 =?us-ascii?Q?3COntb4wvjbEbVr0tS84azvKkrG8rkX6ZaJE0D8nZsWx24o+VsnNblddEgLe?=
 =?us-ascii?Q?gJHHEHea2zvak7m9a1tOHysMX5cXx8tvLa24qlcBBFhDTL8atAQawVcrWJdX?=
 =?us-ascii?Q?nLZFNvBSXcRTKMFiMJSFGAVBcRQFygPTYiiHq5dbUdvgp2m+MO/5mnbdk4Zq?=
 =?us-ascii?Q?Rd5ZYGC+EnhVxaLI42qzSp9h4r4vGyOkC3TyWjvTVOXjk2bbn85q8BKq/Nlj?=
 =?us-ascii?Q?YFkqTvh230gCgAWarjkoMfsLby7SYKOIcH3K/tpWMaCn/HEPRrPkKVHua+CX?=
 =?us-ascii?Q?hTui4pi9ftV8ExPwbI3nmSdFWWm1AFShTHNFkeD0C+7E7O2Usuy0QkPflgmq?=
 =?us-ascii?Q?jiV0KteDXkUDR/T3AOQjbI4hu9Odu0+M9s7nAZp8+1kH/QcvBi5mUUhcM89W?=
 =?us-ascii?Q?4FYAvt24tFb4PhiaHAw6dAHrZk8SNwdfqYYR4zBiWm/sgsEjytgxeDeJE0Hp?=
 =?us-ascii?Q?CIpokGwNqUv6ijtxf0B7HlD8yv/94hlLonVu/wcTBCKoVM7uc8smta5x0pDN?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	oddl/PVyKOjxj4l1UNiC/xu4PsCXjaREak7QCMl6l3sPZx4etnsCSf/F
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 658d9fae-9ae3-4e52-295a-08df0cb39899
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:42:41.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79exvga78LXDnrvB/mWsdVhXexVPqhyyNwWHjM2oDmYmrPN+aEosMjmYI3JAWmnIZQyVrjDoSmdEUqDC7rFb/7a1oTvO1/Dtk9sc36ZW2co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3420
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 07:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129805

Backport patch to fix CVE-2026-55970.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-55970

Upstream fix:
  https://github.com/apache/thrift/commit/4da36faeef0b7db4b1dea560b01eb1595=
7335934

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-55970.patch        | 67 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-559=
70.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
new file mode 100644
index 0000000000..02bcc4cc7c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
@@ -0,0 +1,67 @@
+From 0fe80cef02c1d3260d3ce278f072ce7e04788c13 Mon Sep 17 00:00:00 2001
+From: dxbjavid <dxbjavid@gmail.com>
+Date: Sat, 13 Jun 2026 17:39:53 +0530
+Subject: [PATCH] fix off-by-ten header bounds check in readHeaderFormat
+
+Backport note: additive test conflict in ThrifttReadCheckTests.cpp; the 0.=
22.0
+tree already carries test_theadertransport_zlib_roundtrip from CVE-2026-55=
971,
+so both tests were kept.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-55970
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/4da36fa=
eef0b7db4b1dea560b01eb15957335934]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../src/thrift/transport/THeaderTransport.cpp |  5 ++++-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 22 +++++++++++++++++++
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/s=
rc/thrift/transport/THeaderTransport.cpp
+index 117c8edd5..0711a547e 100644
+--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+@@ -206,7 +206,10 @@ void THeaderTransport::readHeaderFormat(uint16_t head=
erSize, uint32_t sz) {
+   }
+   headerSize *=3D 4;
+   const uint8_t* const headerBoundary =3D ptr + headerSize;
+-  if (headerSize > sz) {
++  // ptr already skips the 10-byte common header, so the header section h=
as to
++  // fit in the remaining sz - 10 bytes; comparing against sz alone let t=
he
++  // boundary sit up to 10 bytes past the receive buffer.
++  if (headerSize > sz - 10) {
+     throw TTransportException(TTransportException::CORRUPTED_DATA,
+                               "Header size is larger than frame");
+   }
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/Thriftt=
ReadCheckTests.cpp
+index 72e798bc1..4645a9e14 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -341,4 +341,26 @@ BOOST_AUTO_TEST_CASE(test_theadertransport_zlib_round=
trip) {
+   BOOST_CHECK(out =3D=3D payload);
+ }
+=20
++BOOST_AUTO_TEST_CASE(test_theadertransport_header_size_exceeds_frame) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose declared header size (3 * 4 =3D 12) leaves=
 fewer
++  // than the 10 common-header bytes inside the 14-byte frame. The traili=
ng
++  // varint bytes are all continuation bytes, so the reader used to run o=
ff the
++  // end of the receive buffer.
++  uint8_t frame[] =3D {
++      0x00, 0x00, 0x00, 0x0E, // frame length =3D 14
++      0x0F, 0xFF, 0x00, 0x00, // header magic
++      0x00, 0x00, 0x00, 0x00, // seqId
++      0x00, 0x03,             // header size field (3 -> 12 bytes)
++      0x02,                   // protocol id varint
++      0x00,                   // num transforms =3D 0
++      0x80, 0x80              // info-header varint, all continuation
++  };
++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(f=
rame)));
++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
++}
++
+ BOOST_AUTO_TEST_SUITE_END()
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index d548288458..c926c896d0 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-41608.patch \
            file://CVE-2026-45112.patch \
            file://CVE-2026-55969.patch \
+           file://CVE-2026-55970.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

