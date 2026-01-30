Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C3E6BF2A
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:25:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14462.1769790311634718626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 08:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d0Wn0e/9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so24204025e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769790310; x=1770395110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lB5b0awNdesPxjdCi+iSuJiWNBsZ5f+/uzwvji8mnhc=;
        b=d0Wn0e/9CKpqbQh4fPM5j9/5mOSO2dhNlM8UcL0JtrYZQPRAHx5cfRlxUQhzuqvBYI
         XTuNzZKaG89JPy7gkbX1+SRzJ2ZjZaMppVXrSDSJah4mfyYCmrGY15MmaO3N/ZVw5agt
         OU/OoMK0RoFXsF3FFXa8SQTj28i780RWytOsHGHrVc8dTPcdL4n0n3lvuF5DbdGnByxM
         JRuzc9EqPMKDxkEsfzc1C/+yAkqpqZVBNV6GhwUFoIKwqmhuc/wZo3zUHxo09c+/TQwa
         DzbCxlJFTrnDgf6UANrHv4rMD0YGRytuF1VyBUz6FFEzx1RBt6GsDeFfK84v5w7euqTg
         87BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769790310; x=1770395110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB5b0awNdesPxjdCi+iSuJiWNBsZ5f+/uzwvji8mnhc=;
        b=g/PfTl7kOPgcSDiDLokTeplyd/+nr1Xd2GX/oM8lGdO8L9pSag3adwgeOtr2G63vIO
         svq2wkHU32/3RWyCC9CK0PZ/iFANAStERHcuR/yOJSR/xv2Er0GCXSZWdS/3l72Sp8w9
         u4Fd6OvtOFdhCgfTTxH5rdreHjjCbgQ0ITQw5+BSihRHjNEL8W9V03NRjyW6T/N1HLJ0
         FlE7/9dD8U7SjBD+Ocp+9Fd+VqO0VQUoeP3/s1s8ljLgvQ0BxSHvuOBPCSrnknSB7ejT
         e67qwJwD+uS9Uhp2Z6eng14d1SrL6UzbBtlp2RMa2i39SPa+62ilKs4KYHasQ3TaAKYS
         THCw==
X-Gm-Message-State: AOJu0YyEu8R4Pbiy8ctB3TGeUiwVDfSFv/JVBWvtaXP2kqvg+4OVz1vw
	VhGaBxENY0XqU2NTLS/pcVEo04nnsXTTDpcDZqkfevnhfXKvCfTu1dx9lv0a5g==
X-Gm-Gg: AZuq6aLmOsb8f0ZZz3ILNbFAccomW1Zco4AUGQFHlK3Zs5KrjiB/vY++MPfF7O6oHoX
	H9WDC9Th9UM1fwi+Co0DyjFEZOkOlbH2qBMK4XJ0zFtGEBqqchMiz0W03AN4gVFISf1HKmEmaP+
	Z28UaWweTIE8IcDS3yH2EkxLVYo1Xb4U+YJtoqlebJG7UQQytgZtqRixEn/pYlomlcGkYftdAlP
	yUtQ2DWvOjEHnbhYtRVOdJ3GxinWmnpgR5cRirPf76MQTpbZKwKprFcXvdNQB6JlEkYGmrt9QVL
	ftYOkQtghGCOe7I96/1cHl7cB1CRlJkJTMSymAt388I0HjD35cUyzMOVha+NDdrMxxMahp8qWRj
	b3qMJbsfRy8xBjilUFSutvWZ7WQjIVzUXWNa5LL0K2o+HUBO68k2S3kpOhsjg8JLazkoAwXEYRm
	kNcRRpgEFo
X-Received: by 2002:a05:6000:2c12:b0:430:fdfc:7dd3 with SMTP id ffacd0b85a97d-435f3aac76dmr6032870f8f.50.1769790309435;
        Fri, 30 Jan 2026 08:25:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm23625810f8f.41.2026.01.30.08.25.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:25:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] libtorrent-rasterbar: upgrade 2.0.10 -> 2.0.11
Date: Fri, 30 Jan 2026 17:25:05 +0100
Message-ID: <20260130162508.664574-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 16:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124013

Changelog: https://github.com/arvidn/libtorrent/releases/tag/v2.0.11

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ent-rasterbar_2.0.10.bb => libtorrent-rasterbar_2.0.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libtorrent-rasterbar/{libtorrent-rasterbar_2.0.10.bb => libtorrent-rasterbar_2.0.11.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
rename to meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb
index 6bfcbec25f..ca3fe2c8ee 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.11.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8b6cb42d66e6b3c47a909c3ce678a7b"
 
 DEPENDS = "boost openssl"
 
-SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https;tag=v${PV} \
 	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=try_signal"
 
-SRCREV = "74bc93a37a5e31c78f0aa02037a68fb9ac5deb41"
+SRCREV = "9d7443f467147d1784fb7516d2a882db1abb5a8b"
 SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .= "_try_signal"
 

