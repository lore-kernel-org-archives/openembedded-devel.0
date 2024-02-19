Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CACEC54787
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:17 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.1102.1708379294435114787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c15dd2a1fdso831359b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379293; x=1708984093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwFx6zzPRWGVnSDP5o0DO0ks6dXM8tlxmfdgaukXvps=;
        b=fJa2iracUzBjl/nJZD2am2bM0Zl7NWtx3TQCYVoLx5UdadblaqifiP8XhewxrAIP5f
         0ZAKTDaaTAJGXboB1oF+woOCGIPB6ZKUbBTWPB+eH6M9J9r3UVjhvPdoSLaqi0aGH5RT
         1O6iX4DbNGzWkhN6IAeDkgA7ND46s9vbuYYbX2rIdrkSmU01i3bUJiOnaZ6Zr5vAGbDp
         DC7M9gPuQ2Lr85YCL4iTevQ1Vv5rSv0UhHXbnWbs0IhiY41x9fE/e6jL0V5v5FcudAKS
         g4jBloaAG7GimFVffOPEa4Xqn9r/0wuEzNh0zKlOJujzsGmKZhzuIDR6zvJVjsVdduVn
         QZaA==
X-Gm-Message-State: AOJu0YwTBYREshONxFAK5I5R5URyQyIE2h7vkBGpmWqGZWbMKHNklgLM
	HP2lfw3pJA9QLsU40UMniAEgZZwWgzoGDdXUxGUTBiPcWr5rlK0ruk0vd3pqpXM=
X-Google-Smtp-Source: AGHT+IGyekvjEzCf9IRloW7ED7R/1/9046gmN5mt15SMHfvbzAdAwHZbWHQCnGQC3oTaLeDBXKQihQ==
X-Received: by 2002:a05:6808:180c:b0:3c1:5440:f2e1 with SMTP id bh12-20020a056808180c00b003c15440f2e1mr6599683oib.41.1708379292755;
        Mon, 19 Feb 2024 13:48:12 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/8] python3-trustme: add runtime dependency for tests and re-add to ptest
Date: Mon, 19 Feb 2024 21:47:54 +0000
Message-Id: <20240219214801.1514843-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108886

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc  | 2 +-
 meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 598548262..51fcdd2b2 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -50,6 +50,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-soupsieve \
     python3-sqlparse \
     python3-tomlkit \
+    python3-trustme \
     python3-ujson \
     python3-u-msgpack-python \
     python3-unidiff \
@@ -83,7 +84,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-pyzmq \
     python3-scrypt \
     python3-service-identity \
-    python3-trustme \
     python3-typeguard \
     python3-whoosh \
     python3-xlrd \
diff --git a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
index ac03bce2b..21161a0e0 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_1.1.0.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    python3-pyopenssl \
     python3-pyasn1-modules \
     python3-pytest \
     python3-service-identity \
-- 
2.34.1


