Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C316CC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:46:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.53010.1669920355239543020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FO2gc/5o;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id b11so2690322pjp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0aE8/Fgdc4Pb9GrkHn6osHgbJ2JioIRM7xdZdQW9iE=;
        b=FO2gc/5oApUacv6mp4aulVJMog5qDJtV+o/tuQ1BOSeyBDmAjTBYUQsjqp7vfywRJO
         gfqsWuUEUw0sVfULyslXo45oLt8ENOUI8P48pErHtYPm3ATSm/V0wz0kmGy6Rx2VYSZZ
         9aROGWuUMTLYVYLkF/KkLv/Jf9bKRz92NRbisjLewNwnr4pEQDsI+tiWu5h816kE9YzF
         528sb3NvMmUHj3Squ5UBQTBACkUHaV+/jjDmKWB17BeTDiAtREWxUC5a1/hXFsn0Aeh+
         vXKEjoK7uv7cxctBwKRVwjvy9ijY3Pz3NbYAGE0hzCPeVuVr3l9gAR+mvrTyQ8vQOb5J
         Fl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0aE8/Fgdc4Pb9GrkHn6osHgbJ2JioIRM7xdZdQW9iE=;
        b=qXKl0ehKUYwAt6Pzm1wdOOTnalwxjxTZisJhuhsHu8DOgTj0HSWNDqymVJBqBr8hyU
         yO2GsjB0A9Hiihij9N65MtyXGGTArmW1L5vEH3+MOVGHgQP1vyYx/Kbtptoa8ZaAUchr
         pKvnt6qdUR8bgjZqbHVEzJoGQenhURaer0RJe+BkNsO1dDoOXIr73A6NVhpgbnNDCii/
         Pi1MZ6daoyMDVrICZcQ+fonXyqYuH+h5kLP8SiE3UlL86VPYy9vdh9PE4cr8Utq6Vkae
         vjzgbNTA8JE4C+4XtIw/kAn+pUXm0qp4LBK3E9aDW+B6JNPCSLUDPOTBaAB9J+GStfXS
         PG/Q==
X-Gm-Message-State: ANoB5pm5hVzsBcwUXRzpEBHiJ+RO5Xj/+tDqAt00lJHQFDKsrOO/7qvs
	8ddrdxf/r42yuvwjA3Ewz6+aszbF7KY=
X-Google-Smtp-Source: AA0mqf6+UIODIi1ebi0K7oL2mWgIg6xHPvSAY8FR3z2ErxW/gz4wxX2Mcomv+nEvgz5ReGB4BAsRaQ==
X-Received: by 2002:a17:902:e809:b0:186:8518:6c95 with SMTP id u9-20020a170902e80900b0018685186c95mr49723793plg.149.1669920355126;
        Thu, 01 Dec 2022 10:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b00188a1ae94bbsm4018120plf.23.2022.12.01.10.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] surf: Depend on gcr-3
Date: Thu,  1 Dec 2022 10:45:48 -0800
Message-Id: <20221201184551.35272-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201184551.35272-1-raj.khem@gmail.com>
References: <20221201184551.35272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99898

It has been renamed in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/surf/surf_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 45ae79305a..1f55848a79 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -5,7 +5,7 @@ SECTION = "x11/graphics"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a6f86d002ae9ae1eb1ccc466289f146"
 
-DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr"
+DEPENDS = "webkitgtk gtk+3 glib-2.0 gcr-3"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.38.1


