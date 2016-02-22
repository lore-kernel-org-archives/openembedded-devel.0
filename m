Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9E267706C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxYnK017879; Mon, 22 Feb 2016 11:59:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Cb88aNI6LaBs; Mon, 22 Feb 2016 11:59:34 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxUPt017875
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Feb 2016 11:59:31 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aXp9G-0003vb-6W; Mon, 22 Feb 2016 11:59:30 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 11:59:16 +0000
Message-Id: <1456142367-15064-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/12] gthumb: Fix to work with disabled static libs
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
X-List-Received-Date: Mon, 22 Feb 2016 11:59:37 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index a1c0347..0bf1321 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -17,7 +17,7 @@ GNOME_COMPRESS_TYPE="bz2"
 SRC_URI += "file://parallel.patch"
 
 do_install_append () {
-    rm ${D}${libdir}/${BPN}/extensions/*.a
+    rm -f ${D}${libdir}/${BPN}/extensions/*.a
 }
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.5.0


