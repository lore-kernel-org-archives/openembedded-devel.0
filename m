Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980A5C54EB4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2070.1674324098542295303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z2IVFXJx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id g23so7941120plq.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhwAvFSjlVzO70x3/LnV23Fd39zL2KM8n/nDl4jdpiI=;
        b=Z2IVFXJxg4tnUTP8PozODaKPZ4Wh7Ywdy4iSIjnG4JKUmyLM4v5W/IItB9sNE88cHe
         1QwgR4Ahh5uPfKaQEMypqAX76dB8FUZVz/e+LTnTWKFO8s7tBBV3rkR0Fw7vbBxzvVlX
         whQUt/z6sKvgNFOfb40N2h2fJvanOamhRSbfWbLfNRQyn7fmmfbJl/AWLkJCq+YIOWPa
         T5P/UWY7vZP01xxZz3LK3QZD0UWqHVYQ6svNx0FFoQRKZ5HygpdVLjbxE3AEG8RVhEj4
         Zn0zwpTFocfFXNs8BJqL7mXKuzSIlq52gfhfZAyhV24fx6gvDUm1j5DcJPC3mWLwQDYf
         8H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhwAvFSjlVzO70x3/LnV23Fd39zL2KM8n/nDl4jdpiI=;
        b=rzYkOGALtJ1gMFI/m9Rh/jf/GoHOzzwRvq84NaDGd8ZHhaR9I8vUjZsswCJi4fymb9
         12dRKBYVbUAne/pcOt5PQWeJdI/gWmlvAdhqENwBALtdK1k6enPCbkKvs3i8ddziN1cm
         sRXqVPgS6YSMAfBf1gyaOgMbs9pcSvOKnC1kuodVASwdQ6ueELo5KpLUBz4Q7AXFlSW9
         ouTrtrxMOpkDHqxgeLTMikRmj83riO5sEYesq/tq7CofGCdOamkcvGLAEiXXDNU/UPy8
         FMtIhe+J6FWTqiTITX4yMH4pv7rNmvCg1mK/BzSqojx8SOPT/vMoYfru/jFHY2yt6Nhl
         up/Q==
X-Gm-Message-State: AFqh2kpSPl+c2MLCd/Nc/oWR3PRjc92UGWi8E8K6FoYfqr0ffN17k98I
	LenStyzqnxmeniZRVwvWg/2iw5nqobqycA==
X-Google-Smtp-Source: AMrXdXuUEoggDu0cCeIukbB6MYNN1Shpf+8H0vpAgcT6kl1C35C/CxkQVK9km6QhEpOZ/l/up67Iqw==
X-Received: by 2002:a17:90a:66c1:b0:228:d42c:d5d6 with SMTP id z1-20020a17090a66c100b00228d42cd5d6mr43228159pjl.27.1674324102629;
        Sat, 21 Jan 2023 10:01:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 23/30] uw-imap: Fix build with clang 16
Date: Sat, 21 Jan 2023 10:01:14 -0800
Message-Id: <20230121180121.1229895-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100690

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Wincompatible-function-pointer-types.patch | 178 ++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Fix-Wincompatible-function-pointer-types.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Fix-Wincompatible-function-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Fix-Wincompatible-function-pointer-types.patch
new file mode 100644
index 0000000000..428ee91031
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Fix-Wincompatible-function-pointer-types.patch
@@ -0,0 +1,178 @@
+From 3170b245aba99694390c3c87d326639b6685d4dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Jan 2023 14:34:05 -0800
+Subject: [PATCH] Fix -Wincompatible-function-pointer-types
+
+Fixes new found errors with clang 16
+
+news.c:370:36: error: incompatible function pointer types passing 'int (struct dirent *)' to parameter of type 'int (*)(const struct dirent *)' [-Wincompatible-function-pointer-types]
+  if ((nmsgs = scandir (tmp,&names,news_select,news_numsort)) >= 0) {
+                                   ^~~~~~~~~~~
+/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/uw-imap/2007f-r0/recipe-sysroot/usr/include/dirent.h:259:13: note: passing argument to parameter '__selector' here
+                    int (*__selector) (const struct dirent *),
+                          ^
+news.c:370:48: error: incompatible function pointer types passing 'int (const void *, const void *)' to parameter of type 'int (*)(const struct dirent **, const struct dirent **)' [-Wincompatible-function-pointer-types]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/osdep/unix/mh.c   |  8 ++++----
+ src/osdep/unix/mix.c  | 12 ++++++------
+ src/osdep/unix/mx.c   |  8 ++++----
+ src/osdep/unix/news.c |  8 ++++----
+ 4 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
+index 0226b7a..9264624 100644
+--- a/src/osdep/unix/mh.c
++++ b/src/osdep/unix/mh.c
+@@ -103,8 +103,8 @@ long mh_copy (MAILSTREAM *stream,char *sequence,char *mailbox,
+ 	      long options);
+ long mh_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data);
+ 
+-int mh_select (struct direct *name);
+-int mh_numsort (const void *d1,const void *d2);
++int mh_select (const struct direct *name);
++int mh_numsort (const struct dirent **d1,const struct dirent **d2);
+ char *mh_file (char *dst,char *name);
+ long mh_canonicalize (char *pattern,char *ref,char *pat);
+ void mh_setdate (char *file,MESSAGECACHE *elt);
+@@ -1194,7 +1194,7 @@ long mh_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+  * Returns: T to use file name, NIL to skip it
+  */
+ 
+-int mh_select (struct direct *name)
++int mh_select (const struct direct *name)
+ {
+   char c;
+   char *s = name->d_name;
+@@ -1209,7 +1209,7 @@ int mh_select (struct direct *name)
+  * Returns: negative if d1 < d2, 0 if d1 == d2, postive if d1 > d2
+  */
+ 
+-int mh_numsort (const void *d1,const void *d2)
++int mh_numsort (const struct dirent **d1,const struct dirent **d2)
+ {
+   return atoi ((*(struct direct **) d1)->d_name) -
+     atoi ((*(struct direct **) d2)->d_name);
+diff --git a/src/osdep/unix/mix.c b/src/osdep/unix/mix.c
+index fbf4a02..c2207f6 100644
+--- a/src/osdep/unix/mix.c
++++ b/src/osdep/unix/mix.c
+@@ -125,7 +125,7 @@ long mix_unsubscribe (MAILSTREAM *stream,char *mailbox);
+ long mix_create (MAILSTREAM *stream,char *mailbox);
+ long mix_delete (MAILSTREAM *stream,char *mailbox);
+ long mix_rename (MAILSTREAM *stream,char *old,char *newname);
+-int mix_rselect (struct direct *name);
++int mix_rselect (const struct direct *name);
+ MAILSTREAM *mix_open (MAILSTREAM *stream);
+ void mix_close (MAILSTREAM *stream,long options);
+ void mix_abort (MAILSTREAM *stream);
+@@ -140,8 +140,8 @@ THREADNODE *mix_thread (MAILSTREAM *stream,char *type,char *charset,
+ long mix_ping (MAILSTREAM *stream);
+ void mix_check (MAILSTREAM *stream);
+ long mix_expunge (MAILSTREAM *stream,char *sequence,long options);
+-int mix_select (struct direct *name);
+-int mix_msgfsort (const void *d1,const void *d2);
++int mix_select (const struct direct *name);
++int mix_msgfsort (const struct dirent **d1,const struct dirent **d2);
+ long mix_addset (SEARCHSET **set,unsigned long start,unsigned long size);
+ long mix_burp (MAILSTREAM *stream,MIXBURP *burp,unsigned long *reclaimed);
+ long mix_burp_check (SEARCHSET *set,size_t size,char *file);
+@@ -587,7 +587,7 @@ long mix_rename (MAILSTREAM *stream,char *old,char *newname)
+  * Returns: T if mix file name, NIL otherwise
+  */
+ 
+-int mix_rselect (struct direct *name)
++int mix_rselect (const struct direct *name)
+ {
+   return mix_dirfmttest (name->d_name);
+ }
+@@ -1146,7 +1146,7 @@ long mix_expunge (MAILSTREAM *stream,char *sequence,long options)
+  * ".mix" with no suffix was used by experimental versions
+  */
+ 
+-int mix_select (struct direct *name)
++int mix_select (const struct direct *name)
+ {
+   char c,*s;
+ 				/* make sure name has prefix */
+@@ -1165,7 +1165,7 @@ int mix_select (struct direct *name)
+  * Returns: -1 if d1 < d2, 0 if d1 == d2, 1 d1 > d2
+  */
+ 
+-int mix_msgfsort (const void *d1,const void *d2)
++int mix_msgfsort (const struct dirent **d1,const struct dirent **d2)
+ {
+   char *n1 = (*(struct direct **) d1)->d_name + sizeof (MIXNAME) - 1;
+   char *n2 = (*(struct direct **) d2)->d_name + sizeof (MIXNAME) - 1;
+diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
+index 4549527..b5c5adf 100644
+--- a/src/osdep/unix/mx.c
++++ b/src/osdep/unix/mx.c
+@@ -98,8 +98,8 @@ long mx_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data);
+ long mx_append_msg (MAILSTREAM *stream,char *flags,MESSAGECACHE *elt,
+ 		    STRING *st,SEARCHSET *set);
+ 
+-int mx_select (struct direct *name);
+-int mx_numsort (const void *d1,const void *d2);
++int mx_select (const struct direct *name);
++int mx_numsort (const struct dirent **d1,const struct dirent **d2);
+ char *mx_file (char *dst,char *name);
+ long mx_lockindex (MAILSTREAM *stream);
+ void mx_unlockindex (MAILSTREAM *stream);
+@@ -1110,7 +1110,7 @@ long mx_append_msg (MAILSTREAM *stream,char *flags,MESSAGECACHE *elt,
+  * Returns: T to use file name, NIL to skip it
+  */
+ 
+-int mx_select (struct direct *name)
++int mx_select (const struct direct *name)
+ {
+   char c;
+   char *s = name->d_name;
+@@ -1125,7 +1125,7 @@ int mx_select (struct direct *name)
+  * Returns: negative if d1 < d2, 0 if d1 == d2, postive if d1 > d2
+  */
+ 
+-int mx_numsort (const void *d1,const void *d2)
++int mx_numsort (const struct dirent **d1,const struct dirent **d2)
+ {
+   return atoi ((*(struct direct **) d1)->d_name) -
+     atoi ((*(struct direct **) d2)->d_name);
+diff --git a/src/osdep/unix/news.c b/src/osdep/unix/news.c
+index 4cf5bb7..3da5207 100644
+--- a/src/osdep/unix/news.c
++++ b/src/osdep/unix/news.c
+@@ -76,8 +76,8 @@ long news_create (MAILSTREAM *stream,char *mailbox);
+ long news_delete (MAILSTREAM *stream,char *mailbox);
+ long news_rename (MAILSTREAM *stream,char *old,char *newname);
+ MAILSTREAM *news_open (MAILSTREAM *stream);
+-int news_select (struct direct *name);
+-int news_numsort (const void *d1,const void *d2);
++int news_select (const struct direct *name);
++int news_numsort (const struct dirent ** d1,const struct dirent ** d2);
+ void news_close (MAILSTREAM *stream,long options);
+ void news_fast (MAILSTREAM *stream,char *sequence,long flags);
+ void news_flags (MAILSTREAM *stream,char *sequence,long flags);
+@@ -402,7 +402,7 @@ MAILSTREAM *news_open (MAILSTREAM *stream)
+  * Returns: T to use file name, NIL to skip it
+  */
+ 
+-int news_select (struct direct *name)
++int news_select (const struct direct *name)
+ {
+   char c;
+   char *s = name->d_name;
+@@ -417,7 +417,7 @@ int news_select (struct direct *name)
+  * Returns: negative if d1 < d2, 0 if d1 == d2, postive if d1 > d2
+  */
+ 
+-int news_numsort (const void *d1,const void *d2)
++int news_numsort (const struct dirent ** d1,const struct dirent ** d2)
+ {
+   return atoi ((*(struct direct **) d1)->d_name) -
+     atoi ((*(struct direct **) d2)->d_name);
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 29c4b20878..2f4261b00d 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://0001-Define-prototype-for-safe_flock.patch \
            file://0001-Do-not-build-mtest.patch \
            file://0002-tmail-Include-ctype.h-for-isdigit.patch \
+           file://0001-Fix-Wincompatible-function-pointer-types.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.39.1


