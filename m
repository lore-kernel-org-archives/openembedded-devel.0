Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650FC4707C
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:53:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17176.1704808392155192181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kr3q7zZy;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a28bd9ca247so305131166b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704808390; x=1705413190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOF0bgkMtYMyfz3XTmr1SluWetaRTPU/SQt5fOJg24E=;
        b=kr3q7zZyGHbduO4MlmWB1Hd+7t1r+9boXZn7LQpBTrWa6FMJwq4+1EU6cGjYAfbkH2
         +AZxlQfabAYJIqEQsReHlOSHr1rMtxQo1adZetPC2IWrg3AEGX0WgiLo5dpoAxYTOFV4
         H7yP1e0Lz+1sxP9RbECZHwAxUx4TCZ88Zh11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808390; x=1705413190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOF0bgkMtYMyfz3XTmr1SluWetaRTPU/SQt5fOJg24E=;
        b=TxZglKFJafB+nt0IA6fgmMRN3/2iYK84uxTt7l3BgfPolXaKTnVns38cZsUJ2oO0Tr
         g3ufis1hzZcwLlX/Ya8ic99UJxL7D4e8TZ27rT+Q/8CguKFYHTNEchsirWIM9shKH6pg
         JLKX+5/ba9wIHdrlp+cmutHLlFzuFbJyr7zxy83W2JkMZhsN5aBDESNUQyaHzWNDOm5F
         TgzQxELSYUYU8ar0gkTUO6UjVee8I/mwwGNkfDPotcmkmkNBJ7jHDViH7NbswZWGvFet
         bavbBhxcv6JpiA8eZ0ij0jR/TmF01Z0MxDAYlKFfNw8fNvvAt9TjLRaekov9Bgc0RF5+
         iVgA==
X-Gm-Message-State: AOJu0Yw8zJRW14Kza1OhzqDZLhPSW8Pd43aQB9DbQOHro7108bz78j0+
	SmJWoWudDzuAws7vKxvUjl6NGEdz6vuCWmJl19ETBjXalyo=
X-Google-Smtp-Source: AGHT+IFdnN2A6yvJB0ijuB9EULhsF88caE8ZDZJFZItZ+gE2fIbn6Iaz8JOJhVZKUbIJ9QRg1b4NaQ==
X-Received: by 2002:a17:906:1d8:b0:a28:c1a0:dc61 with SMTP id 24-20020a17090601d800b00a28c1a0dc61mr494093ejj.28.1704808389413;
        Tue, 09 Jan 2024 05:53:09 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b00a26c2f13b73sm1084132ejq.143.2024.01.09.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:53:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-kivy: Upgrade 2.2.1 -> 2.3.0
Date: Tue,  9 Jan 2024 15:51:21 +0200
Message-Id: <20240109135121.3460927-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109135121.3460927-1-leon.anavi@konsulko.com>
References: <20240109135121.3460927-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108195

Upgrade to version 2.3.0:

- core-providers (audio): removes deprecated status property
- core-providers (audio): removes deprecated filename property
- core-providers (window): Removes deprecated toggle_fullscreen
  method
- Add graphics with antialiasing: SmoothRectangle, SmoothEllipse,
  SmoothRoundedRectangle, SmoothQuad and SmoothTriangle
- Linux dependencies: Build libpng16 for freetype so can render
  colored emoji
- Remove the extra position added to undo list while using Shift
  key
- macOS dependencies: Build libpng16 for freetype, so can render
  colored emoji
- Honour multiline=True/False while pasting, Fix Scroll after
  backspace and undo.
- Added spanish layout json for the vkeyboard
- Pillow text provider: use get_bbox when get_size is not
  available. Allows latest versions of pillow to work along with
  older ones.

License-Update: Copyright year changes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-kivy_2.2.1.bb => python3-kivy_2.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb => python3-kivy_2.3.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index a72ee14f6..9e791c6e7 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5cd0f2cfda42852c332e3b88c85fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d3bc49400e35d5a2279d14c40dcfb09"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
            file://0001-add-support-for-glesv2.patch \
            "
 
-SRCREV = "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
+SRCREV = "9ef218027178115a66b417ae34b21f488bdd3617"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


