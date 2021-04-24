Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.1590.1619229035463413220
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 18:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q6Wjsx4s;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id n140so50949249oig.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7QP7++ZQafQRjBEjvREisbsao4qAnL80EsihJupL0sk=;
        b=Q6Wjsx4s87PCzS4Fxmw1vWD1Ko9tFi2JuUfZZZGCEEQ6XuNDKFeT3DnJwSbarMMfww
         O/ESXCaQJMjpMhK0B5HWZlNXCC0ROxzcXeEwrmqXUTybHsbrgcjCPZat0fAOk9vt6jXN
         PRR6zm76RAcm+4BOdCBd/eChVYQBbBv4yXnMrGPF/SGTd3pXZ3sJP+xcDZewV1JB6+y9
         y0Rbc4MLJi9+etcSIOm0nRFMEFEoXMJMGZC+VXLYfB0KZ/DRLHXP4nAVRxXFRncQ4KJb
         l6Yk8PPc6eyIdmrPJxb61DrXFNDlJgXV/aN21sv9nkbjoeq0BQocpN7OSdy/L16fMXb0
         57RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7QP7++ZQafQRjBEjvREisbsao4qAnL80EsihJupL0sk=;
        b=crWoW54IIMYhuA5qNb2YpVtjFrtZz4e7WluhJy1+6Fp4OijoZLlCygSaBdM5XkVkxU
         ug9zJ5HtJhsu7Nq73V49Lc8DdBRYxW+9CaHs+kqTIBK8y/dLKomli/y7hm1SYZwMMvBi
         eHCghNuph7FwC2KFG0qZyCI7be8WJaPGmI8Qe02BxKjfVSpGXIV6jRSw/FMvYRnQQRtd
         y/AgrAIeOBqfD5348C1xdc3vQBwarfssvwhYVHbdxkJzKh5VOSL1/HUqlyuKVknnGmBG
         3ussTNUO/tInoGFkqBdAAekefoYgM6/2LQ25hchQeHLGCb3pkHsRCQjcK5NL1LC0KK1+
         0Bww==
X-Gm-Message-State: AOAM533v46gG7ibfAs7G8SmJrjh7/y422hYzYmHcxindd6UrxM27ENod
	l71TRZ/y3rF63iDfaF99WlV4lApgdm/GDw==
X-Google-Smtp-Source: ABdhPJzI3s7j5H1iNUXHeEyMUKdalM0Lmmy6TaSj/ic0kfbjEsOCvnWcfPgznhhQ9Ti1b1PYdCgDYw==
X-Received: by 2002:aca:d90a:: with SMTP id q10mr6157974oig.173.1619229034682;
        Fri, 23 Apr 2021 18:50:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id s19sm1748075otq.6.2021.04.23.18.50.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 18:50:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/6] libyui: switch to libyui-old repo which still has this SRCREV
Date: Fri, 23 Apr 2021 18:50:25 -0700
Message-Id: <da39b1e0877479e5a9643638164fef90d84e5a9f.1619228936.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619228936.git.akuster808@gmail.com>
References: <cover.1619228936.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* 8459235919f592b1bc099ecf9a947cb6344b6fa5 doesn't exist in current repo:
  libyui$ git branch -a --contains 8459235919f592b1bc099ecf9a947cb6344b6fa5
  error: no such commit 8459235919f592b1bc099ecf9a947cb6344b6fa5

* there are no common commits in the new libyui repo, but luckily old
  repo is kept as
  https://github.com/libyui/libyui-old
  similarly libyui-ncurses now contains only README about being obsolete in:
  https://github.com/libyui/libyui-ncurses
  but at least it wasn't rewritten to have the new content

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
index 7c6f4c13d2..f3c112c3b8 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-SRC_URI = "git://github.com/libyui/libyui.git \
+SRC_URI = "git://github.com/libyui/libyui-old.git \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
-- 
2.17.1

