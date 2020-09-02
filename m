Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.8985.1599057322578798905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJtNjN9r;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id w186so2628319pgb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4rS0PL4rwu/BHNURNQ0bY2SG/H0Xd2cM6ijbuJv9Cg=;
        b=YJtNjN9r6XZrQkeEuP8icfActnv3mD8G8cb4LpEOep7hFUYTwrCBphdeRn10YXeG+i
         yJ2Cx++/axo8or0i7zcj7aTWlEMWt5RwrZn90f+/cgaNRayOAIjmusE5Ij/qOvBhxPVu
         F4Sf+hH+rCCKxdmcSXztmzKb88J7iQ4TriPgf7HJ90SAaFaEs+XeHE9HiRTU/iaEbT11
         v99Az5hQNCOPeYb7Zkr3avC3xHBvVSswcPcaXE1lKi2mtjN5E/oxZRb8Mm4Gp5jVukHX
         cUghLQJmoBAlp54we6smElx7H6YhfIbUMQHIB6hs9zjkD72beZ3VS724gpXqEoJI3n07
         xszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4rS0PL4rwu/BHNURNQ0bY2SG/H0Xd2cM6ijbuJv9Cg=;
        b=btH6tWphuzTHGGcckUtbmEV+r9qXFtFfrBDYIi3ES0wfNS+SZR9fb562q5XLCs2xaq
         drUVwmG8Ik9c5OLRmgWlxKBIHx7XpNZSxOrB4Xa/DjEymaRdbdOfKOQxikvP2FB7bNo1
         wXM1LKNOZKfJBosm6ZuQtNycFtfgy/S0O0odWL9TP6tfinL+2H5bQcB9blKvEii1/kqP
         qVlv0mXVLsfxsF82bqYCUCDxx8JG9LArmw680BOXXwny14uQrLv+CmqYCi8T5HOove4v
         0hbOA+2USDHJIL1y9Sloq4Sr6iQTTOTFZ0z1BMt6AktQaASEiT9jjICZwRMAX3yUatIN
         YNnQ==
X-Gm-Message-State: AOAM533xQcLSE7YtiaXrgQAPdkISOxn82/D4rRNwNswAzl4MMyZarADz
	h16+S4ap9P08aGcOWoTZ9R8EgIxbZNU=
X-Google-Smtp-Source: ABdhPJzeQL46hQdLcGoAVdJjkViSG6th3fSnwEcnMUV8CGWvG+lwdsxK1V8ZaUSCXJIkhQZMu227rg==
X-Received: by 2002:aa7:9781:: with SMTP id o1mr3435739pfp.93.1599057321760;
        Wed, 02 Sep 2020 07:35:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3889:a22b:6ae0:235a])
        by smtp.gmail.com with ESMTPSA id q18sm6014717pfn.106.2020.09.02.07.35.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:35:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] vlc: fix loop initial declarations are only allowed in C99 mode
Date: Wed,  2 Sep 2020 07:35:19 -0700
Message-Id: <20200902143520.19803-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

build issue seen on CentOS7 and Aarch64 machine

Fixes:
../../vlc-3.0.9.2/src/misc/fourcc_gen.c:75:5: error: ‘for’ loop initial declarations are only allowed in C99 mode
|      for (size_t i = 0; i < n; i++)
|      ^
| ../../vlc-3.0.9.2/src/misc/fourcc_gen.c:75:5: note: use option -std=c99 or -std=gnu99 to compile your code

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index f6c7a606d5..b1aa82cc89 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -30,7 +30,7 @@ inherit autotools features_check gettext pkgconfig mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-export BUILDCC = "${BUILD_CC}"
+export BUILDCC = "${BUILD_CC} -std=c99"
 EXTRA_OECONF = "\
     --enable-run-as-root \
     --enable-xvideo \
-- 
2.17.1

