Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB56EE57E7
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81810.1767167695576592084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O175ebbR;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso85505595e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167694; x=1767772494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvo2gUj9Y2R+/zM+D9QD0rb1oboyK/GgLi+/CNb+xto=;
        b=O175ebbRGlo23Tj90S1kExC5egaCjivwunA+IJ6p13Zn4iuVGlcS180FvWKITwL4NF
         qZrB1EsJOTPROKf1HEqnxcUTxAu9VKx75k4JpJVKY4cwa9oYFws/wEeNsmdNyO9Ncvw6
         sQHRYGxYb/ED/9NDP2H2C+2Hg25Eby2T1aOP2DyeqpdUtr2XUiHhF7VsD1EKMfR5z1Ce
         s4rdbkhaqdBbnBY0cgkRzrC/DYB278wdlkkueDb5oPG3rCJ085Cq6pSTGxXssxcOXN1k
         Sn8AUCsfh6+Fta7F0elvjPnOQhv6G31oOdX/2tOmjYb+anzX7h/WSL0ft9pYbZ+Pdrpp
         yfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167694; x=1767772494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvo2gUj9Y2R+/zM+D9QD0rb1oboyK/GgLi+/CNb+xto=;
        b=WCB/b0wT5wGVxFosbKVb5+I7Vx3qQL4iMPTfHI7BX0XEeEM9s0U1Kh70J2yOr9yMAN
         STEjF0f2QDh2V6v/ZiDGxGPCUETUsy/YaHVkbqyW1MaQnFT0vvpJAzEyGEtkjd02Jbe0
         q9XD7WFlNH1zpxtAC/y8KB6ku7ijwuhcg7FiawIvqoECLjGE1PJ8UkWKj9RZhSK/H6/Q
         Sqsc2ZpTTzEPACBywUpOiFCzgpMINrBUYNf2ziuTNG/k6mrpGc486IgCtXXxxRGGeymU
         E+FfuCJI1G258eP4jTCjj8HI7zslH/KcouyFYrZcQBZknYBUCNiB2r5zdb0lXphK5l2r
         xBDw==
X-Gm-Message-State: AOJu0YyQ4+QH35gYx3j+gGeB+2g2rfD7eFyIegZqnJ37qeDxH7skRb4G
	5ZkP2eCJcJE62vJifhWtm2ThSLeERPkFZSbLqEe0HByn7VY//UXP8umjL9IAMg==
X-Gm-Gg: AY/fxX5AZw8BgwuCOxl1kYCTnIELaV9hEILec9hG4pqcY7P4Jz+eGVzBIHmW4z7Miim
	siUBr2K1D0bI4xJavLUxl6R6lcHFXSRvw9q+0Xb0hoaw1ekuf5MZm3aZpUqDe3Ed8i+xcZvntbl
	MBM/W7lD+ruKdChamM5EJJwh33fcESY742En725mD46ZkEOmVzjQNs9Dr4kDO/uqUgNRV6zWE7M
	qED7blhPJRiioEOD+Hq4ZATsN8DPFipAWQflVqLZzMQuW243jqlO+K3mqwNQ8Au+YvvG58Xw76h
	EaEpsV9MUzuv0c8O1e5gw3GlRGrumt10hOnPP3Cjw9oRulNOzILUnXHnsCJijnSq0cqOvr5JeOZ
	A02vhMnrG9bV6Kxy5tXAeEwj5mLqNDou+FtMOKwJHYruk7cb4ZvbB9jq2q5zhYXA5S/qoGd+ABF
	YF7pR1X/ks
X-Google-Smtp-Source: AGHT+IEYArt/i1rs2fclUNYwq5ul0+wUNp16Gtvo2iyd6ZHZMrGj3GYj2AzShaWK8d1WSucdJUk9Cw==
X-Received: by 2002:a05:600d:6405:20b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-47d216bab2fmr297025915e9.30.1767167693818;
        Tue, 30 Dec 2025 23:54:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 23/34] python3-oauthlib: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:25 +0100
Message-ID: <20251231075436.771395-23-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123063

The relevant CVEs are tracked using oathlib_project:oathlib CPE,
and the default python:oauthlib CPE doesn't match relevant entries.

Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'oauthlib';
CVE-2022-36087|oauthlib_project|oauthlib|3.1.1|>=|3.2.1|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index 80b87c1aa8..bdc1f0e7b4 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
 
+CVE_PRODUCT = "oauthlib"
+
 inherit pypi setuptools3
 
 # The following configs & dependencies are from setuptools extras_require.

