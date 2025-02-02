Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0691C02194
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:24 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.73894.1738532423401043567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FZE1wSPS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250202214021b27a94f339af303f1f-jzmdcn@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250202214021b27a94f339af303f1f
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IrN+bGTIYa+XAMvrM87n4e7dgs0g7WRN+/Gim/9W84s=;
 b=FZE1wSPSqSd8afkmg8yJIUOPc2U6mRw0bCOzyUTmhhucUhKfRsw6PdvEAGRZkzKlzW19XI
 vFrRCHrL2CU6efzt3e7qtsyQHO2iwpN3Y8e5sKyz9PArcyPCPhn4yEm3cPjAeP0CQUHinCZP
 0zkkHzq7PQIyOwFanLfprQW0d/p/A+TEW1wWYLaRBdiEN3wjEs6OqbI62+CS9INtKsubKME6
 8wzBXy2g3VH+ngFV+11PcYabNA5bi2FJ2Al8o5lvFC4AlPCw51OQhCH5wd908z50qZzMmJsF
 VaNpuEVXexs4T81G577WWHH3yWFPIeXpyi2MYr+VVPiKJLMtfu2hkiQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 5/8] protobuf: add MIT to license
Date: Sun,  2 Feb 2025 22:39:07 +0100
Message-Id: <20250202213910.284312-5-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115224

From: Peter Marko <peter.marko@siemens.com>

Third party components have MIT license.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index ded2c9b11b..7a26967dc8 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -4,8 +4,12 @@ efficient yet extensible format. Google uses Protocol Buffers for almost \
 all of its internal RPC protocols and file formats."
 HOMEPAGE = "https://github.com/google/protobuf"
 SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
+    file://third_party/lunit/LICENSE;md5=99f08e72434dfa34fe0581d3dfb2d7f4 \
+    file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
+"
 
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"

