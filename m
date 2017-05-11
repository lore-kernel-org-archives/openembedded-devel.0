Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDE4A71AD5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v4so6656873wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=rvvTOnvegcWyKEEUfro3vWFon9hDHWSNak/5c1NXtcE7qxzPkg3Sh4WsiJGbJsqt0d
	dEfPBse+cP3yzYX3MBCsh3wfLodTrLs36OUTB0TC3A7tPE119lZjdJ8J8zOLDdG3hTC5
	XACwhAwzv2WeDhF8XZR7GtzYUsLlvK96edE1FBqtESRCJArDMcP0l4zBQb4qvGJEw3eY
	L5glHcJ/cTyUtTvvPDOei9M9iAp2jPx25pSpT1NAOBr9qvnkgQy2JZaJi60oGUw47zSg
	Crd6LfFSrae7/2L4QpWT+J4N6R3NPQE2Dh4CEDOnqTpgr6gLrmZuu2+FqfS8iXrWDxpn
	fUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=SgpEM9xVeuC5fgg+a0l5Mp2BXOLkzAq6W+E/dnJIDIXOsIQDk2dfViYJ9tTVhmfgFZ
	nasQ6DyZuwLKHDNoiCcMsNhKnSSFDswjILTs2kdm2kA6EFOz1BNY8q8IjyKm/7/HIUPO
	CTamI1KDnFFkfNmyl6jf1aR8izvkump6SEmFOQq7wfsbMaGJQVUUnvSeGuPBr76IWBZL
	+UvVLdzAn9o+oJLJ7gln3nmSOSCKcvGA+YWypLBRZmrrmDXQxtQOHZoCXgfeTABNtO9O
	rpDjACZzlfE00cZcHLvd2ovVU9XIsVnOa3QoqEpzuDvRTDMpfoiqDrvYaXxTE+t6IouR
	xCgw==
X-Gm-Message-State: AODbwcAcXE1KaelcExmyFVNOaF7q+CZy0Q5BSbw3dMzqqxRdaTgKcy6r
	iVgZH1qFEfjSSw==
X-Received: by 10.28.26.8 with SMTP id a8mr4147611wma.120.1494505716600;
	Thu, 11 May 2017 05:28:36 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id t26sm28347wra.43.2017.05.11.05.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:35 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:14 +0200
Message-Id: <1494505694-28118-4-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Thu, 11 May 2017 12:28:36 -0000

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


