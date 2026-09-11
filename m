Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F91C88E41
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:21:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33359.1789107696201059457
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ImXdqWon;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso680381a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789107695; x=1789712495; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RPZPJW52TvspZb7rQpKXL8v91FiYsQayKZFu1l10gls=;
        b=ImXdqWonSe/Nuw9IdR7AqqMzJrn6IH+CNq2hkMlIsnU+KtWpfjEecwiAuFRndAbwde
         Lhw6fAHF9wbcVvaPdHcdJygFb5k0QUGXNIbasdYWmxXWQFBncpjYUK4Q9y7s+h+WVyq+
         dvvo1shWfrlYq6bOzZJNCPnVEv9TWwTxVUD6/P15VDj/4tNG58LY7qFT73DFzf8qUle9
         xxwLZb0Kk75Hl6bVyE+f5SDl3PPHRNHZMpzSyJGky6G/XWKByzqW1iU6rBSXkOiyJaxm
         aYTwmZERpa9lpE8FgRP3pHKQydwHZHq+PEjBFSroQlq5wbwn2ySzP0n/1TficjwiSw2O
         /MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107695; x=1789712495;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RPZPJW52TvspZb7rQpKXL8v91FiYsQayKZFu1l10gls=;
        b=r+gTmm3ZmzKtVFgOBYZvut4TSh+cmjl13OFR7Fpim+TK2T8/OtgPMCferhzQtCqsIN
         JU1IvBDSM8rbax8pBMMpPgqgMNKoU92s5hzupxg3c0FnbK9jl559YTFubaqwhLMYqYrD
         Pgs/z8KCWKJl55yuXyIbFY1kZseGLMtMJtC4xvl0bRby0q4XmtIGEdqw374Zeww8dZP4
         E6xRDyfwHPPlhcYge0VLPxS4PYmyFCooMzfmdoaABURuOY590sCUQPWuutIeQuOLJlZB
         HzVXd1nsKzfTFvEXqKgKjj3fMe4O2Tts3+kqRwwzZk5ffsdOYWANrV84MaacnXrTbOIZ
         kQVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHvNtq8qFY1zSIc1m2kZ81lsYRNXgUHK7He6sm2MWeotF2Zz2mtZj5wR52nDBUrQvhPCHpJ055uGKb1gDYq3ZMeYQ=@lists.openembedded.org
X-Gm-Message-State: AFuF++mXVwzIkPN9NtXMYMNEjwVF/oAp6yyOPH+juqCm4o5jNY9TNzLP
	fzrL4beXjgpZm/daGo1W2nz5ShFZVV3Z3hS/CvSffG/IV00v8g9CLvrp
X-Gm-Gg: AYBFou2Pbj1c2XhXJe9iveKGp7B+UNikTJ0LJO3jvx6GtsK+hAx1Fro2/OEaUdRvL5q
	lAu109mZJ1iua8sH4T1tSK+p5J90AG5D7moZB7Bf1QHx4XQUvJfhEc77j5NB9yRjpsLNukKeezK
	d8mJx2s7Zu5y9jLfhtwF1YohZjmGdbfTIHADqPsaIZsHYUzeRmHHMHDQvO1efCYBkdEVju5097X
	Nfe9u1OmCdVI8ZHBsbj2Vkq2P6F/cka8m9sCcZZ0KMQcLrCf2H3GajfBrUWaBVa2gn9lBAaekWL
	NeyeURXmq4wjn6VAKXq7T/3mrkOddHMTDBGbD8Pg15c9Bzl4oxU92R4m7BKz2eUkyq+zIzEvUno
	fStT/KzRil1LUhab/87grKJkuuE4UZXRb9In1kAdIXHH9ZD3+AO6pybVJMwBXSCuT8mX2u2/TU6
	p/laoTMp5Ia5+drTmP/nmwE6dbMmuR+faSMYR5jbeCpD5OHss9xKmc2frp9pPYSGJbNVCAA9Qdk
	/dgi2OhUnEkrmXUuCo6/erlsAw8NCzDi2NlILOQ
X-Received: by 2002:a17:90a:d64c:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39d9c21317dmr3906615a91.12.1789107695435;
        Thu, 10 Sep 2026 23:21:35 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm3118653a91.14.2026.09.10.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:21:34 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 11 Sep 2026 14:19:17 +0800
Subject: [meta-oe][PATCH v2] libgpiod: handle disappearing chips during
 iteration for v1.6.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGSdo2oC/52OTQ6DIBBGr2JYdxqgqdaueg/jAmHAaVQIWNPGe
 PeivUGXL3nfz8oSRsLE7sXKIi6UyE8Z5KlguleTQyCTmUkuS14LDgN1LpA3sAgo4QpZMgOCoaR
 CQBVpcqB7CgmqS2Wrjpv6xmuW+0JES+9jq2l/nF7dE/W8DzQjzgo8trvaU5p9/ByvFrEH/jmQB
 QHWSGOVkVpx+3CjouGs/cjabdu+BGmM3f0AAAA=
X-Change-ID: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789107693; l=4703;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=OnaXxOjRAGGHeri+wECCpDL2J9H3X1nO3Qr88ZgGgFQ=;
 b=FAhsDAQSF6fulbg8N871NOKe5AxOe6LQh4wiqGT3SnaOOJuO6kafZimnFNEDuIsLSHHwxeFYo
 NQz39Bz/u1RDom+urx/nrxk4Cb242sqMOsKOAyJXvhBZ4HSrblhkKBW
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 06:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129953

Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
(like a USB device) vanishes from /dev during the search.

This patch gracefully handles the race condition by ignoring ENODEV errors
when searching for a line and silently skipping chips that fail to open
during iteration.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- Revise commit message
- Add Upstream-Status tag into patch file
- Link to v1: https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com
---
 ...ully-handle-disappearing-chips-during-ite.patch | 82 ++++++++++++++++++++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
new file mode 100644
index 0000000000..e637689e8a
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
@@ -0,0 +1,82 @@
+From f6b384d2b906581e3cf072329e9bd03f3241c61d Mon Sep 17 00:00:00 2001
+From: Potin Lai <potin.lai.pt@gmail.com>
+Date: Tue, 8 Sep 2026 10:48:36 +0800
+Subject: [PATCH 1/1] core: gracefully handle disappearing chips during
+ iteration
+
+When hotpluggable GPIO controllers (like USB devices) are dynamically
+added or removed, a race condition can occur. A chip's device node might
+be present when iterating through /dev, but the chip could disappear by
+the time we try to open it or query its lines.
+
+Previously, this caused tools like 'gpiofind' to incorrectly abort with
+a 'No such device' (ENODEV) error if any chip on the system vanished
+during the search.
+
+Fix this by ignoring ENODEV errors when searching for a line
+(in gpiod_line_find()) and by silently skipping chips that fail to open
+during iteration (in gpiod_chip_iter_new()).
+
+Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
+Upstream-Status: Backport [https://github.com/brgl/libgpiod/commit/40f18f16f573e6bf091d83cb1677e7386d0b8495]
+---
+ lib/helpers.c |  2 +-
+ lib/iter.c    | 16 ++++------------
+ 2 files changed, 5 insertions(+), 13 deletions(-)
+
+diff --git a/lib/helpers.c b/lib/helpers.c
+index 479f370..6d1836a 100644
+--- a/lib/helpers.c
++++ b/lib/helpers.c
+@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char *name)
+ 			return line;
+ 		}
+ 
+-		if (errno != ENOENT)
++		if (errno != ENOENT && errno != ENODEV)
+ 			goto out;
+ 	}
+ 
+diff --git a/lib/iter.c b/lib/iter.c
+index bfd2852..7f5ad9a 100644
+--- a/lib/iter.c
++++ b/lib/iter.c
+@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
+ 	if (!iter)
+ 		goto err_free_dirs;
+ 
+-	iter->num_chips = num_chips;
++	iter->num_chips = 0;
+ 	iter->offset = 0;
+ 
+ 	if (num_chips == 0) {
+@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
+ 		goto err_free_iter;
+ 
+ 	for (i = 0; i < num_chips; i++) {
+-		iter->chips[i] = gpiod_chip_open_by_name(dirs[i]->d_name);
+-		if (!iter->chips[i])
+-			goto err_close_chips;
++		iter->chips[iter->num_chips] = gpiod_chip_open_by_name(dirs[i]->d_name);
++		if (iter->chips[iter->num_chips])
++			iter->num_chips++;
+ 	}
+ 
+ 	free_dirs(dirs, num_chips);
+ 
+ 	return iter;
+ 
+-err_close_chips:
+-	for (i = 0; i < num_chips; i++) {
+-		if (iter->chips[i])
+-			gpiod_chip_close(iter->chips[i]);
+-	}
+-
+-	free(iter->chips);
+-
+ err_free_iter:
+ 	free(iter);
+ 
+-- 
+2.52.0
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index 45af4f8bb0..d43fe90480 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -3,7 +3,10 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
-SRC_URI += "file://0001-bindings-cxx-disable-tests.patch"
+SRC_URI += " \
+    file://0001-bindings-cxx-disable-tests.patch \
+    file://0002-core-gracefully-handle-disappearing-chips-during-ite.patch \
+"
 
 SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 

---
base-commit: cbec9a20d78add94235042c601e991574151e36e
change-id: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>


