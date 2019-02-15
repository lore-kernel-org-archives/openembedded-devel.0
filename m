Return-Path: <3vRhmXAMKAHAkOYUccUZS.Qca@flex--wak.bounces.google.com>
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
	[209.85.222.202])
	by mail.openembedded.org (Postfix) with ESMTP id 147577C613
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 01:41:16 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id z198so6900505qkb.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 17:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=Fnjk757eZnecmwK59NeYdEwxbaC0naIncm9h9qCFyhQ=;
	b=Hq+SQpSIvo5AhPlHxb1u1thhmA8IltrqMVBI0/PMeKNzZdrlitdXnWRx1KPXE4np4m
	FfiqGH+KVD6DWkZkKIV25pZziehscpNYfWWuuN0izei3OPmlJPLzSNxf2jh1obofWBYg
	0YKOz2yJIe4e7LQy1pOxs1TrDMr7gXb97MSfsgDUeZYu0f8VFZLqSTXyDGrfTbkJJUHU
	80pBYlTuKDdJBigHMmBcW3fMft/GYe5vDy39gIOQEDFS/sSLh3XGoSYQdwojigvsG3bo
	az7w0SE6QZX4CbLEZhncWF+L/gZjwtwfPyCYXptob9hMObx0Du29jIDnG1F0lv4s0jqQ
	6wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=Fnjk757eZnecmwK59NeYdEwxbaC0naIncm9h9qCFyhQ=;
	b=FIkVY0/MRBZnCoZIfNKfca8Iqgw7LUq+fwYBpt2tiY/K1sNGzO2xKR1kO30O222vtx
	FQRufbyfJSXunHQ69bidQzdeDKUbnldhwKjytINMFmyfk0xo5aZ1Ja0evyBlRDxxc4A0
	L/vjleOerxMekIxAu0l2i3NS/4dOK+ioUfW7Dd8n+ingwoyfLQkZsR7LT1J/uTsF5ZCc
	GpUFJ9hPE4xA1V94LE9RIPIHnlESimgP67WSCEwR0Gkgfm3hoOHh38DX+BiOdcHdv/1l
	UnKF0MqjL4GV93E75BsFTZO+oF8HMsuWnVLjjlmoiAdTXWXSRu0+xO766pOI2lojZ2nQ
	xc2g==
X-Gm-Message-State: AHQUAuare3BuIapioTDv79qvX3ds2iTnNo7IPgKRrnl8TLWu43bGLgcO
	tY5V2FxOv1z9LYFSBi5ND3zVVfaYfEcq268bg3Zc0bc6aDY6mVbYmUpxypbM4NZmhejvwWuuBqC
	rH+iIfki22thPcpC0w5B4S2+5Eu89RiZA6tp7AFYAHoBsnlbM3nWWka/ohRJiKMVJwU7R4uVI9Q
	F4T3A=
X-Google-Smtp-Source: AHgI3IayPPFVUAcnhOANTJLUmtqTiDBJvvPpUy81SV0TLQPyD7jDQsKDjtxNhMZdSKIR+0jI7s1bzIU=
X-Received: by 2002:a0c:d196:: with SMTP id e22mr3940716qvh.53.1550194877932; 
	Thu, 14 Feb 2019 17:41:17 -0800 (PST)
Date: Thu, 14 Feb 2019 17:41:13 -0800
Message-Id: <20190215014113.52315-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: 16 -> 17
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
X-List-Received-Date: Fri, 15 Feb 2019 01:41:17 -0000
Content-Type: text/plain; charset="UTF-8"

This change cleans up a number of things about the build
 - Upstream no longer depends on glib
 - We dont ever runtime depend on reference dbus
 - Docs are disabled by default so we don't need to specify the option
 - There is no native tooling so we shouldn't need a native bbclass
 - No longer depend on gitsm since upstream provides release tarballs

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../{dbus-broker_git.bb => dbus-broker_17.bb}   | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_git.bb => dbus-broker_17.bb} (60%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
similarity index 60%
rename from meta-oe/recipes-core/dbus/dbus-broker_git.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_17.bb
index ac0f325a4..e940bb656 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_17.bb
@@ -6,18 +6,12 @@ SECTION = "base"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
-DEPENDS = "dbus glib-2.0 expat"
-
-PV = "16+git${SRCPV}"
-SRCREV = "fc874afa0992d0c75ec25acb43d344679f0ee7d2"
-
-SRC_URI = "gitsm://github.com/bus1/dbus-broker;protocol=git"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
+SRC_URI[sha256sum] = "4ec7491745a88ec5112644b0e2b9a0abe9107c85d7650be8988d88efb52da84b"
 
 inherit meson pkgconfig systemd distro_features_check
 
-EXTRA_OEMESON += "-Ddocs=false"
+DEPENDS = "expat systemd"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -25,8 +19,3 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
-
-RDEPENDS_${PN} = "dbus"
-
-BBCLASSEXTEND = "native"
-
-- 
2.20.1


