Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB73D3E19B
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.29953.1729278799975994925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRv6JLug;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e28833f1c31so3001014276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278799; x=1729883599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLxBy0hd4jmgaphr8jBlQElNic2BWO72pRyWAogf9Ic=;
        b=cRv6JLugim5zOyUWIT6ayJPKR7/qtLjxattxQf8Jo3lgt5hsw10kPdufdS5OS/WiRI
         IqdMhZVkXv9nbsQY/6/XowDdjPp1vuA+Qi+PY7qucO7d6xRcpK8+jx/y3Mw3kFbV31oI
         DLoYOrx1Auj/upss9ttKDlAEPWhS+6W32AmLbqTJ04tLjiWCpfOWfVS4bQEeG0lq8Mbx
         b2oSgDwRrAwteOeRq6E4ZopUNsMvpZ6XLZWKx1UVr8sd/1s1nVjUBBLehUS8qKkGJyJp
         cKAOCMNsWMLgglLe9AE0t/VKORv5nR4l0DEuzNBBIgaylhHwcfW5vrc29GKpM6bffwH1
         O4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278799; x=1729883599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLxBy0hd4jmgaphr8jBlQElNic2BWO72pRyWAogf9Ic=;
        b=X6ils0i/eHsiwOtu4hxQFL1XeiI9XkIsWCAQ7uG1kBXJZwDokmr/+ihndPuDud4ChV
         wHKxHPAF+lMhgFC0rena+/eUFrW2oKqJRCLc9sf2oTWX3SbMe/gp9iqzHf+QLoP0+nYO
         GA7B3JN6kBDJSme64YBSzbWbvWZYAykKpm9eBe2CaIZcuuGUYqnCmUtyd6AAgxNsbW+8
         JpdSnTx5XKBd6tgQmfoYLvGn2hN7CHXimrlEVG+l8Al18YEQUox/bPe+asFe6WJzfYzM
         5cg++nzNEnYjv49ojjsFWfxFRGcTNQigQ5hm6xCanxt8LSjIpntNBug6aV/xdG9GJD5B
         2xqQ==
X-Gm-Message-State: AOJu0YxgUwkeH7wpofrKy8MSEqReMRAarAtYV3QVWkbVOS+iVG9VI5D2
	6onYi+1d+83i3zFndQB3OJaUy2mSfQmJQrKcIkkDRZbesd9iM8851ZT3Kw==
X-Google-Smtp-Source: AGHT+IFjpOPC1izdHzM8jP5LSai2K7LQVraoK7QGX/Lt1dIW3pJFcG9vZHe9exz3QMwz2wOh1hdxAQ==
X-Received: by 2002:a05:690c:74c1:b0:6d4:72b7:177e with SMTP id 00721157ae682-6e5a3d2d2fcmr67869857b3.5.1729278798585;
        Fri, 18 Oct 2024 12:13:18 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:18 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 12/68] python3-asciitree: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:59 -0400
Message-ID: <20241018191101.25184-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112999

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
index 833732bd4..6b740e6f8 100644
--- a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://github.com/mbr/asciitree"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
 
-SRC_URI[md5sum] = "2570b31e563b69da1aff54509db8ac6a"
 SRC_URI[sha256sum] = "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
 
 inherit pypi setuptools3
-- 
2.43.0


