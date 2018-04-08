Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8D592745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:20 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id y66so3722021pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sjY2KBExkF+aJxAxfKBNEM7HOwUO/XuabGnRuxyH+AM=;
	b=FaIcC+Rld5JyfNQJMKgyhQ2na0Csr+VrT8NWtlD49hqgYr/XR5bGdJ60OhNbjalbGE
	JaHEyIV9AFErsWohQuqwUUfC8SN+xJC3Dhnx8Wr5g82JX64U+k88/9ILUqhrKEK+sxuy
	yHzjKJE7KfS6FHqD++fm3KumhtONWLDgz0LK4Fv1qT4dyj7kVJX/9SkI2d2DbzsLTEpR
	zdKzmRB2wBL0c/TtU8hRT7ZVS8lEXVs/iGjjbQKonaBH7RSFuorTvK7wpKx052Il7yBg
	6A4BVRaCC8cNjVLymI5+99KCyA5G1kAZaXNDijDS0sOau2/IxRiVZ906RH1kTyGC//JA
	fz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sjY2KBExkF+aJxAxfKBNEM7HOwUO/XuabGnRuxyH+AM=;
	b=rbi4gVt5T8+xblga0T96v5M34OrzSWZKTMzYzhaVxExZnl2A696GsWfWbvQHRpTmiw
	sCF1YqwrV/S8dRSajpkUg0/Xo9gkEr66jLUjwW5UFuZ3hYP8w7k5WS+fJBG5DYNzry2C
	Uy+n06NokN8G6ttq4sSY7M18Ti1L+4GXMOvkQCKNk7CkhvddDwy3KEu2a4MPuKcfbqJu
	h4RNsCeyb3XZqPz6QKFlXP4/R5hHn6BEpm3gL/z7Fy1Lh9mNG/i3DVbmGcB20fNJ27uR
	TPpQl77G04sBgXmSOCITbln499xNjhHxG9ew6w//UXORZ/tUfKBxgY6+7feQGQAqXbCL
	iOww==
X-Gm-Message-State: AElRT7HvLdHRdetapE0odaT1FAIW6cw1wU3cBy0kh+j5EFslZZXEGh0l
	2gzCRarEA+snps5iTh3oJI0=
X-Google-Smtp-Source: AIpwx48O//UfLIaHy3JeaH92CKC2p7y7qfK+CavrjoTj3urqPIh3EYw2Is3P5dcx9pTu2qcvuuXRPQ==
X-Received: by 10.98.138.154 with SMTP id o26mr25315976pfk.82.1523170761334;
	Sat, 07 Apr 2018 23:59:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:41 -0700
Message-Id: <1523170729-26321-29-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 29/37] nginx: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:20 -0000

WARNING: nginx-1.12.2-r0 do_patch:
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
Applying patch nginx-cross.patch
patching file auto/feature
patching file auto/options
Hunk #1 succeeded at 386 (offset 33 lines).
Hunk #2 succeeded at 580 (offset 35 lines).
Hunk #3 succeeded at 599 (offset 22 lines).
patching file auto/types/sizeof
patching file auto/unix
Hunk #1 succeeded at 587 (offset 194 lines).
Hunk #2 succeeded at 604 with fuzz 1 (offset 188 lines).
Hunk #3 succeeded at 620 with fuzz 2 (offset 188 lines).

Now at patch nginx-cross.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/nginx/files/nginx-cross.patch    | 56 ++++++++++++----------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
index 5e96644..0a18bcd 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
@@ -3,10 +3,11 @@ We do not have capability to run binaries when cross compiling
 Upstream-Status: Pending
 
 
-diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
---- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
-+++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
-@@ -49,12 +49,20 @@
+Index: nginx-1.12.2/auto/feature
+===================================================================
+--- nginx-1.12.2.orig/auto/feature
++++ nginx-1.12.2/auto/feature
+@@ -49,12 +49,20 @@ eval "/bin/sh -c \"$ngx_test\" >> $NGX_A
  
  if [ -x $NGX_AUTOTEST ]; then
  
@@ -29,7 +30,7 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
                  ngx_found=yes
  
                  if test -n "$ngx_feature_name"; then
-@@ -68,17 +75,27 @@
+@@ -68,17 +76,27 @@ if [ -x $NGX_AUTOTEST ]; then
  
          value)
              # /bin/sh is used to intercept "Killed" or "Abort trap" messages
@@ -61,7 +62,7 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
              else
                  echo " found but is not working"
              fi
-@@ -86,7 +105,7 @@
+@@ -86,7 +104,7 @@ END
  
          bug)
              # /bin/sh is used to intercept "Killed" or "Abort trap" messages
@@ -70,10 +71,11 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
                  echo " not found"
  
              else
-diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
---- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
-+++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
-@@ -353,6 +353,18 @@
+Index: nginx-1.12.2/auto/options
+===================================================================
+--- nginx-1.12.2.orig/auto/options
++++ nginx-1.12.2/auto/options
+@@ -386,6 +386,18 @@ $0: warning: the \"--with-sha1-asm\" opt
          --test-build-epoll)              NGX_TEST_BUILD_EPOLL=YES   ;;
          --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
  
@@ -92,7 +94,7 @@ diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
          *)
              echo "$0: error: invalid option \"$option\""
              exit 1
-@@ -533,6 +445,17 @@
+@@ -568,6 +580,17 @@ cat << END
  
    --with-debug                       enable debug logging
  
@@ -110,7 +112,7 @@ diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
  END
  
      exit 1
-@@ -554,6 +577,8 @@
+@@ -576,6 +599,8 @@ fi
  
  if [ ".$NGX_PLATFORM" = ".win32" ]; then
      NGX_WINE=$WINE
@@ -119,10 +121,11 @@ diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
  fi
  
  
-diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
---- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 11:00:26.000000000 -0500
-+++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 -0600
-@@ -12,9 +12,12 @@
+Index: nginx-1.12.2/auto/types/sizeof
+===================================================================
+--- nginx-1.12.2.orig/auto/types/sizeof
++++ nginx-1.12.2/auto/types/sizeof
+@@ -12,9 +12,12 @@ checking for $ngx_type size
  
  END
  
@@ -137,7 +140,7 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
  
  #include <sys/types.h>
  #include <sys/time.h>
-@@ -33,15 +36,16 @@
+@@ -33,15 +36,16 @@ int main(void) {
  END
  
  
@@ -160,10 +163,11 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
  fi
  
  
-diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
---- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
-+++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
-@@ -393,13 +393,13 @@
+Index: nginx-1.12.2/auto/unix
+===================================================================
+--- nginx-1.12.2.orig/auto/unix
++++ nginx-1.12.2/auto/unix
+@@ -587,13 +587,13 @@ ngx_feature_libs=
  
  # C types
  
@@ -181,8 +185,8 @@ diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
  ngx_param=NGX_PTR_SIZE; ngx_value=$ngx_size; . auto/types/value
  
  
-@@ -416,7 +416,7 @@
- 
+@@ -604,7 +604,7 @@ NGX_INCLUDE_AUTO_CONFIG_H="#include \"ng
+ ngx_type="uint32_t"; ngx_types="u_int32_t"; . auto/types/typedef
  ngx_type="uint64_t"; ngx_types="u_int64_t"; . auto/types/typedef
  
 -ngx_type="sig_atomic_t"; ngx_types="int"; . auto/types/typedef
@@ -190,9 +194,9 @@ diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
  . auto/types/sizeof
  ngx_param=NGX_SIG_ATOMIC_T_SIZE; ngx_value=$ngx_size; . auto/types/value
  
-@@ -432,15 +432,15 @@
+@@ -620,15 +620,15 @@ ngx_type="rlim_t"; ngx_types="int"; . au
  
- . auto/endianess
+ . auto/endianness
  
 -ngx_type="size_t"; . auto/types/sizeof
 +ngx_type="size_t"; ngx_param="SIZE_T"; . auto/types/sizeof
@@ -208,4 +212,4 @@ diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
 +ngx_type="time_t"; ngx_param="TIME_T"; . auto/types/sizeof
  ngx_param=NGX_TIME_T_SIZE; ngx_value=$ngx_size; . auto/types/value
  ngx_param=NGX_TIME_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
- 
+ ngx_param=NGX_MAX_TIME_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
-- 
2.7.4


