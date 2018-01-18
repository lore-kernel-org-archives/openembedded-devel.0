Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9AB6785E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jan 2018 13:47:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t74so22217922wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C52lrl811AWQPDTNLjwCZqOn2H/8cwgjnezaC9iiaHE=;
	b=hVyuv4YN9mker4gL6mRh2Kinkao8Faw4r1C6dGFy70zDAA/u0P3A0XT1noxD2MmgIl
	Q9GFd5YMaPX3UXpJVmccdCxs45UdHTWEowArFI800Q2aRhZPYFAhWTwgLrE6Y3NXJW2p
	s8YgRhS81A/XQeFPWVmf2QzZgvmJ2FgU6NdkqANztx9JiRb6qF94hmySq1LAr9sEj3F+
	iQf7U8iUONup4i0xgicWsJeiWqBu31Ljofk1JDqoLmWMQm6Sf8mh+LFwJXVaw8gv9j0t
	dBfy1wIwcY0NVZyOcV4K0m8DXnbhmLTWK3bmcrUa0HlvnmWHKhQ8yBwoluVTMpIftUEa
	0s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C52lrl811AWQPDTNLjwCZqOn2H/8cwgjnezaC9iiaHE=;
	b=eXv1AoKW2M9UcdfNXWH4WHCuYxoPxoWUbaULZiJHO7NPv7wR9h4OVNzWQ2kkG9jKYL
	S1U9+vfb0gqZziCKf4GpcXvxfL2uuiyjq8eeFyNdtq9napkdyi+nbKI9qfojrFMBStBf
	ht30z6E+AVZRMQB7sHgParhDpkRx0shhFqHEs56BKtvJo3/aNuRzfAf2hKE5Q1E/UL54
	e5SkNPCm6+s+/9D3qmFOJaYN7bxBFnP9S7XKkWjtekmnr8yYzVdvuiVzhjE3EztB1O43
	A3AsiSHyIkNeMR8dLNznuw/V24BKklH2IgyvXsAaEeeXON6mm1QT6Om7FFV/ewOtQICY
	ueZg==
X-Gm-Message-State: AKwxytfDy2HOh+qVSueMGw0vNy/UPuoYDpFaxZg0TB7qAnwN1sE69kJJ
	D/MIRxX0ZbqONDIQsx9ztUd/Kw==
X-Google-Smtp-Source: ACJfBou2r5oKSyfWt1qTyrnEJ2Ejda00ri1mGJf2H2TnEtzHpMlq1pG09pFlReDdX45mIqNZ1xzyiQ==
X-Received: by 10.28.133.129 with SMTP id h123mr4771854wmd.155.1516283247777; 
	Thu, 18 Jan 2018 05:47:27 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	u27sm2519282wrf.77.2018.01.18.05.47.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 05:47:27 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jan 2018 14:46:56 +0100
Message-Id: <20180118134656.23743-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-java][PATCH] openjdk-8: strip leading non digit chars from GCCVERSION
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
X-List-Received-Date: Thu, 18 Jan 2018 13:47:28 -0000

When using the linaro cross toolchain GCCVERSION is set to "linaro-6.2%", i.e.
the first char is not GCC's major version.
Thus needed compiler options for GCC 6 are not set.

Fix at least this case by stripping GCCVERSION up to the first numeric char.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
(cherry picked from commit 1fbdc60eaccaa29c2942d479f8068b722e7b5bf3)
---
 recipes-core/openjdk/openjdk-8-common.inc | 6 ++++++
 1 file changed, 6 insertions(+)

The patch applies cleanly to master, pyro and morty branches. I think it makes
sense to add it to all supported OE versions.

Max 

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index def779d..b72c3c4 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -231,6 +231,8 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 # version.
 
 def version_specific_cflags(d):
+    import re
+
     extraflags = None
     version = None
 
@@ -249,6 +251,10 @@ def version_specific_cflags(d):
         # work if the native toolchain is Clang, but as of this writing that
         # doesn't work anyway.
         version = d.getVar('GCCVERSION', expand=True)[0]
+        # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
+        match = re.search("\d", version)
+        if match:
+            version = version[match.start():]
 
     if version.isdigit():
         extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-- 
2.9.5


