Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrxLI-0008Cc-MD
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 20:56:44 +0100
Received: by eekd41 with SMTP id d41so1269592eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7hbcD9ZmJbW4wKZCQApEYi5FRoasuYamE1x1zLSImHw=;
	b=pia/+/J1k3TNWeHdlAaIR9g3zqwxgu7YeFvm/qxUzaSFJWj154s21kIFTfal5tD32d
	wOhss5n0BsoETzRzMSwg5kqkAgKhthqdnQ+KhFmctkdqmlTgQPxDthKw5VJAS64Bls6L
	UGAOGLDnoLZObtAZooSbEaVDM3YdN+LlW4eQQ=
Received: by 10.14.15.222 with SMTP id f70mr84372eef.50.1327952932007;
	Mon, 30 Jan 2012 11:48:52 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id o49sm27840712eeb.7.2012.01.30.11.48.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 11:48:51 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:46:43 +0100
Message-Id: <1327952803-17407-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 1/3] gnome-bluetooth: Depend on virtual/libx11, not libx11.
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
X-List-Received-Date: Mon, 30 Jan 2012 19:56:44 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 80d7712..2b4ccbb 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 PR = "r1"
 
 SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring libx11 libxi"
+DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi"
 
 inherit gnome
 
-- 
1.7.3.4



