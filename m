Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6GT-0006fd-NO
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:35:50 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NTV3kufctqONA2uUrlxrm1byo7SeP0Sr8Aa8wcdynPI=;
	b=MJZ8V+aUrj6e8PD3iBtUUs1XehK3c9zJwEeCq2NR+uLT7u+q7WRrylMvaeEkfHu/iH
	brAfSZEDvy47pYWj36UeFv1dz2qur49zcEbz/+SdpFqOgwweAdGe9PdCSctTevo/RFpm
	jvRfTO7cqXt1nC6bSxG8EGQ5KFLBfdU6aKPXQ=
Received: by 10.223.81.196 with SMTP id y4mr13041497fak.6.1319884189434;
	Sat, 29 Oct 2011 03:29:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w27sm2000826fad.13.2011.10.29.03.29.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:29:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:01 +0200
Message-Id: <3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Sat, 29 Oct 2011 10:35:50 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Added LIC_FILES_CHKSUM, and fixed LICENSE

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
new file mode 100644
index 0000000..9be4ffb
--- /dev/null
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Library for interacting with ID3 tags."
+SECTION = "libs/multimedia"
+PRIORITY = "optional"
+DEPENDS = "zlib"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+PR = "r0"
+
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
+           http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
+          "
+
+SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
+SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
+SRC_URI[patch.md5sum] = "805c0320a2efb21c40ce06fa13cd7c4b"
+SRC_URI[patch.sha256sum] = "9f03b59ccc8826a5be55a3dcde2f889067d58bdc72bf846416a198c9b933704c"
-- 
1.7.7.1



