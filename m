Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id C7C757F295
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:27 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 9E33B103763;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:13 +0200
Message-Id: <20190822171723.18657-8-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 07/17] evolution-data-server: Add PACKAGECONFIGs for oauth2 and kerberos.
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

Dependencies for both features are present in either oe-core oe
meta-openembedded meta layer. Both features build and work without any
additional modifications.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index bd3e4dabb..97e87fe78 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -30,10 +30,8 @@ LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
 
 EXTRA_OECMAKE = " \
-    -DWITH_KRB5=OFF \
     -DENABLE_GOA=OFF \
     -DENABLE_UOA=OFF \
-    -DENABLE_GOOGLE_AUTH=OFF \
     -DENABLE_WEATHER=OFF \
     -D${LKSTRFTIME} \
     -DSYSCONF_INSTALL_DIR=${sysconfdir} \
@@ -42,6 +40,8 @@ EXTRA_OECMAKE = " \
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
+PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
+PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
-- 
2.21.0


