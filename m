Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F820C83F28
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web10.75973.1752492418920998401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=D7DJbNs6;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492419; x=1784028419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4bBypefnjjgxQb4DpD3/1XlJK1iU6cGHhaVXA1r8ZBE=;
  b=D7DJbNs6uNCk0JGapOzi36XRkM/N6iNjr0RNudIrbToVGUm+RgYev1Ni
   V77OTibgGjliFus9e5BWC1kNHSVSNs8x/pxdFbs6MNNN6qwoMWvqcurJ0
   RYIWRu9hl9NCJBiucj5zJaMCGkzkfxJyNKbarYYpgzzpV5lFWskttzlQR
   o=;
X-CSE-ConnectionGUID: SyclwokfTyqyJWeAgP7DCg==
X-CSE-MsgGUID: 6NwDy1YERxmKEgyJEgRyNA==
Received: from 160.46.252.35.spf.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:57 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw3.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb3.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:55 +0200
X-CSE-ConnectionGUID: zBRMN5F6RgS0c4BBHev6nQ==
X-CSE-MsgGUID: YZ4QSViqT5ivAI8BlnVO/Q==
X-CSE-ConnectionGUID: h4WhcVrCTmKDdtC3ywti3A==
X-CSE-MsgGUID: iX48XxrlS9iC8m2v1cOE4w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 04/10] czmq: Allow to build with CMake 4+
Date: Mon, 14 Jul 2025 13:26:29 +0200
Message-ID: <20250714112642.121146-4-Moritz.Haase@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118524

There hasn't been an upstream release in four years. Latest HEAD supports builds
with CMake 4+, but the corresponding patches at [0] and [1] are considered to be
too invasive to backport. Instead, apply the 'minimum policy version' override.

[0]: https://github.com/zeromq/czmq/commit/00d7750304f1c144f47225274b22ea8d638641ed
[1]: https://github.com/zeromq/czmq/commit/53b46d63b41c51e32b5d539aa78ca91846f6a2a1

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 33a339f5c3..9a71c2e0eb 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -16,6 +16,7 @@ inherit cmake pkgconfig
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
 
 EXTRA_OECMAKE = " \
+    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
     -DCMAKECONFIG_INSTALL_DIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/') + "/cmake/"} \
 "
 

