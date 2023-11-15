Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B07C5AE4A
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 19:06:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.21986.1700075202935845124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 11:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVOSWSUG;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5b99bfca064so4766639a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700075202; x=1700680002; darn=lists.openembedded.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y21Go7tdxKOu5KFCE1+S3oYlB6/UJH81NMH/Rus/EeA=;
        b=EVOSWSUGXQeF0gpwaLBYQgPhfFWhxciO1FPWnrdsEy0eg4xQF4cLivtfz/qACqipcb
         qTsDEitW3JMLSO94tGpw0yhBdFrE65e8o+hyl9bVGG2UPF2GBYZxXsUaEv60fRy3LXw5
         cEduypDBuhfKVd2YugfEt6jCXXtc7/NN5DDI+/qQh7NxCLbaOw1S2f2ek/RH0We2jg4l
         B1tlO65HmX8zRH1c+wDmYI2T3TbZ+OI/3/1FCzCqVzzHSZOZOlVNuUvYgiytAoqDFHc/
         esAMwpfSZ98omtapL4G4rn6DH6PxcgPlBDTt/aEtHWcGRJsGRUrTyQ8HKtUJ8WSBBLTJ
         ap4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075202; x=1700680002;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y21Go7tdxKOu5KFCE1+S3oYlB6/UJH81NMH/Rus/EeA=;
        b=khOUsxhLF4Co9FzcoW/VJbteQS7IwfhP7LVa5tN5kiMyqGYTKYM5Z7yMOMc63KXyfq
         T+MJC4ny84bwsUzsOT1Bd/EJWdkWMvNPy8XxPAqWHjLUpHNngZLNrAka+yAMWrlvGi6P
         Dy28FUQZW22fqs/L2XR4QsqVUDnEt5Kk7QScJDkDy1h6ik/jky0YzSDr/bE3WfOWZBnt
         Gd1g4EZ0Aomtr59qQU+xqMcXYJKokgNjyEiltvfBv4NAJlGcAEb/esEY2CDaUMLgBJpB
         4t8EwZECqh3mzpuQ9VLX61zqMOBmkcMuJx4JFZAeTCoTU+MC7pyKosg8V63uwcvPSSE9
         v33Q==
X-Gm-Message-State: AOJu0YxGB3rwgfqIJhsOM+JA/wiD0whniGzmMgJv2Q3e2fDETzUw2MGP
	6f9mPLa1BFb4Jn9zIQgtm8hkzybiNwML3Q==
X-Google-Smtp-Source: AGHT+IFctf47P1OF5gpZpKP6Vau4tb9Zyz6ou69vlb5niJ+7XQhlhfQQPzRgbbX0w2G6lss1MmptaA==
X-Received: by 2002:a17:90b:4a43:b0:27c:f9e7:30fd with SMTP id lb3-20020a17090b4a4300b0027cf9e730fdmr11209948pjb.7.1700075201703;
        Wed, 15 Nov 2023 11:06:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170903324c00b001bfd92ec592sm7669004plb.292.2023.11.15.11.06.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 11:06:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2023 11:06:27 -0800
Subject: [PATCH v2 1/4] gnome-console,gnome-terminal: Depend on vte from
 core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231115-remove-vte9-v2-1-c894df1c7af8@gmail.com>
References: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
In-Reply-To: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 19:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106768

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
index 748ea7b5a5..9669e337a8 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
     libadwaita \
     libgtop \
     pcre2 \
-    vte9 \
+    vte \
 "
 
 SRC_URI[archive.sha256sum] = "e7462128d2df2324a1d748062c40429cd0504af09e407067b33f3a9d0c59c8e1"
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 014b329b34..594e1c0b22 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    vte9 \
+    vte \
     dconf \
     libhandy \
     libpcre2 \

-- 
2.42.1


