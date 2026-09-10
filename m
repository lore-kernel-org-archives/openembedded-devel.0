Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C25C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:41:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4089.1789004518492834008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 18:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=klO0elv+;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc48fe04342so467369a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 18:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789004518; x=1789609318; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mqa7VfNDoDy5kvcisCnxUhZZafprysnKseDEVn4pN04=;
        b=klO0elv+cn4f1FL/djQSadFhYo83pe3oVV+4KEtqMO98v32/FvIrxTb7wQ2Kwy4S0x
         ptXrYFnFA4Qd6vDxGfE2tCyzwKq2GMhP4yZ4r4S0JSD36dDo0ff2GfLtS9oZOl61/u3r
         KLqsqH7VOMs+fPMs5kA/zj4uPyCBkM4z3ihy+lJx+H5xJWRhpg4QoLnQh84tOgYcUSBi
         uHWQSbeXZ/vZW5hvBttlbK7v+dV05mGWeep/9W6UJdcEV2Wj1V1w1HSqkzgI1+m4FH67
         5+a1Yvf7h05lesJ9fbppLvEd29MXdAeRBOLDSfa7lLry/pVEtworJ9ctnlBH8vJg1JAI
         P+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789004518; x=1789609318;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqa7VfNDoDy5kvcisCnxUhZZafprysnKseDEVn4pN04=;
        b=IvWz5c+Yj494YvJ3qN9m7X/ca3WgxLfbFOJN+yAtyz55B5KfKijk+KgRSKD7DH+BRc
         5gAoXp+O5OsSXaIeJkuAav4L5Trm84jgm0p3YpPf/PALwUUY2JXW/l17L0whm89WtqIm
         yiPtMZaw1KoIN3hcVxfKIlmIYwpRBBjY3eelfO4ZAXaGGfyqLd70GbljSzRB8a9itnbB
         wnSKcAMTZthWjJFQHZJQcgYTIO/GnS1AF1lnyfraLJb9zktXTRUDxdtHOBmLzGswBj6C
         TtOCQs8R1rxQPyDgxcIk2gRJakm5yyJrpdR+ba0vIYOzoTXzgAVF/V1vm7Dpn3O5bzNM
         RZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpQM8CAWQpuZTaWMy93s31pIK8kHmr9Ik3OFxk4EKYgs1r6CbvV3tcPSaSMhk2lHileyoT94xeSa6aRrnMex4/+iM=@lists.openembedded.org
X-Gm-Message-State: AFuF++mvUBhfStplWNcQ+jce7SR1pVERclPi2zP0nRVNKv7E36hwtuw1
	GX5m7rmREWWobPBtFIs3zVtSr3uxgraTkDIoUwS8m6j5mmfFMa2EBy8h
X-Gm-Gg: AYBFou3LbXxxoy11rBBeJBGS2C7yzRyHisI9Fg2c+fe/undehXxP/m/pdtto6DwecjJ
	NSrCRpYO1L0trZ+r8MT4emtNdEs3VcItz0tf4KHvfT5ewejwy7R59Ai/mJyB6Mpi0GDZto9/g0b
	Ht6C2v7uOp3WszHoIqCRpFLzoQ0AiU8YKy5lfcdTVpsh9GdPsrnbhlOiEjkZarQKESEewkRJ6ex
	H7bM6WDu8cbeUUaDC521ihiIyslcVBEoESsEPLSOj4kwuBGttqzkWo9INm4RODe4TaVgDxo7lWs
	51hy6hAcU63Ak5E6tLqbC4MNVyAfU/fLbZ7FM82ihOQVzs0+XSdQzSJBoSkATBcJSA1hcf4SwcC
	ICVsyzO3iZtI8LmDuYw59KmCX6CpE5+hfeZJTW+OdvwU8oaE5q1FwiXEEMoi8PaS5RCAb63o6pJ
	/DnquYMw2fuNc122bVQU2nCD59XUCr+0Au0xoUfxnyAJKTLxWl/WjQ6XfMAeTtGgJ578zM7i+wN
	Qbf4ZI1TuVTcpHcoZRmI1iuoIVXe3vQQ2Yrvyg5
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr56691510a91.18.1789004517712;
        Wed, 09 Sep 2026 18:41:57 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm965865a91.16.2026.09.09.18.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:41:57 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 10 Sep 2026 09:39:20 +0800
Subject: [meta-oe][PATCH] libgpiod: handle disappearing chips during
 iteration for v1.6.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEcKomoC/yXNywqDMBCF4VeRWXcgsdQ0fRVxkcsYp9gYEpWC+
 O5N2+UHh/MfUCgzFXg0B2TaufASK+SlATeZGAjZV0Mr2k5oKXBmGxIvHneJHd6wjvxM6LmYlMh
 kjgHdxKmguqpRWeH1XWiofynTyO9fqx/+Lpt9klu/gf5Fq8GFBjjPDwfYNxqWAAAA
X-Change-ID: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789004516; l=4620;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=mBSUZdgBQtGQhcY8gjyGmw0Rie2rp1ufsCuXvS75DIo=;
 b=0X/cUyqYaYFiqseLzAhKfBd/cfGioKjETM+6gi6XI3ASsOTxOklM+6GKeFXftvXWJWRBQzvsT
 GaILqiikgvkAKhdpRxM/VwkaePEDB7X9byDWE7NLBfcunG9mv3wyG1A
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129902

When hotpluggable GPIO controllers (like USB devices) are dynamically
added or removed, a race condition can occur. A chip's device node might
be present when iterating through /dev, but the chip could disappear by
the time we try to open it or query its lines.

Previously, this caused tools like 'gpiofind' to incorrectly abort with
a 'No such device' (ENODEV) error if any chip on the system vanished
during the search.

Fix this by ignoring ENODEV errors when searching for a line
(in gpiod_line_find()) and by silently skipping chips that fail to open
during iteration (in gpiod_chip_iter_new()).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 ...ully-handle-disappearing-chips-during-ite.patch | 81 ++++++++++++++++++++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
new file mode 100644
index 0000000000..bbf650e565
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
@@ -0,0 +1,81 @@
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


