Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08D5CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:45 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.366.1763425657432531704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHgKukAp;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29853ec5b8cso57334445ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425657; x=1764030457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkIB1W3RIShV3Eb/437Ww8B8wTb9wOud6m6//CZK+dU=;
        b=GHgKukApHPzUH5N59kzZ35JlvdBESnIYwjUKxQzuUgSSiMigKrWW/1xGprwZn8yfc8
         bnv1XubaHTMjS695uCHcydW8JJrc+eIOuqfiuZ0Su8lONlOlvQcTERnpWertIhSs/t1B
         tJ6SwW9qwYqQe5UcVI3zN8IpSjhnv3llwC0zJdxQY8lfr3GhZLLyX36ZA9hI+1eAbqZF
         Rwb/Q13C1Lk5FE8eEjPqNC369PafZ0YAM0iPrfoJwq5YEMHSluC+g3zA3YcdnVB9ECD4
         2lhNN6iqDauEWrfUCWGHrzXhdwg/BU/nRLwWD9e2QnxndrYGmXpi8e9hV8tMDO9pkukE
         Q5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425657; x=1764030457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkIB1W3RIShV3Eb/437Ww8B8wTb9wOud6m6//CZK+dU=;
        b=wJauvXuH3PAVII9ZlN6G71QxgSwFZrpYnPTqx6PY3lwwkjgux23Y4RW23ka+wUf1em
         SiqVLRGItjEA+YWC8ca0mq83ETz6VJWT/3PGbYbo5dUKpJa013SlNEv6WfKjXHBA8SfF
         sF8hWLiFPMlvpXVSKHTcKTwSyYIKqXORGscXiVdrSv62T96HDjwB7tKx8UqmJB/SmMz7
         27nPoEFNfWj3IL7+4jAJeb5t0EcjrT55AuPhHYGreBGBvEXlIh9KkIUyc/f2dpI8vU6Q
         1ECPty/IojPpuqHKQ9llXYgiIKykgpwNJWNLvBKsU66toqUZFkUZb/HnoQMw+gO8v6k5
         DLdg==
X-Gm-Message-State: AOJu0Yx1q4B/u/Ta1dYwTpJlXkgF47jTHm+YLhNdwRowc5Z4DqtBgcku
	JnoYlHXoYUGbRN/2c803knoM6uiVIaqbkzu0vd4XD9XH9P/kRlXdntwoHA8NhA==
X-Gm-Gg: ASbGnctxS/8UmId43imtltXjZS2qYLMlEacErNu3mz+jDyau/DUhFodrCJfZ3Tioo9J
	fbjGI+MX9sUyDHos8hbj6ryX/smnCYqgSYH2Hx/pkhf2hyQKhjBgRbC8X25/NGaYdLQ4dMVaOXp
	moEaJs0kQKKhpXuAxuaaQKTITdkZ0KNTIZaDa07OCeQ0+d59bW11Jko53tRv0UR7PY/cH7w487c
	93/ZoxX3vjipjZROG0Ls6ujqT/lToCtVM3bBmuCk/UghfDIMlNpGN6/zo6Rgzuxj1ZuqW7/mdws
	430Z82iXvt2s37TvEZBCERMBEqNJw2fOvkMUqWY2WqkVJ8Pt2nmWHTq6+WftFJjKj9JZsZ49NYl
	zo0stBgiIhwWHvK1F4cyvZKKtd9MY6FMfqjKA82q0dMqfFP4xFY1qaVu1DcxeR8eCAZ8WFEyCqX
	v0VLNMrSTVrNfIZYd6hoLYb88=
X-Google-Smtp-Source: AGHT+IFlic6wB9Lzx8AGVFAV64vzsV0MrdYm7A5AXqKlmB+b5L9sArUD/xnzf0d1bm0hhklNQz+hGg==
X-Received: by 2002:a17:903:3bc7:b0:290:9a74:a8ad with SMTP id d9443c01a7336-2986a76f2b7mr162118775ad.53.1763425656581;
        Mon, 17 Nov 2025 16:27:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] proj: upgrade 9.6.2 -> 9.7.0
Date: Tue, 18 Nov 2025 13:27:21 +1300
Message-ID: <20251118002723.829508-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121790

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update HOMEPAGE and SRC_URI.

Changelog:
https://proj.org/en/stable/news.html#id2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proj/{proj_9.6.2.bb => proj_9.7.0.bb}                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.6.2.bb => proj_9.7.0.bb} (79%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.6.2.bb b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
similarity index 79%
rename from meta-oe/recipes-navigation/proj/proj_9.6.2.bb
rename to meta-oe/recipes-navigation/proj/proj_9.7.0.bb
index 046950a1c0..2a41f1ec52 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.6.2.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "PROJ.4 - Cartographic Projections library"
-HOMEPAGE = "http://trac.osgeo.org/proj/"
+HOMEPAGE = "https://proj.org/en/stable/"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
-SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "53d0cafaee3bb2390264a38668ed31d90787de05e71378ad7a8f35bb34c575d1"
+SRC_URI = "https://download.osgeo.org/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709"
 
 inherit bash-completion cmake lib_package pkgconfig
 

