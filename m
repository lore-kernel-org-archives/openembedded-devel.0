Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.703.1602711498307010108
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 14:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XRVNX7Bm;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id x7so602675eje.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zpssztk6FbbTs6NoTBH81cmTCTnOsf4D3SuTbbdQaIw=;
        b=XRVNX7Bmi6D4W0G9ZHa9gjaRKRaux+UcAVMlaW0jqLUV1K4KFXIRgUOqKmCNb2VQdH
         JATdz1z+H55VHausG50ZWr+U7dHdIDvdyEuOEYZEm5s+OkGIpDKh+pzHYrv0LlD5CTuE
         j9Uye5vekYFBYZC+MXQBCRmQL0uByXPSJyQEBCFu1/ILjeT63NKX4T9M+JGjmFXBJG2S
         ore39tkklQmFLoMjoycJV+8lazQJUvot8zRY9Y0WxB/L2859r7EVp11M13JYtBj8qSdK
         wcS5ZWT9NeU0C6y6jeZlTYQ2/CXm/001R6rDGAmhJcw4Wc8098lFoNWff4PmWbHv8AHh
         Dnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zpssztk6FbbTs6NoTBH81cmTCTnOsf4D3SuTbbdQaIw=;
        b=gNtYOvkCXmV46OhmvrJ4PW/0/aYbIYLvfBTS1nEFuiLOTreEynKrDJ6wdaWu5E3My4
         /jxtCvP75KDCnG0hEaEQSdBK2im8CjC4Er3FeNzwUrI9tISQVWPWUXk5gohQB2idBZZQ
         8H+t7BhSxMev+f1QHp9WfKM5+jWlRaMB3DQxjl6BoX5TtYZh56UJu5dek6zQ4Ldvr7qY
         F3xu8yFZT3EIAmxOjZMYuWYsBq/HtJ2bQc5mebAqop6YScjL8RVdrmrk/98OT06RtbW6
         nbv0zXYBrv62HGGvPCsBmdw7hN30YpwvdRnAyoxeXIBxgLeaiKKnWsNmtb5eVybfKqu4
         LgAg==
X-Gm-Message-State: AOAM5312sbY9un4V8P2VlK/oRhiL5xPZ4ZR3nXLdQQ4MV7cQJonFLUgX
	6/W3L3S92svMfKL33ncnVk3W4bTgeF8=
X-Google-Smtp-Source: ABdhPJzrAxqUu+GdWDjeMj/PcmhaDrKdL0s4p77OT0LRkLdO/derkOIBoJiGBmYmazhP0J2NFdmOwA==
X-Received: by 2002:a17:906:1b15:: with SMTP id o21mr1145427ejg.19.1602711496486;
        Wed, 14 Oct 2020 14:38:16 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c19sm375129edt.48.2020.10.14.14.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 14:38:15 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH] python3-colorama: add native and nativesdk to BBCLASSEXTEND
Date: Wed, 14 Oct 2020 23:38:13 +0200
Message-Id: <20201014213813.788941-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python3-cmd2 depends on colorama since the first version in:
  commit dc66ca8495eb051e1e6de5333e36f7f8054094a1
  Author: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
  Date:   Mon Sep 2 13:22:08 2019 +0800

    python-cmd2: Add python3 version

    Providing a python3 version of python-cmd2.

  has both BBCLASSEXTENDs since:

  commit e929ea7a18b0aa4d7767d2264d26fcc5c8dde688
  Author: Binghua Guan <freebendy@gmail.com>
  Date:   Mon Jul 23 21:29:50 2018 +0800

    python-cmd2: add native and nativesdk

  causing:
ERROR: Nothing RPROVIDES 'python3-colorama-native' (but virtual:native:/OE/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-colorama-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-colorama-native']
NOTE: Runtime target 'python3-cmd2-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-cmd2-native', 'python3-colorama-native']
NOTE: Runtime target 'python3-pyflakes-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ament-cmake-pyflakes', 'ament-pyflakes-native', 'python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
index 7a3f533f26..31a523b0c1 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
@@ -8,3 +8,4 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
 SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

