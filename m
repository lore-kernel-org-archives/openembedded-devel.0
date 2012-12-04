Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8L-00040y-Kx
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=L8hH8nKrH8CXRijNUmZSLy7LAR0v+ifrtSj0D7olb0Y=;
	b=K1bxJ3CTAfXs/QCcMHRGEx9uy8kEpkgx5XGbIMZVQg8k9U+kUyLxfU9k5Pyt6IYhQ2
	CBRmrtuzdKjfoS68WQIRPkEQGQYh36kawtNH0I35tm2+rNVZXf2SYZHm4aGgiOwRpqVW
	FWBSh5NZMZUXeQVBMWoF0rtEtiKR7wkw34PlLLAlX1YgVZTlQiW1JcM6LLy0wt9J9+l1
	XwufAXHE7+J31wd0tj4E1FS0YwEiS3/N+KFhFTJyV5m3rnsYwkBnXrK5Jqct+3pOQsHM
	3PbIIzaY2PkHhlCuFzAnhbTN8Q7f2bICT/Up63+IziZa7puAnR9e8gJlv/1A0iTQfjpS
	IFag==
Received: by 10.14.172.195 with SMTP id t43mr43042690eel.17.1354586818018;
	Mon, 03 Dec 2012 18:06:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25530203eek.0.2012.12.03.18.06.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:27 +0100
Message-Id: <e7895d2c34278879fd4744d1b9a89d713004584e.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 54/58] libcanberra: package also gtk-3.0 if it gets built
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
X-List-Received-Date: Tue, 04 Dec 2012 02:21:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
index 8b796ac..8a03c99 100644
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
@@ -6,7 +6,7 @@ DEPENDS = "alsa-lib gstreamer gtk+ libtool libvorbis gconf"
 SECTION = "libs/multimedia"
 AUTHOR = "Lennart Poettering"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libcanberra"
-PR = "r1"
+PR = "r2"
 
 inherit autotools vala
 
@@ -42,15 +42,19 @@ FILES_${PN}-gtk = "\
   ${bindir}/* \
   ${libdir}/libcanberra-gtk.so.* \
   ${libdir}/gtk-2.0/modules/* \
+  ${libdir}/gtk-3.0/modules/* \
   ${datadir}/gnome \
   ${datadir}/gdm \
 "
 
 FILES_${PN}-dev += "\
+  ${libdir}/gtk-2.0/modules/*.la \
+  ${libdir}/gtk-3.0/modules/*.la \
   ${libdir}/${P}/*.la \
 "
 
 FILES_${PN}-dbg += "\
   ${libdir}/gtk-2.0/modules/.debug \
+  ${libdir}/gtk-3.0/modules/.debug \
   ${libdir}/${P}/.debug \
 "
-- 
1.8.0



