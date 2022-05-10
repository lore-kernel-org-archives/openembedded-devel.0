Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBCDC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 16:08:31 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.783.1652198909166455681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 09:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iJ9EThUU;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1652198909;
  x=1683734909;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0kvn2S5BsE6a+O/YFt8bx2MkcOEjbnNHJyK7/NoZ+7Y=;
  b=iJ9EThUU3C/cD/Zg7AxS8+fi8IHZ7Jdf72iK3xUHgpI0OwmmuaB79ss5
   5grAHekRpU95edf+jEVCwq5GHzS+4OxY4ywlpbvk5UzeV6d8TbQ3GwXnV
   U2P0RXrkEHKCywmyzgJai6SRv9kjdmSyOS29OAFXJnxRYaFc+QrQPNm3u
   0gJGvzHgRmoseJBCLkAsdPtWYZoZTHrRHWtYJpvBl2teVDELpRHUCWNB1
   c4REAN/oYupN2Z1qOy/WFL6QXhptRWsPPX3ZL08fI8Xt8wK49IblzMbSb
   eG6muGMEC23O4Ue4YaB5WnFzzbaN7a6KiGli7sAB7D+S5As+d02aH3t5D
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][kirkstone][meta-oe][PATCH] libwebsockets: Avoid absolute
 paths in *.cmake files in the sysroot
Date: Tue, 10 May 2022 18:08:21 +0200
Message-ID: <20220510160821.7291-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 May 2022 16:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97026

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index a5fcb8d72..2a3a4ebd0 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -41,3 +41,6 @@ RDEPENDS:${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib-
 RDEPENDS:${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib-ev', '', d)}"
 
 RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
+
+# Avoid absolute paths to end up in the sysroot.
+SSTATE_SCAN_FILES += "*.cmake"

