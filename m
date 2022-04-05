Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC963C4167D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.4497.1649155290916434981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XFKHxoIg;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id f18so9319944edc.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l/1NyAsjw4r5T6IkjBiVIrhQegQWwDgEtczfazjar2E=;
        b=XFKHxoIgcniHbPatHE1RUlO+eVSGDTfoIu0qUrMeBkaQKKuKzAQxnvZKcruhZelu5P
         pZyLbLf/1hqsABD4cVDK/i3a2F+gmJ+F4IwNcwxx2qa1NOUZ8pYPnE6acAARXVKsYVht
         nvzXHJXT9vM2ovu25hX+a093eRS+FMaGGQ6MQJw+h7qIP5LijmXI511irFNZzgMRcNwo
         q15ku/qvJdvsaxgp9p3iFkEjnewC9Z7tJMxjG8TEpaXhSNIrszp/X8lgwUSKac8+9PjI
         6CAoUYrvUbOR10vCE9y3qp4J0YKi6E7C92wS1XVZk87uIhkDFnJiCAa+F5yj8qtofB5h
         IWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/1NyAsjw4r5T6IkjBiVIrhQegQWwDgEtczfazjar2E=;
        b=T4vAEFoFGEwAefp5RlYZnbHHMjIe2fLfmrnZoN9ID76ggpMYAmVQRKFuFX9JtzxcW6
         0mGoAiQMoAkyk6jPXI1ivS+90iTHYZZasTT3jL6Q4BUg+6r6oIT3JMEg/w54qmNBfjN8
         voU4G/QHU/h6iyKoP3kTJheGJOvlUW+eufHGV7PZ2tRWLb+P7DPTXbHzsaYcdP0FKvUf
         WFq/u4F3pyvpWuqyNDHE3wazqYe5brAICuiHWoF9G09w+xEpGl5hTHkCoDHBzXSzmh7m
         JZfvRFMu6hZVXx4LJ3oZGz5ew4IfWWueRPXNbr/aROZ0UNlxKEjuQ19mfZno9uxDWMFE
         NCPw==
X-Gm-Message-State: AOAM531P5IQ9TE1UgfmYiBAYnAq51rI3qHVfGqmKqCWbREk4OKiB9opU
	Q+ghTpff3AKmdy8qQvBgnXXhEcZRAodXGw==
X-Google-Smtp-Source: 
 ABdhPJzqMvG+1G4LLh8fdy0DHygt7mDEmZgGnf6uGcsq7nlpohMOzYRxVgv7DDXV3iGHogbKY6Uh4A==
X-Received: by 2002:a05:6402:4407:b0:419:3859:697e with SMTP id
 y7-20020a056402440700b004193859697emr2842803eda.400.1649155289341;
        Tue, 05 Apr 2022 03:41:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 p24-20020a056402045800b0041614c8f79asm6364853edw.88.2022.04.05.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:41:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][PATCH 3/3] htop: switch branch from master to
 main
Date: Tue,  5 Apr 2022 12:41:23 +0200
Message-Id: <20220405104123.1371786-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
References: <20220405104123.1371786-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96427

* the branch was renamed in upstream
* it's already resolved in meta-oe/kirkstone since this commit:
  commit cef2d1429bedbc256c5fac7a1a336842865dc2d3
  Author: Robert Joslyn <robert.joslyn@redrectangle.org>
  Date:   Sat Jan 15 06:19:04 2022 -0800
  Subject: htop: Update to 3.1.2

    Upstream renamed the branch to "main", update SRC_URI.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/htop/htop_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/htop/htop_3.0.5.bb b/meta-oe/recipes-support/htop/htop_3.0.5.bb
index e574fbdbb1..5328aff7c0 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.5.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4099d367cd5e59b6d4fc1ee33accb891"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "git://github.com/htop-dev/htop.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
            "
 SRCREV = "ce6d60e7def146c13d0b8bca4642e7401a0a8995"
-- 
2.35.1


