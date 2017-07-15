Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB867782C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 01:55:51 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so12308291pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ppCpEpHJhdOLRBBHDE+D4RkY83NBX0xfw1FDeBpnrrQ=;
	b=DfqH/kvpFYDvh2WdgadgtC4aGhygEH4ZWP+hCe76dUQD2JjuZVM3PbJdHsWuvM5eK2
	yJeKvr4TnwRsXr/n5RXhrhGLnHPcmEcdk3cY1tFg6JEs3Mh8CUvABBol3nETv8iE4QdH
	wg0hq42TXeVvtGZ/KOkCBYSrtahKNkaUBjQOgDcF1FZKbtP5xBeQzoPg/B3AtjxCPOdj
	xmCicWxa/fDd72Pb8CSZNxF+KkJZlPZN5HgNplcSSv9gfKznHgImpTvulhs0QDHo8syX
	smVh6e1Y8LS2OktGzyUb16WpevCEspHch/vZafSYX5q2ffdoiZa1nk8Y3xJs/nxIVOvB
	mo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ppCpEpHJhdOLRBBHDE+D4RkY83NBX0xfw1FDeBpnrrQ=;
	b=fIrK8dtK+nsOXvVzbe0QreGm7CtR02FNtKrGMWkAeKPxAgUn/7Q1t6MxGsbMGOLSRZ
	mJl1Cx0PYUnIzCjcNwepmq6vzaSzddi9B94RRH2nVflsuZgf0D9WjJMeaYgss2eWwXWN
	dW13ta9jtZWIonC7mpENj8oczY3M0fqcqIu/vF4yFpoVlbbG5nIBv05WPnBkysFzNgjQ
	eUlE7Y5SXe7xnQHlJs33CJt3gRInW1WkiEatUSvRutKdrZVvNMNuOSgekU1+2udJctac
	gxwPaVUHku3JA2+l+stwNyBa47T3IJH/pgNoW4a73bamzXdbQQ2uiy6Owi4cGSTr9rAl
	oTPw==
X-Gm-Message-State: AIVw112QIPtoBaUFOnhKpxgGN4Ldb+cfExETxrjkgqo05Kwmwvipe6N5
	uZeeM8v5kUMi9EH5
X-Received: by 10.99.67.68 with SMTP id q65mr17292466pga.260.1500083752627;
	Fri, 14 Jul 2017 18:55:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l4sm18189589pgr.21.2017.07.14.18.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 18:55:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 18:55:37 -0700
Message-Id: <20170715015539.31584-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170715015539.31584-1-raj.khem@gmail.com>
References: <20170715015539.31584-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH V2 4/6] metacity: Fix build with musl by defining _GNU_SOURCE
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
X-List-Received-Date: Sat, 15 Jul 2017 01:55:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../metacity/0001-ui-Define-_GNU_SOURCE.patch      | 27 ++++++++++++++++++++++
 .../recipes-gnome/metacity/metacity_2.34.13.bb     |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
new file mode 100644
index 000000000..539d756b3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
@@ -0,0 +1,27 @@
+From e7fd072f0df968f342878b77098e97ff07ed28d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 10:26:31 -0700
+Subject: [PATCH] ui: Define _GNU_SOURCE
+
+it becomes portable across musl and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ui/theme.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ui/theme.c b/src/ui/theme.c
+index 84b57a0..c7eafc8 100644
+--- a/src/ui/theme.c
++++ b/src/ui/theme.c
+@@ -60,6 +60,7 @@
+ #include <gtk/gtk.h>
+ #include <string.h>
+ #include <stdlib.h>
++#define _GNU_SOURCE
+ #define __USE_XOPEN
+ #include <math.h>
+ 
+-- 
+2.13.3
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 662c90db8..370de7000 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -13,7 +13,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI += "file://remove-yelp-help-rules-var.patch"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://remove-yelp-help-rules-var.patch \
+           file://0001-ui-Define-_GNU_SOURCE.patch \
+           "
 SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
 SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
 
-- 
2.13.3


