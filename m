Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC627EB48F7
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:32:53 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38880.1770873691240509210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RkDVz9O6;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3087; q=dns/txt;
  s=iport01; t=1770873691; x=1772083291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IDYQekh425bSell5LIajB6hv2kFG7PogKBL/oMoRjkc=;
  b=RkDVz9O6YCM+P7L6LebQssgLDgpbfs+KSNrAouYVDz1+galCzfcywIMn
   4t+XJdH8lnbrKah4n6kQ3ja2MdA8mE8uHXK37ktWNzWS4Y40n/dc8AXA0
   /aN1/MNWzoVUCE/e+0s0uecaDLXpiMzciEwosc3E8Na8RxlqTUBdHVNdU
   DGLY22DTlQUlhxdO9SMJQTQwIsAzHcYLa5XBx/qNoodlbgw6fVs005MlZ
   das1vxr58KvoT/Tc6AebqbLmWTme1FnZkQPacg26RsioXXmUMCxbfsW+M
   cPIPdKDGyunxkZ55wR+NeQ6ahY9Om+lXjDAlEwgI58jMrdXJD7b9MkObx
   Q==;
X-CSE-ConnectionGUID: 0BTI/y92QU+T2uUB9EMK1A==
X-CSE-MsgGUID: hOQY3tObTeyjt8YAgt0q7A==
X-IPAS-Result: =?us-ascii?q?A0CrBgDuYo1p/5T/Ja1aglmCSA9xXkNJlksDgn6IZpI2g?=
 =?us-ascii?q?X8PAQEBDz0UBAEBhQcCjR0CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzYDE?=
 =?us-ascii?q?ahpgiyBAYMoAT8CQ0/YRw2CUgELFAGBOIU7gnmFH1sYAYR4JxsbgXKEB3aBB?=
 =?us-ascii?q?YEaQgEBAhiBLoZcBIIigQ6BZCcPkVRIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQsbBwWIFQ+JD3hwgSByAwsYDUgRLDcUGwQ+bgeOS0GBbkV7EwEqA?=
 =?us-ascii?q?SKBchgckwmST6AdcQoog3SMHo8+AYV7GjOFW6UQC5h7jgmECZEtgRqEaIFoP?=
 =?us-ascii?q?IFHCwdwFYMiCUkZD444g2mBf4MUvE4lMgI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:kKGonqhVxSIIsq1W4cyMq9ySX161MBEKZh0ujC45NGQN5FlHY01je
 htvXz3UP62IamSnft9+aIrl8R8OvcTdndRmQQFq+C5nHytjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVA0NpWRnAfr
 8UlawxXcy2p1s+T4+uSH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9JILUHZwNxBjAz
 o7A12TeOyBBKPuV9TeU8G78t8bAgXviB6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:y0esW6A902T957zlHemr55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80l6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3A4tRWC2kcdqiZJC4mp5FuDnvT8ZjXOSX38FaXMh7?=
 =?us-ascii?q?iMFsqdOeIdHXB1YZHyuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ASemCCQ8vk7hHu1gSrcXjdl2Qf8dP2pX1FGcHrZg?=
 =?us-ascii?q?XudXUBAV/J2+E0x3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="666010260"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:21:30 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 4F5F718000145;
	Thu, 12 Feb 2026 05:21:30 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id F1F55CC12A6; Wed, 11 Feb 2026 21:21:29 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 5/5] Nodejs 20.18.2: Fix CVE-2025-59465
Date: Wed, 11 Feb 2026 21:21:10 -0800
Message-ID: <20260212052114.3215220-5-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260212052114.3215220-1-adongare@cisco.com>
References: <20260212052114.3215220-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124352

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59465
Type: Security Fix
CVE: CVE-2025-59465
Score: 7.5
Patch: https://github.com/nodejs/node/commit/eb8e41f8dbe6

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nodejs/nodejs/CVE-2025-59465.patch        | 49 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59465.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59465.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59465.patch
new file mode 100644
index 0000000000..81d64609c3
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59465.patch
@@ -0,0 +1,49 @@
+From 27ddb91569c1bd9c72dbc557e53458b9ebfbc573 Mon Sep 17 00:00:00 2001
+From: RafaelGSS <rafael.nunu@hotmail.com>
+Date: Fri, 31 Oct 2025 16:27:48 -0300
+Subject: [PATCH 5/6] lib: add TLSSocket default error handler
+
+This prevents the server from crashing due to an unhandled rejection
+when a TLSSocket connection is abruptly destroyed during initialization
+and the user has not attached an error handler to the socket.
+e.g:
+
+```js
+const server = http2.createSecureServer({ ... })
+server.on('secureConnection', socket => {
+  socket.on('error', err => {
+    console.log(err)
+  })
+})
+```
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/797
+Fixes: https://github.com/nodejs/node/issues/44751
+Refs: https://hackerone.com/bugs?subject=nodejs&report_id=3262404
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+CVE-ID: CVE-2025-59465
+
+CVE: CVE-2025-59465
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/eb8e41f8dbe6]
+
+(cherry picked from commit eb8e41f8dbe6de127fb11baca725e1b469612434)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/_tls_wrap.js | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/_tls_wrap.js b/lib/_tls_wrap.js
+index c3e48a6cbc8..d9c7e32174d 100644
+--- a/lib/_tls_wrap.js
++++ b/lib/_tls_wrap.js
+@@ -1268,6 +1268,7 @@ function tlsConnectionListener(rawSocket) {
+   socket[kErrorEmitted] = false;
+   socket.on('close', onSocketClose);
+   socket.on('_tlsError', onSocketTLSError);
++  socket.on('error', onSocketTLSError);
+ }
+
+ // AUTHENTICATION MODES
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index 68eb40bc1d..b1c9057557 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2025-55130.patch \
            file://CVE-2025-59466.patch \
            file://CVE-2026-21637.patch \
+           file://CVE-2025-59465.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.44.1


