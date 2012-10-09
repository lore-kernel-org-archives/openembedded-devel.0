Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TLVhp-00016W-FX for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:02:25 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 6A4C3E022C;
	Tue,  9 Oct 2012 08:49:18 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 5C8DF7041D5; Tue,  9 Oct 2012 10:49:18 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 10:49:16 +0200
Message-Id: <cd110a86574144e0f9580bbc7cd4b4c3b0240710.1349772345.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1349772344.git.sledz@dresearch-fe.de>
References: <cover.1349772344.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] pango-native: add libxrender-native to dependencies
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
X-List-Received-Date: Tue, 09 Oct 2012 09:02:25 -0000

This avoids a link error on build hosts with newer libXrender installation.

| /usr/lib64/gcc/x86_64-suse-linux/4.7/../../../../lib64/libXrender.so:  undefined reference to `_XGetRequest'
| collect2: error: ld returned 1 exit status

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/pango/pango.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
index c54fbad..b5a2649 100644
--- a/recipes/pango/pango.inc
+++ b/recipes/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "x11/libs"
 
 DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv virtual/libx11 libxft gtk-doc cairo"
 
-DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
+DEPENDS_virtclass-native = "glib-2.0-native cairo-native libxrender-native"
 BBCLASSEXTEND = "native"
 
 PACKAGES_DYNAMIC = "pango-module-*"
@@ -20,7 +20,7 @@ RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc"
 RRECOMMENDS_${PN}_virtclass-native = ""
 
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
-- 
1.7.10.4



