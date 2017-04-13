Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8233477E77
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so12686173pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YdTt7xUOD9wtwYRg5EB6f11H5SyzrTOt+OELPzKyI0w=;
	b=B44rXZGDME1mHnF59atsswM3yA5P+iFH7rrSp20obWgZSTPoypQQve9G73SnoWg7eq
	qgNzvKcV8s5SYHb11t7GXmMMc3SG5n/Peg3+5HgFC/UIC/x3vOvlKtrbfDR8XmYvTL0N
	ruO/7aKWwO2rYCGVQ1iSs54lGNLkI2XgUwAU69DKxxq+VOY9u92rZBcpr8frR3FfESIY
	Kd14KTeuglMyL7WDP0EUinAt+FHXHOGSGfbLbeypYPxlAAPE2OjvJvmpOd1SYYPizn4F
	9jB7qn6R9xUybYGkeovv1GZGN1QtcS9iRih8AzTjfX6J41hdgr8T4JKXNcYLvB21RUfR
	k7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YdTt7xUOD9wtwYRg5EB6f11H5SyzrTOt+OELPzKyI0w=;
	b=rdFD+DfMkUsAlvfeeHmkd2zr7AN3Xli+TQOZ/buigtEOepqM3hBZmAUovzGPfxirn9
	+xHS2TW4j6RShkaxWk3YEkDo/fXsx15U13hltAh2S9cBa5J+OXkm1XVWOWrRB+QdtzBk
	UGOxHo3wLcyQRZ0eOigkLWGhiSVyzTqXWU/WTj08zL+qWFvm0JfdLEfHqdK4Vnx9GiyA
	XiI/cp5G8AmZI11CNMkLtnfB1mu1Eh23yxoTloaeg3+onqD7bLVdjY417cqdqbOl2Yr8
	MwvjrhmyelLYTWUm53U6AkAdGIYhK6fBVXFSPIExpb3fc3dK+jwzUh0SWCSdqmiUX4k1
	sSuw==
X-Gm-Message-State: AN3rC/5sSPxTtNduX6/ywQ79saX2i4NLRp+1e/g7yzuDKlYGa2aCl4G3
	NHSnVkfbAuZ5Og==
X-Received: by 10.98.7.140 with SMTP id 12mr4199104pfh.202.1492116077899;
	Thu, 13 Apr 2017 13:41:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:38 -0700
Message-Id: <20170413204106.30679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-networking][ 01/29] lowpan-tools: Fix build with clang
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-src-iz.c-Undef-dprintf-before-redefining.patch | 27 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
new file mode 100644
index 000000000..68393067d
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
@@ -0,0 +1,27 @@
+From ad088233608ba2205511da4f270f8ba29844b84c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 09:02:02 -0700
+Subject: [PATCH] src/iz.c: Undef dprintf before redefining
+
+Clang is picky and warns about macros redefinition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/iz.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/iz.c b/src/iz.c
+index 32be1a8..886f0a5 100644
+--- a/src/iz.c
++++ b/src/iz.c
+@@ -60,6 +60,7 @@ static int iz_seq = 0;
+ /* Parsed options */
+ static int iz_debug = 0;
+ 
++#undef dprintf
+ #define dprintf(lvl, fmt...)			\
+ 	do {					\
+ 		if (iz_debug >= lvl)		\
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 139eb788f..0dcc6a785 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
            file://no-help2man.patch \
            file://0001-Fix-build-errors-with-clang.patch \
            file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
+           file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
            "
 SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
-- 
2.12.2


