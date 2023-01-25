Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FD5C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.44860.1674653505939803256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g83Wr6hK;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id h3-20020a4ac443000000b004fb2954e7c3so3133049ooq.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POheii/zeZAH+USrAUAeDkkpAQUVe4NqmQsaItd+i7w=;
        b=g83Wr6hKC+Tt77kHexWOXIVNbSS/kWeCvP9e+tjhErrhfXn7HEe1w0S16VM2TNfBbj
         5niarMzj7eBebNejTduZLtwVDc9AUhceesX0gBnjGH9Cv52CPwoejmigUOV+SfuZ89Zg
         QVX6434B6x3yrKqoeRCopIgRk6OWp29a7aozLj1sz48fHTqKHQkvayR9FQPiPDXXfrNP
         4Dw1+U5pvlTWd0DTE2/CwXFNVpypAIUpaMvUx4er63V6weMCxg4nQ9S0qTqjG/JNVBOi
         Zcgs0k59uP9ZRvowjQFBcXhBs6xyXHj18wwSzKM6VEHirdCTtQYSECtUnUqQ6N9i4+zy
         FVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POheii/zeZAH+USrAUAeDkkpAQUVe4NqmQsaItd+i7w=;
        b=3LBB/0pJ5rZ65bvdHS1zUChE+wUOM4/gbRb6JqphWRekWdXhmUkh32CXMJvCVIzIi3
         Yvy0r2Fx2JvGaQb2e6uEe8HoTmhLosqsdifJh6ABuijgrk91zSvQkxBupGjNGa5rf1+p
         rNw9HveCxZQ6kc1+ph66sJuqUJLsuKSn219EXHL3FdLFu+kUeLEc4rgPqIDS1H1fyRbF
         S3L4/5t+GCtYHFJroLICy6gY7XahdqXkDrBC6y8SDQFzVY923mK06H8Sf4cFJw4rNj6u
         /1qLojSUyX5ZVWMPb4xRrzORxMu9W6DtZoBqIZvNKGHXJO2d+KKbG1lRjy8WsCvDIf+Z
         mh7A==
X-Gm-Message-State: AFqh2kr8vQhHNtkUqpUx/1InhkJdDK1PTrLaemWOTBbgzA0DgWE4NfvL
	3KTYvd2NGkjreat4LAicVQyHQVWMQuw=
X-Google-Smtp-Source: AMrXdXsVQWcTQZZs6S6D/icA44UFvXmt02iEOIPFQgbbODyBgWyDp5CwYkE02xdYZQKG/a8D/jSnyQ==
X-Received: by 2002:a4a:2c02:0:b0:49f:f3ef:33b3 with SMTP id o2-20020a4a2c02000000b0049ff3ef33b3mr15502340ooo.7.1674653505086;
        Wed, 25 Jan 2023 05:31:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 19/41] fontforge: Inherit python3targetconfig
Date: Wed, 25 Jan 2023 08:31:01 -0500
Message-Id: <594500439b0fef0147cec60cf7fba420b4828c5b.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100754

From: Khem Raj <raj.khem@gmail.com>

It currently ends up using native python3-config which adds native paths
to compiler includes which is not what we want.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aac23a0407089ea23314720d49f9cb120452ce53)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
index c53f2db01b..ddb4443baa 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native libspiro"
 DEPENDS:append:class-target = " libxi"
 
-inherit cmake pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
+inherit cmake pkgconfig python3native python3targetconfig features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 
-- 
2.25.1


