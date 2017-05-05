Return-Path: <jobol@nonadev.net>
Received: from edna.lautre.net (edna.lautre.net [80.67.160.88])
	by mail.openembedded.org (Postfix) with ESMTP id 05F7E7017B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 08:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by edna.lautre.net (Postfix) with ESMTP id 414D511B24E;
	Fri,  5 May 2017 10:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1493971654;
	bh=Qu5RfKsyoBIiHmGjLHkAn9TU3QeiuGQ3gZlhf3835Ps=;
	h=From:To:Cc:Subject:Date;
	b=GHquwvbGpN4lPjcEvDGy2THAI3guAyhgWS/xnjTb1s0L/nxZVzArQrL6GDzQ1ed4j
	ebG0w4/Y9eqdg/0O7a00Dq4JmEeKx88QPW7XBcu8rTjtK16bk0T19PpcnVaOFxqsr+
	/Q2LAZQz6pRo9hY5FMKiEKdkmJSZ1J9/4W7CEQ84=
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
	with ESMTP id 27rIccHzjmLC; Fri,  5 May 2017 10:07:32 +0200 (CEST)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by edna.lautre.net (Postfix) with ESMTPA id 948CB11ABC0;
	Fri,  5 May 2017 10:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1493971651;
	bh=Qu5RfKsyoBIiHmGjLHkAn9TU3QeiuGQ3gZlhf3835Ps=;
	h=From:To:Cc:Subject:Date;
	b=JwRJFJGRPki/S4MtCbYCHX8lGxr/d1/fO/Ctr7kjb+fCkzMr1mutQ06ZLqTp2N+Dv
	MRYShlLAlAF7n8413vVZ5JKFFtN4AtePxWQodcaF4BIG2XWiFRkNoFZJorGkt5hCws
	QQilKFN8QjLEH598oBZDh1rHZVgwRXVDlNitDr5M=
From: jobol@nonadev.net
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 May 2017 10:07:18 +0200
Message-Id: <20170505080718.6774-1-jobol@nonadev.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] libmicrohttpd: Fix a segmentation fault on upgrade error
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
X-List-Received-Date: Fri, 05 May 2017 08:07:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a connection upgrade is requested and when the
request sent an error reply, it happened most often
that a segmentation fault occured.

The patch applied here is a backport from the
upstream (see https://gnunet.org/git/libmicrohttpd.git/
commit b4216c60fdb5b48f6cfec416301fc63a1167e6cd).

Change-Id: I6847550ba2c4fc24d5caf8912ac6d5ac89ae01fb
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 .../Check-response-existence-on-upgrade.patch      | 49 ++++++++++++++++++++++
 .../libmicrohttpd/libmicrohttpd_0.9.53.bb          |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
new file mode 100644
index 0000000..a02bbd4
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
@@ -0,0 +1,49 @@
+From: jose.bollo@iot.bzh
+Date: Thu, 4 May 2017 21:47:38 +0200
+Subject: [PATCH] Check response existence on upgrade
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When a connection upgrade is requested and when the
+request sent an error reply, the response is most of
+the time already sent when the test on
+connection->response->upgrade_handler is made, leading
+to dereferencing NULL.
+
+Two possibilities exist:
+
+  NULL == connection->response || NULL == connection->response->upgrade_handler
+
+or
+
+  NULL != connection->response && NULL == connection->response->upgrade_handler
+
+The first is prefered because it is probably safer to close the connection
+in that case.
+
+Upstream-Status: Accepted [https://gnunet.org/git/libmicrohttpd.git/commit/?id=b4216c60fdb5b48f6cfec416301fc63a1167e6cd]
+
+Change-Id: Ie6e7fc165f7fe3635ade0952bb34a0b937d38716
+Signed-off-by: José Bollo <jobol@nonadev.net>
+Signed-off-by: José Bollo <jose.bollo@iot.bzh>
+---
+ src/microhttpd/connection.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/microhttpd/connection.c b/src/microhttpd/connection.c
+index a495524..d39c110 100644
+--- a/src/microhttpd/connection.c
++++ b/src/microhttpd/connection.c
+@@ -882,7 +882,7 @@ keepalive_possible (struct MHD_Connection *connection)
+ #ifdef UPGRADE_SUPPORT
+     if ( (MHD_str_equal_caseless_ (end,
+                                    "upgrade")) &&
+-         (NULL == connection->response->upgrade_handler) )
++         (NULL == connection->response || NULL == connection->response->upgrade_handler) )
+       return MHD_NO;
+ #endif /* UPGRADE_SUPPORT */
+ 
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
index a7f032a..45f2460 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
@@ -9,6 +9,9 @@ SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "5a425e993a0f5295aecb5d6607a1c242"
 SRC_URI[sha256sum] = "9b15ec2d381f44936323adfd4f989fa35add517cccbbfa581896b02a393c2cc4"
 
+FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
+SRC_URI += " file://Check-response-existence-on-upgrade.patch"
+
 inherit autotools lib_package pkgconfig gettext
 
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
-- 
2.9.3


