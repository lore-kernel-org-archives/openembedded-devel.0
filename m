Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8225745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:22 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p15so3712407pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2QPUUgTe33YNdzsaPqacEtp/3obkOb/7k5WETtw3NsA=;
	b=ujOaHMN0zJOW1qawg00+vp7Zl0fdLgg/Zb+kTwebLuXRtNih2ZaiUteG7itXJrpcwm
	RxbB6DUBwusj+ugrv72dj5uJ+flVHDsV4MhdEA4V9uig4bpkmlRn2/L7f4mS9fG2Bjlb
	adz2WSBqvsbO7rik0bsNjrorExlVpRJhi6L8z8+xkc641++BYwYbQ71vUUN/HS0vf4hA
	d3IRykz/vF+/aUajOTNuwDNsssRVM6bibyWXBsslbLyzImN92I67FkUk37UX4+KSALx1
	h336jzQj4wH1LlMxSvzC+7BvMYPG06YdV53qVSyOi8teWLitPCidSNKRErVLzYNjNukR
	L89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2QPUUgTe33YNdzsaPqacEtp/3obkOb/7k5WETtw3NsA=;
	b=ezbzvWns+UYO/2rxZ+PlZJbKmLNGfn+1StV0cZgufPQY5HOnD2dQ+4v2l/77VTtk0/
	bBjk84AUEucsardPleSEFsQiLDf7aHKpGgUKcJBvlDyS9r2bVY/WTRJjQSSmFBtZRqWB
	0c7+W9sQPWu/ZaIlNQUPrYJkUGvvAPTL4wSLJbT17HcZn7UtXFedhKCAKxmRXcoW9GA4
	v2RmwsYXBLlzc4g941e5RziDG5mPVsRrQUtWq+HA1dZ1+JtXuvXX6CPC/MJGbumgxbsb
	WwGG6GIkC/YKRF53DCJMOynPcbp4yJ+PbrgGn4k3pfWb+13Cz4Wwu88/v3wGwg1yuKfx
	tSoQ==
X-Gm-Message-State: AElRT7EyBjpE+EHKA/KnfWfvmONIhrEz6ouVTk4jGJ3uHqDfIu33i8HZ
	nqVAzCNfDD/0Y7dlNYGZldw=
X-Google-Smtp-Source: AIpwx4+3js0xTJJWgh1lJUC8vdLsw5WXRMKtR1teJlP/Nsom7YXf23SjrHG4VhIMboJ7SrYpP1ctNA==
X-Received: by 10.98.17.85 with SMTP id z82mr25447594pfi.206.1523170764082;
	Sat, 07 Apr 2018 23:59:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:44 -0700
Message-Id: <1523170729-26321-32-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 32/37] anthy: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:23 -0000

WARNING: anthy-9100h-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch not_build_elc.patch
patching file src-util/Makefile.am
Hunk #1 succeeded at 8 with fuzz 2 (offset 2 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../anthy/anthy/native-helpers.patch               | 38 +++++++++++++---------
 .../anthy/anthy/not_build_elc.patch                | 11 ++++---
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-support/anthy/anthy/native-helpers.patch b/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
index 291b66b..47ce007 100644
--- a/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
+++ b/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
@@ -3,20 +3,24 @@ author: pH5
 comment: Stage the native anthy helpers mkfiledic, mkdepgraph, mkworddic, 
 comment: calctrans and proccorpus.
 
---- anthy-7811/mkanthydic/Makefile.am~	2006-05-13 18:28:35.000000000 +0900
-+++ anthy-7811/mkanthydic/Makefile.am	2006-06-18 10:56:25.770000000 +0900
-@@ -3,7 +3,7 @@
+Index: anthy-9100h/mkanthydic/Makefile.am
+===================================================================
+--- anthy-9100h.orig/mkanthydic/Makefile.am
++++ anthy-9100h/mkanthydic/Makefile.am
+@@ -3,7 +3,7 @@ noinst_SCRIPTS =
  CLEANFILES = anthy.dic
- INCLUDES = -I$(top_srcdir)/include -DSRCDIR=\"$(srcdir)\"
+ INCLUDES = -I$(top_srcdir)/ -DSRCDIR=\"$(srcdir)\"
  
 -noinst_PROGRAMS = mkfiledic
 +bin_PROGRAMS = mkfiledic
  mkfiledic_SOURCES = mkfiledic.c
  mkfiledic_LDADD = ../src-diclib/libdiclib.la
  
---- anthy-7811/depgraph/Makefile.am~	2006-06-02 00:20:54.000000000 +0900
-+++ anthy-7811/depgraph/Makefile.am	2006-06-18 10:57:19.420000000 +0900
-@@ -9,7 +9,7 @@
+Index: anthy-9100h/depgraph/Makefile.am
+===================================================================
+--- anthy-9100h.orig/depgraph/Makefile.am
++++ anthy-9100h/depgraph/Makefile.am
+@@ -9,7 +9,7 @@ CLEANFILES = anthy.dep
  EXTRA_DIST = indepword.txt $(DEPWORDS)
  
  # Generate the dictionary
@@ -25,10 +29,12 @@ comment: calctrans and proccorpus.
  mkdepgraph_SOURCES = mkdepgraph.c
  mkdepgraph_LDADD =  ../src-main/libanthy.la ../src-worddic/libanthydic.la
  
---- anthy-7811/mkworddic/Makefile.am~	2006-05-13 18:29:07.000000000 +0900
-+++ anthy-7811/mkworddic/Makefile.am	2006-06-18 11:21:56.300000000 +0900
-@@ -16,7 +16,8 @@
-  udict dict.args.in
+Index: anthy-9100h/mkworddic/Makefile.am
+===================================================================
+--- anthy-9100h.orig/mkworddic/Makefile.am
++++ anthy-9100h/mkworddic/Makefile.am
+@@ -26,7 +26,8 @@ DIC_FILES = @top_srcdir@/alt-cannadic/gc
+ 	    @top_srcdir@/mkworddic/udict
  
  # Generate the dictionary
 -noinst_PROGRAMS = mkworddic
@@ -36,10 +42,12 @@ comment: calctrans and proccorpus.
 +bin_PROGRAMS = mkworddic
  mkworddic_SOURCES = mkdic.c writewords.c mkudic.c calcfreq.c mkdic.h
  mkworddic_LDADD = ../src-worddic/libanthydic.la
-
---- anthy-9100e.orig/calctrans/Makefile.am	2008-05-08 15:04:13.000000000 +0200
-+++ anthy-9100e/calctrans/Makefile.am	2008-05-08 15:04:24.000000000 +0200
-@@ -3,7 +3,7 @@
+ 
+Index: anthy-9100h/calctrans/Makefile.am
+===================================================================
+--- anthy-9100h.orig/calctrans/Makefile.am
++++ anthy-9100h/calctrans/Makefile.am
+@@ -3,7 +3,7 @@ EXTRA_DIST =\
   corpus.3.txt corpus.4.txt corpus.5.txt\
   corpus_info weak_words
  
diff --git a/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch b/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
index bf748f3..1c5c494 100644
--- a/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
+++ b/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
@@ -1,12 +1,13 @@
 upstream: not applicable
 source: stolen from debian
 
-diff -Naur anthy-7811/src-util.orig/Makefile.am anthy-7811/src-util/Makefile.am
---- anthy-7811/src-util.orig/Makefile.am	2006-06-18 10:47:55.790000000 +0900
-+++ anthy-7811/src-util/Makefile.am	2006-06-18 10:48:23.860000000 +0900
-@@ -6,7 +6,8 @@
+Index: anthy-9100h/src-util/Makefile.am
+===================================================================
+--- anthy-9100h.orig/src-util/Makefile.am
++++ anthy-9100h/src-util/Makefile.am
+@@ -8,7 +8,8 @@ ELISP_FILES = anthy.el anthy-dic.el anth
   anthy-isearch.el anthy-azik.el anthy-kyuri.el
- EXTRA_DIST = $(ELISP_FILES) typetab dic-tool-usage.txt rcsize.rb
+ EXTRA_DIST = $(ELISP_FILES) typetab dic-tool-usage.txt anthy.i
  bin_PROGRAMS = anthy-dic-tool anthy-agent anthy-morphological-analyzer
 -ELCFILES = anthy.elc anthy-dic.elc anthy-azik.elc anthy-conf.elc anthy-isearch.elc anthy-kyuri.elc leim-list.elc
 +#ELCFILES = anthy.elc anthy-dic.elc anthy-azik.elc anthy-conf.elc anthy-isearch.elc anthy-kyuri.elc leim-list.elc
-- 
2.7.4


