Return-Path: <3qpidXAMKAD0vZjfnnfkd.bnl@flex--wak.bounces.google.com>
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
	[209.85.160.202])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD717D212
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 04:01:45 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id v18so1062341qtk.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 21:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=fTDQ3zj1TulFrU0GRks+8WGkS3/D2cKoaD6kB+hbSi4=;
	b=UENtppuM4GIGUMlJtSsC99D3QlFiH0Q++L5u4GIidvLXeLH5Rvp3gpVAFOlb4RHXr3
	fy/Rddo40h9ycv786iUdQVJM5vbdvbacGPaoocUDW2eiIRBCI66iGLvjMj1Vum1E+Awh
	XR36i3j+NM3Zos/u/D3OLtlpQp+toz4rymi5oJ+mBriTwzq/pYjX4Xa/40KKn7OTvbdK
	aO8ZEZomcsY1YfG3THdzXw5D+nAxqZeTanLH+2mrtrQszW17TGwata5gsD72mDYFkdFq
	+CM8lwR90QGbh5afMCOu/GjcwsIbHv1thG4QYcdfCN5/qQQLLmWC6SMV8ZQeblBhiobh
	eFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=fTDQ3zj1TulFrU0GRks+8WGkS3/D2cKoaD6kB+hbSi4=;
	b=HuYPVXU3lst7WSNuhwalWmgp9Qnu6xJTdDlOC6LfrGMsNOLD3AHSUjdlU+71Q1cRRF
	lOD0HD8h8doCdPnU633dH9A5YsscNQ29kOio7XUbbJVOOp/MGy+/o9Sz7ZaQRiC004x+
	Fjwet9ihHpt+wAjGkfA124lT9l4wkdSdDfGw6dc6csqKBF152GLB5l3C2NUGBMfPEFNd
	p63VOcKYtnlI9/7QpKttuqWsyrZljRj1iY1m6gtQ1147LFTenIeXq+9nQIa7bqbmT1En
	gSHz//I5Fri5e1TlshrYfGSiPqx52WJ3w/ucxRTyvEpW2BXztaMBM3W5vroR5n2vlz3L
	MO5g==
X-Gm-Message-State: APjAAAVQ0w/BGzppH6CH/8UC4k+Qeo4PCPrMOUwVv/MYXpME+MxM/rX9
	N7dvkXIgpZ6I3t48J5sGigeNl4h2IpiFKZx96Ah7tPR5A/uqIaOn+TrbyfVL9Pby0M61Hruldyv
	vUaYiZ8J3L+w9ivkmEAHK07A1qpVNgEK7I+KYLCaRYdvUjsR0oRYRKNJLYDg8ESZSYS66EYi0U/
	3uk3w=
X-Google-Smtp-Source: APXvYqwzy7ceO3zszTtmeFqo3SRpdRw79OcDEm/bwA3qJMo6LR3LUZEgwgyduP6dEuJL7UdYPZa+xHQ=
X-Received: by 2002:a05:620a:164e:: with SMTP id
	c14mr3331517qko.38.1553832106937; 
	Thu, 28 Mar 2019 21:01:46 -0700 (PDT)
Date: Thu, 28 Mar 2019 21:01:43 -0700
Message-Id: <20190329040143.22150-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: 18 -> 19
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
X-List-Received-Date: Fri, 29 Mar 2019 04:01:46 -0000
Content-Type: text/plain; charset="UTF-8"

Drops the musl compat patch which is upstream in version 19

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...ini-Fix-missing-sys-types.h-includes.patch | 42 -------------------
 .../{dbus-broker_18.bb => dbus-broker_19.bb}  |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
 rename meta-oe/recipes-core/dbus/{dbus-broker_18.bb => dbus-broker_19.bb} (75%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
deleted file mode 100644
index 8822e94fd..000000000
--- a/meta-oe/recipes-core/dbus/dbus-broker/0001-c-ini-Fix-missing-sys-types.h-includes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0bb101ab41334588e366639e7bd41836e86f83be Mon Sep 17 00:00:00 2001
-From: "William A. Kennington III" <wak@google.com>
-Date: Sun, 24 Feb 2019 07:54:31 -0800
-Subject: [PATCH] c-ini: Fix missing sys/types.h includes
-
-Otherwise we see failures for a build against the musl libc which
-doesn't include ssize_t definitions in c standard headers.
-
-Upstream-Status: dbus-broker@a145943ec5d1723647d3ba01ef5d0ef8f9f4a565
-Signed-off-by: William A. Kennington III <wak@google.com>
----
- subprojects/c-ini/src/c-ini-reader.c | 1 +
- subprojects/c-ini/src/c-ini.h        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/subprojects/c-ini/src/c-ini-reader.c b/subprojects/c-ini/src/c-ini-reader.c
-index 1a25d5a..10de80e 100644
---- a/subprojects/c-ini/src/c-ini-reader.c
-+++ b/subprojects/c-ini/src/c-ini-reader.c
-@@ -7,6 +7,7 @@
- #include <inttypes.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
- #include "c-ini.h"
- #include "c-ini-private.h"
- 
-diff --git a/subprojects/c-ini/src/c-ini.h b/subprojects/c-ini/src/c-ini.h
-index 847e4d5..9c107b2 100644
---- a/subprojects/c-ini/src/c-ini.h
-+++ b/subprojects/c-ini/src/c-ini.h
-@@ -66,6 +66,7 @@ extern "C" {
- 
- #include <inttypes.h>
- #include <stdlib.h>
-+#include <sys/types.h>
- 
- typedef struct CIniDomain CIniDomain;
- typedef struct CIniEntry CIniEntry;
--- 
-2.21.0.392.gf8f6787159e-goog
-
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_18.bb b/meta-oe/recipes-core/dbus/dbus-broker_19.bb
similarity index 75%
rename from meta-oe/recipes-core/dbus/dbus-broker_18.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_19.bb
index af9af182a..82d8b8ba6 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_18.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_19.bb
@@ -7,8 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f29e77a4d7b386e835dbe6379f4308f0503d6077834ba734ea6782359b34cbb9"
-SRC_URI_append_libc-musl = "file://0001-c-ini-Fix-missing-sys-types.h-includes.patch"
+SRC_URI[sha256sum] = "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
 
 inherit meson pkgconfig systemd distro_features_check
 
-- 
2.21.0


