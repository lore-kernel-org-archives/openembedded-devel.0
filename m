Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnd-0006fE-KU
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:49 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rrF91bmFhPP9euF3iYpqNQnHHoqhDPvJTRx1y1iZLFY=;
	b=HEXabEUxPFw0DFzkW87eh6xMffgd51zUG3w5bYr9gpIf2zjsxtM8czw/G9R1fPlxLv
	Ww6q4HsWwsNqf8firKuEV4/KKIA8liy1Om8pIGi1wH9VhRzpVcdVSPOug2rFsh9GbZnx
	L6KEQhGsJjVyHAVU2WiOdp9T1CjcsPmDV68SE=
Received: by 10.213.14.143 with SMTP id g15mr1383475eba.82.1327308907965;
	Mon, 23 Jan 2012 00:55:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51267333eef.7.2012.01.23.00.55.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:55:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:22 +0100
Message-Id: <1c8dead397863eefe44a4e9d606babc074b32f73.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 6/8] libsoup-2.4: add unstable version 2.37.2 which is needed for newer webkit-efl
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:49 -0000

* otherwise random runtime crashes can happen, see:
  https://lists.webkit.org/pipermail/webkit-efl/2011-December/000091.html
* this recipe should be removed as soon as there is 2.38 or newer
  version in oe-core
* newer libsoup-2.4 wasn't used because those depend also on unstable
  glib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb

diff --git a/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb b/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
new file mode 100644
index 0000000..5d9b2b7
--- /dev/null
+++ b/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "An HTTP library implementation in C"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+# unstable version
+DEFAULT_PREFERENCE = "-1"
+
+SECTION = "x11/gnome/libs"
+
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
+
+SRC_URI = "${GNOME_MIRROR}/libsoup/2.37/libsoup-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "7737dd5238efd593452ba3c365e63e8c"
+SRC_URI[sha256sum] = "df82c51b67f67c3128979d1f3bf20a8ceeea369b6e43aceb16d576d8fc4e8423"
+
+S = "${WORKDIR}/libsoup-${PV}"
+
+inherit autotools pkgconfig
+
-- 
1.7.8.4



