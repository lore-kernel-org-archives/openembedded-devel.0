Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6D46B71AFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:14:30 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id s66so28069855pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 23:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k843tosGRb/ZFuYHHnqgmm38nNKppGKwReXoFCwznLA=;
	b=uj3ej4sSVvQm82KfGaDuyU+w1f3OYjAKZvezC+Tpg21DPWyxkKGnFRL7KrrOtGlWJA
	GJLmtaH2gUVLCxLkFV3DzwQrM3omc24VayFFi1e73eEZXpwrpghys0N/WDU2IrTGXzV1
	dV3Ntxqz8Efqd+0RMbULAPS2Dn0MqYJ9ln4ke8T7V6xu0AzUPQg39yOMqPW/4X5bN/ez
	BVZ3yi8U2WiNzoCfFjQQ6ahaQ3iA4YtOFY8gL9CCRO5rYt+lc0ijJS9r8G3n2YFVzoF6
	1cDuU6e1DGi2j1eqtoAC+VEVDiGNaKL93bMYf0NzLRqK907q7dFhAbkSwsYMTuNROuJs
	pyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k843tosGRb/ZFuYHHnqgmm38nNKppGKwReXoFCwznLA=;
	b=dcvRkpEFnK54pQWaYFO6Du27nrcUMcWiqv6NIpC1O4W7vo/4C30MlLCsOxPEFd8Aux
	oT0A78YjJz/8UbO1NZl3JS4RSRiY/ISU9gKGR8n3UtceWvn1+Ak1BRFqbkzNmL2mRRbK
	jeQcjNkfluca/TdcLZiZVtbiGODLZmvpwphgG5iP/Sr9NHW6fIOYUyZJPMt/ZkJaL11o
	DfpsLaCb8nv0sQcVaLfBCoiQn8NfAWTv+yBo9Ft6H59aXaZ4Ub8zpiRfPrGzXkgvIgIK
	/FZ10oDLQxoOHPGjF25XejeU1n6+1eWcXHLSc0IPsORDs44TKdY/ewYa/HDgHi5wm+RI
	HFbA==
X-Gm-Message-State: AKS2vOy3qYB566HN3o7BYZOxS7fJZGfc0Uk8SoWJN3QkiUPKjk6IlwJE
	eGSqu/AwBrRanegb
X-Received: by 10.99.128.193 with SMTP id j184mr8658400pgd.245.1498630471478; 
	Tue, 27 Jun 2017 23:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r129sm2102839pfr.112.2017.06.27.23.14.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 23:14:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 23:14:16 -0700
Message-Id: <20170628061418.16693-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628061418.16693-1-raj.khem@gmail.com>
References: <20170628061418.16693-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] orrery: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 06:14:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../orrery/0001-orrery-Fix-sprintf-format.patch    | 26 ++++++++++++++++++++++
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch

diff --git a/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch b/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
new file mode 100644
index 000000000..eb6241fdd
--- /dev/null
+++ b/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
@@ -0,0 +1,26 @@
+From e600d3c09d2f97a197f86e6987d44d142e7b7cdf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 21:12:17 -0700
+Subject: [PATCH] orrery: Fix sprintf format
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ orrery.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/orrery.c b/orrery.c
+index e3a1f6d..1b31a9f 100644
+--- a/orrery.c
++++ b/orrery.c
+@@ -3767,7 +3767,7 @@ static void drawOptsScreens(void)
+ 		      displayWidth/2 - gdk_string_width(smallFont, scratchString)/2,
+ 		      12, scratchString);
+       for (day = 0; day < 7; day++) {
+-	sprintf(scratchString, dayName[day]);
++	sprintf(scratchString, "%s", dayName[day]);
+ 	gdk_draw_string(pixmap, smallFont, blueGC,
+ 			CAL_DAY_WIDTH/2 + day*CAL_DAY_WIDTH + CAL_LEFT_OFFSET -
+ 			gdk_string_width(smallFont, scratchString)/2,
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 40a6df3c9..1a00b0808 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -10,7 +10,8 @@ inherit autotools-brokensep pkgconfig
 SRC_URI = "http://projects.openmoko.org/frs/download.php/923/orrery_2.7_clean.tar.gz \
            file://orrery.png \
            file://use.GdkPixbuf.patch \
-"
+           file://0001-orrery-Fix-sprintf-format.patch \
+           "
 
 SRC_URI[md5sum]    = "bd62a33e7554ee1030313dfcdefcda8b"
 SRC_URI[sha256sum] = "645166a5e05b2064ab630534a514697fc47b681951e7fe1d635c259cbdf7a5e6"
-- 
2.13.2


