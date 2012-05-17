Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUz1Z-00030K-KL
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 13:37:41 +0200
Received: by wgbdr1 with SMTP id dr1so1489963wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/qobl+z3inw73+NtgvsW+vLAIZT+kQZ8cEgZbzjdKVE=;
	b=y7t9ZCBumqJ900QkmVU9sykLv5mLy+nd9TZ1t774fM+2ihB89v6k2hQC38vnvEna1/
	eBybgfHUVUFTLrIMF/IVm/nL55UAMdJSlX8wbjnm6mzQQaFluiqNPkaziQceC/zVnioz
	WEv0B4t9iDLUujK3ywrm9UbAyuLpx2sck8F6r113wv4pMgymy8p9H4KxDSHn8nLHN5Kj
	cm11lkVhnxNeCsoHSW7t5e4eyqlBcF51wVnHabbJKcWMCDXbGCxVu5INS9EBAyjCRCsq
	dJwL/Ir/f3zPzj32E6R5KWZfu7RIVBzKraGgRiSbRWYVMqvI1EBrMLtyMnvgAd2xYo79
	I7DQ==
Received: by 10.180.109.197 with SMTP id hu5mr17357709wib.8.1337254059291;
	Thu, 17 May 2012 04:27:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ga8sm20063901wib.5.2012.05.17.04.27.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 04:27:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2012 13:27:31 +0200
Message-Id: <1337254051-18736-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] pidgin: fix missing quote in FILES_libgnt-dbg
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
X-List-Received-Date: Thu, 17 May 2012 11:37:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 1a35457..db4753e 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -3,7 +3,7 @@ SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
@@ -43,7 +43,7 @@ FILES_libpurple-dbg += "${libdir}/.debug/libpurple* \
                         ${libdir}/purple-2/.debug"
 FILES_libgnt         = "${libdir}/libgnt.so.* ${libdir}/gnt/*.so" 
 FILES_libgnt-dev     = "${libdir}/gnt/*.la" 
-FILES_libgnt-dbg     = "${libdir}/gnt/.debug \
+FILES_libgnt-dbg     = "${libdir}/gnt/.debug"
 FILES_finch          = "${bindir}/finch"
 FILES_finch-dev      = "${libdir}/finch/*.la"
 FILES_finch-dbg      = "${bindir}/.debug/finch \
-- 
1.7.8.6



