Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifi-0005A2-HV
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:06 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cZ8rP3v5uxmsyVV/h45zM7VZ0AUH1VlKl20MCPqtk6c=;
	b=LjCCg6O0F8nfOCI2y0H0ivCfpToKL7cy9xqZuGjLnQcfuJ87YfRvNoXfl4poKmOKbX
	a24oGEmN/XAk30IBij4aMagZ0u9TkJ98KdSubX1xfezcm02ayUPmyzpCvjJK91j08his
	NXo5BQiyJuGqKqvdTYIoHvmczzhZvu1F0Jw/w=
Received: by 10.204.6.206 with SMTP id a14mr7464916bka.345.1317648576504;
	Mon, 03 Oct 2011 06:29:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm13215963bkp.10.2011.10.03.06.29.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:15 +0200
Message-Id: <0b18833c07842588e3bb10d13f172148b16de7a1.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 17/25] pidgin: package purple-2/libymsg.so to libpurple-dev
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:06 -0000

* otherwise fails with  ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: libpurple path '/work/armv4t-oe-linux-gnueabi/pidgin-2.7.9-r0.0/packages-split/libpurple/usr/lib/purple-2/libymsg.so'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 9d21976..91ed9a2 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -3,7 +3,7 @@ SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
@@ -37,6 +37,7 @@ FILES_libpurple-dev = "${libdir}/libpurple*.la \
                        ${libdir}/purple-2/*.la \
                        ${libdir}/purple-2/libjabber.so \
                        ${libdir}/purple-2/liboscar.so \
+                       ${libdir}/purple-2/libymsg.so \
                        ${datadir}/aclocal"
 FILES_libpurple-dbg += "${libdir}/.debug/libpurple* \
                         ${libdir}/purple-2/.debug"
-- 
1.7.7



