Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 4260F7F2E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 709FA1038D6;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:17 +0200
Message-Id: <20190822171723.18657-12-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 11/17] evolution-data-server: Add PACKAGECONFIG for vala bindings.
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

EDS does offer vala bindings and there are a few GNOME pacakges which
use them. Make it possible to enable them in OE.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-gnome/eds/evolution-data-server_3.32.4.bb     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index b1e177ff9..d8404fec1 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
-inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative upstream-version-is-even
+inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative upstream-version-is-even vala
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
@@ -43,6 +43,7 @@ PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
 PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
 PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
+PACKAGECONFIG[vala] = "-DENABLE_VALA_BINDINGS=ON -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=OFF"
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
@@ -95,6 +96,7 @@ FILES_libcamel = "${libdir}/libcamel-*.so.* \
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
                       ${includedir}/evolution-data-server*/camel \
+                      ${datadir}/vala/vapi/camel-* \
                       ${datadir}/gir-*/Camel-*.gir"
 
 FILES_libebook = "${libdir}/libebook-*.so.* \
@@ -102,6 +104,7 @@ FILES_libebook = "${libdir}/libebook-*.so.* \
 FILES_libebook-dev = "${libdir}/libebook-1.2.so \
                       ${libdir}/pkgconfig/libebook-*.pc \
                       ${datadir}/gir-*/EBook-*.gir \
+                      ${datadir}/vala/vapi/libebook-*.* \
                       ${includedir}/evolution-data-server*/libebook/*.h"
 RRECOMMENDS_libebook = "libedata-book"
 
@@ -110,6 +113,7 @@ FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.* \
 FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
                                ${libdir}/pkgconfig/libebook-contacts-*.pc \
                                ${datadir}/gir-*/EBookContacts-*.gir \
+                               ${datadir}/vala/vapi/libebook-contacts-* \
                                ${includedir}/evolution-data-server*/libebook-contacts/*.h"
 
 FILES_libecal = "${libdir}/libecal-*.so.* \
@@ -140,10 +144,12 @@ FILES_libedataserver = "${libdir}/libedataserver-*.so.* \
                         ${libdir}/girepository-*/EDataServer-*.typelib"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
                             ${libdir}/pkgconfig/libedataserver-*.pc \
+                            ${datadir}/vala/vapi/libedataserver-* \
                             ${includedir}/evolution-data-server-*/libedataserver/*.h"
 
 FILES_libedataserverui = "${libdir}/libedataserverui-*.so.*"
 FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                               ${libdir}/pkgconfig/libedataserverui-*.pc \
                               ${datadir}/gir-*/EDataServerUI-*.gir \
+                              ${datadir}/vala/vapi/libedataserverui-* \
                               ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-- 
2.21.0


