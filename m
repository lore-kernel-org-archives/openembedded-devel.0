Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.31144.1597003626649798360
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 13:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gYvZRgIH;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id o1so3756052plk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yORnWaQGdJT6I1VTbdru2ON7q7eaAN6165RH7w2kQTs=;
        b=gYvZRgIH9XC8diRvQvjq8uRqxDK+XFDSKZpyF4jyKNa8k7aTd9cAxMH/xMFU+eHYi6
         yF/NEB9yakkRmSDed8539pjhCjIfDcrHKhRrAoXST8mtaQ967wCrRUlidF0wHWBYB+Bp
         JBstEU2e37rlvGgoIF6++3cricWLbnqCMcXDQ4lFNoB8MfYXeaIpabqv9zBIcAH/RQzQ
         GGuv5pwv3LO5QBkEYuGZ7T+qWoU5abz7mh6EkTbILX5Yv9gz5T+DUXgnuoG154+48duR
         +lMdzVUXRgzd1tvq9ZxF/5obB4gGk9NjmYz/R67R6HFWyiA2mHWwQZxJUR+DY3TRJw7m
         lNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yORnWaQGdJT6I1VTbdru2ON7q7eaAN6165RH7w2kQTs=;
        b=U4F2CK6CoYsKcoyBxI1OvSuFVGGICYMA5EiLAIBbjZP+TeAJgx0CcdqKVclYffreAq
         uTH9EdPAG7404HfA4FKj0rflYpq+ixRuapEyb/2I5CdI5U6XtGe0aP6BG1D1lYQSPew5
         JubO17+tyRx4FYn/hZTg8qJxvCOKKBumHDem9k70Ra4OJ4vuS6I+g99rgIq7b+AwHNXb
         twYzShTKh5dPetlfdH4B8cyRgtvJebtVyAGa8ytWkU66Qs9wnMi+pIcLhVHIGxaD/FUm
         f6oRLVrWcOoiJSdUdODbPY2+MdoTyQSCWf1XESpcxPX5efhLKA0Lh9CDJPCO8A1PH9KA
         W6sA==
X-Gm-Message-State: AOAM531JSsEUHUtdIjd4UP0m1gHlApHZMZmAh6nUZPfMUmFd4AoWjqZR
	eqw67b662J2CqX3rft98136xJlI3T3U=
X-Google-Smtp-Source: ABdhPJz50Qb4gRVpKMON37e6YT538vKpTDxZ0/rqw9fzTuw0w3atRzAfRjyWpSJvl5LoU02lE6TT0A==
X-Received: by 2002:a17:90a:2b87:: with SMTP id u7mr24550364pjd.49.1597003625561;
        Sun, 09 Aug 2020 13:07:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id hi13sm17061852pjb.26.2020.08.09.13.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 13:07:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Fix License names to match SPDX convention
Date: Sun,  9 Aug 2020 13:07:03 -0700
Message-Id: <20200809200703.2332091-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
do_populate_lic: libcamera: No generic license file exists for: GPL-2.0-or-later in any provider

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 00a5c480da..af2d3b4e10 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux libcamera framework"
 SECTION = "libs"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0+ & LGPL-2.1+"
 
 LIC_FILES_CHKSUM = "\
     file://LICENSES/GPL-2.0-or-later.txt;md5=fed54355545ffd980b814dab4a3b312c \
-- 
2.28.0

