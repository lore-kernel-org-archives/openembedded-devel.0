Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F881C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web10.75973.1752492418920998401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=knPv2r3J;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492421; x=1784028421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q35k0sXjD9aSAbGE953punMxpyHsa05kLmTnADzH5HQ=;
  b=knPv2r3JlPano5Ef8U+tUbXTXsXxKRQokIYS1A0Tayd3gotNkI4Hi2ew
   h85T4/lb7kszK4Hoj3EoHCKUllzf1zGBRVr1kFjdqu28LMoFUI3GMFS39
   8rShg1wFa+eqcV99pvtmcF65dGhKDIFO33GtDWAABE8CL00kI1RMHXywq
   Q=;
X-CSE-ConnectionGUID: SyclwokfTyqyJWeAgP7DCg==
X-CSE-MsgGUID: 10oQIWT5Sz+qmQKrnq/nAg==
Received: from 160.46.252.35.spf.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:58 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw3.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:57 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb3.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: l4+/QLvfQHm2UxobQarY1A==
X-CSE-MsgGUID: +EZ8T1dWQJGjT00MUuoxFQ==
X-CSE-ConnectionGUID: X1IWwe2dS2+7CeQN0wWLnA==
X-CSE-MsgGUID: BCn/vZzzTk+x9bFlSRxxNQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 08/10] opengl-es-cts: Allow to build with CMake 4+
Date: Mon, 14 Jul 2025 13:26:33 +0200
Message-ID: <20250714112642.121146-8-Moritz.Haase@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118528

Latest HEAD supports builds with CMake 4+, but the corresponding patch at [0] is
considered to be too invasive to backport. Instead, apply the 'minimum policy
version' override.

[0]: https://github.com/KhronosGroup/Vulkan-Video-Samples/commit/ab3b3b37dc120b383922dde9850cee8d185b45f3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
index 1bcbed1600..a98360c73f 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
@@ -6,7 +6,9 @@ SRCREV_vk-gl-cts = "42e61858e862e153cd0fe36593a8c3f7c16c3275"
 
 require opengl-es-cts-sources.inc
 
-EXTRA_OECMAKE += "-DSELECTED_BUILD_TARGETS="cts-runner deqp-egl deqp-gles2 deqp-gles3 deqp-gles31 deqp-gl-shared de-internal-tests glcts""
+EXTRA_OECMAKE += "-DSELECTED_BUILD_TARGETS="cts-runner deqp-egl deqp-gles2 deqp-gles3 deqp-gles31 deqp-gl-shared de-internal-tests glcts" \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+"
 
 do_install() {
 	install -d ${D}/${CTSDIR}

