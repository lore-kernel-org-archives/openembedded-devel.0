Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7205FC001B0
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 14:00:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8155.1688220016389200805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jul 2023 07:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KWk49xIJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b8062c1ee1so22394335ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688220015; x=1690812015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k59qk1lVDAdamabgiZJuy1UNUN42yKHHVLduLZYnVdI=;
        b=KWk49xIJLl0VuzlUXt/kbNQUWgXDcWJqYXfVTTds/D7/ctYRBAbzb/jBHxfirUBAd7
         LbCJCZoJ7cEl1EO3rZ0AZQukbCC7bTamtoXI8fU7W/Ui3WTfx3sP3Jb3Sqzulw4BvVin
         NLuXwfOJkewjysRmt9Qme2gkP9IIdIaeYeT80GvQmEQ9xtWjltVImkROeRPnur3kf7r9
         tDU5bn7Lkm+hiCWmHLgQvd6N0GQTh3Q+YlmS1i+Q9nJWQLCn3uPvNDcaGR7dRntOjvCo
         orXsc4SO8SQv3uf9gapfPCrFR6BdUlDobju9vlXY/Wkjr0O7cPGuASzPD9d2TlygDfr/
         yoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688220015; x=1690812015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k59qk1lVDAdamabgiZJuy1UNUN42yKHHVLduLZYnVdI=;
        b=NuIqgtPNmpQVc839zTwSlrmSSbEAUFVJxjO4jc6Rf/nlajE4NXIz9OqBM0ZMUd+WIa
         wjOP9K9lMKUhil5sfHM+knOZpEszt45IYRIagewWje4/sJGn3aWaYkaWHqsfW7HZKlLE
         4wScuj3LkxPXHBcXNV9etIbUHI+Sp0HHQWdYZvItNRkXjjdUJT91gfK5eD5u1DZgAmYg
         wqYkF7Y/WSTcuskjcTTwxLwkUobjRpYt3OLWIQeTVaPJ234+Z86J//geRUsCH6b9FVcd
         d6iZEbKy3bx98uHY6kqPf3/yWaz3BCCNSQwJQrDU3ZgOQv7DBtFxhpB4MOMbg8d8RSbv
         EFmg==
X-Gm-Message-State: ABy/qLaFZXIy50IwuNUa5q4EsgaZUTpMgh/gIBQKs854YthqeQ+S8NZ5
	b4wnDjyleGiLoCTnf/HX0KPTxDe2FY4=
X-Google-Smtp-Source: APBJJlGPLWQ4zJ+DEudNRVesdmn3r90Wm7ElOXhpTG7w23TyGXd2BIXT7sq2GmmKA9gLJLbd4mCp0A==
X-Received: by 2002:a17:90a:fd0d:b0:25e:a643:adeb with SMTP id cv13-20020a17090afd0d00b0025ea643adebmr4836203pjb.39.1688220015391;
        Sat, 01 Jul 2023 07:00:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1944])
        by smtp.gmail.com with ESMTPSA id bo21-20020a17090b091500b00262fa9a2310sm9405132pjb.50.2023.07.01.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 07:00:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xcb-util-cursor: Delete recipe
Date: Sat,  1 Jul 2023 07:00:13 -0700
Message-ID: <20230701140013.3347993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jul 2023 14:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103647

Its moved to core layer now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb b/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
deleted file mode 100644
index 047697845c..0000000000
--- a/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-graphics/xorg-lib/xcb-util.inc
-
-SUMMARY = "XCB port of libXcursor"
-
-DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
-
-SRC_URI[sha256sum] = "28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb"
-- 
2.41.0


