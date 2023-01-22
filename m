Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C626DC27C76
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.20002.1674401687565084367
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RRXB7t4o;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-12c8312131fso11537366fac.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+25IteYx/sSJTCN7z7kHHnNrHRl+8Ib5prqZS/ecqI=;
        b=RRXB7t4o/sObqpTSd8StmjuO3nr37B7WeqrWeFAyZB+lcs1o+jB8iVLqVsZYlaPY3J
         YLB5B/AZtm6F194VrXnUz2ZpSDhivAfme3BR2dyNPHizxZvAv+rjhsfA1E5c3m4xFzxx
         +s5GUtiq4jcmdiyMBQt5nZ/w3xK5DdY9sxWLHFLhffhJ4eQ006dWluyPTw26cI9mftW4
         cLxK0S10KPkfLXlnddf/X5KeY2qfMFYqAbFbEpjebOlup4afcZMO/ZDcGDUoQmmJJdDS
         tVICxWJNC6qUNAZpG+0RGpoB3+oRXKMFGtY4/Om3aF39s3UhpT7qUe2iBhtBpz3Fhqc5
         rcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+25IteYx/sSJTCN7z7kHHnNrHRl+8Ib5prqZS/ecqI=;
        b=kiiYagjY5rAPRNTOtOG8wkCZqmMo0xLhepEZ+ylJvEsMMsKT22tZPgDJlHJa/B0+H9
         elFZk4J+WhWA8Y/v31R8/yORWQfFJloYHcr4N0poR9tjQ2b+KYvThOHyqGStzsGBIT++
         FZcSyrs2Hi4l/PHhj+sKyZq2vRueDr1h1xCDVv3g+qBnrLdQjPNq5Mj+tyIRvnQoUeTG
         VWid0GKVLy1ZU8IyZC8Noxrtf6hDY6d+AKY/JMo+merDdYKyexB/NmsUiIIFU2d9OFY9
         6+0Fx91BHQpnjClJXsBM8aT0XXZck7GJyCEQcqz4E52JGcNHbuZTxdn4o63wGbz/jjjT
         yFMA==
X-Gm-Message-State: AFqh2kpik93ZZ8E5d4/X2v5jGQKIGV0FJf2XJELz9ZisdGMl8zjmCu2i
	MPli9qQaqW8N+F+nEvyht4icnss3jJI=
X-Google-Smtp-Source: AMrXdXtdjotBLJ9j+0sfUFqNrISkew35Jl3InrmCfGmfj1aiMnC1Zh1eM7l1wUa0ak1u9LEfTOmmCg==
X-Received: by 2002:a05:6870:56ac:b0:15e:d2ac:31a0 with SMTP id p44-20020a05687056ac00b0015ed2ac31a0mr12617480oao.18.1674401686562;
        Sun, 22 Jan 2023 07:34:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 4/6] openwsman: upgrade 2.7.1 -> 2.7.2
Date: Sun, 22 Jan 2023 10:34:40 -0500
Message-Id: <20230122153442.213094-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122153442.213094-1-akuster808@gmail.com>
References: <20230122153442.213094-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Security
  - call setgroups before setuid or setgid
  - harden systemd service (https://en.opensuse.org/openSUSE:Security_Features#Systemd_hardening_effort)
- Bugfixes
  - wsman-win-client-transport: initialize certificate pointer
  - iniparser: fix buffer size
  - wsman-win-client-transport: plug leak in error path
  - memory.c: fix memory cleanup
  - Improve handling of HTTP 401 Unauthorized
  - Fix serialization tests
  - Fix Ruby bindings warnings
  - Fix Ruby plugin loading test
  - Fix rpm packaging
  - Allow to run tests from 'build' directory
  - Add Python XML test
  - Enable CUNIT tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bdbb3eeb2bfaf2a03dd6ab2a2024775ab28306a7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 7fc5d4218f..84a00df8e7 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "6cdf3bee50388d8e5f70850322a4df57fd685a5e"
+SRCREV = "0120e256faa255d997d9a49d5207662c0b73d430"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.25.1


