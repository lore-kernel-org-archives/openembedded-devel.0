Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6173C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:38:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146745.1783327075680723395
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=QbEt/T0g;
 spf=pass (domain: snapchat.com, ip: 209.85.128.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c7902f47so15688645e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1783327074; x=1783931874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ILh8O4rt2yyz06s7mnM11PqhpyPoBEE49FX7Tu84uc=;
        b=QbEt/T0gAee2KsYIAKsEuU2ep1kbV734++GQT4TboRTrrLOewUe0jKnQQI7X3WB+e8
         WMwhmqqkm8K74JTr4lZwuuNOf2hyWYW2SabScwycdAKRWbI/HB1bJuLdlvIoWr2beo1I
         d0zjFHqN7MpOVfAHMAX1md9h8kgyoTQuhJdRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327074; x=1783931874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ILh8O4rt2yyz06s7mnM11PqhpyPoBEE49FX7Tu84uc=;
        b=KZf0yZcTTC2dmJaOjqkqwmTKOdxJpKTEylwlwue6oaetuk0eVarAn5iGiE2qUO1Ky1
         Nc/YjM0JyA6TUP7WENGSCAF7GTiBJnkBFT1xFSTacCQvTmBZJqoszFuYycEBg6c3GfAh
         RD1FDz2VJxNvhshaUp8t8A08lRs6OCo0GOHYSxC6m08Y8uO+XstFFh5wJKGjrOHiPzII
         KXL7tbRc3p9jNWsz8kfK3Brz5EkIC+kodPk7bzVJVAtNe5AKVLQK2m92ebMIS7NEbUz4
         hTu+dT5LGsCrkiYVktSK2s64dcz6CduOg6CnEhCmQkdibfsfGMkXx3sVSTpAKCazRwn9
         8H4g==
X-Gm-Message-State: AOJu0YxF0hMEtm9DYoJadUavoSlbRyxWWAjFfujBkeO+5rpDkMw5DhJn
	IUMuUwsRJOriSsUQcj76KxNnfzl5T97MOqvKoURk19cU4h4Rze5xZUz1xdr69k7YmEKNrjyOtyo
	RJShfm6Q=
X-Gm-Gg: AfdE7cmhFPwr/GKeWKvuoxQvdZ+hfxwMogDl4nyomT1aZacyF145ULJiq2Xy5xW7PTn
	f1kEb9an3zuDVUf4yFERLk89yaOlgTrHwq6cVr+pmDUwKRpVeBN3nxDk9Jk4cxLQPklYvZpnju7
	Xi+3823yTNFMNx4T0PxNSk0wpP9+5tmc4OmzFjP/VfGqhMn9OTjHTgGVx+iRZ48+cRtp6Fuohdc
	vWtXWdjg/8xvclWfekC3xJ6HjVSrHcuGb9qs9Ol4lYUb/p/ZgqeKTNSDO+V7mRAWVaI2jAWFITY
	00HchHkJPR/SQk8au4Lirg7akHpK+0al++6jA0eDz+eaZC0gtcKNB94e0lRB1Ab0wROGYSla3Nc
	3oSFKyFx8i8oibRRlp7y7eLNp9Eh2hLzkb5RdXqBXGdPpi/7/SOMOyc6aEZrgHZtYokhlp6C5Au
	Yu/RZzFfyhu80hJwqaNZM+Zb9hZMDPuqBeG9F60L4JcG2vJpt/fR1pu9tfwQ==
X-Received: by 2002:a05:600c:6212:b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493d11dd855mr101802465e9.15.1783327073500;
        Mon, 06 Jul 2026 01:37:53 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm23491078f8f.11.2026.07.06.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:37:52 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] ttf-noto-emoji: upgrade 20200916 -> 2.051
Date: Mon,  6 Jul 2026 10:37:34 +0200
Message-ID: <20260706083734.171406-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128028

From: Etienne Cordonnier <ecordonnier@snap.com>

- NotoEmoji-Regular.ttf was removed upstream in https://github.com/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b
- A new COLRv1 format is provided, with a smaller file-size

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +++-
 .../ttf-fonts/ttf-noto-emoji_2.051.bb         | 22 +++++++++++++++++++
 .../ttf-fonts/ttf-noto-emoji_20200916.bb      | 18 ---------------
 3 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
 delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a4b03e2a88..c3600d5c95 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -556,7 +556,9 @@ RDEPENDS:packagegroup-meta-oe-graphics = "\
     ttf-lklug \
     ttf-lohit \
     ttf-noto-emoji-color \
-    ttf-noto-emoji-regular \
+    ttf-noto-emoji-color-noflags \
+    ttf-noto-emoji-colrv1 \
+    ttf-noto-emoji-colrv1-noflags \
     ttf-pt-sans \
     ttf-roboto \
     ttf-sazanami-gothic \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
new file mode 100644
index 0000000000..215ec9d14d
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
@@ -0,0 +1,22 @@
+require ttf.inc
+
+SUMMARY = "Google noto emoji font pack"
+HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
+
+SRC_URI = "git://github.com/googlefonts/noto-emoji;branch=main;protocol=https"
+SRCREV = "8998f5dd683424a73e2314a8c1f1e359c19e8742"
+
+PACKAGES =+ "${PN}-color ${PN}-color-noflags ${PN}-colrv1 ${PN}-colrv1-noflags"
+FONT_PACKAGES = "${PN} ${PN}-color ${PN}-color-noflags ${PN}-colrv1 ${PN}-colrv1-noflags"
+
+FILES:${PN} = "${datadir}/fonts/truetype/*.ttf"
+FILES:${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
+FILES:${PN}-color-noflags = "${datadir}/fonts/truetype/NotoColorEmoji-noflags.ttf"
+# The COLRv1 format is a color scalable font compared with the previous color bitmap fonts.
+# COLRv1 is significantly smaller than the color bitmap format (~5MB vs ~11MB).
+FILES:${PN}-colrv1 = "${datadir}/fonts/truetype/Noto-COLRv1.ttf"
+FILES:${PN}-colrv1-noflags = "${datadir}/fonts/truetype/Noto-COLRv1-noflags.ttf"
+
+do_compile[noexec] = "1"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
deleted file mode 100644
index b5dae22a9d..0000000000
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require ttf.inc
-
-SUMMARY = "Google noto emoji font pack"
-HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
-
-SRC_URI = "git://github.com/googlefonts/noto-emoji;branch=main;protocol=https"
-SRCREV = "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
-
-PACKAGES = "${PN}-color ${PN}-regular"
-FONT_PACKAGES = "${PN}-color ${PN}-regular"
-
-
-FILES:${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
-FILES:${PN}-regular = "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf"
-
-do_compile[noexec] = "1"
-- 
2.43.0


