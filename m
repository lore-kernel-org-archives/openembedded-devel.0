Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960F6C48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:37:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6598.1708677441441541414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b0ttdDgg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2783f3eaa2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N6tnuu030727
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=eGlr3ZlyKeN0hu+SC6yUoYbjyMGsqHGwcKn+o59ckoQ=; b=
	b0ttdDggnpgjWBtf4AuJBaoL+ZKRXOBbu4LPepZrmsGRXwYdLnCSz+/sD2Y+h4pU
	58t0kbr/bplKXESpHEhcqpHPURwJLPGOFXNQA/9ZTMyYFYvWkSavzv7ySvXj8omf
	CODZM5s/VygibUE549M/U3U5EJGAuuSo0SoJsbYuiiId6/kJh7YE7NAh51khjnB4
	E/+ml4qFWVn/8wxz5skpVjZfYg+nCYKt4e/mWG9838eHjb2A/xd43oKhSxtJUef0
	OXIgu9vS+Ma0ysDZEhkK1Dnw0jYUof9pZWHNhHyjU8s3ulpX43GNAiKSd6IkdIq/
	TaWQT2T5ydoP65ClXrpHfg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd217ax55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:20 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:37:17 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 3/4] nodejs: fix CVE-2024-22025
Date: Fri, 23 Feb 2024 08:36:19 +0000
Message-ID: <20240223083620.182565-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240223083620.182565-1-archana.polampalli@windriver.com>
References: <20240223083620.182565-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: NRZmmQGjgBBC6l35ZH8QGAmJWGXJStXl
X-Proofpoint-ORIG-GUID: NRZmmQGjgBBC6l35ZH8QGAmJWGXJStXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109006

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-22025.patch        | 148 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.p=
atch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
new file mode 100644
index 000000000..ac3a54aba
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22025.patch
@@ -0,0 +1,148 @@
+From 9052ef43dc2d1b0db340591a9bc9e45a25c01d90 Mon Sep 17 00:00:00 2001
+From: Matteo Collina <hello@matteocollina.com>
+Date: Tue, 6 Feb 2024 16:47:20 +0100
+Subject: [PATCH 4/5] zlib: pause stream if outgoing buffer is full
+
+Signed-off-by: Matteo Collina <hello@matteocollina.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/540
+Reviewed-By: Robert Nagy <ronagy@icloud.com>
+Ref: https://hackerone.com/reports/2284065
+
+CVE-ID: CVE-2024-22025
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/9052ef43d=
c2d1b0d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/zlib.js                            | 32 +++++++++++++++++++-------
+ test/parallel/test-zlib-brotli-16GB.js | 22 ++++++++++++++++++
+ test/parallel/test-zlib-params.js      | 24 +++++++++++--------
+ 3 files changed, 61 insertions(+), 17 deletions(-)
+ create mode 100644 test/parallel/test-zlib-brotli-16GB.js
+
+diff --git a/lib/zlib.js b/lib/zlib.js
+index 9bde199..8e033e5 100644
+--- a/lib/zlib.js
++++ b/lib/zlib.js
+@@ -560,10 +560,11 @@ function processCallback() {
+   self.bytesWritten +=3D inDelta;
+
+   const have =3D handle.availOutBefore - availOutAfter;
++  let streamBufferIsFull =3D false;
+   if (have > 0) {
+     const out =3D self._outBuffer.slice(self._outOffset, self._outOffset =
+ have);
+     self._outOffset +=3D have;
+-    self.push(out);
++    streamBufferIsFull =3D !self.push(out);
+   } else {
+     assert(have =3D=3D=3D 0, 'have should not go down');
+   }
+@@ -588,13 +589,28 @@ function processCallback() {
+     handle.inOff +=3D inDelta;
+     handle.availInBefore =3D availInAfter;
+
+-    this.write(handle.flushFlag,
+-               this.buffer, // in
+-               handle.inOff, // in_off
+-               handle.availInBefore, // in_len
+-               self._outBuffer, // out
+-               self._outOffset, // out_off
+-               self._chunkSize); // out_len
++    if (!streamBufferIsFull) {
++      this.write(handle.flushFlag,
++                 this.buffer, // in
++                 handle.inOff, // in_off
++                 handle.availInBefore, // in_len
++                 self._outBuffer, // out
++                 self._outOffset, // out_off
++                 self._chunkSize); // out_len
++    } else {
++      const oldRead =3D self._read;
++      self._read =3D (n) =3D> {
++        self._read =3D oldRead;
++        this.write(handle.flushFlag,
++                   this.buffer, // in
++                   handle.inOff, // in_off
++                   handle.availInBefore, // in_len
++                   self._outBuffer, // out
++                   self._outOffset, // out_off
++                   self._chunkSize); // out_len
++        self._read(n);
++      };
++    }
+     return;
+   }
+
+diff --git a/test/parallel/test-zlib-brotli-16GB.js b/test/parallel/test-z=
lib-brotli-16GB.js
+new file mode 100644
+index 0000000..1ca10f7
+--- /dev/null
++++ b/test/parallel/test-zlib-brotli-16GB.js
+@@ -0,0 +1,22 @@
++use strict';
++
++const common =3D require('../common');
++const { createBrotliDecompress } =3D require('node:zlib');
++const strictEqual =3D require('node:assert').strictEqual;
++
++// This tiny HEX string is a 16GB file.
++// This test verifies that the stream actually stops.
++/* eslint-disable max-len */
++const content =3D 'cfffff7ff82700e2b14020f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c32200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3f=
ffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074e=
ffff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800=
a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c=
30200ddfb7ffeffffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04=
401c1600e8defff3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff=
82700e2b00040f7fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeff=
ffc33f0110870500baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff=
3ffff1ffe0980382c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7=
fe9ffffffff04f00c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f011087050=
0baf7fffcffff877f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe098038=
2c00d0bdffe7ffff3ffc1300715800a07bffcfffff7ff82700e2b00040f7fe9ffffffff04f0=
0c4610180eefd3fffffffe19f0088c30200ddfb7ffeffffc33f0110870500baf7fffcffff87=
7f02200e0b0074effff9ffff0fff04401c1600e8defff3ffff1ffe0980382c00d0bdffe7fff=
f3ffc1300715800a07bff3f';
++
++const buf =3D Buffer.from(content, 'hex');
++
++const decoder =3D createBrotliDecompress();
++decoder.end(buf);
++
++// We need to wait to verify that the libuv thread pool had time
++// to process the data and the buffer is not empty.
++setTimeout(common.mustCall(() =3D> {
++  // There is only one chunk in the buffer
++  strictEqual(decoder._readableState.buffer.length, 1);
++}), common.platformTimeout(100));
+diff --git a/test/parallel/test-zlib-params.js b/test/parallel/test-zlib-p=
arams.js
+index 30d4f13..18271fe 100644
+--- a/test/parallel/test-zlib-params.js
++++ b/test/parallel/test-zlib-params.js
+@@ -12,23 +12,29 @@ const deflater =3D zlib.createDeflate(opts);
+ const chunk1 =3D file.slice(0, chunkSize);
+ const chunk2 =3D file.slice(chunkSize);
+ const blkhdr =3D Buffer.from([0x00, 0x5a, 0x82, 0xa5, 0x7d]);
+-const expected =3D Buffer.concat([blkhdr, chunk2]);
+-let actual;
++const blkftr =3D Buffer.from('010000ffff7dac3072', 'hex');
++const expected =3D Buffer.concat([blkhdr, chunk2, blkftr]);
++const bufs =3D [];
++
++function read() {
++  let buf;
++  while ((buf =3D deflater.read()) !=3D=3D null) {
++    bufs.push(buf);
++  }
++}
+
+ deflater.write(chunk1, function() {
+   deflater.params(0, zlib.constants.Z_DEFAULT_STRATEGY, function() {
+     while (deflater.read());
+-    deflater.end(chunk2, function() {
+-      const bufs =3D [];
+-      let buf;
+-      while ((buf =3D deflater.read()) !=3D=3D null)
+-        bufs.push(buf);
+-      actual =3D Buffer.concat(bufs);
+-    });
++
++    deflater.on('readable', read);
++
++    deflater.end(chunk2);
+   });
+   while (deflater.read());
+ });
+
+ process.once('exit', function() {
++  const actual =3D Buffer.concat(bufs);
+   assert.deepStrictEqual(actual, expected);
+ });
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb
index 9540ed44e..2c1037e7e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.xz \
            file://CVE-2024-22019.patch \
            file://CVE-2024-21892-0001.patch \
            file://CVE-2024-21892-0002.patch \
+           file:// CVE-2024-22025.patch \
            "
 SRC_URI:append:class-target =3D " \
            file://0001-Using-native-binaries.patch \
--=20
2.40.0


