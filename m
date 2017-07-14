Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A52278220
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:11 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so11464604pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vo7R5F2Q8eSNDgI8m2rLMrkRzxSHGhMhsRa1Zh19sAo=;
	b=iJaEIw4qNHY7WO1vrie0YqrpwXawM6Gar1G2Mctny5e0Nxi8Eyr254s+yxyqRExncP
	g9bWS9Z/0AQgTOdfEPpjYMhVh/C2K5hBUFzEk04IehgETq758teGl0WyRU1PhFNJc0K+
	9vnxFVBdSaSnW2Liol/4e7f/je8DpyM8uOEoG9hHMMlT/51Gk9gWBNYPO2FUCHs++AmZ
	TeN5h89uE8SsO4gBXYyq1JBxH7IZbuQTRkjBP31KrkVo/GMnJR6poTa5MsatSsb1FsJw
	49gxypLZsZwZK3HEs2Nbcdjn81t5EjrtW8A8taTSOOI/DOJRjza8WvCAmSnEmFfmy50d
	XykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vo7R5F2Q8eSNDgI8m2rLMrkRzxSHGhMhsRa1Zh19sAo=;
	b=LaaEf8TSkZf0+o9qJGxgNcVcfQo6YHOr/ygUeaA0akBLuee/d7+nXKMoElV/u6PItA
	Bste2ZpQkvVUHorxtTmeTRsCN6DOnvgWkH+eUfqWIXww8Jc6xqFWyMM2q11XbvjogSMU
	5lPNSW3HMgzkqLi6FnlWrPTN4wuH/msKpgrzUQ0rwCNQ5SLCQ/3u5qT8clz/uvGHJGmL
	HIAiIxz3S2dqclnWVJWH9o5soqhtqIRaH0etpEWc5d6r8zXketExGTcQGznZRr1q9uUr
	blsafRsYYM2SVs8dObATs+qhrhxjw2ofM2WdI3Gv5Vndx7ub10BvHwkTIdNWh/YAKD58
	ElNQ==
X-Gm-Message-State: AIVw111pP1hIryBDhWg2UmIlJZpr94uFVFbcuIIZ6G7+zeI/oW5iNfVo
	Iv8FGDEIQCe17ZYR
X-Received: by 10.98.81.1 with SMTP id f1mr6588878pfb.94.1500057312374;
	Fri, 14 Jul 2017 11:35:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:54 -0700
Message-Id: <20170714183456.22548-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170714183456.22548-1-raj.khem@gmail.com>
References: <20170714183456.22548-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/6] metacity: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 18:35:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch | 31 ++++++++++++++++++++++
 .../recipes-gnome/metacity/metacity_2.34.13.bb     |  5 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch
new file mode 100644
index 000000000..3d2b9c7d2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch
@@ -0,0 +1,31 @@
+From 57493928f16c6bfd054c063c511201e295128539 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 10:26:31 -0700
+Subject: [PATCH] ui: Replace __USE_XOPEN with _GNU_SOURCE
+
+Defining _GNU_SOURCE defines _XOPEN_SOURCE too which inturn defined __USE_XOPEN
+which is internal define for glibc
+
+additionally it becomes portable across musl and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ui/theme.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ui/theme.c b/src/ui/theme.c
+index 84b57a0..6209b51 100644
+--- a/src/ui/theme.c
++++ b/src/ui/theme.c
+@@ -60,7 +60,7 @@
+ #include <gtk/gtk.h>
+ #include <string.h>
+ #include <stdlib.h>
+-#define __USE_XOPEN
++#define _GNU_SOURCE
+ #include <math.h>
+ 
+ #define GDK_COLOR_RGBA(color)                                           \
+-- 
+2.13.3
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 662c90db8..537414d9d 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -13,7 +13,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI += "file://remove-yelp-help-rules-var.patch"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://remove-yelp-help-rules-var.patch \
+           file://0001-ui-Replace-__USE_XOPEN-with-_GNU_SOURCE.patch \
+           "
 SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
 SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
 
-- 
2.13.3


