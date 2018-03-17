Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA7F788AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 10:05:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z73so9637618wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ret/xT975L4a+OL9AzK5ohMkaUg64HOfSyu5w9ptq4Y=;
	b=LgvOkm34TIBre8BR0xduhtnnG2FqBZtVYZ9el2mpp4iPwLH8Y7rrZIvAU/T3XNBCg0
	t+Q0CjaHr2Sa5lsehSfY41z0FbgJfOTDY/U2tF5BsRsD1dbyBrMj3QXOMsUck6HgJZJY
	o2XR8iiQluAIQOamwl8m2pIS8O6nCmozKNJVwzB/FLAoXcE9FnbcCJToMidX+T9/s3+Y
	aE69z51LdQ0Nc01ulAT4art+pB7FcJscNdfIinDzH8e29Ykdc2WLyNaHVH6wsscrTulu
	b/WH/h1tdFadHb45QBBgEqA1iviTv4h+bhxU9ZzFiGVH1emzdPjxBE68fzuHF1VmkIGz
	Ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ret/xT975L4a+OL9AzK5ohMkaUg64HOfSyu5w9ptq4Y=;
	b=MiZ/84lebESEIQKiPsemaTM0vclmVrHv4XVV75h+3RzFK412AtMNc/lsF8+Yl7QltM
	wY1J87DAVeZbx6WywimF1aUd8OXNnbIqga5pdCHg6ehfRL+ibZnYZFVw/n64j0xHgPR/
	8r366Z+xyx2wCJjxNfNUkUwd8oLNPker46H1A3F4BkNq6p7IOhSApZqOGsU+ajacEOO/
	KLVAFNBfRe7VQPFSUQZ7dZ4wQaYSWyFaNnoE2HVqHujqI3STKm442WueqtFRyzUevqCa
	E811yaO2dnhravoekeOoC9sV5QPT+w7NaQMTlZUldpqA3uaDnKXMba8NGb4iWyzaVh4J
	PZ2Q==
X-Gm-Message-State: AElRT7FIjYY9Yl2GxSFju0s3h8OyXRnwRLpbRaSc1sRVsXyYb2pQnVaG
	YIiFgPK9lxRShLn2qB42rHPaXQ==
X-Google-Smtp-Source: AG47ELsm5z+DRR0lsdC/A68lsrA/REUo8n6PVUtsWq30wQtzQVeB5lEJsAwW6ooX7e1BzMteXlhyiA==
X-Received: by 10.223.150.11 with SMTP id b11mr3812035wra.55.1521281135847;
	Sat, 17 Mar 2018 03:05:35 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id p68sm9687946wmg.7.2018.03.17.03.05.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Mar 2018 03:05:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Mar 2018 10:05:32 +0000
Message-Id: <20180317100532.8511-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-networking][PATCH] ntp: refresh patch
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
X-List-Received-Date: Sat, 17 Mar 2018 10:05:35 -0000

WARNING: ntp-4.2.8p10-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch ntp-4.2.4_p6-nano.patch
patching file include/ntp_syscall.h
Hunk #1 succeeded at 10 with fuzz 2 (offset -4 lines).

Now at patch ntp-4.2.4_p6-nano.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch  | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
index cb1e2f7341..d45b7e38b7 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
+++ b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
@@ -1,6 +1,16 @@
---- a/include/ntp_syscall.h.orig	2009-05-19 16:44:55.048156467 -0400
-+++ b/include/ntp_syscall.h	2009-05-19 16:46:19.293323686 -0400
-@@ -14,6 +14,14 @@
+From 2310898533f059d875dcffd26ab6cf1b280292fd Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 12 Jan 2011 21:38:46 +0100
+
+---
+ include/ntp_syscall.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/include/ntp_syscall.h b/include/ntp_syscall.h
+index d1ce03e..9e18432 100644
+--- a/include/ntp_syscall.h
++++ b/include/ntp_syscall.h
+@@ -10,6 +10,14 @@
  # include <sys/timex.h>
  #endif
  
@@ -13,5 +23,5 @@
 +#endif
 +
  #ifndef NTP_SYSCALLS_LIBC
- #ifdef NTP_SYSCALLS_STD
- # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
+ # ifdef NTP_SYSCALLS_STD
+ #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
-- 
2.15.1


