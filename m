Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9BE71C56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:30 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 6so3347889wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=cKyrhkVhVtcyR6C+kFJyyFDGcTI3xGrrRd4FmS3Xcie6ZupehQ6UqDhSsWWlnEwMXU
	dNasZtkD8/p08JmWYAv/GmwoH6vSI/DPuNrXYuoPD0489WpAxoHIT0nAYZ/JxuYqbR65
	OnFH4li4h+cp2ZeQVeI6Cv8PpUk59DTwvV3+qiAG5LbKHqSG/R+81epkPmrlabUxi3v2
	K0l1a90lNU+198JiKg4fBm8DAFcI1GulX8cOvcF381zaXLbQREBPuA+eT5MZGkYcLXmT
	fbHlJqnOBzgVlctR2UsmsNpaaQY/h5VwOeyJeyUQAhIw75L8Tyn7mxtLBfY3OOUjRLTn
	GRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=YHk/RZPf6daBY6WggEo+kQPay/luiSkTn58ZlwQWNGzZ61WJzU8Y7mCt71zNpXMFYm
	5w2aF8vAFbelEUpc5xo97ME+SOOu+DZvrLhqMWd5oJaWfbN2M7Uoh3jf269la0TBI4Gv
	MHbdk5cS4NI3EU++zdmVnXWjc3tTWndSkYchfQb73TgMl+vkCrTpJ20sxU3+Xs1u2AcQ
	lPJYzpHwhg1Je2M04DkxP/MiupqqsToWr8pg+rmjX5A8xRcfJDUQxMIOz9Kc3ZvGrbYZ
	oSoCjcdcnlSpAzAsZcra8Zsuqc1IVooNzLiEg0ufaOUOHWuknWCfiwL0FheVKf2Vlkka
	Z2nw==
X-Gm-Message-State: AODbwcAhauPH9Cr7XVS9sykVpOb58HEDjm4LlyQD4rs3ce2VXBUhKQJD
	QnwfsAjWGPrfQw==
X-Received: by 10.223.134.80 with SMTP id 16mr70291wrw.62.1494505712009;
	Thu, 11 May 2017 05:28:32 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id t26sm28347wra.43.2017.05.11.05.28.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:30 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:13 +0200
Message-Id: <1494505694-28118-3-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 3/3] libndp: Update patch with upstream version.
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
X-List-Received-Date: Thu, 11 May 2017 12:28:31 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 ...-include-sys-select.h-for-fd_-definitions.patch | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch b/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
index bafd916..15aa94e 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
+++ b/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
@@ -1,25 +1,25 @@
-From 33150de2d77ffb645da1a043933b12ddc0143cea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Mar 2017 18:59:03 -0700
-Subject: [PATCH] include sys/select.h for fd_* definitions
+From 94e9a082d76414f82794b0c9817d0c24e3868275 Mon Sep 17 00:00:00 2001
+From: Kylie McClain <somasis@exherbo.org>
+Date: Sat, 21 May 2016 21:24:36 -0400
+Subject: [PATCH] ndptool: Fix compilation on musl libc
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+FD_ZERO, fd_set, etc are defined within sys/select.h on musl.
+
+Signed-off-by: Kylie McClain <somasis@exherbo.org>
+Signed-off-by: Jiri Pirko <jiri@mellanox.com>
 ---
  utils/ndptool.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/utils/ndptool.c b/utils/ndptool.c
-index 1d96f4c..0fd4c4d 100644
+index 1d96f4c..96479fa 100644
 --- a/utils/ndptool.c
 +++ b/utils/ndptool.c
-@@ -23,6 +23,7 @@
- #include <string.h>
- #include <signal.h>
- #include <getopt.h>
-+#include <sys/select.h>
- #include <net/if.h>
- #include <netinet/in.h>
+@@ -28,6 +28,7 @@
  #include <arpa/inet.h>
--- 
-2.12.0
-
+ #include <errno.h>
+ #include <ndp.h>
++#include <sys/select.h>
+ 
+ enum verbosity_level {
+ 	VERB1,
-- 
2.7.4


