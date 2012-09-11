Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TBQ07-00009Z-Eg for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 14:55:35 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 1B5D1E00C1;
	Tue, 11 Sep 2012 12:43:04 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 2FAE0701EF1; Tue, 11 Sep 2012 14:43:02 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 14:42:54 +0200
Message-Id: <1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <504D81F8.9020702@dresearch-fe.de>
References: <504D81F8.9020702@dresearch-fe.de>
Subject: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Tue, 11 Sep 2012 12:55:35 -0000

This fixes an error in do_configure step for target and native build.

| checking for BASE_DEPENDENCIES... configure: error: Package requirements (glib-2.0 >= 2.12.0    atk >= 1.9.0    pango >= 1.12.0    cairo >= 1.2.0) were not met:
|
| No package 'atk' found
| No package 'pango' found
| No package 'cairo' found

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/gtk+/gdk-pixbuf_2.10.14.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/gtk+/gdk-pixbuf_2.10.14.bb b/recipes/gtk+/gdk-pixbuf_2.10.14.bb
index c41a2be..e9493f9 100644
--- a/recipes/gtk+/gdk-pixbuf_2.10.14.bb
+++ b/recipes/gtk+/gdk-pixbuf_2.10.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.gtk.org/"
 SECTION = "libs"
 LICENSE = "LGPL"
 PRIORITY = "optional"
-DEPENDS = "libpng gettext glib-2.0"
+DEPENDS = "libpng gettext glib-2.0 atk pango cairo"
 PR = "r2"
 
 S = "${WORKDIR}/gtk+-${PV}"
-- 
1.7.10.4



