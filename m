Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusFI-0001OE-J7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 22:06:36 +0100
Received: by mail-yw0-f47.google.com with SMTP id q46so3153839yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wV7bphCC7fMEJ4Bqd61+kQo9mx+L+2emilP/EXaBpbU=;
	b=tU8R6cm+bACLWvL9OwO7AA6DBOYNDR+Xe5KzPp6NzPrL69taofNufdXR6X1iBnHghw
	kdkvCFME40VSwZzc1A1Pjxy4fjcjHSPHN1H0AClyzw7fXIkMXPbPnnxXAVYkV1URjmn6
	Vc/kEVAhnoWQvc1WvcAYDfy3xR34R33DtOV4U=
Received: by 10.236.155.226 with SMTP id j62mr34121720yhk.49.1328648316079;
	Tue, 07 Feb 2012 12:58:36 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o61sm30096056yhk.10.2012.02.07.12.58.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 12:58:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 20:58:23 +0000
Message-Id: <155c4592f8890ee811c64a49ddcfc09bd6d40ae7.1328648257.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648257.git.otavio@ossystems.com.br>
References: <cover.1328648257.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/3] udisks: explicitly depends on systemd
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
X-List-Received-Date: Tue, 07 Feb 2012 21:06:36 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 55b115e..9ffaca5 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 systemd"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools systemd
 
-- 
1.7.2.5



