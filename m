Return-Path: <Tillmann.Severin@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A23C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:52:27 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5021.1789710737022217699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=SmO/xdgL;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=714837345=tillmann.severin@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1789710737; x=1821246737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=erCl6fXQd9P0rxnhF2X+TUZMV/xMtK/yroY/xHT0krY=;
  b=SmO/xdgLhExTrVETqKhiVrnNaznKRjsxCDhU+zIXtqntRVWsoSbihiNu
   79K+XcfpUXaJbDj8boHKBVtebrkkqL1aUH/zUA4YlKAWC0X6Yz0r1DhPh
   FKYMLdL1yH6Q+BcI3PVOL2fE8QgHoRiPMpzYGqVimDoGZWM5kd31OWhc6
   Q=;
X-CSE-ConnectionGUID: 0tJ6jcgiQaiKxlYlCcNTpA==
X-CSE-MsgGUID: f0s4dxNCRt67P7cK3wU0Yg==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Sep 2026 07:52:15 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw1.muc with
 ESMTP/TLS; 18 Sep 2026 07:52:19 +0200
Received: from smucmp21a.bmwgroup.net (HELO smucmp21a.europe.bmw.corp)
 ([10.100.172.92]) by esabb3.muc with ESMTP/TLS; 18 Sep 2026 07:52:15 +0200
Received: from clid2115459.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 18 Sep 2026 07:52:14 +0200
X-CSE-ConnectionGUID: F+WV3nIrQ5evCRfcqRcaqA==
X-CSE-MsgGUID: OKzUWKAuSWuVtTDx/djcNw==
X-CSE-ConnectionGUID: QpMiAxGLSXilbp4qOAdJQg==
X-CSE-MsgGUID: 9M5NnGEwSFyFNPW5F5UA8g==
From: Tillmann Severin <tillmann.severin@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <ross.burton@arm.com>, Tillmann Severin <tillmann.severin@bmw.de>
Subject: [meta-oe][PATCH v2] smolkit: Add low-footprint partial replacement for polkit
Date: Fri, 18 Sep 2026 07:51:08 +0200
Message-ID: <20260918055108.3637556-1-tillmann.severin@bmw.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16g.europe.bmw.corp (2a03:1e80:a16:52a::1:149) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 05:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130110

smolkit is a replacement for a subset of
polkit's interface, which is low-footprint in the
sense of not needing to have a javascript engine
available to do its job. polkit has this disadvantage
and even with a small javascript engine like duktape,
it is not worth to have turing-complete configuration
where you could also use static JSON on some embedded
devices.

Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
---
changes in v2:
- smolkit PROVIDES polkit instead of conflicting a distro feature
- Drop line setting `S`
- Tags are now available upstream
---
---
 meta-oe/recipes-extended/smolkit/smolkit.bb | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/smolkit/smolkit.bb

diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipes-extended/smolkit/smolkit.bb
new file mode 100644
index 0000000000..47ca0c3740
--- /dev/null
+++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
@@ -0,0 +1,24 @@
+SUMMARY = "low-footprint polkit replacement"
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
+PROVIDES = "polkit"
+
+PV = "0.2.0+git"
+
+SRC_URI = "\
+    git://github.com/bmwcarit/${BPN}.git;protocol=https;branch=main \
+"
+SRCREV = "46bbfd5c922a8d03a534398ee129ded822dfcafe"
-- 
2.43.0


