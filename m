Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 35BAB6B79B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 19:13:55 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i12so5220281pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NoWCyna4MaMSCTHLlmoLNN30lt8OQ+5hFAWVJUNA+UA=;
	b=b6rg1HJzVYLMfUOdTjsvdhmIy3X0Qgmg83vkhRr8ZWwIE+OJhKx6M5r/80Kw022Q4a
	ehlNnmdtTf7qR6CsyCgUpSKH5FmIHbZG37liT4UxIpmrTDtMgf7nC2kH4BZJyp0qhpR9
	TZivmzH009Bw7tx8qCvybj5fzxYq87QOpSM7Lo1g7yWFCo9UM+vhKOOHrHfvon/1VVlb
	AJLOPoXx7KwPxGncmk4TUHd5tcMFwGAQXaSEgT0Ngq7t4bHEqURzfDRPJbrVGiuN5XeD
	M4GvhfQ+KKZloHIM81svsZ9S6BFzCz8Tx7y+JvIDDJOt7wg+Vm0KdSMofj395QxaY0OR
	2huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NoWCyna4MaMSCTHLlmoLNN30lt8OQ+5hFAWVJUNA+UA=;
	b=e8tskPsKgECDBA4x7y8bFUy5i7RrdaaSvrZHffaBC7R5KgHvFByxFjumqsYESse8ZN
	bvoAP/6e0Rd4o5/TG6ygSFMNy8AxfbXLbYhcJAtfVTF7e+G9WUl2AAsE2lyApkQGhCYB
	JO3DDNG8mDAPGiGWywLxlorz5ToQweyR9t1eNIgpjOGnYVtrgadDRouaN6CeYIvmm9jF
	/G/1IpSTFYezRp/FdVnzpzEwSIFdh3wPLLsN3nWERI0sBOktcETaTqFillDajgsEs4wn
	8AoxYx6AaZQNbz3/IPG0Mk5L4e4qYHg4AtB4QYd+pLw9TYHjT1eNAvpwZSRlUH8sxRlJ
	EAvw==
X-Gm-Message-State: AA+aEWYZ2s3RzFkbpAYy5A5XhZGkplfo+6CpHQD/vQGr1eQEwZ1XZrCJ
	S/0K5edwChe37xO+JBqM76e4nj6+gbk=
X-Google-Smtp-Source: AFSGD/UAZKEhAKd0mNTSMZpNNy4Qh/OzOfxrfRXczN+B5K+MlhV39kpR+mUthAMgd65aQ/HJJL6GOQ==
X-Received: by 2002:a63:5d14:: with SMTP id r20mr9898133pgb.329.1543778035777; 
	Sun, 02 Dec 2018 11:13:55 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	a10sm14367152pfi.138.2018.12.02.11.13.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 11:13:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 11:13:44 -0800
Message-Id: <20181202191346.15104-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] libvncserver: Update to latest version
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
X-List-Received-Date: Sun, 02 Dec 2018 19:13:55 -0000
Content-Transfer-Encoding: 8bit

From: Eddie James <eajames@linux.ibm.com>

The latest release of libvncserver is almost two years old. A number of
security fixes and enhancements have recently been committed. Since the repo
is stable, point the recipe to the latest commit.

libvncserver switched from autotools to cmake, so update the recipe as
necessary, and add PACKAGECONFIG options to allow a more minimal build and
install.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libvncserver/libvncserver_0.9.11.bb       | 25 -------------------
 .../libvncserver/libvncserver_git.bb          | 23 +++++++++++++++++
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
deleted file mode 100644
index 38dac06e64..0000000000
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "library for easy implementation of a RDP/VNC server"
-HOMEPAGE = "https://libvnc.github.io"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
-
-DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
-PACKAGECONFIG[systemd] = ",,systemd"
-
-RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
-
-inherit distro_features_check autotools binconfig pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
-SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
-SRC_URI[sha256sum] = "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
-
-S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
-
-TARGET_LDFLAGS += "-lgcrypt"
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
new file mode 100644
index 0000000000..25917756fc
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "library for easy implementation of a RDP/VNC server"
+HOMEPAGE = "https://libvnc.github.io"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
+
+PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
+PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
+PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[openssl] = ",,openssl"
+PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
+PACKAGECONFIG[systemd] = ",,systemd"
+PACKAGECONFIG[sdl] = ",,libsdl2"
+PACKAGECONFIG[zlib] = ",,zlib"
+
+inherit cmake
+
+SRC_URI = "git://github.com/LibVNC/libvncserver"
+SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
+
+S = "${WORKDIR}/git"
-- 
2.19.2


