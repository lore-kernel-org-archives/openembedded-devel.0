Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC16C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:11 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.915.1787117826210565975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V005VFNB;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbee846deecso652542a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117825; x=1787722625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGxJN0cA1Ccm+pToy3GtZiKM62zQ4Vji5zXYKuiQz4c=;
        b=V005VFNB6piBC7uvShc06uvIAN+ZcorcM82VYSKDVZ0HEAT5ZDLUXWvRZRqWYpPXj2
         HJy0MwWbgheDt6WRyq689pIwbRaiwzWoUVFsm3RcZ1clD5NXN+aCgPoZH6sOj7eUdKT1
         yKRL6NCUa8FAP9HYMJEgKM5B9L8Gn71bOGwlNHQTgknMDXxmiMgNBjBncH+27fVUqalL
         Pkf4oIKLp7koz0uESkp8FHCxmEqeg3XIwFKXq2E4Ua446rYoyvfB27AXIUiENU2+TM2B
         +DKPsNX6yoP7SjQK4CiIL2XXk7Rg/yypx7SbBrLMwk7bGJCEMJ1qNX1d6hmCq7CVtb+Q
         WwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117825; x=1787722625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGxJN0cA1Ccm+pToy3GtZiKM62zQ4Vji5zXYKuiQz4c=;
        b=EmlW4chrIPr+jzZ19g6lXBHWvETt1yKaY3inn/PCDDOIxg7IUV+2rGfFVs4H6DUbrW
         OsON8mn574eRBn7gcGIkKGx+Q81Wl9TUtP78Hv8pGSAZrF7RKEBodV6aUKQpmFmaWNQF
         tiytQveKukQwRlnxohNWbVVh2Q0uB4ylbYR/BdVCeF82f76BCB6yEsyJhPVAH7cp/r4P
         +2zdzKpsbqo8ITgHtDOZQgDMD73mG+oKjQacMTVlVYIL4Y1BBGKl9erXTK6MS5zOClIo
         +ljjLG8ZFrQuUekIB+Pmyj4vBD5nmm+8rCIRoRY0Afidk/UXILcY4p/VfhCeTGGSnCj4
         fZOQ==
X-Gm-Message-State: AOJu0Yw3Z3tCP6My1XLkTQVaI7fys8BY//02yCD6HfE/ZEoG2yLgYroJ
	NJtwrdgFS3gCNVNhN8biithUG00nhvrNJAKaOc9wh+riZUQkKNHzieKnmI4hpkET
X-Gm-Gg: AR+sD11HJvaqx8QaSMDY6DYCWBW98KfZJkQxbcjKU5hL4aMbGHfXPyVdZYvdX9RcvZ1
	K7wypRuGPp+V8jAfDmT1IqEWlX0AFQrPhdUfyzgB+UdCpPSgExj+z4jFlGs/Eg8St+5iXPoIGy7
	XURay2w9uilvAc5jN7qWBpkIJpBkzUbg6E+Vq5cZLTWcUecEZRKufQh/A1X/2/nDvych9i4Jn8h
	HcYxf76nvlvMjzOGf7uoYXEAYnGXyEXCzn1fQwuQQ3GYcU1khr15fxSOBWfyRYyljgO6zhk1XgK
	UAhsvByVvlvEYdOXduNVEvbHw3e+31Ka8fSSVEZ5BFtvXyfloSyvtIlJgodsLx7rh9nlL27gtOJ
	+1aOIU1z0tB8zxfBHSIH6dpO/tjxCZtP/5kSfwC56teWZ6Y/7axocW7CoAeuqbOOy2UIN5J/PDg
	odU0YCZu2DVfiI68XYLhBt7Uz3fAgWDgKc4QQogJ4fKp/cRjpXX5nKGhYHJeDRio0Ffa6/Ty7km
	b4=
X-Received: by 2002:a05:6a20:c706:b0:3c3:935a:af2c with SMTP id adf61e73a8af0-3cd00dc7d05mr4444188637.3.1787117825418;
        Tue, 18 Aug 2026 22:37:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/25] tinymembench: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:16 +1200
Message-ID: <20260819053629.391864-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129256

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream bumped PV without corresponding tag and SRCREV is tip of master.
Hence UPSTREAM_CHECK_COMMITS is more appropriate.

Fixes:
$ devtool latest-version tinymembench
...
INFO: Current version: 0.4.9
INFO: Latest version: 0.4
INFO: Latest version's commit: e7d7573400275d14a9ffc5266d220eeeebe3d916

[1] https://github.com/ssvb/tinymembench/commit/a9907a52a732846cd401b25bb357ec6d0e4d039a

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index e80433d602..f0527a7ca3 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b34
 PV = "0.4.9+git"
 
 SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
-# Upstream tags are "vX.Y" (newest v0.4); PV 0.4.9+git is ahead of the last tag.
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
            file://0001-asm-Delete-.func-.endfunc-directives.patch \
            "

