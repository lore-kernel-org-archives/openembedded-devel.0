Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id DF467751B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:35 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id f16-v6so11160680wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PZ3ZhrW8SUYGQwCS1w9Wh47/NR94m2y5ye20cSAGIBI=;
	b=bFVO+BoUVfOsx8xuuBz12Hzql+zzTZazfQB8kEnHJbV0J5kZtTmAAuWRe4URuPiF7g
	CIhh5iWGYPgOJgjzxMGF6w+uGUuuiq+RBAF2yKL19v7OHz3/ABOB5QyiirK2CiwfVsJJ
	t/b8NeTUacAYCtHfX+ndGCg6fSvUDv4gprzHj9ZCHrqDnPZD7WAyXwh7kfu6NQPXJCkD
	nOfdmcbTyV0u/NQ6DZFvECountdNrJQ5Rja+EtxEs/m2qAoZtegwNraYuX8NmDqMg+5q
	auDyWfEhh1LxruR19G00Ic2ngKJrBX4CP1o/9hhyFeEORrNaEs0JhluBJUsBQD+GIiqA
	bFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PZ3ZhrW8SUYGQwCS1w9Wh47/NR94m2y5ye20cSAGIBI=;
	b=atVXY0cnscrWZgjEiJB9qVKt9cVoTk8kIP10n1/6LzcHHo78pDdUy+AAq6bT4IUlMn
	ifKLsruA1yrmf4wV11PBEL+bgJfsEqRBbJsWZnwsX1gh1asED2OqtKsr1OcesXqW5CHd
	8PI5QOemSkFgpFEuGvvlaFLYqvV2cVH92YQzPozk2xlnxtgYq7+RwOu02eK6qTZn7stD
	RvBIsa4Dfv8bI3DKNsPFgSvVp/wcJXkmg/qIrWyta324J9YgzwZUhSkqLSdfWX2ebycO
	DvxDUWjHf+p+Y+FpxT6I5nR0nuqyMZqhxPtZAnIEytMhRVzoUDjPNEGbH3HnmCNIsaBt
	nfEQ==
X-Gm-Message-State: APt69E0YP9Tty3oLZPLlD6lmQAesjmeGim9l/xKdczMUIJXFwiu+SKzJ
	AbrcPPnDfYqzQBBPKTowDVY95A==
X-Google-Smtp-Source: AAOMgpfyHhiWlIJj78zo4gko3WHKoPIX2G5Z7LG7c4SmX5V+K1/QUZ02XoiHfTP3ndX5iwn6PyfglA==
X-Received: by 2002:adf:d842:: with SMTP id k2-v6mr2026386wrl.26.1530360216469;
	Sat, 30 Jun 2018 05:03:36 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:13 +0200
Message-Id: <20180630120315.29414-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] obexd: remove
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it was integrated in bluez very long time ago
* nothing (r)depends on it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../obex/obexd/ssize_t_definition.patch            | 40 ----------------------
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb | 23 -------------
 2 files changed, 63 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
 delete mode 100644 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb

diff --git a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
deleted file mode 100644
index 570cb9ef3..000000000
--- a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fb5056fea9559b3ec3bb61967a112b6c793b700d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Jan 2013 21:33:34 -0800
-Subject: [PATCH] include unistd.h to get ssize_t definitions
-
-Fixes errors like
-
-| In file included from plugins/mas.c:36:0:
-| ./src/obex.h:39:1: error: unknown type name 'ssize_t'
-| ./src/obex.h:49:1: error: unknown type name 'ssize_t'
-| ./src/obex.h:50:1: error: unknown type name 'ssize_t'
-| In file included from plugins/mas.c:38:0:
-| ./src/mimetype.h:36:2: error: expected specifier-qualifier-list before 'ssize_t'
-| In file included from plugins/mas.c:39:0:
-| plugins/filesystem.h:24:1: error: unknown type name 'ssize_t'
-| plugins/mas.c:550:1: error: unknown type name 'ssize_t'
-| plugins/mas.c:557:1: error: unknown type name 'ssize_t'
-| plugins/mas.c: In function 'any_read':
-| plugins/mas.c:560:2: error: unknown type name 'ssize_t'
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- plugins/mas.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plugins/mas.c b/plugins/mas.c
-index 1b18059..b519507 100644
---- a/plugins/mas.c
-+++ b/plugins/mas.c
-@@ -30,6 +30,7 @@
- #include <glib.h>
- #include <fcntl.h>
- #include <inttypes.h>
-+#include <unistd.h>
- 
- #include <gobex/gobex.h>
- #include <gobex/gobex-apparam.h>
diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
deleted file mode 100644
index 6096bed73..000000000
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "OBEX Server and Client"
-# obexd was integrated into bluez5
-DEPENDS = "glib-2.0 dbus libical"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
-           file://ssize_t_definition.patch \
-"
-SRC_URI[md5sum] = "d03cf9bad2983243837f4f6d76ef14a6"
-SRC_URI[sha256sum] = "eaa9d8d9542700e6750918d72a3ce00f8cf3a2771d3e2516efd1be5a05f78582"
-
-inherit autotools-brokensep pkgconfig
-
-PACKAGES =+ "obex-client obex-plugins"
-
-FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
-FILES_obex-client = "${libexecdir}/obex-client \
-                     ${datadir}/dbus-1/services/obex-client.service"
-# currently the plugins are empty
-FILES_obex-plugins = "${libdir}/obex/plugins"
-- 
2.14.4


