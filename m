Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJym-0000Q7-6p
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:03 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3068013eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zNyTFjuxxo4qVHr/kg4Ix1rMMyMj8Mc6aAeGiTIytZA=;
	b=UVut2tSmr7CNgleVegnoedkFsQwgFoBjPpMvTjcD8Jaf0ef2ctTR270oYGPl6wLChP
	ogZl6/prtOks7Ok7pLQ2wiL812UkY8fkic1YStbY0MVBK63TCpT3t9kF5y7hBRWcDohJ
	RtG0cf1QeT/7R4/QcIWvIDsFQHWQMmmOGa9HYxJRhX1HdTFpOELUkHWntsEwpj3fRBvp
	4Hxt4EIoNx0TUKJiKYZSmztxdqlZumRnnMKazReXVr20L8AvHBQktV2FQagSh0lBcD7w
	06eqsg/zQ/aHpYq/JdasyoIIyoM2/2HdylqmU/uaC2ARiOyU1d96oJ4N1NaXvDvEemXs
	tdLQ==
Received: by 10.14.175.198 with SMTP id z46mr63304847eel.26.1354732292251;
	Wed, 05 Dec 2012 10:31:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm10705806eeg.4.2012.12.05.10.31.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:30 +0100
Message-Id: <b439f0305d07add742373378d5d98fee2ab098bb.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 72/77] gnome-disk-utility: disable failing docs generation
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
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index dab938f..b7be956 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
@@ -17,7 +17,7 @@ SRC_URI += "\
      file://sysrooted-pkg-config.patch \
      "
 
-EXTRA_OECONF += "--disable-scrollkeeper"
+EXTRA_OECONF += "--disable-scrollkeeper --disable-docbook-docs"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
-- 
1.8.0



