Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C324C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 07:49:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29640.1788766964563572350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 00:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wuUbCaGv;
 spf=pass (domain: est.tech, ip: 52.101.69.65, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDqWLkn8qlakTr8coKR9rROQF5dT76XyJJfyqLxx3gt3pOIrp+0IqERakNd2+HxGawoa1eg6sxl6U/LXi2nAxX95mwZDotnGTw/qz6m3t0PnHo2BeZc8Wl/Fgfdlk9CIG3kM7u9zVyDPv5HI7/3F9uEWbmeCzugeonTthZexzwFFD6+ZgIEktXqIECxG4egHdQmSLuRu7pRowijHsoCsNzKHw7RdAGWQOk36DRVzEB18OGjNZbjKQo3hKgj5zAnf1ZE2qgTlioFOADK2sf1XwJbsBu+/sh2/ANVXLDl7xE2hMNCqqffIeIpPb8YWPrH8Zyp5rAiZB9Rg4Bua7+D5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6/aFX1ntZQzd7HFCEXuSSqH5l3BHA2iSZusyHM0GIE=;
 b=yQ/oiFXEYB7fkdAGpHNTvbZ+aDYVCXNakkmwHoc3QyR2bv/j5o8DGX6eLF8CXfDYMurqQMDa83GaWz4yzt+cphN7JyAxTtLuIrCiSFgZ9LaLuNmOl/hbtkQztEt42gQAr/fjulqEb4Daw0+etiC+vRwqkTbv1Bu90lqGk4NzL8yuQ46K1nZhWVrczbaHwZR6QhcUMOlYj/LIbAGyIbIc6vq1HpIYrEPueQLZVBDlaR85vXQvAfnq2tVkjT+t13UFfpW4QKTCx0UY6PJ6BHw2FS/Id21Z/xFvaYwU+/NWwBgcGpNKC0Y1/M/KU/OTo4qD4VI74t2isWXwd1cJyV+dSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6/aFX1ntZQzd7HFCEXuSSqH5l3BHA2iSZusyHM0GIE=;
 b=wuUbCaGvDspgE8MozQHSOpv3UJQuObxfI3WukXpsikXUg3AJVIxAP6s/uRiWB2nXnOGz9ldO6OWAgcMBv49HDNRU8PXy586rqV0VrdDSW1RRBVNC/rngtjcOgqcryIVh7bUEbp3HVXfKwjZQbvntKdX97yepOI91Tcdq09O3mckmZUeUjqj4UnditoPsAULBAn/liD62xuVWkNW7v9/cg+kKHkATiD5uSd/vPJP6+wcvtXyX0EFqRnQnl3BfEbDGYbu57lGl4cKOCpwU35xQlhAX7L0nRCh+FV5CG8DX4a6jaKPP3MN820rnpX73K55s5Mqa1oGPPayVI/OGnc2JlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3558.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:42:36 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:42:35 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 1/4] thrift: fix CVE-2026-41608
Date: Mon,  7 Sep 2026 09:42:17 +0200
Message-ID: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0204.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3558:EE_
X-MS-Office365-Filtering-Correlation-Id: e24ead26-56b0-4528-6222-08df0cb39590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|10067099003|3023799007|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	m67M2DrdM4jDHcbKFtvKWEphYU/zjOu5b+jxTffN7asnzEVVh1r0GdPNSirXaMP0sG1W3THyWfL2rNAOPwT4Y5x+c14WnYGZYq/gqU5AS3c9kODZcjYRCqX6WBdHt9xzxc7RwwznQEvTPw2NLOdp3mHp2oEPnV4x7aZ9TihMjMPABgQv4w6Xzm1ZUQqcBqfE19Byqgpfm4ELsxf63M1LWuA0cbaCJ8Q1mylIaxN32RduKfliR8OU9B71UikxGmh6/T954ggTrmVbV8oTcw3eN41Adk8adbnd6Eopr3MlXDSJoPQ/h6rguipP2l007GGz9Bz7H6WFKdixY7LpygeGII+owF8Zt69y9YmKoc+OH0K5lVYqHj5cKM7CVQkmSLX826HhYyX2XjGbcaeFSVIiCfhtfB34QOWEpwKYRTY87BOGnGHz7ailEOPe1RnJ9nmx52jRu2oMEz7/MI5vJbcxHZNdDF4+XLUDFYJxni9bPfIoyMbHq9Wj/QJTpigjEUN6K168P0UK45BKXjugRYsTzdIM+TIjRBOrsUtpbqPxCaoxRDc1K3QdAXD1mYdiekSD8wnMVMKNhIeMK4A9JR1j7R1ayMNP8jHSxbCuj473lNi0V8W6SusH+eMuEI7yQJODjyTWS0lyfHXHguf1LQ5/utLpUomN+h8q72HpPfCFd6s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tigmV3MmUgreD752R7QJ1/cdP4GST/egiJkmhHb8n92tUkhMwS4JG+TI9Qxo?=
 =?us-ascii?Q?aKQnk0TxU5TioROYtFFLxVoNOCl2LQEidnDWVQF5NkJcIn5y/kg5HhDvgVN4?=
 =?us-ascii?Q?CA7CEs+MIFlSAwISpCjESXP0RoIcvxgFnPvrJw+mxLsFNn0SRki61vZdFsUl?=
 =?us-ascii?Q?pGFLa0RtZL0iCLYI25EN8UXwTpxkm65/9mebLYiN5GmZHAgNBdZciHftxVxs?=
 =?us-ascii?Q?CcXK1W0dvO1zqCOKHUdVMPym+UTNDfQIS0ftN4248uU6KF0ndMJlOz6cjpdE?=
 =?us-ascii?Q?3TN2sI9wiOR+msOiX3BjTU/ZJ1UpnvJTG6ajGIv1zTaeQ4lPyeR+FpbUhMKr?=
 =?us-ascii?Q?0HhhjTMkaRbintaBS1Ou5/jjo7oguBHyurgjCfIKkUN2uZq/KDQ2NMBLph8c?=
 =?us-ascii?Q?EbNos1QI6LhxY06HhmuV4CXx0MDHrdN0N1z8ufWxaFZ44w3z1VBHTkylQu9T?=
 =?us-ascii?Q?TQLmRia5quzyvaFyjSFcjpG5BTJT50hQqVy/pr032/8MMvj8ILSJjEz8sSk9?=
 =?us-ascii?Q?tUO6/faIHsgdxK84Zdj3ksJKhPSp/eVIqW51ErSQAnOTbrQMxH8DI09tXkN+?=
 =?us-ascii?Q?tXdOJrIMW+hT9hqdITMEtbBh1bJ+lpDGubwcCSVaoFQ0CwaQFQZf/YnR6h4b?=
 =?us-ascii?Q?jIfZa0FswlQ4v1xEq4r0dGk8wholtoMcPwJz7wDDm+zO+ZlniA8zt0ZhnlrI?=
 =?us-ascii?Q?LhH577buLHs7t2c8sVvbf02FsP/WjaPJQDsfNZllfTI2VgUzkXX7mU1g7fHb?=
 =?us-ascii?Q?5nMz+yX/91fcS57e98bC0s38dez4b3+GzxfNvQKNse7UeNAWvO0SIsdA5lly?=
 =?us-ascii?Q?LoTDOjryNaLzkqTjIxIyNAbSEN6gp/USeWBloy0Ypn1evGvm1b1GqaCFp80Q?=
 =?us-ascii?Q?/Df3qom6+mZJd5l6MdFLsj/Tb8Y5TUJSU2A1Q5wIHbqU5hSUjSZ4M7cOFqf8?=
 =?us-ascii?Q?GpCwp/dO6JNsSHcwntx7o30XXYsuENVwu0At2lbeT5UoWb4gXb9J/J6VGHD+?=
 =?us-ascii?Q?hDLJCW1fT9oHxoDZZeXoLypzTM98d28KiWR6fGhYD8yNuHYURAmft8FYhqsa?=
 =?us-ascii?Q?Pkmf3HWrz8pZkilqu7vAOPFZvCF279h6IlDw5FbzW3XcwCGSma5HRZfVGSE3?=
 =?us-ascii?Q?uY+b8jTemyLEY7oyDsgnBkp08DjznqHlzDFFig+xDjMcAoZBA2u1nCBIMbM1?=
 =?us-ascii?Q?KGu9TazwwG2xOr64paJpZMUZV/S/TRGLAJo7dG4sTNwVNBg0t4ghRaMty0EH?=
 =?us-ascii?Q?BhyyhTR1fxSUJJ31GyQ3PRi9QDCKixik+BhHG+GEQlbSc49vEjIw5MtywdsQ?=
 =?us-ascii?Q?cBSpH3kj3dYDkSrVL4EQGtpCUGIwUtRiIp4HBmCDOJSQ2eQU8qDyZ4vX51jO?=
 =?us-ascii?Q?vHDcNxNioFHZ+mbWQDJ+IaGuPCNHlCWBfOF8aSdfRr3lcHuDLBFlJE0YY4Zp?=
 =?us-ascii?Q?1xJZxfum2WBeayEzR95zOTA5rt1c8uvhTuZ03jlmzFmrbNjo/E+jK/ePTS2j?=
 =?us-ascii?Q?gH/opOTu9Ga3iOIaWnVzX18rQM/kJo3oMee1X3K0rx4KrSBbiOJACvNi5NSC?=
 =?us-ascii?Q?v8UFFINaxh5vBdKh5PaUwsA5K6KMFyUc4Fs+6QaFDYggho7yobjIrv762OEg?=
 =?us-ascii?Q?WnzH9Rr16EVch/JqXeeoLnHrIA5JpJvPR0uK+9xHDmTzb7xia2JAgOtfJNWm?=
 =?us-ascii?Q?5lJ1j5qYFoDzfpzAFvcO542YhtXeysNW6Ng0Nu8bGw0CoF5JLKQIQLKhDIXz?=
 =?us-ascii?Q?246+Qh9xIlPakw0bxNMnhvcCbR3/Nqd92uJq/qeK1x6ZsIhH/zChOrXImIol?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	Ow/fUJ7/JO3tpIUXLQl1md4YLtn2JI0WxzyyecBiz8LaZ4e2iYzyhjwt
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e24ead26-56b0-4528-6222-08df0cb39590
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:42:35.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5gLTtJLUs16kRcEbBzx1FgXTJjIgSM9Z+490+oPzBHRajnaxva4bQfeBgstdbHuIBOfZM7VPPiXD0zCXshZAzWnsJ03DYfrBY36EXyLIbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3558
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 07:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129806

Backport patch to fix CVE-2026-41608.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-41608

Upstream fix:
  https://github.com/apache/thrift/commit/8c605880ea4ef050a689c859de3b702ad=
8d4ce7b

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-41608.patch        | 176 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-416=
08.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-41608.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-41608.patch
new file mode 100644
index 0000000000..a65f0ac73b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-41608.patch
@@ -0,0 +1,176 @@
+From d6ef4cd811666ce8c72dd5417d95debce52f490b Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Sun, 19 Apr 2026 10:10:35 +0200
+Subject: [PATCH] Add decompressed payload size limit to Python
+ THeaderTransport Client: py
+
+Adds _max_decompressed_size (default: HARD_MAX_FRAME_SIZE) and
+set_max_decompressed_size() to THeaderTransport. ZLIB decompression
+now uses decompressobj with a size cap instead of unbounded
+zlib.decompress(), consistent with the C++ implementation.
+
+Refactor THeaderTransport read-transform dispatch into _apply_read_transfo=
rm
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-41608
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/8c60588=
0ea4ef050a689c859de3b702ad8d4ce7b]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/py/src/transport/THeaderTransport.py | 26 +++++++---
+ lib/py/test/thrift_transport.py          | 65 ++++++++++++++++++++++++
+ 2 files changed, 85 insertions(+), 6 deletions(-)
+
+diff --git a/lib/py/src/transport/THeaderTransport.py b/lib/py/src/transpo=
rt/THeaderTransport.py
+index 4fb203430..51bc43cf7 100644
+--- a/lib/py/src/transport/THeaderTransport.py
++++ b/lib/py/src/transport/THeaderTransport.py
+@@ -60,9 +60,7 @@ class THeaderTransformID(object):
+     ZLIB =3D 0x01
+=20
+=20
+-READ_TRANSFORMS_BY_ID =3D {
+-    THeaderTransformID.ZLIB: zlib.decompress,
+-}
++KNOWN_READ_TRANSFORM_IDS =3D frozenset({THeaderTransformID.ZLIB})
+=20
+=20
+ WRITE_TRANSFORMS_BY_ID =3D {
+@@ -102,6 +100,7 @@ class THeaderTransport(TTransportBase, CReadableTransp=
ort):
+         self.sequence_id =3D 0
+         self._protocol_id =3D default_protocol
+         self._max_frame_size =3D HARD_MAX_FRAME_SIZE
++        self._max_decompressed_size =3D HARD_MAX_FRAME_SIZE
+=20
+     def isOpen(self):
+         return self._transport.isOpen()
+@@ -135,6 +134,22 @@ class THeaderTransport(TTransportBase, CReadableTrans=
port):
+             raise ValueError("maximum frame size should be < %d and > 0" =
% HARD_MAX_FRAME_SIZE)
+         self._max_frame_size =3D size
+=20
++    def set_max_decompressed_size(self, size):
++        if not 0 < size <=3D HARD_MAX_FRAME_SIZE:
++            raise ValueError("maximum decompressed size should be <=3D %d=
 and > 0" % HARD_MAX_FRAME_SIZE)
++        self._max_decompressed_size =3D size
++
++    def _apply_read_transform(self, transform_id, payload):
++        if transform_id =3D=3D THeaderTransformID.ZLIB:
++            decompressor =3D zlib.decompressobj()
++            payload =3D decompressor.decompress(payload, self._max_decomp=
ressed_size)
++            if decompressor.unconsumed_tail:
++                raise TTransportException(
++                    TTransportException.SIZE_LIMIT,
++                    "Decompressed payload exceeds maximum allowed size.",
++                )
++        return payload
++
+     @property
+     def protocol_id(self):
+         if self._client_type =3D=3D THeaderClientType.HEADERS:
+@@ -250,7 +265,7 @@ class THeaderTransport(TTransportBase, CReadableTransp=
ort):
+         transform_count =3D readVarint(buffer_transport)
+         for _ in range(transform_count):
+             transform_id =3D readVarint(buffer_transport)
+-            if transform_id not in READ_TRANSFORMS_BY_ID:
++            if transform_id not in KNOWN_READ_TRANSFORM_IDS:
+                 raise TApplicationException(
+                     TApplicationException.INVALID_TRANSFORM,
+                     "Unknown transform: %d" % transform_id,
+@@ -276,8 +291,7 @@ class THeaderTransport(TTransportBase, CReadableTransp=
ort):
+=20
+         payload =3D buffer.read()
+         for transform_id in transforms:
+-            transform_fn =3D READ_TRANSFORMS_BY_ID[transform_id]
+-            payload =3D transform_fn(payload)
++            payload =3D self._apply_read_transform(transform_id, payload)
+         return BytesIO(payload)
+=20
+     def write(self, buf):
+diff --git a/lib/py/test/thrift_transport.py b/lib/py/test/thrift_transpor=
t.py
+index cb1bb0ce7..cb0d815cb 100644
+--- a/lib/py/test/thrift_transport.py
++++ b/lib/py/test/thrift_transport.py
+@@ -17,11 +17,17 @@
+ # under the License.
+ #
+=20
++import struct
+ import unittest
++import zlib
+ import os
+=20
+ import _import_local_thrift  # noqa
+ from thrift.transport import TTransport
++from thrift.transport.THeaderTransport import (
++    THeaderTransport, THeaderClientType, THeaderTransformID, HEADER_MAGIC=
,
++)
++from thrift.transport.TTransport import TTransportException
+=20
+=20
+ class TestTFileObjectTransport(unittest.TestCase):
+@@ -66,5 +72,64 @@ class TestMemoryBuffer(unittest.TestCase):
+         buffer_r.close()
+=20
+=20
++def _craft_zlib_header_frame(plain_payload):
++    """Return a complete THeaderTransport frame with a ZLIB-compressed pa=
yload."""
++    compressed =3D zlib.compress(plain_payload)
++    # proto_id=3D0, 1 transform; values <128 encode as single varint byte=
s
++    hdr_content =3D bytes([0, 1, THeaderTransformID.ZLIB])
++    padding =3D (4 - len(hdr_content) % 4) % 4
++    hdr_bytes =3D hdr_content + b'\x00' * padding
++    header_len_u16 =3D len(hdr_bytes) // 4
++    # 10 fixed bytes: 2(magic)+2(flags)+4(seqid)+2(hdr_len_u16)
++    frame_size =3D 10 + len(hdr_bytes) + len(compressed)
++    frame =3D struct.pack('!i', frame_size)
++    frame +=3D struct.pack('!H', HEADER_MAGIC)
++    frame +=3D struct.pack('!H', 0)   # flags
++    frame +=3D struct.pack('!i', 0)   # sequence_id
++    frame +=3D struct.pack('!H', header_len_u16)
++    frame +=3D hdr_bytes
++    frame +=3D compressed
++    return frame
++
++
++class TestTHeaderTransportDecompressionLimit(unittest.TestCase):
++
++    def _make_transport(self, payload, max_decompressed_size=3DNone):
++        frame =3D _craft_zlib_header_frame(payload)
++        inner =3D TTransport.TMemoryBuffer(frame)
++        transport =3D THeaderTransport(inner, [THeaderClientType.HEADERS]=
)
++        if max_decompressed_size is not None:
++            transport.set_max_decompressed_size(max_decompressed_size)
++        return transport
++
++    def test_zlib_roundtrip(self):
++        payload =3D b'Hello Thrift! ' * 100
++        t =3D self._make_transport(payload)
++        t.readFrame(1)
++        self.assertEqual(t._read_buffer.read(), payload)
++
++    def test_decompression_bomb_blocked(self):
++        # 10,000 bytes decompressed; limit set to 1,000
++        payload =3D b'A' * 10000
++        t =3D self._make_transport(payload, max_decompressed_size=3D1000)
++        with self.assertRaises(TTransportException) as ctx:
++            t.readFrame(1)
++        self.assertEqual(ctx.exception.type, TTransportException.SIZE_LIM=
IT)
++
++    def test_payload_at_limit_passes(self):
++        payload =3D b'B' * 5000
++        t =3D self._make_transport(payload, max_decompressed_size=3D5000)
++        t.readFrame(1)
++        self.assertEqual(t._read_buffer.read(), payload)
++
++    def test_set_max_decompressed_size_rejects_invalid(self):
++        inner =3D TTransport.TMemoryBuffer(b'')
++        t =3D THeaderTransport(inner, [THeaderClientType.HEADERS])
++        with self.assertRaises(ValueError):
++            t.set_max_decompressed_size(0)
++        with self.assertRaises(ValueError):
++            t.set_max_decompressed_size(-1)
++
++
+ if __name__ =3D=3D '__main__':
+     unittest.main()
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index 0128de8519..b5dee9bd00 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-58023.patch \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
+           file://CVE-2026-41608.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

