Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AE7C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:26:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.624.1709673980850999265
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mRAViLZs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ96Z089757;
	Tue, 5 Mar 2024 15:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709673969;
	bh=l673WUWuoDaq/iQd6rREuvDZbXCtN0+VCiBc8z7W5qs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mRAViLZsmgF/xB9wiuj4N94r6w9Kg4t8USNjwIxuWWYaRhbqm6Q8XOsJGlQ5Ex0zz
	 lLpAmY2VGid2OgYnHDzavkfrcvMC7BCv6tVZGFgKHhfXBLSSdFXyGFzAdp5Vd71mUv
	 WbBkzRQUsfIC84fMxK9kTxiePEPJUTr06YwecCRw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425LQ9tP084747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 15:26:09 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 15:26:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 15:26:09 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425LQ9nH016733;
	Tue, 5 Mar 2024 15:26:09 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denys@konsulko.com>
Subject: [oe][meta-oe][PATCH 1/2] glmark2: add upstream patch to not care about stencil config
Date: Tue, 5 Mar 2024 15:26:08 -0600
Message-ID: <20240305212609.2054938-2-rs@ti.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305212609.2054938-1-rs@ti.com>
References: <20240305212609.2054938-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 21:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109132

From: Randolph Sapp <rs@ti.com>

The upstream project already patched this, but considering this package
is currently locked to the latest tag, I'll add it here.

This fixes an issue with stencil configs being scored unnecessarily low.
It also addresses a problem when the target config is below 0.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch b/meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch
new file mode 100644
index 0000000000..a9dcc8ef1a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0003-GLVisualConfig-By-default-don-t-care-about-the-stenc.patch
@@ -0,0 +1,103 @@
+From b59ec731c8c7e084b289e4ea92938faaebcc389d Mon Sep 17 00:00:00 2001
+From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
+Date: Wed, 1 Nov 2023 13:43:00 +0200
+Subject: [PATCH] GLVisualConfig: By default don't care about the stencil
+ config component
+
+Our benchmarks don't use a stencil buffer, but its presence doesn't hurt
+either, so don't mark configs that have one as unacceptable. Our scoring
+still favors configs without one, unless the user explicitly specifies
+otherwise with --visual-config.
+
+Upstream-status: Backport 5f23d540342ba69e12afeb6a1ac4f6fd36747975
+---
+ doc/glmark2.1.in         | 2 +-
+ src/gl-visual-config.cpp | 9 ++++++---
+ src/gl-visual-config.h   | 2 +-
+ src/options.cpp          | 6 +++---
+ 4 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/doc/glmark2.1.in b/doc/glmark2.1.in
+index 015ba20..1f4a047 100644
+--- a/doc/glmark2.1.in
++++ b/doc/glmark2.1.in
+@@ -38,7 +38,7 @@ Render to an off-screen surface
+ The visual configuration to use for the rendering target:
+ \'id=ID:red=R:green=G:blue=B:alpha=A:buffer=BUF:stencil=STENCIL:samples=SAMPLES'.
+ The parameters may be defined in any order, and any omitted parameters assume a
+-default value of '0' (id, stencil, samples) or '1' (red, green, blue, alpha, buffer).
++default value of '0' (id, samples), -1 (stencil) or '1' (red, green, blue, alpha, buffer).
+ If 'id' is set to a non-zero value, all other parameters are ignored
+ .TP
+ \fB\-\-reuse\-context\fR
+diff --git a/src/gl-visual-config.cpp b/src/gl-visual-config.cpp
+index de92f93..665f53a 100644
+--- a/src/gl-visual-config.cpp
++++ b/src/gl-visual-config.cpp
+@@ -26,7 +26,7 @@
+ #include <vector>
+ 
+ GLVisualConfig::GLVisualConfig(const std::string &s) :
+-    id(0), red(1), green(1), blue(1), alpha(1), depth(1), stencil(0), buffer(1), samples(0)
++    GLVisualConfig()
+ {
+     std::vector<std::string> elems;
+ 
+@@ -85,7 +85,7 @@ GLVisualConfig::match_score(const GLVisualConfig &target) const
+     score += score_component(blue, target.blue, 4);
+     score += score_component(alpha, target.alpha, 4);
+     score += score_component(depth, target.depth, 1);
+-    score += score_component(stencil, target.stencil, 0);
++    score += score_component(stencil, target.stencil, 1);
+     score += score_component(buffer, target.buffer, 1);
+     score += score_component(samples, target.samples, -1);
+ 
+@@ -135,11 +135,14 @@ GLVisualConfig::score_component(int component, int target, int scale) const
+          * score for all components ranges from [0,MAXIMUM_COMPONENT_SCORE).
+          * If scale > 0, we reward the largest positive difference from target,
+          * otherwise the smallest positive difference from target.
++         * We also reward the smallest positive difference from the target,
++         * if the target < 0, i.e., we don't care about this value.
+          */
+         int diff = std::abs(scale) * (component - target);
+         if (diff > 0)
+         {
+-            score = scale < 0 ? MAXIMUM_COMPONENT_SCORE - diff : diff;
++            score = (scale < 0 || target < 0) ?
++                    MAXIMUM_COMPONENT_SCORE - diff : diff;
+             score = std::min(MAXIMUM_COMPONENT_SCORE, score);
+             score = std::max(0, score);
+         }
+diff --git a/src/gl-visual-config.h b/src/gl-visual-config.h
+index b28473f..013ce14 100644
+--- a/src/gl-visual-config.h
++++ b/src/gl-visual-config.h
+@@ -31,7 +31,7 @@ class GLVisualConfig
+ {
+ public:
+     GLVisualConfig():
+-        id(0), red(1), green(1), blue(1), alpha(1), depth(1), stencil(0), buffer(1), samples(0) {}
++        id(0), red(1), green(1), blue(1), alpha(1), depth(1), stencil(-1), buffer(1), samples(0) {}
+     GLVisualConfig(const std::string &s);
+ 
+     /**
+diff --git a/src/options.cpp b/src/options.cpp
+index 8d1ec16..3a31d3d 100644
+--- a/src/options.cpp
++++ b/src/options.cpp
+@@ -213,9 +213,9 @@ Options::print_help()
+            "                         target: 'id=ID:red=R:green=G:blue=B:alpha=A:buffer=BUF:\n"
+            "                         stencil=STENCIL:samples=SAMPLES'. The parameters may be\n"
+            "                         defined in any order, and any omitted parameters assume a\n"
+-           "                         default value of '0' (id, stencil, samples) or '1' (red,\n"
+-           "                         green, blue, alpha, buffer). If 'id' is set to a non-zero\n"
+-           "                         value, all other parameters are ignored\n"
++           "                         default value of '0' (id, samples), '-1' (stencil) or\n"
++           "                         '1' (red, green, blue, alpha, buffer). If 'id' is set to\n"
++           "                         a non-zero value, all other parameters are ignored\n"
+            "      --reuse-context    Use a single context for all scenes\n"
+            "                         (by default, each scene gets its own context)\n"
+            "  -s, --size WxH         Size of the output window (default: 800x600)\n"
+-- 
+2.44.0
+
-- 
2.44.0


