Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8047C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:28:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.4399.1648078096347721795
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aEIrem0V;
 spf=pass (domain: konsulko.com, ip: 209.85.160.171,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f171.google.com with SMTP id t2so2556499qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ypEgEXvwI7o24/ot45U/Je+/rUAVGfRLfmgUNYzLzFc=;
        b=aEIrem0VeHpX3Duf8HpnW/nlhY3rojbwLA+bqBq/z90cxsdDd5I4I0uJ6YXp+1jtlX
         goS6zBuoQeSLjYeuwtEysl1u9f/zZm6E3Wa6A1T+VNA9P4RuCaH62p+9e1gtSVVnT/Xx
         /5FR53F2rykEy0GvffDXB1wKkFVI+mN87JQMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypEgEXvwI7o24/ot45U/Je+/rUAVGfRLfmgUNYzLzFc=;
        b=dPDXDpeah3dwDL6PORQRLZE4d8//GQ5HWAl/kI322yQ1q8K2UUdBPx70+8wVGSR+fi
         4B0BStrWsuF2LKsL09iQEIwTPR5HpBvMaK8fUU2gShYyN+zFKwqxSDMnl7yI2aasvIw5
         xS9QWZ1D/10HRZa+vikLmzUsQ4pGJlmGM9ySZ/iBZhZKp8yT76TYByXhrlBJMaFw2MLz
         3ezI/PuVXOqjFv0Ek+dTgv6DrmDWaxPBxsJgX6nzF/wMSBlXNfKYXbqq85lsPZh9C7TX
         nnnYY3oyDliiQqtv1ISCKj5ka8R+ARSGilozl9ZnPdyKc4u9oD8l6CjZVaWBY791wNCa
         rP7g==
X-Gm-Message-State: AOAM5313dO6HRF6jDN0KIonjGCmkvFkg64M7ffC89uUIlsZRu0MDSOKo
	uxzd2OLAxXAsvE2K1guzAgvfCU0PGLm04Q==
X-Google-Smtp-Source: 
 ABdhPJxhg1aKlogDhKL1kLvvZ6K4dbiEPv0DB7XdwrANDKI/TtZeYlpbnDmnOtUgTmBrljztOolRdg==
X-Received: by 2002:ac8:5d86:0:b0:2e1:b9fd:ec24 with SMTP id
 d6-20020ac85d86000000b002e1b9fdec24mr2187022qtx.290.1648078095237;
        Wed, 23 Mar 2022 16:28:15 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c10-20020ac87dca000000b002e1db1b7b10sm1102411qte.25.2022.03.23.16.28.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 16:28:14 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] ncmpc: upgrade to 0.46
Date: Wed, 23 Mar 2022 19:28:04 -0400
Message-Id: 
 <764b2cee4138bb81ddb826a12b30b62fb0827c3f.1648078003.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: 
 <bbba1edd71e7dca7686382e1fca4246874a9d2aa.1648078003.git.scott.murray@konsulko.com>
References: 
 <bbba1edd71e7dca7686382e1fca4246874a9d2aa.1648078003.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96172

Changelog (from NEWS file):

ncmpc 0.46 - (2021-11-26)
* eliminate Boost dependency
* install Lithuanian translation
* migrate to PCRE2

DEPENDS has been updated to remove boost and add libpcre2 to match
the changes.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../musicpd/{ncmpc_0.45.bb => ncmpc_0.46.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.45.bb => ncmpc_0.46.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb
index 3f51d7a27..a77d4f978 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.46.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://www.musicpd.org/clients/ncmpc/"
 inherit meson pkgconfig
 
 DEPENDS += " \
-    boost \
     ncurses \
+    libpcre2 \
     libmpdclient \
 "
 
@@ -35,5 +35,5 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https \
 "
-SRCREV = "6780ec072f1d314f44ed77efdc58d03c6fbcc96b"
+SRCREV = "b9b5e11e10d8f66cd672ffb51728aa447f78ecd4"
 S = "${WORKDIR}/git"
-- 
2.35.1


