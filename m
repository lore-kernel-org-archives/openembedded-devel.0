Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.5574.1618064981930752644
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uqvosHgj;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id d10so5954050pgf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xL9OUQu6KQJDMIhp295iAWG1H+ZWp/9fyfoA1TKgGuM=;
        b=uqvosHgjaBZWOUNBTj9S0r1t+B7ytpi8W9f6gvNXN5w7jJs3w9R0MceKKLZd0yIlGA
         YP7LnI0adj571kn5hJklKh7W3ao3KBHd3h5vzL+rywCvZ2FlxoLI6J6BMaYH1cFHvQvl
         yaQofC5z75w5ofsh12HJcPcBacmMAlFypbPLQBNSElXaOK1aUQ3yxRp6usE6+0lPHJfO
         oJ2ZhgVkKHYppWxSxJaq+Q6Neig0KAAGoiISlNfZV4XJjYduHivEvljO5A83D4niuCdl
         SuADjwmfpHKfl8JoOQVmfC0Cf8cMerf5a+/SVfQvJTQtnn7/hbsFUN6tUofkwqmXD9Yp
         OMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xL9OUQu6KQJDMIhp295iAWG1H+ZWp/9fyfoA1TKgGuM=;
        b=K2Ar1sNDZ1fgLXua6bjJH2lOcw1oMnXpMcFanf/vjWrwlBYd+qyB2Ag9ouyR3+IlJz
         D6/lZ0Y5t9Sjxt9fL0AFCRfJjydhOeMVTqp3dReODhv8KqaYRU+so5wyJIxl7RzT7gJZ
         s1jF8ZT0b5RuBtqDhBaDgEWB0uLYmQVWpxRvUk0RZ9Yppyn70yIKuIUfv6RBHOuc750T
         RTcsFgmk5myx/xb2Z2bN72yaJgPScSYLhnD4BmIHO6k/plKiPDwCBztWi4sA6shEWAri
         PAxdzTeXj7jxs5MT1/YKClVQDmsODSNJq4N1efgP8dIJ0tZOHcJCyI2zkE5+Sf5zhePl
         kJ/g==
X-Gm-Message-State: AOAM532rx1u4sKxsnGbcOxs3MIkFztY0pvAtBrssdU0qg0JpFhHMIkaY
	9obtAEnrgw86z/xoiKAzeGGQp3R5t64=
X-Google-Smtp-Source: ABdhPJyPhVGUNFg7u2roMBagvBini1W7qipn/ocgVDY0Tb/zYJ6B2VTdaDFaTvm+5L4a0WT+TGYDpA==
X-Received: by 2002:a65:6143:: with SMTP id o3mr7756141pgv.332.1618064981404;
        Sat, 10 Apr 2021 07:29:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id a65sm5120183pfb.116.2021.04.10.07.29.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:29:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 4/6] libyui: switch to libyui-old repo which still has this SRCREV
Date: Sat, 10 Apr 2021 07:29:32 -0700
Message-Id: <d59f6e6e1b19b06332474c60f255f8a4e20357aa.1618064877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618064877.git.akuster808@gmail.com>
References: <cover.1618064877.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* af06143017fc5f18c4b6488ba4aed26bcc43ff6e doesn't exist in current repo:
  libyui$ git branch -a --contains af06143017fc5f18c4b6488ba4aed26bcc43ff6e
  error: no such commit af06143017fc5f18c4b6488ba4aed26bcc43ff6e

* there are no common commits in the new libyui repo, but luckily old
  repo is kept as
  https://github.com/libyui/libyui-old
  similarly libyui-ncurses now contains only README about being obsolete in:
  https://github.com/libyui/libyui-ncurses
  but at least it wasn't rewritten to have the new content

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 902919167a97055e9be9cd3654f29823e81ae382)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
index d7f529e3138..286d3ac9119 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
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

