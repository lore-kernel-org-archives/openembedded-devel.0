Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250D1C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:17:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35504.1789118275475061607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e9DqRg7f;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso860217a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789118275; x=1789723075; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oc8RNZ1SF/Tm0hVYw3m120AIeUkQsIiL7gsGCiAUzdA=;
        b=e9DqRg7f9bVXHlVe7vDE0m3y9MKN+Vb5QA+gC9tIuiSxB5DcpTefjjR0cXT1axgH65
         tphbYBO5Mm7AjMjSPTI/v0wZQNUy7cVYfa1gFNsSsEUXLbCL1UDzqtxFuzvKqE5TGTSP
         8iNFES0Ao+momDLxVOgTXUKmpJw36ZbXEkXcKBWXB/TYruGvRKiL/rtTWo+dgiKnhO4O
         O/VqP2Vru4Vy4weLPi6NRWs7pRu/C0Mklnloq9G8rFUWtYYXsLqZnjZoyVGiHYub9w17
         /Xs+j3VyueiIaVEp9I+C35gaQR0+K31QobPcVYSJXltGGfLEasTBkcoWNgzlL0kKcQIT
         BBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118275; x=1789723075;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oc8RNZ1SF/Tm0hVYw3m120AIeUkQsIiL7gsGCiAUzdA=;
        b=EBZv08Z/UhpnsBhYrOQOhoJL9aXOfenkncaCcIniwqjPMmRcWpGr+UvSVpmG+iMNdz
         xQCnrJet8dXnZ6ZeAadipi+iTri8R3nrXg2F+6v/qQZdHCheOBAdevrSU0H5TRXPZgJB
         Um4v1+Hs/KnZm2xmBpXyySfjxBQKasKVCncrpuxi5VP7mr86a54WRuWuka5XOe9khmDa
         pjhzq9DUxQAXAq/yKNnsvL7yJgwo5ICxbGCyEDpIBRVdZ3qcZSv9Xp6iGzOsfgZmtT0J
         JiFne7hDzOdKghbkpP+8WJeOsNnpPpZKdd+I5MJhUxw6dptQdlwHexSceE0rfk7d6bkj
         OcIA==
X-Forwarded-Encrypted: i=1; AKwUvBxkYQFsQvndvSIDuFwMJGyq9ogw0Ir7RkXBRMTW0RLE2m9MvNyVuCfhjODuDxPp4g/Dr1zXXfunJwzkJtOcdz95MBc=@lists.openembedded.org
X-Gm-Message-State: AFuF++mUfjAnIVQr6CTQI5Uvpk1wSCaNipmtmMuLVxGqFrZHgWzO6zUS
	BpAf2lNIgfR90/q0uc2FpfTha0RpzBF0DTyuGWSLYfAEi6hnCCrxRJM2
X-Gm-Gg: AYBFou01i524VUCeYD6LWcbdSJ+4J2mXeLVqfU3XDnIUGQfLnFOleJZlOoA0K0tDTcd
	3yLDyhMJy9FeQczD5Vr1kyD9nWQlpxy8Usva8h6CNQWCg4r0JLGyqzE6oTLlHai9onggki96bHE
	51L1L1ZJGeYzmm2fE6PJ7/7PTQf2+Jpffyp6OKeUFaAvSNcQUzaOHrvK9dERG7FrcJzGJtxJvjW
	2fzmiAzXdogPhGU5tsMwGwx/1xX48w0MJaE3jd2mBDamh1UK41n+Lu53B0UnIONk9R3sWFkE7w/
	P5q87TrbviEBRRCKgpx/640PbscNlmi9BIeayE6o4m7NgIaF3UU1JWZ75W5g+pfZ200Cm+hcoOG
	7ZnWFqYRaEoro4NpgK5Z4pZt2Ab50vVAUogCTGFdd5duTBQ5Rxxa7mE1kRHhVPaDNn6r6cgOKgn
	SY5YFcCINSax4Y2yQ5u4J3jo765V7r1M9sK9URml3M1h/tOkfxwTY4GUKp5yjzrvt/feF/m/LKU
	Hp/Co0t/U6Efy9TNOWcfY57MJ+QXypuMRTsR8jZ
X-Received: by 2002:a05:6a21:e587:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3dad26c3a0cmr10898194637.5.1789118274558;
        Fri, 11 Sep 2026 02:17:54 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6036fd7sm903192a12.0.2026.09.11.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:17:54 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 11 Sep 2026 17:15:32 +0800
Subject: [meta-oe][PATCH v3] libgpiod: handle disappearing chips during
 iteration for v1.6.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
X-B4-Tracking: v=1; b=H4sIALPGo2oC/52OQQ6CMBREr2K69pu2RBBX3oOwKO0vfAO0abHRG
 O5u0Y1bXU4y8+Y9WcRAGNl592QBE0Vycw7Ffsf0oOYegUzOTHJZ8lpwGKnrPTkDSUAJR8glMyI
 Yisp7VIHmHvRAPkJVVLbquKlPvGaZ5wNaur+/mvaT4627ol62g2bCRYHDdqsOFBcXHm+rJLbBP
 wK5IMAaaawyUituL/2kaDxoN7FNIMlvsviFLDO5qLpjyUWBUutv8rquL1rLZqtXAQAA
X-Change-ID: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809
To: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789118272; l=5150;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=dbmnp06drd5xgvSsDEPWBnG664jAZ4JMaz3iHEhQlOE=;
 b=uKr10RrysEQN2czouNyuxHGGB66WMTian1+PAy8TNX+aifl285ZYrjzr3eYI24eaap6HSNAJY
 R2E6XDYIkCGA0k2vmwdimjsLgzQLxA7JpzocGU6cmr8/MfJ9acENzHi
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129958

Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
(like a USB device) vanishes from /dev during the search.

This patch gracefully handles the race condition by ignoring ENODEV errors
when searching for a line and silently skipping chips that fail to open
during iteration.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v3:
- Take the patch directly from the upstream libgpiod v1.6.x branch
- Change patch file Upstream-Status to "Accepted"
- Link to v2: https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com

Changes in v2:
- Revise commit message
- Add Upstream-Status tag into patch file
- Link to v1: https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com
---
 ...ully-handle-disappearing-chips-during-ite.patch | 83 ++++++++++++++++++++++
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
new file mode 100644
index 0000000000..ab8d5a673c
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-ite.patch
@@ -0,0 +1,83 @@
+From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00 2001
+From: Potin Lai <potin.lai.pt@gmail.com>
+Date: Tue, 8 Sep 2026 21:05:07 +0800
+Subject: core: gracefully handle disappearing chips during iteration
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
+Link: https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab9568@gmail.com
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
+Upstream-Status: Accepted [https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=40f18f16f573e6bf091d83cb1677e7386d0b8495]
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
+cgit 1.3.1-korg
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


