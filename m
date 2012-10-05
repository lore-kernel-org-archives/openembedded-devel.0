Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TK4Um-000811-6H
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 11:47:00 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so893613wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cWowqdtrVxyNOPCCWzICVEC0XZvO7hndnzoEF+fWEI8=;
	b=piB1lnDANltuaWL9UOODz58DT1C2jnd2PKBF9h9c9njzIHFOujpHueOraiipbPTPKr
	tKm4tOeFkr2xgRddcAi9O0ESGBU9STiV2v2+WLOJV4s9W63Y+W6XfKcUakYKa/S6w0G4
	Toe+Oypj89YxC9ft7QHmfJKcCfP3EzEzBVjMf25B6mumFvXmqxeza3QwdKkpVm8n4/yE
	GBe9efPb9nxOmlZMChqsPyi9XwysS2yyKO4DVgoggbJlPLMnpTm6ayFYZEex8fUxGzm5
	rh78H9yt+AqRm1rL3y65dGlZsR43Q+8sBMdhYWnyJqnhQlXWmh6TRHU/gjVdu9WvIvlJ
	8e1w==
Received: by 10.180.87.34 with SMTP id u2mr2103804wiz.4.1349429640473;
	Fri, 05 Oct 2012 02:34:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm1615038wib.9.2012.10.05.02.33.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 02:33:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 11:33:38 +0200
Message-Id: <8d6035a44500fb2b0bdb7419cba171dfbdb09172.1349429575.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349429575.git.Martin.Jansa@gmail.com>
References: <cover.1349429575.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] gpsd: use chrpath-replacement-native now
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
X-List-Received-Date: Fri, 05 Oct 2012 09:47:00 -0000

* chrpath-native was added to ASSUME_PROVIDED
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030744.html
* it would be better to not use chrpath at all, but build.txt says:
  If you do not have chrpath available, GPSD binaries will be built
  statically.
  ...
  When you are cross-compiling, you'll need chrpath at version 0.14 or
  later for cross-architecture support.  If it's not yet packaged for
  your environment, see http://alioth.debian.org/projects/chrpath/
  and I prefer to stick to upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index eff0dcb..105dbf6 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
+DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-replacement-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+EXTRANATIVEPATH += "chrpath-native"
+
+PR = "r2"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-- 
1.7.12



