Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 701BA7F287
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 9D747103763;
	Thu, 22 Aug 2019 17:17:29 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:18 +0200
Message-Id: <20190822171723.18657-13-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 12/17] evolution-data-server: Turn goa support into PACKAGECONFIG feature.
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

Although gnome-online-accounts is currently not provided by meta-gnome
the feature works fine if the requried recipe is available in another
meta layer. Make it easy to enable goa support in such case.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index d8404fec1..04d6a862c 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -31,7 +31,6 @@ LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
 
 EXTRA_OECMAKE = " \
-    -DENABLE_GOA=OFF \
     -DENABLE_WEATHER=OFF \
     -D${LKSTRFTIME} \
     -DSYSCONF_INSTALL_DIR=${sysconfdir} \
@@ -42,6 +41,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspectio
 PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
 PACKAGECONFIG[oauth2] = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,json-glib webkitgtk"
 PACKAGECONFIG[mitkrb5] = "-DWITH_KRB5=ON,-DWITH_KRB5=OFF,krb5"
+PACKAGECONFIG[goa] = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
 PACKAGECONFIG[introspection] = "-DENABLE_INTROSPECTION=ON,-DENABLE_INTROSPECTION=OFF"
 PACKAGECONFIG[vala] = "-DENABLE_VALA_BINDINGS=ON -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen,-DENABLE_VALA_BINDINGS=OFF"
 
-- 
2.21.0


