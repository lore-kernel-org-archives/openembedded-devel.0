Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A5109316A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:38:09 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2815.1773967088600473689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JvGXOxo4;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so1302858b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773967088; x=1774571888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvPFtOZnhOgkWzdHtSkRAkdl44AHRIsv5UfFfC9t5GA=;
        b=JvGXOxo4D2QXLUq1ptsk71D9f9wxRRYDUGSwUerG0oVRxP/QLXkUsJUloqG1vvNBzQ
         smnaZIbBsiqUOL8SW/J/MToP8ktrCJcwt0fAJd7pawKonMTBwJifoWACLCDUb4VKL/vZ
         kqZChE7eePeoMcb8xCVUubHJ0Vhv5lph3LeNyk2SdNBWeMwyfx4+0NUo6LBRFPS55hFY
         qi3c1X0ARQlsQeRSmqMaRKnfZKIVj3XQUBHFsm4eylWmONMtQBasvGINCWRWlLIH8OJw
         V0z7KPqTkws4bGbQn4iOFcMRX4I5Ya1bsDrN3/vm+dUeD8y4d5R8mIFr/IJmC0b17lzK
         WK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773967088; x=1774571888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvPFtOZnhOgkWzdHtSkRAkdl44AHRIsv5UfFfC9t5GA=;
        b=IbwQ+87VZlGeTwUy8+KjT68GxbCINj9U8lkNHFnRSGEN4cSVXtjLwufT/9wjNpIqUg
         OoUX7GcKkp05Ec/OrtUi+nL1Cq88n/uiYXLH7qw7uUcV2kJdez7oPq8Tvh3mzuBcEbXo
         VgFRrMP4qUSfH2uWXoQzYjCiLzUBI+QUwoPvPf8sSkRVHdC9RDncbatdnU1TlrhzX9iw
         ucoqBoR11LVN4FCUOAV4yM8qMfQwFdHV4dX5RSj7ZNeGs1Opg4x8A0TdZMMBEzESe28k
         7vHk2BE/wMLi8fdsE+CE6fRmXxHwWDG+15gk9nzdv7u9QoOtUavQSa4IqoOPLu35/T3o
         MQHQ==
X-Gm-Message-State: AOJu0YzAN6PW/bciMahK57Jtuv/9XP1rQyNWrOmSmxp5HgRHvJP2Q6Ru
	4Cpq3a/Q3DyIDIhWrjLWhByIpX1XrTazMRwsydWPWfXARvkIqnBYOIop4B+Cvg==
X-Gm-Gg: ATEYQzw1n0TaR3gZPyvrcJAkqly+TMiu9fG5S4Rcktze3LiKTNELhy0fkPzaxN/cHFr
	0RwoopUJnkpiWAPlpN5aw+zx2jzjWjvUF9n0eeK9G/n8ZWUm8U5Qq4Jtel3b3rAiHa5OSK2dbkh
	gwjisMY6INSjd0qv2/0LcRZguwU5wkTGNW9iqINd1w2jMg6GCE9ZCOyzxdGk0k7vTy9Lg87YstM
	BxEnS5suLDSHDZuu2S6nYjp3UblU9llbl1ytJh6OaK16ipMuJCVqPy+hpF/8NpA+khpYLvlpxo+
	9zy7JO9XeHqKojxhyUFaWUxhSkt15XshvU4GiqmzkvvijJpNncG1b5lfHbhQY+4ORqNmaHQvHV1
	WBDohw2NxtipTJu5ZONuuXijtnBfRUgI2Nq7UNttHQWVYP4RubjBEEtwHeRpcW5MhU7G9AD64EG
	lVvm0Q96cjc9LuZ/JAJ7r6JNxegzIFoiJIx3g=
X-Received: by 2002:a05:6a00:1143:b0:82a:687e:c048 with SMTP id d2e1a72fcca58-82a8c2ef7camr938035b3a.30.1773967087801;
        Thu, 19 Mar 2026 17:38:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1e59sm386529b3a.13.2026.03.19.17.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:38:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] fwupd-efi: upgrade 1.7 -> 1.8
Date: Fri, 20 Mar 2026 13:38:00 +1300
Message-ID: <20260320003800.2760106-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 00:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125417

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also include tag in the SRC_URI

Release Notes:
https://github.com/fwupd/fwupd-efi/releases/tag/1.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fwupd/{fwupd-efi_1.7.bb => fwupd-efi_1.8.bb}       | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.7.bb => fwupd-efi_1.8.bb} (71%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
similarity index 71%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
index d6ace116e7..8682d97c06 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb
@@ -2,9 +2,9 @@ SUMMARY = "EFI executable for fwupd"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main"
+SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "cfd0be286a9b050c1aa4bfa3f0820256903a264a"
+SRCREV = "8572a93e81e7110b88445d1907fdd73982557347"
 
 DEPENDS = "gnu-efi python3-pefile-native"
 
@@ -29,9 +29,3 @@ EXTRA_OEMESON += "\
 
 # The compile assumes GCC at present
 TOOLCHAIN = "gcc"
-
-# Multiple errors like below with gcc14
-#| ../git/efi/fwupdate.c:611:20: error: passing argument 5 of 'fwup_log' from incompatible pointer type [-Wincompatible-pointer-types]
-#|   611 |         fwup_debug(L"n_updates: %d", n_updates);
-#|       |                    ^~~~~~~~~~~~~~~~
-TOOLCHAIN_OPTIONS += "-Wno-error=incompatible-pointer-types"

