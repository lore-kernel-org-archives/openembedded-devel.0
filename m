Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F97EB48F6
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:32:53 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39073.1770873684987539524
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k0s8C9ku;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7485; q=dns/txt;
  s=iport01; t=1770873685; x=1772083285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DKzrD17tWzRuMWJhAkyJs023aY/d/XqOYwwP+gfy7v8=;
  b=k0s8C9kuUCatDEaR66kDkQGNTGN0jghXuCFsR33Sz7t6pBRD0qxrgBiD
   oBiVxXqiXxRQu65/S+ntWpv3B1JZU2s0r0GCbA/K2NYBNVYhqAmiotm5z
   MjHC9dUgUVtz42Px/lgKX8kNkk0xuf3QE1EH448aTcyiNm0LaVXJAEs7G
   0VzH9JnbwOb8F3V+QnymZiJ00VPyV2cRexzIlErq47/xCkB0XrieecbZ8
   XGxgWccQLMfeHvMA8Jnc4d0j9Unc0/xVsFfvuwUmHw0OWzGYTiPOyZjaS
   1AO4piqr4Qfq9+4ta/oEXPJJD1G5Am5+HLu4LjUmjoQFzdHz/x/uON3L6
   w==;
X-CSE-ConnectionGUID: gKNvqYc9QQyRrUPJhZm9oA==
X-CSE-MsgGUID: 7iiU2rE+RHKC8N5FD3yjRg==
X-IPAS-Result: =?us-ascii?q?A0CsBgDuYo1p/4v/Ja1agQmBUIJID3FeQ0mEV5F0gwGIZ?=
 =?us-ascii?q?pI2gX8PAQEBDz0UBAEBhQeNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECASYPARgBLSwDAQIDAiYCIgsjIYMCAYI6A?=
 =?us-ascii?q?zYDEahpeoEygQGDKAE/AkNP2EcNglIBCxQBgQouhTuCeR8BhH9bGAFEhDQnG?=
 =?us-ascii?q?xuBcoQHdoEFgRpCAQGFO4JpBIIigQ6BZCcPiDGJI0iBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XM1gbBwWIFQ+JD3hwgSByAwsYDUgRLDcUGwQ9AW4Hj?=
 =?us-ascii?q?ktBgjIBWQE0ASoBgRoVFAo3EBhOkleQLoIhoB1xCiiDdIwejz4BhXsaM4QEg?=
 =?us-ascii?q?VeSPpJSC5h7gliIToJjhAmRKweBFYRogWg8gUcLB3AVgyIJSRkPji0LC4Neg?=
 =?us-ascii?q?X+DFLxOJTICOgIHAQoBAQMJk2cBAQ?=
IronPort-Data: A9a23:mW/GIKj4ITpIOQeGP44pDjRiX161MBEKZh0ujC45NGQN5FlHY01je
 htvXGHVMvmDMGHyctsgaIvioRwCupKGx99gTgM4qi1hE39jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUX2cBpGFBFp
 MUhOQoXUyihh9CzkbWSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9JILUHZwNxxnEz
 o7A1zv4AyxALvHc8xqm2SKK28HjxjL5Yo1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:aeHvsavrv6ANk376Cs+fOpJP7skDd9V00zEX/kB9WHVpmwKj+P
 xG+85rsSMc6QxhPU3I9urgBEDtex7hHP1OkOss1NWZPDUO0VHAROoJ0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: =?us-ascii?q?9a23=3A6fEk2Wmer/NKSxsTrqti/xkX2SDXOXL+6mnJEkT?=
 =?us-ascii?q?pMF94cqeocX2QyqY1lOM7zg=3D=3D?=
X-Talos-MUID: 9a23:cX4tuQQtjvdDQuaWRXSzhTBfbt1FoJ6OK2tdt8gol5KVNxZ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="666010174"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:21:23 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id CE73618000373;
	Thu, 12 Feb 2026 05:21:23 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 773BBCC12A6; Wed, 11 Feb 2026 21:21:23 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 1/5] Nodejs 20.18.2: Fix CVE-2025-55132
Date: Wed, 11 Feb 2026 21:21:06 -0800
Message-ID: <20260212052114.3215220-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124348

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55132
Type: Security Fix
CVE: CVE-2025-55132
Score: 5.3
Patch: https://github.com/nodejs/node/commit/ebbf942a83bc

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nodejs/nodejs/CVE-2025-55132.patch        | 178 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch
new file mode 100644
index 0000000000..08c885473c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch
@@ -0,0 +1,178 @@
+From b89fc3633ec12b6d1da5b9978e6bb1c5fbacf021 Mon Sep 17 00:00:00 2001
+From: RafaelGSS <rafael.nunu@hotmail.com>
+Date: Tue, 21 Oct 2025 18:25:31 -0300
+Subject: [PATCH 1/5] lib: disable futimes when permission model is enabled
+
+Refs: https://hackerone.com/reports/3390084
+PR-URL: https://github.com/nodejs-private/node-private/pull/748
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+CVE-ID: CVE-2025-55132
+
+CVE: CVE-2025-55132
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/ebbf942a83bc]
+
+(cherry picked from commit ebbf942a83bc70d90a3bcb6712c7b67bc479fdf5)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/fs.js                                     | 24 ++++++++++
+ test/fixtures/permission/fs-write.js          | 47 ++++++++++++++++++-
+ test/parallel/test-permission-fs-supported.js | 17 ++++++-
+ 3 files changed, 86 insertions(+), 2 deletions(-)
+
+diff --git a/lib/fs.js b/lib/fs.js
+index 64f0b5e88ed..9206a18663c 100644
+--- a/lib/fs.js
++++ b/lib/fs.js
+@@ -1274,6 +1274,11 @@ function rmSync(path, options) {
+ function fdatasync(fd, callback) {
+   const req = new FSReqCallback();
+   req.oncomplete = makeCallback(callback);
++
++  if (permission.isEnabled()) {
++    callback(new ERR_ACCESS_DENIED('fdatasync API is disabled when Permission Model is enabled.'));
++    return;
++  }
+   binding.fdatasync(fd, req);
+ }
+
+@@ -1285,6 +1290,9 @@ function fdatasync(fd, callback) {
+  * @returns {void}
+  */
+ function fdatasyncSync(fd) {
++  if (permission.isEnabled()) {
++    throw new ERR_ACCESS_DENIED('fdatasync API is disabled when Permission Model is enabled.');
++  }
+   binding.fdatasync(fd);
+ }
+
+@@ -1298,6 +1306,10 @@ function fdatasyncSync(fd) {
+ function fsync(fd, callback) {
+   const req = new FSReqCallback();
+   req.oncomplete = makeCallback(callback);
++  if (permission.isEnabled()) {
++    callback(new ERR_ACCESS_DENIED('fsync API is disabled when Permission Model is enabled.'));
++    return;
++  }
+   binding.fsync(fd, req);
+ }
+
+@@ -1308,6 +1320,9 @@ function fsync(fd, callback) {
+  * @returns {void}
+  */
+ function fsyncSync(fd) {
++  if (permission.isEnabled()) {
++    throw new ERR_ACCESS_DENIED('fsync API is disabled when Permission Model is enabled.');
++  }
+   binding.fsync(fd);
+ }
+
+@@ -2164,6 +2179,11 @@ function futimes(fd, atime, mtime, callback) {
+   mtime = toUnixTimestamp(mtime, 'mtime');
+   callback = makeCallback(callback);
+
++  if (permission.isEnabled()) {
++    callback(new ERR_ACCESS_DENIED('futimes API is disabled when Permission Model is enabled.'));
++    return;
++  }
++
+   const req = new FSReqCallback();
+   req.oncomplete = callback;
+   binding.futimes(fd, atime, mtime, req);
+@@ -2179,6 +2199,10 @@ function futimes(fd, atime, mtime, callback) {
+  * @returns {void}
+  */
+ function futimesSync(fd, atime, mtime) {
++  if (permission.isEnabled()) {
++    throw new ERR_ACCESS_DENIED('futimes API is disabled when Permission Model is enabled.');
++  }
++
+   binding.futimes(
+     fd,
+     toUnixTimestamp(atime, 'atime'),
+diff --git a/test/fixtures/permission/fs-write.js b/test/fixtures/permission/fs-write.js
+index 31e96860972..4b98b6d2b78 100644
+--- a/test/fixtures/permission/fs-write.js
++++ b/test/fixtures/permission/fs-write.js
+@@ -490,4 +490,49 @@ const relativeProtectedFolder = process.env.RELATIVEBLOCKEDFOLDER;
+   }, {
+     code: 'ERR_ACCESS_DENIED',
+   });
+-}
+\ No newline at end of file
++}
++
++// fs.utimes with read-only fd
++{
++  assert.throws(() => {
++    // blocked file is allowed to read
++    const fd = fs.openSync(blockedFile, 'r');
++    const date = new Date();
++    date.setFullYear(2100,0,1);
++
++    fs.futimes(fd, date, date, common.expectsError({
++      code: 'ERR_ACCESS_DENIED',
++    }));
++    fs.futimesSync(fd, date, date);
++  }, {
++    code: 'ERR_ACCESS_DENIED',
++  });
++}
++
++// fs.fdatasync with read-only fd
++{
++  assert.throws(() => {
++    // blocked file is allowed to read
++    const fd = fs.openSync(blockedFile, 'r');
++    fs.fdatasync(fd, common.expectsError({
++      code: 'ERR_ACCESS_DENIED',
++    }));
++    fs.fdatasyncSync(fd);
++  }, {
++    code: 'ERR_ACCESS_DENIED',
++  });
++}
++
++// fs.fsync with read-only fd
++{
++  assert.throws(() => {
++    // blocked file is allowed to read
++    const fd = fs.openSync(blockedFile, 'r');
++    fs.fsync(fd, common.expectsError({
++      code: 'ERR_ACCESS_DENIED',
++    }));
++    fs.fsyncSync(fd);
++  }, {
++    code: 'ERR_ACCESS_DENIED',
++  });
++}
+diff --git a/test/parallel/test-permission-fs-supported.js b/test/parallel/test-permission-fs-supported.js
+index 1062117798b..805365f28b3 100644
+--- a/test/parallel/test-permission-fs-supported.js
++++ b/test/parallel/test-permission-fs-supported.js
+@@ -77,7 +77,22 @@ const ignoreList = [
+   'unwatchFile',
+   ...syncAndAsyncAPI('lstat'),
+   ...syncAndAsyncAPI('realpath'),
+-  // fd required methods
++  // File descriptor–based metadata operations
++  //
++  // The kernel does not allow opening a file descriptor for an inode
++  // with write access if the inode itself is read-only. However, it still
++  // permits modifying the inode’s metadata (e.g., permission bits, ownership,
++  // timestamps) because you own the file. These changes can be made either
++  // by referring to the file by name (e.g., chmod) or through any existing
++  // file descriptor that identifies the same inode (e.g., fchmod).
++  //
++  // If the kernel required write access to change metadata, it would be
++  // impossible to modify the permissions of a file once it was made read-only.
++  // For that reason, syscalls such as fchmod, fchown, and futimes bypass
++  // the file descriptor’s access mode. Even a read-only ('r') descriptor
++  // can still update metadata. To prevent unintended modifications,
++  // these APIs are therefore blocked by default when permission model is
++  // enabled.
+   ...syncAndAsyncAPI('close'),
+   ...syncAndAsyncAPI('fchown'),
+   ...syncAndAsyncAPI('fchmod'),
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index d757a7395c..67574a2ec1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://zlib-fix-pointer-alignment.patch \
            file://0001-src-fix-build-with-GCC-15.patch \
            file://run-ptest \
+           file://CVE-2025-55132.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.44.1


