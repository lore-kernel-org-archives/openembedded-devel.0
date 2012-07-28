Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6Oe-0002aC-Gx
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:45:28 +0200
Received: by weyr6 with SMTP id r6so2408122wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UU+JgIPSQp7FuG2fvMHP2SnmPEF6ODvuAqk6MCgOaWo=;
	b=WEg5qBrwLyeKzz34scOZIu8Hppk9AQ0HVFHbbtl2MT9BJzISW0kHZFaEg10G1qPz3w
	n9JhOPk7qGJhdZTweEzQZB5O8feEdhtYzMj0O7Tzv+KKonF5b9XNbmPHQIM1JI3MfpSa
	luJbQqkpXsQ2/+ltcuNLNM/GpUsim2FOGql9LdLoqACZzfW/bnYyeoxBzH9QePdJITbz
	GeN2wXG8AwKgT7nVChflPoKvQBDfT+0hBL28t9T1WJpUE7Cw409Ycea962f0w++ZkKpH
	Lb/10mOb0c/h8v61no93IjGyjpdkpe4WHPy2zRhGL1MKhtIWDyUDRZj2iwfXLvXNgOW1
	5Rnw==
Received: by 10.217.5.72 with SMTP id v50mr3006578wes.101.1343478835554;
	Sat, 28 Jul 2012 05:33:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm6068012wid.1.2012.07.28.05.33.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:15 +0200
Message-Id: <256f95eec467bf6e24853d8b2c770d4e16622085.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] upower: use gobject-introspection-stub instead of -native which was removed in oe-core
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
X-List-Received-Date: Sat, 28 Jul 2012 12:45:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index 312ed58..5a33ab9 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-PR = "r1"
+PR = "r2"
 
-DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspection-native"
+DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspection-stub"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-- 
1.7.8.6



