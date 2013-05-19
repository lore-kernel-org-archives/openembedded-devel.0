Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17b-00005P-Ij
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:49 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so3182782eaj.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=GRsTHfoFqQBGIS9eMKXW3CRazVJPZD+QY1TMygPK9rk=;
	b=IcI5N4L4MF2Z6TQNpzJgbclLlYhmmLoRDt5mzm57NrFTQzfqVT4H7L2XrnIHYpY/HI
	kMFsOcuD16SyyNX2CA5ZjVWF6mkPEeotIAgWEpIh5KQfdV+GPf/GWe4T6rTCrnROSDtO
	HXwX38cl+5XHBXGAqDf9vbzNWZCGhNmqIOXn9JGtijiOOUy6jT3byjuUZWdxe+1+Ci2J
	CBv8M5iHxc2EvxuB/rb71v997tjpd1o5vRRo4snAEye2QTk07TrkdVicl3U0MmqYlpXL
	kjHlnS5PekQF8lpXc/hB628H3HogvUymhpXwWw2/YioiRkSnvL40yLynXhlkmk74djxi
	7M1Q==
X-Received: by 10.15.93.193 with SMTP id w41mr142378954eez.22.1368959249340;
	Sun, 19 May 2013 03:27:29 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:06 +0200
Message-Id: <1368959233-28288-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 04/11] glibmm: update to 2.36.2
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
X-List-Received-Date: Sun, 19 May 2013 10:45:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/glib-2.0/glibmm/glib-2.32.patch   |   10 ----------
 .../{glibmm_2.28.2.bb => glibmm_2.36.2.bb}         |    9 +++------
 2 files changed, 3 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.28.2.bb => glibmm_2.36.2.bb} (81%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch b/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
deleted file mode 100644
index 50b7367..0000000
--- a/meta-oe/recipes-core/glib-2.0/glibmm/glib-2.32.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- glibmm-2.28.2.orig/glib/glibmm/varianttype.cc	2011-06-09 20:29:48.000000000 +0200
-+++ glibmm-2.28.2/glib/glibmm/varianttype.cc	2012-05-06 08:15:32.760680295 +0200
-@@ -23,7 +23,6 @@
- 
- #include <glibmm/varianttype.h>
- #include <glibmm/utility.h>
--#include <glib/gvarianttype.h>
- 
- namespace Glib
- {
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
similarity index 81%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
index 0bdaa80..9735d6a 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
@@ -8,17 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
 inherit autotools pkgconfig
 
-PR = "r3"
-
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = " \
-    ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.bz2 \
+    ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
-    file://glib-2.32.patch \
 "
-SRC_URI[archive.md5sum] = "cf33d1861d09fb2952a6a1d69e0502e3"
-SRC_URI[archive.sha256sum] = "7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
+SRC_URI[md5sum] = "5c96d566c22c209d7b9cbf2344c469e9"
+SRC_URI[sha256sum] = "f15b65bf5740257be03c69f2f5ae71436ac3011ebeb02274b2b99b796c6837cf"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
1.7.4.4



