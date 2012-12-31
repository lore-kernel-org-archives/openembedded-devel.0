Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEK-0005xM-1g
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:54 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so6143418eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ri+4Cm1sFfKAhBFNBgbZaHOAoajFyj/P2wB6efmWN/c=;
	b=HmWKOxdT518Ai6LH8f5riN6pzGP/HPqvD4S/0wOACDyZ+hN/gp13veWidNmzk7ofWe
	OuFWFPIRFYxy60pdSZGBzxPx9+UC/vJPRy8zo3FLWaNsGUXb6Pr6IqBQGn3p3G/i9pUE
	wqiADJIGY2HcxzMT+Ij19De2Plom10yjuLbuNjsYevBZtIU3ymUopNbIKTfrP9huhJfi
	G8uOSoHnxf14+8+UI4f4CcK96QPbELDykJATji0duPTNM8YmJYyrmDGrIFelxDPQM+p7
	NXTSQcVHUtn21XoKyBZaQoaB9o2D1R4DmesfI5xBN8sw1E4/RiRl94H6zLnUN0Cwo/Aw
	K2Ag==
X-Received: by 10.14.178.196 with SMTP id f44mr112103616eem.14.1356974272353; 
	Mon, 31 Dec 2012 09:17:52 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:24 +0100
Message-Id: <1356974245-3497-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 09/10] midori: update to 0.4.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.4.6.bb => midori_0.4.7.bb}    |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.6.bb => midori_0.4.7.bb} (86%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
similarity index 86%
rename from meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
index db2c5e6..5b1a959 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
@@ -4,12 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify"
 
-PR = "r2"
-
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "3c3f0030611d9126ab90be48d44cab57"
-SRC_URI[midori.sha256sum] = "910f47bd2b5f2998cd4fce45c08f9e282318820b68562d0bade2096b9a17e3ea"
+SRC_URI[midori.md5sum] = "06db7b88a41e9b2265728960d5e98f35"
+SRC_URI[midori.sha256sum] = "65bf9976733597c405492ce91aa664fd10547cb7df16e0a70f260c7a3e97ea5d"
 
 inherit gtk-icon-cache pkgconfig vala
 
@@ -33,7 +31,6 @@ do_configure() {
 }
 
 PARALLEL_MAKE = ""
-LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
1.7.4.4



