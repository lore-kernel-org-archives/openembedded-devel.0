Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C3CC36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 15:53:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.27404.1743954780262003388
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 08:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfJoptRN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7398d65476eso2651703b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743954779; x=1744559579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QY2pLgzObcpkBMts6uXNi2QuRKk2TT/XSj2V0bB88ZM=;
        b=DfJoptRNivO/9J6DoTviWAF3NkUikAjF0yq9Akfl1K95Zdsqe63WRrkNpuuyMOVbo+
         6F2QUqm7/yU4/SUBRzeGuZX+BR7uSHUJix+j/S2zOYnMk1BwFCMf3yKxRrGAqsyJxm+k
         tMPgmsTLmQkdwffrw3PIvXdVSvWJ3sV0udfjfAMycEm+/l5wcb8ByTWvMNpXOLlVF++p
         raUJesU0+qgUcc4Y4nCJPJ3x3b88WMXrubQCX0Wy9dfQrZ776hV1LlpM7618aZDwdoBh
         v2TFKy0HPshrt1wTaNPB9emXsHBg62ziNYuCoG3VkHToiFWb8X6R1Ypvjnnh9NWxPPMR
         mKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743954779; x=1744559579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY2pLgzObcpkBMts6uXNi2QuRKk2TT/XSj2V0bB88ZM=;
        b=LSQsvGJh5+eDQBgoGw6CfOItLiOa4wSHAst7Xd3HvdRB03jWjiIxGsomWMK3WTk0ZR
         QtNzPZzKX6cARbrxroY2+rHa503ZojgUWjXUz2Y3qROfO1HadhPeCjJgla0XetEeMN/j
         rOlMYIAOB7Ab8bR66EAxC0A7V5LoxEeaKYt3pb52DK+834X+ckoR29twICbAf6JPC+Zb
         Vos8N44/TGkjX31ovXP9l09YT94PHpf/M5Eqa3NtU3yDMYQgvAFbj9QSoyvVYvi81YTf
         hLrmwOMI44G7TBrPYLGepzbt2ovTNDIJhRQm3nQuqtWhMGT/O6Qc7wX8xFoveCILaTI/
         4vYg==
X-Gm-Message-State: AOJu0YxskDKEJ5AGplhvIdPrhq/9tyQzj9nd+f+/nGXiXc6oid9X/Oqx
	Ra1+N/WyoD6LuFwlHDdnnizlQkLdctMPKaZAxr5TlVJmSTFaY04yqVVSvbvY
X-Gm-Gg: ASbGncuTQrZv1c5/qbYV7bo2hFI/Eog/GFl3PTUGV0va+qoouNtSg+iYVALQpPle90U
	OlpGY99POPrRScirgbCInePA+ddgQ+1kEOW6HfMlYOJpTDpet5QnWRA7javO0go3nD21u77hMuS
	9kKh9yLvkzgu7AzJJVvSFakNaorUtkZVrMEKssi0340NBkgSar2Lm+FpzMfgja1G1OBsO0ofyWA
	RtILakCr0eqq5xFJROOyEqOX2puRbv+PDGxnEE/8PoWu9R/lSLo1EsqcOnmRO8+EwEx+H19Gw65
	PNzHKkUlUVwHFNZcVderuXC26ybnQtZwqKZK
X-Google-Smtp-Source: AGHT+IEXNmer1Momibs+0eKuYFp6HzUlOpl5Ubzj8VtecMxBzLWCjLrpFdN+OcqoS66P/F0nwjKJ9w==
X-Received: by 2002:a05:6a00:4210:b0:736:b923:5323 with SMTP id d2e1a72fcca58-739d6584122mr23475630b3a.10.1743954779152;
        Sun, 06 Apr 2025 08:52:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea1540sm6806105b3a.115.2025.04.06.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:52:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
Date: Sun,  6 Apr 2025 08:52:56 -0700
Message-ID: <20250406155256.700863-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 15:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116610

Since this file is downloaded and upstream does not version it on changes
we have to ensure that we store the versions in DL_DIR and also ensure they
do not step on each other

Fixes
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Renaming /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt to /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt_bad-checksum_f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 302b86009a..02f952e528 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
 SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"

