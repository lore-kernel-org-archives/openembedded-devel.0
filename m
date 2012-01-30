Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrxM2-0008KO-VT
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 20:57:31 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1269723eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KBCZn97jj2TE1Svc1g1gJU9MjzHyFImyhc4aNhcrDDY=;
	b=MJk+dfqnjNjYulcHZoQXDqvTBHj+eF5mbBUDkChLloTCJY1zjCrLSit3EVTbLq4f20
	CFYgDd4KEdgtEOssTqMTYYpESAttoLMTQFKaWIw0UTkAGwpiNUHXKeTdAwMx10yGXo74
	VDcTEr9P+yLMAc+L55qRZTjFsb3SqWsMVY0Jk=
Received: by 10.14.13.204 with SMTP id b52mr87558eeb.24.1327952980405;
	Mon, 30 Jan 2012 11:49:40 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id c16sm76491950eei.1.2012.01.30.11.49.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 11:49:39 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:47:35 +0100
Message-Id: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Mon, 30 Jan 2012 19:57:31 -0000

Without it postinst script for libpurple fails when gconf is not installed:
//var/lib/opkg/info/libpurple.postinst: line 8: gconftool-2: command not found

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 1a35457..305c116 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -3,7 +3,7 @@ SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
@@ -30,6 +30,8 @@ OE_LT_RPATH_ALLOW[export]="1"
 
 PACKAGES =+ "libpurple-dbg libpurple-dev libpurple libgnt-dbg libgnt libgnt-dev finch-dbg finch finch-dev ${PN}-data"
 
+RDEPENDS_libpurple = "gconf"
+
 LEAD_SONAME = "libpurple.so.0"
 FILES_libpurple     = "${libdir}/libpurple*.so.* ${libdir}/purple-2 ${bindir}/purple-* ${sysconfdir}/gconf/schemas/purple* ${datadir}/purple/ca-certs"
 FILES_libpurple-dev = "${libdir}/libpurple*.la \
-- 
1.7.3.4



