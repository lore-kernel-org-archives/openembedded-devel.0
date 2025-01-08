Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7FDE7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:39:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.15646.1736329136248068373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 01:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dir6rcPE;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so1260817a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736329134; x=1736933934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVFyqlw7W0mmWTqKgagThGVUqQ9EtqeNvBL67+I9ndU=;
        b=Dir6rcPEpBnagwtc5cUz48nAePIvO6ba/NV6PyozUXcJtR7rP2mWccqfXcNL+TE4Z1
         rW5cBGB5d5K2q67oB1dYv+97fUOzmyEvTRdHgjkdsRb9XEIPux/Sc+DpamXaO0pbTLi5
         qAH/wFoDoFenNlyWQisnUBS0aQowl2aDpFNUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329134; x=1736933934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVFyqlw7W0mmWTqKgagThGVUqQ9EtqeNvBL67+I9ndU=;
        b=CAzNyB81UlzLAgS3hZA8+5+B5Pj5HSDV6jf+RdwKwG838K28ppc23Ta8bDWZgYUaNG
         ivX29+PAuyI9HGjQn0tMvkhnzt/qCO7VoLpZXraXPg9XHO3WvepqvtyijFSIt2R1XZiF
         1c6IPI/6fwReWlua1ZdoW1KzaMmGBBf6yFG9HM05dufKjL78HuNEldafmbvdz6LrxH4G
         HI1m1+KxH/f9mZFKIH/lFfEqBC4brIqSpxxKuGz05XE9dccaC1qZMwD5u7yYqzJsyx5C
         rUTxbBmdpEv9V6yZUehkNfJFteBGyDDku3brkfJcdrWidPj03AurY7OU7aA7OuKX6RbT
         ujwA==
X-Gm-Message-State: AOJu0YxsfiY37VbuZT1LQ8uu/RZ5Li7Zdlafch34Lm75LvqWdnLxXHuZ
	OUowrjatMADMH8SGAOpNMGSr1gqco+5w0lSRykzeNHkU2RTX15mXPOKIpbwtvY/GZQSfeBW9v4e
	/
X-Gm-Gg: ASbGncsfx2tT+ykfghSYpC7RK5BLEceB+wDw+644RGB2T0Jrg+S8aMBvZR8M7WyB1sP
	Q4Y5q1vmpMTJX3OuVV5u+jO07xQx0INl7I7rZGfg3joHIgcWz7YV9iXcbhxXPI64qVHw5H8XxGg
	Z5dJ6Ag8AidkpZQ/Kfwki/B/4xNn0LnzEybxHOw5VuBQ3RqaTQ6l/3A0T1hjT2kDmQgxTFbwnbx
	LHRB50XlySsgDbh5zyxp+owxcItlnPvgrsb0ucN6InMbgtn9EmbK7vKU1dmdbzRp6p71/k=
X-Google-Smtp-Source: AGHT+IEJaqKJfaLyLvhe9N4Qi8gcNXwlMK0/rP2LUVz03uUirzypX9vbktrAP9w2THWOlV2iwtV52w==
X-Received: by 2002:a05:6402:42c3:b0:5d4:c0c:70f9 with SMTP id 4fb4d7f45d1cf-5d95e8cf064mr4788012a12.6.1736329134288;
        Wed, 08 Jan 2025 01:38:54 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f496sm25179772a12.34.2025.01.08.01.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:38:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-kivy: Upgrade 2.3.0 -> 2.3.1
Date: Wed,  8 Jan 2025 11:38:47 +0200
Message-Id: <20250108093851.1560110-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114737

Upgrade to release 2.3.1:

- [Backport devel-2.3.x] Fix PyInstaller hooks to work with v6.x.x
- Remove duplicated code block for dependency management (applies
  to stable branches only)
- [Backport devel-2.3.x] Bump SDL2 deps versions to latest
  available releases (macOS, Linux, Windows)
- [Backport devel-2.3.x] Fix issue with CompoundSelectionBehavior
  silently ignoring ValueError in on_selected_nodes event
- [Backport devel-2.3.x] Label: Prevent overwriting disabled_color
  attribute when color is updated
- [Backport devel-2.3.x] Fix ConfigParser.write error with when
  --save is supplied as an argument
- [Backport devel-2.3.x] Update monitor module to use dp
- [Backport devel-2.3.x] Rename CaptureDelegate to
  KivyCaptureDelegate in AVFoundationCamera to avoid duplicated
  symbols
- [Backport devel-2.3.x] avplayer audio provider: Fixes seek and
  state on iOS and macOS
- [Backport devel-2.3.x] Fix numpy float/int error when using
  CameraAndroid.decode_frame
- [Backport devel-2.3.x] Use filetype as imghdr built-in module is
  deprecated and slated for removal in Python 3.13
- [Backport devel-2.3.x] Updated ES vkeyboard layout to resemble a
  real ES keyboard layout
- [Backport devel-2.3.x] Fix xsel import when clipboard is empty,
  and add timeout failsafe
- [Backport devel-2.3.x] Fix SDL_EventFilter definitions to match
  SDL definitions (fixes build on GCC 14)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-kivy_2.3.0.bb => python3-kivy_2.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.3.0.bb => python3-kivy_2.3.1.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index 4c09e5d9e3..e64a62bd36 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
            file://0001-add-support-for-glesv2.patch \
            "
 
-SRCREV = "9ef218027178115a66b417ae34b21f488bdd3617"
+SRCREV = "20d74dcd30f143abbd1aa94c76bafc5bd934d5bd"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


