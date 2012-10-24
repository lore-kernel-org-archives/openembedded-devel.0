Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzJ-00057u-Qu
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:07:53 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so558262wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AlxKHQZQ5XjMZJRjF+x6CAj69d3U8nhwzoo1aefoVXc=;
	b=X+iOQ+FhlWv09F7DnuU3GiGQJmLrUUxxoLJUvv+yk64jdYwhDoWtKlwmJp5JK4gsrM
	6j/dtN1A5UZA9t4hTLIcv2cMzvGidImNReyvQriQuB67WKl6cayhtADfDiHj6UElHShD
	i+oXISq2BywBAgxv9s6GO+aBQ4jmwpfm3YztKcIzklX1o30mkAHKH6GikOlaEG9crgJO
	x0XJr3WNg6LDkRXqWXHmCZmMSzCdu3nokeO9fBqjpKlZ8QNCsg1A3FCVomCv08agxe5f
	X4VZewpjIsXytjBaszFe8gOgRO5wWPjEWRSwEz9PbLPpc1ye4Bky6cZkq2CGnq2PLb8o
	qZaA==
Received: by 10.180.95.97 with SMTP id dj1mr9428634wib.3.1351122868150;
	Wed, 24 Oct 2012 16:54:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dq6sm6974720wib.5.2012.10.24.16.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:23 +0200
Message-Id: <ee2be404726bb419d276275c449fdfbd6cc9751e.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/8] tangogps: inherit gconf
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
X-List-Received-Date: Thu, 25 Oct 2012 00:07:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index 5a4231a..1fb7633 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://tangogps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4 bluez4"
-PR = "r2"
+DEPENDS = "curl gtk+ sqlite3 libexif libsoup-2.4 bluez4"
+PR = "r3"
 
 SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz \
            file://remove.unused.header.patch \
@@ -14,6 +14,6 @@ SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz \
 SRC_URI[md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
 SRC_URI[sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gconf
 
 RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.12.4



