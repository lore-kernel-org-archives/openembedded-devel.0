Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzY-0005AM-5T
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:08 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so930618wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jNs99kQYm8CEETOSogSRBVVpU6tMWFv/OtiAqEt519o=;
	b=kbXPDqp4bDByFH6NJ7GLjGWyBhh46PDsNyPaERwbMtZUHmaO3EyouPKNYIo5efDQok
	/UCi4QifWW9avPKQ8CJEfo+7PxgktNHIRPesXwyjG3pWmicWf00IqfJGkNdjhphsFF+M
	TxhnklcY/4j66Im5SzDJD0lrOxL/LlfLWYc0UsSltJqmxZS1vgccrBPCWBmyA1qEeRff
	ymZJammfwTKZ9InxNQqy/Il73IatCj0PwPdQUUv9K0Uion90jvDc5vh/Y1AvinHeJobR
	xECOrI+6hv8rScnAaivdHxrbABaXh69oFPrGLcUElEeWymbltwnw6eycvOmlTOitjgGr
	Qk9A==
Received: by 10.180.89.234 with SMTP id br10mr9429901wib.2.1351122882348;
	Wed, 24 Oct 2012 16:54:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei1sm7866948wid.7.2012.10.24.16.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:25 +0200
Message-Id: <a8db0c6a725967fd90a11ae346003d5efde3c740.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/8] midori: inherit vala
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
X-List-Received-Date: Thu, 25 Oct 2012 00:08:08 -0000

* we need to export XDG_DATA_DIRS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/midori/midori_0.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
index 8b1a982..db2c5e6 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
@@ -2,16 +2,16 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native libnotify"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
 SRC_URI[midori.md5sum] = "3c3f0030611d9126ab90be48d44cab57"
 SRC_URI[midori.sha256sum] = "910f47bd2b5f2998cd4fce45c08f9e282318820b68562d0bade2096b9a17e3ea"
 
-inherit gtk-icon-cache pkgconfig
+inherit gtk-icon-cache pkgconfig vala
 
 do_configure() {
     sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
-- 
1.7.12.4



