Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8E9C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:18:55 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web11.2193.1752563924939711076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 00:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ONNNzi8M;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=284ae8e06=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752563924; x=1784099924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mNaTyTkQolC5e2a1oAgXI4C6lfgwNqkmHy9dj7Ea5Uw=;
  b=ONNNzi8MEQ5dz3azKmOI44JbzZP7b7M8fxV/mwx60u43ql6vj+5DLdDP
   DN/mTgimxprU7njy7Va8n62+F2bgzqmJ1lpvyfDQUSz7yGCMyyB5QIXIy
   fwckxqp0BTDsIcAIoBRuT77oxv1IH2yiM5xfhy++SX5yK1HF1H5CWAKLs
   A=;
X-CSE-ConnectionGUID: WjW6hQFeTp63W8Ka0Y4AZw==
X-CSE-MsgGUID: MeCrrmisQ4iTlznLfMyNOw==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Jul 2025 09:18:43 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw4.muc with
 ESMTP/TLS; 15 Jul 2025 09:18:33 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb6.muc with ESMTP/TLS; 15 Jul 2025 09:18:34 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Tue, 15 Jul 2025 09:18:33 +0200
X-CSE-ConnectionGUID: HXIZgm5GSu6dA0npjO8Bng==
X-CSE-MsgGUID: j2BvCrDrT927P7GAbrYy9w==
X-CSE-ConnectionGUID: T2AGs41wSO2kDC0WabVb1g==
X-CSE-MsgGUID: m/4iqpCgTVa0gLirGGLgZw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] leveldb: Allow to build with CMake 4+
Date: Tue, 15 Jul 2025 09:18:10 +0200
Message-ID: <20250715071810.601463-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp09d.europe.bmw.corp (2a03:1e80:a15:58f::2040) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 07:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118552

The component itself builds just fine with CMake 4, but the tests don't as they
rely on a bundled version of GTest that is six years old. Since upstream is
inactive, the simplest course of action is to apply the 'minimum policy version'
override (as implemented in CMake, it only affects the GTest submodule).

System GTest can not be used instead (easily), as among other things it requires
C++14 and the project uses C++11.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
index 9cefc528ae..1ccf115793 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -18,8 +18,12 @@ PACKAGECONFIG[benchmarks] = "-DLEVELDB_BUILD_BENCHMARKS=ON,-DLEVELDB_BUILD_BENCH
 PACKAGECONFIG[snappy] = ",,snappy"
 PACKAGECONFIG[tcmalloc] = ",,gperftools"
 
+# CMake policy override is only required for (and only affects) the bundled GTest submodule.
+# System GTest can not be used instead, since (among other things) it requires C++14 and the project uses C++11.
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON \
-                 -DLEVELDB_BUILD_TESTS=${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ON', 'OFF', d)}"
+                 -DLEVELDB_BUILD_TESTS=${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ON', 'OFF', d)} \
+                 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+"
 
 do_install:append() {
     install -D -m 0755 ${B}/leveldbutil ${D}${bindir}/leveldbutil

