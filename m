Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4A1C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 01:44:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6576.1738201441428125406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 17:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/hxVXSy;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2164b662090so4756935ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 17:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738201441; x=1738806241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASLWOMChtm/BWHamdM7Gavo54SwFdqrEfRe+vKtfQG4=;
        b=J/hxVXSyeKNgc0UofhhYqod3Bmy1u1ZxUWun01lMRmSdWYk86lqqXnKLtAS89RnEZZ
         /hEhy8Cs3OIaAxW6+XAacZnp7n5s+1UW3BMba50hjB/bCQcCddES71dCYdVYlsrEf+wl
         Rlsdhej2Q6PzU+9c01O8dkmGJs8STR0IjpMLcZx8Am8sLAShExr6zVmvuJVt17tfTMir
         YdYsBe2rf5Yq7c2pf5iN4tRkQtMbIW4l/mgdKTNgQxJbr5LOSRcJxu4iPZ9499H+1qTt
         O7k5YObuNniOQzY/gFfg7vOgTrDbusV65WC9kc6lFebj1oxRf3O7qXYmSKBq3fhNGWLi
         wjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201441; x=1738806241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASLWOMChtm/BWHamdM7Gavo54SwFdqrEfRe+vKtfQG4=;
        b=DMw5Lp22d0tRgnPwkaN9W3yCz0tQwdRpscRyXBBC8beMevflsDOLvNGNpSvFo4cB0B
         osBngDo6v4EIy92p+M0KrhCSaoEmeOmZiOjlMtVTbBp+zrgDJSsPIF32RdhqXU21nuEn
         +6rdzcJaXCTxBba2vq0eexe8SIzOsV5RkZtqce0Z1ojN+7sfnyMZdi2Jp0NJWY83gAai
         Vfrm5m9a7Qj5siO8DV3hvKnWsQUOtfu1V4kI05LORMej9tjvExA8WX6nw/xCUEK4onCq
         gn9ob7fSY0gTGlDxxdH47jOe/i0KGyCIEOpFPdCq7hfBbFys3Oz4oAqaC6tLGYkkiGKS
         2PhA==
X-Gm-Message-State: AOJu0YwBFkdrIBpYa+gYAlNhqX6TTCWFbj5fj1CgpAxOfJN9nwPgdSJv
	wPv8FJbMnk2vIvwgF+NICcy0SL+oUp678eqzQGYm+USqKfn6AWFKKwGCw8He
X-Gm-Gg: ASbGncuu0nmUWoXWJ6bJZMRfFXmEa1f3qtMxbP+87jKAip7yV4l+PoFDTF4ZI5yldVT
	Whp9j36Jqb14FpZN/0hiY/DHQWw7ooZb828hXOdIn5gwWSLsnTPdhKEVGDmAovRbaQAqlp51HVW
	UtVZwjff/4+5vjCyIAfyHXldunVgTIsZlWIjxQbeym7gvCTQ4FHY2OnBtVtDGDy1sehyzDOudDu
	7Bb/wWGaFuULlGNPdfoxwvtFFmR62RxDCtkQBoSROwTiNHb571S8dRVLRfImOsTLSRsY9C3dhy6
	mqbnD98=
X-Google-Smtp-Source: AGHT+IFs3yxzmYIH39N/ivQa3tt66uTAt0DXrChfFurEHxEK0t/q5ddGLnQgLhviBNtPaU45MIxAkA==
X-Received: by 2002:a05:6a20:7f84:b0:1ed:5247:f385 with SMTP id adf61e73a8af0-1ed7a6e0689mr8041576637.38.1738201440594;
        Wed, 29 Jan 2025 17:44:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427abdsm188532b3a.59.2025.01.29.17.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:44:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] luaposix: Fix LUA_INCDIR path
Date: Wed, 29 Jan 2025 17:43:56 -0800
Message-ID: <20250130014356.1610566-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130014356.1610566-1-raj.khem@gmail.com>
References: <20250130014356.1610566-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 01:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115146

If not specified on build commandline for luke, it results in
pulling it from build host development headers under /usr/include
this was always happening but with recent fixes to GCC poisoning
host includes patch, this issue has come to fore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
index 1d27eb2588..7fb0965813 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_36.2.1.bb
@@ -16,7 +16,7 @@ B = "${S}"
 inherit pkgconfig
 
 do_compile() {
-    ${S}/build-aux/luke
+    ${S}/build-aux/luke LUA_INCDIR=${STAGING_INCDIR}
 }
 
 do_install() {

