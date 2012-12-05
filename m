Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJyx-0000DF-AN
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2122427eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=z2qlrAsJdy1lctNwifj+VzZFskzDzQUJTNX0sZ1SKZk=;
	b=F7gyzyxbACcmOQwRBWAO6VqhX8DuZE9G0GYKVQhHzQ2XXqpoHBKcMiwac9SDWB/6H2
	Tx32G8qgRoOZmbXAfVCp+J+YhNi8VDjE9r7rjJQIQ3UERN+TqNbCh48tgy0h6TaKGDEG
	xfzYnKTURI1a2mQvpr0pz5N7CzJgLlMhRcXyENTNkIZM74H/t5DgLhWMudUHyR+eQjVX
	6HNMEJFdv76RIY7czC0hHsb/7fbENSaCK6wuJHTrhgfTEGTW4NN9WALelGIkI2atyk/L
	hc0IB6cDP+LgJoGj0yvlpMwKZ8WGWPVhidmq4NXjKyp9W3ZZfYNXl6m8BHX50rJdUUth
	85MA==
Received: by 10.14.203.2 with SMTP id e2mr63302308eeo.20.1354732305413;
	Wed, 05 Dec 2012 10:31:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm10717288eep.1.2012.12.05.10.31.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:32 +0100
Message-Id: <7bd2cf4af810494600e226ae6b88c1d2aa7badcf.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 74/77] gnome-session: disable failing docs generation
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
X-List-Received-Date: Wed, 05 Dec 2012 18:46:15 -0000

* xmlto does not work correctly
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index 6c10156..e1fa519 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -2,17 +2,17 @@ DESCRIPTION = "Gnome session manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r2"
+PR = "r3"
 
 SECTION = "x11/gnome"
 DEPENDS = "libxtst gtk+ glib-2.0 upower dbus-glib gconf pango gdk-pixbuf-native startup-notification"
 
-inherit gnome 
+inherit gnome
 
 SRC_URI[archive.md5sum] = "222bad6b446cb19a6b9028ea24538002"
 SRC_URI[archive.sha256sum] = "22d93ce433fcf9c7ce6b5f36dd81f64e692ea0e41faaa0f61159ddac28c3686a"
 
-EXTRA_OECONF = " --with-gtk=2.0 ac_cv_path_GCONF_SANITY_CHECK=set "
+EXTRA_OECONF = " --with-gtk=2.0 ac_cv_path_GCONF_SANITY_CHECK=set --disable-docbook-docs"
 
 do_configure_append() {
 	for i in $(find ${S} -name "Makefile") ; do
-- 
1.8.0



