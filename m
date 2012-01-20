Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RoMpx-0004Zu-AB
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 23:21:33 +0100
Received: by eaa1 with SMTP id 1so309933eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0YCLvm5Wna31ANfgsD0uoUl6H+x3GmqOaylCy/EPDyk=;
	b=DDBW8Vb9XVXTY2OvMJ4ZhBQ0Hkb43tX+S/U3PViPz47ZXLDZ9fOpLqu80POEV1bt4/
	BuAv5yda80UMGeB2AoDF16+wrvzcspnzvLcIwPRj3Ag9FyejHA0bcsaWYmdyzenDMWcJ
	W1qeQHgK4Uw3HWp2Zf/CN9oSnSznkT2jgjfvs=
Received: by 10.213.10.136 with SMTP id p8mr32490ebp.91.1327097632084;
	Fri, 20 Jan 2012 14:13:52 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id 28sm17093874eed.0.2012.01.20.14.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 14:13:51 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 23:12:02 +0100
Message-Id: <1327097522-18915-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] Add missing gobject-introspection-native dependency for upower.
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
X-List-Received-Date: Fri, 20 Jan 2012 22:21:33 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index a5496d1..312ed58 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 PR = "r1"
 
-DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit"
+DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspection-native"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-- 
1.7.3.4



