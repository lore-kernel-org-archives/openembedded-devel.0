Received: from ns2.fajncom.cz ([89.203.157.9])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <i@minami.cz>)
	id 1OqpaW-0006vS-TG for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 17:51:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns2.fajncom.cz (Postfix) with ESMTP id DE6C69EC2CF;
	Wed,  1 Sep 2010 17:47:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns2.fajncom.cz
Received: from ns2.fajncom.cz ([127.0.0.1])
	by localhost (ns2.fajncom.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CVj+HDeAp9x; Wed,  1 Sep 2010 17:47:46 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.177.2])
	by ns2.fajncom.cz (Postfix) with ESMTP id 2EB729EC137;
	Wed,  1 Sep 2010 17:47:46 +0200 (CEST)
From: Michal Minar <i@minami.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 17:57:39 +0200
Message-Id: <1283356659-31867-1-git-send-email-i@minami.cz>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 89.203.157.9
X-SA-Exim-Mail-From: i@minami.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] grub 0.97: fixing broken 256byte-inodes patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Sep 2010 15:51:02 -0000

 * original patch causes termination of grub with floating point exception,
   when operating upon ext2 partitions
 * the bug description came from:
   http://bugs.gentoo.org/show_bug.cgi?id=220687
 * fixed patch was done by RB <aoz.syn@gmail.com>

Signed-off-by: Michal Minar <i@minami.cz>
---
 .../grub/grub-0.97/grub-support-256byte-inode.diff |   21 ++++++++++++-------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/recipes/grub/grub-0.97/grub-support-256byte-inode.diff b/recipes/grub/grub-0.97/grub-support-256byte-inode.diff
index bef3bc1..caaf9d6 100644
--- a/recipes/grub/grub-0.97/grub-support-256byte-inode.diff
+++ b/recipes/grub/grub-0.97/grub-support-256byte-inode.diff
@@ -1,7 +1,7 @@
-diff -Nrup a/stage2/fsys_ext2fs.c b/stage2/fsys_ext2fs.c
---- a/stage2/fsys_ext2fs.c	2004-08-08 20:19:18.000000000 +0200
-+++ b/stage2/fsys_ext2fs.c	2008-01-30 14:27:20.000000000 +0100
-@@ -79,7 +79,52 @@ struct ext2_super_block
+diff -Naur grub-0.97-800/stage2/fsys_ext2fs.c grub-0.97-810/stage2/fsys_ext2fs.c
+--- grub-0.97-800/stage2/fsys_ext2fs.c	2008-07-21 00:40:21.668879475 -0600
++++ grub-0.97-810/stage2/fsys_ext2fs.c	2008-07-21 01:01:11.063953773 -0600
+@@ -79,7 +79,52 @@
      __u32 s_rev_level;		/* Revision level */
      __u16 s_def_resuid;		/* Default uid for reserved blocks */
      __u16 s_def_resgid;		/* Default gid for reserved blocks */
@@ -55,17 +55,22 @@ diff -Nrup a/stage2/fsys_ext2fs.c b/stage2/fsys_ext2fs.c
    };
  
  struct ext2_group_desc
-@@ -218,6 +263,9 @@ struct ext2_dir_entry
+@@ -218,6 +263,14 @@
  #define EXT2_ADDR_PER_BLOCK(s)          (EXT2_BLOCK_SIZE(s) / sizeof (__u32))
  #define EXT2_ADDR_PER_BLOCK_BITS(s)		(log2(EXT2_ADDR_PER_BLOCK(s)))
  
-+#define EXT2_INODE_SIZE(s)		(SUPERBLOCK->s_inode_size)
++#define EXT2_GOOD_OLD_REV   0   /* The good old (original) format */
++#define EXT2_DYNAMIC_REV    1   /* V2 format w/ dynamic inode sizes */
++#define EXT2_GOOD_OLD_INODE_SIZE 128
++#define EXT2_INODE_SIZE(s)  (((s)->s_rev_level == EXT2_GOOD_OLD_REV) ? \
++                 EXT2_GOOD_OLD_INODE_SIZE : \
++                 (s)->s_inode_size)
 +#define EXT2_INODES_PER_BLOCK(s)	(EXT2_BLOCK_SIZE(s)/EXT2_INODE_SIZE(s))
 +
  /* linux/ext2_fs.h */
  #define EXT2_BLOCK_SIZE_BITS(s)        ((s)->s_log_block_size + 10)
  /* kind of from ext2/super.c */
-@@ -553,7 +601,7 @@ ext2fs_dir (char *dirname)
+@@ -553,7 +606,7 @@
        gdp = GROUP_DESC;
        ino_blk = gdp[desc].bg_inode_table +
  	(((current_ino - 1) % (SUPERBLOCK->s_inodes_per_group))
@@ -74,7 +79,7 @@ diff -Nrup a/stage2/fsys_ext2fs.c b/stage2/fsys_ext2fs.c
  #ifdef E2DEBUG
        printf ("inode table fsblock=%d\n", ino_blk);
  #endif /* E2DEBUG */
-@@ -565,13 +613,12 @@ ext2fs_dir (char *dirname)
+@@ -565,13 +618,12 @@
        /* reset indirect blocks! */
        mapblock2 = mapblock1 = -1;
  
-- 
1.7.2.2



