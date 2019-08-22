Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 1648D7F287
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id D470B103845;
	Thu, 22 Aug 2019 17:17:28 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:14 +0200
Message-Id: <20190822171723.18657-9-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822171723.18657-1-tworaz@tworaz.net>
References: <20190822171723.18657-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 08/17] evolution-data-server: Drop ENABLE_UOA from EXTRA_OECMAKE.
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

This cmake option is not used by this package anymore.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index 97e87fe78..fb76510ba 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -31,7 +31,6 @@ LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
 
 EXTRA_OECMAKE = " \
     -DENABLE_GOA=OFF \
-    -DENABLE_UOA=OFF \
     -DENABLE_WEATHER=OFF \
     -D${LKSTRFTIME} \
     -DSYSCONF_INSTALL_DIR=${sysconfdir} \
-- 
2.21.0


