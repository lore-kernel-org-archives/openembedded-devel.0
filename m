Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C036EC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:24:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.31087.1701869085196123240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8IlrzkR;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50be24167efso5723750e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701869083; x=1702473883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTZ3HvqVYPPNw4QTd2efPSzE1027p2Ovo8KLU852Qf0=;
        b=T8IlrzkRm/KlJs5KEPn/dSEiEhbpH/vIscMYKWLc5t04IPxxK8rOTpX1VPMPe6v364
         ve4/7eoWxRTu6xoczZFsZ5QkVWZ4joZu2y4EzV5i3UG2wD2GfGt0iihNYau5h+JLbdTS
         huOh5no8HjvLzbAPQqZxBWJp9Q6v3z2oot/rQ2zkQTo1OOfnhkgque5MjzSsVsFrHxRV
         83cgb94e7PKXXaWo8b/4kO4D9NrgIP+HUmxf1GAHFUlQShwjfN49gP0IniWK2yS9oUJg
         SOW5reI6N/5t658/2kg4+KKT2EQ7S1svOC0QE3lIaHI0hF1lgD0bbPS23j3TXFhp/SCU
         L8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701869083; x=1702473883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTZ3HvqVYPPNw4QTd2efPSzE1027p2Ovo8KLU852Qf0=;
        b=jVj2x4luXkAYWlQ5h2B2iBLGfs/U5IgEu0Qk8CXXAavWUZKSw7ghgRGL270FpkWoUf
         lJgNs1KAOBCC17REgYP9d4o4ws+NddO8fat0bDcK0zgviyRFtat3CYv93QzOodjieepg
         VENrDQypxaKcWvlHsQXqwpv1KdhzawoWYFSWcG+ZhXPkg1T5qmRTwxQI5x46HBYhNzL4
         io/4N70C6Otbt76f5tL0ndHIbcAvZyUqxusNTvGT766CeMglEQlMMTqcKo03pgf6PqCY
         eyE4Tw32kJvwL3/IwX8BjG9/UgEHUbJrN8VA6pc77CB3kYDk+82YWQET6Ur1VLjeAAlp
         Odsg==
X-Gm-Message-State: AOJu0Yx20q3kIIrsS3XosG6hGsIHaxjxezDMPLmP819i0eAA6D0XLU1I
	Ry/mHSfyua16UqssbUbvon/pJoSpBX2oyQ==
X-Google-Smtp-Source: AGHT+IGqaS/wCWw/Eoyd8GZNnEtq0x7X+7dhudH/rA3mJ7RsmTPj0W1bnrcDRusf7Xm3kYmgFsr0HQ==
X-Received: by 2002:ac2:5e33:0:b0:50b:f98b:dd61 with SMTP id o19-20020ac25e33000000b0050bf98bdd61mr283090lfg.205.1701869082913;
        Wed, 06 Dec 2023 05:24:42 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7d456000000b0054ca65663e9sm2408589edr.95.2023.12.06.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:24:42 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xlsclients: upgrade 1.1.4 -> 1.1.5
Date: Wed,  6 Dec 2023 16:24:35 +0300
Message-Id: <20231206132435.311230-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107250

Changelog:

* Resolve implicit conversion warnings from clang
* usage: add cold & noreturn attributes to function
* Handle -Wsign-compare warnings
* Quiet -Wmaybe-uninitialized warnings from gcc
* gitlab CI: stop requiring Signed-off-by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xlsclients_1.1.4.bb => xlsclients_1.1.5.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsclients_1.1.4.bb => xlsclients_1.1.5.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb
index 42bda7ea3..d73a27f97 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=350e1b718a56df39cfe8ca9345ea4575"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "4fa92377e0ddc137cd226a7a87b6b29a"
-SRC_URI[sha256sum] = "773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "68baee57e70250ac4a7759fb78221831f97d88bc8e51dcc2e64eb3f8ca56bae3"
-- 
2.25.1


