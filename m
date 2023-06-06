Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032ABC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:20:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2150.1686028837615174128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=onI3v1ZI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564cKEa010482
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jun 2023 22:20:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=KIRzc7qWTeZt2T2QpdSynf/Xz5aSstFOfWgsYgWro/M=;
 b=onI3v1ZIhiznU4fg8o29CnkV2Y0+N3/d/9WE7k3BArj4Ozjh09Dq8lw1BpbRDJbOhF9D
 rajALCEs9+qc+RR29yMn7hap184qKXeP3rwzPoCJ8vxpphvEpxoIGysKF0fgox/J6AA3
 KZStf0Y+3U8+8Cq0b8Bwe5y9aLYp8zVQGJCDTFrPiet7cV8BfBHG89pW6xsa+pcyOgi2
 4UJBkcp1Pf0JN+YgqR0r3pUCcj/pvgEwckgNSZwvXUXFDH9qmrstl28NpiQ8A1sCq/k4
 nzWAM8U8+2A1IUMFos9S3c24hPPQhyWWYzjP1LqYJgBzvVIKIJEygduiFsyrKh0c1c71 1w== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9vtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 22:20:37 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 22:20:34 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42867
Date: Tue, 6 Jun 2023 05:20:15 +0000
Message-ID: <20230606052015.314199-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Ctuixw8WF7hR0muy8mQNhwSWnAdY7ojO
X-Proofpoint-GUID: Ctuixw8WF7hR0muy8mQNhwSWnAdY7ojO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=849 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103132

A use after free issue was addressed with improved memory management. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web content may lead to arbitrary code execution.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-42867
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
new file mode 100644
index 0000000000..c7d684097d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
@@ -0,0 +1,104 @@
+From 8747a631dff858a27ab1a75edb7f21658c2962e2 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Fri, 2 Jun 2023 10:22:34 +0000
+Subject: [PATCH] RenderElement::updateFillImages should take pointer arguments
+ like other similar functions https://bugs.webkit.org/show_bug.cgi?id=247317
+ rdar://100273147
+
+Reviewed by Alan Baradlay.
+
+* Source/WebCore/rendering/RenderElement.cpp:
+(WebCore::RenderElement::updateFillImages):
+(WebCore::RenderElement::styleDidChange):
+* Source/WebCore/rendering/RenderElement.h:
+
+Canonical link: https://commits.webkit.org/256215@main
+
+CVE: CVE-2022-42867
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4b328fbee2eece853fc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------
+ Source/WebCore/rendering/RenderElement.h   |  2 +-
+ 2 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/rendering/RenderElement.cpp
+index da43bf3d..eb0a9b4c 100644
+--- a/Source/WebCore/rendering/RenderElement.cpp
++++ b/Source/WebCore/rendering/RenderElement.cpp
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDifference(StyleDifference diff)
+     return diff == StyleDifference::Repaint || (diff == StyleDifference::RepaintIfTextOrBorderOrOutline && hasImmediateNonWhitespaceTextChildOrBorderOrOutline());
+ }
+
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer& newLayers)
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer* newLayers)
+ {
+     auto fillImagesAreIdentical = [](const FillLayer* layer1, const FillLayer* layer2) -> bool {
+         if (layer1 == layer2)
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer
+     };
+
+     auto isRegisteredWithNewFillImages = [&]() -> bool {
+-        for (auto* layer = &newLayers; layer; layer = layer->next()) {
++        for (auto* layer = newLayers; layer; layer = layer->next()) {
+             if (layer->image() && !layer->image()->hasClient(*this))
+                 return false;
+         }
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer
+
+     // If images have the same characteristics and this element is already registered as a
+     // client to the new images, there is nothing to do.
+-    if (fillImagesAreIdentical(oldLayers, &newLayers) && isRegisteredWithNewFillImages())
++    if (fillImagesAreIdentical(oldLayers, newLayers) && isRegisteredWithNewFillImages())
+         return;
+
+     // Add before removing, to avoid removing all clients of an image that is in both sets.
+-    for (auto* layer = &newLayers; layer; layer = layer->next()) {
++    for (auto* layer = newLayers; layer; layer = layer->next()) {
+         if (layer->image())
+             layer->image()->addClient(*this);
+     }
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle* a, const RenderStyle* b)
+
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyle* oldStyle)
+ {
+-    updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, m_style.backgroundLayers());
+-    updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, m_style.maskLayers());
+-    updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, m_style.borderImage().image());
+-    updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, m_style.maskBoxImage().image());
+-    updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, m_style.shapeOutside());
++    auto registerImages = [this](auto* style, auto* oldStyle) {
++        if (!style && !oldStyle)
++            return;
++        updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, style ? &style->backgroundLayers() : nullptr);
++        updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, style ? &style->maskLayers() : nullptr);
++        updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, style ? style->borderImage().image() : nullptr);
++        updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, style ? style->maskBoxImage().image() : nullptr);
++        updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, style ? style->shapeOutside() : nullptr);
++    };
++
++    registerImages(&style(), oldStyle);
++
++    // Are there other pseudo-elements that need the resources to be registered?
++    registerImages(style().getCachedPseudoStyle(PseudoId::FirstLine), oldStyle ? oldStyle->getCachedPseudoStyle(PseudoId::FirstLine) : nullptr);
+
+     SVGRenderSupport::styleChanged(*this, oldStyle);
+
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/rendering/RenderElement.h
+index f376cecb..d6ba2cdf 100644
+--- a/Source/WebCore/rendering/RenderElement.h
++++ b/Source/WebCore/rendering/RenderElement.h
+@@ -349,7 +349,7 @@ private:
+     bool shouldRepaintForStyleDifference(StyleDifference) const;
+     bool hasImmediateNonWhitespaceTextChildOrBorderOrOutline() const;
+
+-    void updateFillImages(const FillLayer*, const FillLayer&);
++    void updateFillImages(const FillLayer*, const FillLayer*);
+     void updateImage(StyleImage*, StyleImage*);
+     void updateShapeImage(const ShapeValue*, const ShapeValue*);
+
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..0fce7d0d6e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-42867.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.40.0


