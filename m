Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BBAC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 05:51:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9554.1706248312899778732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jan 2024 21:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vn8vZKD1;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so5614966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706248311; x=1706853111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGXhy0mldMH2KXAPh4bitvOBiDOSJTje8zWhRAStPuE=;
        b=Vn8vZKD14vtGd8+wmZtgwH5XqS4M/LWQ2RarYfSvZKHakwhUDL4/ACsqBS30nR9Jkz
         zBmuBFG/kwLjdpaO49T08SRLY2QMkwuvoG5tyFq9AvNv2/xkXEa/vbrWuTl+cIwev5ul
         5Fda5jranKNPr+0SBaEBBMMeTRQ5bp3GjJvtFIwCws5IZsP3NK3cQEsGN/KX/Osak0mZ
         2y2NO9k5ws4oK6oS1piQ4ZEyiMYPBJskJRfUm5mH4zhS1qoPxzWbu1hrThl5tGpy7/ZN
         zyQjzakBaG9lmxqqZesrQGjFjU4Yq3jPAWeSjk5ASiIZhqWL4AATgaWvSxX67ewC/Lfy
         ONTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706248311; x=1706853111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGXhy0mldMH2KXAPh4bitvOBiDOSJTje8zWhRAStPuE=;
        b=kyL0zISoDZdzcOMMW2dJhLOod7AnyV2leMFa/CPzkxk1HH9tnqKDXF56vSuDyAgWH7
         +o6+g2B5RoicN0Gu80b9FCTwd08mdyzD7lK74cLPfajBq9ypsCAjM4zdR2b5s+nUimxL
         OY7N4EM+ZUU7tifWd7Ot26w+KfmBtvv1PCf0HAchymhURkK8knQX5rvvUx9BXZnniK+W
         DX4KnUF2ktBCfzcwFX4bx55MoaSPMqyb88/MVuxCwJs7anFazZyWTc6QOcYxjMQBf3Dq
         8Tr7yKOT4HHX5YXw01PlCazT+Y9OVAEWWjzF48wQIil5jNM5cLvmga3XXSLw29NP3ATq
         PClQ==
X-Gm-Message-State: AOJu0YxF4VMKQdUl/S1NYzYuVVT/HUtEUnWEOJNP9KgJUBZBncmoYZHe
	BT/At6kfp3dN1v4hMf9906l5/cAMtynQ+1XnzP5vdVMGiblCD3NnqjDlguLeTVU=
X-Google-Smtp-Source: AGHT+IHIqpJ2QtC2y1hXM2SsU5sKM4RiJ3WeydVqOMrRxQqKTv41/SoOCDXM/cyurXop4B3TY2fdmw==
X-Received: by 2002:a17:906:3fc4:b0:a33:8576:a166 with SMTP id k4-20020a1709063fc400b00a338576a166mr284422ejj.1.1706248310571;
        Thu, 25 Jan 2024 21:51:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906831700b00a3189430111sm238438ejx.214.2024.01.25.21.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 21:51:50 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-netaddr: upgrade 0.10.0 -> 0.10.1
Date: Fri, 26 Jan 2024 08:51:47 +0300
Message-Id: <20240126055147.8810-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108457

Changelog:

Fixed:

    Get rid of some warnings

Deprecated:

    Deprecate the flag shorthands: N, P and Z. Use NOHOST, INET_PTON and ZEROFILL instead.

    Deprecate importing objects from netaddr subpackages. Only importing things from the top-level netaddr namespace is supported, everything else is considered private.

    This has already been the case but we can use a reminder.

    Deprecate permissive-by-default IPv4 parsing in valid_ipv4(). The inet_pton() semantics (with leading zeros always disallowed) will become the default. Use INET_ATON and/or ZEROFILL flags if you need the legacy behavior.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-netaddr_0.10.0.bb => python3-netaddr_0.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-netaddr_0.10.0.bb => python3-netaddr_0.10.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
index 15350e942..ce16cc178 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "A network address manipulation library for Python."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
 
-SRC_URI[sha256sum] = "4c30c54adf4ea4318b3c055ea3d8c7f6554a50aa2cd8aea4605a23caa0b0229e"
+SRC_URI[sha256sum] = "f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf"
 
 inherit pypi setuptools3
 
-- 
2.25.1


