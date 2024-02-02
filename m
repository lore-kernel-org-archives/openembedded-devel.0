Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B77C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 17:03:48 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.383.1706893427431313519
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 09:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-599f5e71d85so1456344eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 09:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706893426; x=1707498226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqNnPRY7frJJ7nw0Ve026UndIMttzM1G8YaNSH6ZQj8=;
        b=NR82zx34UazuzcxR6n74JfTt8EjckuRPbU/FjXfGuorUWH3PFxfCZpfKugp6vJ0PDQ
         TTTydbojPIpR5FF+WleTtgBigFMDm58/z5oXzfbHKTOk8a4LDc0UY20QX8Q0/6+O1oPj
         B4UMDeiuV/nvRM7afKoeqNKBIKy/di3qi1Z7GvN64z8UxVWXVBxyx/yg9Q1aQ+gZ1b+/
         JHlleCtJPAYnjCXmIybWBLFQticMPul6+q3NpAy8Q4hiaHJqyLwzCubCXQH+pxJKsVVJ
         065yNYW60Xlt3DpE4GGCPeLFD1uSJ3Y8lYd6iiZOGD9smxgaPnc0YpN1noP59HqMmXA1
         Jj5A==
X-Gm-Message-State: AOJu0Yx484RdyJgMokyo0U2AdEpZyHEJ3tzhTw60XkaFbXxudMgOc38D
	y1ldY3F2iM2p4urpr1RsX4JO3Bm7A1Dk2bhbShHz4/O2WFg+424d2qOSMZzJleSYVQ==
X-Google-Smtp-Source: AGHT+IHiNbkjoedm+QJVzduxJa2s7X96J1LHH5KJtyFcMYcr/a2x9p0XCcFJ7h9XyLd80yGWUtlgbQ==
X-Received: by 2002:a05:6820:1c8e:b0:599:49ec:6d15 with SMTP id ct14-20020a0568201c8e00b0059949ec6d15mr11937488oob.1.1706893425572;
        Fri, 02 Feb 2024 09:03:45 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id 46-20020a4adb6e000000b005990bd1e1dcsm452796oot.17.2024.02.02.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:03:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-luma-core: update to version 2.4.2
Date: Fri,  2 Feb 2024 17:02:58 +0000
Message-Id: <20240202170258.1447424-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 17:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108529

Update license checksum for 2024 and verify MIT license still applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-luma-core_2.4.1.bb => python3-luma-core_2.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.4.1.bb => python3-luma-core_2.4.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
index a50c9656a..c2a18c0fd 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
@@ -2,11 +2,11 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b56ff1acb787606580264498947079fc"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2083293a38df91b8d470d3fe30069262"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "175663a4b0afde86ed5359f265fbb2ed978132cac4d9b42a30a3e0f0faf3f0d7"
+SRC_URI[sha256sum] = "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be4e6dbd"
 
 PYPI_PACKAGE = "luma.core"
 
-- 
2.34.1


