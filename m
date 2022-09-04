Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA84C6FA8D
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.11276.1662276866108656816
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QoEFQPeU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so175094pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YtWXAC6Utcbs5a0AEgT8Wq+o6m8M4bhhjxmr41AeOBM=;
        b=QoEFQPeUdB0eorvs/EkHIKRf1CXjFaUiPxodlfX2p+0R7wveWmVWL5f/PjW6TcD+T/
         Hi31XYstWuC+sizFrJbZ0/ItQh2dbo+r2EtP0E6EjGBzbT+5Ws2owFNVE9hSdnyQobKC
         Gfgs3UcAvf8oEJXWPTvrkAXnr7+DT2BoC2JAuQbVA6kK8nMb0tYNkG9IytPmtffBFyy6
         DExDwSPhknXn1fuvyW32ATLCtNd4N+JcGvn7/Ci/MQ3F8dWsN2JI3goxqmJ4Znc7acgE
         mheCE3+HFMCCC9KFDflr4tI7pQBAiRhMTHf3vxtro6DJwQzkrxCoH8woWGfybFAdS/4Y
         E22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YtWXAC6Utcbs5a0AEgT8Wq+o6m8M4bhhjxmr41AeOBM=;
        b=Ngd8WC4nLI5pVLmb/muhgbfmE7vgfulVmWxa9uc43WhRtNTakVzFKANt/CkKbPHECS
         tTBA4+iZ1zOL2AuhZG5T59D3x/2Sts3ZSR1L4UNXwrWNX3xBHFTgK4UFKiNxabe4ZpFg
         U1kAuFxBBj/gmaZCdvUoA73eIDC4D6cLCfTUUa++PtYmqMA5f/BeVLtmZPHwT3dEIX2D
         tE8gjCDSXrT6T1XGueV2tCaQ481GirQI43s9MuV9nY9uCjrsMvonQZQvNEt2jpZf5oQp
         Sf0eYuk/If4lMjJ8RrteQi65+ebdj0y2PqXzAzakGwegm5O+rH69SYRzbfpArQQXro0C
         JgGQ==
X-Gm-Message-State: ACgBeo3ati1+tpIZotARZafGrfVoYC4fdXCNzTakF6MU2oK0cCwuc6ym
	WPZWTNrNbGzHjftG4UVTJQBje2Kq6EG0tQ==
X-Google-Smtp-Source: 
 AA6agR7kFQ190eZgRRhya/NsxcBo0hWPQSSVHX236nMe3NKL2bOroqxR6ZVoaYXbhcmVsia9+St4uw==
X-Received: by 2002:a17:90b:1bc4:b0:1fd:b913:ef58 with SMTP id
 oa4-20020a17090b1bc400b001fdb913ef58mr13053579pjb.220.1662276865250;
        Sun, 04 Sep 2022 00:34:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/63] mcelog: Upgrade to v189
Date: Sun,  4 Sep 2022 00:33:18 -0700
Message-Id: <20220904073417.3251865-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98598

Fix build with clang while here
Drop 0001-genconfig.py-update-shebang.patch its fixed upstream now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tring.h-form-mem-function-prototypes.patch | 26 +++++++++++++++
 .../0001-genconfig.py-update-shebang.patch    | 33 -------------------
 .../mcelog/{mcelog_180.bb => mcelog_189.bb}   |  4 +--
 3 files changed, 28 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-client-Include-string.h-form-mem-function-prototypes.patch
 delete mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch
 rename meta-oe/recipes-support/mcelog/{mcelog_180.bb => mcelog_189.bb} (89%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-client-Include-string.h-form-mem-function-prototypes.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-client-Include-string.h-form-mem-function-prototypes.patch
new file mode 100644
index 0000000000..3b6fd7d702
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/0001-client-Include-string.h-form-mem-function-prototypes.patch
@@ -0,0 +1,26 @@
+From c7753f82261d49862d5e0f9691bf87799d36ef0c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 16:20:03 -0700
+Subject: [PATCH] client: Include string.h form mem* function prototypes
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/client.c b/client.c
+index 883b1de..e474e55 100644
+--- a/client.c
++++ b/client.c
+@@ -16,6 +16,7 @@
+    on your Linux system; if not, write to the Free Software Foundation, 
+    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA */
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <unistd.h>
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch
deleted file mode 100644
index 10d17f57d8..0000000000
--- a/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b09ff147e9383d33e6adbcb356b52236610fceda Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 1 Apr 2022 10:00:00 +0800
-Subject: [PATCH] genconfig.py: update shebang
-
-It fails to call genconfig.py if no /usr/bin/python on build machine:
-
-| ./genconfig.py mcelog.conf config-intro.man > mcelog.conf.5
-| /bin/sh: ./genconfig.py: /usr/bin/python: bad interpreter: No such file or directory
-| Makefile:71: recipe for target 'mcelog.conf.5' failed
-
-Update shebang with 'env python3' instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- genconfig.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/genconfig.py b/genconfig.py
-index ce9987f..982cac6 100755
---- a/genconfig.py
-+++ b/genconfig.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python3
- # generate man config documentation from mcelog.conf example
- # genconfig.py mcelog.conf intro.html
- from __future__ import print_function
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/mcelog/mcelog_180.bb b/meta-oe/recipes-support/mcelog/mcelog_189.bb
similarity index 89%
rename from meta-oe/recipes-support/mcelog/mcelog_180.bb
rename to meta-oe/recipes-support/mcelog/mcelog_189.bb
index a64aacabf9..2f8af9aa3f 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_180.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_189.bb
@@ -7,11 +7,11 @@ SECTION = "System Environment/Base"
 
 SRC_URI = "\
     git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
+    file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
     file://run-ptest \
-    file://0001-genconfig.py-update-shebang.patch \
 "
 
-SRCREV = "4146c9296a0cbd26f1c5e411cb44877f350053bd"
+SRCREV = "b8dfb1fa34eb627a03adfb315326a29ec51214b3"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.37.3


