Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91627C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.75862.1752492418642111750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ZLk8+rQL;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492419; x=1784028419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ikxlXiajGyAZWrudWpPnPWd0o1w4ki0vADtQHbXFYcE=;
  b=ZLk8+rQLE4RlOd9F7My6vEgMwDp05wd5E0use6wIfeWSgyEkA/H/H/l3
   ZKFvj2+o7Vk0C98eyUPK6obLQG3A7VSwRreQBYIW+P9yUyujF7Zxjw1Kb
   gSXVtP9thMJQG1nM0rp3PHeE9Zn1hZkXB7kNKMmFNsaugkKCXMPrnEtE1
   s=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: NPd/SwOXSf6WEyBQvutmIQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: D5HN5x7kRR2xSwaP9tOVFQ==
X-CSE-MsgGUID: jaDH8+KPRrW/zQJ/F3D4sQ==
X-CSE-ConnectionGUID: PTgZgCqlRTC1GBPHzlwWGA==
X-CSE-MsgGUID: n+5OU4ssSGqxaIvp7jZB7A==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 07/10] dnfdragora: Allow to build with CMake 4+
Date: Mon, 14 Jul 2025 13:26:32 +0200
Message-ID: <20250714112642.121146-7-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118525

The 2.x branch of dnfdragora is in maintenance mode. Official support to build
with CMake 4+ is only available in preview versions of v3 (named 2.99.x, see
[0]) which are only compatible with dnf v5. Thus, apply the 'minimum policy
version' override.

[0]: https://github.com/manatools/dnfdragora/commit/0b84709de2b6e981b6359f1ad9806eca5e267462

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
index ef6dc14ca6..50fff7de54 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.6.bb
@@ -20,7 +20,8 @@ DEPENDS += "dnf python3 "
 RDEPENDS:${PN}:class-target = " python3-core libyui libyui-ncurses "
 
 # manpages generation requires http://www.sphinx-doc.org/
-EXTRA_OECMAKE = " -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
+EXTRA_OECMAKE += "-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+                  -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "nativesdk"
 

