Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D9DC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 01:06:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10523.1789347989295983811
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 18:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q7aOxM+4;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso27911305ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 18:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789347989; x=1789952789; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JdNVP5MTr/DX/SH9GHys0stwZclb+utI4JQliIrbXiw=;
        b=Q7aOxM+4iLtGtrnQYh9ndrg63ulyNGL4REsfBJtoRlXu5TV7d2oOlX6+fuSk+keYfQ
         yvOyHRPzzrvlHW4MG8yhwWMsUuE3HMq9tmuQS6vGas785+6OJAcMaY+ewM0ahpMX7zHw
         NeMN/Y6YtSRQZI2H5yuNgzmnVhpM9YRGBspxsiusU6qgctMZKlLR+fuMcmeDWoRiO7Zx
         gceoepnZnPaNdkxm1CHw2tQo/7tYS3MCImbzibCmFF8/BRrFtA67ln96WMG4HGfewqeZ
         y/FmqmWLBcgB+Zrsekf4eNrG9opGfzr99hVxNLPOhTDM4yLQ3KsON4g0nqjUCUfo7brr
         PxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347989; x=1789952789;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JdNVP5MTr/DX/SH9GHys0stwZclb+utI4JQliIrbXiw=;
        b=AOAWZZSVdPNYosVeGeyORn70WvdgMNkxDB5UE0iGjAvItmXT6HQXNBKhmrCrEZNmrI
         IAcm8Uljc9NGXq8eAyOqXw0ECSQL8C/Uf+Zkb03PhegZp04D6shkO5vjFNN6UhF2DNwa
         lpueBIwdvTxHxF5FJ07UMi6//4XX82Ytmf2KLTIlKTLx38HccIPOtg7SNV5/t/Wh/+iR
         B53JhzmJSd1FUA6NfnC9p1tv7ZGjLv7+lOL9/ISiECLgNwVVhFP5wQzw0EuopGP2C1b8
         30sGcRz8/SdZGDgF6esfQ9kPFbgZBpQUJLaJ1GWito+faL2wAO/REmDAifm+qCC2mgql
         DmVg==
X-Forwarded-Encrypted: i=1; AKwUvBwVqrjg3djngMz13NiDv09cU77AhuvPfMRCCI1FRt0NWWLG9XX8/ITnLsaHyk2bClVFCgUkztNUCPdQEvp0nv8Puug=@lists.openembedded.org
X-Gm-Message-State: AFuF++llpjeSaEhrUX/ei2gplSaMp9Ep6+qV6JBN/92fUNA7VjXq9zw7
	hrq3JIYsPeMCwZCGFJ+fHz6bj92ZUa/q3AIGrzmaV9o4X51Md1/+v6OkPMYh0A==
X-Gm-Gg: AYBFou3LYCYfCNVnByvCNVoFjLN75pX+P/G3CdKrOHjI8uV9Em97CcA/eO+g27XXUGt
	tj8azWYijtNYbrCmtUIQYqYeUrF8dILecHRnFtQnBNiL15itFhmFJO4dgI+tixye0jTF3UkIyuj
	WHQsnU60PM5X0pWdRRBrSoqrd8sqIzBITKX71u60yc/3CpktYU/blT+Tqhk+W1yzy3NubO3ZkCG
	o9rF3qoxYh0azwXLf7I9NIyq674yDAuqJUpa5SegWPeQnrqUIOeadKLoEkm8upo7DkvNjVB5K1S
	gfhdDxo2y1JdW+cf5zvCR5/+6L/WkYOsG/xjuI7dXCJI8AMEMa5X2RIKjFKwuq+HyKNv+/AJHZY
	J/N1SwKGugpGXb31slwVjz+pY/iljG6BTQFOuAxGIa6YSPqLN9wKbT8MrW0CTyvD9THq9b/ZxdF
	S//7DRT8rBbDJZfstuw0FQUvEkWGD/RI9dRacMeHrhj3y4kbh8XM9NghNUpbnUnD6Btomq16439
	zQJQMN8MBWt8385IRNNmIZbfFE+Z/YiC94rciDZ
X-Received: by 2002:a17:902:f644:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2dd6c725048mr8089175ad.15.1789347988495;
        Sun, 13 Sep 2026 18:06:28 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm31308355ad.4.2026.09.13.18.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:06:27 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 14 Sep 2026 09:03:52 +0800
Subject: [meta-oe][PATCH v4] libgpiod: handle disappearing chips during
 iteration for v1.6.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-libgpiod-v1-6-5-handle-disappearing-chips-v4-1-a3cda65885f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPdHp2oC/53OO27DMBAE0KsYrLMGPxEVpco9DBf8LKUNJJEgF
 SGBobubshvDXVwOMPt2LqxgJizs83BhGVcqFOca3t8OzA1m7hHI18wkl5p3gsNItk8UPawCNDR
 QS35E8FRMSmgyzT24gVKBVrWhtdx3H7xj1UsZA/3efp3O91x+7De6ZX9wmnAxEPG8VwcqS8x/t
 1Wr2A9eGVALAoKXPhgvneHhq58MjUcXJ7YPWOWjLP4jyyqr1jaaC4XSuWdZvSyrKgvssNGNt8b
 qR3nbtitFxiWKsQEAAA==
X-Change-ID: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809
To: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789347986; l=5411;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=G8ExBy6YJ6uNslwtj+beja+hvy8JXAwZWRZIUQVb+BI=;
 b=ySA4z0m4et2nDbkswRyCxbw77xLKX/6TrjI6N6MQ1GKlab0xvbHFf1Ww5Jd48gCMlQA1qmKQb
 DipOIxtl7+NDcliF4W4ts2mqhOC8GwcSU5tgDb7G6JGD13cTx/35obn
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 01:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130008

Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
(like a USB device) vanishes from /dev during the search.

This patch gracefully handles the race condition by ignoring ENODEV errors
when searching for a line and silently skipping chips that fail to open
during iteration.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v4:
- Change patch file Upstream-Status to "Backport"
- Link to v3: https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com

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
index 0000000000..3a777010f5
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=40f18f16f573e6bf091d83cb1677e7386d0b8495]
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


