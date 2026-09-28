Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1628CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:27 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63907.1790618238516174591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gctq5eJc;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2757956a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618238; x=1791223038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L71BplOlQuDRrwyeTbk5lJf7P1kFTEdp6ABMZTi0kxc=;
        b=Gctq5eJcdHECAbyGHYn9VJGaWWw2ofU4q8aDKVPhB954YDKcop+LaMfBc8aYMwRxxE
         dWoAO5Uu2ZSEICQIGHOnLOBNIv+z+mwxWswBH21ke2hH1dvwwxMXQOtske92lMU8l7t/
         O6UP8sltHiFceO00Y9nCmdFbXsSzkqHKHnOb2Ft7b/s8I8qwWsAn8jPV6f4gbYvK3/N3
         fwuqXokAvWEewn6svPstiiQ5B0ZosU9u0JVVPlMOIN1GGMOR5W0WoGRCWa4kLR4QsvCA
         qC3buhs5+by+hmD3oBXPPxQIh/7cPe3E4LIcRUa7JJgjKftkFzS6Mf8cAVrAV6HKv76y
         jCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618238; x=1791223038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L71BplOlQuDRrwyeTbk5lJf7P1kFTEdp6ABMZTi0kxc=;
        b=mDZqNHPIPqxWizC2R8pCsLj521VMP3Oo7tZKcO9SJJ6P0jIQIimesoNlL5lgVTsERO
         zYylMH7kZt2Sk6/D53ZoIf+O0i8yLwW8mzKADFrTauobT5gUHb9+Z9g7et8hHPfifRwQ
         zW1e/JGO7i4TJqr+mqRZUzSUuoM8/eDFfj48ZL3NQdwb1eK0Jh22pIy8OQDyEpLidJaO
         sZgNihp3u8J+LQHfold4Dod8HqKkOSSevwaN90VWPVF0s+psemVdpuZnxnvpOUk7clLk
         24iNkXIBmpDLM+jwbXSKB7ES1wg9ISon35kX45qgnLc2IPTV8skc2IXU5QfnjwGNSY7J
         HP0A==
X-Gm-Message-State: AFq9FYJpWnXWU46s0TUsRuQSKkwfXY9+o9FobSDpc9fWUp052rHcno0M
	n+uAg+LtrfiA/EPvd/gRON7Fz/YEwf0vxt9WYAFzFSy2Tw7OOR3ttC++Dc3s7w==
X-Gm-Gg: AYBFou0dL4sraYNC+6fnojvpZOMc/YERWh3EBbIQK0cIPlCm48z9faQ72MbUyJajlDO
	l+ThMnhTOzfpdvDjADAV82MgSYDP3lwC0EYw2preqqj1+pd5QqsCED+syWTd875q8YK+6lV0EjY
	cYkfdBUDG+e8AOaM8IZeX5VPsPfibeHqM26iNlo8iFVjNhqMQrNGdlapJa3r/umIvyGaGmqatXr
	hJlV0CyiABMbH54f3dAj+cWdM1QobWrzA+7abd/4aOisdwr2d2TdBBVnasb2T2KkKtr7kLcXOMM
	e/pXV70091ZGa0WaZ5LqDayjoFJEPY4WKD6SmdHxtleEwKvur49a2lO8LRNiagt5oDohy5EzQ4Y
	EDoqdqW/0h2H78EZf5/99I9ON2vCMyxjqHasPN0WsWEYnTEp/BEk82x1j+ihoLuOSYXt85550Ug
	xNmFon34BOXASKq7gXEHC6Weyrwm5bfzjOYs/7r7a02EWFqChCCisj5ZRJGiKLZM7nq72IKIHbM
	Z+FfY3hy5f88+ul4usrblVPGc049utKwg==
X-Received: by 2002:a17:90b:3b4b:b0:3a0:d2f3:fa80 with SMTP id 98e67ed59e1d1-3a0d2f40159mr7658196a91.6.1790618237781;
        Mon, 28 Sep 2026 10:57:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/8] upower: upgrade 1.91.3 -> 1.91.4
Date: Tue, 29 Sep 2026 06:56:55 +1300
Message-ID: <20260928175656.3501512-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130467

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/upower/upower/-/blob/v1.91.4/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../upower/{upower_1.91.3.bb => upower_1.91.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.91.3.bb => upower_1.91.4.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.3.bb b/meta-oe/recipes-support/upower/upower_1.91.4.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.91.3.bb
rename to meta-oe/recipes-support/upower/upower_1.91.4.bb
index 8213c5e15f..acd60715dd 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.3.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.4.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "12227b3dcd34c5097bbda25984b192ea0bd5e11dce479358d9ef70415a38e4b6"
+SRC_URI[sha256sum] = "de2cd848c927e267f37d1aa6b52631857055b0a1fc76c0e10e173723d83abeae"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"

