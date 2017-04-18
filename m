Return-Path: <jobol@nonadev.net>
Received: from edna.lautre.net (edna.lautre.net [80.67.160.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7B27371C56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by edna.lautre.net (Postfix) with ESMTP id 7217D119BBD;
	Tue, 18 Apr 2017 16:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1492524993;
	bh=5YhZrezssNWM3EnN9vdLdXQQDKJngBIJwWtNo7n5AZU=;
	h=From:To:Cc:Subject:Date;
	b=bkuHgqFXjseTmWDkC8j/0jaMbjsXqjzDXpyyPb1txeKWN9s1+I4IDdw9mL4p31g3r
	S9YZpl6G0kyS7hS6uQv9vTNdNKM1vk8kNg9+hYNNq2hYuSnf77uZatIt1JKrincZGF
	Np6srQZJ5m10c7ln9HAamPjIIq1FtoVa2zednO2s=
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
	with ESMTP id VJ4s0zkOxj8Y; Tue, 18 Apr 2017 16:16:32 +0200 (CEST)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by edna.lautre.net (Postfix) with ESMTPA id 40EE5119AD8;
	Tue, 18 Apr 2017 16:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1492524992;
	bh=5YhZrezssNWM3EnN9vdLdXQQDKJngBIJwWtNo7n5AZU=;
	h=From:To:Cc:Subject:Date;
	b=SnV9RtCO081pN2MAn4hJLThkMx/SKtxtNv9/1Otd/IdwIE+E9SC2uBpU8pe7LYGJG
	ewnxd4ri42Yk+l3+NxusLugMwFD+n887nAN1ZSdHwfDviFFl8MWfFjH03A8xlUNrKb
	gd9OhRMKUGe9Jelm8ovL3FXMG4vpQI8WBey1jSq0=
From: jobol@nonadev.net
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 16:16:26 +0200
Message-Id: <20170418141626.11621-1-jobol@nonadev.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] libmicrohttpd: update to version 0.9.53
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
X-List-Received-Date: Tue, 18 Apr 2017 14:16:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

Change-Id: Idc7ef7c532a326eb094b4e557f1a80d4254411d2
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 .../{libmicrohttpd_0.9.52.bb => libmicrohttpd_0.9.53.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.52.bb => libmicrohttpd_0.9.53.bb} (85%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
similarity index 85%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
index b22cc73..a7f032a 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
@@ -6,8 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "767111e817e2497ff92f943c5653497a"
-SRC_URI[sha256sum] = "54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea"
+SRC_URI[md5sum] = "5a425e993a0f5295aecb5d6607a1c242"
+SRC_URI[sha256sum] = "9b15ec2d381f44936323adfd4f989fa35add517cccbbfa581896b02a393c2cc4"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.9.3


