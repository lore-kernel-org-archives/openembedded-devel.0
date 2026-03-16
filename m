Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58247EFCBBD
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:42:53 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44808.1773643371712180589
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 23:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 16 Mar 2026 15:42:49 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO vsl.LGE.NET) (10.218.140.120)
	by 156.147.1.127 with ESMTP; 16 Mar 2026 15:42:49 +0900
X-Original-SENDERIP: 10.218.140.120
X-Original-MAILFROM: thond2009@gmail.com
From: thond2009@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: tho3.nguyen@lge.com,
	Sujeet Nayak <sujeetnayak1976@gmail.com>
Subject: [meta-oe][PATCHv2] libnice: make crypto library configurable via PACKAGECONFIG
Date: Mon, 16 Mar 2026 15:42:24 +0900
Message-ID: <20260316064224.2137508-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 06:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125254

From: Sujeet Nayak <sujeetnayak1976@gmail.com>

Move gnutls from a hard dependency to a PACKAGECONFIG option defaulting
to gnutls. This allows users to select openssl as an alternative crypto
library by setting PACKAGECONFIG.

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
---
 meta-oe/recipes-support/libnice/libnice_0.1.23.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
index bcdcf0ad7f..4411de955c 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.23.bb
@@ -14,8 +14,11 @@ SRC_URI[sha256sum] = "618fc4e8de393b719b1641c1d8eec01826d4d39d15ade92679d221c7f5
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/libnice/libnice/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-DEPENDS = "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+DEPENDS = "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
 
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "-Dcrypto-library=gnutls,,gnutls"
+PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,,openssl"
 PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"
 PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
-- 
2.48.1


