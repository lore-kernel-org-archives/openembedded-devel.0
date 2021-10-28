Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B79C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 17:35:50 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1033.1635442548753521106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 10:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jq81BsJI;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s1so27995987edd.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Oct 2021 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8cYrGkI5cvik+/hMaDWvT8vdOPn7ctjIFl75S29WLY=;
        b=jq81BsJIIUYCl2HOc/Nj3joia6KtL/ZcCZR8/e0bOlujx37A+iQ140GfkzjJULntgA
         cnR93I3qp+IenbjcdI4XnXwXRr+j8t0nbX5TgcaTWjsllvbI1UXnLsaL4x0kyfJY0ZYk
         8rQ/hYaehapGFZGtUa3/z1UKIapalvArRgkk6OmWzBItLottik4sq66mWqO/D1rPr0NU
         9wBwxT93DJ16HzkFFIqTVTUZF5aW2ENLpVsoYRqLk4xirvmFVJHKJ/5vsOe0yNH6Cg1t
         A5og/ddERZMNeHKN/2sBXuUaj2KkqkWUnCE2L6dwkRlN8EyaOXMWpz4A5zG2pWr+sdwS
         ecvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8cYrGkI5cvik+/hMaDWvT8vdOPn7ctjIFl75S29WLY=;
        b=H/gMKSRh4g2IFVTGwWbpTUsV3eYetyEoaWvJLbkWDqwlTS6vhT23t8INkG9Tm03L4v
         ujT1PeLEt0EgwFjRfquY5Iu0yJ52veg4QFb22TGMEkZy8HGfEhOLtMUfL4Af3iGtxJxR
         nv6vNAR/YaUfJyyrLGlXHf5ehPuvGKKM0i43w/UXlQXExlfC9SE+eCl5ogDLwF7urRh9
         Lf/c+ALhze4n4+PxrwhsvG6On2wW9xcg0BFyn+/cb6zuAiZtO7pn7lQGZXYD6JLS/k+a
         jVhutuFcGCcRbVcDfoDpkBc9lymXKk6UalANks44MeBBwSag7l3tWLWVQ69bSIkx/jlZ
         oMrQ==
X-Gm-Message-State: AOAM532EfM+YxqmLdAWzj+moPuPAFrPLRRy5hdcRuVCRqJl6LXgJFII6
	YL+WtpGrWkveb2ddRr/O7NzDpI3Aupc=
X-Google-Smtp-Source: 
 ABdhPJyDk5t/qUtq0pDogg5TjP51IjYrrvoGDLxaQ9QpyYsqiLAiv6DLk3bAVQ0agGG7dWXObjRWVg==
X-Received: by 2002:a17:907:7b8d:: with SMTP id
 ne13mr7156315ejc.269.1635442547002;
        Thu, 28 Oct 2021 10:35:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 a9sm2066695edm.31.2021.10.28.10.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:35:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] unicode-ucd: set downloadfilename to include PV
Date: Thu, 28 Oct 2021 19:35:44 +0200
Message-Id: <20211028173544.163025-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Oct 2021 17:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93639

* without this the UCD.zip is being reused for version 14 and 12 when changing
  the meta-oe branch resulting in:
  WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local file downloads/UCD.zip
  WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming downloads/UCD.zip to downloads/UCD.zip_bad-checksum_033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 2a0188649c..f0f3a66e07 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;beginline=43;endline=83;md5=cf6c4777b109bcee78b6083a21be6192"
 
 SRC_URI = " \
-    https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd \
+    https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.html;name=license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-- 
2.32.0


