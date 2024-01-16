Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8551BC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 05:13:32 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.5188.1705382003502711081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 21:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0BkPcVy;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e72e3d435so9055131e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 21:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705382001; x=1705986801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiowO+EJa8FJL3Vpv3Jv06NDNgaPT6C8IWuybBnUN+w=;
        b=O0BkPcVyxXb3xpLiUz0QgmRZwbvgZGmkutqbdyYm0679MNlddkj3BWTtL6+mDr2I49
         YJqWf8FZYdnjf05EkO7bb1N9a1owRgIFUAkYDFQoB3tytgrBSqdJQXmkHr0+rktaSvO1
         zG8zzZiPETbx7Io/y3j4WTVrIaGFZlKk1Zv4Gmiu8NDAHPXKdd0YF9xUf/8gS69iDtU4
         jMlqz56XOLqUjF0RmuVGvmFDeQB+i93kRN9cywrXAHr0ypA7dx/3AfXAiJgPWAWvXHno
         PHkiyOb3VNrnueMW0SS66XJqRrEnNQq+VSntQ7l0a5ikV4qYj1arUCAlHPnen0l2Y+tH
         U/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705382001; x=1705986801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiowO+EJa8FJL3Vpv3Jv06NDNgaPT6C8IWuybBnUN+w=;
        b=vsgxejaaIbZji+sCxQtcwBr7yorkDqz9T0g+1bGokzPVZX8kMeNjcXzh2wZOteUGW8
         PQBqgitGv4ZfZ6Q55G0b8KgHlJYJvS6pPQDZEKvKNyfvsG3QI57fP5V6WsbS1GO5iOvM
         hEUE4R8eWVQ5vhXxdUXGl0KWlKG1uNsXk6k3hZBIZkXdKZcYGZtnR8Zb3n+jKv9m3kjL
         vQvm6ojce/p3TciEdRAfQsZdcMTfSg9SG/CTSbc+G/MISCX+75n+R9YZgGgo4bKol16I
         ViXqq+8X40s1PsO1Owe34X0V2OG5N+Z6u3agIRldoYfMrKVWjzZqYAp+oO5FkWfS+YNR
         TWWg==
X-Gm-Message-State: AOJu0YweqPgaLXu6uYhLqW4zxHxtvS3pZYsorIduWxKx+QsQ2woQ+PqV
	Kw5OpOu6mgWVQS0amWZ8j43RvF5LQ6wb/w==
X-Google-Smtp-Source: AGHT+IGb9p1yi1sVutLj6D6q7o7Zs0GLkaJIu/6tlxlD97asfjzrPdATnrGEiJJN8f5pGzJFTXZRfQ==
X-Received: by 2002:ac2:43ac:0:b0:50e:6859:bf27 with SMTP id t12-20020ac243ac000000b0050e6859bf27mr1782580lfl.36.1705382000894;
        Mon, 15 Jan 2024 21:13:20 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906091200b00a2c2b475a0esm5997848ejd.105.2024.01.15.21.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 21:13:20 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libebml: upgrade 1.4.4 -> 1.4.5
Date: Tue, 16 Jan 2024 08:13:16 +0300
Message-Id: <20240116051316.18788-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 05:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108299

Changelog:

44e5095317faf33a0ba318b98a04fc5d60a192dc NEWS: add entry about invalid memory access bug fix
f3249a701df76185103c978f3693684bb0c84b74 MemIOCallback: fix buffer overflow when writing too much data
4c0d757d6de529e8dda6bb6ca08369d5f9bffdb3 MemIOCallback: fix buffer overflow when reading too much data
f4eb4ae863bad23b70964931dcb1464d091ba2df [1.x] add a GitHub action to test ABI breakage
3b582725864b33100902761cb8438503c163e5dd [1.x] do 1.x build actions when pushing to the v1.x branch

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-mkv/libebml/{libebml_1.4.4.bb => libebml_1.4.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-mkv/libebml/{libebml_1.4.4.bb => libebml_1.4.5.bb} (88%)

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
similarity index 88%
rename from meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb
rename to meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
index 3e37e7d2d..680380606 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https"
-SRCREV = "8330b222fec992b295c8b2149cf70f9ff648ce4a"
+SRCREV = "1878e784321673561039a6a37076b2736f4dc98f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


