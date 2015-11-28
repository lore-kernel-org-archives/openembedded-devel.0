Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 630026011F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Nov 2015 04:15:58 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so129576922pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 20:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=jP6bCSuvK0+hzP/wRiP7fXBRHyG+7HqmaGcwOMse0Qo=;
	b=aK5j/vrKWEo2al/Rr6UuaMRsYR6z1brGHURkTusmOX+nj3Xb+gCk0GFjT+wQ9Ef7zW
	10Fx4NSIJLumwOpBK5bJA5ZKeCMP4ukG7yRU+hCz80GqXn8+b8EIyUPsSAr9wpzSNPG/
	cRfBNxH8OKNAnCl4uUFE98M5HhwPdXdlGxm9CWUTKFbIUjyMsYz+cEw9nuKUKquFfxzF
	QB8WGCgkUMUL7vkmoIIVNsHYW82C2nW3l5X7ZK86uD7capN1FslvVzJbgMsCjsdygwAA
	2uFEGSoJFUlOYgWIQPJuUQeTFYdt7Ire4vq7Nr3qWTiLMMMr3YjZnbjhTqaoH7KDeVDC
	Pzlg==
X-Received: by 10.67.24.104 with SMTP id ih8mr607018pad.124.1448684158978;
	Fri, 27 Nov 2015 20:15:58 -0800 (PST)
Received: from Pahoa2.mvista.com (75-163-220-91.clsp.qwest.net.
	[75.163.220.91]) by smtp.gmail.com with ESMTPSA id
	wh10sm37507542pab.2.2015.11.27.20.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Nov 2015 20:15:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Fri, 27 Nov 2015 20:15:52 -0800
Message-Id: <1448684152-26900-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH v3] wireshark: update to version 2.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Nov 2015 04:16:01 -0000

restore PE

updated comments:

QT is the new default GUI for the binary 'wireshark'. This mode is currently disabled in the build.  We build with GTK as the default gui so the resulting binary is now wireshark-gtk.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb}         | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
index eee9f30..7dcc5a7 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
@@ -8,10 +8,10 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
-PE = "1"
+SRC_URI[md5sum] = "5909af2a09a9a3023ba61bc62e787ad2"
+SRC_URI[sha256sum] = "90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd"
 
-SRC_URI[md5sum] = "988a4595a4a87dafb3c4870ea40e89b5"
-SRC_URI[sha256sum] = "357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7"
+PE = "1"
 
 inherit autotools pkgconfig
 
@@ -55,3 +55,5 @@ do_configure_prepend() {
 
 ALLOW_EMPTY_${PN} = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+FILES_${PN} += "${datadir}*"
-- 
2.3.5


