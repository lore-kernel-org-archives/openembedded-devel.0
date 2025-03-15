Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AC0C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 16:05:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.12484.1742054697586981499
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 09:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGS3Tw3O;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso4669585e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 09:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054696; x=1742659496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MZp95WKKB2pu74rkR+9O1TMi4fCtCGM+IP5BZPNE/g=;
        b=fGS3Tw3OUjH1PC03JyePROB3MYiUZntRo8v4wnvY+iLNfNM5hutr9+vvpIVDjnHfrh
         6zEE4I4l13fXmclXlHF6zsPqXq3H4vJz2JuSdC82EouVQ6NQb7uB+VY+9ZCchuwfdWxN
         /RcYOxrUlUwH5hYs6cPLKeayO293T3PSu/rFH2d+p7GEb2iBd7OfmCvV5w3rA6HtNB9k
         CemOA64YxsBjSoYaX3dlIywaoAA4yJXFpVjPyRxfafMyX0aDhPZEWygrMN0zatiphYnm
         qcDle4d/5nXxeRZv9uRi7Y24o18aAyx+j8kK36tdIW0bg77/wT+/+3T4NQg4sdzTHWuw
         2c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054696; x=1742659496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MZp95WKKB2pu74rkR+9O1TMi4fCtCGM+IP5BZPNE/g=;
        b=PBva4iXNwBFFEhoAJRf8rbV6pdKrsSRAd6w53Q50Jm12RVTyYaqPzQL8BnAed5pJkP
         hTa1oZ1xRP8HWkyfA73zl+XZjqjnx+yN2KvL+78er7sv7wrW2wirKnL/H1nGpJucyx7r
         8KGicEfbs3yRfJR1MKh9fBD6WU4KDitPZ6JR1ZFnvkK7BLpNE61uAlb0wUdoeRlEPttn
         t9+ACryPKYgGkj8ZYM0XwMUuuScQRbtFsCOCBwmULpsTFxnCYBwTlEQNA7i6VB0UyQmj
         zyrx4tllQfKWjWKvV93ww7kMNupS8aXc+R4uI26ioCx98wSzmy9Qz2Ui3pevZKvFy/e5
         TeUQ==
X-Gm-Message-State: AOJu0YyRg81SdINDWjbChkD5XHl40/HwJguKSLHVFtnxCWGXf8+hJ78q
	Z7NVbw6Ejj6w/TPO/qLpY7ozDGQi1lYZSXDR6lPKCRf94pdJSLlyZ+f0QA==
X-Gm-Gg: ASbGncsDxYrtTb+FqU+t1HSZ5GUJZHGKbH64jh96C0cBS3gy/NgSN+Bq3tl7OjBY7I5
	iEk7GgIP1AL5iZJUpu3OTAUgv8EUtFTf+f2JrpCQ/3CP0FEa/lvR7ApQrmZdxN3jkuAI4tor9DW
	Am0hEVS3wV/BlGTJyS7RPoHUPnDvcrPrSnEHzpTKGpN9R76nQPJW9NEvs2jkE9bkM/qCLo7dqCQ
	baqYEMRLQJHdX4X08+b//qeXkAT7Etp3ghUqKsk4GN1I1g1HvKponS+s2089bG4e3R1zb2FTBER
	m5KhpFlXZ/hR0Gbfdh+iFemGHypW96anFYiygZrVwO6uSsRcCVMeS6YwOi7K
X-Google-Smtp-Source: AGHT+IHsIaqosgsc5Hod5NCYFFXQCcrR0TUP11/y53b+2mAHATgeEdQjZ03KslJZHpjFzWdoSiFr6g==
X-Received: by 2002:a05:600c:3b84:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43d1eccc32amr76532925e9.20.1742054695536;
        Sat, 15 Mar 2025 09:04:55 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdc8e9esm28739685e9.1.2025.03.15.09.04.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:04:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nftw: rename dirstreamlist to dirlist
Date: Sat, 15 Mar 2025 17:04:54 +0100
Message-ID: <20250315160454.3679181-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115995

---
 ports/unix/guts/nftw.c | 59 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/ports/unix/guts/nftw.c b/ports/unix/guts/nftw.c
index 16fe197..5893de2 100644
--- a/ports/unix/guts/nftw.c
+++ b/ports/unix/guts/nftw.c
@@ -152,9 +152,9 @@
     struct stat st; // stat to send to "fn"
     dev_t orig_dev; // the device of the top "path"
 
-    struct dirstream_path* dirstreamlist = NULL; // list of currently processed folders,
+    struct dirstream_path* dirlist = NULL; // list of currently processed folders,
                                                  // used along with FTW_DEPTH flag
-    size_t dirstreamlist_size = 0;
+    size_t dirlist_size = 0;
 
     ino_t *inode_list = NULL;
     size_t inode_list_size = 0, inode_list_capacity = 0;
@@ -210,9 +210,9 @@
 /*  NO FTW_DEPTH walking code section starts here                   */
 /* ******************************************************************/
 
-    dirstreamlist = malloc(sizeof(struct dirstream_path));
+    dirlist = malloc(sizeof(struct dirstream_path));
     // kickstart the first element with the top folder path
-    NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirstreamlist, dirstreamlist_size, NFTW_DONT_OPEN_DIRSTREAM);
+    NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirlist, dirlist_size, NFTW_DONT_OPEN_DIRSTREAM);
 
     /*
      * Walk the tree, without FTW_DEPTH flag.
@@ -222,13 +222,13 @@
      * 4. Collect all folders from the folder, and add them to the end of the list
      * 5. Repeat until the list if empty
      */
-    while (dirstreamlist_size > 0) {
+    while (dirlist_size > 0) {
         ftw.level = -base_level;
         ftw.base = 0;
 
         // 1. take the last folder from the list
-        strcpy(folder_pathbuf, dirstreamlist[dirstreamlist_size - 1].path);
-        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
+        strcpy(folder_pathbuf, dirlist[dirlist_size - 1].path);
+        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
         NFTW_CALCULATE_FTW_BASE_AND_LEVEL(folder_pathbuf, ftw);
 
         if (flag & FTW_ACTIONRETVAL){
@@ -313,7 +313,7 @@
             // 4. Collect all folders from the folder, and add them to the list
             // (in the same loop with step 3)
             if (d->d_type == DT_DIR) {
-                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirstreamlist, dirstreamlist_size, NFTW_DONT_OPEN_DIRSTREAM);
+                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirlist, dirlist_size, NFTW_DONT_OPEN_DIRSTREAM);
                 continue;
             }
 
@@ -392,8 +392,8 @@ nftw_ftw_depth: ;
     stat(path, &st);
 
     if (S_ISDIR(st.st_mode)){
-        dirstreamlist = malloc(sizeof(struct dirstream_path));
-        NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirstreamlist, dirstreamlist_size, NFTW_OPEN_DIRSTREAM);
+        dirlist = malloc(sizeof(struct dirstream_path));
+        NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirlist, dirlist_size, NFTW_OPEN_DIRSTREAM);
     } else {
         // otherwise it's a single file, just send it off, and we are done
         ftw.level = -base_level;
@@ -423,23 +423,23 @@ nftw_ftw_depth: ;
      *     send it to fn, and remove it from dirstreamlist.
      * 4.  Repeat until the list is empty.
      */
-    while (dirstreamlist_size > 0){
+    while (dirlist_size > 0){
         // 1. Get the last dirstream from dirstreamlist
         // and
         // 2. Read the next entry from it
-        if ((d = readdir(dirstreamlist[dirstreamlist_size - 1].dirstream)) != NULL){
+        if ((d = readdir(dirlist[dirlist_size - 1].dirstream)) != NULL){
             if ((strcmp(d->d_name, ".") == 0) || strcmp(d->d_name, "..") == 0){
                 continue;
             }
 
             NFTW_CONCAT_PATH_WITH_SEPARATOR(file_pathbuf,
-                                            dirstreamlist[dirstreamlist_size - 1].path,
+                                            dirlist[dirlist_size - 1].path,
                                             "/",
                                             d->d_name);
             // 3b. If the entry is a folder, open a directort stream with it, and append
             //     it to dirstreamlist
             if (d->d_type == DT_DIR){
-                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirstreamlist, dirstreamlist_size, NFTW_OPEN_DIRSTREAM);
+                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirlist, dirlist_size, NFTW_OPEN_DIRSTREAM);
                 continue;
             }
 
@@ -491,25 +491,25 @@ nftw_ftw_depth: ;
 
             ftw.level = -base_level;
             ftw.base = 0;
-            NFTW_CALCULATE_FTW_BASE_AND_LEVEL(dirstreamlist[dirstreamlist_size - 1].path, ftw);
+            NFTW_CALCULATE_FTW_BASE_AND_LEVEL(dirlist[dirlist_size - 1].path, ftw);
 
             if (flag & FTW_ACTIONRETVAL){
-                if (NFTW_SHOULD_SKIP_PATH(dirstreamlist[dirstreamlist_size - 1].path, skiplist, skiplist_size)) {
-                    NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
+                if (NFTW_SHOULD_SKIP_PATH(dirlist[dirlist_size - 1].path, skiplist, skiplist_size)) {
+                    NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
                     continue;
                 }
             }
 
             if (flag & FTW_CHDIR){
-                chdir(dirstreamlist[dirstreamlist_size - 1].path);
+                chdir(dirlist[dirlist_size - 1].path);
                 chdir("..");
             }
 
             // stat it, and send it to fn
             if (((flag & FTW_PHYS)
-                  ? lstat(dirstreamlist[dirstreamlist_size - 1].path, &st)
-                  : stat(dirstreamlist[dirstreamlist_size - 1].path, &st)) < 0) {
-                NFTW_HANDLE_BROKEN_SYMLINK(dirstreamlist[dirstreamlist_size - 1].path);
+                  ? lstat(dirlist[dirlist_size - 1].path, &st)
+                  : stat(dirlist[dirlist_size - 1].path, &st)) < 0) {
+                NFTW_HANDLE_BROKEN_SYMLINK(dirlist[dirlist_size - 1].path);
             } else {
                 if ((flag & FTW_MOUNT) && orig_dev != st.st_dev)
                     continue;
@@ -531,21 +531,21 @@ nftw_ftw_depth: ;
                 } else {
                     ent_flag = S_ISDIR(st.st_mode) ? FTW_DP : FTW_F;
                 }
-                rc = fn(dirstreamlist[dirstreamlist_size - 1].path, &st, ent_flag, &ftw);
+                rc = fn(dirlist[dirlist_size - 1].path, &st, ent_flag, &ftw);
             }
 
-            NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
+            NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
         }
 
         if (flag & FTW_ACTIONRETVAL){
             if (rc == FTW_SKIP_SIBLINGS){
 
-                NFTW_APPEND_STRING_TO_ARRAY(dirstreamlist[dirstreamlist_size - 1].path,
-                                            strlen(dirstreamlist[dirstreamlist_size - 1].path) + 1,
+                NFTW_APPEND_STRING_TO_ARRAY(dirlist[dirlist_size - 1].path,
+                                            strlen(dirlist[dirlist_size - 1].path) + 1,
                                             skiplist,
                                             skiplist_size);
 
-                skiplist[skiplist_size - 1][strlen(dirstreamlist[dirstreamlist_size - 1].path)] = '/';
+                skiplist[skiplist_size - 1][strlen(dirlist[dirlist_size - 1].path)] = '/';
                 rc = 0;
             } else if (rc == FTW_STOP) {
                 goto nftw_out;
@@ -579,12 +579,11 @@ nftw_out: ;
 
     free(skiplist);
 
-    for (size_t i = 0; i < dirstreamlist_size; ++i){
-        closedir(dirstreamlist[i].dirstream);
-        free(dirstreamlist[i].path);
+    for (size_t i = 0; i < dirlist_size; ++i){
+        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
     }
 
-    free(dirstreamlist);
+    free(dirlist);
     free(inode_list);
 
     errno = save_errno;

