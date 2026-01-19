Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DE5CA6015
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31273.1768811315090385990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwImzFvq;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a2ea96930cso23532445ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811314; x=1769416114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hEoUs4p7PGPQ+JGdRadYwButQ9pqwim7f0IDganmU=;
        b=lwImzFvqg8yIzIA6qD2/PYNq9qBUfxKjYoya+tjtbOiB6GVRpuYH94cU+8v4EVnRdH
         I9PhnSKKjRqEld7uDBYDWYKaHuC/1EN+HvRYMHvNM7jQGrtU8SCVtDbGkzrC4xBuYXXR
         2ZwNu94teJlGvMmhMw0ohspInaQDbhm4zJHQMjfeoVrMKQm8BVGt7p0dqhJvseD+vwWh
         tb9/w62rbLgw2oYM9EiPEabeIxNYwghZPxmSLkXfmxjRsArZKclEzX8EK+VcaLYq5P+o
         kBJ+cQ/ZRjuiMvNBScTx3UNmzAdq/CBnqBEDnHGtryTmMk4PE9FjVyyuTZuuJZumLTdr
         LU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811314; x=1769416114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hEoUs4p7PGPQ+JGdRadYwButQ9pqwim7f0IDganmU=;
        b=kTLCBnH/9HhCfZ6fu6U6XOE5yTeRPyJ8jm/Oz/VCrCXe9W20eOenw49DceNQ7nQGQE
         KurcCSJ2j3e7TeUCZcwifkTnovFSm+gXeHahBllEch3Zm6Tz8DJNzaZA1hHkjIu6bAS+
         umBS/54ujQERNAjjz9DNOgzf5XL0HYyiRmg15J6XeMxjod43oBMM4RQxEFmVtuC3kX4C
         dJSb0AtC+dlw8amhqK5bQ2xL6scd0Oh3zofbwA48fj3mN7E3ZChR6AoxRaAlo35ajWAs
         tzl158ruG7z1wQJ6DkfsDmYM6TqTauNhrv21kkcPbePuDe3w9sXR9adUpsjXix/nv6yD
         qWWQ==
X-Gm-Message-State: AOJu0Yxl9uJEmiLboCqiqzr0pOg8dr+iUuX8mzlwsMHPvw60JhudAi9A
	SoxCRR/lBrzQOIfMDSMYyNw1bY/8y+pF0MMWXSDO0nUktKnZtxynoOQyrflSIQ==
X-Gm-Gg: AZuq6aKj+5FXbwWSj1OZl/+vOUl7CU5DnDFjy2hy/PQzrubUYPVTuSqzrzbf4JSoWHL
	8OrBR7sLk4KEavOBU62o1FmYECw4UfciM2/r+qELh41tiL3PixjGo+y4BkJMFlgaG+A8LbI+v7T
	VNEBDPKCAwotmTAM58uAVTW91FthG78L9uMkecLifIb+4FrqLlAhv0ThUJzNxy1FbKNLgFjeknf
	cj+dqlYxtu25ddF8LpiWd4Ix7N/f1C1E6QgvRbH7Q4x02n2bU5c2xYk/pG+MoydG90nMIshzBk1
	OgMp3zvXjx40Y/PNQM7a4pPJobuXmv5EPgvIrA+6Cll0Q2h+C5yM5tK9cMn6emg/f4UtXNohdZX
	GzUDJVJJ8uwphMiU2U+mhMH4qNaC0ID/h5bA0JJWwbudeEQv/Nz+olEzYupp34yyIoV1F7Wx4Qe
	CBE27zHJZx2hqhUpk8UVoP0a7Kg116Ji+Q/w==
X-Received: by 2002:a17:903:1a26:b0:2a2:f2e5:dc92 with SMTP id d9443c01a7336-2a7175c30e9mr88946365ad.29.1768811314216;
        Mon, 19 Jan 2026 00:28:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 13/28] libdecor: upgrade 0.2.4 -> 0.2.5
Date: Mon, 19 Jan 2026 21:27:35 +1300
Message-ID: <20260119082752.4120991-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123607

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Changelog:
https://gitlab.freedesktop.org/libdecor/libdecor/-/compare/0.2.4...0.2.5?from_project_id=18349
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libdecor/{libdecor_0.2.4.bb => libdecor_0.2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.4.bb => libdecor_0.2.5.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
index 8264b5b7ab..0fae3274c6 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
     wayland-protocols \
 "
 
-SRCREV = "4d026d59edbf8e2e876c3f2c07c480f8840aa922"
+SRCREV = "149c6f0b05663aaa69fdf7f94be2483776d1a311"
 
 PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
 

