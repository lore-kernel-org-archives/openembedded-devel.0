Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B79AC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:26:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.834.1643048795313794408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M1linWvp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id i1so6844321pla.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PzotlqzMg9stbtDkEwPErurWD+Dj2bPpy2F+HsWc6I=;
        b=M1linWvpvQ+6FuoH3TNE8/qw50sc6xwlwgvQ02r6YDtQRB6KhjWaYvHQH4rA+4xvhS
         NAbh0ht3s7LkkKN03L6Mu+3Bfn4AaSuaGhWPRo5FyVxtenodVSWVydtbfV6BWqq/FQLD
         kkKxgpQ2MovS5/VU26zdDkNPTCze1fQdBEUd8d6PQ7LYEbyC/uVnFbO2LhrXRQB1ceGR
         waBXd0VIsQxqofvk0Tj+5NCJymFQEAnaS1enPMaj+dlWaXAHnB8LIX9Od9mJkDaw6r0J
         zuX3baZBuwAk7PsE6xRq75NYCIeg5Wy3ZaBo6F/4W5kbL9JNwlSBQjaQy+ZN1aS5/k2V
         EGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PzotlqzMg9stbtDkEwPErurWD+Dj2bPpy2F+HsWc6I=;
        b=tX+z5HgN9/dcEId/O9W6K9f5z37ATXCpHEbPD4SZG6eq3gySg/22B84ISl1e040l8r
         3h/dYEWjpFjNcsyaliqB/FKIGcRuiDyh+TTR/UvvYjcFg5+UqByK8oI8441KxlOyznM+
         xyCOat5rlJtuNuRKXqjG0MFgksGVXuukUrw/rMcDQhPd1am1ERlBROmR2h+Wloz3tzlj
         2NlCN485PPHqgnm93jjuOeZWO43trkSYUd06G3P4IrucvUgCVoKLliHznzplzkbqtRek
         gQmp82Ux9dy8IYNcFSRZdIrRWwj6B1oG8pw35SMAR2pKK9Ytd0ScvGc+Q/rHSfDU5Rsn
         slrg==
X-Gm-Message-State: AOAM530/bDhXq/jM1MgGR8r5elm1gDQcruQJbH+cDUZjErzCEbxzF779
	vgZFbQ8FTP8PF34oQTg1AB85z939qyCeIQ==
X-Google-Smtp-Source: 
 ABdhPJwNOmLXenx1s0naXJ42B28jntSVLTL5eK/IhHSEcb9pO6bu4MzI+NZvXG2JX/GqyiV5lBB+YA==
X-Received: by 2002:a17:90a:1196:: with SMTP id
 e22mr3119023pja.241.1643048794458;
        Mon, 24 Jan 2022 10:26:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 k17sm17289973pff.25.2022.01.24.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:26:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gerbera: Upgrade to 1.9.2
Date: Mon, 24 Jan 2022 10:26:31 -0800
Message-Id: <20220124182631.2769939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 18:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95044

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-optional-header.patch        | 32 -------------------
 .../{gerbera_1.7.0.bb => gerbera_1.9.2.bb}    |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_1.7.0.bb => gerbera_1.9.2.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
deleted file mode 100644
index f3197f937b..0000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5719ed8ce9ba60beb9c1670b49296b1c66430dc2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Mar 2021 12:57:37 -0800
-Subject: [PATCH] include <optional> header
-
-Fixes build with gcc11
-/src/util/tools.h:165:6: error: 'optional' in na
-mespace 'std' does not name a template type
-|   165 | std::optional<std::vector<std::byte>> readBinaryFile(const fs::path& path);
-|       |      ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/gerbera/gerbera/pull/1273]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/tools.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/util/tools.h b/src/util/tools.h
-index 3a4064e9..e5142966 100644
---- a/src/util/tools.h
-+++ b/src/util/tools.h
-@@ -37,6 +37,7 @@
- #include <sstream>
- #include <string>
- #include <unordered_set>
-+#include <optional>
- #include <vector>
- namespace fs = std::filesystem;
- 
--- 
-2.30.1
-
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
index ec5548ab6c..94657ba534 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
@@ -4,10 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
-           file://0001-include-optional-header.patch \
           "
 
-SRCREV = "7bc33b98994411e1748d3b3fa9a8424c49e236d6"
+SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


