Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.4099.1628020912879419177
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 13:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bwcPo10B;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d17so357837plr.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 13:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8jrPnQVd0Ez2p04ICAaqGfAfP6lYmOLBj930M3s+pc=;
        b=bwcPo10BirSvIIRtOoCQTtLctatQLdQde9ZiV0hSRJTgxqHKV+TNnyPiqBzr5dNs5K
         q/gCemu9mDbHklT5oiOZLdNwnuy9F8/GgfZkzKR3/gs4XJuBnHTBk+P4cFAH82vAYdJG
         +IPUVId+sO9w3UOyrQo3kER5x4XhLIcIEcMw65Gdn0njSBLS2fbmxwegzkYWmE1IobxB
         ryCHUXv0dDsOaMEcf6mRugESEpaCppWj20b4/8kXmonWzWrmLZ12Zq1DFo+hv/hby7K5
         hqaLUljZzV+SHtbxsRmJAWG45FxZphyZZYtU9mo01IY5VXNgAKF4/lk3sxBSySHLDqX6
         CIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P8jrPnQVd0Ez2p04ICAaqGfAfP6lYmOLBj930M3s+pc=;
        b=leJ+uMQLnadv2LDcEHYF4cPS+2QYwkmLXoIH22t89tllq/pXFd5JyiXbcOrmadrMIh
         qxhDtYkFTdJZaFWdRH3X5vPWRlheupQUqsrxm/uQNrb990HdY8bA5gYxYMRnWcW5YoUI
         NBsvNPeZ1UA9Zyauqp6Gto7H0R+/M0uCOIeztJDqkln57I7gJn2qYRiaYs0qORsJ9cU9
         IzN4f13JssU0U1c5e+FjETLbuMjzBVDfZaGeIfprWJaXKkkVBgvmQ9p0qNydNWJ/A/FH
         44PEq3EoPj5r4cbZtqFcKW/5lIlDwfCfOzd9tUbo8CH2z27f5moQxGUxXLGJQvwuPvMQ
         9XfA==
X-Gm-Message-State: AOAM531cbFTrA8YTYTc+E+MUtxmYXKRLvX+dR/idQqqKv8avF16s2P3y
	rWPCi+F2qbsYYbC+zeHgciQsS5ros5xD8g==
X-Google-Smtp-Source: ABdhPJwpWrYC6XWhSXNKlH8tVI/FTuGTcxdWm/pFGAhb5DowlLZJOgi2UKIk8Kg8Pv3cuiCmLL0EiQ==
X-Received: by 2002:a17:90b:1297:: with SMTP id fw23mr23956092pjb.115.1628020912022;
        Tue, 03 Aug 2021 13:01:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id a35sm18914290pgm.66.2021.08.03.13.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 13:01:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] lua: Drop uclibc patch
Date: Tue,  3 Aug 2021 13:01:47 -0700
Message-Id: <20210803200149.2706807-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was found during override overhaul we dont support uclibc anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/lua/lua/uclibc-pthread.patch   | 13 -------------
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb           |  3 ---
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/uclibc-pthread.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/uclibc-pthread.patch b/meta-oe/recipes-devtools/lua/lua/uclibc-pthread.patch
deleted file mode 100644
index f4cdc5d8c5..0000000000
--- a/meta-oe/recipes-devtools/lua/lua/uclibc-pthread.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: lua-5.1.4/src/Makefile
-===================================================================
---- a/src/Makefile.orig	2013-10-22 22:17:19.929103523 -0400
-+++ a/src/Makefile	2013-10-22 22:18:27.992104545 -0400
-@@ -9,7 +9,7 @@
- CC= gcc
- CFLAGS= -O2 -Wall -DLUA_COMPAT_ALL $(SYSCFLAGS) $(MYCFLAGS)
- LDFLAGS= $(SYSLDFLAGS) $(MYLDFLAGS)
--LIBS= -lm $(SYSLIBS) $(MYLIBS)
-+LIBS= -lm -lpthread $(SYSLIBS) $(MYLIBS)
-
- AR= ar rcu
- RANLIB= ranlib
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
index a18f9f0833..f830e09259 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -30,9 +30,6 @@ inherit pkgconfig binconfig ptest
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"

-UCLIBC_PATCHES += "file://uclibc-pthread.patch"
-SRC_URI:append_libc-uclibc = " ${UCLIBC_PATCHES}"
-
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"

--
2.32.0
