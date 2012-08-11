Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T09m2-0002eM-9e
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Aug 2012 13:22:30 +0200
Received: by weyr6 with SMTP id r6so1409485wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2012 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IWKC3gO3HLYf+mBUrauI0OfdmcgdDyeNsyToFxlYrnI=;
	b=h5NAq0ss4oxhJirNQmL+xolmIRBUCdMjYgn09AZpcHF8e2yTZDCZEwiN56PpYxUfzM
	yj8KRqSdR49KYcj6bwoIRSZg/tA6mRoTCGIJifFf7PPpgmlHqoJ40T5zagGdPIq5wvTF
	AW0yJ493EOnsB3KEkjKgRsA+1lbRmV5zzlK/OovPVvj4H/9owJnGHsQUjklTNkXeBY90
	ZOmnQAp25DYesSXePflSkV3jU55gvm6ddX1z8ZM5zqipUPX8x80aNKm9tjINd0WRuUl6
	2m+92ETz8Kf0lITpLMSW/asoVGvpQ7mvsxGLDFDUp0+N0zEZ2gTDNfC8cflGhF9fBG7H
	0m1A==
Received: by 10.216.234.100 with SMTP id r78mr2966311weq.107.1344683439165;
	Sat, 11 Aug 2012 04:10:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm4935269wid.1.2012.08.11.04.10.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Aug 2012 04:10:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Aug 2012 13:10:40 +0200
Message-Id: <1344683440-6603-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] midori: add missing libnotify dependency
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
X-List-Received-Date: Sat, 11 Aug 2012 11:22:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/midori/midori_0.4.5.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
index 4cdd82d..7d68720 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native libnotify"
+
+PR = "r1"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-- 
1.7.8.6



