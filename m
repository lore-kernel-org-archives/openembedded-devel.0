Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 424817F287
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:27 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 1807F103876;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:10 +0200
Message-Id: <20190822171723.18657-5-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 04/17] evolution-data-server: Add dedicated packages for libebook-contacts.
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
X-List-Received-Date: Thu, 22 Aug 2019 17:17:27 -0000
Content-Transfer-Encoding: 8bit

Most binary distributions package those libraries separetely. Also do it
in OE.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-gnome/eds/evolution-data-server_3.32.4.bb     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 86595688f..0d63feca9 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -70,7 +70,8 @@ do_compile_prepend() {
 }
 
 
-PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
+PACKAGES =+ "libebook-contacts libebook-contacts-dev \
+             libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
              libedataserver libedataserver-dev \
              libedataserverui libedataserverui-dev"
@@ -103,6 +104,11 @@ FILES_libebook-dev = "${libdir}/libebook-1.2.so \
                       ${includedir}/evolution-data-server*/libebook/*.h"
 RRECOMMENDS_libebook = "libedata-book"
 
+FILES_libebook-contacts = "${libdir}/libebook-contacts-*.so.*"
+FILES_libebook-contacts-dev = "${libdir}/libebook-contacts-*.so \
+                               ${libdir}/pkgconfig/libebook-contacts-*.pc \
+                               ${includedir}/evolution-data-server*/libebook-contacts/*.h"
+
 FILES_libecal = "${libdir}/libecal-*.so.* \
                  ${datadir}/evolution-data-server-1.4/zoneinfo"
 FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
-- 
2.21.0


