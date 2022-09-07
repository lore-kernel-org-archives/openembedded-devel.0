Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0ACC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 08:43:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.5471.1662540174430548763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v3BnBMaC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662540172; i=@fujitsu.com;
	bh=70qI1XuVk0lhHSt567/Pbq9IWHypf41D3EuNhKyGfp4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v3BnBMaCz5k8OICnEDU5oVwshAi6BDUJx82Ra+uUCCFRisxrh+7vm1MAil9/5lEFJ
	 khNYTtLSGoOAFIMtItUF5hyp+FhlKSwfbT3htqrHXI8Cog+HxWWjBx2k7rv+rQBXQC
	 SOQHFLPLseL+Ko2InwgfHAD2LZfY5+lKq/DorV2By2eroedvKWJ5SBsLodyqNev16R
	 Zrj9tOHaUGzkmqdlZYAYHtgpqeUslPifhIIrb8cX/8o78P62i3Yl+wc3Fk070Iyb3B
	 s82SrQojY8BltV33Zu288FR7nY/fUzld4oZLgVFE3NzI9BxtDSefsxW31Bxmskpcxu
	 G9YxAgqMxMxNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpNsdKZF
  sMHWpvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHtxQWWgolKFW8mv2ZtYFwn18XIxSEk8JBR
  4vHr5ewQzhUmiYcP/jNDOLsZJbp+NrJ2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPU
  DcHh7CAg8SjgyIgYRag8M3NC5lAbF4BJ4nn/U0sILaEgILElIfvmSHighInZz5hgRgjIXHwxQ
  tmiBpFidmXm6HqKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SSrKTM8oyU3MzNE1NDD
  QNTQ01bW0BFKWeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIGBmVKcXL6D
  cfu+X3qHGCU5mJREeeO8JJKF+JLyUyozEosz4otKc1KLDzHKcHAoSfDGhQLlBItS01Mr0jJzg
  FECk5bg4FES4VUOBkrzFhck5hZnpkOkTjHac6xtOLCXmWPq7H/7mTmWg8mZX9sOMAux5OXnpU
  qJ8z73AWoTAGnLKM2DGwqL6kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkXRABN4cnMK4H
  b/QroLCags7YGioOcVZKIkJJqYGoR1XJ57LjWV6kq/9aMPGGNz/uj7zzoKz8U9zR2QsGaKtPJ
  llOq5X1YS8KFfu+vzuds+f+rc22fTFf4wQ7dD9PalvTev2WRHBuz7p6VrtkEZlueWS8sPr9fx
  pn0+aPOwQJ3xpPxn4oiO0/Zryxx6l04YfGSw4fsHiXNcYmpXv89lXW332YBP91EW9+1U96kRC
  dm+BvUJh9uXR9x+P++vvOR7s7/Vnz7WD/3VmNRRAuDhNwNiRu7br2V656w/mDaqfCnmxRebZs
  SHXsjR0lvZecuRQWunQwK38+7ctZNeGWs3blit63hY8P3XvaP2DfynWbYLT1N5JRv5txzx5qc
  +1mXKDH6zwtzyWkPVtZ5rMRSnJFoqMVcVJwIAEalAeplAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1662540171!67600!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12148 invoked from network); 7 Sep 2022 08:42:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 08:42:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2AD631AD
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 09:42:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1F9771AB
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 09:42:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 09:42:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libforms: upgrade 1.2.3 -> 1.2.4
Date: Wed, 7 Sep 2022 16:42:33 +0800
Message-ID: <1662540153-16917-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 08:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98680

0001-Make-extern-declarations-in-header-file.patch
refreshed for new version.

0001-Modify-include-dir.patch
added to modify the dir of nonexist file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-extern-declarations-in-header-file.patch | 17 +---------
 .../files/0001-Modify-include-dir.patch       | 33 +++++++++++++++++++
 .../{libforms_1.2.3.bb => libforms_1.2.4.bb}  |  5 ++-
 3 files changed, 36 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libforms/files/0001-Modify-include-dir.patch
 rename meta-oe/recipes-graphics/libforms/{libforms_1.2.3.bb => libforms_1.2.4.bb} (83%)

diff --git a/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch b/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch
index 619bad6d02..16689f64b9 100644
--- a/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch
+++ b/meta-oe/recipes-graphics/libforms/files/0001-Make-extern-declarations-in-header-file.patch
@@ -10,8 +10,7 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  fdesign/sp_spinner.c | 2 +-
- lib/flinternal.h     | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/fdesign/sp_spinner.c b/fdesign/sp_spinner.c
 index 04f2c19..6206daa 100644
@@ -26,20 +25,6 @@ index 04f2c19..6206daa 100644
  
  
  /***************************************
-diff --git a/lib/flinternal.h b/lib/flinternal.h
-index 06d847e..577bd10 100644
---- a/lib/flinternal.h
-+++ b/lib/flinternal.h
-@@ -138,8 +138,8 @@ enum {
- 
- /* events.c or event related */
- 
--FL_OBJECT * fli_handled_obj;
--FL_OBJECT * fli_handled_parent;
-+extern FL_OBJECT * fli_handled_obj;
-+extern FL_OBJECT * fli_handled_parent;
- 
- void fli_obj_queue_delete( void );
  
 -- 
 2.28.0
diff --git a/meta-oe/recipes-graphics/libforms/files/0001-Modify-include-dir.patch b/meta-oe/recipes-graphics/libforms/files/0001-Modify-include-dir.patch
new file mode 100644
index 0000000000..0b7c063804
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/files/0001-Modify-include-dir.patch
@@ -0,0 +1,33 @@
+From d2d05928342f7f9f687ffea5e0b77f97f0ae5aad Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 7 Sep 2022 14:29:13 +0900
+Subject: [PATCH] Modify include dir
+
+error messagge:
+../../xforms-1.2.4/lib/fd/cmdbr.h:28:10: fatal error: ../include/forms.h: No such file or directory
+
+../include/forms.h specified in the header file cmdbr.h is not exist.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ lib/fd/cmdbr.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/fd/cmdbr.h b/lib/fd/cmdbr.h
+index 8495e05..2ddeced 100644
+--- a/lib/fd/cmdbr.h
++++ b/lib/fd/cmdbr.h
+@@ -25,7 +25,7 @@
+ #ifndef FD_cmd_h_
+ #define FD_cmd_h_
+ 
+-#include "../include/forms.h"
++#include "include/forms.h"
+ 
+ /* Callbacks, globals and object handlers */
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb
similarity index 83%
rename from meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
rename to meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb
index 838c1d5173..01db3c4d3d 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.4.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "The XForms graphical interface widget library	"
 HOMEPAGE = "http://savannah.nongnu.org/projects/xforms/"
-PR = "r0"
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=ade9a053df81f5b9408d2f4f5546df86"
@@ -10,10 +9,10 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
            file://add-absolute-path-for-include-dir.patch \
            file://fix-path-fdesign_LDADD.patch \
            file://0001-Make-extern-declarations-in-header-file.patch \
+           file://0001-Modify-include-dir.patch \
           "
 
-SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
-SRC_URI[sha256sum] = "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
+SRC_URI[sha256sum] = "78cc6b07071bbeaa1f906e0a22d5e9980e48f8913577bc082d661afe5cb75696"
 
 inherit autotools features_check
 
-- 
2.25.1


