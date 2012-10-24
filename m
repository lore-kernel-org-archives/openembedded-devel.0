Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzE-00057u-Pr
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:07:49 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so558262wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wfMum9xZWMnqbADI6q7hBPmZ7hSOCaD4Fk8mHWtLNwE=;
	b=KqgD20SczQBWNPfq0d6sAG/wCw7jZRmbURdrJ00t7GZoSLMOitK0iWKBkcsH+FJocP
	R2XHDK3hp5z9UtshngRdDB+1Tud0+iAwiht9Skqj2MM/UDmbipBM0mBUrSXBtlKby5GK
	7n/hzMVaVzpFlRWsk3LsFt77iOEPkEeYFK5AWaIeYX5TMaLEpzvidaJVkAQmduzPlh2T
	JzLjHMqz7As838BzXzuAAa6y6tqpT8Ast5NGmCyTMpfBN2boSGdNTOFqnB0+WSYB3g/U
	1gDX9RjoBBEaLl88u68eoOxb5orrOlOBm8w81LIjS77iWUpb2sfvcF6svGY8emY5tSgH
	47ew==
Received: by 10.180.102.131 with SMTP id fo3mr6032076wib.1.1351122861033;
	Wed, 24 Oct 2012 16:54:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ay10sm7880318wib.2.2012.10.24.16.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:22 +0200
Message-Id: <ff91505baff89759e03972de23e5eed6bc841e28.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/8] foxtrotgps: inherit gconf
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
X-List-Received-Date: Thu, 25 Oct 2012 00:07:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index 0cafdde..62860b8 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "http://www.foxtrotgps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
+DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
 SRC_URI[sha256sum] = "ae9706285510554cc0813ac92522e0d1672b0ddb065307bfacfcff3c328f6adb"
 
-inherit autotools pkgconfig perlnative
+inherit autotools pkgconfig perlnative gconf
 
-PR = "r1"
+PR = "r2"
 
 do_configure_prepend() {
   if [ -f ${S}/configure.in ] ; then
-- 
1.7.12.4



