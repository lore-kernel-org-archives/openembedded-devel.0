Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A818C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:42:57 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.804.1642556576470349371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QDksf7zl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556574; i=@fujitsu.com;
	bh=6u2KHfGCZPVLKRiY2mClYqAuDHxqp0AREvBvJ+WUNiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QDksf7zlgk10BU3I4CkxlCO4c8dHluFZWLS83pG0aR8j7RNj5wO45FLrSfZ+CxzMd
	 OMI41Ki/YfmG7oyt9y/r7FkJyxKxNXU5ukIxfxfSM2y6TJDsuBsgHk3F/97KpPffB+
	 uYVl814LbG74NEcFA6aHAGQ21XmB4YqK0468wPr7j120NhXQND3teJrgmt5GS2hmMc
	 a93E3gun05A/3E3ZnNJHLpyesuikZk8A2ws56L8Y9xBsYCUNS7+N8r4l9PUzr6iJLd
	 MgHOqjXCFC3oXD0n6ob0gc44mIldxExOGPA9KVHi+3IbYGxdB8kzFzYjaaWfndLdJZ
	 Huq68MkM6Stng==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 5A/B9-02997-D9C67E16;
 Wed, 19 Jan 2022 01:42:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRojs353m
  iQcdKZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPr4zLGgtlWFSfa5RoYPxl1MXJxCAnMZJJ4
  dmo6G4RzglGic9k75i5GTg42ATWJ6bdusILYIgL6Ektn7wGLMwuoSLz43cMOYgsLOEpcWXaVC
  cRmEVCVuLVkLlgNr4CTxI6lv8BqJAQUJKY8fA8W5xRwlni25AmYLQRUM2PRSyaIekGJkzOfsE
  DMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwTGPlnIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwN
  dQ0NTXUNdU0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAgEwpZrTewdjR
  91PvEKMkB5OSKK9o/PNEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8rMAQFxIsSk1PrUjLzAFGB
  0xagoNHSYT3aRZQmre4IDG3ODMdInWKUZejedLy7cxCLHn5ealS4ryd2UBFAiBFGaV5cCNgkX
  qJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDva5BVPJl5JXCbXgEdwQR0RP+zZyBHlCQipKQ
  amKZcEJ508QZjdHG00rmzKxeI3S/SdWb9XNIwP6Kp8sFih12fXAz3Tupafnp30v6pajGTlbrr
  91ryGojP97p+8Jx4No/Y4aD0m7uehh7nP/jEYt+qlz+4fi6ccmJB/vQO996r+xZx3uHp6pLqr
  lBsvxLVd+evhKDgZoHNelorWKQWbrYu5Q5z2tGlt7VS09hjxQtGpXbB+zYSa9Rnf7j4YOPJs+
  Un2bVluGX1VmyeflE12vXIGV4e5qKSabqLlgiW7dV8tm7Lmtsp7+y6p3K9+3MnlWHVW8dvFTs
  s2q7mLHAO6n/Wq5Y/fYbh27VuB2dxZ/9yl02x8vaZLtNzYaZUSdfuFIMoJodlxcWnprvJf1di
  Kc5INNRiLipOBAAIhsjFTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1642556573!44345!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4981 invoked from network); 19 Jan 2022 01:42:53 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:42:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J1gkBa020792
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:53 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:42:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmodbus: upgrade 3.1.6 -> 3.1.7
Date: Wed, 19 Jan 2022 09:42:34 +0800
Message-ID: <1642556556-18277-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642556556-18277-1-git-send-email-wangmy@fujitsu.com>
References: <1642556556-18277-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:42:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94927

Fix-typo.patch
f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch
removed since they're included in 3.1.7

Changelog:
=========
modbus_reply: fix copy & paste error in sanity check
Add SECURITY.md
Fix typo in comment
Replace obsolete AC_PROG_CC_STDC by AC_PROG_CC
Fix position of CC flags in documentation
Remove duplicate ';'
Add the baud rate of 256k for Windows
cosmetic changes in man page standardizing itemization
Fix many typos
Replace .dir-locals.el (Emacs) by .editorconfig
Include the test LICENSE in tarball
Install the NEWS and AUTHORS files
Update README.md
docs: fix simple typo, reponse -> response
Add modbus_[get|set]_indication_timeout to doc build
Fix warning issues
Move malloc before starting unit tests
Fixed MODBUS_GET_* macros in case of negative values
SPDX: change LGPL-2.1+ to LGPL-2.1-or-later

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmodbus/libmodbus/Fix-typo.patch        | 52 -------------------
 ...4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch | 32 ------------
 .../libmodbus/libmodbus_3.1.6.bb              | 12 -----
 .../libmodbus/libmodbus_3.1.7.bb              |  9 ++++
 4 files changed, 9 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/Fix-typo.patch
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-typo.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-typo.patch
deleted file mode 100644
index 384a4a40b..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-typo.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From: =?utf-8?b?IlNaIExpbiAo5p6X5LiK5pm6KSI=?= <szlin@debian.org>
-Date: Thu, 27 Sep 2018 14:51:32 +0800
-Subject: Fix typo
-
----
- doc/modbus_mapping_new_start_address.txt | 4 ++--
- doc/modbus_reply.txt                     | 2 +-
- doc/modbus_reply_exception.txt           | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/doc/modbus_mapping_new_start_address.txt b/doc/modbus_mapping_new_start_address.txt
-index 4fa196a..94a81fb 100644
---- a/doc/modbus_mapping_new_start_address.txt
-+++ b/doc/modbus_mapping_new_start_address.txt
-@@ -21,9 +21,9 @@ The _modbus_mapping_new_start_address()_ function shall allocate four arrays to
- store bits, input bits, registers and inputs registers. The pointers are stored
- in modbus_mapping_t structure. All values of the arrays are initialized to zero.
- 
--The different starting adresses make it possible to place the mapping at any
-+The different starting addresses make it possible to place the mapping at any
- address in each address space. This way, you can give access to values stored
--at high adresses without allocating memory from the address zero, for eg. to
-+at high addresses without allocating memory from the address zero, for eg. to
- make available registers from 10000 to 10009, you can use:
- 
- [source,c]
-diff --git a/doc/modbus_reply.txt b/doc/modbus_reply.txt
-index 0b29d6f..6b71d11 100644
---- a/doc/modbus_reply.txt
-+++ b/doc/modbus_reply.txt
-@@ -3,7 +3,7 @@ modbus_reply(3)
- 
- NAME
- ----
--modbus_reply - send a reponse to the received request
-+modbus_reply - send a response to the received request
- 
- 
- SYNOPSIS
-diff --git a/doc/modbus_reply_exception.txt b/doc/modbus_reply_exception.txt
-index 7e6324f..b2170be 100644
---- a/doc/modbus_reply_exception.txt
-+++ b/doc/modbus_reply_exception.txt
-@@ -3,7 +3,7 @@ modbus_reply_exception(3)
- 
- NAME
- ----
--modbus_reply_exception - send an exception reponse
-+modbus_reply_exception - send an exception response
- 
- 
- SYNOPSIS
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch
deleted file mode 100644
index 7fae34e7d..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus/f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d Mon Sep 17 00:00:00 2001
-From: i-ky <gl.ivanovsky@gmail.com>
-Date: Tue, 10 Jul 2018 15:58:45 +0300
-Subject: [PATCH] Fixed MODBUS_GET_* macros in case of negative values
-
-In case resulting value should be negative it is incorrect to use '+' operator to construct it from pieces, because highest bytes will result in negative number after bitwise shift while others will stay positive. Replacing addition with '|' should solve the issue.
----
- src/modbus.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/modbus.h b/src/modbus.h
-index f6e9a5f5..c63f5ceb 100644
---- a/src/modbus.h
-+++ b/src/modbus.h
-@@ -245,12 +245,12 @@ MODBUS_API int modbus_reply_exception(modbus_t *ctx, const uint8_t *req,
- #define MODBUS_GET_HIGH_BYTE(data) (((data) >> 8) & 0xFF)
- #define MODBUS_GET_LOW_BYTE(data) ((data) & 0xFF)
- #define MODBUS_GET_INT64_FROM_INT16(tab_int16, index) \
--    (((int64_t)tab_int16[(index)    ] << 48) + \
--     ((int64_t)tab_int16[(index) + 1] << 32) + \
--     ((int64_t)tab_int16[(index) + 2] << 16) + \
-+    (((int64_t)tab_int16[(index)    ] << 48) | \
-+     ((int64_t)tab_int16[(index) + 1] << 32) | \
-+     ((int64_t)tab_int16[(index) + 2] << 16) | \
-       (int64_t)tab_int16[(index) + 3])
--#define MODBUS_GET_INT32_FROM_INT16(tab_int16, index) ((tab_int16[(index)] << 16) + tab_int16[(index) + 1])
--#define MODBUS_GET_INT16_FROM_INT8(tab_int8, index) ((tab_int8[(index)] << 8) + tab_int8[(index) + 1])
-+#define MODBUS_GET_INT32_FROM_INT16(tab_int16, index) ((tab_int16[(index)] << 16) | tab_int16[(index) + 1])
-+#define MODBUS_GET_INT16_FROM_INT8(tab_int8, index) ((tab_int8[(index)] << 8) | tab_int8[(index) + 1])
- #define MODBUS_SET_INT16_TO_INT8(tab_int8, index, value) \
-     do { \
-         tab_int8[(index)] = (value) >> 8;  \
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb
deleted file mode 100644
index 8e42fdc5d..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libmodbus.inc
-
-SRC_URI += "file://f1eb4bc7ccb09cd8d19ab641ee37637f8c34d16d.patch \
-	    file://Fix-float-endianness-issue-on-big-endian-arch.patch \
-	    file://Fix-typo.patch"
-SRC_URI[md5sum] = "15c84c1f7fb49502b3efaaa668cfd25e"
-SRC_URI[sha256sum] = "d7d9fa94a16edb094e5fdf5d87ae17a0dc3f3e3d687fead81835d9572cf87c16"
-
-# this file has been created one minute after the configure file, so it doesn't get recreated during configure step
-do_configure:prepend() {
-	rm -rf ${S}/tests/unit-test.h
-}
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb
new file mode 100644
index 000000000..6c0e315d7
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb
@@ -0,0 +1,9 @@
+require libmodbus.inc
+
+SRC_URI += "file://Fix-float-endianness-issue-on-big-endian-arch.patch"
+SRC_URI[sha256sum] = "7dfe958431d0570b271e1a5b329b76a658e89c614cf119eb5aadb725c87f8fbd"
+
+# this file has been created one minute after the configure file, so it doesn't get recreated during configure step
+do_configure:prepend() {
+	rm -rf ${S}/tests/unit-test.h
+}
-- 
2.25.1


