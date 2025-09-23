Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959D9CAC5BB
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14107.1758625605034948011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJY5eRcU;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so781857066b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625603; x=1759230403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tjBvC5ytp7EK4kbFTHCkI6JJXV8quqD2/InB64KjcY=;
        b=OJY5eRcUCiEh6F231/dpQqlurnN1cHAxUrlf9vR9Qke+JMkXbmCwkqsKeRdPm4w1Xw
         pe52zGvDnEKU7W+XBdAr+CSHViklIy9dF86f17aFzft/UVDT0345VNCZJu+WHCtF09R7
         2ZIKBpIIiNojYEGvjLCKriVUy8v9rMpgQQBPY2vOQiyQ7CPiHBzpLWLO7kH5yXY8VejD
         Mbd1A8bjZ0lfOpgcrys2KMDTy93JaNQNYC8Ye146fvGOOSYIWR5EwxD0j+/UF16Dh9Vy
         tITHXP34tuRp3wpCEj8Hu+TKs9en1hrurab9UAOkxngGixDsGZKrm3W8HzinlddXUvzX
         mycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625603; x=1759230403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tjBvC5ytp7EK4kbFTHCkI6JJXV8quqD2/InB64KjcY=;
        b=uRM7CcAZsj0dyq2R/OODlTs6HCwHOuMM27/C67SQYInMrRc4U3B1DyMbb04U1jel1m
         xrP7BNrVG3D3MHeTKJDHZdlaise2d6zNTKPwlmzBiXSeSxGe3ryFeg84qkd9uDh+rNio
         tt3X2oA2irqMCoco9sXjU+qJ0bkob5eAa8/jp479lm0OTk4yqUyPCY51/Zs0pRyvChpK
         PDUoRMrDi24KQ6i4Ap96gt4km8Ln8WxEDv1c61eM+ovD2FQU+iJyjaWH6e3R7Pl5u3Fp
         tDA1uEXQ8PolDmSMmOB4NgCZ1lBQUw0UQZEAZQJW4OHO6cHxKqqkPiApzukH7Sswb7Bm
         D9vA==
X-Gm-Message-State: AOJu0Yxie1D0ohrcX3Au+EGEPZJL128rpgpL1ye/rvAG7MPo2YOri+Jl
	OzeSMgUliHDunmW339/W8Vi6jLrK9H2/g+RgdVrm4um7XbebjvdO4c6lheXQQQ==
X-Gm-Gg: ASbGncuIy2A/UYRVYX6cRq6/yO5RyF2wGgNft1xd5YL1s1eKsC7Yj5XsLa7sejOB/UR
	kjNsmxqbcE77zeCsTIJdOQ+h9XBP1FBZQ669tLuXASKGEn1HG/Bq6n05qiNN/q57mPsClGYWvKb
	EHE6eLKG5b37ejDt0DqjMwlvDv5LqTL5R1Cx3NFZhAqI/Okg0v5egR67zF7nqcOtdOiToy9LJci
	XJdFkII4nALXxuq5F7kXujgwyAyhH9gQqwSuVgru31/c1fFoCZpkjGyYe6guXA9nz0B3sERvFnA
	XmEti+xhb1gbrI10cf9yZ+rqYCiIu4TeeMc6KWP6IGR97vNMjtjjYySvw9UDTDCl2iHGCxSbk+9
	sQpTw30JPaRt9RgvAMNrK
X-Google-Smtp-Source: AGHT+IEwN/fTTdMTpl9wBz/+qRe60g1hXBKt11BWWtafdtRBdkO20veSKI0c86mlYGe8SYrA2pxkNA==
X-Received: by 2002:a17:906:4788:b0:b04:6047:d4b5 with SMTP id a640c23a62f3a-b302ba08129mr188733866b.44.1758625603288;
        Tue, 23 Sep 2025 04:06:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/22] gjs: upgrade 1.72.0 -> 1.72.1
Date: Tue, 23 Sep 2025 13:06:23 +0200
Message-ID: <20250923110636.3413021-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119673

From: wangmy <wangmy@fujitsu.com>

Changelog:
===========
- Various fixes ported from the development branch.

- Closed bugs and merge requests:
  * Compilation error: call to deleted function 'js_value_to_c'
  * jsapi-util-strings: Ignore locale to compute the upper case of a
    char (i.e. fix implicit properties on Turkish locale)
  * Fix memory leak when passing a "transfer none" GBytes parameter to a
    native function
  * arg-cache: Do not leak an interface info structures on Callbacks
  * test-ci: Ignore safe directory errors on CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 352fb4051f2584e4f28fc60348772dc99df29b7d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
index 95e4bd5cc6..355894073d 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.72.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-91 cairo"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "3ef0caf716e3920dd61f7748f6d56e476cc0fc18351ad0548e7df1a0ab9bdcad"
+SRC_URI[archive.sha256sum] = "17c0b1ec3f096671ff8bfaba6e4bbf14198c7013c604bfd677a9858da079c0ab"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \

