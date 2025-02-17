Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F68AC021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 08:05:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.46553.1739779522447810760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 00:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fqxqzNIz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so27185855e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 00:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739779521; x=1740384321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VLOJTRq2cuJ6YAASPeaTi+/21+CN+h+rsw4QlIYQyWU=;
        b=fqxqzNIz4Z53ijr8lnSkfDHR0OyN8XP8op3CZ/5Q+IqTK0+h7QYx8aotYCUK+nXm/U
         9+NP2WTUbx7qUnsuNCH3qg5V10PtVFm3SjN3e2UbKcyarxnG37TYgoKZwsbG/W/DZfEx
         kU51BbT7jjDjDv8Xq//hJ7Uv3LHMt0S4SftIuOiHfMMGi60L1VtvwfMRm9YepjLeg8RF
         fLF3UXjgeqLly0gk1yt8SqEV7ZTBQtHVvYwZ/uxZXlwC5moamKmZIAKZPJSFb/FPG62p
         eCsdpn2jI7yuF8R5E/+gSb4MjgY1N88UQoH2MpxdtjxKCkdzS25pyRZnuduZaqxIIftw
         SVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779521; x=1740384321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLOJTRq2cuJ6YAASPeaTi+/21+CN+h+rsw4QlIYQyWU=;
        b=VaIVBax+U9O43uEOouxz6aXci2/GF4VA75wdCHqraRDLaGhsoQSLmeblluP+djpn5s
         LZdp0Ar8rok0yljdE3YDpQR3bbg8NxO4Y38hfBPs4I+hzcTw81EbIGYnvRdRY5WrFmnT
         cDfypp7JklnecuuRrIiVBtQbqb6QGsSeMkdqwuMP0gvvs2tUfWfSBj/kKVOrWtqAB0XI
         Lo9EG0lLHGQtoVy8bBLA2xH0s8Ztrjy1lUCgviUn8Wj+nAfd6yAQvK7WhS9/x5hcHcyN
         r0l0tDr0qKfiKKhuaQY2V+1fDqaE0iQU0ZN6fxSL4d8GxMGL5c+0OGdiVAud0MXV3JlV
         LpCg==
X-Gm-Message-State: AOJu0Yxza01wLc7lhpEloO3Dg/iOwEQYOFvBNiOn2GeqZnxMT4e6HUfY
	XM6QcsTvcf3GKbzEfNU2AjmMUey90A679qNLFR9dZ4J/AY/1+uKJLU59fA==
X-Gm-Gg: ASbGncsGs2TCYO2DXd+VcGI089QYpBoaqYTSmvif0uk3+Zf7i8unK2LV032cNGGlOPk
	BgQ6cpTuuXCdJHTT4EWyL8i/Bc+U7lcldcw9xxdENslP1exfREQf3F6J+kV3zRGuIdBeXuaaNmL
	7O/kPcNiZ+Q2MjdRTD9Il+VqN3HUZU+/bMzkIoZxqox2Nd9Tuqxd04iFIUZ9IRAf6VnEukaPHqz
	7KrZZMxaE/s823AwwJRZG9itv5TYhhoumMIIfZBE6WHHweWISe4SAxgHqIwFbKIIOmZq4n6vEmU
	4JsArAcT2H0+Ci16oDE4FsxzfYguOZk=
X-Google-Smtp-Source: AGHT+IHQVW8E3gtl6fkBVN4kV5bWOO1KwIXqscUbTEOyTMfjBifhqEwd8VNaeddTpDEprKy9qw2B0A==
X-Received: by 2002:a05:600c:470e:b0:439:6741:ed98 with SMTP id 5b1f17b1804b1-4396e5bbc88mr92947475e9.0.1739779520485;
        Mon, 17 Feb 2025 00:05:20 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858741e9sm13937085e9.1.2025.02.17.00.05.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:05:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] liboop: set correct LICENSE
Date: Mon, 17 Feb 2025 09:05:17 +0100
Message-ID: <20250217080518.1759732-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 08:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115507

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index ba3fbf2423..8df96bcaa5 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Liboop is a low-level event loop management library for POSIX-based operating systems"
 HOMEPAGE = "http://www.lysator.liu.se/liboop/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
 SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \

