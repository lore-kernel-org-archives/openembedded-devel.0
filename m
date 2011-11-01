Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9nm-0008NW-UM
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:34:35 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983585faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Xo9rat07D83RBarfJGyBDlmc6PKTSY/7Fb5gSIy/7JY=;
	b=xQAydk4o7K3srP32XiVc2Y1hJdZJoSbI863qCkMY1dEIcerB9zmsyU/q/RUgtfw7Uz
	afOw3wLeNzvL8areyWN+tvJFUYy2rEHTIEH5iZAUlfeUn7PBiEOZontf7aeZyaBWM/9m
	8Iqi879RCYirduF5/kj0AZqNEyKfE0txJiFLo=
Received: by 10.223.7.14 with SMTP id b14mr36537847fab.10.1320136111236;
	Tue, 01 Nov 2011 01:28:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n25sm43332474fah.15.2011.11.01.01.28.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:39 +0100
Message-Id: <6ea61662a248dc172d2f141559e24ae8fe1aa579.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 05/15] id3lib: import from openembedded classic, version 3.8.3
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
X-List-Received-Date: Tue, 01 Nov 2011 08:34:35 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* Added LIC_FILES_CHKSUM, and fixed LICENSE
* OE-classic commit f2893b80cffc46dad57864eb78b563f0876e6811
* JaMa: stylized by oe-stylize.py, dropped default PR

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
new file mode 100644
index 0000000..2c5e2ae
--- /dev/null
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Library for interacting with ID3 tags."
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "zlib"
+PRIORITY = "optional"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
+           http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
+          "
+SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
+SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
+SRC_URI[patch.md5sum] = "805c0320a2efb21c40ce06fa13cd7c4b"
+SRC_URI[patch.sha256sum] = "9f03b59ccc8826a5be55a3dcde2f889067d58bdc72bf846416a198c9b933704c"
+
+inherit autotools
-- 
1.7.7.1



