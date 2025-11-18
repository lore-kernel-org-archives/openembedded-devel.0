Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47842CE8D6B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 01:25:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1426.1763429121722882762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 17:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mgnyymqQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763429121; x=1794965121;
  h=from:to:subject:date:message-id;
  bh=RmaGISoXkdYjAxVwAcEXjRDdfGkEErqbLhccp0xFmT0=;
  b=mgnyymqQaS/RW1RMSONTjkRX3XozWEe8qSobY0jQQoBejhQ91rtkMcNG
   QOIoigrNYhwZLpNYnwEpqT5poBz8f7uFj0gFJukUEnRjsr+Eod6aBOUOM
   6gv3IrZBOtKKsGGbVW+eiXr/sKWQTZqNCXpQpp1lru9wsItk+jjuqaOO/
   fm14EjaMEBEz4W3PYaIQhDu2RZgp5/MwKw4XB0U+btZ98WBwkxSX27RW4
   hc1F+nej0bRrgeo3+NtKtJg/NG7HEzXOl4uC7uJk/izL6q1RTzP+3FvMU
   1pO/M581+XWffqEfpcchZZPlH22gYxI+eN1e7LFKrcdvHYXc45bdGG7ga
   g==;
X-CSE-ConnectionGUID: NieOytFnTTioCKiscAjJxg==
X-CSE-MsgGUID: az/yk53lRLKTw00dQBI+iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219538474"
X-IronPort-AV: E=Sophos;i="6.19,313,1754924400"; 
   d="scan'208";a="219538474"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:25:19 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BB1438200BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 01:25:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7EAA114003A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 01:25:19 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BD1181000595
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 01:25:17 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH V2] python3-imageio: upgrade 2.37.0 -> 2.37.2
Date: Tue, 18 Nov 2025 09:25:07 +0800
Message-Id: <20251118012507.7383-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 01:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121795

1.Changelog:
 https://github.com/imageio/imageio/releases/tag/v2.37.2

2.The LICENSE_CHECKSUM changed as date of LICENSE Copyright changed.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...{python3-imageio_2.37.0.bb => python3-imageio_2.37.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.37.0.bb => python3-imageio_2.37.2.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
index 5de9ee466c..582cd348f9 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
@@ -3,10 +3,10 @@ write a wide range of image data, including animated images, video, \
 volumetric data, and scientific formats."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9da78aa88ef5e9acd41f7bb288286273"
 
-SRC_URI[sha256sum] = "71b57b3669666272c818497aebba2b4c5f20d5b37c81720e5e1a56d59c492996"
+SRC_URI[sha256sum] = "0212ef2727ac9caa5ca4b2c75ae89454312f440a756fcfc8ef1993e718f50f8a"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-numpy python3-pillow"
-- 
2.43.0


