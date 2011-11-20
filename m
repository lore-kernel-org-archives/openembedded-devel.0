Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cwabbott0@gmail.com>) id 1RSBj9-00045z-Dx
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Nov 2011 19:02:53 +0100
Received: by vbbey12 with SMTP id ey12so1770482vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rpDGt8mE25CCbIqdmZXmESxqM2bV+5wdZJn9+eFDkZc=;
	b=xzhhMphBoReTvlYuvbWDAPLItJSpJ7nyrD7ciAkDUqXClja2SRT3HahiIfJRGiSI7+
	8RPfYHM222jMlOE0CL76TjabP6R/27anxZ4PB//J/iLq6uG+gInJbwZnXCQU+V/1979I
	/bME1l5/ENAO2iY/yDNBd100197wPBfUpn4t8=
Received: by 10.52.22.226 with SMTP id h2mr12305463vdf.46.1321811778240;
	Sun, 20 Nov 2011 09:56:18 -0800 (PST)
Received: from localhost.localdomain (ool-4573101f.dyn.optonline.net.
	[69.115.16.31])
	by mx.google.com with ESMTPS id em10sm10662380vdc.6.2011.11.20.09.56.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:56:17 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Nov 2011 12:56:22 -0500
Message-Id: <1321811782-7133-1-git-send-email-cwabbott0@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-gnome][PATCH] libnotify: add 0.5.2 and make it the default
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
X-List-Received-Date: Sun, 20 Nov 2011 18:02:53 -0000

Versions of libnotify >= 0.6.0 have API changes that break some gnome recipes.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 .../recipes-gnome/libnotify/libnotify_0.5.2.bb     |   10 ++++++++++
 .../recipes-gnome/libnotify/libnotify_0.6.0.bb     |    2 ++
 2 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.5.2.bb

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.5.2.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.5.2.bb
new file mode 100644
index 0000000..5ce0eb6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify_0.5.2.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Send desktop notifications to a notification daemon"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+DEPENDS = "dbus gtk+"
+
+inherit gnome
+SRC_URI[archive.md5sum] = "4361058ae4e28a9ffce6764e7d03acd1"
+SRC_URI[archive.sha256sum] = "1f6f1a2d6a0e009997c7ed31f6197f9bf09e9b45fb9cd54acabceea951d99062"
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
index 45adbd7..e6c4a95 100644
--- a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+"
 
+DEFAULT_PREFERENCE = "-99"
+
 inherit gnome
 SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
 SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
-- 
1.7.5.4



