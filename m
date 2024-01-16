Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9C4C3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 01:17:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.820.1705367816404972341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 17:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DifGKtn3;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d48a8ed85bso23089655ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 17:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705367815; x=1705972615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GClfRDrXwKE+EbfC3jKFnhCqTz6sq+GBk3F4KjajkaI=;
        b=DifGKtn3tsSo0mYdGdSVXFxGRhh/JFZzC11HFajws2zHnk5dLBhE/rFGvjPWFZQn3X
         fBZelyyiHagQMea+CewwPR63oqvALeYCdXK/qZ899jOWuphCcuiuWS4mhninbkHebF6u
         fkqOY2RQ4l/aK9+XAbU2rRiEVp8Bpyhq1mrrI92qVmU3GMI4xSt0hj9LJkK1TkTY0EDx
         +aGWbrDDTN5VIioAIEbQ2RRy2lK6wNYEx1gA5VZ6HxqjVuouAzbH65nwvZC2Mp9tibk1
         zhmP4nbl4CZm4ZQ8Md6QS3/TU9kqcc/xUx9IH10A2bLYWWIaCSgQngo8wT4pjt7Y7QVu
         btAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367815; x=1705972615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GClfRDrXwKE+EbfC3jKFnhCqTz6sq+GBk3F4KjajkaI=;
        b=V0FIwpBWFfkwhqfZHka7+hM1srEIMhOtXmM698WN5SoDTQ7y5kgi/h/yytSAv1T2Gf
         TWoat6E3ZrbKJE/NqFEjPUSXD5l/Qo9nYxGKyCiGE05TnS1QB4aoYNqNcYqypi/wlO0h
         tTMIx1vjjiqjW7RNaQc/CWC1VigTqN1bHqhCFwTuP7oGVda/duvgjYyAqFUYXiCRVLjw
         n8OKmcGkfHSy0vIKBuoddkUthIp0QLGRCSrHw7i8NvXN3PbiepHYnrqqn9NcWGeFo0x5
         snK7c2obYfOXYDqJB3aYRw9Ney1Uh8GT8gxAldggNLbD0UE5jG2FUYjLiE4dDn584CFT
         FmYA==
X-Gm-Message-State: AOJu0YxEYjdKylGISNUhml5WVox1nG7gaZrWSLjBnsy0zmHgHM75Uw9n
	2nHXbsR4YzVYI/hb9PbW3KUJbmtCRQ8=
X-Google-Smtp-Source: AGHT+IGK594eqC90JCd9sQ7vsFWJDVgghU+aqHWxsmS/6IWesWNNk/1Me3PWb76jBV73RADIjU4QqQ==
X-Received: by 2002:a17:90b:3a89:b0:28e:3989:c49f with SMTP id om9-20020a17090b3a8900b0028e3989c49fmr6437065pjb.1.1705367815444;
        Mon, 15 Jan 2024 17:16:55 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3ce7:bbce:335e:2c36])
        by smtp.gmail.com with ESMTPSA id h14-20020a17090a604e00b0028d42741efasm10207185pjm.43.2024.01.15.17.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:16:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] v4l-utils: Remove unneeded musl patch
Date: Mon, 15 Jan 2024 22:16:49 -0300
Message-Id: <20240116011649.3303911-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 01:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108298

From: Fabio Estevam <festevam@denx.de>

The musl issue that 0004-Do-not-use-getsubopt.patch fixes has already
been addressed by the following v4l-utils upstream commit:

commit 6e19bb895a16a9a247524ac526ab47f576cc36f6
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Thu Nov 25 10:59:22 2021 +0100

    v4l-utils: use v4l_getsubopt instead of getsubopt
    
    Android doesn't have getsubopt at all, and some libc implementations
    use a getsubopt variant that behaves slightly different.
    
    So add a new v4l-getsubopt.h header that either just uses the glibc
    function (if glibc is detected) or uses a static inline v4l_getsubopt
    that is copied from glibc. This should avoid such problems.
    
    Reported-by: Marian Buschsieweke <marian.buschsieweke@ovgu.de>
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Remove the unneeded patch.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../v4l-utils/0004-Do-not-use-getsubopt.patch | 60 -------------------
 .../v4l2apps/v4l-utils_1.26.1.bb              |  1 -
 2 files changed, 61 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
deleted file mode 100644
index fb844acbe..000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 18:50:34 -0800
-Subject: [PATCH] Do not use getsubopt
-
-POSIX says that behavior when subopts list is empty is undefined.
-musl libs will set value to NULL which leads to crash.
-
-Simply avoid getsubopt, since we cannot rely on it.
-
-Imported from Alpine Linux
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Adapt patch to 1.23.0.
-
-(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
-
-%% original patch: 0007-Do-not-use-getsubopt.patch
-
-Signed-off-by: Daniel Gomez <daniel@qtec.com>
----
- utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-index d77f7104..838c297d 100644
---- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
-+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
-@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
- 
- static bool parse_next_subopt(char **subs, char **value)
- {
--	static char *const subopts[] = {
--	    nullptr
--	};
--	int opt = v4l_getsubopt(subs, subopts, value);
-+	char *p = *subs;
-+	*value = *subs;
- 
--	if (opt < 0 || *value)
--		return false;
--	fprintf(stderr, "Missing suboption value\n");
--	return true;
-+	while (*p && *p != ',')
-+		p++;
-+
-+	if (*p)
-+		*p++ = '\0';
-+
-+	*subs = p;
-+	return false;
- }
- 
- void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index 4ae1a18c9..594b51b43 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -28,7 +28,6 @@ PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
 SRC_URI = "\
     git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
     file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
-    file://0004-Do-not-use-getsubopt.patch \
 "
 
 SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
-- 
2.37.3


