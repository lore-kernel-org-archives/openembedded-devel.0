Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D51971CBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:54:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v4so6817099wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=ZKzDa5UQ6XobuTrF21mHDdjaQVLOhWN5iOnUNXzR/sHqktbDCgtBsRFyUmK5p/XqLJ
	o/dyKCnAKkLaQKpp/IQhHgGhy99WogH5fX6pGdRLA1/G2IVyWPPsLsXkLBLhY/5i00Oz
	+rtsgglScx0i48trsfEt3dN64r32zs65hI9bQ2RR21qaJR9ZbYDJn9XhzJYy+Uitggl7
	TyGFnEahfJNR8hjWy2ARgnZ2L2TmUxjgEGxI0L6ae0tXmOaJN59i18zhA3SjYiUCLLGM
	KAd+sXRy8fF6P8XQXzQfq20r7a3VJPujN+ugQCUjra/jEfKJN2Wv03LkovYen9fJxRnU
	N8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=YiFdwpUSD7tNRM5FDvgoRxC8vKPlb/RB9Ul45MpHmPqf/C++adDtkntdNa2XgZ857A
	jwkxWNxt4OoR8RK2iUuQH27cvqrDIHLmeXF1S6iMI03ARvLohIXPofg3hu/nzkDgpw2R
	B1vRNIM7N0fnuCEj8NN23KS4SZa/9ah4X5cATP2e0C0Dvx/7AM/nuEZaV9q76mLvgEbV
	gTaozw0KMKOAB3WHMPC8tlguZpGHcFNt3aGLTuB9hd6IIWhuxyw9/0RLVSkTy1UzEs1n
	MBignOoVjuqLm3zpXSVlwv3+MQJizAS1fskovmDr3UY92KPNko53ANqYodS631l+7BGA
	o/2Q==
X-Gm-Message-State: AODbwcC4MS2QkWxeCJ2Nhji9ld8U1fSEHsb7UGWDpB0sg8WVItcbEzHH
	NCE3xacDX2ccaQ==
X-Received: by 10.28.113.4 with SMTP id m4mr4310843wmc.42.1494507246963;
	Thu, 11 May 2017 05:54:06 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id n99sm73028wrb.62.2017.05.11.05.54.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:54:05 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:53:59 +0200
Message-Id: <1494507239-32152-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494507239-32152-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494507239-32152-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [meta-oe][PATCH] libndp: Update patch with upstream version.
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
X-List-Received-Date: Thu, 11 May 2017 12:54:06 -0000

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


