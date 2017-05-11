Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D61F571DA1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 13:02:36 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so3458562wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=FupKDIzJrli1N45ujnC763IpdHP42gNoP4JtNlzDos4YN4Qu0LZhWwhhdxy8LO1gvE
	8L67pRs80c52pcUaB9xs3vPQmCQR5cwRzRFuTQsfMW4CVKe0h4dzjzG3V9kUWEahiClZ
	irpEvw2SWYKADWhnIPexYEAloPPw7DQ68hDaKhvO9y+4/AMjxKpVIm+RZFoH8DlrxECg
	3jZBtfOl19GqPmDQxbyGfXt7e5Ssxvk4YjuPQ8tAvfhHOmOTJs16BDuTFrbIUTowlf/2
	h1KnNIoDMdDSE1U3Oe2IeUFLNaIqCal2eaqLDyB1kn7cw5X7dmFh2JGDH0I/heDrcXOp
	ISsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=uQWiBhlpZkMPBDAI/iD6HJToZWjl1ijwdw4Nh4aSUQ7e5nO5L4lqlHgdshC0NMKk2h
	gLilyNII3H52oaal75eAiacPJAloVtauxBQAJ4qK8mjAtCz37QcSntZsOE5a8DZn8I8l
	HUC4c4ouzWlp0qWwPX/Efc22W3ExPjnrwi92U2rVCkhqoUIMH0mBBBMg8HnaCbodrolC
	2o6E6Ao2ZBtXihR37o1Om1l4KK/IXMndnXd2klOohhayad6y38ZYUykRraLvusajII+Y
	v6sY89SnV3j0TA0bXGl76y3sQu7l0FVWaSwn4Ji49SEpLFXolqh32OavAW7syAoOz7OP
	a5Pw==
X-Gm-Message-State: AODbwcAN6371AoqrLO6kebkrR8W0FenrKpX4j1a6iyIwQZWpV9g3VXPL
	c0WAi6EcP1Vs5+unqss=
X-Received: by 10.223.131.130 with SMTP id 2mr160870wre.104.1494507756839;
	Thu, 11 May 2017 06:02:36 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id
	y63sm9550222wme.31.2017.05.11.06.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 06:02:35 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 15:02:27 +0200
Message-Id: <1494507747-1804-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494507747-1804-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494507747-1804-1-git-send-email-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Thu, 11 May 2017 13:02:37 -0000

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


