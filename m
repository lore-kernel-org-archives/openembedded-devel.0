Return-Path: <Tillmann.Severin@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8F9C88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:30:04 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19112.1789388992264755040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=peOSPXgQ;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=71062d7bf=tillmann.severin@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1789388992; x=1820924992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8oxPZMHaqBwiSNch7wT18p91e2FT7NtazaAoYrsHX4Q=;
  b=peOSPXgQr04k1Z9CBVZJL/LbA/9DLCPulZsff/wj6eqoDaJ6Yi9YFTLJ
   QDb7i4zNjdL3DRDqWzyTdtt3tC2nGeFVp3r2zYxntKs2hsbe2Qtg7HFcE
   FwjzZhG0wnIYZrKsBh4CZtrN6K2wpwSe7AhPsPl2uDt0WnTNkOyO0BlhY
   8=;
X-CSE-ConnectionGUID: vkrKud0YQ5mwDmC9MUrrng==
X-CSE-MsgGUID: IoqrCmOJT9Og2ivJU23lQg==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Sep 2026 14:29:50 +0200
Received: from unknown (HELO esabb1.muc) ([10.31.187.132]) by esagw3.muc with
 ESMTP/TLS; 14 Sep 2026 14:29:50 +0200
Received: from smucmp21a.bmwgroup.net (HELO smucmp21a.europe.bmw.corp)
 ([10.100.172.92]) by esabb1.muc with ESMTP/TLS; 14 Sep 2026 14:29:50 +0200
Received: from clid2115459.de-cci.bmwgroup.net (10.30.85.214) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Sep 2026 14:29:49 +0200
X-CSE-ConnectionGUID: 7l72tp4dRVGe9xVDH20Nwg==
X-CSE-MsgGUID: lmgJt26hQ6+zGsB6bVvqYA==
X-CSE-ConnectionGUID: NgM/V78yTr6vdodkVch+Kg==
X-CSE-MsgGUID: ipLUS+g4QrqRUWMk0BfN5Q==
From: Tillmann Severin <tillmann.severin@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Tillmann Severin <tillmann.severin@bmw.de>
Subject: [meta-oe][PATCH] smolkit: Add low-footprint drop-in replacement for polkit
Date: Mon, 14 Sep 2026 14:29:27 +0200
Message-ID: <20260914122927.87418-1-tillmann.severin@bmw.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16h.europe.bmw.corp (2a03:1e80:a15:58f::1:150) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 12:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130022

smolkit is a drop-in replacement for a subset of
polkit's interface, which is low-footprint in the
sense of not needing to have a javascript engine
available to do its job. polkit has this disadvantage
and even with a small javascript engine like duktape,
it is not worth to have turing-complete configuration
where you could also use static JSON on some embedded
devices.

Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
---
 meta-oe/recipes-extended/smolkit/smolkit.bb | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/smolkit/smolkit.bb

diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipes-extended/smolkit/smolkit.bb
new file mode 100644
index 0000000000..4bd5f8d03f
--- /dev/null
+++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
@@ -0,0 +1,27 @@
+SUMMARY = "low-footprint drop-in polkit replacement"
+HOMEPAGE = "https://github.com/bmwcarit/smolkit"
+DESCRIPTION = "\
+  Service that implements a subset of polkit's D-Bus interface with a static configuration language. \
+"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit cmake features_check pkgconfig
+
+DEPENDS = "\
+  rapidjson \
+  sdbus-c++ \
+"
+
+CONFLICT_DISTRO_FEATURES = "polkit"
+REQUIRED_DISTRO_FEATURES = "smolkit"
+
+PV = "0.2+git"
+
+SRC_URI = "\
+    git://github.com/bmwcarit/${BPN}.git;protocol=https;branch=main \
+"
+SRCREV = "46bbfd5c922a8d03a534398ee129ded822dfcafe"
+
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
-- 
2.43.0


