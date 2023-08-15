Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFD7C04FDF
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:53 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.137583.1692114348792336505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Qqxw+4V8;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1692114349;
  x=1723650349;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Nopwp9FA5zuWIEO+82DpYo3FKqSlwr4nQO3tEOdi4s=;
  b=Qqxw+4V8stL92rawnjHnBZdefICukx6rlSoscMXz39toEvb85NBleeaX
   xN4geXmDUaNETQMKIyH7LXGiuimCAah4m2aMckEWAMiazSm1hOvVYI+dV
   JaVLOQUAOd/IKBguYZs/nA9GQmN2a1cdb417MFSvyyw14iZ6dZChGuK/X
   ecVg3XKCUGNeWIBs7QkysIlar422N8qcWGwH47MeL/S7H7kzJRbaynI2e
   apBkqD0/1ZCgHy+g2ShH1yP8NKMAwZxBgBVwgWBN3T3onXHWYTZkjfdZR
   SKtlGsGexfkfz67HqOoxe31RDAo9MhjQnld6z7SzU7KQV8v83u/hdnZf0
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-oe][PATCH] khronos-cts: Replace wayland feature dependancy with vulkan
Date: Tue, 15 Aug 2023 17:45:40 +0200
Message-ID: <20230815154540.1136380-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 15:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104358

From: Linus Jacobson <linusja@axis.com>

Khronos-cts.inc is used for building vulkan-cts or opengl-es-cts. Even
though vulkan-cts depends on vulkan-loader, which automatically
requires vulkan distro feature, it is more explicitly stated if written
here next to opengl.

Some systems do not support a windowing service (like wayland) but still
might use standard khronos GPU libraries. For these cases, wayland
dependancy is invalid.

Patch replaces the invalid wayland distro feature dependancy with
vulkan for clarity.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 01f4a572f..4fd32d93c 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake features_check python3native qemu
 
-ANY_OF_DISTRO_FEATURES += "opengl wayland"
+ANY_OF_DISTRO_FEATURES += "opengl vulkan"
 
 DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 

