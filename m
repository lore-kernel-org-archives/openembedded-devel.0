Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D97C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:17:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3155.1713212217905775739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 13:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxyvbQyp;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso5743452a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713212216; x=1713817016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc54ZpeGM/elA1BUIUjfSWxrZAZhstE3R45rkprhMIM=;
        b=fxyvbQypl79sroEGLYei4LbNKmOzY69upjkoq5dEXzOUyQukEIELk65GTVdCX8UOrg
         TOLUuewTW+f2LWLau7XE5rv42ShtLycdT6q810x6XzCUVfUzXM7Q0xdnuFGyArYhEYrz
         hA3VvnC/pwJzSJQyvar7D/A+ARNu6ENeGiyZcLIW61Ix2vArmUKz7hfUCBsXapzLofGf
         sJCeJwlLsG7g3OFQF92fmd/O9zrpoL3U5UItm71RiNPTEzOphl0aq6TLwrhxeg8qYd/E
         RXyNp8CyFeFeCN8vSSab1F7QYhKkAzMY+ZK80idOwTYaVYrFqroKZI3ZTfj4eWgft3kM
         PcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713212216; x=1713817016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc54ZpeGM/elA1BUIUjfSWxrZAZhstE3R45rkprhMIM=;
        b=XkzEYtXSmzhmVcXrqhaSyFR5Ydj6KmGwA5G3clSe2tZDj0k0nrQ/w5j5Ym4s4zxzbk
         rr1RrfM5bcZ5FSwcTEZz2ZIvtUPtLofX8PQHg9gp6U+j32Xz/S7Yya1XYjkimle8/Q5I
         OPb2SqKKeGg6dQK0XwYFMIKw/Smh4nTGzZFlFBvMyweRCLS9VctBBHifGZNp5CwxrScb
         UIYaigKXjDK+5UYsq8UuiHcHJbwtbudCu8JEkhYX9p5sd8fglGRXpX+ZWKKo2wXSOzTF
         u5cT9Qs7uwffmp/doyaznJa0HciYHGAcSNO7dTn8k2IFNtITGN416ZqQQDQtRAB1aIDE
         hvUg==
X-Gm-Message-State: AOJu0YyDEnyTOF08gJ+QruGtNNFBoU1V9+7P0z6NeS9yu2JqGZC5Agff
	1f4WhJC41ncneRIICz1UGzefVUe7eIJwjzE+B2bn+MNKQ+McTTeJjZLe0YM9
X-Google-Smtp-Source: AGHT+IH7DnaiDmPOlyb1OXqDTRk3I9la606Kb5NMDQN+0zeynZ1CeOC34Jq6ruSPX3a5GTC6qzrYbg==
X-Received: by 2002:a17:906:5a88:b0:a52:4fc1:ea98 with SMTP id l8-20020a1709065a8800b00a524fc1ea98mr4568708ejq.55.1713212215467;
        Mon, 15 Apr 2024 13:16:55 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id jg25-20020a170907971900b00a4e5ab88803sm5850383ejc.183.2024.04.15.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:16:54 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pychromecast: upgrade 14.0.0 -> 14.0.1
Date: Mon, 15 Apr 2024 19:49:28 +0000
Message-Id: <20240415194929.2315308-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 20:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109968

---
 .../0001-Allow-newer-version-of-wheel-and-setuptools.patch    | 4 ++--
 ...-pychromecast_14.0.0.bb => python3-pychromecast_14.0.1.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.0.bb => python3-pychromecast_14.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
index 8825615de..447f67907 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
@@ -1,4 +1,4 @@
-From e82caffe51b37c211f7f0cd60002fbc6b4e48d03 Mon Sep 17 00:00:00 2001
+From 5ee73f91b7f13dd5c700c69e7fc43cecab5868da Mon Sep 17 00:00:00 2001
 From: Tom Geelen <t.f.g.geelen@gmail.com>
 Date: Sun, 7 Apr 2024 22:39:35 +0000
 Subject: [PATCH] Allow newer version of wheel and setuptools
@@ -10,7 +10,7 @@ Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 0f19c71..d0ecf11 100644
+index 56df5bd..17ca62d 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
index be5a3a97e..dee4bf6eb 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "dc4f8b052e760a978da9b2568b79020cb79af608a026465f07544cffe43973cf"
+SRC_URI[sha256sum] = "e16e0a7f9488319191b8b4fa21ca0beb4bf12eeda5c9bf640241188f2bea0a3e"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


