Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348F5107526D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 07:13:14 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5517.1773904391601904201
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 00:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.53, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 19 Mar 2026 16:13:09 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO vsl.LGE.NET) (10.218.140.120)
	by 156.147.1.151 with ESMTP; 19 Mar 2026 16:13:08 +0900
X-Original-SENDERIP: 10.218.140.120
X-Original-MAILFROM: thond2009@gmail.com
From: thond2009@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: tho3.nguyen@lge.com,
	Sujeet Nayak <sujeetnayak1976@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCHv2] libnice: make crypto library configurable via PACKAGECONFIG
Date: Thu, 19 Mar 2026 16:13:06 +0900
Message-ID: <20260319071306.3186046-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 07:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125380

From: Sujeet Nayak <sujeetnayak1976@gmail.com>

Move gnutls from a hard dependency to a PACKAGECONFIG option defaulting
to gnutls. This allows users to select openssl as an alternative crypto
library by setting PACKAGECONFIG.

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libnice/libnice_0.1.22.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
index 175e10fdf6..9d79af9828 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
@@ -11,8 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
 
-DEPENDS = "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+DEPENDS = "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
 
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "-Dcrypto-library=gnutls,,gnutls"
+PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,,openssl"
 PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"
 PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"

