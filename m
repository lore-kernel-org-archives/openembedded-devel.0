Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34AD471CA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:28:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so6671133wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=GjOIWMZHzegnQy+KoqyWVKyxfAQPKKInsK+XQaH1F01Tb0/W+8AZ1Y61i0SsVMd7BU
	BI0d1HPc4bZOt2lDM9YD8WZspH6373bsGJdNeoeZjmREJzhdcfBdnPFAhHds/KmjYdL+
	RSrjQOcXcGsJAxVAnRKDxQPx4HN2D3kiV57O1sybFjWC1r+chOus0OVw+FfYi0JKVmuN
	jJu76ntlYABABj0XbuymOGHUR+P3kTJKXg1Ah53BQL7vJMAum0batANOm6d4cF4RXCI8
	bEfbcnuOIf1gkm6fc19/f0l0EaT+xbl7t+BKbHmsJwgCHkh062nQ2yZ8ebObq4RlA0U4
	Ub1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eHJqJjlbxTjTeA7qnDVu8dr7C/+qvDDeinPsMseEOaY=;
	b=TMoyVDOGril6JwRM7Coib5W10gjyHMot8QTsHqzXIHqffuHIYVRQWtth2vP31+xWn3
	iqSn5osBIJ5Uy0fmdA50wlSDKOg877WFcTyIj6whEbLKF6+42KiCCQvLVl9+Zx3LxNX0
	yeBnedxJ6cD2RefqoFuNvUw16P3vuGG+0GGXVZWpg17DMywpqFyJ5VzYN74htlb7Hrmr
	NKB2XavzdIFVEmRCwv2Bmz4MsbGUNmqp2LdYUNYlHY4rBMsxDViJcx9qYzmD/uhaeqkD
	07F2QJniCnmvi+axmPn/YnerxdixYeW6kV3VcSS6rN53d0xpaW5IUpRRKVqeL2d0TDHh
	MZOA==
X-Gm-Message-State: AODbwcD6uHHkBTYnmhLOpsKlmuwx5P9+rc4hTA4MLH+EkaSY0CApf/9R
	OdHvOvqCme6M4FUCWEE=
X-Received: by 10.28.31.136 with SMTP id f130mr692056wmf.117.1494505729733;
	Thu, 11 May 2017 05:28:49 -0700 (PDT)
Received: from localhost.localdomain ([151.68.54.167])
	by smtp.gmail.com with ESMTPSA id z14sm6295476wmz.2.2017.05.11.05.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 05:28:48 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 14:28:41 +0200
Message-Id: <1494505721-28247-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Thu, 11 May 2017 12:28:49 -0000

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


