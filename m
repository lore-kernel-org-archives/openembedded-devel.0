Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id A0D387F287
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:27 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 72DC31038D2;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:12 +0200
Message-Id: <20190822171723.18657-7-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 06/17] evolution-data-server: Drop bits related to autotools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 17:17:28 -0000
Content-Transfer-Encoding: 8bit

The package uses cmake nowadays. It has no need for EXTRA_OECONF. The
build process does not produce any la files.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-gnome/eds/evolution-data-server_3.32.4.bb     | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index bab57b044..bd3e4dabb 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -43,9 +43,6 @@ EXTRA_OECMAKE = " \
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
 
-EXTRA_OECONF = "--with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-nntp --disable-gtk-doc"
-
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
 
@@ -96,7 +93,6 @@ FILES_libcamel = "${libdir}/libcamel-*.so.* \
                   ${libdir}/evolution-data-server*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
-                      ${libdir}/evolution-data-server*/camel-providers/*.la \
                       ${includedir}/evolution-data-server*/camel"
 
 FILES_libebook = "${libdir}/libebook-*.so.*"
@@ -124,7 +120,6 @@ FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
 FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                            ${libdir}/pkgconfig/libedata-book-*.pc \
-                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
                            ${includedir}/evolution-data-server-*/libedata-book"
 
 FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
@@ -133,8 +128,7 @@ FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                       ${libdir}/evolution-data-server-*/extensions/libecal*.so"
 FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                           ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal \
-                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
+                          ${includedir}/evolution-data-server-*/libedata-cal"
 
 FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
-- 
2.21.0


