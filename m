Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F84C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:33:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.23308.1745742659049731304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egWBB2Tk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so38328385e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742657; x=1746347457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8U6MqOmPCeMaTeqNvXDpHoyedotNxeprHwUkMTsJzs=;
        b=egWBB2TkbzDc4Nt40gw3HG38Wc8zEmqh/zk6kSUuj6SKEdO1YdVYtDvsXx69EnCvy1
         Dh7BCQn8gkUrCcqz8jxqKeyM/+scpjD6TWaX3GGunHqPD0Fxx4AfvUNQ3D6RkzSygSps
         5AxF/KugDCl8/OPty8h7ZDXdSKzewN837MamrNZzKrEl7PEklqeNLDgAfa29YkWM828K
         I7Fy4pgFZwUyKNiwaRhuYOl68y49wW+ev4ieRTwXApVX0UoxZP75Z/oyAOwzfjHHImrY
         WG88+E8XifG68Pek92F9yO3N59fjcUomKSb1lGiQzRDC5/ibFsa61pYjkjBJKaUs5e07
         4jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742657; x=1746347457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8U6MqOmPCeMaTeqNvXDpHoyedotNxeprHwUkMTsJzs=;
        b=JJMAvbHl+8XpDzdlpYu4vw8fcZBudMlLLXrpzlrkE9HAv4G/BK0erb76wFAeK5Rr1J
         4xIwjYkuDYyGbyqsrHAB4qFXeVJfwVJm2cIujNYSubqaO2bBpJGmI7iUqBdrWk+GD9TE
         LqQZ/WIg/9H4kqULVHs7fGrmuvJKVBUMUelZFtOCFgQDfLw1FtVqkPHtGKH1RqUZn6Ma
         NtWJELsV5Spq3MTY97HmgYHSF4rUl/KlRqMlchwetEmwC9+e/Jxg/fYv4j/XYr7OPad0
         0/vIyTTIE8BI/k2thtCdne3FdVG8iHaIVQKpQ3AfOyLVsnYDB8GhaaHo9w4z12O8RDC6
         ZH5A==
X-Gm-Message-State: AOJu0YxfQA/+fTBbcv8c4eZX9DW3HkVn+TnGAR3ij23TP7Vq1gH3SJls
	ljQuBQtNPeXPU+/ykLH0jnAIFiK5WRN8WH39qCkrJmFOU7ytr6VJH+q5l6oP
X-Gm-Gg: ASbGncsQhRU/wL8/HY7hkdzdALkJrChJarZ08fPWgU97PoKpBqPA5VXHesOdODoBA2U
	p6Wh7nebOPWoRUQci4iC/8q6UBoSLVC29QYC5rm8li22N6MYYV4aYL8M6Ru5BDzZRUHLT/UIYip
	yM6n1E9bimh15r5d5Or0gSUe4q5f2jo+J6c7Aj7a7eCbKbAZkT5dF+WGxpkVmj1swizuBlIJYsu
	LA8MbdMAe2G/IvpYfXGhpGJDE04OE3lDT4QwR9SwS9zrli4+GyaO3ISTGP/PBycvwXdkVtIvPSQ
	ZDYYDF4TEVQvbBZ3VnG6zpwkbR1U2KQwlIBYXP4kdf21s1h+iqGnKaUK8KBQuIwgt3c2ZXAWWF7
	o
X-Google-Smtp-Source: AGHT+IGUzMR/25L8zyc1hr9tPVfHc0eUylioYl5u/7VGajN/D0OjMAaTvmE+5DQK0C4H+1aAylSXXg==
X-Received: by 2002:a05:600c:4f06:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-440a65b64a9mr57661275e9.6.1745742656777;
        Sun, 27 Apr 2025 01:30:56 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c973sm7801104f8f.5.2025.04.27.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:30:56 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][scarthgap][PATCH 1/2] python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
Date: Sun, 27 Apr 2025 08:30:44 +0000
Message-ID: <20250427083045.3757-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117159

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-default-cc-from-environment-variable.patch
removed since it's not available in 1.2.0

License-Update: Reorg and rename files; add pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index a71187399b..cf9e494b20 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queue
 HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a4f3bd729df04bf68f66ef877e9c7c9"
 
 PYPI_PACKAGE = "posix_ipc"
 
-SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
+SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
 inherit setuptools3 pypi
-- 
2.43.0


