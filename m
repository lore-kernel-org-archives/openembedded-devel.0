Return-Path: <linusja@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8671CC77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 06:35:39 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.3133.1681454137935100226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 23:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=F5SRu9ia;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: linus.jacobson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681454138;
  x=1712990138;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/zZIfqzqtIR5DfBCuw4oU4G++8KpSb2vOks/WiqW1do=;
  b=F5SRu9iadSBjto42l/fJvSpt87DVYL1kTsnQNDYSJz0+PpEw+rYtrIwl
   Aw8kLWd2klZEktgMvy5xs8zM6PZk5F8DO3HAK2hKdKpn1+gliOHENmexv
   yFBEpoKLzb4fCinWoPFPumcsX6KGiYMsf2UUyU4OPx7ZwuQN3YQPO6ITI
   HvZl9M8sMzbExOyLOmPdGAX/kDoxn3tG8iBb3AXMnvCllR5HSDBaX00KZ
   QTiU6w4NSc2o9Q92ou++p80ENNWtnff33MkA48nX3Si6wBsUwMSmIzrgZ
   jNNgxyeoZF55hdwZiAcy5CyiLfAx8ETIo+ICxMBPUmAPIM49TyMS7p2A/
   A==;
From: Linus Jacobson <linusja@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Linus Jacobson <linusja@axis.com>
Subject: [meta-oe][PATCH] khronos-cts: Replace wayland feature dependancy with vulkan
Date: Fri, 14 Apr 2023 08:35:33 +0200
Message-ID: <20230414063533.11913-1-linusja@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 06:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102087

Khronos-cts.inc is used for building vulkan-cts or opengl-es-cts. Even
though vulkan-cts depends on vulkan-loader, which automatically
requires vulkan distro feature, it is more explicitly stated if written
here next to opengl.

Some systems do not support a windowing service (like wayland) but still
might use standard khronos GPU libraries. For these cases, wayland
dependancy is invalid.

Patch replaces the invalid wayland distro feature dependancy with
vulkan for clarity.
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index f9074556f..1fda43521 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake features_check python3native qemu
 
-ANY_OF_DISTRO_FEATURES += "opengl wayland"
+ANY_OF_DISTRO_FEATURES += "opengl vulkan"
 
 DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 
-- 
2.20.1


