Return-Path: <3yOCaXAMKAN8XBLHPPHMF.DPN@flex--wak.bounces.google.com>
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
	[209.85.160.201])
	by mail.openembedded.org (Postfix) with ESMTP id 7B49F7D088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 02:32:39 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id q12so15600295qtr.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 19:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:in-reply-to:message-id:mime-version:references:subject:from:to
	:cc; bh=gIPfmwkaFamzY2Xvel17RSFh77ZTaFdy+isgsehFiSI=;
	b=vA8/XMQyKamzznzzkYT01W/sLEINc2RGtraSIo0Y5GguTx4gAEqAmOmoz6xug1Ijzy
	bH2v5Q1ZuNmSfWegbnkVXrw/SUbpMk7Aacavl4SHCMPPrtbrFy5GUm2QxyQrTyCAa+uQ
	mEgAEpFbHLP/G+bGeYWhj9jNO1TE2B9hsxlAaMfmJAuhihgz2A76kAWwCdN0e2Ue+Z8k
	YhBjpQZkALso4iCQEVIeRh2o28YOtjgvEjVcLNNI1WpWpvcH7W+5s3f4VzpDOpGwILC+
	PSeGBQwC/otASeBdqv/UquxvIbh3ICJHDKk3wYJJE8p45Khkqb056rjD+W/DjHet9oX0
	rmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=gIPfmwkaFamzY2Xvel17RSFh77ZTaFdy+isgsehFiSI=;
	b=ldSqerPGWBFOB+xzMyCVcUupNN3taxLwFr+pBgiWThlTurZ/lqP0CCW329P17bipiM
	jrapTgs1zoSY4IXuhN+2kJzMyolKr695aWqvrbxwdR+Lvdd+/80De2Np/OcVTEV5UaF+
	lxeC5v2QNjQVZm9l3jVlD0LetvWQ3A5SmWx5buQkaIg6yJ+00OKJx6TnOIQklh9JMQte
	4lvSAcYQfuSr4zUB2RFXzqx8P+SLJJxRVqrNENSh6Qjw/c+bPoXw9LulUciTe4OMmMjp
	a1frUvAHk5skADyUaX55WiDid5472BYKZT7F3QnoWUkI9oWGkJuA7LUqozCG/NJaACdL
	Eevg==
X-Gm-Message-State: APjAAAU/8e0YjjPfIDMedu9IBkoiKu0pnMJb9+eelSfA5/NZBC4zlxzV
	heSGNiqLgGurWz9glhyEbhc+ZO5IvesAEOFZlD9Y9KBSSZoIbQCGbLJOv4xZ1z01JcdsResied6
	aUlAAyrgfr1rtRJTqH71trxItwaoZBJktW0txsVHYrRfpHBOjLqO0LT4h1zKRg9iLuWZlCdjvW1
	Wvw7s=
X-Google-Smtp-Source: APXvYqyJ+F9B0S33Ut4eezq83aXZSWloXKjw2kXgJ0Aj+LHK171imuLygmEsbE+esGzb4h/5ISoUpvA=
X-Received: by 2002:a0c:e5c7:: with SMTP id u7mr29032137qvm.44.1553653960343; 
	Tue, 26 Mar 2019 19:32:40 -0700 (PDT)
Date: Tue, 26 Mar 2019 19:32:35 -0700
In-Reply-To: <20190215014113.52315-1-wak@google.com>
Message-Id: <20190327023235.96966-1-wak@google.com>
Mime-Version: 1.0
References: <20190215014113.52315-1-wak@google.com>
X-Mailer: git-send-email 2.21.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] dbus-broker: 16 -> 18
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
X-List-Received-Date: Wed, 27 Mar 2019 02:32:39 -0000
Content-Type: text/plain; charset="UTF-8"

Also brings in a patch to fix up building against a musl libc that is
not in a released build yet.

This change cleans up a number of things about the build
 - Upstream no longer depends on glib
 - We dont ever runtime depend on reference dbus
 - Docs are disabled by default so we don't need to specify the option
 - There is no native tooling so we shouldn't need a native bbclass
 - No longer depend on gitsm since upstream provides release tarballs

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...ini-Fix-missing-sys-types.h-includes.patch | 42 +++++++++++++++++++
 .../{dbus-broker_git.bb => dbus-broker_18.bb} | 18 ++------
 2 files changed, 46 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
 rename meta-oe/recipes-core/dbus/{dbus-broker_git.bb => dbus-broker_18.bb} (58%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
new file mode 100644
index 000000000..8822e94fd
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
@@ -0,0 +1,42 @@
+From 0bb101ab41334588e366639e7bd41836e86f83be Mon Sep 17 00:00:00 2001
+From: "William A. Kennington III" <wak@google.com>
+Date: Sun, 24 Feb 2019 07:54:31 -0800
+Subject: [PATCH] c-ini: Fix missing sys/types.h includes
+
+Otherwise we see failures for a build against the musl libc which
+doesn't include ssize_t definitions in c standard headers.
+
+Upstream-Status: dbus-broker@a145943ec5d1723647d3ba01ef5d0ef8f9f4a565
+Signed-off-by: William A. Kennington III <wak@google.com>
+---
+ subprojects/c-ini/src/c-ini-reader.c | 1 +
+ subprojects/c-ini/src/c-ini.h        | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/subprojects/c-ini/src/c-ini-reader.c b/subprojects/c-ini/src/c-ini-reader.c
+index 1a25d5a..10de80e 100644
+--- a/subprojects/c-ini/src/c-ini-reader.c
++++ b/subprojects/c-ini/src/c-ini-reader.c
+@@ -7,6 +7,7 @@
+ #include <inttypes.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+ #include "c-ini.h"
+ #include "c-ini-private.h"
+ 
+diff --git a/subprojects/c-ini/src/c-ini.h b/subprojects/c-ini/src/c-ini.h
+index 847e4d5..9c107b2 100644
+--- a/subprojects/c-ini/src/c-ini.h
++++ b/subprojects/c-ini/src/c-ini.h
+@@ -66,6 +66,7 @@ extern "C" {
+ 
+ #include <inttypes.h>
+ #include <stdlib.h>
++#include <sys/types.h>
+ 
+ typedef struct CIniDomain CIniDomain;
+ typedef struct CIniEntry CIniEntry;
+-- 
+2.21.0.392.gf8f6787159e-goog
+
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_18.bb
similarity index 58%
rename from meta-oe/recipes-core/dbus/dbus-broker_git.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_18.bb
index ac0f325a4..af9af182a 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_18.bb
@@ -6,18 +6,13 @@ SECTION = "base"
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
+SRC_URI[sha256sum] = "f29e77a4d7b386e835dbe6379f4308f0503d6077834ba734ea6782359b34cbb9"
+SRC_URI_append_libc-musl = "file://0001-c-ini-Fix-missing-sys-types.h-includes.patch"
 
 inherit meson pkgconfig systemd distro_features_check
 
-EXTRA_OEMESON += "-Ddocs=false"
+DEPENDS = "expat systemd"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -25,8 +20,3 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
-
-RDEPENDS_${PN} = "dbus"
-
-BBCLASSEXTEND = "native"
-
-- 
2.21.0


