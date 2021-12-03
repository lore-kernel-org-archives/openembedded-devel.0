Return-Path: <jan@spectrejan.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2CCC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:15:30 +0000 (UTC)
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
 by mx.groups.io with SMTP id smtpd.web10.9532.1638522927910956332
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 01:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailerdienst.de header.s=20200217 header.b=KWUbwdId;
 spf=pass (domain: spectrejan.de, ip: 134.0.28.12,
 mailfrom: jan@spectrejan.de)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 0D9C75FC87
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1638522925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rT6PPnstVpO1lfJP4/wkbyi4Nd1QQHFrhJbyVbC65tw=;
	b=KWUbwdIdv3AZzVT5XCRCoroSnCTkfddn6Aq3uw5GjMv/9SAekgKJE5W1W7ripM0KLWD+4y
	qNZw3Wh80ReyHL6GbEvkRbnK9Zd79mI6QqLtDHAPMPFTlFQxNmWFWQ2rEgCH4de/1YHiNY
	9quhP1v22u+qvm1HdVvFF9fakFhSvmw=
Received: from cmtcleu60845491.fritz.box (unknown
 [IPv6:2001:9e8:3859:e400:341e:31e1:9c42:a260])
	by mxbox3.masterlogin.de (Postfix) with ESMTPA id 875FE360039
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 09:15:24 +0000 (UTC)
From: Jan Kraemer <jan@spectrejan.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] brotli: add patch to fix CVE-2020-8927
Date: Fri,  3 Dec 2021 10:12:30 +0100
Message-Id: <20211203091228.39465-1-jan@spectrejan.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e62e1e14-c4ec-410a-a2a4-4f8159eefaa6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 09:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94197

Port patch to fix CVE-2020-8927 for brotli from Debian Buster

CVE: CVE-2020-8927

Signed-off-by: Jan Kraemer <jan@spectrejan.de>
---
 .../0001-brotli-fix-CVE-2020-8927.patch       | 44 +++++++++++++++++++
 .../recipes-extended/brotli/brotli_1.0.7.bb   |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/brotli/brotli/0001-brotli-fix-CVE-2020-8927.patch

diff --git a/meta-oe/recipes-extended/brotli/brotli/0001-brotli-fix-CVE-2020-8927.patch b/meta-oe/recipes-extended/brotli/brotli/0001-brotli-fix-CVE-2020-8927.patch
new file mode 100644
index 000000000..c21794d14
--- /dev/null
+++ b/meta-oe/recipes-extended/brotli/brotli/0001-brotli-fix-CVE-2020-8927.patch
@@ -0,0 +1,44 @@
+From 95ab3786ce0f16e08e41f7bf216969a37dc86cad Mon Sep 17 00:00:00 2001
+From: Jan Kraemer <jan@spectrejan.de>
+Date: Thu, 7 Oct 2021 12:48:04 +0200
+Subject: [PATCH] brotli: fix CVE-2020-8927
+
+[No upstream tracking] --
+
+This fixes a potential overflow when input chunk is >2GiB in
+BrotliGetAvailableBits by capping the returned value to 2^30
+
+Fixed in brotli version 1.0.8
+https://github.com/google/brotli as of commit id
+223d80cfbec8fd346e32906c732c8ede21f0cea6
+
+Patch taken from Debian Buster: 1.0.7-2+deb10u1
+http://deb.debian.org/debian/pool/main/b/brotli/brotli_1.0.7-2+deb10u1.dsc
+https://security-tracker.debian.org/tracker/CVE-2020-8927
+
+
+Upstream-Status: Backported
+CVE: CVE-2020-8927
+
+Signed-off-by: Jan Kraemer <jan@spectrejan.de>
+---
+ c/dec/bit_reader.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/c/dec/bit_reader.h b/c/dec/bit_reader.h
+index c06e914..0d20312 100644
+--- a/c/dec/bit_reader.h
++++ b/c/dec/bit_reader.h
+@@ -87,8 +87,11 @@ static BROTLI_INLINE uint32_t BrotliGetAvailableBits(
+ }
+
+ /* Returns amount of unread bytes the bit reader still has buffered from the
+-   BrotliInput, including whole bytes in br->val_. */
++   BrotliInput, including whole bytes in br->val_. Result is capped with
++   maximal ring-buffer size (larger number won't be utilized anyway). */
+ static BROTLI_INLINE size_t BrotliGetRemainingBytes(BrotliBitReader* br) {
++  static const size_t kCap = (size_t)1 << 30;
++  if (br->avail_in > kCap) return kCap;
+   return br->avail_in + (BrotliGetAvailableBits(br) >> 3);
+ }
+
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
index 70dbcaffb..bbd3a0eb8 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
@@ -6,7 +6,9 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git"
+SRC_URI = "git://github.com/google/brotli.git \
+           file://0001-brotli-fix-CVE-2020-8927.patch \
+          "
 # tag 1.0.7
 SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
 S = "${WORKDIR}/git"
-- 
2.34.1


