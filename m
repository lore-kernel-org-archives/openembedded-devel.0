Return-Path: <jobol@nonadev.net>
Received: from edna.lautre.net (edna.lautre.net [80.67.160.88])
	by mail.openembedded.org (Postfix) with ESMTP id D532677FCE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 May 2017 09:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by edna.lautre.net (Postfix) with ESMTP id 0ADEC11CE06;
	Mon, 29 May 2017 11:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1496049471;
	bh=A0EE1VCBF7puHEIs1SKH2uzp+4E6bvrbPTkqJyDXBYA=;
	h=From:To:Cc:Subject:Date;
	b=mMRgA90VkdBbDE1ozr+YTaeCqNXJBOMHIh2DD6YOjLC5Fr1vS4ksu54dNVANgpUIv
	EC/h0yXUPtbEwh9l4syxt5N2qO+8NbYJqkrOvB7o3zh5/OwVJL9B+BXIRZCqSBwF49
	2R+zaWNrFTbz/iNAiuLkZtr6Go8o2pjMXaMZ/oyI=
X-Virus-Scanned: Debian amavisd-new at edna.lautre.net
X-Spam-Flag: NO
X-Spam-Score: -3
X-Spam-Level: 
X-Spam-Status: No, score=-3 tagged_above=-10 required=5.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1] autolearn=ham autolearn_force=no
Received: from edna.lautre.net ([127.0.0.1])
	by localhost (edna.admin.lautre.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZjbGUjbpg2js; Mon, 29 May 2017 11:17:48 +0200 (CEST)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by edna.lautre.net (Postfix) with ESMTPA id 230A011CDB6;
	Mon, 29 May 2017 11:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1496049468;
	bh=A0EE1VCBF7puHEIs1SKH2uzp+4E6bvrbPTkqJyDXBYA=;
	h=From:To:Cc:Subject:Date;
	b=Z+UjPhTIKFtMFSDwZPoryABsFRCVHkIpdxAv9vebz+VheV0cAKR/2yaOcJmwrPmIv
	0qCnY/eovcEiseFgdJ7ZXHDNAyVKVdVbw/9ykhp2IAvhEkYoHf6o8QkBg2oUYQtnec
	v5pNjmNo7xQ8ixFlj28SsfZbIFwDJlLQ1jrl/7t0=
From: jobol@nonadev.net
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 May 2017 11:17:37 +0200
Message-Id: <20170529091737.9228-1-jobol@nonadev.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] libmicrohttpd: update to version 0.9.55
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
X-List-Received-Date: Mon, 29 May 2017 09:17:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

Change-Id: I2a034e9bdd4289f42fadefd0c24d578d52ed0cf0
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 .../Check-response-existence-on-upgrade.patch      | 49 ----------------------
 ...icrohttpd_0.9.53.bb => libmicrohttpd_0.9.55.bb} |  7 +---
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.53.bb => libmicrohttpd_0.9.55.bb} (77%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
deleted file mode 100644
index a02bbd4..0000000
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From: jose.bollo@iot.bzh
-Date: Thu, 4 May 2017 21:47:38 +0200
-Subject: [PATCH] Check response existence on upgrade
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When a connection upgrade is requested and when the
-request sent an error reply, the response is most of
-the time already sent when the test on
-connection->response->upgrade_handler is made, leading
-to dereferencing NULL.
-
-Two possibilities exist:
-
-  NULL == connection->response || NULL == connection->response->upgrade_handler
-
-or
-
-  NULL != connection->response && NULL == connection->response->upgrade_handler
-
-The first is prefered because it is probably safer to close the connection
-in that case.
-
-Upstream-Status: Accepted [https://gnunet.org/git/libmicrohttpd.git/commit/?id=b4216c60fdb5b48f6cfec416301fc63a1167e6cd]
-
-Change-Id: Ie6e7fc165f7fe3635ade0952bb34a0b937d38716
-Signed-off-by: José Bollo <jobol@nonadev.net>
-Signed-off-by: José Bollo <jose.bollo@iot.bzh>
----
- src/microhttpd/connection.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/microhttpd/connection.c b/src/microhttpd/connection.c
-index a495524..d39c110 100644
---- a/src/microhttpd/connection.c
-+++ b/src/microhttpd/connection.c
-@@ -882,7 +882,7 @@ keepalive_possible (struct MHD_Connection *connection)
- #ifdef UPGRADE_SUPPORT
-     if ( (MHD_str_equal_caseless_ (end,
-                                    "upgrade")) &&
--         (NULL == connection->response->upgrade_handler) )
-+         (NULL == connection->response || NULL == connection->response->upgrade_handler) )
-       return MHD_NO;
- #endif /* UPGRADE_SUPPORT */
- 
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
similarity index 77%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
index 45f2460..ee399a7 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
@@ -6,11 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "5a425e993a0f5295aecb5d6607a1c242"
-SRC_URI[sha256sum] = "9b15ec2d381f44936323adfd4f989fa35add517cccbbfa581896b02a393c2cc4"
-
-FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
-SRC_URI += " file://Check-response-existence-on-upgrade.patch"
+SRC_URI[md5sum] = "1c20f84a8b9cf692dd50b558b3571a3a"
+SRC_URI[sha256sum] = "0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.9.3


