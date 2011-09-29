Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9HD8-0001yt-7f
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 16:03:38 +0200
Received: by bke11 with SMTP id 11so710422bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2011 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tnyQQa5EhJ6piEVSJOTfPorpN5QU4206wuV6xmHFIRw=;
	b=qW1b5FT1EUN1d83+XtIor9GipVCPfucdjgPZemzY3eRLrddqbVh4/biUCWNDT/4dsf
	AyJqviIh733ndulXf233GG8uZxfR92KgWuVOtGlgl6q3TYOqAODDDg6+FVT13OJ56jDs
	dM8Wd7D9W9M2zafb6h+EQsZx+HqPoQ9T06BrY=
Received: by 10.204.152.66 with SMTP id f2mr7488842bkw.63.1317304687591;
	Thu, 29 Sep 2011 06:58:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm1888135bks.3.2011.09.29.06.58.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Sep 2011 06:58:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Sep 2011 15:57:58 +0200
Message-Id: <1317304678-27094-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <20110929092859.GB5030@jama.jama.net>
References: <20110929092859.GB5030@jama.jama.net>
Subject: [PATCH] gcc-4.6: drop/update few patches from gcc-4_6-branch-linaro-backports.inc
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
X-List-Received-Date: Thu, 29 Sep 2011 14:03:38 -0000

* they need to be rebased after
  http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=ed7deecb9503420fbf8071445e077c32beda8dc4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch    |    4 ++--
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch    |    9 ++++-----
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    2 --
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
index 84f6f64..f76914f 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
@@ -188,8 +188,8 @@
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
--	  temp = combine_simplify_rtx (tor, mode, in_dest);
-+	  temp = combine_simplify_rtx (tor, mode, in_dest, 0);
+-	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest);
++	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest, 0);
  
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
index d14f06c..836b76f 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
@@ -1582,15 +1582,14 @@
 === modified file 'gcc/config/arm/predicates.md'
 --- old/gcc/config/arm/predicates.md	2011-04-07 10:52:12 +0000
 +++ new/gcc/config/arm/predicates.md	2011-05-03 15:14:56 +0000
-@@ -683,3 +683,7 @@
-    } 
-   return true; 
- })
+@@ -686,3 +686,7 @@
+ 
+ (define_special_predicate "add_operator"
+ 			 (match_code "plus"))
 +
 +(define_special_predicate "neon_struct_operand"
 +  (and (match_code "mem")
 +       (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
-
 === modified file 'gcc/doc/tm.texi'
 --- old/gcc/doc/tm.texi	2011-01-22 19:35:10 +0000
 +++ new/gcc/doc/tm.texi	2011-05-03 15:17:25 +0000
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 86dceab..e256e15 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -21,11 +21,9 @@ file://linaro/gcc-4.6-linaro-r106755.patch \
 file://linaro/gcc-4.6-linaro-r106759.patch \
 file://linaro/gcc-4.6-linaro-r106761.patch \
 file://linaro/gcc-4.6-linaro-r106762.patch \
-file://linaro/gcc-4.6-linaro-r106763.patch \
 file://linaro/gcc-4.6-linaro-r106764.patch \
 file://linaro/gcc-4.6-linaro-r106766.patch \
 file://linaro/gcc-4.6-linaro-r106768.patch \
-file://linaro/gcc-4.6-linaro-r106769.patch \
 file://linaro/gcc-4.6-linaro-r106770.patch \
 file://linaro/gcc-4.6-linaro-r106771.patch \
 file://linaro/gcc-4.6-linaro-r106772.patch \
-- 
1.7.6.1



