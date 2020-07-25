Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.19033.1595716010110084714
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 15:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m/r9fdj+;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id z18so7811962wrm.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FOT1V9o/7wkecW19wFKfp0vcZeE2SYvil1mlBJYWECg=;
        b=m/r9fdj+VXtgpRaXyb/z3fxlFrmoGhEN0WHjIHH5dl0/lGxPISyJNFFjKFHfzOZOqk
         oqxExxhwO4RpPpWYUKALJ/4HuVNhcaFvOYR7/jP91iec21nbBCZpV+nUbA8mXVm6DLXV
         1J2tvwo8isQdR7R+u/Hedcle7FLy0DTUoZ5QzDnC90QzMLar4bnxGK1an7R4Rl1/5jDB
         Y6v+XmjdooUMvHCgWZkHlOC+R7vmIe7IH451rnj+hpAPlreQ9BLq7llJlSZYTLOX1TQ/
         tI0YhVX05Ob9qzrQKSp5iLjfFZIxk9N93lnev/WuZgVNgM55EbLBdTtdXE3SeuAKTNqB
         sAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FOT1V9o/7wkecW19wFKfp0vcZeE2SYvil1mlBJYWECg=;
        b=qTCC3iKS3uVQOwWUcmSI5GfMd2kp4hZ9px4hpeYARivOfH42iJ05BQ3xeuM00w/qt2
         HtiMMFT5QcpNJY9ugUt3cT8/voZNCQ+FwcWqpA9ZSAaofrzkzWbzv+F27VN7m0wOmMjY
         n2uwYOBsETY7gXy53NnBt9vuds3bEuez9Kkkmw03TyHx8oHEpOTdg/X/4Fp5oACZb3Ky
         nNHBtv1CBtCYIVQ4q1nZEsi2P34n41r+/GGFq7+Zwg2o62ISx8QucnWuBN+4y9sjE+N7
         afrLhx/WPSzoXm57ZUjAmQd5I1NUzcRURnsWDmh1wnC7RyWJclCqouFrfS3F0tg6HcQ7
         s4ow==
X-Gm-Message-State: AOAM530XTNgD03gOry4Sj3DnNiQvrkagd7Ybgd181b+MABHDMJ0qBNru
	q+Y3yFQdXfSKwXEwE/QK50jhMUdPvpo=
X-Google-Smtp-Source: ABdhPJzyj3YnyM4/DHfi208O2//bbfoqfeYTiUIUH/PwjIYrRFPJLyT9Za+V9PE12YKqtBOHpIhpwg==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr9893796wrp.75.1595716008348;
        Sat, 25 Jul 2020 15:26:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 111sm330201wrc.53.2020.07.25.15.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 15:26:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] khronos-cts: add opengl to REQUIRED_DISTRO_FEATURES
Date: Sun, 26 Jul 2020 00:26:44 +0200
Message-Id: <20200725222644.37178-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* depends on virtual/libgles2, virtual/egl and in DISTROs without opengl causes:
  ERROR: Nothing PROVIDES 'virtual/libgles2' (but meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb DEPENDS on or otherwise requires it)
  ERROR: Nothing PROVIDES 'virtual/egl' (but meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb DEPENDS on or otherwise requires it)
  ERROR: Nothing RPROVIDES 'opengl-es-cts-dev' (but meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb RDEPENDS on or otherwise requires it)
  ERROR: Nothing RPROVIDES 'opengl-es-cts' (but meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index bd75cdb1f4..4a297c313a 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -16,7 +16,9 @@ SRCREV_FORMAT = "vk-gl-cts"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
+
+REQUIRED_DISTRO_FEATURES += "opengl"
 
 DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
 
-- 
2.25.1

