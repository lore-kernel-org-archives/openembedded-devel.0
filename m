Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6A90B7F96B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:49:44 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id m71so538565pjb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q4YKu6yQ6u/skGhYXvXfHba+sV56bLxt3DCDtYQJzdU=;
	b=gd7LCgq1lRBx64w7KANkYPUhLuktgsNyJTMDeIX807q2ktHRmBD2Lo17JrRJCkNFI+
	IDVPJ43qod6wF2m+uj6ZVgeTzQcncs2xXE4BAUJ4n55bLcowmaN93YDCvDoCUF6zDCJ/
	6XBArIQ6v+rpeZuISkCfbcKZ3CT5A6D8jShkyLLaAgruTNUjoHXOhBcYL0bZonI7nSA6
	56H/j5ABfV4iVuM3AUVzfc3tJaqlK+1mX5bWe2BjP8e/LjeGwIlOrWK1B/AHAdasuNLe
	9Cug1gWu0Ogj2RZm3aFCWeF8KBzVwOAycBsgtg6aC5gThzvnVZI5JofeRFS3rRrR+CqC
	iLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q4YKu6yQ6u/skGhYXvXfHba+sV56bLxt3DCDtYQJzdU=;
	b=eqtmYlEkZ6iqTxfrt2QnSIGjzbWNSW/l1dR/tE1BPGgyFLz6QEkEG95rpkLIpB4qCS
	DudG1zpmq/n1Mfo3ZAySFqr5+6nYMY4ZjadxG2bcsrTEurEZoB+hICOcO5guRmQS0axI
	19dP4M3BaMF2nbuIDrfGJqZn8qJ3QUiS8u7PPa4hNI5I2pogEq0AyIcxnfXm2xkD4bEv
	/wUfvAjMSi4ciN+B/O6zMzDydHLcT4GC5+Ol7yOdHGqLtmNlmFbpfsb6yRy2IjlEXpHE
	AxBMVVBSGgTYih9SUu5cCMtHTkTxSAWL4A7/iKBkehaR2mtfB2KoAwJ3Tlo8BXYkB9g2
	Sfww==
X-Gm-Message-State: APjAAAUxJqBwevJKVj1/omZ87+ME1Lu0LL33CXYzS3e8uxQjfz3WGHVK
	tkw1tMmmia7L8IhY85v+v4K5U90Qork=
X-Google-Smtp-Source: APXvYqytJVXoEN+VR2DHto1TYdeXTvvZFy6VPFA0/J5c8Ht7by0+mfgz8Mup7YqPgs3z5Tg/+kFpoQ==
X-Received: by 2002:a17:902:8f94:: with SMTP id
	z20mr23166370plo.21.1573962584633; 
	Sat, 16 Nov 2019 19:49:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	w15sm14881103pfn.13.2019.11.16.19.49.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 16 Nov 2019 19:49:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:49:28 -0800
Message-Id: <20191117034929.3298760-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117034929.3298760-1-raj.khem@gmail.com>
References: <20191117034929.3298760-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] pidgin-sipe: Fix another case of struct incompatiblility due to 64bit time_t
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
X-List-Received-Date: Sun, 17 Nov 2019 03:49:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sts-with-time_t-elements-to-8byte-bo.patch | 50 +++++++++++++++++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch
new file mode 100644
index 0000000000..87a6435f7e
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch
@@ -0,0 +1,50 @@
+From 1110d3036e73d0571f70f6758f3179e5048c0b5d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Nov 2019 11:07:42 -0800
+Subject: [PATCH] Align structs casts with time_t elements to 8byte boundary
+
+This helps with 64bit time_t conversion, especially where these
+structures are typcasted to another struct types which have time_t
+element, that now increases the natural alignment boundary of structures
+to 8-bytes.
+
+Fixes
+../../../pidgin-sipe-1.25.0/src/core/sipe-user.c:124:43: error: cast from 'struct sipe_core_public *' to 'struct sipe_core_private *' increases required alignment from 4 to 8 [-Werror,-Wcast-align]
+        struct sipe_core_private *sipe_private = SIPE_CORE_PRIVATE;
+                                                 ^~~~~~~~~~~~~~~~~
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/api/sipe-core.h            | 2 +-
+ src/core/sipe-http-transport.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/api/sipe-core.h b/src/api/sipe-core.h
+index cde0a9c..bd818bb 100644
+--- a/src/api/sipe-core.h
++++ b/src/api/sipe-core.h
+@@ -148,7 +148,7 @@ struct sipe_core_public {
+ 
+ 	/* server information */
+ 	/* currently nothing */
+-};
++} __attribute__((aligned(8)));
+ 
+ /**
+  * Initialize & destroy functions for the SIPE core
+diff --git a/src/core/sipe-http-transport.h b/src/core/sipe-http-transport.h
+index d82cd1b..08eb150 100644
+--- a/src/core/sipe-http-transport.h
++++ b/src/core/sipe-http-transport.h
+@@ -46,7 +46,7 @@ struct sipe_http_connection_public {
+ 	gchar *host;
+ 	guint32 port;
+ 	gboolean connected;
+-};
++} __attribute__((aligned(8)));
+ 
+ /**
+  * Check if we're shutting down the HTTP stack
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 7dc63164e3..99fcf3c6d0 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -9,6 +9,7 @@ inherit autotools gettext pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-sipe-consider-64bit-time_t-when-printing.patch \
+           file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
 "
 
 SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
-- 
2.24.0


