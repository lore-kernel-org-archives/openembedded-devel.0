Return-Path: <clopez@igalia.com>
X-Greylist: delayed 636 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jul 2015 17:08:38 UTC
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 212FD73D0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 17:08:38 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AukFALPKr1VbdWOb/2dsb2JhbABbGYJ8AVNpAa0okEMPh1BMAQEBAQEBgQuPJgEIpzymTY9tgQKEFQWUV4R1hz2CCYZFkEQmY2YBC4IpPDEBAYECgUcBAQE
X-IPAS-Result: AukFALPKr1VbdWOb/2dsb2JhbABbGYJ8AVNpAa0okEMPh1BMAQEBAQEBgQuPJgEIpzymTY9tgQKEFQWUV4R1hz2CCYZFkEQmY2YBC4IpPDEBAYECgUcBAQE
X-IronPort-AV: E=Sophos;i="5.15,523,1432591200"; d="scan'208";a="379629812"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 22 Jul 2015 18:58:01 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim) id 1ZHxLF-0004as-DJ
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 18:58:01 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jul 2015 18:58:00 +0200
Message-Id: <1437584280-730-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser][PATCH] chromium: Include chromium.inc before appending to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2015 17:08:39 -0000

  Otherwise chromium.inc will overwrite the list of DEPENDS.
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 0a73f1e..74986b5 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -16,9 +16,9 @@
 #    * CHROMIUM_WAYLAND_DEPENDS
 #    * CHROMIUM_WAYLAND_GYP_DEFINES
 
+include chromium.inc
 DESCRIPTION = "Chromium browser"
 DEPENDS += "libgnome-keyring"
-include chromium.inc
 SRC_URI = "\
         http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
         file://include.gypi \
-- 
2.1.4


