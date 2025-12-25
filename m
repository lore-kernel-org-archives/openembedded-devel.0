Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8608DE7AD44
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:47:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137464.1766666844270462015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGM32t0X;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so38664815e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766666842; x=1767271642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XTfMnydERYFKbs/YwoNT6d8/EIB2aDxz6qg5m3jV+w=;
        b=KGM32t0XZTNcTgLpNInNSOPYG4tKgF1Iu77XB/z61oTVRuEHXSf/g348K4hMkqD7lZ
         4q+cOzzD9a8A0uq0iAhO7A32MG28YQVTktm/urj5GAOXy6qUYCqLgjR64x1IbE9k+Meo
         t6lSWbS7jpL3SvBVBuJPA85dqZ1b9LSxuu1rnIxo6/JsR+mlHcld0varvD+eJ3FyTHZ+
         a6wIVJLkCASQe6C1xVkZX8DSKV0MVACh6dDtpr+tQtUst0o9NP9FjRc9Btg7br8EN7UL
         5vQxTbxWvQeK6BX/dGQFRu5+46ziEFb/NBY1RGUqHfZDVb2hlz+WAhuwsicY0e06N9sq
         S1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766666842; x=1767271642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/XTfMnydERYFKbs/YwoNT6d8/EIB2aDxz6qg5m3jV+w=;
        b=kNXG2I5geosBHKcn51KwrclkR0d6AGBjlTZbN9VT94Pyl7eRkw4XWuQfSEwWXinDKq
         3Xk7I57FdnZTt3sAb9zfY54N2Tg1XOtu1ZTr5OJRjrGlp9cYNx+0tUqMAa3XqIEZ6uD1
         hx/gp7Q36G2JLc3yN8EQww4p7yqbC6edMBt0AUWbQ34YF0e33fg0eMK2OIOVsqqjfDlq
         sKdsrSW3A6SryF3fOaBrnleiLIKnu71xyuf9EXJGJoDftAZWu2eyUkQysuy4o8i7xQuG
         /mTdiTRkXjGBu273U64BSF+XjS35adhKTleXHIrQFg4Z3CJKMAW0Z3lxNgOmnltUXxX4
         T1Rw==
X-Gm-Message-State: AOJu0Yyc1qqA6dYpCNSHGq5PLcL+ilrADwZkFk4ka+VvzPBX8dZ9IChA
	1FtHlJzjvrIsPGaZgYRpHZXqkWRJblTeSVK6Ml82I8/GID5yTXfAOmOxzzmWbQ==
X-Gm-Gg: AY/fxX4Vr1ftmZbX8vrYsweN5/Q4U5+jb3xA93ZQ+wq6A+HWcykrxhPehnBfvS7L5yc
	yjmQP1KXjjXwvpUZnlEVzfGjn7TLfzPI55QpsgRz0BdXzhbOYMH5ctwPhwhJzY8W16RK9RW8NOp
	xuEuAmyX7uPPHfUOqGughBVW/1UiRMVBWuV53rx+M2kdTbFKWR3FZV7aI3HeU8KLJDZnZJhd0L3
	gl2PPchSWvGixiXq9ttogG3l5gUIayQGLJhn3bffGw8CeGmQSk1daB6c29sDQ6JRUkMTKZx5jwQ
	zncWoD8xE0nleJxzXfbZy1jti11kQsz3qo91SuiqW3z1hQ48+AwcDQ2nGxEs6DTPiJp5EUYwg/S
	TxUrsyQMS7SJMRqZq4//XIb525RRJL32C6C5xSKdNR1MMjYcrh3s4isDFd2Ru/oz0WZXdn68ZvH
	7ZwYASfRtIG8HT8mToF2A=
X-Google-Smtp-Source: AGHT+IGn2FEQ8T+KsIuzLPpgv5grAAmD6nA1pPYoyQTf7RHzN4Tzy5CkD/lLYj5bQphB9l6emdkJ3A==
X-Received: by 2002:a05:600c:4506:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-47d1957da6cmr219021645e9.17.1766666842269;
        Thu, 25 Dec 2025 04:47:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm465524215e9.1.2025.12.25.04.47.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:47:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH 2/2] dracut: upgrade 108 -> 109
Date: Thu, 25 Dec 2025 13:47:20 +0100
Message-ID: <20251225124720.2074689-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225124720.2074689-1-skandigraun@gmail.com>
References: <20251225124720.2074689-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122912

Drop patch that is included in this release.

Changelog: https://github.com/dracut-ng/dracut-ng/releases/tag/109

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...cut.sh-try-STRIP-for-strip_cmd-first.patch | 33 -------------------
 .../dracut/{dracut_108.bb => dracut_109.bb}   |  6 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch
 rename meta-initramfs/recipes-devtools/dracut/{dracut_108.bb => dracut_109.bb} (96%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch
deleted file mode 100644
index 00d75ccff6..0000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b8504fdbc6ac7b49aa0a9671267be8ac7affb2ee Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@oss.qualcomm.com>
-Date: Thu, 19 Jun 2025 16:06:14 +0200
-Subject: [PATCH 1/2] feat: dracut.sh: try $STRIP for $strip_cmd first
-
-When using dracut in a cross enviroment, like OpenEmbedded, the host
-provided strip (or eu-strip) won't work, so try using the $STRIP
-variable from the shell environment first before falling back to path
-based lookups.
-
-Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/1639]
----
- dracut.sh | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/dracut.sh b/dracut.sh
-index 45373efb..dbc5cd72 100755
---- a/dracut.sh
-+++ b/dracut.sh
-@@ -2262,7 +2262,8 @@ done
- if [[ $do_strip == yes ]]; then
-     # Prefer strip from elfutils for package size
-     declare strip_cmd
--    strip_cmd=$(command -v eu-strip)
-+    strip_cmd="${STRIP}"
-+    [ -z "$strip_cmd" ] && strip_cmd=$(command -v eu-strip)
-     [ -z "$strip_cmd" ] && strip_cmd="strip"
- 
-     for p in "$strip_cmd" xargs find; do
--- 
-2.47.3
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_108.bb b/meta-initramfs/recipes-devtools/dracut/dracut_109.bb
similarity index 96%
rename from meta-initramfs/recipes-devtools/dracut/dracut_108.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_109.bb
index 276f301daf..ee6dce4576 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_108.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_109.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-PV = "108"
-SRCREV = "97c5568ec42abd5e6035f0cfa9d319ae6ae4e50a"
-SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
-           file://0001-feat-dracut.sh-try-STRIP-for-strip_cmd-first.patch \
+SRCREV = "13c5e5feee9ba86b960d351f87aa0eb25f242ff0"
+SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main;tag=${PV} \
            file://0002-fix-broken-symlink-in-dracut-config-examples.patch \
            "
 

