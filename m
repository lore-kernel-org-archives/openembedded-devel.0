Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5317F295
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 67BAB1038D6;
	Thu, 22 Aug 2019 17:17:30 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:22 +0200
Message-Id: <20190822171723.18657-17-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 16/17] evolution-data-server: Remove unused FILES paterns.
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
X-List-Received-Date: Thu, 22 Aug 2019 17:17:29 -0000
Content-Transfer-Encoding: 8bit

It seems current versions of EDS do not istall anything into
${datadir}/evolution-data-server-1.4. No such directory even exists.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-gnome/eds/evolution-data-server_3.32.4.bb       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 170a69838..10b9d0b63 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -118,8 +118,7 @@ FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
                                ${datadir}/vala/vapi/libebook-contacts-* \
                                ${includedir}/evolution-data-server*/libebook-contacts/*.h"
 
-FILES_libecal = "${libdir}/libecal-*.so.* \
-                 ${datadir}/evolution-data-server-1.4/zoneinfo"
+FILES_libecal = "${libdir}/libecal-*.so.*"
 FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
                      ${includedir}/evolution-data-server*/libecal/*.h \
                      ${includedir}/evolution-data-server*/libical/*.h"
@@ -128,8 +127,7 @@ RRECOMMENDS_libecal = "libedata-cal tzdata"
 FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/dbus-1/services/*.AddressBook.service \
                        ${libdir}/libedata-book-*.so.* \
-                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
-                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
+                       ${libdir}/evolution-data-server-*/extensions/libebook*.so"
 FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                            ${libdir}/pkgconfig/libedata-book-*.pc \
                            ${includedir}/evolution-data-server-*/libedata-book"
-- 
2.21.0


