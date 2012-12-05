Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJys-0000Um-Mu
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3068080eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qZ6sOwM/BIxOtMkjtnUslEFzWjpClLqoi8QKRIuyPRA=;
	b=PVo6/jigaq6V2lpxyQlFtrK00KT7brwPvBtyWXe20foWh9qTg7JUJ/7m8CaV7RHgIk
	CcBDJ1KswQCZvkBsHmlY1HUKHWyL33MCjNAqZZFDbAgXirpbgWqyBLpkihqnH5IO1DU+
	K5+wU2SqbyofPcuQJT4xG1DB7WvGaAz3ucdQZ1uzKxBJF9nbByihxOw/NiWosAkjk5CA
	Btx59us4MXxthUWumxPGqkquJFcH8X5RZGuOKOeAziQtfFwAjIjIPCtXdLC6IygIQx3I
	GONE45WN5sBoODEbw9X4re9ssYFAzB1UoE/59Dc2y73xcZAvot4Jg+O0uEhqzsCcAiiw
	C43g==
Received: by 10.14.176.66 with SMTP id a42mr63426024eem.34.1354732298742;
	Wed, 05 Dec 2012 10:31:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm10691397eeo.8.2012.12.05.10.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:31 +0100
Message-Id: <8d5148b9b8a618863466a000fc6abc7f7893e0f6.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 73/77] gnome-disk-utility: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 18:46:18 -0000

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
index b7be956..4a3efaf 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
-PR = "r2"
+PR = "r3"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
@@ -21,3 +21,6 @@ EXTRA_OECONF += "--disable-scrollkeeper --disable-docbook-docs"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
-- 
1.8.0



