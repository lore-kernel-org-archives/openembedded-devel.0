Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C17EC6FA8A
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2764.1662594080793894962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OdF9JKe9;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so516364pja.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PwCkHw6rct9qeHcS7jgXMLw2WRDtaOVDBApdszqpUpE=;
        b=OdF9JKe9rGUgoQLGBS0wTTzDMJzm0oKLLt7UaFFuDpzihVLEEczHGBspg+lCkfsfkZ
         ebxS/5HjRuYzJsJpO/MUdVVfIfCrvQS8j4YX6tSd5neL6IvhnikN1Cc223mLNy/Ny5W4
         /gt8KwouLNN61g3HghXnPSwh/qGe+H2hnBUYDI6apaL4lBZysYdTA8Q+iLPutCQG71fv
         pOORcaIDaladsiLGtOh5r+nW7xRS5Wz+o+FnixfhP7nPzlYFZmlO0TnvW2Lr5Gjhjcea
         ILUGESHN2Zattz74BAbwtvnzrDnzRyqUsyKtstj11J0cLFfqrfBHSenlqzAIdIQXzAx3
         LzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PwCkHw6rct9qeHcS7jgXMLw2WRDtaOVDBApdszqpUpE=;
        b=WNPHWRKywzyFjIk9rudbhLjUdfq7VCugq5md4Tg/+HT4nCZ3SSsYQwRzRaUxLUR2QT
         iqfRF2YOJ4edByqHjJxfWS6rh4nrzd2BHKP6MvCuOd0GtazWIExsIRpRf64cv3hZdp+Q
         hEGJjYQ4IUJ/gUFlGHzcNDfT2DGYSc09zn5BknSmNzUhnPWcmTgxDXRXN4q2c6/grkxC
         wjLuDXjdxubC5UTv5MZP1B9wUrJG5pLFVJDM/NTZ6ndR9MsIZYBII5pz65t40kM6Zvh2
         YuQtZWOAsPJ+pIahC4SKN5KM1s/uaQFdc0FzKv94sWDWFrUtuhr+UQGUGJ7Pl+rKTpNz
         7nfw==
X-Gm-Message-State: ACgBeo1JeREWOkAdW4OPcjJSL/lG4/fCBjqoa9U6lLXbFta5rOi07+UH
	91ShyAc8ijUAmnOwKJ0WUFTWTl88JihwUA==
X-Google-Smtp-Source: 
 AA6agR5bmcJwedaGhxsiF38vGd1CEM3HvpF7L9UUziNxGpBIymbwZnK4JRvNyNdmOVIGPk9WHadAsw==
X-Received: by 2002:a17:90b:514:b0:1f5:59b2:fceb with SMTP id
 r20-20020a17090b051400b001f559b2fcebmr1032216pjz.82.1662594080025;
        Wed, 07 Sep 2022 16:41:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/22] uw-imap: Avoid programs using gets()
Date: Wed,  7 Sep 2022 16:40:59 -0700
Message-Id: <20220907234102.3312797-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98709

Included needed header for isdigit()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uw-imap/0001-Do-not-build-mtest.patch     | 38 +++++++++++++++++++
 ...02-tmail-Include-ctype.h-for-isdigit.patch | 26 +++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  2 +
 3 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Do-not-build-mtest.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/0002-tmail-Include-ctype.h-for-isdigit.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Do-not-build-mtest.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Do-not-build-mtest.patch
new file mode 100644
index 0000000000..fd2f30cd14
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Do-not-build-mtest.patch
@@ -0,0 +1,38 @@
+From f92becaf97be16a28013693cd99bac92c54074f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 13:54:58 -0700
+Subject: [PATCH 1/2] Do not build mtest
+
+its a test utility which is not generally used. We need to disable it
+because it uses gets() function which is not available in glibc, if we
+want to use it then port it to use something like fgets
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index cf6d405..1e2d0fb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -669,7 +669,6 @@ an ua:
+ 	$(TOOLS)/$@ "$(LN)" src/ansilib c-client
+ 	$(TOOLS)/$@ "$(LN)" src/charset c-client
+ 	$(TOOLS)/$@ "$(LN)" src/osdep/$(SYSTEM) c-client
+-	$(TOOLS)/$@ "$(LN)" src/mtest mtest
+ 	$(TOOLS)/$@ "$(LN)" src/ipopd ipopd
+ 	$(TOOLS)/$@ "$(LN)" src/imapd imapd
+ 	$(TOOLS)/$@ "$(LN)" src/mailutil mailutil
+@@ -706,7 +705,6 @@ rebuildclean:
+ 
+ bundled:
+ 	@echo Building bundled tools...
+-	$(CD) mtest;$(MAKE)
+ 	$(CD) ipopd;$(MAKE)
+ 	$(CD) imapd;$(MAKE)
+ 	$(CD) mailutil;$(MAKE)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0002-tmail-Include-ctype.h-for-isdigit.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0002-tmail-Include-ctype.h-for-isdigit.patch
new file mode 100644
index 0000000000..5778a00346
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0002-tmail-Include-ctype.h-for-isdigit.patch
@@ -0,0 +1,26 @@
+From fbd00d93cc07fa5da20414b355fffe628dcd37b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 13:57:19 -0700
+Subject: [PATCH 2/2] tmail: Include ctype.h for isdigit
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tmail/tmail.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tmail/tmail.c b/src/tmail/tmail.c
+index ed5fc58..a9e3645 100644
+--- a/src/tmail/tmail.c
++++ b/src/tmail/tmail.c
+@@ -26,6 +26,7 @@
+  * Last Edited:	30 October 2008
+  */
+ 
++#include <ctype.h>		/* for isdigit */
+ #include <stdio.h>
+ #include <pwd.h>
+ #include <errno.h>
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 3f2c9a2237..9fb12b26e4 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -12,6 +12,8 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://imap-2007f-format-security.patch \
            file://0001-Support-OpenSSL-1.1.patch \
            file://0001-Define-prototype-for-safe_flock.patch \
+           file://0001-Do-not-build-mtest.patch \
+           file://0002-tmail-Include-ctype.h-for-isdigit.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.37.3


