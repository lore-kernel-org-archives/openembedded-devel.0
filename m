Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EF5C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:42:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.31438.1701870164224332248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FO8ScK/A;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50c02628291so2452062e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701870162; x=1702474962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+GHl0Od39FCYoQgIPK8Oq4bJM9J1H+AFXvedZLi90Q=;
        b=FO8ScK/A3F5mXYujGZeeoo3X1hZhNz9rVyDe1jdacJ8nfrrN4xxeMuJg8QSc48b399
         tbmJGjbF2EVnifDWUS3f3fxQOJhV7yEaDiEAPKKEgyBN/7PJqtbn3R8L/kvJHV5rFLJ9
         vslfDqWQaHDZtYQlv8dG8s+u3hbwz3gkYUtMDmey0c2vJciwIoU1nnDrJWFqvAQRYghc
         rTyk4IXTpvje/+iJC4nhIGbsEE857+67tOW9JJOwC69zFP8D1yD+5Pe/R6BfhrHj1byw
         QcVuG+WVl21aHtizNU/XwA9h4+ihCZkKTHTtv/Z55R+CrxNuO1No63Tz+XPTiG50NSiM
         vsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870162; x=1702474962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+GHl0Od39FCYoQgIPK8Oq4bJM9J1H+AFXvedZLi90Q=;
        b=IZV9vYqW8dmAIDIwL1AKaNK7Z9AL6o4cuvE/YF1OMt1PdtyM8QoMrAg6lf9Ka0D2wl
         fdoi7VJ/MNvF+7oquN8IDrI9jyKvKciBZX8ztUStnmquty1Wyuy+PRCat4LpD3bS7lTD
         7XmwjAw7joYLCpGejAzPyE/05QeT5i5XPwFsgXqerzUdyIhv6FYkCXbzI8xGCNjDrisg
         eyR1H4xiKdAs1W5oSKHQ+vbY81bZGinQJmS5gHV5vCZJ53QvOeoElUcZ+npHP9RIxrUS
         fihYqvM/DCfHd65P7NMvHd47Pz+ZlPsVfYeoZAUOv8eHIZKouLLOmkgNX+0NG80dkh77
         jOmQ==
X-Gm-Message-State: AOJu0YxSon68uwJqCVtxyc84vBlglqw3qdVMxvU4d5s9GfRZsejm9CwY
	sdy8AyhaVarWMDkjvkJY6E7da7nfonNZ0w==
X-Google-Smtp-Source: AGHT+IFqZlh+d2b0UlY8Q4Xhbkygib6t4eC4q86prRRszO3dSASo2Ly77iQcIej+Styud8LtTrt9NQ==
X-Received: by 2002:a05:6512:541:b0:50c:180:2163 with SMTP id h1-20020a056512054100b0050c01802163mr485884lfl.26.1701870161547;
        Wed, 06 Dec 2023 05:42:41 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7cf0f000000b0054ca7afdf35sm2428304edy.86.2023.12.06.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:42:41 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xkbevd: upgrade 1.1.4 -> 1.1.5
Date: Wed,  6 Dec 2023 16:42:39 +0300
Message-Id: <20231206134239.322342-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107252

Changelog:

* Add .git-blame-ignore-revs to hide whitespace commits from git blame
* eventTypeToString: remove unnecessary strcpy to static buffer
* xkbevd.c: Update default DFLT_XKB_CONFIG_ROOT path
* cfgscan: check if character is EOF before calling isalpha or isdigit
* Rename shadowed variables
* Variable scope reduction as suggested by cppcheck
* gitlab CI: stop requiring Signed-off-by in commits
* man page: remove out-of-date COPYRIGHT section
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration
* autogen: add default patch prefix
* autogen.sh: use quoted string variables
* autogen.sh: use exec instead of waiting for configure to finish

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xkbevd_1.1.4.bb => xkbevd_1.1.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbevd_1.1.4.bb => xkbevd_1.1.5.bb} (72%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb
similarity index 72%
rename from meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb
index b42c1b950..afc1fe17d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbevd_1.1.5.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile bison-native"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "c747faf1f78f5a5962419f8bdd066501"
-SRC_URI[sha256sum] = "2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b"
-- 
2.25.1


