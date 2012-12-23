Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkqe-0001r9-JK
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:40 +0100
Received: by mail-ee0-f52.google.com with SMTP id d17so3124208eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=hZ4u/bNkuyfxhgoD1J/pPElqXJbELdIgwAAodU2uo4g=;
	b=qs353dlmH73iBPd38Srql9AT52BS6ZAhRueTN3IffGeUHc5botZOy3px7xG1GqgNr+
	aZvC3yw1JdxZUpxchFQ4FvK9c3QEHnwuQKUlpOfWSJVp8IY9o4qkVfQmM/7HvbYra2m0
	Zt898XW/4bDKCwb8QQnt43EUbHgkmb2urYYWeaQhDk6LWwaKt1QujVyfv6N7riYFyV6f
	9Ha2PvXhkmCiaM6oRnl4iic9wP7byX20HwlKPEHZjkKGl5BtZX1qeJz0IwSB4TBYlMB1
	K+Ce2tFsRB8kbgXiu83tt6TQwFPMwUwuFwQ+GLNubkv8THHkDouNzKjqEgOFNCo/feEU
	zgrQ==
X-Received: by 10.14.215.197 with SMTP id e45mr48445140eep.0.1356265520325;
	Sun, 23 Dec 2012 04:25:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm34620050eel.17.2012.12.23.04.25.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:48 +0100
Message-Id: <7cdb69157e2a1ff456fa0850b646c5b95f7bfd26.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/30] gvfs: disable afc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 12:40:48 -0000

* it's enabled when libimobiledevice is built before gvfs, causing undeterministic and failing builds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 1ee6d6d..48373bc 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -3,10 +3,11 @@ require gvfs.inc
 DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # in case of gnome-disk-utility was alresdy built: avoid double files
-EXTRA_OECONF += "--disable-gdu"
+# afc is enabled when it detects libimobiledevice
+EXTRA_OECONF += "--disable-gdu --disable-afc"
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
-- 
1.8.0.2



