Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB10C7EE2C
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:36:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.85913.1684150590456043015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 04:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cyadxVUS;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so40820275e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684150589; x=1686742589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9obQCj2+SGTh+1WOZKoTgPbo8KbTVSw0Eob4tNlCEjM=;
        b=cyadxVUSoIBvKeRNZrJmio/QkptU11+1zWTQlloqQ5RtK/vQsdIiy09QqvkzGD7gGI
         jDaGycREaV0Sac1XYCPFpVZaEywsNXHNgCa/aq/Fgt5WydShPFDX78Yl/WzOmGWPsdAB
         jg/8y4cuFmbk3VFJnGnVoLv3eMwkW3u12y8FBTMNeBdxJTr5uYRwM55CJwMrJeW4Gjve
         D0NTEqrgd3H6Oj2xvfPflJkiYN+xlcXVpVqkiHx/skw8eSCTeAtsx1UDVrjY9KQU2w8p
         AM+hn3xPDQ77QwouZOfB7sg/k3hvJbQCtIByiAvENAP5u9RgRDEo9wYobWg3f4ArfCl6
         w+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150589; x=1686742589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9obQCj2+SGTh+1WOZKoTgPbo8KbTVSw0Eob4tNlCEjM=;
        b=G5sVj3dZLQ9CAIkLx8IYptngIscsgbqBjxHLi4CAHdTzwI+INmgAQJ3f/YvNtbaoAp
         H1Rq2JnBnUYNXxsBskJ8Mmw0CzFjxDD+KXnyILzTmKO+Y+GReP8vdlCHaXcfeDvShD75
         I/0iGoevTdp3ZwC5oXbneSXlMLhmOKQrCyvZpJJ78/MVG8r9WaBRZsuAvRjBND2/AAdO
         apL6Yvb5t8fGOVn9SKiOspSiutCHUyB2K25HYgTafH1+BkMiHIyCNgFjqrEtirmnwyaF
         oCm5dKmDYcO1Lbb3Kq0flnXsShM2504nOTZVmpV3bUj5oEoDoA1u0AclnellR6JlvLij
         64sA==
X-Gm-Message-State: AC+VfDy0PEYVBxPuEY7DV8KTdxJjflsRAWPzrac//YiS2gPzkrgPtlPM
	0rjAMps1HMrfJ9jkNIngHXsef78fkts=
X-Google-Smtp-Source: ACHHUZ5IAbbdye0CAqNnBMRggWfydLrNsVJT6rqyYCdo0eQQWMT8b35srHeCT66MW9pV9UjE2Ybvkg==
X-Received: by 2002:a7b:ce8e:0:b0:3f5:774:25a with SMTP id q14-20020a7bce8e000000b003f50774025amr3001008wmj.10.1684150588832;
        Mon, 15 May 2023 04:36:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c214d00b003f42461ac75sm23865983wml.12.2023.05.15.04.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:36:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] paprefs: add x11 to REQUIRED_DISTRO_FEATURES
Date: Mon, 15 May 2023 13:36:20 +0200
Message-Id: <20230515113620.42510-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515113620.42510-1-Martin.Jansa@gmail.com>
References: <20230515113620.42510-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 11:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102602

* This doesn't build with any gtk3 DISTRO_FEATURES, without x11 in
  DISTRO_FEATURES gtk3+ doesn't provide gdkx.h and paprefs build fails with:
  http://errors.yoctoproject.org/Errors/Details/704195/

../paprefs-1.2/src/paprefs.cc:30:10: fatal error: gdk/gdkx.h: No such file or directory
   30 | #include <gdk/gdkx.h>
      |          ^~~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
index 6d0cf7ed7f..6e4321dd7d 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
@@ -7,7 +7,8 @@ DEPENDS = "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
 
 inherit meson pkgconfig features_check
 
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# paprefs.cc includes gdk/gdkx.h and gdkx.h isn't provided by gtk3 without x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/paprefs/${BP}.tar.xz"
 
-- 
2.40.1


