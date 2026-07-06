Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FD9C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:00:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147020.1783328431267911355
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DsQtY8ll;
 spf=pass (domain: snapchat.com, ip: 209.85.221.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-474560436c3so2701465f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1783328429; x=1783933229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzxMyZQZ0Ay8p/8Sd/DtG7Ye+xIV/eFRR4cqXZ4Hw7Q=;
        b=DsQtY8llOprdnZCatt2+ndw0BwEayDt+snimHMbAzyOZSYScpWMSVOuJ2T4AQLoMgO
         OQkEFsIdbUZjEU7QvubDwY413fIsydLtlpG+R4hGiAsph7dyG8fvq0kSpZpvBbkJJHLa
         /1da41Gci/oDDQYtJ45MtvQ58y6phO0qzcMrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328429; x=1783933229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzxMyZQZ0Ay8p/8Sd/DtG7Ye+xIV/eFRR4cqXZ4Hw7Q=;
        b=nlMUBnJj6HbdLP/B9swhIHalwGlP4qePYeScNfI9lD4y1N5EW8VieQUvIY7eZUDUme
         fBjq/U+vw/b8iU3Z9nPyzRe1/WCc7sjnZ6mvzzhQ8+fbDv9O10IYXhhnRMc+/4cpjMIT
         eEoiU5Sv09qwid56iJ/hXbSnQsz4A0tQGvyYHEswxAYWfkhPa8EykWl9Gp6sgpS+Hzir
         oY6ZMh7YOwjgKncdFPWZGKpE1b+U2m9suVzFT2PyUPYxn7FuHNNyYD4R97XklQTcMYgp
         1TB9wmmG3crt2sIgKIjg0zU5ov8yHQ84wkXZRNdhmyI0lfpKgg7GXRlKGpmpn/Sj2zX2
         4ldQ==
X-Gm-Message-State: AOJu0YzdIl1sPNwA/ByfnURdltCiQkl3Y/Zx7r/8dvrfQ5EOrrP+gTOC
	CIvMZPWwhS6jTOPJRDhB2AQiJCwSe/LVh8hFm1EK5yJos74NoIiZFXAVv32xm4C7TGFwDLF5iIP
	KxrzCDwA=
X-Gm-Gg: AfdE7clvUDvMoK2zSw66Bou7AVr1PJ4egUpnwjLJi4Q35Hq/ektDbWxkryvOoMvP69S
	itFBHBtWdvkF5G1mXYXkhfAW4QPfhkngdHbLWaxHF18Dn6spTDmUmfwgSd2cpUcCrlQRaPVlbTc
	xqnkHmIt/gn8BgnDPFkyOCuBZhlnQWiRSGEt0BdlMAWQSIf5EGfIrvuL9Mr2He/vPuRZPEHa2Fc
	Ep4P2mI5C2Zhl8Cu9bNvilOygzGSKxhNJrpk84+d2ZLE1A2CuKwqhHlwZ8EmpOuy0ZNHC+yoyAS
	u0EmbZDWf2LaDp1Qp6uGLbebg7mLl4DA5YGLhFDVaiT5cikd+A/CxiGhMRrNp48s4BvTNgYqJQN
	oSKBvdVYZVUR9aF2njjux6k3uWJloWAd32U241/WG4gZkNo2ecHD9LKt410RKWjw4mWEJGbijiu
	MlPDudEr7sLvrAx43nog/oedIZNVno24N/tDivP5Y1/Rb3R15KIZdonlXz
X-Received: by 2002:a5d:6a04:0:b0:473:1ccc:15c9 with SMTP id ffacd0b85a97d-47aac6da5d7mr8301384f8f.40.1783328429243;
        Mon, 06 Jul 2026 02:00:29 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm23383267f8f.32.2026.07.06.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:00:28 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH v2] ttf-noto-emoji: upgrade 20200916 -> 2.051
Date: Mon,  6 Jul 2026 11:00:06 +0200
Message-ID: <20260706090006.240170-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128032

From: Etienne Cordonnier <ecordonnier@snap.com>

- NotoEmoji-Regular.ttf was removed upstream in https://github.com/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b
- A new COLRv1 format is provided, with a smaller file-size

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +++-
 .../ttf-fonts/ttf-noto-emoji_2.051.bb         | 23 +++++++++++++++++++
 .../ttf-fonts/ttf-noto-emoji_20200916.bb      | 18 ---------------
 3 files changed, 26 insertions(+), 19 deletions(-)
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
index 0000000000..6376b0e10d
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
@@ -0,0 +1,23 @@
+require ttf.inc
+
+SUMMARY = "Google noto emoji font pack"
+HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
+
+SRC_URI = "git://github.com/googlefonts/noto-emoji;branch=main;protocol=https"
+SRCREV = "8998f5dd683424a73e2314a8c1f1e359c19e8742"
+PE = "1"
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


