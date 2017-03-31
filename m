Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDEB77ECE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so18588648pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWiqbi0krI3glOIoK6zKNnuchUkDMFX8uyJnUVBuz98=;
	b=Bz24YbkB/EcGjkEx1AKgCQDnk/8IZgv19+S8uLqHuCGKjsfAfAbwRn9UQ4ZYlMztE+
	2lIWWmozQ85OqI0XbvK/bSneFHQnnEKnajzbaQnJt9saF4rLOPX09+tq7ZnoNyGsfr1S
	SoC6VRNdsHUgKXwfrbPRRZGuTyShUGwXPMINbZ/ycZgvsB1/DyuIi8DxcrP7Yff5V6sT
	3T3YS3m/GVLKhD0eNcm43973YIpxuYtZZ7kVVWsJ6uliHrfMOkTynPnj+L4BgkMid4ZM
	BJAEKhPqggZFfTDvbyGmmDXwNEcUpk6qaeH0OjUFJeB8V2HKuPPYIc/+yk5uqgtGFrpe
	TJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MWiqbi0krI3glOIoK6zKNnuchUkDMFX8uyJnUVBuz98=;
	b=s2udg1/B02V2akPYlE180uKJRY0A2SENYcLwgCquSKy2B8kuEyjmHdvJ2an4GgwVrn
	4g7L8X4e4lqe9xTGm4cze2dOVWLPvkur/kViDwnQwc/mQZgvp0vUjxs9D7vEzvvbF4/R
	DjoROS66kbu4Ig//vDg7sIffr2X0DabQ6KTwcCng+VNbgTNbHrm9vDbnwDePxguxqyFk
	QWjsQ+tdV771u4GgHaRBnojVnSNcxA+I0LQP5nWsVgZmwjo43R4Z+zYr1D4niJuYESli
	A09XwHywneL0iHMxkmEktKO/noh3lz+B3zwD8pua059P6e851RsNzjvsxyrnGAeL5wQ9
	8/eQ==
X-Gm-Message-State: AFeK/H1ujV2YfhQt+VQ2DM1K9wrnnYe9Qff8tGHiITESJIV4YmEKsmw7PXx8l/vGtUtCQw==
X-Received: by 10.98.211.81 with SMTP id q78mr3653239pfg.97.1490978635763;
	Fri, 31 Mar 2017 09:43:55 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:45 -0700
Message-Id: <20170331164247.5052-41-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 41/43] libnetfilter-queue: Update to git for SRC_URI
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:54 -0000

brings in the fixes to build on musl
Add a typo fix patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-in-the-location-of-internal.h-in-includ.patch | 26 ++++++++++++++++++++++
 .../libnetfilter/libnetfilter-queue_1.0.2.bb       | 11 +++++----
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch

diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch
new file mode 100644
index 000000000..76d2d5d28
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch
@@ -0,0 +1,26 @@
+From 32af64e1811c74292891dc4dc8455736f7d33ccf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 13:26:56 -0700
+Subject: [PATCH] Correct typo in the location of internal.h in #include
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libnetfilter_queue.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
+index 211a8ba..065d618 100644
+--- a/src/libnetfilter_queue.c
++++ b/src/libnetfilter_queue.c
+@@ -32,7 +32,7 @@
+ 
+ #include <libnfnetlink/libnfnetlink.h>
+ #include <libnetfilter_queue/libnetfilter_queue.h>
+-#include "src/internal.h"
++#include "internal.h"
+ 
+ /**
+  * \mainpage
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
index ddf2aa5c4..0ca074ca3 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
@@ -6,10 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_queue/files/libnetfilter_queue-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "df09befac35cb215865b39a36c96a3fa"
-SRC_URI[tar.sha256sum] = "838490eb5dbe358f9669823704982f5313a8d397111562373200203f93ac1a32"
+PV .= "+git${SRCREV}"
+SRCREV = "981025e103d887fb6a9c9bb49c74ec323108d098"
 
-S = "${WORKDIR}/libnetfilter_queue-${PV}"
+SRC_URI = "git://git.netfilter.org/libnetfilter_queue \
+           file://0001-Correct-typo-in-the-location-of-internal.h-in-includ.patch \
+           "
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.12.1


