Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8727B6E666
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:59:59 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id g185so25019206ioa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=dO9P5W1qZBYgmUjM13fGgWvmyNIk0GgcGoqkdbv2/Y8=;
	b=x9KQHiugiWrnbD0CgXXiQira66wzX20ZmCBov4Q29zYgFbV3qX+H97aLJXv1RdnT7a
	JT68Gvpxdxa27+JCNrV13yKr3VBRA8SkV5ooXrkMyH1p/LUnv28zLsl4znRAedqLr1Gl
	PmNm/NytRzllkLoUbTlgL+apg1TDo7hknG6Vl6BfLuj5ctjCsod1X51jZeS7yXXdAwts
	VtTJmLl1//W2V0WXgW3L1vr74PeSIufjp2qSYD0QZ51Ap2kij1Lwb0QWdC+vsmM0DNlJ
	2nVBzy4ea/jRMyWiMXJ+p3ibzAescL8nSPm6n9ZpQgWc43ROubVttH+ql9FL8EnWAxjE
	ZN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=dO9P5W1qZBYgmUjM13fGgWvmyNIk0GgcGoqkdbv2/Y8=;
	b=jwe4Y6MEp+u4bK2iP45gJ3XdCURI/2bpfc4Q58clxTIF0xpYgKPP7wIn9wLDqCKtYO
	8dubTao1zDPUV/Ln5J0WxpqFakVeTM3CMRRICSSRoydmkctZJ69+1Om+qeFuXl62hiL5
	EayCyY6VRTtMoXTSj6UleuE1FrCOZ6Uc7JMO0T33lqGMnf2nzHwgujwljd3ejifeWHA0
	gCzSpHC9nSSCVFAfVg/mOTqpercl2ECm4at2ttmsC4dmhDB2mhTrFcy3BhBNKq7qj1UW
	C8/FY4IaCzObUbwdP+hIfToakJ6T30yTNwt0X4u9F5hEB1nkiyZFdQVNDgnKPD0oWxah
	WATw==
X-Gm-Message-State: AOPr4FV8KM1v6/jqQMpFPUfC/mkmV7r4hnZnh+bavS+vXdHSDu6BRTMBSeetf3d0v3bC5w==
X-Received: by 10.107.150.8 with SMTP id y8mr37155652iod.66.1461013199933;
	Mon, 18 Apr 2016 13:59:59 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	207sm22442437iou.33.2016.04.18.13.59.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 13:59:59 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 17:00:52 -0400
Message-Id: <1461013253-2350-5-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 4/5] libldb: Update to latest stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2016 20:59:59 -0000

The update of Samba requires a newer version of libldb, so update it.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 ...not-import-target-module-while-cross-compile.patch | 19 ++++++++++---------
 .../libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb}     |  4 ++--
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb} (92%)

diff --git a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
index 2425a55..fdd312c 100755
--- a/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch
@@ -3,18 +3,19 @@ we just check whether does the module exist.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
---- ldb-1.1.17.orig/buildtools/wafsamba/samba_bundled.py	2015-07-16 16:42:12.265127110 +0800
-+++ ldb-1.1.17/buildtools/wafsamba/samba_bundled.py	2015-07-16 16:45:25.717119550 +0800
-@@ -1,7 +1,7 @@
- # functions to support bundled libraries
+Index: ldb-1.1.26/buildtools/wafsamba/samba_bundled.py
+===================================================================
+--- ldb-1.1.26.orig/buildtools/wafsamba/samba_bundled.py
++++ ldb-1.1.26/buildtools/wafsamba/samba_bundled.py
+@@ -2,6 +2,7 @@
  
+ import sys
+ import Build, Options, Logs
++import imp, os
  from Configure import conf
--import sys, Logs
-+import sys, Logs, imp
- from samba_utils import *
+ from samba_utils import TO_LIST
  
- def PRIVATE_NAME(bld, name, private_extension, private_library):
-@@ -218,17 +218,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
+@@ -230,17 +231,32 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
      # versions
      minversion = minimum_library_version(conf, libname, minversion)
  
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.21.bb b/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
similarity index 92%
rename from meta-networking/recipes-support/libldb/libldb_1.1.21.bb
rename to meta-networking/recipes-support/libldb/libldb_1.1.26.bb
index bdad87d..5458d47 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.21.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.26.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=b
                     file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "94ba09c7452fff68df3481686c56677e"
-SRC_URI[sha256sum] = "267bbb7f278068eaf0de27adffda2e691a070a93c5c15ee27c828e87b4c7dbf1"
+SRC_URI[md5sum] = "31780b702b638ad32aa5d9853d257839"
+SRC_URI[sha256sum] = "8843c7a72b980d9413ba6c494c039bccd10c524b37fda2917afb147745d8b2e6"
 
 inherit waf-samba
 
-- 
1.9.1


