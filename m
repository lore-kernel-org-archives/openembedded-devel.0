Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.18144.1590941822636034626
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rhZEYZL1;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id q16so3257982plr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CLePfOrPEheOCYfX8vtrvLF7R8dfMziFre3/KLmqSGc=;
        b=rhZEYZL1rIwaPjYpE/IHbdo+UlvncgK1Rs+92tEgeSZwSQqRj2hoB1tPKBWvz2uaI0
         ThlTigz37JxiGBO8yHzHVZDmNi0i/yA/jdZIH6ZmJN0ZQCjJahrCdjWIAvI/hT+Y5sf7
         wpb9Nm05gfmU1s2x1aeeIoI0eRaqs5J4PCy8mBfwtjT0q/GZ063r1unJC3bR5jadn6Jt
         EfNkdTtbY3G6QmK5vdnxg+NAKdFzPhi760U12G4gWR80j8K+ckV0BJW6Bm66MTAU/vSC
         JrFGhVuKSEsSJRh5eLX04a80PU1902CBTYDnkNfqcQwoZeIlCNntAQtiETf8+K2CH8rh
         HYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CLePfOrPEheOCYfX8vtrvLF7R8dfMziFre3/KLmqSGc=;
        b=JG1TmAWdcOKh2LrchUG8FPbsahQINoMuUAKrU+0IY7ONf+d5YegT20gBK4cQwbg4hq
         h0GehFMoG9LBBDZIpt80liI+hz9enRkABJlJ9F9BtLfqB+oykSEwHwZBHAnrT7AhED8z
         NIxxY1sOJNYh2EXuRZ8utEEKk6ZXPEau1cnQ2s7U4DU6L1RfZCqUh2KJS9uikfhkQHR1
         9knrLJ5OOhlCbJQ7//CAc+LwNVsZZ+BjxNqmrl8KrY1V6+4ThbuQkkZoPxyw66jk9kex
         pHyHPzY96jqNo3v8TYQDlo+4bk7JY/jhLEUhpBeSLTeq9MesBwDRQEEd/rawQ0E8OVpd
         N+Fw==
X-Gm-Message-State: AOAM530JpD1vLWVqLK+DhhBBDotnmaHnPHyWYFPIbj5AXCucLrWAtUv1
	abrHDj1mlDrEf2AWt08qT0lF8uM5
X-Google-Smtp-Source: ABdhPJzdn1+oSwF6fe+Pxr+ut374ObGnupD1dO4+UkWnzKZ2lyEY5+SoWWTev3X91qrJIw9a7I7sZw==
X-Received: by 2002:a17:90b:1046:: with SMTP id gq6mr18034147pjb.203.1590941822038;
        Sun, 31 May 2020 09:17:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.17.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:17:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 32/35] ser2net: fix upstream check URL
Date: Sun, 31 May 2020 09:16:19 -0700
Message-Id: <5d228320ff79817ddc51f95038e66178573eb86a.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status ser2net
<...>

INFO: ser2net                   4.1.5           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cdb571edfe12b387b1c9e40bf1a9b542dbe4c83)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
index 0df134eca6..05d1ffed5f 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.1.5.bb
@@ -12,6 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 SRC_URI[md5sum] = "52c5e56d2d54ced0cdeb764a7e8fec92"
 SRC_URI[sha256sum] = "df904d271eb161c265c956f0cb938dd0a375dda4a919a344f73b08bc50b9f308"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
+
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

