Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CC4E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 16:37:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.86292.1734453446292286934
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 08:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEe0rpYB;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728eccf836bso4869770b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453445; x=1735058245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbEONHklzYqL5jjgR30jFUqT1co51+d4W2j83xWezkg=;
        b=TEe0rpYBPIZMqeeTR+f93w/sp30aa95tYWy/JtA+oJGnYJb4qhbbFdPXGcYAfgXu+Y
         a+t42dO9F8bWTPSHAzu9N1ahXLw+hmbPvcIihDiFU5Opx9iHES9mFeWPEshQYBjnHO0N
         8PlMBFZfPAhXPNKjz4cpQIa4ZwKp8z008iYw41uRrZxeOQWWEAn5r4Lcb/tcM9J/cY4+
         Wfe6ngW3l7JavDQOovRkKMx8OZCXz232mzxPTS2YV6e4oCUwnlCZraP+hipQ6n7fN2yx
         Bn3EqdfG5qJu0VjA+yc6Q0ipTUOrktP8Swvc8rB7iPP7L2bQQbR51CDBID4LPGZh1hJ5
         ii2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453445; x=1735058245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbEONHklzYqL5jjgR30jFUqT1co51+d4W2j83xWezkg=;
        b=I6JEUJw04EX+dQT1XjS6fVSy0QQbsRCGbLOgFQIZ2nDZPdHVGrufZ5w5xWF5mrI58N
         K+Q+bVzD18Z2O4plWpnfZsy2dhutOMD6bipelVA85iqS1gnmNsTM9lgelQWxEzjp0X8r
         Vb9MxaDfWG83lgbBkGQSAKahhnjiPp+ej7sMRdwFIzhuXPy63LdYCe3BNFIRz6cuOwal
         HOGI373nt155cBpQ37lkKfkxFduYyDCww/xufWraGTWZrkTY8SY+nD4QB0EqC1yZ/KvJ
         PmRRcGIerrqWZ2PM3rX/O764/AvuOXBSIqTbeB4/GPLjSeVhdRQz/gyilaWaSgjtluHB
         OIUQ==
X-Gm-Message-State: AOJu0YyubGhjTGlViFezWwYqyMfpKUR8rffSHja+lyzZzKIvtV65gtPL
	FR8kQvbLh2mjk/lnmuOAUzzxZcI+a+guTYqIpgb7Ix3bdumOxxb7e49V8ryf
X-Gm-Gg: ASbGncuZ8bDtWkgTqFE5dXxbYTkziNEg5r3NFli/8KTMGyG9bpw9O4IibyO7h+yIkaD
	iX3dougLyvCZR01jnx7nT+ONxMyNneY6y0lOM+dIKgA0JdNSkpabrCXGUozO5THatIRwImVMh4J
	2JGD1Y4XTsfXJqYbPxNGV0qwYUoFJe2KB8b2ckZb4qqVLepGOQG/vOaBbIkzHmuMaxc+k9Lpyn5
	i6xBUIJ1o6kh8URP5NzC48kTBuTh6aZPhUzyyIokDoJcBIG
X-Google-Smtp-Source: AGHT+IFtN9eurC14qPMD+10ZU3iEXNlWmnYoThxoGqY+ZpEa1N2qz/0U0ZonxgBEnHvbzXe63pEqDw==
X-Received: by 2002:a05:6a00:1893:b0:725:e73c:c415 with SMTP id d2e1a72fcca58-7290c25c8b8mr23307501b3a.18.1734453445238;
        Tue, 17 Dec 2024 08:37:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::e4a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5ad0sm6838803b3a.56.2024.12.17.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 08:37:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove libpeas from packagegroup-meta-oe-gnome
Date: Tue, 17 Dec 2024 08:37:22 -0800
Message-ID: <20241217163722.213663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114372

all libpeas recipes are in meta-gnome now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index be8a044afc..eec9dbc58f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -444,7 +444,6 @@ RDEPENDS:packagegroup-meta-oe-gnome = "\
     gtkmm \
     gtkmm3 \
     libjcat \
-    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "libpeas-1", "", d)} \
     pyxdg \
 "
 

