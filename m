Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4997.1792755267855942704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pP8+62xI;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e812e2b31bso4140095ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792755267; x=1793360067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cBAOcRIyvUGGuv1vkrluNOq9wYlsSu88L9/yqJLSVI=;
        b=pP8+62xIq7nHgzC6KXp0weG6t/qAuXhdYMnDrS7GV5RTEEEOwtrBQZ2u57hlZEjAEA
         RBxigTGN/R+HjkH9aJtlF4zydtXqE//DuHuyn9hPXkP+kFPTl2eDv/Qstqd6BQdv7yqR
         6xhINpsp40BMdu0/iO4lZ/mJ7mjK3cQElTdtevLY2OrbO6NDJcxbcbM/a+0BV/LofP9n
         IeticTEHE5OQE278Wj/o34aj0VODmP8A2e4yDOxRU/M0z65xtp8KIwXIO9Iv4dGRnNS7
         f0Ng/0BYzgqWbp58CapIO5FSrT0nS7FLoBBr+Qw572h+w/IwjGEmshLYqZmwVXG0DIk0
         TZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755267; x=1793360067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cBAOcRIyvUGGuv1vkrluNOq9wYlsSu88L9/yqJLSVI=;
        b=1rAoU6xaizvYP1QkaZsZfsQD2y7DIT4zwKFMBO9XTzffydvPaoZWssiwNVBrP5VJk5
         Gs6bZZFhIrMj3mQHMVmsMZDrLNOcASFsfHS+NN5RrUF47QVpk68DlQNIvtFuZUgrjjks
         hFfoiP7Pz9Vz4ICNCvIyaqYOSA2UzdJdafimm9e8EMIavhFyVYmk8vIGiAveT1DaMZuN
         NAkq8LZN8tpcVVZnFvY36i2jMJIo+DhSIk2R4NOjKMo6N1KY8KhJ0x39rwJi/eydhEv3
         Kix2GAM4IOPISfW8Pemv5fA80aQwnY+414Btj58W42bLSWKAiSrgc2oswNZNOn7hu7ei
         LTVg==
X-Gm-Message-State: AFq9FYKyyaLJLS0BjJqMolbEdc1qQzATic88b9MmFaMFwXaESviLfUmi
	wsv3Ozp7rmZ1uswWEF6fyQU7+qs8Ngq4PzFE4vk+Ron2G17VNz7fhrS0vKzKUw==
X-Gm-Gg: AYBFou2mXMajCjFgQ4RUJbru+fR3cGXaoGMlPpybSTgdDnz2zJP+3dj55l9XrdWwJ5H
	CyUyDUG8+qbXx5uWng6W5z6nh0AkVDPnf9rMV5+ksEbyjDMdK2gH633dN0fxidXRrTgcnS7KNJ/
	RoL/zhSOSTnDZseUwa0q5QmM3ycYiHVfPBo3g3V9B45mFkovK8uw9bHzb9xV++MMui2MlhIsPXK
	9ceBoRrJAGNwQU4nRZFoo+7HrDvjSVgXAKap9OOzodOwvgET1+gViQ2JRmVoshyT5R4C4LVK8jV
	pc3VsSG/v6GP7ywKosABtymoyTkkny04RA5/GOOpd7lVK0cS0CLBnAEEDzAO+956LTJXk/MeJO7
	0cWXs8eJxnrk4PvBq9m+fBHJShKN4lEkwiWSQzvA2pWFWdL3TOWTt9o76sgSeh5iAMu3MhzyUJ2
	msWzhkEOQS0MLgelpSYTgMCONwFeHphmleLEF9qyvU5x/nh6QY3opdyFlDvecmGE0qeR9pilujF
	703s9tsNVZ2YlUDA1khDZd0EWSw5Q4cgX2jFv0AQMUl9riGyyrV8LNi0UV4jodVXbyDOpTMRj6c
	KEmiZCubRMNYk7CTmbHfTv20bG9b95E/meYyqztGMHKMHd88d3oYPCc=
X-Received: by 2002:a17:90b:1c8b:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3adcdc9e7f1mr1616438a91.1.1792755267112;
        Fri, 23 Oct 2026 04:34:27 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93fbsm3513520a91.16.2026.10.23.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:34:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] libmspack: patch CVE-2026-110602
Date: Sat, 24 Oct 2026 00:34:08 +1300
Message-ID: <20261023113409.1218533-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 11:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131364
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-110602

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 94901e4ad41b2d45e1a28e92ceeda8ae74148081)
---
 .../libmspack/CVE-2026-110602.patch           | 41 +++++++++++++++++++
 .../cabextract/libmspack_0.11alpha.bb         |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch

diff --git a/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
new file mode 100644
index 0000000000..15d690945f
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
@@ -0,0 +1,41 @@
+From aca3603bed20772fd86ce5b901005668cee835ad Mon Sep 17 00:00:00 2001
+From: Stuart Caie <kyzer@cabextract.org.uk>
+Date: Mon, 15 Jun 2026 16:33:33 +0000
+Subject: [PATCH] kwajd_read_headers(): initialise pointers before returning
+ any error
+
+CVE: CVE-2026-110602
+Upstream-Status: Backport [https://github.com/kyz/libmspack/commit/4d868504114346aa767d435fbb89a8b76603493f]
+
+Dropped changes for test and ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ mspack/kwajd.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mspack/kwajd.c b/mspack/kwajd.c
+index 30caa89..ede91dd 100644
+--- a/mspack/kwajd.c
++++ b/mspack/kwajd.c
+@@ -160,6 +160,11 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     unsigned char buf[16];
+     int i;
+ 
++
++    /* initialise pointers */
++    hdr->filename = NULL;
++    hdr->extra    = NULL;
++
+     /* read in the header */
+     if (sys->read(fh, &buf[0], kwajh_SIZEOF) != kwajh_SIZEOF) {
+         return MSPACK_ERR_READ;
+@@ -177,8 +182,6 @@ static int kwajd_read_headers(struct mspack_system *sys,
+     hdr->data_offset  = EndGetI16(&buf[kwajh_DataOffset]);
+     hdr->headers      = EndGetI16(&buf[kwajh_Flags]);
+     hdr->length       = 0;
+-    hdr->filename     = NULL;
+-    hdr->extra        = NULL;
+     hdr->extra_length = 0;
+ 
+     /* optional headers */
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
index 169a5f271b..c612e54e17 100644
--- a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz \
+           file://CVE-2026-110602.patch \
+"
 SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
 
 inherit autotools
