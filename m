Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id E07736AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 03:22:06 +0000 (UTC)
Received: by obbnk6 with SMTP id nk6so66152679obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Dec 2015 19:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQBjvu7NLiWyuScUS7HR1iAicZoSJUmH/cfUmWQ2cvc=;
	b=qYo48K+ItaAYPLZRrlnFcpR+zAWvILTBoBv+/UElH+zpvVIPmhFMWeCHyHZQgW74zm
	/FPl0OL3CZ7fPoy0fHPX7EccL5d/D6nJOrpfs9L5oHT7ilWS4t51J+SKT5UjvNc8HV5N
	YtQZIOOgOduFp69T7al9XriivrWL2acpMX912XDyseXgooqADnU6xtY6wtI1ygmV3+9u
	W/I+wcn1QTgykELmxt7Iuot6IAIs6PlJhb7CvfKB0FDROPTSpCQgVkG005HNMt3/0StI
	aomfyvmu0NSqgFrKkYJ1r/gkR3Lat0h+KtHmiwJFj0BbyRDsDsHQhEA+vftL8hoOZTM7
	UI7w==
X-Received: by 10.60.137.137 with SMTP id qi9mr11094071oeb.56.1449199327396;
	Thu, 03 Dec 2015 19:22:07 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ct9sm3533633oec.15.2015.12.03.19.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 19:22:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:21:53 -0800
Message-Id: <1449199316-14048-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-multimedia][PATCH 1/4] mpg123: recipe formatting cleanup, no functional changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Dec 2015 03:22:07 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/mpg123/mpg123_1.21.0.bb     | 42 +++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index 3aa5f3d..a3225f2 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -6,40 +6,42 @@ HOMEPAGE = "http://mpg123.de/"
 BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
+LICENSE = "LGPLv2.1"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
+
 DEPENDS = "tslib audiofile"
 
+SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
+
+SRC_URI[md5sum] = "13a9df5d4e7aa110e4ae27cf30128ce9"
+SRC_URI[sha256sum] = "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527ce9375fcfb15dcba"
+
+inherit autotools pkgconfig
+
 # The options should be mutually exclusive for configuration script.
 # If both alsa and pulseaudio are specified (as in the default distro features)
 # pulseaudio takes precedence.
 PACKAGECONFIG_ALSA = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
-PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
+
 PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
-PACKAGECONFIG[sdl] = ",,libsdl"
-PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[esd] = ",,esound"
 PACKAGECONFIG[jack] = ",,jack"
+PACKAGECONFIG[openal] = ",,openal-soft"
 PACKAGECONFIG[portaudio] = ",,portaudio-v19"
-PACKAGECONFIG[esd] = ",,esound"
+PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
+PACKAGECONFIG[sdl] = ",,libsdl"
 
-# Following are possible sound output modules
-#alsa tinyalsa oss coreaudio sndio sun win32 win32_wasapi os2 esd jack portaudio pulse sdl nas arts openal dummy
+# Following are possible sound output modules:
+# alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse sdl sndio sun tinyalsa win32 win32_wasapi
 AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
 AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
 AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
-AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
-
-LICENSE = "LGPLv2.1"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "13a9df5d4e7aa110e4ae27cf30128ce9"
-SRC_URI[sha256sum] = "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527ce9375fcfb15dcba"
-
-inherit autotools pkgconfig
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
 
 EXTRA_OECONF = " \
     --enable-shared \
-- 
1.9.1


