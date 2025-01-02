Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FB5E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 03:27:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.1902.1735788467772644129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 19:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWE4C+/c;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21675fd60feso196988915ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 19:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735788466; x=1736393266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efSoAMAwpZy2+9aWNs785ls8gKOLig9+7ChRctjB3ZU=;
        b=CWE4C+/cRVoKX+ocI8eEm6O+O+hjO0plpqTS3nPbOEHfRuC/HvufeEfwiMVLlEhhDk
         WBnWY951XGKiOWbnIKVBc/MxuY8dDe6zl35jtOGkzl2qpIXGbE5iBC4iZj8ZYEdPoX4n
         6CD9n10sG3RwO1uMRf3gSM2sv5SXsJzupPQNgX+skQWbivpT4J6zKNSQtrNoknER4/g3
         yWYAfv7w6lE3qQllCnV1W7JZPmi8LtDCphyG+eCrwvvXy7Qj7ivEF/zBK4yDdbEXsWUc
         Xp14D7mrWlnxLUCnBVlmijaxkfHZ+2URiQ1XGFiCpIjbjTgbaQoSYg8IvtR7Pv4UTDGX
         EAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735788466; x=1736393266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efSoAMAwpZy2+9aWNs785ls8gKOLig9+7ChRctjB3ZU=;
        b=GKQtkLuhSUSNFENgBek7OvENarNL6zo7qe9bK/Aq6PYBDWt2kjGEQQZuhdqXaphewY
         EjmZro9WdEosDyv061VMgWyrsY/ZCQEVzS/F3rwSSD4HaEfIzwUDu29CTmpKwzahaLfQ
         7N+XHfuCKXpMIWQfW7KVxd2oavmW3d1IkhnNN59Xi0aS1TMfhDGdNWMVMNcL4o0kfkvz
         /ra3SqEvBBdtJhh8n5ZZATPsAYJQndS8FovO751H/5XxlhdWUvyP16NLqZgv0hWnG9FS
         4VabNejXeUYXzIh7RE7pyDFHezv+veAc0EAMRjacMPALyz69Vu/2SsRKLdLGfaXMROCA
         VToQ==
X-Gm-Message-State: AOJu0YxzH54LFBdgG7f+Sii1lC/OO8Jy/2/XjOuIEOsmMRxOe2fYKzkl
	0xcm2ekcEKzFbT2lHfLmcUwvXYJOwWt2fkSMsC6ipQAE4toR/+ukT07ZqA==
X-Gm-Gg: ASbGncs2jjFcbsoBdxnm6K29ikyrJK3NwcHctLE0ch5lyRt18Y+jLoq9RBrsFK2PfOy
	jOzonXMO0h1EbaZJ64wuiLAm6ABLFidgYTwGmsU7zr2dNJP8W27yyThcstK54nCUnrjzDIeJAdR
	Vvo88qTm7rVv3zZxtKuO7/4UFWR+8YuFcfB8uN59sM8ZVWYRYmLsu/tSHxEVqFAXG+4QnuI2E06
	cczNIPEq4CA7ukhLo11MCi6ZXIsgdDxSDzIxHqLxta4J6GNMknomeUtU/Q=
X-Google-Smtp-Source: AGHT+IGyQ9BExte/DXAt0V6iOhZGg7hxKSLarFA5Jh1+GVL0fgPOCmx7EzSSXUJ7/AwgV2YmliVcWA==
X-Received: by 2002:a05:6a00:f96:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-72abdedda5fmr65638283b3a.26.1735788466581;
        Wed, 01 Jan 2025 19:27:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4714])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba8esm24037199b3a.104.2025.01.01.19.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 19:27:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-propcache: Add missing rdeps for ptests to run/pass
Date: Wed,  1 Jan 2025 19:27:44 -0800
Message-ID: <20250102032744.2039692-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 03:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114615

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
index 9d9e5731df..0ea24e8bc3 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
@@ -17,7 +17,10 @@ DEPENDS += " \
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
+	python3-pytest-codspeed \
 	python3-pytest-xdist \
+	python3-rich \
+	python3-statistics \
 	python3-unittest-automake-output \
 "
 

