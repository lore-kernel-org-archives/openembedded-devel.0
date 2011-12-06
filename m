Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RXp9X-0006gy-7B
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 08:09:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB672Zn3008661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2011 23:02:35 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 5 Dec 2011 23:02:35 -0800
Message-ID: <d7517a289b581675bf56af73d5c78bc92255be30.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323141676.git.xiaofeng.yan@windriver.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 14:45:57 +0800
Date: Tue, 6 Dec 2011 14:58:09 +0800
To: <openembedded-devel@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH 03/10] gtk.inc: Split x11 dependency relationship from DEPENDS
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
X-List-Received-Date: Tue, 06 Dec 2011 07:09:23 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

DEPENDS has some packages related to x11.
I define a variable "X11DEPENDS" to inlude these packages.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 0e5c45c..39a4f4a 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -9,9 +9,10 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
+
+X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
+DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
+           libgcrypt cairo gdk-pixbuf ${X11DEPENDS}"
 
 inherit autotools pkgconfig
 
-- 
1.7.0.4



