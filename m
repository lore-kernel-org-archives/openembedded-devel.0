Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DCDC54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7729.1709714646462745590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jrS1WzKK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714646; x=1741250646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qBoFkchI/mpEZAPBIeSc4KahNEv4kVIRAz0x1L5ddgM=;
  b=jrS1WzKKIKarQ5aq7wFApKYHEIKEMANPgSTkEGjBVzvfs87/w4Qushek
   eCfoPld74APY2E9kZsb4DJyeXJhjurmvAFfB9r4SFgXRtJuBlh3mdXqTt
   Ao3B8jmk6qvcbuQntzPp1J+P51pE+IEZVZNPBzvOMcNG596a57xCHywND
   JkX0Qp6Eoie46hwOqxlMy7ji8FWEmZe2lL4B4aqDyA4tGECFUf8bTyn2E
   DoyaxQRCL+W2B92YRwO71IsHd3ZA2pqe3sK8cHUMQqmIxov9eoib6Yc/p
   xmY+qUFMh/pqgBietKt8OvzRKE7di9hQ2MiCqXAF0cfK4lkrW7lUlnI0W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="130690812"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="130690812"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D609D9F00
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B81B7D5603
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A7112008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00C071A006D;
	Wed,  6 Mar 2024 16:43:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/26] libtalloc: upgrade 2.4.1 -> 2.4.2
Date: Wed,  6 Mar 2024 16:43:10 +0800
Message-Id: <1709714608-19296-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--0.555500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yaoXHZz/dXlxkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AxXH/dlhvLv/QJJFxg7p4qdYJ
	3pC9XNt5VB65/84yB9bxT9Nknd+sG6RGSI6KP9SvhuntKSqs2aU+crEA4+nhZ/gMNehoKqTu6j3
	FN3tyMl2UVI5FRUTheg0WG4KE0oFn3xzVXDpMuoAk3qL3jdFBNtKDKpGPfdcmBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrZCyrburh8RQ1hybEFUdMwD2/WqXVyPxzyiAjdqnidlnb6Ai
	NhWX9XPJY19pjxi6eZfzP6mNAEXzn7DHOYvIOAHCkrMBckzHTB0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109148

From: Wang Mingyu <wangmy@fujitsu.com>

0001-talloc-Add-configure-options-for-packages.patch
refreshed for 2.4.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...c-Add-configure-options-for-packages.patch | 39 +++++++++++++++----
 ...{libtalloc_2.4.1.bb => libtalloc_2.4.2.bb} |  2 +-
 2 files changed, 33 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.1.bb => libtalloc_2.4.2.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
index 45d847c85..6c92beb30 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
@@ -24,13 +24,16 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Rebase to 2.4.1
 Remove libaio option
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebase to 2.4.2
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- lib/replace/wscript | 78 +++++++++++++++++++++++++++++++++------------
- wscript             |  7 +++-
- 2 files changed, 64 insertions(+), 21 deletions(-)
+ lib/replace/wscript | 100 ++++++++++++++++++++++++++++++--------------
+ wscript             |   7 +++-
+ 2 files changed, 75 insertions(+), 32 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 199e636..3593eaf 100644
+index 77e655b..2fd7dfb 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,34 @@ def options(opt):
@@ -112,7 +115,7 @@ index 199e636..3593eaf 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -443,20 +481,20 @@ def configure(conf):
+@@ -443,31 +481,31 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -121,6 +124,17 @@ index 199e636..3593eaf 100644
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
@@ -136,6 +150,17 @@ index 199e636..3593eaf 100644
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 +                checklibc=True):
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
@@ -148,7 +173,7 @@ index 199e636..3593eaf 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 075f1ec..6b4f273 100644
+index 8b5e02d..b6e2614 100644
 --- a/wscript
 +++ b/wscript
 @@ -31,7 +31,12 @@ def options(opt):
@@ -166,5 +191,5 @@ index 075f1ec..6b4f273 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
index 92da03e1a..394c17628 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "410a547f08557007be0e88194f218868358edc0ab98c98ba8c167930db3d33f9"
+SRC_URI[sha256sum] = "85ecf9e465e20f98f9950a52e9a411e14320bc555fa257d87697b7e7a9b1d8a6"
 
 inherit waf-samba pkgconfig ptest
 
-- 
2.34.1


