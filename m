Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F8C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:38:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7762.1676702292034003851
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MLcQlQVk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702290; i=@fujitsu.com;
	bh=t7cRJyEwyWjBKalt6FebtpYs7CG33gHMERxFSDfpnQw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MLcQlQVkkZsDJDgpTaeBughoKqlPdgeoKCARg45+2NXxYed7YtsE5UtfE596S/u6K
	 w6hJoMPWI6yrKn9PN4pSD8fWDVg3e3XtAuvYFA2ghzT9Ygo8w+nkWYFm+rTudEaV77
	 dcXh5Og4U8XuYknb3771F0nWwveub6fMxwucOBiVXKWUXLzwymgZ5d7UlT2D29Tn7s
	 /bD/vlNefYRvew1oyJs+D5L4ZvLWqerWFIh1MLXMR+66uphSJrtF6wK2jryXU4mo0k
	 bmEXcl3LVJ/SWsi1OOfBfEzW/Y/Um0FGsLn9G4Pdbv62rRBFd5NcPjrVdZptu9lH2A
	 Mevh6SVoJd5wA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpBtY9CH
  Z4Mh3Y4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJtAOsBTs0Ko78/cbUwLhJqYuRi0NI4CGj
  xPxZl9ggnKtMEo97ZzNCOHsZJZ5cew/kcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgJvE9A1SIGEWAVWJ1evvgJXzCjhJvF7+ngnElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuqV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFKvt2sE4oe+v
  3iFGSQ4mJVHez9veJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P1Z8CFZSLAoNT21Ii0zBxgXM
  GkJDh4lEd7T6UBp3uKCxNzizHSI1ClGRSlxXoZUoIQASCKjNA+uDRaLlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ8y4F2c6TmVcCN/0V0GImoMULmN+CLC5JREhJNTCJan2qiEw8fUtz/81
  Fbndrr52vWmA9a5Wvk1B40Nd7m4+Jr3pZomX5//A2l7Mm2w+7n9FSedf7UWGD+y7bjSLJ0+vW
  lDaWNZ1d/zt5NnebjMKpBCf57I8Ks6ZvlrnuvPvuTO5bF236zwQ6LLf2+yCXtizNm9nkYpH/g
  2VHk7bmXkkoEpz3w7W5Uv1P88oFdv6J/g5ez+0UFntfvh/09Ob/kG2NKjsviglPq7CaV1I3b9
  2UfW3Mcazf7aX1Ndeem56kIL1L7IhVms6igqY2Uy8JgfjkNNXS8tyGJRdVWVVlFPZVLX57b7P
  2RCZpA8F38npzz+Zddnr47/svxll7i7rW/aucdDznd5oFo7/EnlNKLMUZiYZazEXFiQBUXgYq
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1676702289!996779!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8954 invoked from network); 18 Feb 2023 06:38:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:38:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8EB231AF
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:09 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 831381AC
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:38:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libldb: upgrade 2.6.1 -> 2.7.1
Date: Sat, 18 Feb 2023 14:37:50 +0800
Message-ID: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101130

From: Wang Mingyu <wangmy@fujitsu.com>

0002-ldb-Add-configure-options-for-packages.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...b-Add-configure-options-for-packages.patch | 26 ++++++++++---------
 .../{libldb_2.6.1.bb => libldb_2.7.1.bb}      |  3 +--
 2 files changed, 15 insertions(+), 14 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.6.1.bb => libldb_2.7.1.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index 988931c49..7a30bbedf 100644
--- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -20,13 +20,16 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 2.3.0
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+upgrade to 2.7.1
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  lib/replace/wscript | 90 +++++++++++++++++++++++++++++++++++----------
- wscript             |  8 ++++
- 2 files changed, 78 insertions(+), 20 deletions(-)
+ wscript             |  7 ++++
+ 2 files changed, 77 insertions(+), 20 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 4c774d9..63c9967 100644
+index 5c2b750..f86f863 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -71,7 +74,7 @@ index 4c774d9..63c9967 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -35,12 +70,25 @@ def configure(conf):
+@@ -38,12 +73,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -98,10 +101,10 @@ index 4c774d9..63c9967 100644
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
-     conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
+@@ -113,8 +161,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -113,7 +116,7 @@ index 4c774d9..63c9967 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -434,20 +483,21 @@ def configure(conf):
+@@ -436,20 +485,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -131,7 +134,7 @@ index 4c774d9..63c9967 100644
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
-+    if Options.options.enable_libbsd: 
++    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -150,10 +153,10 @@ index 4c774d9..63c9967 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 60bb7cf..7f14847 100644
+index 03076e6..ad40ac9 100644
 --- a/wscript
 +++ b/wscript
-@@ -40,6 +40,14 @@ def options(opt):
+@@ -40,6 +40,13 @@ def options(opt):
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
  
@@ -163,11 +166,10 @@ index 60bb7cf..7f14847 100644
 +    opt.add_option('--without-valgrind',
 +                   help=("disable use of valgrind"),
 +                   action="store_false", dest='enable_valgrind', default=False)
-+
 +
  
  def configure(conf):
      conf.RECURSE('lib/tdb')
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.6.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.7.1.bb
index 7c7701acc..473774b14 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.6.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.7.1.bb
@@ -35,8 +35,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "3a5f54f511fb237b83e1f34e2c7e25cd"
-SRC_URI[sha256sum] = "467403f77df86782c3965bb175440baa2ed751a9feb9560194bd8c06bf1736c9"
+SRC_URI[sha256sum] = "c4632c9a7f81f8a45ed46fc14d18eb507edf4e79f6e88d16977478ef95ed5b7f"
 
 inherit pkgconfig waf-samba
 
-- 
2.34.1


