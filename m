Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A06C54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7730.1709714646761391410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=feS7yT/8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714646; x=1741250646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XkqMv104+xEOBcuzIp54rz1yBtDtLpV0O9kOLN5eiqA=;
  b=feS7yT/8skQ6eKbdzenCYUF9+s5YcqSwxTdT74hE+K1Ej+yJb/jGjB+M
   DgRowj6yjx2Opm7i/B+WhUpHuhLm/RMbmN01wnVxnTyDPQXYSXmtIQMLP
   di6XkQdanqWXISccYZ8YQKzxWe4+8Qbu7TeJ3Ie7YimCLLgIFdSeHKJu0
   9fdNONvqp0uaHGWYy18PKscv54cYJjiRpwOZf8GOXOYJPQ3dOr/DnJntr
   YkEkI+soHfQgKhYFulk7fS2tkq6e8w1A0MbW6DfFsa+sQX3egC2Hibft4
   ym8bBWFWy/LwI/EzqDWPNGX4BhI0jeS2v/UOzU6KN/aGCjF+yNyi/ENwE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139397617"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139397617"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E433D4800
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7F27D5D05
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4520D41189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF79F1A006D;
	Wed,  6 Mar 2024 16:44:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/26] libtdb: upgrade 1.4.9 -> 1.4.10
Date: Wed,  6 Mar 2024 16:43:11 +0800
Message-Id: <1709714608-19296-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-4.723500-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yaoXHZz/dXlxkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AxXH/dlhvLv/QJJFxg7p4qdYJ
	3pC9XNt5VB65/84yB9bxT9Nknd+sG6RGSI6KP9SvhuntKSqs2aU+crEA4+nhZ/gMNehoKqTtaoX
	EEYamtBBw6+4unSooldueAo5I16bi4lcR4ssnr7J4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMO8IKZ2Xpk50NXgexSMkBZePFbiXR1XeY27M1fW7hSHQK5x7bTB3syLE/GojHjHcu6gZhj
	8N6A7+89rau9i82GPQWjIzscx33Pgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109149

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tdb-Add-configure-options-for-packages.patch
refreshed for 1.4.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...b-Add-configure-options-for-packages.patch | 39 +++++++++++++++----
 .../{libtdb_1.4.9.bb => libtdb_1.4.10.bb}     |  2 +-
 2 files changed, 33 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.9.bb => libtdb_1.4.10.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
index 477b1cec7..5c811c468 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
@@ -21,13 +21,16 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Rebase to 1.4.9
 Remove libaio option
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebase to 1.4.10
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- lib/replace/wscript | 79 +++++++++++++++++++++++++++++++++------------
- wscript             |  6 ++++
- 2 files changed, 65 insertions(+), 20 deletions(-)
+ lib/replace/wscript | 101 ++++++++++++++++++++++++++++++--------------
+ wscript             |   6 +++
+ 2 files changed, 76 insertions(+), 31 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 199e636..cb13b62 100644
+index 77e655b..e6d50b3 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,34 @@ def options(opt):
@@ -103,7 +106,7 @@ index 199e636..cb13b62 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -443,20 +481,21 @@ def configure(conf):
+@@ -443,31 +481,32 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -112,6 +115,17 @@ index 199e636..cb13b62 100644
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 -                               checklibc=True):
 -            strlcpy_in_bsd = True
+-    elif conf.env.enable_fuzzing:
+-        # Just to complicate it more, some versions of Honggfuzz have
+-        # got strlcpy and strlcat in libc, but not in <string.h>
+-        # (unless it is there coincidentally, on a BSD). Therefore we
+-        # can't use CHECK_FUNCS alone to decide whether to add the
+-        # headers to replace.h.
+-        #
+-        # As this is only known to happen on a fuzzing compiler, we'll
+-        # skip the check when not in fuzzing mode.
+-        conf.CHECK_HEADERS('bsd/string.h')
+-
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
@@ -127,6 +141,17 @@ index 199e636..cb13b62 100644
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 +                                   checklibc=True):
 +                strlcpy_in_bsd = True
++        elif conf.env.enable_fuzzing:
++            # Just to complicate it more, some versions of Honggfuzz have
++            # got strlcpy and strlcat in libc, but not in <string.h>
++            # (unless it is there coincidentally, on a BSD). Therefore we
++            # can't use CHECK_FUNCS alone to decide whether to add the
++            # headers to replace.h.
++            #
++            # As this is only known to happen on a fuzzing compiler, we'll
++            # skip the check when not in fuzzing mode.
++            conf.CHECK_HEADERS('bsd/string.h')
++
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
@@ -140,7 +165,7 @@ index 199e636..cb13b62 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 5e6a928..5443b43 100644
+index 2c587fb..b2164b2 100644
 --- a/wscript
 +++ b/wscript
 @@ -69,6 +69,12 @@ def options(opt):
@@ -157,5 +182,5 @@ index 5e6a928..5443b43 100644
  def configure(conf):
      conf.env.disable_tdb_mutex_locking = getattr(Options.options,
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
index 936760035..f23b157e8 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "0ac226073e3a2db8648da7af744cb95f50766a52feeb001d558b2b321b74a765"
+SRC_URI[sha256sum] = "02338e33c16c21c9e29571cef523e76b2b708636254f6f30c6cf195d48c62daf"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.34.1


