Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668DFC4707C
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 07:20:26 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.34966.1705216818107174795
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 23:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2Vp8jLq;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-204a16df055so5350218fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 23:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705216817; x=1705821617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNB/MohYVnbCngpEM6TZe5CFp/3+nfbwD75f/qQCeBY=;
        b=m2Vp8jLq2KLSstq07QIu8xrswPZbW7shYtrHNJFG+fAqeD15qhqK3fBzGZHfn+ND7t
         mb2Rn5tTixOEv4UiwnXGl3IfhjBHjPCZM6eqMt7unstB7T+M5CQUs84Er/nlA0vNz220
         U30ld5+72El4pQ5oRGp6JfR82RjIp9CU6gfL2V7zGGSy0SgTNpNxqjIS+XYgFGy6BvtE
         oCbHhHl60cHyUgId+CE2gMjFFTIi46mXloYYkZ0LhVrWdc3fcs56nYVHjpTue2sFNjn9
         0Jhp32ooUoj55iGWYhGiJwi+JSYx9TiyAgaWiXV2Tg+J/FZxUoXhJqO09g4AKnQvqTLI
         PGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216817; x=1705821617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNB/MohYVnbCngpEM6TZe5CFp/3+nfbwD75f/qQCeBY=;
        b=jRiIjhBcfb0ivmEcE28Fk9gSMJqQiANrhMhQ7iwR9nIhGoNWdn7fVU5poE5OrtLroi
         0Dm6L603Xi8MwxiNCjSuv6rU7CH8Ap4kYzNo3RWYHjwQSUCwiLcHMJ+tPLN9FSfL9EdY
         OTMD9OOGSMzNosXLq8j+UOEfl7KtCTAnsJn1S34reJZAlWHjEv+M4pR9hG6OtTIfIVWL
         J3c1qGCekEUqBPpDE9uVzmY1Lz0wqGYWdoXW63eg1uGkwQO/0rsJxR7TJcbwUVQB/1Qq
         4siIL9Fp8mYEhx1ViFJBPFdJWFrjGyPFQPc5BJ1zuh0O1dk6rZ31rlqOJJMVPbH9jsNZ
         sftg==
X-Gm-Message-State: AOJu0Yz9m9O0sZox8chqf3EPAnRy0bjeYqNCnvB0yoYe+niJf/aAh/O3
	5SWu7MzwOA/6bWV858ls8w39uoL8acnqoA==
X-Google-Smtp-Source: AGHT+IGinqErJrn01KGWQh1oPTaGvjNn2xuE4Bo4FhfGloSiGlQtUc7Yb8oddeTllxx3ojp3WkiNew==
X-Received: by 2002:a05:6870:95aa:b0:204:fca:ce23 with SMTP id k42-20020a05687095aa00b002040fcace23mr5391477oao.28.1705216816850;
        Sat, 13 Jan 2024 23:20:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id i63-20020a638742000000b005b458aa0541sm5864020pge.15.2024.01.13.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 23:20:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/5] thunar: inherit gtk-doc
Date: Sat, 13 Jan 2024 23:20:10 -0800
Message-ID: <20240114072014.601505-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 07:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108269

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
index 02e4ef956a..e4d8b7b4de 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.19.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnotify xfce4-panel udev"
 
-inherit xfce gobject-introspection features_check mime-xdg perlnative
+inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
-- 
2.43.0


