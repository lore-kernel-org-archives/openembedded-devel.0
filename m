Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.1310.1617734558916130842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 11:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KPDjHTh1;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id e7so17760838edu.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=voxINYApJGmUrD5p6reS8cDo6J3iqtS/vY1rp0Tla+A=;
        b=KPDjHTh1a1kEf/WwaSNR6NkISh9fkgku00+dMoEIBtnzQ4L006RyG9TyOUDTOLp2Sy
         PelTpDaYVaXYb5OQQiOt78PbKJBXx/epTK0MIagg/zwO1D5JZulYwfwiTtOD2vA2ryf3
         +F31h3UF8m5gJKNnhHom31axtQVWCkggzDSPAm1cjZBvcQLQG1QJ2G3rHojzP9znbHOA
         k+AcHzHbpZFLywOmdtQfeqtLY3jPTdh0Rnt+klDaT50dPHhqWuX+QvPUz/ZtEBABJO1G
         Q/B8T1RTGk/VnKYOavoru7xTAW/DzBygP43SsKAIbCjrBLLQCBxBsqNG/fpaFVJAPUND
         0Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=voxINYApJGmUrD5p6reS8cDo6J3iqtS/vY1rp0Tla+A=;
        b=igJYNb+Q155zelvcMkGQqBWimMc26t+o+iccffrEH2OwS3Z7dd1gYOak/Wnr5xXEyw
         6aV72FKyhlfmzWllna40KYyYSHBpVouk7vUajzSRhrn2411nmXYL04pmEOjnJE7JnfwF
         uJ0yozQa1p4wkXIbFfTbpr3HFEP23WvnMvy+v8dOojxEcBw/7+PawnCRvQKCtlhR6g+h
         eAuaQOSAq0uBsy9igpeqH3xIINa2t21RlkzmsmYXgS63AIL/ErtKQTb7ZIOPUmOPjCat
         NX2zsG2k1Na5Tf1ajqWtIdGJNLxLlKDFE2ncW0/f8hscTS8AbbwmwSwIJSRz8+1KT8w1
         u55g==
X-Gm-Message-State: AOAM530VwZWxyI9BpUd2KLCLNCZuxAxN2DWyzdvGEX90+kRNJdub9QUW
	h2olOtzl7hRDcyTbsKVci/AQA3XLgT4=
X-Google-Smtp-Source: ABdhPJw/RKvkVqqW2oHDZXyzx94/xnC17rdXpsIXNlV9ylhw6QpCB38rnanmhMtQ6796Q9Vw1VxWog==
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr39145398edt.193.1617734557542;
        Tue, 06 Apr 2021 11:42:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a17sm11518415ejf.20.2021.04.06.11.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:42:37 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 3/3] libyui: switch to libyui-old repo which still has this SRCREV
Date: Tue,  6 Apr 2021 20:42:33 +0200
Message-Id: <20210406184233.1585138-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406184233.1585138-1-Martin.Jansa@gmail.com>
References: <20210406184233.1585138-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* de9134007d2d029fe5809ce48f57fe218e6ffe16 doesn't exist in current repo:
  libyui$ git branch -a --contains de9134007d2d029fe5809ce48f57fe218e6ffe16
  error: no such commit de9134007d2d029fe5809ce48f57fe218e6ffe16

* there are no common commits in the new libyui repo, but luckily old
  repo is kept as
  https://github.com/libyui/libyui-old
  similarly libyui-ncurses now contains only README about being obsolete in:
  https://github.com/libyui/libyui-ncurses
  but at least it wasn't rewritten to have the new content

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
index d7f529e313..286d3ac911 100644
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
2.30.2

