Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB84FC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.589.1642801148535311159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mAeuf9+Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id i2so1988756wrb.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlJ/qUBKln4faZ+td4AaKIwQBD0SIdc5jAvup98gYoQ=;
        b=mAeuf9+ZftwOZbE1kdfwQ59PZV/Vc1ysadoGkOhZpG5BnS0zwkl9VKcGnsylM2gxvx
         decxfTyaYhtzhDYmoDzaMeLN4Ia/yE7zeMze09/L0iw13M8MjhucKfKVLawZdo5Pywbp
         DI1RVCldIkcJ4rk6XpXQI79hSA55wCuVnBMYHYNCsPKy5egG3m37Ew5QlUYPDS4DQf2e
         ZwkJ5LxRSTjSvD4bn1krH4uj57aBzVmqkiRWtw4/yYXeUn6xnl3H5EbParf1JIIikDLE
         G6SdScsNuEieuvwIReyyQE8J+NtKeNODNk7sidA+TH9lB3fezdBsfQpVd8AprpV6uURc
         IMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlJ/qUBKln4faZ+td4AaKIwQBD0SIdc5jAvup98gYoQ=;
        b=jtwYY56H6nz0zTJzMCly2mceBxdROJQEbOguJo0jQLWjUZ/r+3wiEdsy6ld9zn9MuK
         VyJWv6vjt+xwP7aO0ImOk5O0J00Uy7FavcrNf/ROmwA/Yl0cTZPyBbzv2ShjWRhAWmLC
         4+riJRsMN6uIoy94R+PJGnIAeHnlN+ZMUd6D00vtk6Nrnz2SB9O67KSiCHe2rADUtBsz
         4QyM3UJ7XCi6E4bmwjpG0/FsAUPXQjXyZDpFgHJK/BAHG0kxOsVQTCY6C8hFCwIsyxfL
         tkI+Lr3TZ4Eb3XS6Gof6bqSIddvj05SK5Yyce1SfbO/w+z8iCk0avWyctO0JhcObCXFJ
         EMlA==
X-Gm-Message-State: AOAM532BlCs6khaDxrFpwE7uEfZ7iWVXy0qHPBERusxrNzlE4G3aDpUv
	OzocaMbkKcKSVi0cUC32yO61drKeVQE=
X-Google-Smtp-Source: 
 ABdhPJx/vhp286lP+MiAM53bM5WrobWYCHMuuzwWAWV5Br0IgYNeBBj0eqhduPosQakMevo/BMhZTQ==
X-Received: by 2002:a5d:5582:: with SMTP id i2mr5454216wrv.442.1642801146895;
        Fri, 21 Jan 2022 13:39:06 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/19] gtkmm3: add gdk-pixbuf-native to satisfy meson 0.61
Date: Fri, 21 Jan 2022 22:38:40 +0100
Message-Id: <20220121213858.762625-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94979

This version of meson checks for gkd-pixbuf utilities
regardless of whether demos are enabled or not.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
index 428ec69d7..a8c771364 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm"
+DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
 BPN = "gtkmm"
 
-- 
2.20.1


