Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2C4C52D6D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33823.1721034173910166008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sit8jAU9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Qn4+jOGP3Uso+WHelwONdyivm/ya29wlFkh22UFGA0k=;
  b=Sit8jAU9TROWJYjXXrkMuS0cSgBbpvA411XsN4GrvimMQw1UXL590luG
   P8c/liWmLK7ZI7i+nD0+M++unRtRVgmk9CDbvdnlWXNFB02X7d1vWjHH2
   VpIlabDl1y3ciJIGPcs9jiabVCGdCAY08+rgE5KrxGKhx3lPkx7hoysBp
   uDS+zNZbpoPicK6D+ACcmeMqz8MURSCOoe+7s/3P4c6v/NsUxIZAeU3H3
   PcFy1Gfu32e3r0Xg/BdtbVYHvni/T+CLqTGw6R7WhL4APkl/Hvxh35IJ1
   QMPfYryhSeewrAgBeccP0Ia/o7ecSViKrktC8ZmE/9W0gh9KNdc5Hcl3i
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374026"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374026"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18C69D8016
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E60BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEEAC6BE58
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F55D1A000D;
	Mon, 15 Jul 2024 17:02:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/38] lvm2: upgrade 2.03.24 -> 2.03.25
Date: Mon, 15 Jul 2024 17:02:03 +0800
Message-Id: <1721034151-540-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--4.298500-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yc253PNHBSOjnJdsOLB4zv79wRnyxuPjhDi9
	AXoRhUctY9IIZbKo3F8+j95AJb21u/rU6jp6y3lQSCtgxgcsrMo4Ddbs3t0GCdGMGYFaxr1EC7Q
	OCeQlM0UqqtDuUtwyfIjM2wU+pRtsWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjtXl9IxEPXOpU+L
	SnmZXjGKqz5nMMS2ylBt+ZjFMtGVxH6+lhuE4fWs69emDs42dd2+EDPw+8xrdLs3EPhItRHYIBC
	rHXdfvcOoVDnE6J6/SAMuqetGVetnyef22ep6XYxlblqLlYqXJ/UiX5dP7Nk1l5wHv9QnfFbnLF
	rt0L/gTsTgWvE71sa0ZwtD+aFDzjsE4VKwKcc9zxfLAIwLmjzFK3sfnFZrQ1itgmaxyEXer+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111328

From: Wang Mingyu <wangmy@fujitsu.com>

0001-implement-libc-specific-reopen_stream.patch
0001-include-libgen.h-for-basename.patch
refreshed for 2.03.25

Changelog:
=============
- Utilize more radix_tree instead of dm_hash and btree.
- Refactor DM uuid caching from device_mapper directory.
- Enhance checking for DM uuid device.
- Fix lvm shell command completion on tab key (2.03.24).
- Avoid lockd_vg call to lvmlockd for local VGs.
- Allow forced change of locktype from none.
- Handle OPTIONS defined in /etc/sysconfig/lvmlockd.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-implement-libc-specific-reopen_stream.patch | 12 ++++++------
 .../files/0001-include-libgen.h-for-basename.patch   | 10 +++++-----
 meta-oe/recipes-support/lvm2/lvm2.inc                |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index e11ac5ac0..196de644c 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -1,4 +1,4 @@
-From a86919ed5468f3c152114446c189b00f5f656d59 Mon Sep 17 00:00:00 2001
+From e2f24ea066e6dfb9f13f623009034acbf4ae8818 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:49:40 +0000
 Subject: [PATCH] implement libc specific reopen_stream
@@ -21,7 +21,7 @@ Upstream-Status: Pending
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/lib/log/log.c b/lib/log/log.c
-index 7b88252f0..e1720098a 100644
+index eafb3ef1c..ff3d751bf 100644
 --- a/lib/log/log.c
 +++ b/lib/log/log.c
 @@ -165,6 +165,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
@@ -45,10 +45,10 @@ index 7b88252f0..e1720098a 100644
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
 diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 3fd23a521..c2ee39905 100644
+index 1b2f7f47c..e0674d42d 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3380,7 +3380,7 @@ static int _check_standard_fds(void)
+@@ -3378,7 +3378,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +57,7 @@ index 3fd23a521..c2ee39905 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3390,7 +3390,7 @@ static int _check_standard_fds(void)
+@@ -3388,7 +3388,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +66,7 @@ index 3fd23a521..c2ee39905 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3398,7 +3398,7 @@ static int _check_standard_fds(void)
+@@ -3396,7 +3396,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
index 83a7f936b..c57bff865 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-include-libgen.h-for-basename.patch
@@ -1,4 +1,4 @@
-From 4e7f4ea0bf89726255612a2a382c064e5923fbcd Mon Sep 17 00:00:00 2001
+From 4e2dc175e99792d84873a4785ff1524845267c3e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 25 Mar 2024 13:07:28 -0700
 Subject: [PATCH] include libgen.h for basename
@@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/lib/device/device_id.c b/lib/device/device_id.c
-index 2b183810a..53467cbbb 100644
+index b3330f2ba..291bd5c73 100644
 --- a/lib/device/device_id.c
 +++ b/lib/device/device_id.c
-@@ -26,6 +26,7 @@
- #include "lib/datastruct/str_list.h"
- #include "lib/metadata/metadata-exported.h"
+@@ -28,6 +28,7 @@
+ #include "lib/activate/activate.h"
+ #include "device_mapper/misc/dm-ioctl.h"
  
 +#include <libgen.h>
  #include <sys/stat.h>
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 29cc7425b..3f90bf278 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,9 +19,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "90ec2cd92f6367c431dd8dae55d0cbe7e196734f"
+SRCREV = "0eef5ab6e14a45e6d2eacbc0bb744dbb33c16a7a"
 S = "${WORKDIR}/git"
-PV = "2.03.24"
+PV = "2.03.25"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.34.1


