Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAEFC28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 16:06:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12532.1742054765051331196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 09:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5PJL3EO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso4675605e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054763; x=1742659563; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T4jl9FV6Vgqd6Nf6dpg6iVYYzSkgLnkYZ45Mp01bu5U=;
        b=H5PJL3EOovtMy+C/hr2RGaSpp0uEjfmFQTSS5JuOxxeGiw3I67j0fDjHPndc0nY/ik
         La5nx0qeSxyM5Ov0HhzaZLaSJl0lzsfj6ltgZU/PVfxZsBg438bVi8MIvAyK4z0reCe+
         sfBGMt2NrtASplWo9XH84uiQhYBf/rBJPf2rKUiLrhQ+WyKKX4vN/4Mdem8eKmf+UQmI
         uvTVTOb1fbflvGM0DBx0c999kb5bPXPnA3uPf9dKK/jGPaIWkim3chLOH/eImEqy3hEk
         OxvJ2klC8D3nLrw4wvi0LzwUSncPCsdK/Gf25lgdU+Hagm/N2VXZMNWaa6eQeEJqBiAz
         7feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054763; x=1742659563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4jl9FV6Vgqd6Nf6dpg6iVYYzSkgLnkYZ45Mp01bu5U=;
        b=kPHN1q8T/+RSqYV2KP1q0qbM2WxMXYuePD47OASybB0/bLgt391T2f3iSTaj8h0FW7
         B1n4wsgdq8O46hP8l2l4nglHmxT77SL3zgpy8VGhRBbwFsKS1KaYAvGXW6QhbwIL+655
         ZW7XqMBSL5R6v5yRTyBO+TIqiUTWLCZ+DTcuOTf3HPJ0bctZ5o6D1RN9MdnSU7Tu07KK
         XijVh/YHRR5CMdsG8DyXKvG2wyRVzprIW+Zytk71TpfzvjPlo+cHxApX7PDI5qIkTscx
         zKpREEQJGoLlbI85eu6T3fXI/miBeg8cE+d6ZxXHv9AXpEYNj/aJkDoSisPgiRF2bHMr
         lFig==
X-Gm-Message-State: AOJu0Yzxahi267NgLSbvhXK2e28J2zz/mjeJmSBwgU9IK16VJ6HRm9T0
	F/fSPkF4Dk7E/j86k0uz7YKdzkeyvehvRFgGMhNRwNjPUbVpJTYy2Rj1Yg==
X-Gm-Gg: ASbGncuu0metRySJ2HOcvj49l9bG9RIdN6IavYDS/FwAkNHh+dQFyu1kwqs2DUZjp8x
	oE6HbuhISZD6+y2SPDE3ZPZMVz9X7sGuerScO4IbZfyUZ9YrUhF4hDl4BSZdUDJMhtvsFhyIy2T
	/lQ9fsI3sfbEI7G88/V22UDpOjsiJuqgwVoOdZrb2NH3kVzW2Umf0dewTtHgtLCKEu2ZMt4amiF
	McSYLDBAKlRLUNdxkcoivZE9dB0jSJCchfflEgzBsw12EHkN3ReXX2/vvmH0T81dRXfwqOfEIOE
	EXDxOLp4A2Fiavn2BbWK0zMRoT36usbFTk9/u6MTAkAq8HJFaNtK/iCSmgkuLVQ=
X-Google-Smtp-Source: AGHT+IGn9TQijSTmkFIncIlZw4P6mqronT99bKIlUM9oMWPwnrlZnHtt7KHPJma8DOTN/Fu24MHW4w==
X-Received: by 2002:a05:600c:46c5:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43d1ec7a33dmr91039505e9.10.1742054763200;
        Sat, 15 Mar 2025 09:06:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm53417425e9.10.2025.03.15.09.06.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 09:06:02 -0700 (PDT)
Message-ID: <4087dbe6-4a90-421a-8a10-856c308d9dc7@gmail.com>
Date: Sat, 15 Mar 2025 17:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nftw: rename dirstreamlist to dirlist
To: openembedded-devel@lists.openembedded.org
References: <182D05849CEDED15.29351@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <182D05849CEDED15.29351@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115996

This was a fatfinger mistake - please ignore. Sorry for the spam.

On 15.03.25 17:04, Gyorgy Sarvari via lists.openembedded.org wrote:
> ---
>  ports/unix/guts/nftw.c | 59 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 30 deletions(-)
>
> diff --git a/ports/unix/guts/nftw.c b/ports/unix/guts/nftw.c
> index 16fe197..5893de2 100644
> --- a/ports/unix/guts/nftw.c
> +++ b/ports/unix/guts/nftw.c
> @@ -152,9 +152,9 @@
>      struct stat st; // stat to send to "fn"
>      dev_t orig_dev; // the device of the top "path"
>  
> -    struct dirstream_path* dirstreamlist = NULL; // list of currently processed folders,
> +    struct dirstream_path* dirlist = NULL; // list of currently processed folders,
>                                                   // used along with FTW_DEPTH flag
> -    size_t dirstreamlist_size = 0;
> +    size_t dirlist_size = 0;
>  
>      ino_t *inode_list = NULL;
>      size_t inode_list_size = 0, inode_list_capacity = 0;
> @@ -210,9 +210,9 @@
>  /*  NO FTW_DEPTH walking code section starts here                   */
>  /* ******************************************************************/
>  
> -    dirstreamlist = malloc(sizeof(struct dirstream_path));
> +    dirlist = malloc(sizeof(struct dirstream_path));
>      // kickstart the first element with the top folder path
> -    NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirstreamlist, dirstreamlist_size, NFTW_DONT_OPEN_DIRSTREAM);
> +    NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirlist, dirlist_size, NFTW_DONT_OPEN_DIRSTREAM);
>  
>      /*
>       * Walk the tree, without FTW_DEPTH flag.
> @@ -222,13 +222,13 @@
>       * 4. Collect all folders from the folder, and add them to the end of the list
>       * 5. Repeat until the list if empty
>       */
> -    while (dirstreamlist_size > 0) {
> +    while (dirlist_size > 0) {
>          ftw.level = -base_level;
>          ftw.base = 0;
>  
>          // 1. take the last folder from the list
> -        strcpy(folder_pathbuf, dirstreamlist[dirstreamlist_size - 1].path);
> -        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
> +        strcpy(folder_pathbuf, dirlist[dirlist_size - 1].path);
> +        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
>          NFTW_CALCULATE_FTW_BASE_AND_LEVEL(folder_pathbuf, ftw);
>  
>          if (flag & FTW_ACTIONRETVAL){
> @@ -313,7 +313,7 @@
>              // 4. Collect all folders from the folder, and add them to the list
>              // (in the same loop with step 3)
>              if (d->d_type == DT_DIR) {
> -                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirstreamlist, dirstreamlist_size, NFTW_DONT_OPEN_DIRSTREAM);
> +                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirlist, dirlist_size, NFTW_DONT_OPEN_DIRSTREAM);
>                  continue;
>              }
>  
> @@ -392,8 +392,8 @@ nftw_ftw_depth: ;
>      stat(path, &st);
>  
>      if (S_ISDIR(st.st_mode)){
> -        dirstreamlist = malloc(sizeof(struct dirstream_path));
> -        NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirstreamlist, dirstreamlist_size, NFTW_OPEN_DIRSTREAM);
> +        dirlist = malloc(sizeof(struct dirstream_path));
> +        NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(path, dirlist, dirlist_size, NFTW_OPEN_DIRSTREAM);
>      } else {
>          // otherwise it's a single file, just send it off, and we are done
>          ftw.level = -base_level;
> @@ -423,23 +423,23 @@ nftw_ftw_depth: ;
>       *     send it to fn, and remove it from dirstreamlist.
>       * 4.  Repeat until the list is empty.
>       */
> -    while (dirstreamlist_size > 0){
> +    while (dirlist_size > 0){
>          // 1. Get the last dirstream from dirstreamlist
>          // and
>          // 2. Read the next entry from it
> -        if ((d = readdir(dirstreamlist[dirstreamlist_size - 1].dirstream)) != NULL){
> +        if ((d = readdir(dirlist[dirlist_size - 1].dirstream)) != NULL){
>              if ((strcmp(d->d_name, ".") == 0) || strcmp(d->d_name, "..") == 0){
>                  continue;
>              }
>  
>              NFTW_CONCAT_PATH_WITH_SEPARATOR(file_pathbuf,
> -                                            dirstreamlist[dirstreamlist_size - 1].path,
> +                                            dirlist[dirlist_size - 1].path,
>                                              "/",
>                                              d->d_name);
>              // 3b. If the entry is a folder, open a directort stream with it, and append
>              //     it to dirstreamlist
>              if (d->d_type == DT_DIR){
> -                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirstreamlist, dirstreamlist_size, NFTW_OPEN_DIRSTREAM);
> +                NFTW_APPEND_DIRSTREAMPATH_TO_ARRAY(file_pathbuf, dirlist, dirlist_size, NFTW_OPEN_DIRSTREAM);
>                  continue;
>              }
>  
> @@ -491,25 +491,25 @@ nftw_ftw_depth: ;
>  
>              ftw.level = -base_level;
>              ftw.base = 0;
> -            NFTW_CALCULATE_FTW_BASE_AND_LEVEL(dirstreamlist[dirstreamlist_size - 1].path, ftw);
> +            NFTW_CALCULATE_FTW_BASE_AND_LEVEL(dirlist[dirlist_size - 1].path, ftw);
>  
>              if (flag & FTW_ACTIONRETVAL){
> -                if (NFTW_SHOULD_SKIP_PATH(dirstreamlist[dirstreamlist_size - 1].path, skiplist, skiplist_size)) {
> -                    NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
> +                if (NFTW_SHOULD_SKIP_PATH(dirlist[dirlist_size - 1].path, skiplist, skiplist_size)) {
> +                    NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
>                      continue;
>                  }
>              }
>  
>              if (flag & FTW_CHDIR){
> -                chdir(dirstreamlist[dirstreamlist_size - 1].path);
> +                chdir(dirlist[dirlist_size - 1].path);
>                  chdir("..");
>              }
>  
>              // stat it, and send it to fn
>              if (((flag & FTW_PHYS)
> -                  ? lstat(dirstreamlist[dirstreamlist_size - 1].path, &st)
> -                  : stat(dirstreamlist[dirstreamlist_size - 1].path, &st)) < 0) {
> -                NFTW_HANDLE_BROKEN_SYMLINK(dirstreamlist[dirstreamlist_size - 1].path);
> +                  ? lstat(dirlist[dirlist_size - 1].path, &st)
> +                  : stat(dirlist[dirlist_size - 1].path, &st)) < 0) {
> +                NFTW_HANDLE_BROKEN_SYMLINK(dirlist[dirlist_size - 1].path);
>              } else {
>                  if ((flag & FTW_MOUNT) && orig_dev != st.st_dev)
>                      continue;
> @@ -531,21 +531,21 @@ nftw_ftw_depth: ;
>                  } else {
>                      ent_flag = S_ISDIR(st.st_mode) ? FTW_DP : FTW_F;
>                  }
> -                rc = fn(dirstreamlist[dirstreamlist_size - 1].path, &st, ent_flag, &ftw);
> +                rc = fn(dirlist[dirlist_size - 1].path, &st, ent_flag, &ftw);
>              }
>  
> -            NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirstreamlist, dirstreamlist_size);
> +            NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
>          }
>  
>          if (flag & FTW_ACTIONRETVAL){
>              if (rc == FTW_SKIP_SIBLINGS){
>  
> -                NFTW_APPEND_STRING_TO_ARRAY(dirstreamlist[dirstreamlist_size - 1].path,
> -                                            strlen(dirstreamlist[dirstreamlist_size - 1].path) + 1,
> +                NFTW_APPEND_STRING_TO_ARRAY(dirlist[dirlist_size - 1].path,
> +                                            strlen(dirlist[dirlist_size - 1].path) + 1,
>                                              skiplist,
>                                              skiplist_size);
>  
> -                skiplist[skiplist_size - 1][strlen(dirstreamlist[dirstreamlist_size - 1].path)] = '/';
> +                skiplist[skiplist_size - 1][strlen(dirlist[dirlist_size - 1].path)] = '/';
>                  rc = 0;
>              } else if (rc == FTW_STOP) {
>                  goto nftw_out;
> @@ -579,12 +579,11 @@ nftw_out: ;
>  
>      free(skiplist);
>  
> -    for (size_t i = 0; i < dirstreamlist_size; ++i){
> -        closedir(dirstreamlist[i].dirstream);
> -        free(dirstreamlist[i].path);
> +    for (size_t i = 0; i < dirlist_size; ++i){
> +        NFTW_REMOVE_LAST_DIRSTREAM_FROM_LIST(dirlist, dirlist_size);
>      }
>  
> -    free(dirstreamlist);
> +    free(dirlist);
>      free(inode_list);
>  
>      errno = save_errno;
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115995): https://lists.openembedded.org/g/openembedded-devel/message/115995
> Mute This Topic: https://lists.openembedded.org/mt/111718780/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

