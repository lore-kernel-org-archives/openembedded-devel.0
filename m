Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BE0CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:28:19 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21072.1762378091664857061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCveYirb;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso412974a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378090; x=1762982890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05E0OzbMzhNpG4hf3cSpwNdxuFwIFdJUZChe9hHRDKw=;
        b=bCveYirbOtwzEm0iZcUCZyD8SGDTU0Vr2bVYZeRK8+dqSE1TTTZoI3hwCHh04bEb+q
         8H+j8IMRNHStHYnCFI5yPxbosRJm3RvfENSn44xik/r6Zb4XsF6l2ixkzsDQkO3khfrm
         xVFqn1XzbCJgRje9rm+X00Uxrqtu6FmCfpspXTr8uwC1n9eKUqruliOe54BzUnK6Tpoq
         XiUzUYqeJCrtGsmrX1HDrlc+gQUvz61ZzySuLBdsvqyWBCMAisQPk7luGemLpG55PtAQ
         BBhRordkj4kMagdxcDEFCwGf0olQ0vho48uSazDstun9nlFmeXSVywJhCvNb4SKYq1g2
         +0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378090; x=1762982890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05E0OzbMzhNpG4hf3cSpwNdxuFwIFdJUZChe9hHRDKw=;
        b=MwovjKf7xv6w0DzBjb6yz3IUKWU/rs0bWmhkHlfQi5lVvETW2JgFCk9YN0UepGyRqQ
         lmSnUbJMbvhmGk/uA7fszz/5/dSyZqJG7dWLhcbruGZOkFHW4QA+7tjGBt1+DQGdaE2j
         MaMixcF9Qu5HvYqHzpqK9nJdCKWTG167bpD1f5bn5KXtRsRV0IPyIQGLyHlIIqNCJqmu
         yuqn4Bx/aug9NhFmmc/pF/yszYq58miPidh00WVSA2699x7bulKcgaiE7UWI5Nzr/9o/
         e3h1x4PbF9JiIIy9UnMeLyI6FMGE4r4UMgom1EydA76s6NxHSC31LC2LzSWDY6onOsuL
         NGvg==
X-Gm-Message-State: AOJu0Yzy24NgxIUuwevPe6vBTqVKIu9MZl0GhYjYQQ09hdW3SjpammWC
	r65qrQ9IiyqWzpmoRpkA4m5VcLYC79IW0YZrPSpzr/WKxnl+EoBvw870+vuCRIU6
X-Gm-Gg: ASbGncvsRpznjBjOgNI5+AO81AmtSmutQEo3YmWxp5yW5GknV6GKWZ/1qzpcMr26SOL
	gP3xdOIxw80fw/m936Cb6/FuWge5jA5u5cCv/D+3THryii04o4PXP4s5fRWnwd9SpNwm0a4WUyU
	vUBnyzQ0w30zOixlF6qFH9uBJMytZXxse+DBZkUxM077HYJajDGKXctBWqZwNBMgjXA58jjuooc
	r81WnGFmEdujMV/k0m/mFJ/N0i2/Cc+cCGSrjHwQqwRjWt6FS2PkcuFc2gOLXIhe7bYwPGFDiMT
	65lAwflH1o5o55d4FBtSw7XsWPznYTTMF+BT8Eb+jJZN8vDA7tDYXgH7bQPeHWkd8aXnviJtclE
	igag1c0QJNivudEF89qkCDKvXSVRUoNWSyneCmeFd8u/maLgzYTNuXXWBassIZN1qI9I1vo64mh
	oXRTMtFxmK2VNIz+puLXydsntzBw6UgcUvxfq/QiWUOxbUNj4UWbW9RKOxdURVZIgLhJ3L6C8qx
	R8Gs6ozXLx3qg==
X-Google-Smtp-Source: AGHT+IGCzOh0Olu1ybsTGLNtM3Z13msBaxxmu9Y1ltqKpQKhfGpTWnJ8PFzfuTlWg8BcJ4ARC4XO7g==
X-Received: by 2002:a17:906:6a04:b0:b70:ac48:db8d with SMTP id a640c23a62f3a-b72652bfb58mr508839166b.28.1762378089547;
        Wed, 05 Nov 2025 13:28:09 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:28:09 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 5/8] python3-orjson: add missing LICENSE
Date: Wed,  5 Nov 2025 22:26:32 +0100
Message-ID: <20251105212631.386242-9-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121334

python3-orjson is dual licensed. Apache-2.0 was missing.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-orjson_3.11.3.bb       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
index 7fdd0fef9b..694367767d 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
@@ -1,7 +1,10 @@
 SUMMARY = "orjson is a fast, correct JSON library for Python"
 HOMEPAGE = "https://pypi.org/project/orjson/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
+LICENSE = "Apache-2.0 | MIT"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
+"
 
 SRC_URI[sha256sum] = "1c0603b1d2ffcd43a411d64797a19556ef76958aef1c182f22dc30860152a98a"
 
-- 
2.43.0


