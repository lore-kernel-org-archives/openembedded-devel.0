Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70CCC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:17:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.30957.1701868666767195479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e75rlcfC;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a1ca24776c3so162544266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701868664; x=1702473464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJDkJQme0Uc2wBw8uEgINAjUyfvkt8yYSrR1iBOqOb4=;
        b=e75rlcfC9Q5ivsTPZ+UKMoN4h5apek7J0Mf3PHSeLuaBjoTl7i1XCzvg6p4L89Mumh
         9/xAqz2C4EXtKjN8iM70Sq8gUGlWLjbVUV28C+QxMPn25I9n7yQJqU/O5Wh19y3I2gCh
         MZs7X+oYFVC9hxmlIsseRMEGXin7aQIt14EM3Wlm2PeRNMDAS0wu7tW96GF/N0X824OW
         w8yN2mobg74OyLcscOvCOTjssie/qFi37vdKmCHP0X0vIf/NyYcDX6Tn+ImiGVmXq/1l
         YFO1pxO14ThA3fFjIZOpdjz4fPnZ/hDXKAJeItkn/qUPkTnBUYJM2di3RHiwURKLOrKw
         x+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868664; x=1702473464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJDkJQme0Uc2wBw8uEgINAjUyfvkt8yYSrR1iBOqOb4=;
        b=ss3Svi0j0w7VHmDdw8Gienu1NkVTGehC26aVH7+UEebu0J5IneHo2eD/K2gP9bWDZj
         dRD9vexgx2UC7zMnfrh6vT4t3n4mB3r9HZthQ8Egm3lkQ1lpfaVYLuVeCqF5Pz+g5zy7
         VDGa2TZEXE7JPN72VQlEkFj0wZ4x69DGY4LYXPjY0zuEz2AUx7BnDOmZVFIFz+c8xF3Y
         JtMip1c9Fogcrmkrea1HBFmUaOpPin/ktIwZ5j9v5VFVzcN5gNPF9pEUSeRPHn5kewrd
         EGkBuJpD5CJHcNMU4T76uQ2KjG/zNW0DykrbmMfTPgBfxGbOoLnQqJ5WXnaRy1oqDyeZ
         Fbdg==
X-Gm-Message-State: AOJu0Yys7obF9fBV4xlxmru9X93Lc+gCmQcXUeY3kKAEugze2BjU4K6v
	5sxLA5VSXQB4+Od+yXuPqSgAzNyaOf+zIA==
X-Google-Smtp-Source: AGHT+IHjdQslN0/P5DtYGr/4v0LChnJJeuibmSbycoBoREVO/yCySms+FdoTVxqYHcYCsQwfamVh0A==
X-Received: by 2002:a17:906:220f:b0:a1c:c2f9:980d with SMTP id s15-20020a170906220f00b00a1cc2f9980dmr2978254ejs.27.1701868664416;
        Wed, 06 Dec 2023 05:17:44 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709066bda00b00a1df4387f16sm472983ejs.95.2023.12.06.05.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:17:43 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] xsetroot: upgrade 1.1.2 -> 1.1.3
Date: Wed,  6 Dec 2023 16:17:38 +0300
Message-Id: <20231206131738.305706-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107249

Changelog:

* gitlab CI: stop requiring Signed-off-by in commits
* Handle -Wsign-compare warnings
* Variable scope reductions as recommended by cppcheck
* Build xz tarballs instead of bzip2
* CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 I accidentally used gz instead of xz, I sent v2 to fix it.

 .../xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb} (72%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
similarity index 72%
rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
index a9a8acf05..6445c7751 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
 DEPENDS += "xbitmaps libxcursor"
 
-SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
-SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1"
-- 
2.25.1


