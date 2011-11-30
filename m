Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RVg6G-000308-AQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:05:08 +0100
Received: by localhost (Postfix, from userid 1000)
	id 6D40A44A5FF; Wed, 30 Nov 2011 09:58:28 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:57:55 +0100
Message-Id: <69186cf59ca68e081a0bf76cee15c6a628764a5d.1322643070.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <45b8af8c3aba62c922c5e438801b6c8cd9c83913.1322643070.git.sledz@dresearch-fe.de>
References: <45b8af8c3aba62c922c5e438801b6c8cd9c83913.1322643070.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1322643070.git.sledz@dresearch-fe.de>
References: <cover.1322643070.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 3/4] gypsy: move generic SRC_URI part to gypsy.inc
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
X-List-Received-Date: Wed, 30 Nov 2011 09:05:08 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gypsy/gypsy.inc    |    2 ++
 recipes/gypsy/gypsy_0.7.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
index 964e336..6c7c942 100644
--- a/recipes/gypsy/gypsy.inc
+++ b/recipes/gypsy/gypsy.inc
@@ -5,6 +5,8 @@ DEPENDS = "glib-2.0 dbus-glib bluez4 libxslt-native"
 
 INC_PR = "r1"
 
+SRC_URI = "http://gypsy.freedesktop.org/releases/${PN}-${PV}.tar.gz;name=gypsy"
+
 inherit autotools pkgconfig
 
 do_configure_prepend () {
diff --git a/recipes/gypsy/gypsy_0.7.bb b/recipes/gypsy/gypsy_0.7.bb
index 054c784..6636961 100644
--- a/recipes/gypsy/gypsy_0.7.bb
+++ b/recipes/gypsy/gypsy_0.7.bb
@@ -2,7 +2,7 @@ require gypsy.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-0.7.tar.gz;name=gypsy \
+SRC_URI += " \
            file://docs-reference-am.patch \
            file://remove-werror.patch \
 "
-- 
1.7.7



