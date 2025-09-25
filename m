Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A1ACAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:21:36 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.4906.1758781290344426611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 23:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQMww78s;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42571046185so3177235ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 23:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758781289; x=1759386089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oxYO/5My4zODQyPasxBS/KTaHh+jipchy5LnEYIl1M=;
        b=nQMww78sl5HTJqOj3aKcYHRwU804MRsSl014t7FDfr4+SpCTTePis+Xyo1lp+LgG2l
         F22FQ0bX1eHxiW9GH/PUIyuvKfde6kydCbAhJfgqTGl3Neh/jptfsLEV1jZ8jpPR8HN2
         ph3WFVUbbSFsD+XANx1h3fj47QZ+JMmstgAFcankRNXRAeyu3E58hWeYC04J+wRECzML
         VSMkfKkOALAOmk6bkYhtxTYZ5znc40fQeeo6l2qo8SHEUnlnoFcbQBhQmJehHr0JHNwG
         enN3fFj2Fl6jutHFGCNg1NPqv8vq3VNKUi+DxQWv64tBp/svBoeBL7hlpZKNXK/cYF86
         1/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781289; x=1759386089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oxYO/5My4zODQyPasxBS/KTaHh+jipchy5LnEYIl1M=;
        b=pUkhs3XObas7ZOdfB3zKeHXjNbbJGMwXIgqY5HWRMZ47bVeFkybz9r265TYPkk+zEt
         6iO9FENwRuCsPiB4ikxF3lIRVB5ROjtz1ubIL6CicpeO3gGyY9HgsRqlBiRWobs2mZG6
         0sHGYB8nKPpGALIbbgpG2dcnzCGluP/Sn4cMXjrztuj0pBsOVqjbwRBDG5wd4fVjC+HY
         ArsnPD4WJLtjliKciYqlFbpWWs2wuLbxhB/qhpJLO1yim/nQczPN7ZGA2fJaIsCDvGK+
         wXQyR6GS8MxdWJev+GyyqXkUS1RpcohRTi/OUqqfcePuEJjP90dLX+Frqajvsg68XSvW
         YtJw==
X-Gm-Message-State: AOJu0Yyp1paNGv3EeLe1W2gPnkBkYKKOgEb5sPE0Rz/3VXgFc4PStqv9
	h2Zq7ZwVgdUMWTxjh2g323IZawDBkSt+cDjzPZydcAPbrKtIivQ5TuABMHduZw==
X-Gm-Gg: ASbGnctAZmDdc4ELUzsYgHLjzhRJp25hhOsx3V8rT3PKM2FtYrii/1mvdDfx9+A73Dq
	Rul9vp/2J6fxET+rtyjorklTKc7lOnncOL8aH/rWtIXjk+Y2s6VqwI+SbbJSx+TVH4CNZ+0Z8fn
	RtYe9UJt+L4YvOcBModfaK4zwQvAkqIfwCiaww4Yn/67L245ObTo//GaRWvd+4/u4eR91OvNNlY
	k1C7nStbuCsEOIKAj0AW323B/j2LT5ndoXWKrmylJ3hq3GQYT592AJnv5+Q6ZfT0NC6sz0rxB/3
	tSDpVgN4RnCrSamgGdb1Lr+IhTrAaPpe2PN0/spwUD+/HAN4KT4Hm++xZd7wftjt/WIIE7/Xbpv
	3aUeX+2BBe5H3ue9HfgETZ9zSrwlumZGp8ygTaZIGKyNSHXnLF6hj
X-Google-Smtp-Source: AGHT+IHmjrmOvxDO07QsbIVopP2ypNcPMDsgkVmkF5IhR7SKr+SoA669p8iy5/4bPWAtBFd+0r8e4w==
X-Received: by 2002:a05:6e02:2502:b0:401:7e07:a5d9 with SMTP id e9e14a558f8ab-425955cfec3mr28144315ab.2.1758781289320;
        Wed, 24 Sep 2025 23:21:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c016c6d8sm5560055ab.38.2025.09.24.23.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:21:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH v2 2/3] fwupd-efi: update from 1.6 to 1.7
Date: Thu, 25 Sep 2025 18:21:10 +1200
Message-ID: <20250925062111.240262-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
References: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 06:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119851

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Remove upstreamed patch.

https://github.com/fwupd/fwupd-efi/releases/tag/1.7

This release fixes the following bugs:

    Fix compilation with GNU-EFI 4.0

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b572fdf8e12c18ad4d349eba692cace4ce584039)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
 .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
deleted file mode 100644
index c362681421..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4c8f95fedecbc590eb7cd98aaf97912fa36b8f2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 23:58:36 -0700
-Subject: [PATCH] efi/generate_binary.py: Use env to detect python3
-
-This enables python3 from native sysroot correctly
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- efi/generate_binary.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/efi/generate_binary.py b/efi/generate_binary.py
-index 443472a..a4611bb 100755
---- a/efi/generate_binary.py
-+++ b/efi/generate_binary.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
similarity index 90%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
index d72f2d9c53..1052437669 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
@@ -2,10 +2,9 @@ SUMMARY = "EFI executable for fwupd"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
-           file://0001-efi-generate_binary.py-Use-env-to-detect-python3.patch"
+SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main"
 
-SRCREV = "58a2928f778278ab1f7f8fcddbab81ba587a8962"
+SRCREV = "cfd0be286a9b050c1aa4bfa3f0820256903a264a"
 S = "${WORKDIR}/git"
 
 DEPENDS = "gnu-efi python3-pefile-native"

