Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN6z-0000Dh-0q
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:06:43 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179728eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kqp7hh9dH+H+P8Yfe8ARwdMLclQi1FWmQIIYPdgEpu8=;
	b=0oXWAG/c1sVcbgDDgRTgT6Fz3AhKv5LCNBJDpAB6Q2Ef5AqHPXOi4tam4ndhhPzKbF
	XhHn3L9MQ7Clh1tSyb3yGIQGjT6+Jksb9Bwp6wUqDwj0tavHpDHftn67+90AU42+O8p4
	zBWl1q351FGaXoA8K4pYVhKXFtJe/QJXl4HcuK1VHp3WIEpODw7b7Vd/4rP0slENHfkM
	xihpn+NHfP1AAi1TsTaDvAtWD5nXPpBPaLcT5V2EylzMJO9C222GTSqzGsneerUpFw51
	Kh7wjUCr5qAXg206ElbGo/t3KUUjjBKTPB8P0YNH3OYu1RhNLuCtHoOfwdQ+5I9xPA05
	q3Cw==
Received: by 10.14.184.131 with SMTP id s3mr64805015eem.38.1354744332688;
	Wed, 05 Dec 2012 13:52:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm11764613eeo.8.2012.12.05.13.52.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:51:58 +0100
Message-Id: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 72/85] gnome-disk-utility: disable failing docs generation
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

* xmlto does not work correctly
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index dab938f..58bf526 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
@@ -19,5 +19,9 @@ SRC_URI += "\
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
+do_configure_prepend() {
+       sed -i -e "s: help : :g" ${S}/Makefile.am
+}
+
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
-- 
1.8.0



