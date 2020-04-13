Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.10361.1586759598792225856
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 23:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FBxsmHi5;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id d17so4084987pgo.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 23:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NhyGPIkDWHPTdTGnWkPcSAgyhXO0PeZVDOGnWPzqQf8=;
        b=FBxsmHi5QCPxbcjKxmOOocOgbkfkRpMAikpr6doE2glHP8nCzLjIqlFhx+cO99sHUc
         wKk4KTi2Z+ZG0xmqBwLx2ZSUvc7WMsLg9whof4nIhf53cnvfIbnqDpDXFIi/m6ynvJuH
         nXmdR87MVCG+L0A7aK0X18jIwazAUSb+WQF40zs3zJ3qe2JJKvEwU9g3grLBc45bJiPR
         9dsUvU9a8ijkXVOtY/zOf1rGk7aZz2nRGJll5YdKi1iDBT1Eq+mly8M3mq/g5MFeazuz
         kffD0B6ppLitYpJ92DJ3VcXU7tWnX/9z3egczdCsRvNZt6XNimsavZNAfpckmxjD1V2U
         yvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NhyGPIkDWHPTdTGnWkPcSAgyhXO0PeZVDOGnWPzqQf8=;
        b=HwfByT41ycI837j8/aDfR//JdaJSMLBjouxBUUZhghT87V0Eu6A1p6ZbLm2kAhF0mE
         V2FsWKB6Ocx+U+TvUhYRETYi2jdS0t0Lz/qd6Rm2PlIRe28cDd1L1aGag8YygwCt5qod
         CmLBqiVF67pxL1mseYonCwhE0CXNt6W8gA4Ufln6tKRMl2SOGxa/tbFLu3uJkvXQdcJj
         MLHoyCtogYy81ynC/a93w/5oMvHtzOq2AFD7wmjaKtJFvXtguCBJFORgo+2W0hOqL2xP
         XcNNdorhKHIL5MSSf7VdL9WgNYTLDOLI5SJ6B773R3aFfEHwCbj40tfZKD5JqmZaTFD6
         /bpA==
X-Gm-Message-State: AGi0PuZE3jUn4/vDilsYeXd7ZjzcKdKQRet6JVQlmAFS5mpsWiyY9lOK
	GgUKU9bN9ueQfhewRLHfb1OjqaTCYTg=
X-Google-Smtp-Source: APiQypJMGsw43MT41R8+sIKsTIU8whnlDW3NpMkymJc/0GqOvaFF8p8qbGKx3RwR0S23pPKQIIk24w==
X-Received: by 2002:a62:e304:: with SMTP id g4mr928885pfh.286.1586759597744;
        Sun, 12 Apr 2020 23:33:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id r9sm7557244pfg.2.2020.04.12.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 23:33:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] yad: Upgrade to 6.0
Date: Sun, 12 Apr 2020 23:33:14 -0700
Message-Id: <20200413063314.1421922-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it depend on x11 in distro features since it needs gtk/gtkx.h and
gdk/gdkx.h headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/yad/{yad_5.0.bb => yad_6.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/yad/{yad_5.0.bb => yad_6.0.bb} (76%)

diff --git a/meta-oe/recipes-graphics/yad/yad_5.0.bb b/meta-oe/recipes-graphics/yad/yad_6.0.bb
similarity index 76%
rename from meta-oe/recipes-graphics/yad/yad_5.0.bb
rename to meta-oe/recipes-graphics/yad/yad_6.0.bb
index e53c04bbc6..3760a37d31 100644
--- a/meta-oe/recipes-graphics/yad/yad_5.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
@@ -6,9 +6,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://github.com/v1cont/yad.git"
-SRCREV = "c8eac89cc20d915cb5ed185f423091a291c8af24"
+SRCREV = "a5b1a7a3867bc7dffbbc539f586f301687b6ec02"
 
-inherit autotools gsettings
+inherit autotools gsettings features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "gtk+3 glib-2.0-native intltool-native"
 
-- 
2.26.0

