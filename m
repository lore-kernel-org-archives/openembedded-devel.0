Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 67C6C7F2F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 9571C1038D5;
	Thu, 22 Aug 2019 17:17:30 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:23 +0200
Message-Id: <20190822171723.18657-18-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 17/17] evolution-data-server: Don't use explicit version number for libebook
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

All the other libraries which have version number in their names use
wildcard when listed in FILES. To be consistent do the same for
libebook.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 10b9d0b63..a9c84d7a6 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -103,7 +103,7 @@ FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
 
 FILES_libebook = "${libdir}/libebook-*.so.* \
                   ${libdir}/girepository-*/EBook-*.typelib"
-FILES_libebook-dev = "${libdir}/libebook-1.2.so \
+FILES_libebook-dev = "${libdir}/libebook-*.so \
                       ${libdir}/pkgconfig/libebook-*.pc \
                       ${datadir}/gir-*/EBook-*.gir \
                       ${datadir}/vala/vapi/libebook-*.* \
-- 
2.21.0


