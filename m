Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN75-0000Dx-FN
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:06:43 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179783eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Gyux09iUm22tX0Do/jL1J9jSfC5Vv7IjJpQN9O0c29E=;
	b=Mvg/m0nhcRps4Lu9jJS+Ts/NxYixnpcOfhM/x/MmoQ9Ebx1W8MUtZ50ZPm3FJLnpBX
	4Kt5Vpc8EPPVR+tUcD3frRvfcZ4ZC2Xl3+4lI0sS+DTh6fFWg1YMs1qXwjYC1Jiq/nAv
	lotAGVQ5bG1wRzmbCrs4dvDwNIRJGCEiaBVaKxHHMCFEktdzuaoYJIBejeHGAG5ZOKcR
	6qnxfMiz9z+s+dkfpKCKiR+dSfYwzmBjM552mmJ9N6vARwK+rvK0f3Lfjo2noYWH+OqI
	hEcJl1DrSkG68bQqKBQqT6wFEqFZfdt5FxOJDJLvvSK4275BuCkVhzvj8VFS+ae+I1CQ
	D4bg==
Received: by 10.14.225.72 with SMTP id y48mr64665698eep.46.1354744339339;
	Wed, 05 Dec 2012 13:52:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm11743439eem.16.2012.12.05.13.52.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:51:59 +0100
Message-Id: <3bb453988e23e329b2323e1db82d33a459ef6c70.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 73/85] gnome-disk-utility: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:06:44 -0000

* WARNING: QA Issue: gnome-disk-utility: Files/directories were installed but not shipped
  /usr/lib/nautilus/extensions-2.0/libnautilus-gdu.la
  /usr/lib/nautilus/extensions-2.0/libnautilus-gdu.a
  /usr/lib/nautilus/extensions-2.0/.debug
  /usr/lib/nautilus/extensions-2.0/.debug/libnautilus-gdu.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 58bf526..595d9dc 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
-PR = "r2"
+PR = "r3"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
@@ -25,3 +25,6 @@ do_configure_prepend() {
 
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
-- 
1.8.0



