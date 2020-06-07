Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.1306.1591500311303364210
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJrL8vxp;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id o6so7131227pgh.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KjKueLrwCW16Nz8etjDeLolon2OzaEWDweFKUXf44Ng=;
        b=cJrL8vxpuAg9bTm8XtZp8zPIUgXjOOJmz5/ZbtKzXf9ZzitNgf607XUt5SgYXlLf9y
         rRWestTRMIrzF3tdvyhCXE18eA091BEwWIS/hqWwq/TGZ1F6K/VpdJg937Akbh+RCFZ1
         RqJI10DnO1hp4aNJ2Rk9wwl5s/Pyv3bk1gRTNl+EMVmwea654o1kNvBSb5+S6oNmIL3J
         Xk8+QgRE3dinRw1peySIA8xo5eBQ6t6nW6L9B/bcjIdF8MuTZEOap4H00yIhJJS1Mcaj
         S5pJjaqGenZ4UxdH9HsqVYFcSjyAs8aJyR2MMteRsdWtnuecafVV/ycP1VHy9O+LRY+D
         qM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KjKueLrwCW16Nz8etjDeLolon2OzaEWDweFKUXf44Ng=;
        b=M2mpnGVttd54cvAkOd43DR5mzpm980Cl5nA6KAesBVbE81ukRysTe+MGAA3W6Yqq5Q
         B1zwOT0ZLEnFodG1NuOtpLBzON3IXQmb4zz7jeQH/I91qjvNGrfFu+UDeDQo32TKoMxK
         qXiKcF35YT9AXO/6vuKSyds1x63qOaz3P87/y32SMw84Q8S3ksSQBwX5Lx1YXsWBaKJy
         3IGNrs29jGEArzDKGEyKxrPItbqvuDlgO+QfOWQg1/z0rVn/9X63UwVRns59HGvQF9MG
         BM9wwkfHB8qjLBI1bWf4XTW3tN/ocP0ysiHsYJbJ9/arbU8UlCa9msIrdEINdQLVzxmC
         d1gw==
X-Gm-Message-State: AOAM5336haSNUUdH4t63vm0259hFX0v8EVJr5RBQStwym/We+YU0xvWT
	R5BxpddqipH5WeTwoWZCxzU/lVWW
X-Google-Smtp-Source: ABdhPJzDBdQqjRzGA3pYm/1G9m4LgUNsGT0P2bsjWfOfGSi2Jwh1VXm0s7nTGFfcU4DX48BzXHTIGw==
X-Received: by 2002:a63:534d:: with SMTP id t13mr15803632pgl.32.1591500310668;
        Sat, 06 Jun 2020 20:25:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:09 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 26/26] meta-python: depend on core version 12 or higher
Date: Sat,  6 Jun 2020 20:24:36 -0700
Message-Id: <c6f55c4afa5f9747c532c92d017f5841917f3a75.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* python3-pyelftools and python3-pycryptodome(x) recipes were recently
  moved from meta-python to oe-core in:
  https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
  https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
* core version was bumped now:
  https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6
* this dependency will make sure that people do upgrade oe-core when they do
  upgrade meta-python past these revisions, so the recipes won't suddenly
  disappear as a bonus they will get slightly newer version which are now
  in oe-core
  python3-pycryptodome(x) from 3.9.4 to 3.9.7:
  https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
  python2-pyelftools from 0.25 to 0.26:
  https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Reviewed-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7cfeafe599..0dbc4296eb 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_meta-python = "1"
 
-LAYERDEPENDS_meta-python = "core openembedded-layer"
+LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
 LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
-- 
2.17.1

