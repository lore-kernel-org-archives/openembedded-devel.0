Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.1259.1617734612598591972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o25ITjYk;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n2so17309421ejy.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlWuMtnuCssSILaWxPa7gGymyWw4TVr1mGnQI67a8EQ=;
        b=o25ITjYkl/4ToS+BG2kBP0uxaHCGEcULFQnNOfeUm/7881Tb3uyo/DrYWYqruX08ZE
         5hy5rMxbVLgRDDsGDOdCGQMBA8CXj22PC8K/cC/1gs0q1oEjU8sjcPGupUx7jRmyfKFp
         Us4QXaHc1GZsZJUynlF7VdVgvV4weViKK5/gO4+EpkfTd5vFtqssukwjrOQn51/Sgh9p
         2V0mttpxONi5pYtTdXoUbhHxB713g56X8T07gHKOSYITVia4jNp7hmZrAF/bahcoRJYI
         ePiJAhhTTo2OFGA2rAlfNRkJPF+EqKdsLyvFR7dchckPHyjD/EC7Pu2iUZC3KlOH9U0l
         8bMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlWuMtnuCssSILaWxPa7gGymyWw4TVr1mGnQI67a8EQ=;
        b=SKQ7wr6IBRMayZH15VMqOM7JO9MwyW4SjtM6VRyOM6uKbXYlRvWCFaS4qUVYsIwNH1
         1t7EPqC1XXodOfsG24gMYwTAxUlIwBsVY4l7TdgElnWTY7pPrWSlUuYHaaLN7wwySFrj
         jVJ0HZ/HgGrm3ZKiKXh8orDBfE4UH9Eh7DRuhl/DHBGRHif6vvaPyxJFIA1z76DwpTTU
         iwQH/B1X1kr3Nst79s8qavJvS8Ws80niE9AIf6sNXRf6NoJdmI5WcYOmtRHu8MlgbfRo
         XQxNf7hXK54usk64WPxOKJ2Ag7rUTi1XypNfZSv+QtoeTx0vbsmH81qp6BwX4Y3kldFt
         C31A==
X-Gm-Message-State: AOAM533EVv6HH6kGjzzVxqCjCFcyNXn9TlivetjufV9H9gUuINsytwy9
	TGlvsCH8e4AmmiUiyh/vG2D2gte2NBU=
X-Google-Smtp-Source: ABdhPJxEF4ffZEhvZGTwKs9Blmh2LIqnNcW9TiX3IcO7Q3af7bFhUxTlq7zTHXE560Bf/B/6E0D02g==
X-Received: by 2002:a17:906:7e12:: with SMTP id e18mr36976252ejr.316.1617734611208;
        Tue, 06 Apr 2021 11:43:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s9sm13619041edd.16.2021.04.06.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:43:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/3] libyui: switch to libyui-old repo which still has this SRCREV
Date: Tue,  6 Apr 2021 20:43:27 +0200
Message-Id: <20210406184327.1585452-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
References: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.30.2

