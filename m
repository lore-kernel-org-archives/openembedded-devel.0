Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.948.1617733434120636073
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gSXglEDs;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id w3so23470000ejc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/hoiyCfO+Zs24or2nTgPksZcBOclLo2kHSEPeVvdck=;
        b=gSXglEDsZCBPsN9WncZrDZiGkPFbHEdQ/HKISJMj+zgmiI9iZjPV8LnmUHtcXYPCD8
         Y4J+rwtb+ISbfOS/JXb2Nskbxah9OA8gGlWIJd2Ceu5DiFzB579ZJEYJk+iWxOFNdfRJ
         eZGOF/y0aw50uyY9Fj7ioCMzQQ7BZ+ezLHaS+eMrYE+LnSaRriHl5YA4uYF5DXm68lIS
         moVxSkyd6MmVaUkcwvjJqkIV18tgs+I7wlNW6ytup5gxWlxEpHHD2/CnF8J/zMGzLjRG
         y1OA9zhD1Dx7dOAwKJVwKewPlSOOhXZQvOeRShEnaW6GsUfnA5iu9Odgn0VrS6NJr391
         n10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/hoiyCfO+Zs24or2nTgPksZcBOclLo2kHSEPeVvdck=;
        b=Q/XT6bCVm95f49sDp3igPq73xelfpH31qQYObFdQ5hEpNYJ72GULB86myFOvhNX2vC
         dqf0BOsLVTNB7rN23jPhvllA6nRbyd1LBY51RRR83CDHR4RuKeIPuaX3T+3l71jtmYPC
         o9Mi1j/whXI3fCr/y+cIxWQmTjICo/LDMf9SHzmU+yBUAzUbOP5zTKJk8ZsV2ZjMfLrm
         0FLG7qPb28r68rpqs/etDk7dkx9UN7bcEadC6nrIgwuxGnaodSUwLJ/d+JZ/ceILKpPe
         uGMhgcgy9xQYAdycsGypsXDfXL/4NYXrTYgl5Qxz2X4EW0SirgR8KwhoYKkE+OUZm4kO
         aMVA==
X-Gm-Message-State: AOAM531ioUTFQ1OOJmhbK2M9ev0V995/4XhA9z+9zVdbWytSUS+th2B/
	MpQNRt8F/SlKkpCNK3Rl0R0XgEV4sAU=
X-Google-Smtp-Source: ABdhPJxiAR9dYmYZwTClxbvYmppnfCOYgVWXLr3CLM3iAr2neMml5fe2WEzVb7mIzRnx2kBBudZ5cw==
X-Received: by 2002:a17:907:3ea0:: with SMTP id hs32mr34843030ejc.411.1617733432470;
        Tue, 06 Apr 2021 11:23:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jx22sm11282818ejc.105.2021.04.06.11.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:23:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] libyui: switch to libyui-old repo which still has this SRCREV
Date: Tue,  6 Apr 2021 20:23:47 +0200
Message-Id: <20210406182348.1584147-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
index bba17962e2..e42c178e66 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
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

